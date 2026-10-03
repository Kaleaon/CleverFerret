#!/bin/bash

# ==============================================================================
# CleverFerret Build System Test Script for AI Assistants
# ==============================================================================
# 
# PURPOSE: Test the build system without doing a full compilation
# USAGE: ./tooling/build-scripts/test-build-system.sh
# 
# This script will:
# 1. Test Gradle wrapper functionality
# 2. Verify dependency resolution
# 3. Check build configuration
# 4. Test signing capabilities
# 5. Provide clear pass/fail results for AI
#
# EXIT CODES:
# 0 = Build system is working (ready for full build)
# 1 = Build system has issues (needs attention)
# ==============================================================================

set -e

# Load canonical Android SDK version configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=tooling/build-scripts/android-sdk-versions.sh
source "$SCRIPT_DIR/android-sdk-versions.sh"

# AI-FRIENDLY: Color codes and logging
readonly GREEN='\033[0;32m'
readonly RED='\033[0;31m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m'

log_info() {
    echo -e "${BLUE}[TEST]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[PASS]${NC} ✅ $1"
}

log_warning() {
    echo -e "${YELLOW}[WARN]${NC} ⚠️  $1"
}

log_error() {
    echo -e "${RED}[FAIL]${NC} ❌ $1"
}

# AI-FRIENDLY: Test counter
TESTS_PASSED=0
TESTS_FAILED=0

# AI-FRIENDLY: Test runner function
run_test() {
    local test_name="$1"
    local test_command="$2"
    
    log_info "Testing: $test_name"
    
    if eval "$test_command" >/dev/null 2>&1; then
        log_success "$test_name"
        ((TESTS_PASSED++))
        return 0
    else
        log_error "$test_name"
        ((TESTS_FAILED++))
        return 1
    fi
}

echo "🧪 CleverFerret Build System Test"
echo "=================================="
echo

# AI-FRIENDLY: Set up environment
export ANDROID_HOME=${ANDROID_HOME:-/opt/android-sdk}
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/build-tools/$CF_BUILD_TOOLS_VERSION

# AI-FRIENDLY: Test 1 - Gradle Wrapper
log_info "1. Testing Gradle wrapper..."
run_test "Gradle wrapper exists" "[ -f './gradlew' ]"
run_test "Gradle wrapper executable" "[ -x './gradlew' ]"
run_test "Gradle version check" "./gradlew --version | head -5"

# AI-FRIENDLY: Test 2 - Build Configuration
log_info "2. Testing build configuration..."
run_test "Gradle properties valid" "./gradlew properties | grep -q 'org.gradle.jvmargs'"
run_test "Android SDK detected" "./gradlew properties | grep -q 'android.sdkDirectory'"
run_test "Build tools available" "[ -f '$ANDROID_HOME/build-tools/$CF_BUILD_TOOLS_VERSION/aapt2' ]"

# AI-FRIENDLY: Test 3 - Project Structure
log_info "3. Testing project structure..."
run_test "Main module exists" "[ -d 'CleverFerret' ]"
run_test "Build gradle exists" "[ -f 'CleverFerret/build.gradle.kts' ]"
run_test "Android manifest exists" "[ -f 'CleverFerret/src/main/AndroidManifest.xml' ]"

# AI-FRIENDLY: Test 4 - Dependency Resolution (lightweight test)
log_info "4. Testing dependency resolution..."

run_test "Dependency resolution" "timeout 120s ./gradlew --no-daemon dependencies | head -10"
run_test "Build tasks available" "./gradlew --no-daemon tasks | grep -q 'assembleDebug'"

# AI-FRIENDLY: Test 5 - Signing Test
log_info "5. Testing APK signing capability..."
run_test "Debug keystore exists" "[ -f '$HOME/.android/debug.keystore' ]"
run_test "APK signer available" "[ -f '$ANDROID_HOME/build-tools/$CF_BUILD_TOOLS_VERSION/apksigner' ]"

# Create a dummy APK to test signing (if previous APK exists)
if [ -f "builds/universal-media-library-v1.0-signed.apk" ]; then
    log_info "Testing signing with existing APK..."
    run_test "APK signature verification" "$ANDROID_HOME/build-tools/$CF_BUILD_TOOLS_VERSION/apksigner verify builds/universal-media-library-v1.0-signed.apk"
else
    log_warning "No existing APK found for signature testing"
fi

# AI-FRIENDLY: Test 6 - Memory and Performance
log_info "6. Testing memory configuration..."
run_test "Gradle memory config" "grep -q 'Xmx6144m' gradle.properties"
run_test "Parallel processing enabled" "grep -q 'org.gradle.parallel=true' gradle.properties"
run_test "Build cache enabled" "grep -q 'org.gradle.caching=true' gradle.properties"

# AI-FRIENDLY: Test 7 - Clean Operation
log_info "7. Testing clean operation..."
run_test "Clean task works" "timeout 60s ./gradlew --no-daemon clean"

echo
echo "📊 BUILD SYSTEM TEST SUMMARY"
echo "============================"
echo -e "✅ Tests Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "❌ Tests Failed: ${RED}$TESTS_FAILED${NC}"

if [ $TESTS_FAILED -eq 0 ]; then
    echo
    log_success "Build system is working correctly"
    echo
    echo "🎯 READY FOR FULL BUILD!"
    echo "========================"
    echo "All build system components are functioning properly."
    echo
    echo "📋 Next steps for AI:"
    echo "1. Run full build: ./tooling/build-scripts/build-cleverferret.sh"
    echo "2. Expected build time: 5-15 minutes"
    echo "3. Look for APK in builds/ directory"
    echo "4. APK should be ~17MB and properly signed"
    echo
    echo "✅ Build system test passed"
    exit 0
else
    echo
    log_error "Build system has issues"
    echo
    echo "🔧 ISSUES DETECTED"
    echo "=================="
    echo "Some build system components are not working correctly."
    echo
    echo "📋 Recommended fixes for AI:"
    echo "1. Check error messages above"
    echo "2. Verify Android SDK installation"
    echo "3. Ensure all dependencies are available"
    echo "4. Re-run setup if necessary: ./tooling/build-scripts/ai-auto-setup.sh"
    echo "5. Check system resources (memory, disk space)"
    echo
    echo "❌ Build system test failed"
    exit 1
fi
