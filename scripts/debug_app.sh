#!/bin/bash

# Android app debug helper: builds, gathers errors, and runs analyzers

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
source "${SCRIPT_DIR}/_common.sh"

MODULE_NAME=$(detect_module "${PROJECT_ROOT}")
MODULE_DIR="${PROJECT_ROOT}/${MODULE_NAME}"

LOG_DIR="${PROJECT_ROOT}/debug-reports"
mkdir -p "${LOG_DIR}"

echo "🚀 Running debug build and analysis"
echo "Project: ${PROJECT_ROOT}"
echo "Module dir: ${MODULE_DIR}"
echo "Reports: ${LOG_DIR}"

cd "${PROJECT_ROOT}"

# Ensure gradlew is executable if present
if [[ -f "${PROJECT_ROOT}/gradlew" ]] && [[ ! -x "${PROJECT_ROOT}/gradlew" ]]; then
	chmod +x "${PROJECT_ROOT}/gradlew"
fi

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BUILD_LOG="${LOG_DIR}/assembleDebug_${TIMESTAMP}.log"

echo "🧹 Cleaning..."
./gradlew clean --no-daemon --quiet || true

echo "🔧 Attempting assembleDebug (this may fail, expected for triage)"
set +e
if has_android_sdk "${PROJECT_ROOT}"; then
	./gradlew :${MODULE_NAME}:assembleDebug --no-daemon --info --stacktrace 2>&1 | tee "${BUILD_LOG}"
	GRADLE_RC=${PIPESTATUS[0]}
else
	echo "Android SDK not detected; skipping assembleDebug." | tee "${BUILD_LOG}"
	GRADLE_RC=1
fi
set -e

echo "📄 Build log saved: ${BUILD_LOG}"

# Extract Kotlin/Java compiler errors by file
grep -E "^e: .*:(line|\d+:)" -n "${BUILD_LOG}" > "${LOG_DIR}/compiler_errors_${TIMESTAMP}.txt" || true

# Count unique files with errors (Kotlin compiler style lines)
ERROR_FILES_COUNT=$(grep -oE ":[0-9]+:" "${BUILD_LOG}" | wc -l | tr -d ' ')
echo "📊 Approx error line occurrences: ${ERROR_FILES_COUNT}" | tee -a "${LOG_DIR}/summary_${TIMESTAMP}.txt"

# Run auxiliary analyzers if available
if [[ -f "${SCRIPT_DIR}/identify-compilation-errors.py" ]]; then
	python3 "${SCRIPT_DIR}/identify-compilation-errors.py" "${PROJECT_ROOT}" | tee "${LOG_DIR}/static_compilation_scan_${TIMESTAMP}.txt" || true
fi

if [[ -f "${SCRIPT_DIR}/fix-dependencies.py" ]]; then
	python3 "${SCRIPT_DIR}/fix-dependencies.py" "${PROJECT_ROOT}" | tee "${LOG_DIR}/dependency_scan_${TIMESTAMP}.txt" || true
fi

if [[ -f "${SCRIPT_DIR}/check-lint-config.py" ]]; then
	python3 "${SCRIPT_DIR}/check-lint-config.py" "${PROJECT_ROOT}" | tee "${LOG_DIR}/lint_config_${TIMESTAMP}.txt" || true
fi

echo "✅ Debug helper complete. Review ${LOG_DIR} for artifacts."
exit ${GRADLE_RC}

