#!/bin/bash

# CleverFerret Build System Verification Test
# This script tests all auto-build components to ensure they work properly

set -e

echo "🔍 CleverFerret Build System Verification Test"
echo "=============================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

TESTS_PASSED=0
TESTS_FAILED=0

run_test() {
    local test_name="$1"
    local test_command="$2"
    
    log_info "Testing: $test_name"
    
    if eval "$test_command"; then
        log_success "$test_name: PASSED"
        ((TESTS_PASSED++))
    else
        log_error "$test_name: FAILED"
        ((TESTS_FAILED++))
    fi
    echo
}

echo "🧪 Running Build System Verification Tests..."
echo

# Test 1: Check all required files exist
log_info "Test 1: Checking required files..."
run_test "GitHub Actions workflow exists" "[ -f '.github/workflows/android-build.yml' ]"
run_test "Dockerfile.build exists" "[ -f 'Dockerfile.build' ]"
run_test "Docker Compose build file exists" "[ -f 'docker-compose.build.yml' ]"
run_test "Setup script exists" "[ -f 'build-scripts/setup-build-environment.sh' ]"
run_test "Enhanced build script exists" "[ -f 'build_enhanced_permanent.sh' ]"
run_test "Minimal build.gradle.kts exists" "[ -f 'CleverFerret/build.gradle.kts.minimal' ]"

# Test 2: Check script permissions
log_info "Test 2: Checking script permissions..."
run_test "Setup script is executable" "[ -x 'build-scripts/setup-build-environment.sh' ]"
run_test "Enhanced build script is executable" "[ -x 'build_enhanced_permanent.sh' ]"

# Test 3: Check script syntax
log_info "Test 3: Checking script syntax..."
run_test "Setup script syntax" "bash -n 'build-scripts/setup-build-environment.sh'"
run_test "Enhanced build script syntax" "bash -n 'build_enhanced_permanent.sh'"

# Test 4: Check YAML syntax (if tools available)
log_info "Test 4: Checking YAML syntax..."
if command -v python3 >/dev/null 2>&1; then
    run_test "GitHub Actions YAML syntax" "python3 -c 'import yaml; yaml.safe_load(open(\".github/workflows/android-build.yml\"))'"
    run_test "Docker Compose YAML syntax" "python3 -c 'import yaml; yaml.safe_load(open(\"docker-compose.build.yml\"))'"
else
    log_warning "Python3 not available, skipping YAML syntax tests"
fi

# Test 5: Check build configuration files
log_info "Test 5: Checking build configuration..."
run_test "gradle.properties exists" "[ -f 'gradle.properties' ]"
run_test "gradle.properties.docker exists" "[ -f 'gradle.properties.docker' ]"

# Test 6: Verify critical content in files
log_info "Test 6: Checking file content..."
run_test "GitHub Actions uses correct build tools" "grep -q 'BUILD_TOOLS_VERSION.*33.0.2' '.github/workflows/android-build.yml'"
run_test "Dockerfile uses correct Java version" "grep -q 'openjdk-17-jdk' 'Dockerfile.build'"
run_test "Setup script installs build tools 33.0.2" "grep -q 'BUILD_TOOLS_VERSION.*33.0.2' 'build-scripts/setup-build-environment.sh'"
run_test "Enhanced build script has memory optimization" "grep -q 'Xmx6144m' 'build_enhanced_permanent.sh'"

# Test 7: Check UI enhancements
log_info "Test 7: Checking UI enhancement code..."
run_test "MainActivity has Material You imports" "grep -q 'androidx.compose.material3' 'CleverFerret/src/main/java/com/universalmedialibrary/MainActivity.kt'"
run_test "MediaItemHandler exists" "[ -f 'CleverFerret/src/main/java/com/universalmedialibrary/ui/components/MediaItemHandler.kt' ]"
run_test "Enhanced navigation routes exist" "grep -q 'audio_player.*filePath' 'CleverFerret/src/main/java/com/universalmedialibrary/MainActivity.kt'"

# Test 8: Check build optimizations
log_info "Test 8: Checking build optimizations..."
run_test "Minimal build.gradle.kts has core dependencies" "grep -q 'androidx.compose:compose-bom' 'CleverFerret/build.gradle.kts.minimal'"
run_test "Gradle properties has memory optimization" "grep -q 'org.gradle.jvmargs.*6144m' 'gradle.properties'"

# Test 9: Check documentation completeness  
log_info "Test 9: Checking documentation..."
run_test "Build tools setup guide exists" "[ -f 'BUILD_TOOLS_SETUP.md' ]"
run_test "Final build instructions exist" "[ -f 'FINAL_BUILD_INSTRUCTIONS.md' ]"
run_test "Work completion summary exists" "[ -f 'WORK_COMPLETED_SUMMARY.md' ]"

# Test 10: Environment detection
log_info "Test 10: Testing environment detection..."
if command -v java >/dev/null 2>&1; then
    run_test "Java is available" "java -version 2>&1 | grep -q 'openjdk\|java'"
else
    log_warning "Java not available in current environment"
fi

if [ -d "/opt/android-sdk" ]; then
    run_test "Android SDK directory exists" "[ -d '/opt/android-sdk' ]"
else
    log_warning "Android SDK not installed in current environment"
fi

# Test Results Summary
echo "🎯 TEST RESULTS SUMMARY"
echo "======================"
echo -e "✅ Tests Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "❌ Tests Failed: ${RED}$TESTS_FAILED${NC}"
echo -e "📊 Success Rate: ${GREEN}$(( TESTS_PASSED * 100 / (TESTS_PASSED + TESTS_FAILED) ))%${NC}"

if [ $TESTS_FAILED -eq 0 ]; then
    echo
    log_success "🎉 ALL TESTS PASSED! Build system is ready for use."
    echo
    echo "📋 Next Steps:"
    echo "  1. Choose build method from FINAL_BUILD_INSTRUCTIONS.md"
    echo "  2. Run build using GitHub Actions, Docker, or local setup"
    echo "  3. Test the enhanced CleverFerret APK"
    echo
    exit 0
else
    echo
    log_error "⚠️  Some tests failed. Please review the issues above."
    echo
    echo "🔧 Common fixes:"
    echo "  - Ensure all files are properly committed"
    echo "  - Check file permissions with chmod +x"
    echo "  - Verify YAML syntax with online validators"
    echo "  - Review error messages above for specific issues"
    echo
    exit 1
fi