#!/bin/bash

# Universal CleverFerret Build Script
# Automatically detects architecture and builds with appropriate android-tools

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Color output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_header() { echo -e "${CYAN}[HEADER]${NC} $1"; }

# Banner
print_banner() {
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                     CLEVERFERRET                             ║"
    echo "║              Universal Build System                          ║"
    echo "║          Multi-Architecture Android Builder                  ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Architecture detection
detect_architecture() {
    local arch=$(uname -m)
    local os_name=$(uname -s)
    
    case $arch in
        x86_64)
            echo "x86_64"
            ;;
        aarch64|arm64)
            echo "arm64-v8a"
            ;;
        armv7l|armhf)
            echo "armeabi-v7a"
            ;;
        i386|i686)
            echo "x86"
            ;;
        *)
            log_warning "Unknown architecture: $arch, defaulting to x86_64"
            echo "x86_64"
            ;;
    esac
}

# Verify prerequisites
verify_prerequisites() {
    log_info "Verifying build prerequisites..."
    
    # Check Java
    if ! command -v java >/dev/null 2>&1; then
        log_error "Java not found. Please install OpenJDK 17"
        return 1
    fi
    
    local java_version=$(java -version 2>&1 | head -n1 | cut -d'"' -f2 | cut -d'.' -f1)
    if [ "$java_version" -lt 17 ]; then
        log_error "Java 17 or higher required. Found: $java_version"
        return 1
    fi
    
    # Check Android SDK
    if [ -z "$ANDROID_HOME" ]; then
        log_warning "ANDROID_HOME not set, trying default locations..."
        for path in "/opt/android-sdk" "$HOME/Android/Sdk" "/usr/local/android-sdk"; do
            if [ -d "$path" ]; then
                export ANDROID_HOME="$path"
                log_info "Found Android SDK: $ANDROID_HOME"
                break
            fi
        done
        
        if [ -z "$ANDROID_HOME" ]; then
            log_error "Android SDK not found. Please set ANDROID_HOME"
            return 1
        fi
    fi
    
    # Update PATH
    export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
    
    log_success "Prerequisites verified"
    return 0
}

# Display system information
show_system_info() {
    local host_arch=$(detect_architecture)
    
    log_header "SYSTEM INFORMATION"
    echo "OS: $(uname -s) $(uname -r)"
    echo "Architecture: $(uname -m) -> $host_arch"
    echo "Java: $(java -version 2>&1 | head -n1)"
    echo "Android SDK: ${ANDROID_HOME:-"Not set"}"
    
    # Android Tools status
    if [ -d "$PROJECT_ROOT/android-tools" ]; then
        log_success "Android Tools: Available"
        
        echo -e "\n🔧 Available AAPT2 Binaries:"
        for version in "android-11.0.0_r33" "android-9.0.0_r33"; do
            if [ -d "$PROJECT_ROOT/android-tools/build/$version" ]; then
                echo "  📦 $version:"
                for arch in "arm64-v8a" "armeabi-v7a" "x86_64" "x86"; do
                    local aapt2_path="$PROJECT_ROOT/android-tools/build/$version/aapt2/$arch/bin/aapt2"
                    if [ -f "$aapt2_path" ]; then
                        local status="✅"
                        local current=""
                        [ "$arch" = "$host_arch" ] && current=" (current)"
                        echo "    $status $arch$current"
                    else
                        echo "    ❌ $arch"
                    fi
                done
            fi
        done
    else
        log_warning "Android Tools: Not Available"
    fi
    
    echo ""
}

# Clean build environment
clean_build() {
    log_info "Cleaning build environment..."
    
    cd "$PROJECT_ROOT"
    
    # Clean gradle caches
    rm -rf .gradle/ build/ */build/
    rm -f *.log gradle-android-tools-runtime.properties
    
    # Clean gradle user cache selectively (keep downloads)
    if [ -d "$HOME/.gradle/caches" ]; then
        find "$HOME/.gradle/caches" -name "aapt2.original" -delete 2>/dev/null || true
        log_info "Cleaned gradle caches"
    fi
    
    log_success "Build environment cleaned"
}

# Build the application
build_app() {
    local build_type="${1:-debug}"
    local host_arch=$(detect_architecture)
    
    log_header "BUILDING CLEVERFERRET ($build_type)"
    log_info "Target Architecture: $host_arch"
    
    cd "$PROJECT_ROOT"
    
    # Set build environment
    export GRADLE_OPTS="-Xmx4g -XX:MaxMetaspaceSize=1g -XX:+UseG1GC"
    
    # Build command
    local gradle_cmd="./gradlew"
    local build_task
    
    case "$build_type" in
        "release")
            build_task="assembleRelease"
            ;;
        "debug"|*)
            build_task="assembleDebug"
            ;;
    esac
    
    log_info "Running: $gradle_cmd $build_task"
    
    # Execute build with proper error handling
    if $gradle_cmd clean $build_task \
        --parallel \
        --build-cache \
        --configuration-cache \
        --no-daemon \
        --stacktrace; then
        
        log_success "Build completed successfully!"
        
        # Find and report generated APKs
        find_and_report_apks "$build_type"
        
        return 0
    else
        log_error "Build failed!"
        return 1
    fi
}

# Find and report generated APKs
find_and_report_apks() {
    local build_type="$1"
    
    log_info "Searching for generated APKs..."
    
    local apk_count=0
    while IFS= read -r -d '' apk_file; do
        if [[ "$apk_file" == *"$build_type"* ]]; then
            local size=$(ls -lh "$apk_file" | awk '{print $5}')
            local arch=""
            
            # Determine architecture from filename
            case "$apk_file" in
                *arm64-v8a*) arch=" (ARM64)" ;;
                *armeabi-v7a*) arch=" (ARM32)" ;;
                *x86_64*) arch=" (x86_64)" ;;
                *x86*) arch=" (x86)" ;;
                *universal*) arch=" (Universal)" ;;
            esac
            
            log_success "📱 APK: $(basename "$apk_file") ($size)$arch"
            apk_count=$((apk_count + 1))
        fi
    done < <(find "$PROJECT_ROOT" -name "*.apk" -type f -print0)
    
    if [ $apk_count -eq 0 ]; then
        log_warning "No APK files found"
    else
        log_success "Generated $apk_count APK(s)"
    fi
}

# Test build environment
test_environment() {
    log_header "TESTING BUILD ENVIRONMENT"
    
    cd "$PROJECT_ROOT"
    
    # Test gradle configuration
    log_info "Testing Gradle configuration..."
    if ./gradlew architectureInfo --no-daemon; then
        log_success "Gradle configuration test passed"
    else
        log_error "Gradle configuration test failed"
        return 1
    fi
    
    # Test android tools configuration
    log_info "Testing Android Tools configuration..."
    if ./gradlew configureAndroidTools --no-daemon; then
        log_success "Android Tools configuration test passed"
    else
        log_error "Android Tools configuration test failed"
        return 1
    fi
    
    return 0
}

# Main function
main() {
    local action="${1:-build}"
    local build_type="${2:-debug}"
    
    print_banner
    
    case "$action" in
        "info"|"system-info")
            show_system_info
            ;;
        "clean")
            clean_build
            ;;
        "test"|"test-env")
            verify_prerequisites && test_environment
            ;;
        "build")
            verify_prerequisites && build_app "$build_type"
            ;;
        "full"|"full-build")
            verify_prerequisites && clean_build && build_app "$build_type"
            ;;
        "help"|"--help"|"-h")
            show_help
            ;;
        *)
            log_error "Unknown action: $action"
            show_help
            exit 1
            ;;
    esac
}

# Help function
show_help() {
    echo "Universal CleverFerret Build Script"
    echo ""
    echo "Usage: $0 [action] [build_type]"
    echo ""
    echo "Actions:"
    echo "  build        - Build the application (default)"
    echo "  full-build   - Clean and build"
    echo "  clean        - Clean build environment"
    echo "  test-env     - Test build environment"
    echo "  info         - Show system information"
    echo "  help         - Show this help"
    echo ""
    echo "Build Types:"
    echo "  debug        - Debug build (default)"
    echo "  release      - Release build"
    echo ""
    echo "Examples:"
    echo "  $0                    # Debug build"
    echo "  $0 build release      # Release build"
    echo "  $0 full-build         # Clean and debug build"
    echo "  $0 info               # Show system info"
    echo "  $0 test-env           # Test environment"
}

# Execute main function
main "$@"