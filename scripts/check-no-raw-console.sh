#!/usr/bin/env bash
set -euo pipefail

# Discourage raw console / println usage in production application code.
PATTERN='console\.(log|error|warn|info)'
TARGETS=("CleverFerret/src/main" "CleverFerretV2/app/src/main")

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

search_file_or_dir() {
  local target="$1"
  if command -v rg >/dev/null 2>&1; then
    rg -n "$PATTERN" "$target" --glob '!**/build/**' || true
  else
    grep -rnE "$PATTERN" "$target" --exclude-dir="build" || true
  fi
}

files_to_check=()

if [[ $# -gt 0 ]]; then
  for arg in "$@"; do
    abs_path="$arg"
    if [[ "$arg" != /* ]]; then
      abs_path="${REPO_ROOT}/${arg}"
    fi
    if [[ -f "$abs_path" ]] && [[ "$abs_path" != *"/build/"* ]]; then
      if [[ "$arg" == CleverFerret/src/main/* ]] || [[ "$arg" == CleverFerretV2/app/src/main/* ]] || \
         [[ "$abs_path" == "${REPO_ROOT}/CleverFerret/src/main/"* ]] || [[ "$abs_path" == "${REPO_ROOT}/CleverFerretV2/app/src/main/"* ]]; then
        files_to_check+=("$arg")
      fi
    fi
  done
  if [[ ${#files_to_check[@]} -eq 0 ]]; then
    exit 0
  fi
else
  for t in "${TARGETS[@]}"; do
    full_t="${REPO_ROOT}/${t}"
    if [[ -d "$full_t" ]]; then
      files_to_check+=("$t")
    fi
  done
fi

violations=""
for target in "${files_to_check[@]}"; do
  hits=$(search_file_or_dir "$target")
  if [[ -n "$hits" ]]; then
    violations+=$'\n'"$hits"
  fi
done

if [[ -n "$violations" ]]; then
  echo "Raw console usage found in production paths:"
  echo "$violations"
  echo "Use AppLogger (Android) or the module logging abstraction instead for application logs."
  echo "Correction steps: Remove raw console calls or replace them with AppLogger / module logging abstraction."
  exit 1
fi

echo "No raw console usage found in production paths."
