#!/bin/bash

# Android app repair orchestrator: dependency/lint checks, targeted builds, and report

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Resolve module path (prefer :app if present, else :CleverFerret)
MODULE_DIR="${PROJECT_ROOT}/app"
if [[ ! -d "${MODULE_DIR}" ]]; then
	MODULE_DIR="${PROJECT_ROOT}/CleverFerret"
fi

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

echo "🧪 Running metadata check..."
set +e
./gradlew :$(basename "${MODULE_DIR}"):checkDebugAarMetadata --no-daemon --stacktrace 2>&1 | tee "${REPORT_DIR}/checkDebugAarMetadata_${TIMESTAMP}.log"
META_RC=${PIPESTATUS[0]}
set -e

echo "🏗️ Attempting assembleDebug..."
set +e
./gradlew :$(basename "${MODULE_DIR}"):assembleDebug --no-daemon --info --stacktrace 2>&1 | tee "${REPORT_DIR}/assembleDebug_${TIMESTAMP}.log"
BUILD_STATUS=${PIPESTATUS[0]}
set -e

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
exit ${BUILD_STATUS}

