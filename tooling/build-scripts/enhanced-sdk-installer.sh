#!/bin/bash

# 🚀 CleverFerret Enhanced SDK Installer
# Automatically detects and installs all required Android SDK components
# Handles licensing, platform detection, and environment setup

set -e  # Exit on any error

# Configuration
REQUIRED_BUILD_TOOLS="34.0.0"
REQUIRED_PLATFORMS="android-34"
REQUIRED_CMAKE="3.22.1"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }
log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

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
    if [ -d "$ANDROID_SDK_ROOT/build-tools/$REQUIRED_BUILD_TOOLS" ]; then
        SELECTED_BUILD_TOOLS="$REQUIRED_BUILD_TOOLS"
    elif [ -d "$ANDROID_SDK_ROOT/build-tools" ]; then
        SELECTED_BUILD_TOOLS="$(ls -1 "$ANDROID_SDK_ROOT/build-tools" 2>/dev/null | sort -V | tail -n1)"
    fi

    SELECTED_BUILD_TOOLS="${SELECTED_BUILD_TOOLS:-$REQUIRED_BUILD_TOOLS}"
}

# Platform detection
detect_platform() {
    local OS=$(uname -s | tr '[:upper:]' '[:lower:]')
    local ARCH=$(uname -m)
    
    case $OS in
        linux*)  
            case $ARCH in
                x86_64) echo "linux-x64" ;;
                aarch64|arm64) echo "linux-arm64" ;;
                *) echo "linux-x64" ;;  # Default fallback
            esac
            ;;
        darwin*) 
            case $ARCH in
                arm64) echo "macosx-arm64" ;;
                *) echo "macosx-x64" ;;
            esac
            ;;
        cygwin*|mingw*|msys*) echo "windows-x64" ;;
        *) echo "linux-x64" ;;  # Default fallback
    esac
}

# Check if Java is installed and correct version
check_java() {
    log_info "Checking Java installation..."
    
    if command -v java >/dev/null 2>&1; then
        local JAVA_VERSION=$(java -version 2>&1 | head -n1 | cut -d'"' -f2 | cut -d'.' -f1)
        if [ "$JAVA_VERSION" -ge 17 ]; then
            log_success "Java $JAVA_VERSION detected"
            return 0
        else
            log_warning "Java $JAVA_VERSION found, but Java 17+ required"
        fi
    fi
    
    log_info "Installing OpenJDK 17..."
    if command -v apt-get >/dev/null 2>&1; then
        apt-get update -qq
        apt-get install -y openjdk-17-jdk
    elif command -v yum >/dev/null 2>&1; then
        yum install -y java-17-openjdk-devel
    elif command -v brew >/dev/null 2>&1; then
        brew install openjdk@17
    else
        log_error "Cannot install Java automatically. Please install Java 17+ manually."
        exit 1
    fi
    
    # Set JAVA_HOME
    if [ -z "$JAVA_HOME" ]; then
        if [ -d "/usr/lib/jvm/java-17-openjdk-arm64" ]; then
            export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-arm64"
        elif [ -d "/usr/lib/jvm/java-17-openjdk-amd64" ]; then
            export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
        fi
        log_info "Set JAVA_HOME=$JAVA_HOME"
    fi
}

# Install Android SDK if not present
install_android_sdk() {
    if [ -d "$ANDROID_SDK_ROOT/cmdline-tools/latest" ]; then
        log_success "Android SDK already installed at $ANDROID_SDK_ROOT"
        return 0
    fi
    
    log_info "Installing Android SDK to $ANDROID_SDK_ROOT..."
    mkdir -p "$ANDROID_SDK_ROOT"
    cd "$ANDROID_SDK_ROOT"
    
    # Download appropriate command line tools
    local PLATFORM=$(detect_platform)
    local SDK_URL
    
    case $PLATFORM in
        linux-*)
            SDK_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
            ;;
        macosx-*)
            SDK_URL="https://dl.google.com/android/repository/commandlinetools-mac-11076708_latest.zip"
            ;;
        windows-*)
            SDK_URL="https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip"
            ;;
        *)
            SDK_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
            ;;
    esac
    
    log_info "Downloading SDK for platform: $PLATFORM"
    if command -v wget >/dev/null 2>&1; then
        wget -q "$SDK_URL" -O cmdline-tools.zip
    elif command -v curl >/dev/null 2>&1; then
        curl -sSL "$SDK_URL" -o cmdline-tools.zip
    else
        log_error "Neither wget nor curl found. Cannot download SDK."
        exit 1
    fi
    
    # Extract and organize
    unzip -q cmdline-tools.zip
    mkdir -p cmdline-tools/latest
    mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true
    rm -f cmdline-tools.zip
    
    log_success "Android SDK installed successfully"
}

# Accept SDK licenses
accept_licenses() {
    log_info "Accepting Android SDK licenses..."
    local SDKMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager"
    
    if [ ! -x "$SDKMANAGER" ]; then
        log_error "SDK Manager not found at $SDKMANAGER"
        exit 1
    fi
    
    # Accept all licenses non-interactively
    yes | "$SDKMANAGER" --licenses >/dev/null 2>&1 || true
    log_success "SDK licenses accepted"
}

# Install required SDK components
install_sdk_components() {
    log_info "Installing required SDK components..."
    local SDKMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager"
    
    # List of components to install
    local COMPONENTS=(
        "platforms;$REQUIRED_PLATFORMS"
        "build-tools;$REQUIRED_BUILD_TOOLS"
        "platform-tools"
        "cmake;$REQUIRED_CMAKE"
        "ndk;26.1.10909125"  # Latest stable NDK
    )
    
    for component in "${COMPONENTS[@]}"; do
        log_info "Installing $component..."
        "$SDKMANAGER" "$component" >/dev/null 2>&1 || {
            log_warning "Failed to install $component, continuing..."
        }
    done
    
    log_success "SDK components installed"
}

# Verify installation
verify_installation() {
    log_info "Verifying SDK installation..."
    
    # Check required directories exist
    local REQUIRED_DIRS=(
        "$ANDROID_SDK_ROOT/platforms/$REQUIRED_PLATFORMS"
        "$ANDROID_SDK_ROOT/build-tools/$REQUIRED_BUILD_TOOLS"
        "$ANDROID_SDK_ROOT/platform-tools"
    )
    
    for dir in "${REQUIRED_DIRS[@]}"; do
        if [ ! -d "$dir" ]; then
            log_error "Required directory missing: $dir"
            return 1
        fi
    done
    
    log_success "SDK installation verified"
}

# Set up environment variables
setup_environment() {
    log_info "Setting up environment variables..."
    select_build_tools_version
    
    export ANDROID_HOME="$ANDROID_SDK_ROOT"
    export ANDROID_SDK_ROOT="$ANDROID_SDK_ROOT"
    export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/build-tools/$SELECTED_BUILD_TOOLS:$PATH"
    
    # Create environment file for future use
    cat > /tmp/android_env.sh << EOF
# Android SDK Environment Variables
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export ANDROID_SDK_ROOT="$ANDROID_SDK_ROOT"
export PATH="\$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:\$ANDROID_SDK_ROOT/platform-tools:\$ANDROID_SDK_ROOT/build-tools/$SELECTED_BUILD_TOOLS:\$PATH"
EOF
    
    log_info "Environment variables set. Source /tmp/android_env.sh in your shell profile."
    log_success "Environment setup complete"
}

# Main installation function
main() {
    ANDROID_SDK_ROOT="$(resolve_android_sdk_root)"

    log_info "🚀 Starting CleverFerret Enhanced SDK Installation"
    log_info "Platform: $(detect_platform)"
    log_info "SDK Root: $ANDROID_SDK_ROOT"
    
    # Install required tools first
    if ! command -v unzip >/dev/null 2>&1; then
        log_info "Installing unzip..."
        if command -v apt-get >/dev/null 2>&1; then
            apt-get update -qq && apt-get install -y unzip wget
        fi
    fi
    
    # Run installation steps
    check_java
    install_android_sdk
    accept_licenses
    install_sdk_components
    verify_installation
    setup_environment
    
    log_success "🎉 CleverFerret SDK installation complete!"
    log_info "You can now run: cd /app && ./gradlew assembleDebug"
}

# Run if script is executed directly
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    main "$@"
fi
