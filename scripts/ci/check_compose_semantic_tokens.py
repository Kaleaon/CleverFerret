#!/usr/bin/env python3
"""Fail CI when Compose feature UI hard-codes values that should come from semantic tokens."""

from __future__ import annotations

import re
import sys
from dataclasses import dataclass
from pathlib import Path

DEFAULT_TARGETS = [
    Path("CleverFerretV2/feature"),
]

DISALLOWED_PATTERNS = {
    "hardcoded-color": re.compile(r"\bColor\s*\("),
    "hardcoded-dp": re.compile(r"\b\d+(?:\.\d+)?\.dp\b"),
    "hardcoded-sp": re.compile(r"\b\d+(?:\.\d+)?\.sp\b"),
    "hardcoded-text-style": re.compile(r"\bTextStyle\s*\("),
}

ALLOWLIST_SUBSTRINGS = (
    "DesignTokensV1",
    "KthemeThemeAdapterV1",
    "ComponentCatalogV1",
    "AccessibilityAcceptanceV1",
    "// semtoken-allow",
)


@dataclass
class Violation:
    path: Path
    line: int
    rule: str
    snippet: str


def gather_targets(args: list[str]) -> list[Path]:
    if args:
        return [Path(arg) for arg in args]
    return DEFAULT_TARGETS


def collect_violations(root: Path) -> list[Violation]:
    violations: list[Violation] = []
    if not root.exists():
        return violations

    for file in root.rglob("*.kt"):
        if "build" in file.parts:
            continue
        text = file.read_text(encoding="utf-8")
        for index, line in enumerate(text.splitlines(), start=1):
            if any(allowed in line for allowed in ALLOWLIST_SUBSTRINGS):
                continue
            if "@Composable" not in text and "compose" not in str(file).lower():
                continue
            for rule, pattern in DISALLOWED_PATTERNS.items():
                if pattern.search(line):
                    violations.append(Violation(file, index, rule, line.strip()))
                    break
    return violations


def main() -> int:
    targets = gather_targets(sys.argv[1:])
    violations = [v for target in targets for v in collect_violations(target)]

    if not violations:
        print("Compose semantic token check passed.")
        return 0

    print("Compose semantic token check failed. Replace literals with DesignTokensV1/KthemeThemeAdapterV1 roles.")
    for violation in violations:
        print(f"- {violation.path}:{violation.line} [{violation.rule}] {violation.snippet}")
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
