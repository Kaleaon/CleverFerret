#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR=${1:-"CleverFerret/src/main/java/com/universalmedialibrary/ui/media"}

echo "Auditing hardcoded .dp/.sp usage in: ${TARGET_DIR}"

dp_total=$(rg -o "[0-9]+(\.[0-9]+)?\.dp" "$TARGET_DIR" -g '*.kt' | wc -l | tr -d ' ')
sp_total=$(rg -o "[0-9]+(\.[0-9]+)?\.sp" "$TARGET_DIR" -g '*.kt' | wc -l | tr -d ' ')

echo "Total .dp tokens: ${dp_total}"
echo "Total .sp tokens: ${sp_total}"
echo ""
echo "Top files with hardcoded dimensions:"
rg -n "[0-9]+(\.[0-9]+)?\.(dp|sp)" "$TARGET_DIR" -g '*.kt' \
  | cut -d: -f1 \
  | sort \
  | uniq -c \
  | sort -nr \
  | head -n 20
