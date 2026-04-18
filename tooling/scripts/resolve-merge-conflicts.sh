#!/usr/bin/env bash

set -euo pipefail

# Merge conflict resolution script.
# Modes:
#   protected (default): report conflicts and exit non-zero if any exist.
#   allowlisted-auto: auto-resolve only explicitly allowlisted low-risk files.
#
# Deprecated/removed:
#   extension-auto: old extension-based --ours/--theirs strategy has been deprecated.

MODE="${CONFLICT_RESOLUTION_MODE:-protected}"
if [[ "${1:-}" == --mode=* ]]; then
  MODE="${1#--mode=}"
fi

if [[ "$MODE" == "extension-auto" ]]; then
  echo "ERROR: 'extension-auto' is deprecated and disabled."
  echo "Use protected mode, or allowlisted-auto with explicit approval gates."
  exit 2
fi

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "ERROR: Must be run inside a git repository."
  exit 2
fi

conflicted_files="$(git diff --name-only --diff-filter=U)"

if [[ -z "$conflicted_files" ]]; then
  echo "No merge conflicts detected."
  exit 0
fi

echo "Conflicted files detected:"
printf '%s\n' "$conflicted_files"

if [[ "$MODE" == "protected" ]]; then
  echo "Protected mode enabled: reporting conflicts only; no files modified."
  exit 1
fi

if [[ "$MODE" != "allowlisted-auto" ]]; then
  echo "ERROR: Unsupported mode '$MODE'. Supported: protected, allowlisted-auto"
  exit 2
fi

# Explicitly allowlisted low-risk files for automated resolution.
# Automation always favors the PR branch version (--ours) to avoid unreviewed incoming drift.
readonly ALLOWLIST=(
  "README.md"
  "LICENSE"
  "docs/"
)

is_allowlisted_file() {
  local file="$1"
  for allowed in "${ALLOWLIST[@]}"; do
    if [[ "$allowed" == */ ]]; then
      [[ "$file" == "$allowed"* ]] && return 0
    else
      [[ "$file" == "$allowed" ]] && return 0
    fi
  done
  return 1
}

if [[ "${REQUIRE_AUTOMATION_APPROVAL:-false}" != "true" ]]; then
  echo "ERROR: allowlisted-auto requires REQUIRE_AUTOMATION_APPROVAL=true"
  exit 1
fi

rejected_files=()
resolved_files=()

while IFS= read -r file; do
  [[ -z "$file" ]] && continue

  if is_allowlisted_file "$file"; then
    echo "Auto-resolving allowlisted file with --ours: $file"
    git checkout --ours -- "$file"
    git add "$file"
    resolved_files+=("$file")
  else
    echo "Not allowlisted; manual resolution required: $file"
    rejected_files+=("$file")
  fi
done <<< "$conflicted_files"

if (( ${#rejected_files[@]} > 0 )); then
  echo "ERROR: Auto-resolution aborted; non-allowlisted conflicts found:"
  printf ' - %s\n' "${rejected_files[@]}"
  exit 1
fi

remaining_conflicts="$(git diff --name-only --diff-filter=U)"
if [[ -n "$remaining_conflicts" ]]; then
  echo "ERROR: Conflicts remain after allowlisted automation:"
  printf '%s\n' "$remaining_conflicts"
  exit 1
fi

echo "Running post-resolution validation (build + tests + diff checks)..."
./gradlew build test

echo "Diff summary of automated resolution:"
git diff --cached --stat

# Ensure staged changes are only allowlisted files.
staged_files="$(git diff --cached --name-only)"
while IFS= read -r file; do
  [[ -z "$file" ]] && continue
  if ! is_allowlisted_file "$file"; then
    echo "ERROR: Staged file outside allowlist: $file"
    exit 1
  fi
done <<< "$staged_files"

echo "Automated conflict resolution and validation succeeded."
exit 0
