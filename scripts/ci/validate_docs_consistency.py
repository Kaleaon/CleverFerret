#!/usr/bin/env python3
"""Validate markdown links and canonical status doc consistency."""

from __future__ import annotations

import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable
from urllib.parse import unquote, urlparse

REPO_ROOT = Path(__file__).resolve().parents[2]

CANONICAL_STATUS_DOCS = [
    Path("docs/FEATURES_STATUS.md"),
    Path("docs/REPOSITORY_STATUS_REPORT.md"),
    Path("CleverFerretV2/docs/v2/feature-matrix.md"),
]

STATUS_MAP = {
    "ready": "ready",
    "enabled": "ready",
    "full support": "ready",
    "fully supported": "ready",
    "partial": "partial",
    "partially": "partial",
    "test": "partial",
    "in progress": "partial",
    "integrate": "partial",
    "stub": "planned",
    "planned": "planned",
    "not implemented": "planned",
    "needs additional work": "planned",
    "beta": "partial",
}

EMOJI_STATUS_MAP = {
    "✅": "ready",
    "⚠️": "partial",
    "🔄": "partial",
    "❌": "planned",
    "🟡": "partial",
}

CAPABILITY_ALIASES = {
    "epub": "epub reading",
    "pdf": "pdf reading",
    "comic cbz cbr cbt cb7": "comic reading",
    "music playback": "audiobook music playback",
    "audiobook playback": "audiobook music playback",
    "podcast management": "podcast playback management",
    "podcast support": "podcast playback management",
    "internet radio": "radio",
    "media library": "library management search scanning",
    "widgets media reading stats": "widgets",
    "mobi azw azw3": "mobi azw azw3 integration",
    "djvu": "djvu support completion",
    "opds catalog": "opds wiring",
    "cloud sync": "cloud sync providers",
    "plex integration": "plex auth sync hardening",
    "plex auth": "plex auth sync hardening",
    "google drive sync": "cloud sync providers",
    "dropbox sync": "cloud sync providers",
}

HEADING_RE = re.compile(r"^(#{1,6})\s+(.+?)\s*$")
INLINE_LINK_RE = re.compile(r"\[[^\]]+\]\(([^)\s]+)(?:\s+\"[^\"]*\")?\)")
AUTOLINK_RE = re.compile(r"<((?:\./|\.\./|/)[^>]+)>")
TABLE_ROW_RE = re.compile(r"^\|(.+?)\|\s*$")


@dataclass(frozen=True)
class StatusEntry:
    doc: Path
    raw_capability: str
    capability: str
    status: str
    line: int


def main() -> int:
    markdown_files = [REPO_ROOT / p for p in [Path("README.md"), *CANONICAL_STATUS_DOCS]]

    link_errors = validate_links(markdown_files)
    status_errors = validate_status_docs()

    if link_errors:
        print("Broken local markdown links found:")
        for error in link_errors:
            print(f"  - {error}")

    if status_errors:
        print("\nCanonical status divergence found:")
        for error in status_errors:
            print(f"  - {error}")

    if link_errors or status_errors:
        return 1

    print("Markdown link and canonical status checks passed.")
    return 0


def validate_links(markdown_files: Iterable[Path]) -> list[str]:
    anchors_cache: dict[Path, set[str]] = {}
    errors: list[str] = []

    for file_path in markdown_files:
        rel = file_path.relative_to(REPO_ROOT)
        text = file_path.read_text(encoding="utf-8")

        for line_no, line in enumerate(text.splitlines(), start=1):
            links = [*INLINE_LINK_RE.findall(line), *AUTOLINK_RE.findall(line)]
            for link in links:
                if link.startswith(("http://", "https://", "mailto:", "tel:")):
                    continue
                if link.startswith("#"):
                    anchors = anchors_cache.setdefault(file_path, extract_anchors(file_path))
                    anchor = normalize_anchor(link[1:])
                    if anchor not in anchors:
                        errors.append(f"{rel}:{line_no} -> missing anchor '#{link[1:]}'")
                    continue

                parsed = urlparse(link)
                if parsed.scheme or parsed.netloc:
                    continue
                if link.startswith("/"):
                    # Website-root links are not repo-local paths in this check.
                    continue

                candidate, fragment = split_target_and_fragment(link)
                target = (file_path.parent / candidate).resolve() if candidate else file_path
                if not target.exists():
                    errors.append(f"{rel}:{line_no} -> missing file '{link}'")
                    continue

                if fragment:
                    anchors = anchors_cache.setdefault(target, extract_anchors(target))
                    anchor = normalize_anchor(fragment)
                    if anchor not in anchors:
                        errors.append(
                            f"{rel}:{line_no} -> missing anchor '#{fragment}' in '{target.relative_to(REPO_ROOT)}'"
                        )

    return errors


def extract_anchors(path: Path) -> set[str]:
    text = path.read_text(encoding="utf-8")
    anchors: set[str] = set()
    for line in text.splitlines():
        m = HEADING_RE.match(line.strip())
        if not m:
            continue
        heading = m.group(2)
        heading = re.sub(r"\[([^\]]+)\]\([^)]+\)", r"\1", heading)
        heading = re.sub(r"[`*_~]", "", heading)
        anchors.add(normalize_anchor(heading))
    return anchors


def normalize_anchor(value: str) -> str:
    lowered = value.strip().lower()
    lowered = unquote(lowered)
    lowered = re.sub(r"[^a-z0-9\-\s]", "", lowered)
    lowered = re.sub(r"\s+", "-", lowered)
    lowered = re.sub(r"-+", "-", lowered).strip("-")
    return lowered


def split_target_and_fragment(link: str) -> tuple[str, str]:
    clean = link.strip()
    if clean.startswith("/"):
        clean = clean[1:]
    if "#" in clean:
        target, fragment = clean.split("#", 1)
    else:
        target, fragment = clean, ""
    return unquote(target), unquote(fragment)


def validate_status_docs() -> list[str]:
    status_entries: list[StatusEntry] = []
    for rel_path in CANONICAL_STATUS_DOCS:
        abs_path = REPO_ROOT / rel_path
        if not abs_path.exists():
            return [f"Required canonical status doc missing: {rel_path}"]
        status_entries.extend(extract_statuses(rel_path, abs_path))

    by_capability: dict[str, list[StatusEntry]] = {}
    for entry in status_entries:
        by_capability.setdefault(entry.capability, []).append(entry)

    errors: list[str] = []
    for capability, entries in sorted(by_capability.items()):
        if len(entries) < 2:
            continue
        statuses = {e.status for e in entries}
        if len(statuses) > 1:
            detail = "; ".join(
                f"{e.doc}:{e.line}='{e.raw_capability}' -> {e.status}" for e in sorted(entries, key=lambda x: str(x.doc))
            )
            errors.append(f"Capability '{capability}' has conflicting statuses ({', '.join(sorted(statuses))}): {detail}")

    return errors


def extract_statuses(rel_path: Path, abs_path: Path) -> list[StatusEntry]:
    entries: list[StatusEntry] = []
    lines = abs_path.read_text(encoding="utf-8").splitlines()

    for idx, line in enumerate(lines, start=1):
        row = TABLE_ROW_RE.match(line.strip())
        if row:
            cols = [c.strip() for c in row.group(1).split("|")]
            if len(cols) >= 2 and cols[0] and not set(cols[0]) <= {"-", ":"}:
                status = normalize_status(cols[1])
                if status:
                    raw_cap = strip_markdown(cols[0])
                    entries.append(
                        StatusEntry(doc=rel_path, raw_capability=raw_cap, capability=normalize_capability(raw_cap), status=status, line=idx)
                    )
            continue

        bullet = re.match(r"^-\s+\*\*(.+?)\*\*\s*:\s*(.+)$", line.strip())
        if bullet:
            raw_cap = strip_markdown(bullet.group(1))
            status = normalize_status(bullet.group(2))
            if status:
                entries.append(
                    StatusEntry(doc=rel_path, raw_capability=raw_cap, capability=normalize_capability(raw_cap), status=status, line=idx)
                )

    return entries


def strip_markdown(text: str) -> str:
    text = re.sub(r"`([^`]+)`", r"\1", text)
    text = re.sub(r"\*\*([^*]+)\*\*", r"\1", text)
    return re.sub(r"\s+", " ", text).strip()


def normalize_capability(raw: str) -> str:
    value = raw.lower()
    value = re.sub(r"\([^)]*\)", " ", value)
    value = re.sub(r"[^a-z0-9]+", " ", value)
    value = re.sub(r"\b(feature|features|integration|support|reader|playback|management|completion|hardening|wiring)\b", " ", value)
    value = re.sub(r"\s+", " ", value).strip()
    return CAPABILITY_ALIASES.get(value, value)


def normalize_status(raw: str) -> str | None:
    lowered = strip_markdown(raw).lower()
    for emoji, mapped in EMOJI_STATUS_MAP.items():
        if emoji in raw:
            return mapped

    for key, mapped in STATUS_MAP.items():
        if key in lowered:
            return mapped

    return None


if __name__ == "__main__":
    sys.exit(main())
