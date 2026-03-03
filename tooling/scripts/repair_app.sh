#!/bin/bash

# Android app repair orchestrator: dependency/lint checks, targeted builds, and report

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
source "${SCRIPT_DIR}/_common.sh"

MODULE_NAME=$(detect_module "${PROJECT_ROOT}")
MODULE_DIR="${PROJECT_ROOT}/${MODULE_NAME}"

REPORT_DIR="${PROJECT_ROOT}/repair-reports"
mkdir -p "${REPORT_DIR}"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

SUMMARY_FILE="${REPORT_DIR}/repair_summary_${TIMESTAMP}.md"

echo "🔧 Starting repair orchestration"
echo "Project: ${PROJECT_ROOT}"
echo "Module dir: ${MODULE_DIR}"
echo "Reports: ${REPORT_DIR}"

cd "${PROJECT_ROOT}"

# Ensure gradlew is executable if present
if [[ -f "${PROJECT_ROOT}/gradlew" ]] && [[ ! -x "${PROJECT_ROOT}/gradlew" ]]; then
	chmod +x "${PROJECT_ROOT}/gradlew"
fi

{
echo "# Repair Orchestration Summary"
echo "Generated: $(date)"
echo
} > "${SUMMARY_FILE}"

DEP_STATUS=0
LINT_STATUS=0
ANALYSIS_STATUS=0
BUILD_STATUS=0

echo "📦 Analyzing/fixing dependencies..."
if [[ -f "${SCRIPT_DIR}/fix-dependencies.py" ]]; then
	set +e
	python3 "${SCRIPT_DIR}/fix-dependencies.py" "${PROJECT_ROOT}" | tee "${REPORT_DIR}/dependencies_${TIMESTAMP}.txt"
	DEP_STATUS=${PIPESTATUS[0]}
	set -e
else
	echo "fix-dependencies.py not found" | tee -a "${SUMMARY_FILE}"
fi

echo "🧹 Checking lint configuration..."
if [[ -f "${SCRIPT_DIR}/check-lint-config.py" ]]; then
	set +e
	python3 "${SCRIPT_DIR}/check-lint-config.py" "${PROJECT_ROOT}" | tee "${REPORT_DIR}/lint_config_${TIMESTAMP}.txt"
	LINT_STATUS=${PIPESTATUS[0]}
	set -e
else
	echo "check-lint-config.py not found" | tee -a "${SUMMARY_FILE}"
fi

echo "🔎 Static compilation scan..."
if [[ -f "${SCRIPT_DIR}/identify-compilation-errors.py" ]]; then
	set +e
	python3 "${SCRIPT_DIR}/identify-compilation-errors.py" "${PROJECT_ROOT}" | tee "${REPORT_DIR}/static_compilation_scan_${TIMESTAMP}.txt"
	ANALYSIS_STATUS=${PIPESTATUS[0]}
	set -e
fi

META_RC=0
if has_android_sdk "${PROJECT_ROOT}"; then
	echo "🧪 Running metadata check..."
	set +e
	./gradlew :${MODULE_NAME}:checkDebugAarMetadata --no-daemon --stacktrace 2>&1 | tee "${REPORT_DIR}/checkDebugAarMetadata_${TIMESTAMP}.log"
	META_RC=${PIPESTATUS[0]}
	set -e

	echo "🏗️ Attempting assembleDebug..."
	set +e
	./gradlew :${MODULE_NAME}:assembleDebug --no-daemon --info --stacktrace 2>&1 | tee "${REPORT_DIR}/assembleDebug_${TIMESTAMP}.log"
	BUILD_STATUS=${PIPESTATUS[0]}
	set -e
else
	echo "⚠️ Android SDK not detected; skipping Gradle tasks." | tee "${REPORT_DIR}/sdk_missing_${TIMESTAMP}.txt"
	BUILD_STATUS=1
fi

ERR_FILE_COUNT=$(grep -oE ":[0-9]+:" "${REPORT_DIR}/assembleDebug_${TIMESTAMP}.log" | wc -l | tr -d ' ' || true)

{
echo "## Results"
echo
echo "- Dependency analysis exit code: ${DEP_STATUS}"
echo "- Lint config check exit code: ${LINT_STATUS}"
echo "- Static analysis exit code: ${ANALYSIS_STATUS}"
echo "- checkDebugAarMetadata exit code: ${META_RC}"
echo "- assembleDebug exit code: ${BUILD_STATUS}"
echo "- Approx compiler error occurrences: ${ERR_FILE_COUNT}"
echo
echo "## Artifacts"
echo
echo "- Dependencies: repair-reports/dependencies_${TIMESTAMP}.txt"
echo "- Lint config: repair-reports/lint_config_${TIMESTAMP}.txt"
echo "- Static scan: repair-reports/static_compilation_scan_${TIMESTAMP}.txt"
echo "- Metadata log: repair-reports/checkDebugAarMetadata_${TIMESTAMP}.log"
echo "- Build log: repair-reports/assembleDebug_${TIMESTAMP}.log"
} >> "${SUMMARY_FILE}"

echo "✅ Repair orchestration complete. Summary: ${SUMMARY_FILE}"

# Optional: auto-open PR when build fails
if [[ "${AUTO_PR_ON_FAILURE:-0}" != "0" && ${BUILD_STATUS} -ne 0 ]]; then
	echo "🔁 AUTO_PR_ON_FAILURE enabled and build failed. Opening PR..."
	"${SCRIPT_DIR}/auto_pr_on_failure.sh" || true
fi

exit ${BUILD_STATUS}

