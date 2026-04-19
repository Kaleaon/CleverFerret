#!/usr/bin/env python3
"""Validate app widget background-update constraints for Android 14 readiness.

Pass criteria:
1. Every app widget provider XML in `CleverFerret/src/main/res/xml` has an
   explicit `android:updatePeriodMillis`.
2. `android:updatePeriodMillis` is either:
   - `0` for push/event-driven updates, or
   - `>= 1800000` (30 minutes), matching Android app widget periodic minimums.
3. Any widget configured with `0` update period must opt into resize handling by
   declaring `android:resizeMode` (helps ensure update surfaces are lifecycle-safe
   and do not rely on unrestricted background polling).

Fail criteria:
- Missing / non-integer `android:updatePeriodMillis`.
- Positive update period below 30 minutes.
- Zero update period without `android:resizeMode`.
"""

from __future__ import annotations

import pathlib
import sys
import xml.etree.ElementTree as ET

ANDROID_NS = "{http://schemas.android.com/apk/res/android}"
MIN_ALLOWED_PERIOD_MILLIS = 1_800_000
WIDGET_XML_GLOB = "*widget*_info.xml"


def _android_attr(element: ET.Element, name: str) -> str | None:
    return element.get(f"{ANDROID_NS}{name}")


def main() -> int:
    root = pathlib.Path("CleverFerret/src/main/res/xml")
    if not root.exists():
        print(f"ERROR: widget XML directory not found: {root}")
        return 1

    xml_files = sorted(root.glob(WIDGET_XML_GLOB))
    if not xml_files:
        print(f"ERROR: no widget provider XML files matched {WIDGET_XML_GLOB} in {root}")
        return 1

    failures: list[str] = []

    for xml_path in xml_files:
        try:
            tree = ET.parse(xml_path)
        except ET.ParseError as exc:
            failures.append(f"{xml_path}: XML parse error: {exc}")
            continue

        provider = tree.getroot()
        update_period_value = _android_attr(provider, "updatePeriodMillis")
        if update_period_value is None:
            failures.append(f"{xml_path}: missing android:updatePeriodMillis")
            continue

        try:
            update_period = int(update_period_value)
        except ValueError:
            failures.append(
                f"{xml_path}: non-integer android:updatePeriodMillis={update_period_value!r}"
            )
            continue

        if update_period < 0:
            failures.append(f"{xml_path}: negative android:updatePeriodMillis={update_period}")
            continue

        if 0 < update_period < MIN_ALLOWED_PERIOD_MILLIS:
            failures.append(
                f"{xml_path}: update period {update_period}ms is below 30 minute minimum"
            )

        if update_period == 0:
            resize_mode = _android_attr(provider, "resizeMode")
            if not resize_mode:
                failures.append(
                    f"{xml_path}: updatePeriodMillis=0 requires explicit android:resizeMode"
                )

    if failures:
        print("Android 14 widget background-update validation FAILED")
        for failure in failures:
            print(f" - {failure}")
        return 1

    print(
        "Android 14 widget background-update validation PASSED "
        f"for {len(xml_files)} widget provider XML files"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
