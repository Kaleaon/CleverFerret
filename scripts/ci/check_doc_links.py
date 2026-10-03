#!/usr/bin/env python3
"""Fail if docs markdown files contain missing local links."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DOCS_ROOT = ROOT / "docs"

LINK_RE = re.compile(r"!??\[[^\]]*\]\(([^)]+)\)")


def _normalize_target(raw: str) -> str:
    target = raw.strip()
    if target.startswith("<") and target.endswith(">"):
        target = target[1:-1].strip()
    return target


def _should_skip(target: str) -> bool:
    lowered = target.lower()
    return (
        lowered.startswith("http://")
        or lowered.startswith("https://")
        or lowered.startswith("mailto:")
        or lowered.startswith("tel:")
        or lowered.startswith("#")
    )


def _target_exists(markdown_file: Path, target: str) -> bool:
    if target.startswith("/"):
        candidate = ROOT / target.lstrip("/")
    else:
        candidate = (markdown_file.parent / target).resolve()

    if candidate.exists():
        return True

    if candidate.suffix == "":
        md_candidate = candidate.with_suffix(".md")
        if md_candidate.exists():
            return True

    return False


def main() -> int:
    markdown_files = sorted(DOCS_ROOT.rglob("*.md"))
    errors: list[str] = []

    for markdown_file in markdown_files:
        content = markdown_file.read_text(encoding="utf-8")
        for raw_target in LINK_RE.findall(content):
            target = _normalize_target(raw_target)
            if not target:
                continue

            target_no_fragment = target.split("#", 1)[0].strip()
            if not target_no_fragment or _should_skip(target_no_fragment):
                continue

            if not _target_exists(markdown_file, target_no_fragment):
                rel_file = markdown_file.relative_to(ROOT)
                errors.append(f"{rel_file}: missing local link target '{target_no_fragment}'")

    if errors:
        print("Broken documentation links detected:")
        for error in errors:
            print(f"- {error}")
        return 1

    print(f"Validated {len(markdown_files)} markdown files under docs/: no missing local links found.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
