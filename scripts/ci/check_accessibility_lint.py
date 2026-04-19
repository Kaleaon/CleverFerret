#!/usr/bin/env python3
"""Fail CI if Android lint reports accessibility issues."""

from __future__ import annotations

import sys
import xml.etree.ElementTree as ET
from pathlib import Path

ACCESSIBILITY_ISSUE_IDS = {
    "ContentDescription",
    "ClickableViewAccessibility",
    "KeyboardInaccessibleWidget",
    "LabelFor",
    "SpeakableTextPresentCheck",
    "TextContrastCheck",
    "TouchTargetSizeCheck",
    "FocusOrder",
    "Heading",
}


def main() -> int:
    if len(sys.argv) != 2:
        print("Usage: check_accessibility_lint.py <lint-results.xml>", file=sys.stderr)
        return 2

    report_path = Path(sys.argv[1])
    if not report_path.exists():
        print(f"Accessibility lint check skipped: report not found at {report_path}", file=sys.stderr)
        return 1

    root = ET.parse(report_path).getroot()
    matching = [issue for issue in root.findall("issue") if issue.get("id") in ACCESSIBILITY_ISSUE_IDS]

    if not matching:
        print("Accessibility lint check passed: no accessibility lint issues found.")
        return 0

    print("Accessibility lint check failed. Found accessibility issues:")
    for issue in matching:
        issue_id = issue.get("id")
        message = issue.get("message", "")
        location = issue.find("location")
        file_path = location.get("file") if location is not None else "<unknown>"
        line = location.get("line") if location is not None else "?"
        print(f"- {issue_id} at {file_path}:{line} -> {message}")

    return 1


if __name__ == "__main__":
    raise SystemExit(main())
