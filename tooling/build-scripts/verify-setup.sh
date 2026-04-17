#!/bin/bash

# ==============================================================================
# CleverFerret Setup Verification Script for AI Assistants
# ==============================================================================
# 
# PURPOSE: Verify that the build environment is properly set up
# USAGE: ./tooling/build-scripts/verify-setup.sh
# 
# EXIT CODES:
# 0 = All checks passed (ready to build)
# 1 = Some checks failed (needs attention)
#
# AI-FRIENDLY: Clear success/failure indicators
# SUCCESS: "✅ All verification checks passed"
# FAILURE: "❌ Verification failed"
# ==============================================================================

set -e

# AI-FRIENDLY: Color codes for clear output
readonly GREEN='\033[0;32m'
readonly RED='\033[0;31m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m'

# AI-FRIENDLY: Logging functions with consistent format
log_info() {
    echo -e "${BLUE}[VERIFY]${NC} $1"
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

# AI-FRIENDLY: Test counters for final report
TESTS_PASSED=0
TESTS_FAILED=0

resolve_repo_root() {
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cd "$script_dir/../.." && pwd
}

resolve_os_default_sdk() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "$HOME/Library/Android/sdk"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        echo "${LOCALAPPDATA:-$HOME/AppData/Local}/Android/Sdk"
    else
        echo "$HOME/Android/Sdk"
    fi
}

resolve_android_sdk_root() {
    local repo_root os_default
    repo_root="$(resolve_repo_root)"
    os_default="$(resolve_os_default_sdk)"

    if [ -n "$ANDROID_HOME" ]; then
        echo "$ANDROID_HOME"
    elif [ -n "$ANDROID_SDK_ROOT" ]; then
        echo "$ANDROID_SDK_ROOT"
    elif [ -d "$repo_root/android-sdk" ]; then
        echo "$repo_root/android-sdk"
    else
        echo "$os_default"
    fi
}

select_build_tools_version() {
    local sdk_root="$1"
    local preferred_version="33.0.2"
    local selected_version=""

    if [ -d "$sdk_root/build-tools/$preferred_version" ]; then
        selected_version="$preferred_version"
    elif [ -d "$sdk_root/build-tools" ]; then
        selected_version="$(ls -1 "$sdk_root/build-tools" 2>/dev/null | sort -V | tail -n1)"
    fi

    echo "${selected_version:-$preferred_version}"
}

# AI-FRIENDLY: Test execution function
run_test() {
    local test_name="$1"
    local test_command="$2"
    local is_critical="${3:-true}"  # Default to critical
    
    log_info "Testing: $test_name"
    
    if eval "$test_command" >/dev/null 2>&1; then
        log_success "$test_name"
        ((TESTS_PASSED++))
        return 0
    else
        if [ "$is_critical" = "true" ]; then
            log_error "$test_name (CRITICAL)"
            ((TESTS_FAILED++))
        else
            log_warning "$test_name (NON-CRITICAL)"
        fi
        return 1
    fi
}

echo "🔍 CleverFerret Build Environment Verification"
echo "=============================================="
echo

RESOLVED_ANDROID_SDK_ROOT="$(resolve_android_sdk_root)"
RESOLVED_BUILD_TOOLS_VERSION="$(select_build_tools_version "$RESOLVED_ANDROID_SDK_ROOT")"
export ANDROID_HOME="$RESOLVED_ANDROID_SDK_ROOT"
export ANDROID_SDK_ROOT="$RESOLVED_ANDROID_SDK_ROOT"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$RESOLVED_BUILD_TOOLS_VERSION:$PATH"

log_info "Resolved Android SDK root: $RESOLVED_ANDROID_SDK_ROOT"
log_info "Resolved build-tools version: $RESOLVED_BUILD_TOOLS_VERSION"

# AI-FRIENDLY: Test 1 - Java Installation
log_info "1. Checking Java installation..."
run_test "Java 17 installed" "java -version 2>&1 | grep -q '17'"
run_test "Java executable available" "command -v java"

# AI-FRIENDLY: Test 2 - Android SDK
log_info "2. Checking Android SDK..."
run_test "ANDROID_HOME set" "[ -n \"\$ANDROID_HOME\" ]"
run_test "Android SDK directory exists" "[ -d \"$RESOLVED_ANDROID_SDK_ROOT\" ]"
run_test "Command line tools available" "[ -f \"$RESOLVED_ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager\" ]"

# AI-FRIENDLY: Test 3 - Build Tools  
log_info "3. Checking build tools..."
run_test "Build tools $RESOLVED_BUILD_TOOLS_VERSION installed" "[ -d \"$RESOLVED_ANDROID_SDK_ROOT/build-tools/$RESOLVED_BUILD_TOOLS_VERSION\" ]"
run_test "AAPT2 executable" "[ -x \"$RESOLVED_ANDROID_SDK_ROOT/build-tools/$RESOLVED_BUILD_TOOLS_VERSION/aapt2\" ]"
run_test "AAPT2 working" "\"$RESOLVED_ANDROID_SDK_ROOT/build-tools/$RESOLVED_BUILD_TOOLS_VERSION/aapt2\" version"

# AI-FRIENDLY: Test 4 - Platform Tools
log_info "4. Checking platform tools..."
run_test "Platform 34 installed" "[ -d \"$RESOLVED_ANDROID_SDK_ROOT/platforms/android-34\" ]"
run_test "Platform tools available" "[ -d \"$RESOLVED_ANDROID_SDK_ROOT/platform-tools\" ]"

# AI-FRIENDLY: Test 5 - Configuration Files
log_info "5. Checking configuration files..."
run_test "local.properties exists" "[ -f \"local.properties\" ]"
run_test "gradle.properties exists" "[ -f \"gradle.properties\" ]"
run_test "local.properties has SDK path" "grep -q \"sdk.dir\" local.properties"
run_test "gradle.properties has memory config" "grep -q \"Xmx6144m\" gradle.properties"

# AI-FRIENDLY: Test 6 - Build Scripts
log_info "6. Checking build scripts..."
run_test "Main build script exists" "[ -f \"build_enhanced_permanent.sh\" ]"
run_test "Main build script executable" "[ -x \"build_enhanced_permanent.sh\" ]"
run_test "Setup script exists" "[ -f \"tooling/build-scripts/setup-build-environment.sh\" ]"
run_test "AI setup script exists" "[ -f \"tooling/build-scripts/ai-auto-setup.sh\" ]"

# AI-FRIENDLY: Test 7 - Debug Keystore
log_info "7. Checking debug keystore..."
run_test "Debug keystore exists" "[ -f \"\$HOME/.android/debug.keystore\" ]"

# AI-FRIENDLY: Test 8 - Project Structure
log_info "8. Checking project structure..."
run_test "CleverFerret module exists" "[ -d \"CleverFerret\" ]"
run_test "Main build.gradle.kts exists" "[ -f \"CleverFerret/build.gradle.kts\" ]"
run_test "Minimal build.gradle.kts exists" "[ -f \"CleverFerret/build.gradle.kts.minimal\" ]"
run_test "MainActivity.kt exists" "[ -f \"CleverFerret/src/main/java/com/universalmedialibrary/MainActivity.kt\" ]"

# AI-FRIENDLY: Test 9 - System Resources  
log_info "9. Checking system resources..."
if command -v free >/dev/null 2>&1; then
    AVAILABLE_MEM=$(free -m | awk 'NR==2{printf "%.0f", $7}')
    if [ "$AVAILABLE_MEM" -gt 4096 ]; then
        log_success "Sufficient memory available: ${AVAILABLE_MEM}MB"
        ((TESTS_PASSED++))
    else
        log_warning "Limited memory available: ${AVAILABLE_MEM}MB (minimum 4GB recommended)"
    fi
else
    log_warning "Cannot check memory (macOS/Windows)"
fi

run_test "Disk space available" "df . | awk 'NR==2 {exit (\$4<2000000) ? 1 : 0}'" false

# AI-FRIENDLY: Test 10 - Environment Variables
log_info "10. Checking environment variables..."
run_test "ANDROID_HOME in PATH" "echo \$PATH | grep -q \$ANDROID_HOME"
run_test "Build tools in PATH" "echo \$PATH | grep -q \"build-tools/$RESOLVED_BUILD_TOOLS_VERSION\""

echo
echo "📊 VERIFICATION SUMMARY"
echo "======================"
echo -e "✅ Tests Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "❌ Tests Failed: ${RED}$TESTS_FAILED${NC}"

if [ $TESTS_FAILED -eq 0 ]; then
    echo
    log_success "All verification checks passed"
    echo
    echo "🎯 READY TO BUILD!"
    echo "=================="
    echo "Your CleverFerret build environment is properly configured."
    echo
    echo "📋 Next steps for AI:"
    echo "1. Run: ./build_enhanced_permanent.sh"
    echo "2. Wait for build completion (5-15 minutes)"
    echo "3. Check builds/ directory for APK file"
    echo "4. Install APK on Android device for testing"
    echo
    exit 0
else
    echo
    log_error "Verification failed"
    echo
    echo "🔧 ISSUES FOUND"
    echo "==============="
    echo "Some components are missing or misconfigured."
    echo
    echo "📋 Recommended fixes for AI:"
    echo "1. Re-run setup: ./tooling/build-scripts/ai-auto-setup.sh"
    echo "2. Check error messages above for specific issues"
    echo "3. Confirm SDK path is valid: $RESOLVED_ANDROID_SDK_ROOT"
    echo "4. Ensure internet connection, sufficient disk space, and permissions"
    echo
    echo "❌ Verification failed"
    exit 1
fi
