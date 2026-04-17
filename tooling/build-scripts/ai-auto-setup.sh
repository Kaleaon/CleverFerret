#!/bin/bash

# ==============================================================================
# CleverFerret AI Auto-Setup Script
# ==============================================================================
# 
# PURPOSE: Fully automated setup for AI assistants (Jules, Copilot, Claude, etc.)
# USAGE: chmod +x tooling/build-scripts/ai-auto-setup.sh && ./tooling/build-scripts/ai-auto-setup.sh
# 
# This script will:
# 1. Detect the operating system automatically
# 2. Install all required dependencies (Java 17, Android SDK)  
# 3. Configure the build environment optimally
# 4. Verify everything is working correctly
# 5. Provide clear success/failure feedback for AI interpretation
#
# EXIT CODES:
# 0 = Success (all setup completed)
# 1 = Failure (setup incomplete, check error messages)
#
# SUCCESS INDICATOR: "✅ Setup completed successfully"
# FAILURE INDICATOR: "❌ Setup failed"
# ==============================================================================

set -e  # Exit on any error for AI error handling

# AI-FRIENDLY: Color codes for clear output interpretation
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# AI-FRIENDLY: Clear logging functions with consistent format
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} ✅ $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} ⚠️  $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} ❌ $1"
}

# AI-FRIENDLY: Configuration constants that AI can easily understand
readonly REQUIRED_JAVA_VERSION="17"
readonly BUILD_TOOLS_VERSION="33.0.2"
readonly ANDROID_COMPILE_SDK="34"
readonly PROJECT_ROOT="$(pwd)"

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
    local os_default
    os_default="$(resolve_os_default_sdk)"

    if [ -n "$ANDROID_HOME" ]; then
        echo "$ANDROID_HOME"
    elif [ -n "$ANDROID_SDK_ROOT" ]; then
        echo "$ANDROID_SDK_ROOT"
    elif [ -d "$PROJECT_ROOT/android-sdk" ]; then
        echo "$PROJECT_ROOT/android-sdk"
    else
        echo "$os_default"
    fi
}

select_build_tools_version() {
    local sdk_root="$1"
    local selected_version=""

    if [ -d "$sdk_root/build-tools/$BUILD_TOOLS_VERSION" ]; then
        selected_version="$BUILD_TOOLS_VERSION"
    elif [ -d "$sdk_root/build-tools" ]; then
        selected_version="$(ls -1 "$sdk_root/build-tools" 2>/dev/null | sort -V | tail -n1)"
    fi

    echo "${selected_version:-$BUILD_TOOLS_VERSION}"
}

# AI-FRIENDLY: Platform detection with clear logic
detect_platform() {
    log_info "Detecting operating system..."
    
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        PLATFORM="linux"
        log_success "Platform detected: Linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        PLATFORM="macos"
        log_success "Platform detected: macOS"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        PLATFORM="windows"
        log_success "Platform detected: Windows (WSL/Cygwin)"
    else
        log_error "Unsupported platform: $OSTYPE"
        log_error "Supported platforms: Linux, macOS, Windows (WSL)"
        exit 1
    fi
}

# AI-FRIENDLY: Java installation with error handling
install_java() {
    log_info "Checking Java $REQUIRED_JAVA_VERSION installation..."
    
    # Check if Java 17 is already installed
    if java -version 2>&1 | grep -q "openjdk version \"17"; then
        log_success "Java 17 already installed"
        return 0
    fi
    
    log_info "Installing Java $REQUIRED_JAVA_VERSION..."
    
    case $PLATFORM in
        "linux")
            # AI-FRIENDLY: Handle both interactive and non-interactive environments
            export DEBIAN_FRONTEND=noninteractive
            sudo apt-get update -qq
            sudo apt-get install -y openjdk-17-jdk
            ;;
        "macos")
            if command -v brew >/dev/null 2>&1; then
                brew install openjdk@17
                # AI-FRIENDLY: Set JAVA_HOME for macOS with Homebrew
                export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
            else
                log_error "Homebrew not found. Please install Homebrew first:"
                log_error "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
                exit 1
            fi
            ;;
        "windows")
            log_error "Please install Java 17 manually on Windows:"
            log_error "Download from: https://adoptium.net/temurin/releases/"
            exit 1
            ;;
    esac
    
    # AI-FRIENDLY: Verify Java installation with clear success/failure
    if java -version 2>&1 | grep -q "17"; then
        log_success "Java $REQUIRED_JAVA_VERSION installed successfully"
    else
        log_error "Java installation failed or wrong version"
        exit 1
    fi
}

# AI-FRIENDLY: Android SDK installation with step-by-step logging
install_android_sdk() {
    log_info "Setting up Android SDK at $RESOLVED_ANDROID_SDK_ROOT..."
    
    # AI-FRIENDLY: Check if SDK already exists
    if [ -d "$RESOLVED_ANDROID_SDK_ROOT" ] && [ -f "$RESOLVED_ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" ]; then
        log_success "Android SDK already installed"
    else
        log_info "Creating Android SDK directory..."
        mkdir -p "$RESOLVED_ANDROID_SDK_ROOT"
        
        log_info "Downloading Android Command Line Tools..."
        cd "$RESOLVED_ANDROID_SDK_ROOT"
        
        # AI-FRIENDLY: Platform-specific download URLs
        case $PLATFORM in
            "linux")
                SDK_URL="https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip"
                ;;
            "macos")
                SDK_URL="https://dl.google.com/android/repository/commandlinetools-mac-9477386_latest.zip"
                ;;
            "windows")
                SDK_URL="https://dl.google.com/android/repository/commandlinetools-win-9477386_latest.zip"
                ;;
        esac
        
        # AI-FRIENDLY: Download with error handling
        if ! curl -o cmdtools.zip "$SDK_URL"; then
            log_error "Failed to download Android Command Line Tools"
            exit 1
        fi
        
        log_info "Extracting command line tools..."
        if ! unzip -q cmdtools.zip; then
            log_error "Failed to extract command line tools"
            exit 1
        fi
        
        rm cmdtools.zip
        
        # AI-FRIENDLY: Create proper directory structure as expected by Android tools
        log_info "Setting up command line tools directory structure..."
        mkdir -p cmdline-tools/latest
        mv cmdline-tools/{bin,lib,source.properties,NOTICE.txt} cmdline-tools/latest/ 2>/dev/null || true
        
        log_success "Android Command Line Tools installed"
    fi
    
    # AI-FRIENDLY: Set environment variables with clear logging
    log_info "Configuring environment variables..."
    export ANDROID_HOME="$RESOLVED_ANDROID_SDK_ROOT"
    export ANDROID_SDK_ROOT="$RESOLVED_ANDROID_SDK_ROOT"
    SELECTED_BUILD_TOOLS_VERSION="$(select_build_tools_version "$ANDROID_HOME")"
    export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$SELECTED_BUILD_TOOLS_VERSION:$PATH"
    
    # AI-FRIENDLY: Install required SDK components with progress logging
    log_info "Installing Android SDK components..."
    
    # Install platforms
    log_info "Installing Android platform $ANDROID_COMPILE_SDK..."
    if ! yes | "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" --install "platforms;android-$ANDROID_COMPILE_SDK" --sdk_root="$ANDROID_HOME"; then
        log_error "Failed to install Android platform"
        exit 1
    fi
    
    # Install build tools (CRITICAL: Version 33.0.2 for compatibility)
    log_info "Installing build tools $BUILD_TOOLS_VERSION (compatible version)..."
    if ! yes | "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" --install "build-tools;$BUILD_TOOLS_VERSION" --sdk_root="$ANDROID_HOME"; then
        log_error "Failed to install build tools"
        exit 1
    fi
    
    # Install platform tools
    log_info "Installing platform tools..."
    if ! yes | "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" --install "platform-tools" --sdk_root="$ANDROID_HOME"; then
        log_error "Failed to install platform tools"
        exit 1
    fi
    
    # AI-FRIENDLY: Ensure AAPT2 is executable (critical for builds)
    log_info "Making build tools executable..."
    SELECTED_BUILD_TOOLS_VERSION="$(select_build_tools_version "$ANDROID_HOME")"
    chmod +x "$ANDROID_HOME/build-tools/$SELECTED_BUILD_TOOLS_VERSION"/* 2>/dev/null || true
    
    log_success "Android SDK setup completed"
}

# AI-FRIENDLY: Configuration file creation with validation
create_build_configuration() {
    log_info "Creating optimized build configuration..."
    
    # AI-FRIENDLY: Create local.properties with clear content
    log_info "Creating local.properties..."
    cat > "$PROJECT_ROOT/local.properties" << EOF
# Android SDK location (required for builds)
sdk.dir=$ANDROID_HOME
# Prevent automatic SDK downloads
android.builder.sdkDownload=false
EOF
    log_success "local.properties created"
    
    # AI-FRIENDLY: Create optimized gradle.properties
    log_info "Creating gradle.properties with memory optimizations..."
    cat > "$PROJECT_ROOT/gradle.properties" << EOF
# This property is required for any modern Android project using AndroidX.
android.useAndroidX=true

# This property is recommended for better build performance and correctness.
android.nonTransitiveRClass=true

# PERMANENT FIX: Optimized Gradle configuration for CleverFerret
# Memory allocation optimized for reliable builds (6GB heap)
org.gradle.jvmargs=-Xmx6144m -XX:MaxMetaspaceSize=2g -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError

# Performance optimizations for faster builds
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.configureondemand=true
org.gradle.daemon=false

# Android build optimizations
android.enableJetifier=true
android.incremental=true
android.builder.sdkDownload=false
android.enableBuildCache=true
EOF
    log_success "gradle.properties created with optimizations"
}

# AI-FRIENDLY: Debug keystore creation for APK signing
create_debug_keystore() {
    log_info "Creating debug keystore for APK signing..."
    
    local keystore_dir="$HOME/.android"
    local keystore_path="$keystore_dir/debug.keystore"
    
    # AI-FRIENDLY: Check if keystore already exists
    if [ -f "$keystore_path" ]; then
        log_success "Debug keystore already exists"
        return 0
    fi
    
    # AI-FRIENDLY: Create keystore directory
    mkdir -p "$keystore_dir"
    
    # AI-FRIENDLY: Generate debug keystore with known parameters
    log_info "Generating debug keystore..."
    if keytool -genkey -v -keystore "$keystore_path" -alias androiddebugkey \
               -keyalg RSA -keysize 2048 -validity 10000 \
               -storepass android -keypass android \
               -dname "CN=CleverFerret Debug,O=Universal Media Library,C=US"; then
        log_success "Debug keystore created successfully"
    else
        log_error "Failed to create debug keystore"
        exit 1
    fi
}

# AI-FRIENDLY: Comprehensive environment verification
verify_installation() {
    log_info "Verifying installation..."
    
    local verification_failed=false
    
    # AI-FRIENDLY: Check Java with clear success/failure
    log_info "Checking Java installation..."
    if java -version 2>&1 | grep -q "17"; then
        log_success "Java 17: $(java -version 2>&1 | head -1)"
    else
        log_error "Java 17 not found or wrong version"
        verification_failed=true
    fi
    
    # AI-FRIENDLY: Check Android SDK
    log_info "Checking Android SDK..."
    if [ -d "$ANDROID_HOME" ]; then
        log_success "Android SDK: $ANDROID_HOME"
    else
        log_error "Android SDK not found at $ANDROID_HOME"
        verification_failed=true
    fi
    
    # AI-FRIENDLY: Check build tools (critical for compilation)
    log_info "Checking build tools..."
    if [ -f "$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/aapt2" ]; then
        log_success "Build tools $BUILD_TOOLS_VERSION: Available"
        # AI-FRIENDLY: Test AAPT2 executable
        if "$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/aapt2" version >/dev/null 2>&1; then
            log_success "AAPT2 is working correctly"
        else
            log_error "AAPT2 is not executable"
            verification_failed=true
        fi
    else
        log_error "Build tools $BUILD_TOOLS_VERSION not found"
        verification_failed=true
    fi
    
    # AI-FRIENDLY: Check memory availability
    log_info "Checking system memory..."
    if command -v free >/dev/null 2>&1; then
        local available_mem=$(free -m | awk 'NR==2{printf "%.0f", $7}')
        if [ "$available_mem" -gt 6144 ]; then
            log_success "Available memory: ${available_mem}MB (sufficient for builds)"
        else
            log_warning "Available memory: ${available_mem}MB (may be insufficient, but will try)"
        fi
    elif command -v vm_stat >/dev/null 2>&1; then
        log_success "macOS memory management detected"
    else
        log_warning "Cannot check memory, assuming sufficient"
    fi
    
    # AI-FRIENDLY: Check configuration files
    log_info "Checking configuration files..."
    if [ -f "$PROJECT_ROOT/local.properties" ]; then
        log_success "local.properties: Created"
    else
        log_error "local.properties: Missing"
        verification_failed=true
    fi
    
    if [ -f "$PROJECT_ROOT/gradle.properties" ]; then
        log_success "gradle.properties: Created"
    else
        log_error "gradle.properties: Missing"
        verification_failed=true
    fi
    
    # AI-FRIENDLY: Return verification result
    if [ "$verification_failed" = true ]; then
        log_error "Verification failed - setup incomplete"
        return 1
    else
        log_success "All verification checks passed"
        return 0
    fi
}

# AI-FRIENDLY: Make scripts executable
make_scripts_executable() {
    log_info "Making build scripts executable..."
    
    # AI-FRIENDLY: List of scripts that need execute permissions
    local scripts=(
        "build_enhanced_permanent.sh"
        "tooling/build-scripts/setup-build-environment.sh"
        "tooling/build-scripts/ai-auto-setup.sh"
    )
    
    for script in "${scripts[@]}"; do
        if [ -f "$PROJECT_ROOT/$script" ]; then
            chmod +x "$PROJECT_ROOT/$script"
            log_success "Made executable: $script"
        else
            log_warning "Script not found: $script"
        fi
    done
}

# AI-FRIENDLY: Create environment setup file for future use
create_environment_file() {
    log_info "Creating environment setup file..."
    
    cat > "$PROJECT_ROOT/setup-environment.sh" << EOF
#!/bin/bash
# CleverFerret Environment Setup
# Source this file to set up environment variables

export ANDROID_HOME="$RESOLVED_ANDROID_SDK_ROOT"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export JAVA_HOME=\${JAVA_HOME:-\$(readlink -f /usr/bin/java | sed "s:bin/java::")}
export PATH="\$ANDROID_HOME/cmdline-tools/latest/bin:\$ANDROID_HOME/platform-tools:\$ANDROID_HOME/build-tools/$SELECTED_BUILD_TOOLS_VERSION:\$PATH"

echo "✅ CleverFerret environment variables set"
echo "ANDROID_HOME: \$ANDROID_HOME"
echo "JAVA_HOME: \$JAVA_HOME"
EOF
    
    chmod +x "$PROJECT_ROOT/setup-environment.sh"
    log_success "Environment setup file created: setup-environment.sh"
}

# AI-FRIENDLY: Main execution function with clear flow
main() {
    echo "🤖 CleverFerret AI Auto-Setup Script"
    echo "===================================="
    echo "Setting up build environment for AI assistants..."
    echo
    
    # AI-FRIENDLY: Check if running as root (not recommended)
    if [ "$EUID" -eq 0 ]; then
        log_warning "Running as root. This may cause permission issues."
        log_warning "Consider running as a regular user with sudo access."
    fi
    
    # AI-FRIENDLY: Execute setup steps with error handling
    detect_platform
    RESOLVED_ANDROID_SDK_ROOT="$(resolve_android_sdk_root)"
    SELECTED_BUILD_TOOLS_VERSION="$BUILD_TOOLS_VERSION"
    log_info "Resolved Android SDK path: $RESOLVED_ANDROID_SDK_ROOT"
    install_java
    install_android_sdk
    create_build_configuration
    create_debug_keystore
    make_scripts_executable
    create_environment_file
    
    # AI-FRIENDLY: Final verification
    if verify_installation; then
        echo
        echo "🎉 CleverFerret Setup Completed Successfully!"
        echo "============================================"
        log_success "Java 17: Available"
        log_success "Android SDK: Installed at $RESOLVED_ANDROID_SDK_ROOT"
        log_success "Build Tools: $SELECTED_BUILD_TOOLS_VERSION"
        log_success "Environment: Configured"
        log_success "Scripts: Executable"
        log_success "Ready to build enhanced CleverFerret APK!"
        echo
        echo "📋 Next Steps for AI:"
        echo "1. Run: ./build_enhanced_permanent.sh"
        echo "2. Check: builds/ directory for APK"
        echo "3. Verify: APK installs on Android device"
        echo
        echo "✅ Setup completed successfully"
        exit 0
    else
        echo
        echo "❌ Setup Failed"
        echo "==============="
        log_error "Some components failed to install or configure properly"
        log_error "Check the error messages above and retry"
        echo
        echo "🔧 Troubleshooting:"
        echo "1. Ensure internet connection is available"
        echo "2. Check available disk space (need ~2GB)"
        echo "3. Verify SDK path: $RESOLVED_ANDROID_SDK_ROOT"
        echo "4. Verify system permissions"
        echo "5. Retry with: ./tooling/build-scripts/ai-auto-setup.sh"
        echo
        echo "❌ Setup failed"
        exit 1
    fi
}

# AI-FRIENDLY: Trap errors and provide helpful messages
trap 'log_error "Script interrupted or failed at line $LINENO. Check error messages above."' ERR

# AI-FRIENDLY: Execute main function
main "$@"
