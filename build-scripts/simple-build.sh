#!/bin/bash

# Simple CleverFerret Build Script with Android Tools Fix
# Automatically fixes AAPT2 architecture issues and builds the app

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Color output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Detect architecture
detect_arch() {
    case "$(uname -m)" in
        aarch64|arm64) echo "arm64-v8a" ;;
        x86_64) echo "x86_64" ;;
        armv7l|armhf) echo "armeabi-v7a" ;;
        i386|i686) echo "x86" ;;
        *) echo "x86_64" ;;
    esac
}

# Fix AAPT2 compatibility
fix_aapt2() {
    local arch=$(detect_arch)
    log_info "Fixing AAPT2 for architecture: $arch"
    
    # Find compatible AAPT2
    local aapt2_source="$PROJECT_ROOT/modern-android-tools/termux-aapt/prebuilt-binary/$arch/aapt2"
    
    if [[ ! -f "$aapt2_source" ]]; then
        log_error "AAPT2 not found for $arch"
        return 1
    fi
    
    # Replace cached AAPT2 binaries
    local count=0
    while IFS= read -r -d '' cached_aapt2; do
        if [[ -f "$cached_aapt2" ]]; then
            # Backup original
            [[ ! -f "$cached_aapt2.original" ]] && cp "$cached_aapt2" "$cached_aapt2.original"
            
            # Replace with compatible version
            cp "$aapt2_source" "$cached_aapt2"
            chmod +x "$cached_aapt2"
            ((count++))
        fi
    done < <(find ~/.gradle/caches -name "aapt2" -type f -print0 2>/dev/null)
    
    log_success "Fixed $count AAPT2 binaries for $arch"
}

# Setup environment
setup_env() {
    export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-17-openjdk-arm64}
    export ANDROID_HOME=${ANDROID_HOME:-/opt/android-sdk}
    export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
    export GRADLE_OPTS="-Xmx4g -XX:MaxMetaspaceSize=1g -XX:+UseG1GC"
}

# Build application
build_app() {
    local build_type="${1:-debug}"
    
    log_info "Building CleverFerret ($build_type)"
    
    cd "$PROJECT_ROOT"
    
    # Fix AAPT2 first
    fix_aapt2
    
    # Clean and build
    if ./gradlew clean assemble$(echo $build_type | sed 's/.*/\u&/') --no-daemon --parallel; then
        log_success "Build completed successfully!"
        
        # Find APKs
        find . -name "*.apk" -type f | while read apk; do
            log_success "APK: $apk ($(du -h "$apk" | cut -f1))"
        done
    else
        log_error "Build failed!"
        return 1
    fi
}

# Main function
main() {
    local action="${1:-build}"
    local build_type="${2:-debug}"
    
    case "$action" in
        "info")
            echo "Architecture: $(detect_arch)"
            echo "Android Tools: $([ -d android-tools ] && echo "Available" || echo "Missing")"
            ;;
        "fix")
            setup_env
            fix_aapt2
            ;;
        "build"|*)
            setup_env
            build_app "$build_type"
            ;;
    esac
}

main "$@"