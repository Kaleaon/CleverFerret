#!/usr/bin/env bash
set -euo pipefail

TARGET_DIRS=("${@:-CleverFerret/src/main/java/com/universalmedialibrary/ui/media}")

echo "Auditing hardcoded .dp/.sp usage in: ${TARGET_DIRS[*]}"

dp_total=$((rg -o "[0-9]+(\.[0-9]+)?\.dp" "${TARGET_DIRS[@]}" -g '*.kt' 2>/dev/null || true) | wc -l | tr -d ' ')
sp_total=$((rg -o "[0-9]+(\.[0-9]+)?\.sp" "${TARGET_DIRS[@]}" -g '*.kt' 2>/dev/null || true) | wc -l | tr -d ' ')

echo "Total .dp tokens: ${dp_total}"
echo "Total .sp tokens: ${sp_total}"
echo ""
echo "Top files with hardcoded dimensions:"
(rg -H -n "[0-9]+(\.[0-9]+)?\.(dp|sp)" "${TARGET_DIRS[@]}" -g '*.kt' 2>/dev/null || true) \
  | cut -d: -f1 \
  | sort \
  | uniq -c \
  | sort -nr \
  | head -n 20 || true
