#!/usr/bin/env python3
"""Navigation route inventory and ratchet check.

Scans CleverFerret/src/main for:
  * route registrations:  composable("...") / composable(route = MediaRoutes.X)
  * navigation targets:   navigate("...") / navigate(MediaRoutes.X / helper(...))

and matches every navigation target against the registered routes. Registrations
declared in graphs/Legacy*.kt are flagged as legacy so the legacy route
migration (see docs/navigation/ROUTE_INVENTORY.md) can be tracked.

Usage:
  scripts/ci/check_nav_routes.py            # check against the baseline (CI)
  scripts/ci/check_nav_routes.py --write    # regenerate inventory doc
  scripts/ci/check_nav_routes.py --update-baseline

Check rules (exit 1 on failure):
  * every legacy route needs an entry in scripts/ci/legacy_route_map.json
    (replacement, kind, note), and entries for routes that are gone must go;
  * a navigate() target that matches no registered route and is not in the
    baseline is a new broken navigation target;
  * a baseline entry that no longer reproduces must be removed, so the
    baseline can only shrink.
Navigation targets that reach only legacy registrations fail the check: all call
sites were migrated off the legacy routes, so none may be added back.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SRC = ROOT / "CleverFerret/src/main"
ROUTES_FILE = SRC / "java/com/universalmedialibrary/ui/media/navigation/MediaRoutes.kt"
BASELINE = ROOT / "scripts/ci/nav_route_baseline.txt"
INVENTORY = ROOT / "docs/navigation/ROUTE_INVENTORY.md"
ROUTE_MAP = ROOT / "scripts/ci/legacy_route_map.json"

STRING = r'"((?:[^"\\]|\\.)*)"'


def rel(p: Path) -> str:
    return p.relative_to(ROOT).as_posix()


def short(path: str) -> str:
    return path.split("com/universalmedialibrary/")[-1]


def balanced(text: str, start: int, open_ch: str, close_ch: str) -> int:
    """Index just past the bracket matching text[start] == open_ch, or -1."""
    depth = 0
    for i in range(start, len(text)):
        if text[i] == open_ch:
            depth += 1
        elif text[i] == close_ch:
            depth -= 1
            if depth == 0:
                return i + 1
    return -1


# --------------------------------------------------------------------------
# MediaRoutes constants / helpers
# --------------------------------------------------------------------------
def to_pattern(template: str, consts: dict, helpers: dict) -> str:
    """Resolve a Kotlin string template into a route pattern with {} holes."""
    out, i = [], 0
    while i < len(template):
        if template.startswith("${", i):
            end = balanced(template, i + 1, "{", "}")
            inner = template[i + 2 : end - 1] if end != -1 else ""
            i = end if end != -1 else len(template)
            m = re.match(r"\s*MediaRoutes\.(\w+)\s*(\(|$)", inner)
            if m and m.group(2) == "" and m.group(1) in consts:
                out.append(consts[m.group(1)])
            elif m and m.group(2) == "(" and m.group(1) in helpers:
                out.append(helpers[m.group(1)])
            else:
                out.append("{}")
        elif template[i] == "$" and i + 1 < len(template) and (
            template[i + 1].isalpha() or template[i + 1] == "_"
        ):
            j = i + 1
            while j < len(template) and (template[j].isalnum() or template[j] == "_"):
                j += 1
            out.append("{}")
            i = j
        else:
            out.append(template[i])
            i += 1
    return "".join(out)


def load_media_routes() -> tuple[dict, dict]:
    text = ROUTES_FILE.read_text(encoding="utf8")
    consts = {
        m.group(1): m.group(2)
        for m in re.finditer(r"const\s+val\s+(\w+)\s*=\s*" + STRING, text)
    }
    helpers: dict[str, str] = {}
    for m in re.finditer(r"fun\s+(\w+)\(([^)]*)\)\s*=\s*" + STRING, text):
        helpers[m.group(1)] = to_pattern(m.group(3), consts, {})
    return consts, helpers


# --------------------------------------------------------------------------
# scanning
# --------------------------------------------------------------------------
def first_arg(text: str, open_idx: int) -> str:
    """Text of the first argument of the call whose '(' is at open_idx."""
    end = balanced(text, open_idx, "(", ")")
    body = text[open_idx + 1 : (end - 1 if end != -1 else len(text))]
    depth, cur = 0, []
    for ch in body:
        if ch in "([{":
            depth += 1
        elif ch in ")]}":
            depth -= 1
        if ch == "," and depth == 0:
            break
        cur.append(ch)
    arg = "".join(cur).strip()
    return re.sub(r"^route\s*=\s*", "", arg)


def resolve_arg(arg: str, consts: dict, helpers: dict) -> str | None:
    m = re.fullmatch(STRING, arg, re.S)
    if m:
        return to_pattern(m.group(1), consts, helpers)
    m = re.fullmatch(r"MediaRoutes\.(\w+)", arg)
    if m and m.group(1) in consts:
        return consts[m.group(1)]
    m = re.match(r"MediaRoutes\.(\w+)\(", arg)
    if m and m.group(1) in helpers:
        return helpers[m.group(1)]
    return None  # dynamic (variable, item.route, ...) - cannot be checked


def scan(consts: dict, helpers: dict):
    registrations, calls = [], []
    for path in sorted(SRC.rglob("*.kt")):
        text = path.read_text(encoding="utf8", errors="ignore")
        legacy = path.name.startswith("Legacy")
        for m in re.finditer(r"\bcomposable\(", text):
            pattern = resolve_arg(first_arg(text, m.end() - 1), consts, helpers)
            if pattern:
                line = text.count("\n", 0, m.start()) + 1
                registrations.append((pattern, rel(path), line, legacy))
        for m in re.finditer(r"\bnavigate\(", text):
            if text[max(0, m.start() - 4) : m.start()] == "fun ":
                continue
            pattern = resolve_arg(first_arg(text, m.end() - 1), consts, helpers)
            if pattern and not pattern.startswith("{}"):
                line = text.count("\n", 0, m.start()) + 1
                calls.append((pattern, rel(path), line))
    return registrations, calls


def segments(pattern: str) -> list[str]:
    return pattern.split("?")[0].strip("/").split("/")


def matches(call: str, reg: str) -> bool:
    c, r = segments(call), segments(reg)
    if len(c) != len(r):
        return False
    return all(
        a == b or a.startswith("{") or b.startswith("{") or "{" in a or "{" in b
        for a, b in zip(c, r)
    )


def normalize(pattern: str) -> str:
    return re.sub(r"\{[^}]*\}", "{}", pattern)


def load_route_map() -> dict:
    if not ROUTE_MAP.exists():
        return {}
    return json.loads(ROUTE_MAP.read_text(encoding="utf8"))


def shadowed(registrations) -> list[tuple[str, str]]:
    """Legacy registrations whose path equals a live registration's path."""
    live = {normalize(r[0]): r[0] for r in registrations if not r[3]}
    return [(r[0], live[normalize(r[0])]) for r in registrations if r[3] and normalize(r[0]) in live]


def classify(calls, registrations):
    live = [r for r in registrations if not r[3]]
    legacy = [r for r in registrations if r[3]]
    rows = []
    for pattern, file, line in calls:
        if any(matches(pattern, r[0]) for r in live):
            status = "ok"
        elif any(matches(pattern, r[0]) for r in legacy):
            status = "legacy"
        else:
            status = "unmatched"
        rows.append((pattern, file, line, status))
    return rows


# --------------------------------------------------------------------------
# outputs
# --------------------------------------------------------------------------
def baseline_key(pattern: str, file: str) -> str:
    return f"{pattern}\t{short(file)}"


def write_inventory(registrations, rows) -> None:
    by_route = defaultdict(list)
    for pattern, file, line, status in rows:
        by_route[pattern].append((file, line, status))
    lines = [
        "# Navigation Route Inventory",
        "",
        "Generated by `scripts/ci/check_nav_routes.py --write`; do not edit by hand.",
        "",
        "Registered routes are collected from `composable(...)` calls. Legacy routes",
        "are those registered in `graphs/Legacy*.kt` and are the target of the",
        "legacy route migration. Call sites are `navigate(...)` calls whose target",
        "could be resolved statically (dynamic targets such as `item.route` are not listed).",
        "",
        "## Summary",
        "",
    ]
    live = [r for r in registrations if not r[3]]
    legacy = [r for r in registrations if r[3]]
    counts = defaultdict(int)
    for _, _, _, status in rows:
        counts[status] += 1
    lines += [
        f"- Registered routes: {len(live)} current, {len(legacy)} legacy",
        f"- Resolvable `navigate` calls: {len(rows)} "
        f"({counts['ok']} reach a current route, {counts['legacy']} reach only a legacy route, "
        f"{counts['unmatched']} match no registered route)",
        "",
        "## Legacy routes",
        "",
        "| Route | Replacement | Kind | Registered in | Call sites reaching only legacy |",
        "| --- | --- | --- | --- | --- |",
    ]
    route_map = load_route_map()
    for pattern, file, line, _ in sorted(legacy):
        users = [
            f"`{short(f)}:{ln}`"
            for p, f, ln, s in rows
            if s == "legacy" and matches(p, pattern)
        ]
        entry = route_map.get(pattern, {})
        repl = entry.get("replacement", "_unmapped_")
        lines.append(
            f"| `{pattern}` | `{repl}` | {entry.get('kind', '')} | `{short(file)}:{line}` "
            f"| {', '.join(users) if users else '_none_'} |"
        )
    lines += [
        "",
        "Kinds: `redirect` (already forwards to the live route), `duplicate` (live route hosts the",
        "same destination), `remap` (live route exists but arguments differ), `new-route` (live",
        "route added for this migration), `unclear` (needs a decision; see the note in",
        "`scripts/ci/legacy_route_map.json`).",
        "",
        "### Notes",
        "",
    ]
    for pattern in sorted(route_map):
        note = route_map[pattern].get("note")
        if note:
            lines.append(f"- `{pattern}`: {note}")
    lines += [
        "",
        "### Legacy routes sharing a path with a live route",
        "",
        "Both are registered in the same `NavHost`, and the legacy graphs are added last in",
        "`MediaAppNavigation`, so the legacy destination is the one that is reachable. Removing the",
        "legacy registration changes which screen opens.",
        "",
    ]
    same = shadowed(registrations)
    lines += [f"- `{l}` shadows `{v}`" for l, v in sorted(same)] or ["- _none_"]
    lines += [
        "",
        "## Navigation targets that match no registered route",
        "",
        "These would throw `IllegalArgumentException` at runtime. They are tracked in",
        "`scripts/ci/nav_route_baseline.txt`; fix them and remove the entries.",
        "",
        "| Target | Call site |",
        "| --- | --- |",
    ]
    bad = [r for r in rows if r[3] == "unmatched"]
    for pattern, file, line, _ in sorted(bad):
        lines.append(f"| `{pattern}` | `{short(file)}:{line}` |")
    if not bad:
        lines.append("| _none_ | |")
    lines += [
        "",
        "## Current routes",
        "",
        "| Route | Registered in |",
        "| --- | --- |",
    ]
    for pattern, file, line, _ in sorted(live):
        lines.append(f"| `{pattern}` | `{short(file)}:{line}` |")
    INVENTORY.parent.mkdir(parents=True, exist_ok=True)
    INVENTORY.write_text("\n".join(lines) + "\n", encoding="utf8")


def read_baseline() -> set[str]:
    if not BASELINE.exists():
        return set()
    return {
        l.rstrip("\n")
        for l in BASELINE.read_text(encoding="utf8").splitlines()
        if l.strip() and not l.startswith("#")
    }


def write_baseline(keys: set[str]) -> None:
    header = (
        "# navigate() targets known to match no registered route (pattern<TAB>file).\n"
        "# Generated by scripts/ci/check_nav_routes.py --update-baseline.\n"
        "# Entries may only be removed; fix the call site, then delete the line.\n"
    )
    BASELINE.write_text(header + "\n".join(sorted(keys)) + "\n", encoding="utf8")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--write", action="store_true", help="regenerate the inventory doc")
    ap.add_argument("--update-baseline", action="store_true", help="rewrite the baseline file")
    args = ap.parse_args()

    consts, helpers = load_media_routes()
    registrations, calls = scan(consts, helpers)
    rows = classify(calls, registrations)
    unmatched = {baseline_key(p, f) for p, f, _, s in rows if s == "unmatched"}

    if args.update_baseline:
        write_baseline(unmatched)
    if args.write or args.update_baseline:
        write_inventory(registrations, rows)
        print(f"wrote {rel(INVENTORY)}" + (f" and {rel(BASELINE)}" if args.update_baseline else ""))
        return 0

    baseline = read_baseline()
    new = sorted(unmatched - baseline)
    stale = sorted(baseline - unmatched)
    route_map = load_route_map()
    legacy_patterns = {r[0] for r in registrations if r[3]}
    unmapped = sorted(legacy_patterns - set(route_map))
    gone = sorted(set(route_map) - legacy_patterns)
    legacy_calls = sum(1 for r in rows if r[3] == "legacy")
    print(
        f"{len(registrations)} registered routes, {len(rows)} resolvable navigate() calls, "
        f"{legacy_calls} reach only legacy routes, {len(unmatched)} match no route "
        f"({len(baseline)} baselined)"
    )
    failed = False
    if new:
        failed = True
        print("\nERROR: navigate() targets that match no registered route:")
        for k in new:
            print("  " + k.replace("\t", "   in "))
    if stale:
        failed = True
        print("\nERROR: baseline entries that no longer reproduce (remove them from "
              f"{rel(BASELINE)} or run --update-baseline):")
        for k in stale:
            print("  " + k.replace("\t", "   in "))
    if legacy_calls:
        failed = True
        print("\nERROR: navigate() targets that reach only a legacy route (use the replacement in "
              f"{rel(ROUTE_MAP)}):")
        for p, f, ln, st in rows:
            if st == "legacy":
                print(f"  {p}   in {short(f)}:{ln}")
    if unmapped:
        failed = True
        print(f"\nERROR: legacy routes missing from {rel(ROUTE_MAP)}:")
        for k in unmapped:
            print("  " + k)
    if gone:
        failed = True
        print(f"\nERROR: {rel(ROUTE_MAP)} lists routes that are no longer registered as legacy:")
        for k in gone:
            print("  " + k)
    if INVENTORY.exists():
        before = INVENTORY.read_text(encoding="utf8")
        write_inventory(registrations, rows)
        if INVENTORY.read_text(encoding="utf8") != before:
            INVENTORY.write_text(before, encoding="utf8")
            failed = True
            print(f"\nERROR: {rel(INVENTORY)} is out of date; run scripts/ci/check_nav_routes.py --write")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
