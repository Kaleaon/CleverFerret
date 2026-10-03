#!/bin/bash

# Open a PR when the Android build fails, add Copilot explanation, and create a Cursor task file

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
source "${SCRIPT_DIR}/_common.sh"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BRANCH_PREFIX=${BRANCH_PREFIX:-"fix/build-failure"}
BRANCH_NAME=${BRANCH_NAME:-"${BRANCH_PREFIX}-${TIMESTAMP}"}
PR_TITLE=${PR_TITLE:-"fix: address Android build failure (${TIMESTAMP})"}
ASSIGNEES=${CURSOR_ASSIGNEE:-""}
LABELS=${PR_LABELS:-"automation,build-failure,cursor-task"}

# Where to look for build logs
REPAIR_DIR="${PROJECT_ROOT}/repair-reports"
DEBUG_DIR="${PROJECT_ROOT}/debug-reports"

# Select the most recent assembleDebug log
LATEST_LOG=""
if compgen -G "${REPAIR_DIR}/assembleDebug_*.log" > /dev/null; then
	LATEST_LOG=$(ls -1t ${REPAIR_DIR}/assembleDebug_*.log 2>/dev/null | head -n1 || true)
elif compgen -G "${DEBUG_DIR}/assembleDebug_*.log" > /dev/null; then
	LATEST_LOG=$(ls -1t ${DEBUG_DIR}/assembleDebug_*.log 2>/dev/null | head -n1 || true)
fi

if [[ -z "${LATEST_LOG}" ]]; then
	echo "No build log found. Run repair or debug script first."
	exit 1
fi

echo "Using build log: ${LATEST_LOG}"

# Prepare PR body directory
PR_DIR="${PROJECT_ROOT}/.pr"
mkdir -p "${PR_DIR}"

SUMMARY_FILE="${REPAIR_DIR}/repair_summary_*.md"
PR_BODY_FILE="${PR_DIR}/pr_body_${TIMESTAMP}.md"
COPILOT_FILE="${PR_DIR}/copilot_explanation_${TIMESTAMP}.md"

# Generate a basic PR body from logs and summary
{
echo "# Fix: Android build failure"
echo
echo "Generated: $(date)"
echo
echo "## Summary"
if compgen -G "${SUMMARY_FILE}" > /dev/null; then
	LATEST_SUMMARY=$(ls -1t ${SUMMARY_FILE} 2>/dev/null | head -n1 || true)
	if [[ -n "${LATEST_SUMMARY}" && -f "${LATEST_SUMMARY}" ]]; then
		echo "Included summary: ${LATEST_SUMMARY}"
		echo
		awk 'NR<=200 {print}' "${LATEST_SUMMARY}" || true
	else
		echo "No repair summary found."
	fi
else
	echo "No repair summary found."
fi
echo
echo "## Compiler Error Snippet (tail)"
if [[ -n "${LATEST_LOG}" && -f "${LATEST_LOG}" ]]; then
	echo "```"
	tail -n 200 "${LATEST_LOG}" || true
	echo "```"
else
	echo "(log unavailable)"
fi
} > "${PR_BODY_FILE}"

# Try to get a Copilot explanation if gh-copilot is available
set +e
if command -v gh >/dev/null 2>&1 && gh extension list | grep -qi "copilot"; then
	# Try multiple strategies depending on extension capabilities
	gh copilot explain -f "${LATEST_LOG}" > "${COPILOT_FILE}" 2>/dev/null || \
	( tail -n 200 "${LATEST_LOG}" | gh copilot explain > "${COPILOT_FILE}" 2>/dev/null ) || true
fi
set -e

if [[ -s "${COPILOT_FILE}" ]]; then
	echo >> "${PR_BODY_FILE}"
	echo "## Copilot Explanation" >> "${PR_BODY_FILE}"
	echo >> "${PR_BODY_FILE}"
	cat "${COPILOT_FILE}" >> "${PR_BODY_FILE}"
fi

# Create a Cursor task file with PR intent (will update after PR URL is known)
CURSOR_TASK_DIR="${PROJECT_ROOT}/issues"
mkdir -p "${CURSOR_TASK_DIR}"
CURSOR_TASK_FILE="${CURSOR_TASK_DIR}/CURSOR_TASK_build_fix_${TIMESTAMP}.md"

{
echo "# Cursor Task: Fix Android build failure"
echo
echo "Generated: $(date)"
echo
echo "- **PR**: (pending creation)"
echo "- **Branch**: ${BRANCH_NAME}"
echo "- **Labels**: ${LABELS}"
echo
echo "## Build Log (tail)"
if [[ -n "${LATEST_LOG}" && -f "${LATEST_LOG}" ]]; then
	echo "```"
	tail -n 120 "${LATEST_LOG}" || true
	echo "```"
else
	echo "(log unavailable)"
fi
} > "${CURSOR_TASK_FILE}"

# Safety checks for git/gh
command -v git >/dev/null 2>&1 || { echo "git not found"; exit 1; }
if ! command -v gh >/dev/null 2>&1; then
	echo "gh (GitHub CLI) not found; skipping PR creation, leaving Cursor task instead."
	exit 0
fi

# Ensure working tree is clean or allow untracked reports
git add -A :/ || true

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "Creating branch: ${BRANCH_NAME} (from ${CURRENT_BRANCH})"
git switch -c "${BRANCH_NAME}"

# Stage relevant artifacts
git add "${PR_BODY_FILE}" || true
git add "${CURSOR_TASK_FILE}" || true
git add "${REPAIR_DIR}" 2>/dev/null || true
git add "${DEBUG_DIR}" 2>/dev/null || true

git commit -m "chore: add build failure artifacts and Cursor task (${TIMESTAMP})" || true

echo "Pushing branch..."
git push -u origin "${BRANCH_NAME}"

# Create PR
PR_CREATE_ARGS=(--title "${PR_TITLE}" --body-file "${PR_BODY_FILE}")
if [[ -n "${ASSIGNEES}" ]]; then
	PR_CREATE_ARGS+=(--assignee "${ASSIGNEES}")
fi
if [[ -n "${LABELS}" ]]; then
	PR_CREATE_ARGS+=(--label "${LABELS}")
fi

echo "Opening PR..."
PR_URL=$(gh pr create "${PR_CREATE_ARGS[@]}" 2>/dev/null | tail -n1)
if [[ -z "${PR_URL}" ]]; then
	# Fallback to reading URL
	PR_URL=$(gh pr view --json url -q .url 2>/dev/null || echo "")
fi

if [[ -n "${PR_URL}" ]]; then
	echo "PR created: ${PR_URL}"
	# Update Cursor task with PR URL
	sed -i.bak "s|(pending creation)|${PR_URL}|" "${CURSOR_TASK_FILE}" && rm -f "${CURSOR_TASK_FILE}.bak"
else
	echo "Failed to retrieve PR URL."
fi

echo "Done."
exit 0

