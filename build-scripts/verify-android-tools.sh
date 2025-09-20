#!/bin/bash

# Android Tools Verification Script
# Verifies all android-tools installations and compatibility

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ANDROID_TOOLS_DIR="$PROJECT_ROOT/android-tools"

# Color output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Verify tool functionality
verify_tool() {
    local tool_path="$1"
    local tool_name="$2"
    local arch="$3"
    
    if [ ! -f "$tool_path" ]; then
        log_error "$tool_name not found for $arch: $tool_path"
        return 1
    fi
    
    if [ ! -x "$tool_path" ]; then
        log_warning "$tool_name not executable for $arch, fixing..."
        chmod +x "$tool_path"
    fi
    
    # Test tool execution (basic version check)
    if timeout 5 "$tool_path" version &>/dev/null || timeout 5 "$tool_path" —help &>/dev/null || timeout 5 "$tool_path" &>/dev/null; then
        log_success "$tool_name working for $arch"
        return 0
    else
        log_error "$tool_name execution failed for $arch"
        return 1
    fi
}

# Verify architecture support
verify_architecture_support() {
    local android_version="$1"
    local arch="$2"
    
    log_info "Verifying $arch support in $android_version..."
    
    local tools_base="$ANDROID_TOOLS_DIR/build/$android_version"
    local arch_supported=false
    local tools_verified=0
    local tools_failed=0
    
    # Check AAPT2 (most critical)
    local aapt2_path="$tools_base/aapt2/$arch/bin/aapt2"
    if verify_tool "$aapt2_path" "AAPT2" "$arch"; then
        tools_verified=$((tools_verified + 1))
        arch_supported=true
    else
        tools_failed=$((tools_failed + 1))
    fi
    
    # Check AAPT
    local aapt_path="$tools_base/aapt/$arch/bin/aapt"
    if verify_tool "$aapt_path" "AAPT" "$arch"; then
        tools_verified=$((tools_verified + 1))
    else
        tools_failed=$((tools_failed + 1))
    fi
    
    # Check other tools if they exist
    for tool_dir in "$tools_base"/*; do
        if [ -d "$tool_dir" ]; then
            local tool_name=$(basename "$tool_dir")
            if [ "$tool_name" != "aapt" ] && [ "$tool_name" != "aapt2" ]; then
                local tool_path="$tool_dir/$arch/bin/$tool_name"
                if [ -f "$tool_path" ]; then
                    if verify_tool "$tool_path" "$tool_name" "$arch"; then
                        tools_verified=$((tools_verified + 1))
                    else
                        tools_failed=$((tools_failed + 1))
                    fi
                fi
            fi
        fi
    done
    
    log_info "$arch summary: $tools_verified verified, $tools_failed failed"
    
    if [ "$arch_supported" = true ]; then
        return 0
    else
        return 1
    fi
}

# Main verification
main() {
    log_info "Starting Android Tools verification..."
    
    if [ ! -d "$ANDROID_TOOLS_DIR" ]; then
        log_error "Android tools directory not found: $ANDROID_TOOLS_DIR"
        exit 1
    fi
    
    local android_versions=("android-11.0.0_r33" "android-9.0.0_r33")
    local architectures=("arm64-v8a" "armeabi-v7a" "x86_64" "x86")
    
    local total_verified=0
    local total_failed=0
    
    for version in "${android_versions[@]}"; do
        if [ -d "$ANDROID_TOOLS_DIR/build/$version" ]; then
            log_info "Checking $version..."
            
            for arch in "${architectures[@]}"; do
                if verify_architecture_support "$version" "$arch"; then
                    total_verified=$((total_verified + 1))
                else
                    total_failed=$((total_failed + 1))
                fi
            done
        else
            log_warning "$version not found"
        fi
    done
    
    echo ""
    log_info "VERIFICATION SUMMARY:"
    log_info "Total architecture combinations verified: $total_verified"
    log_info "Total architecture combinations failed: $total_failed"
    
    if [ $total_verified -gt 0 ]; then
        log_success "Android tools verification completed with working configurations"
        
        # Show recommended setup
        echo ""
        log_info "RECOMMENDED SETUP:"
        log_info "Run: ./build-scripts/android-tools-setup.sh"
        log_info "Then: ./gradlew assembleDebug"
        
        exit 0
    else
        log_error "No working Android tools configurations found"
        exit 1
    fi
}

main "$@"