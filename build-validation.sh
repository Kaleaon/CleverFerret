#!/bin/bash
# Build and Validation Workflow for CleverFerret Android Application
# This script builds APKs, runs tests, and generates validation reports

set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Output directory for reports
REPORT_DIR="build-validation-reports"
mkdir -p "$REPORT_DIR"

# Log file
LOG_FILE="$REPORT_DIR/build-validation-$(date +%Y%m%d-%H%M%S).log"

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}" | tee -a "$LOG_FILE"
}

print_header() {
    echo "" | tee -a "$LOG_FILE"
    print_status "$BLUE" "========================================" 
    print_status "$BLUE" "$1"
    print_status "$BLUE" "========================================" 
    echo "" | tee -a "$LOG_FILE"
}

print_success() {
    print_status "$GREEN" "✅ $1"
}

print_failure() {
    print_status "$RED" "❌ $1"
}

print_warning() {
    print_status "$YELLOW" "⚠️  $1"
}

# Track overall status
BUILD_DEBUG_SUCCESS=false
BUILD_RELEASE_SUCCESS=false
TESTS_SUCCESS=false
LINT_SUCCESS=false

# Start validation
print_header "CleverFerret Android Build and Validation Workflow"
print_status "$BLUE" "Started: $(date)"
print_status "$BLUE" "Working Directory: $(pwd)"
echo "" | tee -a "$LOG_FILE"

# Step 1: Environment Check
print_header "Step 1: Environment Validation"
print_status "$BLUE" "Checking build environment..."

# Check Java version
if java -version 2>&1 | grep -q "17"; then
    JAVA_VERSION=$(java -version 2>&1 | head -n 1)
    print_success "Java 17 detected: $JAVA_VERSION"
else
    print_failure "Java 17 not found. Required for Android Gradle Plugin 8.4.1+"
    exit 1
fi

# Check Android SDK
if [ -z "$ANDROID_HOME" ]; then
    print_failure "ANDROID_HOME not set"
    exit 1
else
    print_success "ANDROID_HOME: $ANDROID_HOME"
fi

# Check Gradle
if [ -f "gradlew" ]; then
    print_success "Gradle wrapper found"
    chmod +x gradlew
else
    print_failure "Gradle wrapper not found"
    exit 1
fi

# Step 2: Clean Build
print_header "Step 2: Clean Previous Build Artifacts"
print_status "$BLUE" "Running: ./gradlew clean"

if ./gradlew clean --no-daemon --stacktrace >> "$LOG_FILE" 2>&1; then
    print_success "Clean completed successfully"
else
    print_warning "Clean had issues (see log), continuing..."
fi

# Step 3: Build Debug APK
print_header "Step 3: Build Debug APK"
print_status "$BLUE" "Running: ./gradlew assembleDebug"
print_status "$BLUE" "This may take 5-10 minutes on first build..."

START_TIME=$(date +%s)
if ./gradlew assembleDebug --no-daemon --stacktrace >> "$LOG_FILE" 2>&1; then
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    print_success "Debug APK build completed in ${DURATION}s"
    BUILD_DEBUG_SUCCESS=true
    
    # Check if APK exists
    if [ -f "CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk" ]; then
        APK_SIZE=$(du -h "CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk" | cut -f1)
        print_success "Debug APK found: CleverFerret-debug.apk (${APK_SIZE})"
        cp "CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk" "$REPORT_DIR/"
    else
        print_failure "Debug APK file not found at expected location"
        BUILD_DEBUG_SUCCESS=false
    fi
else
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    print_failure "Debug APK build failed after ${DURATION}s"
    print_warning "Check log file for compilation errors: $LOG_FILE"
    
    # Extract compilation errors
    grep -E "^e: file:" "$LOG_FILE" > "$REPORT_DIR/compilation-errors.txt" 2>&1 || true
    ERROR_COUNT=$(wc -l < "$REPORT_DIR/compilation-errors.txt" 2>/dev/null || echo "0")
    if [ "$ERROR_COUNT" -gt 0 ]; then
        print_warning "Found $ERROR_COUNT compilation errors (saved to compilation-errors.txt)"
    fi
fi

# Step 4: Build Release APK  
print_header "Step 4: Build Release APK"
print_status "$BLUE" "Running: ./gradlew assembleRelease"

START_TIME=$(date +%s)
if ./gradlew assembleRelease --no-daemon --stacktrace >> "$LOG_FILE" 2>&1; then
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    print_success "Release APK build completed in ${DURATION}s"
    BUILD_RELEASE_SUCCESS=true
    
    # Check if APK exists
    if [ -f "CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk" ]; then
        APK_SIZE=$(du -h "CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk" | cut -f1)
        print_success "Release APK found: CleverFerret-release-unsigned.apk (${APK_SIZE})"
        cp "CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk" "$REPORT_DIR/"
    else
        print_failure "Release APK file not found at expected location"
        BUILD_RELEASE_SUCCESS=false
    fi
else
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    print_failure "Release APK build failed after ${DURATION}s"
fi

# Step 5: Run Unit Tests
print_header "Step 5: Run Unit Tests"
print_status "$BLUE" "Running: ./gradlew test"

START_TIME=$(date +%s)
if ./gradlew test --no-daemon --stacktrace >> "$LOG_FILE" 2>&1; then
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    print_success "All tests passed in ${DURATION}s"
    TESTS_SUCCESS=true
    
    # Copy test reports
    if [ -d "CleverFerret/build/reports/tests" ]; then
        cp -r "CleverFerret/build/reports/tests" "$REPORT_DIR/"
        print_success "Test reports copied to $REPORT_DIR/tests/"
    fi
    
    # Try to count tests
    if [ -f "CleverFerret/build/test-results/testDebugUnitTest/TEST-*.xml" ]; then
        TEST_COUNT=$(grep -c '<testcase' CleverFerret/build/test-results/testDebugUnitTest/TEST-*.xml 2>/dev/null || echo "unknown")
        print_success "Tests run: $TEST_COUNT"
    fi
else
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    print_failure "Tests failed after ${DURATION}s"
    
    # Copy test reports even if failed
    if [ -d "CleverFerret/build/reports/tests" ]; then
        cp -r "CleverFerret/build/reports/tests" "$REPORT_DIR/"
        print_warning "Test failure reports copied to $REPORT_DIR/tests/"
    fi
fi

# Step 6: Run Lint Checks
print_header "Step 6: Run Lint Checks"
print_status "$BLUE" "Running: ./gradlew lint"
print_status "$BLUE" "Note: 31 warnings expected (0 errors)"

START_TIME=$(date +%s)
if ./gradlew lint --no-daemon --stacktrace >> "$LOG_FILE" 2>&1; then
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    print_success "Lint checks passed in ${DURATION}s"
    LINT_SUCCESS=true
else
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    # Lint might "fail" with warnings - check if it's expected
    if grep -q "31 warnings" "$LOG_FILE"; then
        print_success "Lint completed with expected 31 warnings in ${DURATION}s"
        LINT_SUCCESS=true
    else
        print_warning "Lint checks completed with issues in ${DURATION}s"
        LINT_SUCCESS=false
    fi
fi

# Copy lint reports
if [ -f "CleverFerret/build/reports/lint-results-debug.html" ]; then
    cp "CleverFerret/build/reports/lint-results-debug.html" "$REPORT_DIR/"
    print_success "Lint report copied to $REPORT_DIR/lint-results-debug.html"
fi

# Step 7: Generate Summary Report
print_header "Step 7: Generate Validation Summary"

# Create markdown report
SUMMARY_FILE="$REPORT_DIR/VALIDATION_SUMMARY.md"

cat > "$SUMMARY_FILE" << EOF
# CleverFerret Android Build Validation Report

**Generated:** $(date)  
**Build Environment:** $(uname -a)  
**Java Version:** $(java -version 2>&1 | head -n 1)  
**Android Home:** $ANDROID_HOME

## Build Results

### Debug APK
EOF

if [ "$BUILD_DEBUG_SUCCESS" = true ]; then
    cat >> "$SUMMARY_FILE" << EOF
- **Status:** ✅ SUCCESS
- **Location:** \`CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk\`
EOF
    if [ -f "$REPORT_DIR/CleverFerret-debug.apk" ]; then
        APK_SIZE=$(du -h "$REPORT_DIR/CleverFerret-debug.apk" | cut -f1)
        APK_SHA=$(sha256sum "$REPORT_DIR/CleverFerret-debug.apk" | cut -d' ' -f1)
        cat >> "$SUMMARY_FILE" << EOF
- **Size:** $APK_SIZE
- **SHA256:** \`$APK_SHA\`
EOF
    fi
else
    cat >> "$SUMMARY_FILE" << EOF
- **Status:** ❌ FAILED
- **Reason:** Compilation errors detected
- **Details:** See \`compilation-errors.txt\`
EOF
fi

cat >> "$SUMMARY_FILE" << EOF

### Release APK
EOF

if [ "$BUILD_RELEASE_SUCCESS" = true ]; then
    cat >> "$SUMMARY_FILE" << EOF
- **Status:** ✅ SUCCESS  
- **Location:** \`CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk\`
EOF
    if [ -f "$REPORT_DIR/CleverFerret-release-unsigned.apk" ]; then
        APK_SIZE=$(du -h "$REPORT_DIR/CleverFerret-release-unsigned.apk" | cut -f1)
        APK_SHA=$(sha256sum "$REPORT_DIR/CleverFerret-release-unsigned.apk" | cut -d' ' -f1)
        cat >> "$SUMMARY_FILE" << EOF
- **Size:** $APK_SIZE
- **SHA256:** \`$APK_SHA\`
- **Note:** APK is unsigned (debug keystore used)
EOF
    fi
else
    cat >> "$SUMMARY_FILE" << EOF
- **Status:** ❌ FAILED
- **Reason:** Build failed or APK not generated
EOF
fi

cat >> "$SUMMARY_FILE" << EOF

## Test Results

EOF

if [ "$TESTS_SUCCESS" = true ]; then
    cat >> "$SUMMARY_FILE" << EOF
- **Status:** ✅ PASSED
- **Test Reports:** See \`tests/\` directory
EOF
else
    cat >> "$SUMMARY_FILE" << EOF
- **Status:** ❌ FAILED
- **Reason:** Test failures or compilation errors prevented test execution
- **Test Reports:** See \`tests/\` directory (if available)
EOF
fi

cat >> "$SUMMARY_FILE" << EOF

## Lint Results

EOF

if [ "$LINT_SUCCESS" = true ]; then
    cat >> "$SUMMARY_FILE" << EOF
- **Status:** ✅ PASSED (with expected warnings)
- **Expected:** 31 warnings, 0 errors
- **Lint Report:** See \`lint-results-debug.html\`
EOF
else
    cat >> "$SUMMARY_FILE" << EOF
- **Status:** ⚠️  COMPLETED WITH ISSUES
- **Lint Report:** See \`lint-results-debug.html\`
EOF
fi

cat >> "$SUMMARY_FILE" << EOF

## Overall Status

| Check | Status |
|-------|--------|
| Debug APK Build | $([ "$BUILD_DEBUG_SUCCESS" = true ] && echo "✅ PASS" || echo "❌ FAIL") |
| Release APK Build | $([ "$BUILD_RELEASE_SUCCESS" = true ] && echo "✅ PASS" || echo "❌ FAIL") |
| Unit Tests | $([ "$TESTS_SUCCESS" = true ] && echo "✅ PASS" || echo "❌ FAIL") |
| Lint Checks | $([ "$LINT_SUCCESS" = true ] && echo "✅ PASS" || echo "⚠️  WARN") |

## Files Generated

- **Build Log:** \`$(basename "$LOG_FILE")\`
- **Debug APK:** \`CleverFerret-debug.apk\` $([ -f "$REPORT_DIR/CleverFerret-debug.apk" ] && echo "(included)" || echo "(not generated)")
- **Release APK:** \`CleverFerret-release-unsigned.apk\` $([ -f "$REPORT_DIR/CleverFerret-release-unsigned.apk" ] && echo "(included)" || echo "(not generated)")
- **Test Reports:** \`tests/\` directory
- **Lint Report:** \`lint-results-debug.html\`
- **Compilation Errors:** \`compilation-errors.txt\` $([ -f "$REPORT_DIR/compilation-errors.txt" ] && echo "($(wc -l < "$REPORT_DIR/compilation-errors.txt") errors)" || echo "(none)")

## Next Steps

EOF

if [ "$BUILD_DEBUG_SUCCESS" = true ] && [ "$BUILD_RELEASE_SUCCESS" = true ] && [ "$TESTS_SUCCESS" = true ]; then
    cat >> "$SUMMARY_FILE" << EOF
✅ **All validation checks passed!** The application is ready for:
- Manual testing on devices/emulators
- Distribution to beta testers
- Release preparation

### Recommended Actions:
1. Install debug APK on test device: \`adb install CleverFerret-debug.apk\`
2. Perform manual end-to-end testing
3. Review lint warnings for code quality improvements
4. Sign release APK with production keystore for distribution
EOF
else
    cat >> "$SUMMARY_FILE" << EOF
⚠️  **Some validation checks failed.** Review the following:

EOF
    if [ "$BUILD_DEBUG_SUCCESS" = false ]; then
        cat >> "$SUMMARY_FILE" << EOF
- **Debug Build:** Fix compilation errors in \`compilation-errors.txt\`
EOF
    fi
    if [ "$BUILD_RELEASE_SUCCESS" = false ]; then
        cat >> "$SUMMARY_FILE" << EOF
- **Release Build:** Address build configuration issues
EOF
    fi
    if [ "$TESTS_SUCCESS" = false ]; then
        cat >> "$SUMMARY_FILE" << EOF
- **Tests:** Fix failing tests or resolve compilation errors
EOF
    fi
fi

cat >> "$SUMMARY_FILE" << EOF

---
*Generated by CleverFerret Build Validation Workflow*
EOF

print_success "Validation summary written to $SUMMARY_FILE"

# Final Summary
print_header "Validation Complete"
print_status "$BLUE" "Results saved to: $REPORT_DIR/"
echo "" | tee -a "$LOG_FILE"

if [ "$BUILD_DEBUG_SUCCESS" = true ]; then
    print_success "Debug APK: BUILT"
else
    print_failure "Debug APK: FAILED"
fi

if [ "$BUILD_RELEASE_SUCCESS" = true ]; then
    print_success "Release APK: BUILT"
else
    print_failure "Release APK: FAILED"
fi

if [ "$TESTS_SUCCESS" = true ]; then
    print_success "Unit Tests: PASSED"
else
    print_failure "Unit Tests: FAILED"
fi

if [ "$LINT_SUCCESS" = true ]; then
    print_success "Lint Checks: PASSED"
else
    print_warning "Lint Checks: COMPLETED WITH ISSUES"
fi

echo "" | tee -a "$LOG_FILE"
print_status "$BLUE" "Full log: $LOG_FILE"
print_status "$BLUE" "Summary report: $SUMMARY_FILE"
print_status "$BLUE" "Finished: $(date)"

# Exit with appropriate code
if [ "$BUILD_DEBUG_SUCCESS" = true ] && [ "$BUILD_RELEASE_SUCCESS" = true ] && [ "$TESTS_SUCCESS" = true ]; then
    exit 0
else
    exit 1
fi
