#!/bin/bash

# Android Tools Architecture Detection and Setup Script
# Automatically configures the correct android-tools for the host architecture

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ANDROID_TOOLS_DIR="$PROJECT_ROOT/android-tools"

# Color output functions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Detect host architecture
detect_architecture() {
    local arch=$(uname -m)
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

# Verify android-tools installation
verify_android_tools() {
    if [ ! -d "$ANDROID_TOOLS_DIR/build" ]; then
        log_error "Android tools not found in $ANDROID_TOOLS_DIR"
        log_error "Please ensure android-tools are properly integrated"
        return 1
    fi
    
    log_success "Android tools found in $ANDROID_TOOLS_DIR"
    return 0
}

# Get best available android version
get_android_version() {
    local versions=(
        "android-11.0.0_r33"
        "android-9.0.0_r33"
    )
    
    for version in "${versions[@]}"; do
        if [ -d "$ANDROID_TOOLS_DIR/build/$version" ]; then
            echo "$version"
            return 0
        fi
    done
    
    log_error "No compatible Android tools version found"
    return 1
}

# Setup AAPT2 for architecture
setup_aapt2() {
    local arch="$1"
    local android_version="$2"
    
    local aapt2_path="$ANDROID_TOOLS_DIR/build/$android_version/aapt2/$arch/bin/aapt2"
    
    if [ ! -f "$aapt2_path" ]; then
        log_warning "AAPT2 not found for architecture $arch in $android_version"
        # Try fallback architectures
        local fallback_archs=("x86_64" "arm64-v8a" "armeabi-v7a" "x86")
        for fallback_arch in "${fallback_archs[@]}"; do
            if [ "$fallback_arch" != "$arch" ]; then
                local fallback_path="$ANDROID_TOOLS_DIR/build/$android_version/aapt2/$fallback_arch/bin/aapt2"
                if [ -f "$fallback_path" ]; then
                    log_info "Using fallback AAPT2: $fallback_arch"
                    aapt2_path="$fallback_path"
                    arch="$fallback_arch"
                    break
                fi
            fi
        done
    fi
    
    if [ ! -f "$aapt2_path" ]; then
        log_error "No compatible AAPT2 found for any architecture"
        return 1
    fi
    
    # Make executable
    chmod +x "$aapt2_path"
    
    # Set environment variables
    export CUSTOM_AAPT2_PATH="$aapt2_path"
    export CUSTOM_AAPT2_ARCH="$arch"
    export CUSTOM_ANDROID_VERSION="$android_version"
    
    log_success "AAPT2 configured: $aapt2_path"
    return 0
}

# Setup all tools for architecture
setup_all_tools() {
    local arch="$1"
    local android_version="$2"
    
    log_info "Setting up Android tools for architecture: $arch"
    
    # Setup AAPT2
    setup_aapt2 "$arch" "$android_version"
    
    # Setup other tools (AAPT, dex2oat, etc.)
    local tools_base="$ANDROID_TOOLS_DIR/build/$android_version"
    
    for tool_dir in "$tools_base"/*; do
        if [ -d "$tool_dir" ]; then
            local tool_name=$(basename "$tool_dir")
            local tool_arch_dir="$tool_dir/$arch"
            
            if [ -d "$tool_arch_dir" ]; then
                local tool_bin_dir="$tool_arch_dir/bin"
                if [ -d "$tool_bin_dir" ]; then
                    # Make all tools executable
                    find "$tool_bin_dir" -type f -exec chmod +x {} \;
                    
                    # Add to PATH
                    export PATH="$tool_bin_dir:$PATH"
                    
                    log_info "Added to PATH: $tool_name ($arch)"
                fi
            fi
        fi
    done
    
    log_success "All Android tools configured for $arch"
}

# Create gradle properties for android-tools
create_gradle_properties() {
    local arch="$1"
    local android_version="$2"
    
    local gradle_properties="$PROJECT_ROOT/gradle-android-tools.properties"
    
    cat > "$gradle_properties" << EOF
# Auto-generated Android Tools Configuration
# Generated on: $(date)
# Host Architecture: $arch
# Android Version: $android_version

# Custom AAPT2 Configuration
android.tools.custom.aapt2.path=$CUSTOM_AAPT2_PATH
android.tools.custom.aapt2.arch=$CUSTOM_AAPT2_ARCH
android.tools.custom.android.version=$CUSTOM_ANDROID_VERSION

# Architecture-specific tool paths
android.tools.base.path=$ANDROID_TOOLS_DIR/build/$android_version
android.tools.host.arch=$arch

# Build optimizations for android-tools
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.daemon=true
android.useAndroidX=true
android.enableJetifier=true

# AAPT2 optimization flags
android.enableR8.fullMode=false
android.enableBuildCache=true
EOF

    log_success "Gradle properties created: $gradle_properties"
}

# Main execution
main() {
    log_info "Starting Android Tools setup for CleverFerret..."
    
    # Verify installation
    if ! verify_android_tools; then
        exit 1
    fi
    
    # Detect architecture
    local host_arch=$(detect_architecture)
    log_info "Detected host architecture: $host_arch"
    
    # Get Android version
    local android_version=$(get_android_version)
    if [ $? -ne 0 ]; then
        exit 1
    fi
    log_info "Using Android tools version: $android_version"
    
    # Setup tools
    setup_all_tools "$host_arch" "$android_version"
    
    # Create gradle properties
    create_gradle_properties "$host_arch" "$android_version"
    
    log_success "Android Tools setup completed!"
    log_info "You can now build CleverFerret with architecture-specific tools"
    log_info "Run: ./gradlew assembleDebug"
}

# Execute main function
main "$@"