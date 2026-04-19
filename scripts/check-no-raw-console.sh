#!/usr/bin/env bash
set -euo pipefail

# Discourage raw console / println usage in production application code.
PATTERN='console\.(log|error|warn|info)'
TARGETS=("CleverFerret/src/main" "CleverFerretV2/app/src/main")

violations=""
for target in "${TARGETS[@]}"; do
  if [[ -d "$target" ]]; then
    hits=$(rg -n "$PATTERN" "$target" --glob '!**/build/**' || true)
    if [[ -n "$hits" ]]; then
      violations+=$'\n'"$hits"
    fi
  fi
done

if [[ -n "$violations" ]]; then
  echo "Raw console usage found in production paths:"
  echo "$violations"
  echo "Use AppLogger (Android) or the module logging abstraction instead for application logs."
  exit 1
fi

echo "No raw console usage found in production paths."
