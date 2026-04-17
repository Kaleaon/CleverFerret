#!/bin/bash
set -e

# CleverFerret Build Environment Setup Script
# Implements all permanent fixes for reliable Android builds
# Compatible with Ubuntu, macOS, and Windows (WSL)

echo "🚀 CleverFerret Build Environment Setup - Permanent Fix Edition"
echo "=============================================================="

# Load canonical Android SDK version configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=tooling/build-scripts/android-sdk-versions.sh
source "$SCRIPT_DIR/android-sdk-versions.sh"

# Configuration with permanent fixes
export BUILD_TOOLS_VERSION="$CF_BUILD_TOOLS_VERSION"
export COMPILE_SDK_VERSION="$CF_COMPILE_SDK"

# Auto-detect Android SDK location
# Priority: 1) Pre-set ANDROID_HOME, 2) Workspace/container, 3) Standard Android Studio
if [ -z "$ANDROID_HOME" ]; then
    if [ -d "/workspace/android-sdk" ]; then
        # Workspace/container environment
        export ANDROID_HOME="/workspace/android-sdk"
    elif [ -d "$HOME/Android/Sdk" ]; then
        # Standard Android Studio location
        export ANDROID_HOME="$HOME/Android/Sdk"
    else
        # Fallback to default path to let the build system provide a clear error
        export ANDROID_HOME="$HOME/Android/Sdk"
    fi
fi

export ANDROID_SDK_ROOT="$ANDROID_HOME"

export JAVA_VERSION="17"

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

# Detect operating system
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        OS="windows"
    else
        log_error "Unsupported operating system: $OSTYPE"
        exit 1
    fi
    log_info "Detected OS: $OS"
}

# Install Java 17 if not present
install_java() {
    log_info "Checking Java installation..."
    
    if java -version 2>&1 | grep -q "openjdk version \"17"; then
        log_success "Java 17 already installed"
        return
    fi
    
    log_warning "Java 17 not found. Installing..."
    
    case $OS in
        "linux")
            sudo apt-get update
            sudo apt-get install -y openjdk-17-jdk
            ;;
        "macos")
            if command -v brew >/dev/null 2>&1; then
                brew install openjdk@17
                export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
            else
                log_error "Homebrew not found. Please install Java 17 manually"
                exit 1
            fi
            ;;
        "windows")
            log_error "Please install Java 17 manually on Windows"
            exit 1
            ;;
    esac
    
    java -version && log_success "Java 17 installed successfully"
}

# Install Android SDK with permanent fixes
install_android_sdk() {
    log_info "Setting up Android SDK..."
    
    if [ ! -d "$ANDROID_HOME" ]; then
        log_info "Creating Android SDK directory: $ANDROID_HOME"
        mkdir -p "$ANDROID_HOME"
    fi
    
    # Download command line tools if not present
    if [ ! -d "$ANDROID_HOME/cmdline-tools/latest" ]; then
        log_info "Downloading Android Command Line Tools..."
        cd "$ANDROID_HOME"
        
        case $OS in
            "linux")
                CMDTOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip"
                ;;
            "macos")
                CMDTOOLS_URL="https://dl.google.com/android/repository/commandlinetools-mac-9477386_latest.zip"
                ;;
            "windows")
                CMDTOOLS_URL="https://dl.google.com/android/repository/commandlinetools-win-9477386_latest.zip"
                ;;
        esac
        
        curl -o cmdtools.zip "$CMDTOOLS_URL"
        unzip cmdtools.zip
        rm cmdtools.zip
        
        # Create proper directory structure
        mkdir -p cmdline-tools/latest
        mv cmdline-tools/{bin,lib,source.properties,NOTICE.txt} cmdline-tools/latest/
        
        log_success "Android Command Line Tools installed"
    fi
    
    # Set up PATH
    export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
    
    # PERMANENT FIX: Install specific compatible versions
    log_info "Installing Android SDK components with permanent fixes..."
    
    yes | sdkmanager --install "platforms;android-$COMPILE_SDK_VERSION" "build-tools;$BUILD_TOOLS_VERSION" "platform-tools" --sdk_root="$ANDROID_HOME"
    
    # PERMANENT FIX: Ensure AAPT2 is executable
    if [ -f "$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/aapt2" ]; then
        chmod +x "$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION"/*
        log_success "Build tools made executable"
    fi
    
    # Verify installation
    if "$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/aapt2" version >/dev/null 2>&1; then
        log_success "Android SDK installed and verified"
    else
        log_error "Android SDK installation failed"
        exit 1
    fi
}

# Create optimized gradle.properties
create_gradle_properties() {
    log_info "Creating optimized gradle.properties..."
    
    cat > gradle.properties << EOF
# CleverFerret Gradle Properties - Permanent Fix Edition
# This configuration includes all permanent fixes for reliable builds

# This property is required for any modern Android project using AndroidX.
android.useAndroidX=true

# This property is recommended for better build performance and correctness.
android.nonTransitiveRClass=true

# PERMANENT FIX: Optimized Gradle configuration for CleverFerret
org.gradle.jvmargs=-Xmx6144m -XX:MaxMetaspaceSize=2g -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.configureondemand=true
org.gradle.daemon=false

# Android optimizations
android.enableJetifier=true
android.incremental=true
android.builder.sdkDownload=false
EOF
    
    log_success "gradle.properties created with optimizations"
}

# Create local.properties
create_local_properties() {
    log_info "Creating local.properties..."
    
    cat > local.properties << EOF
sdk.dir=$ANDROID_HOME
android.builder.sdkDownload=false
EOF
    
    log_success "local.properties created"
}

# Create debug keystore
create_debug_keystore() {
    log_info "Creating debug keystore..."
    
    KEYSTORE_DIR="$HOME/.android"
    KEYSTORE_PATH="$KEYSTORE_DIR/debug.keystore"
    
    if [ ! -f "$KEYSTORE_PATH" ]; then
        mkdir -p "$KEYSTORE_DIR"
        keytool -genkey -v -keystore "$KEYSTORE_PATH" -alias androiddebugkey \
                -keyalg RSA -keysize 2048 -validity 10000 -storepass android -keypass android \
                -dname "CN=CleverFerret Debug,O=Universal Media Library,C=US"
        log_success "Debug keystore created"
    else
        log_success "Debug keystore already exists"
    fi
}

# Verify build environment
verify_environment() {
    log_info "Verifying build environment..."
    
    # Check Java
    if java -version 2>&1 | grep -q "17"; then
        log_success "Java 17: $(java -version 2>&1 | head -1)"
    else
        log_error "Java 17 not found"
        return 1
    fi
    
    # Check Android SDK
    if [ -d "$ANDROID_HOME" ]; then
        log_success "Android SDK: $ANDROID_HOME"
    else
        log_error "Android SDK not found"
        return 1
    fi
    
    # Check build tools
    if [ -f "$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/aapt2" ]; then
        log_success "Build tools $BUILD_TOOLS_VERSION: Available"
        "$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/aapt2" version
    else
        log_error "Build tools $BUILD_TOOLS_VERSION not found"
        return 1
    fi
    
    # Check memory
    if command -v free >/dev/null 2>&1; then
        AVAILABLE_MEM=$(free -m | awk 'NR==2{printf "%.0f", $7}')
        if [ "$AVAILABLE_MEM" -gt 6144 ]; then
            log_success "Available memory: ${AVAILABLE_MEM}MB (sufficient)"
        else
            log_warning "Available memory: ${AVAILABLE_MEM}MB (may be insufficient)"
        fi
    fi
    
    log_success "Build environment verification complete"
}

# Create build wrapper script
create_build_wrapper() {
    log_info "Creating build wrapper script..."
    
    cat > build-cleverferret.sh << 'EOF'
#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=tooling/build-scripts/android-sdk-versions.sh
source "$SCRIPT_DIR/tooling/build-scripts/android-sdk-versions.sh"

echo "🔨 Building CleverFerret with Permanent Fixes"
echo "============================================"

# Set environment
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/build-tools/$CF_BUILD_TOOLS_VERSION:$ANDROID_HOME/platform-tools:$PATH"

# PERMANENT FIX: Use minimal dependencies for reliable build
if [ -f "CleverFerret/build.gradle.kts.minimal" ]; then
    echo "📦 Using minimal dependencies for reliable build..."
    cp CleverFerret/build.gradle.kts CleverFerret/build.gradle.kts.full 2>/dev/null || true
    cp CleverFerret/build.gradle.kts.minimal CleverFerret/build.gradle.kts
fi

# Clean build
echo "🧹 Cleaning build environment..."
./gradlew clean --no-daemon

# Build with all optimizations
echo "🔨 Building APK..."
./gradlew --no-daemon --parallel --build-cache --stacktrace assembleDebug

# Sign APK
if [ -f "CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk" ]; then
    echo "🔐 Signing APK..."
    
    APK_PATH="CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk"
    SIGNED_APK="builds/CleverFerret-enhanced-$(date +%Y%m%d).apk"
    
    mkdir -p builds
    cp "$APK_PATH" "$SIGNED_APK"
    
    "$ANDROID_HOME/build-tools/$CF_BUILD_TOOLS_VERSION/apksigner" sign \
        --ks "$HOME/.android/debug.keystore" --ks-pass pass:android --key-pass pass:android \
        "$SIGNED_APK"
    
    echo "✅ APK built and signed successfully!"
    echo "📍 Location: $SIGNED_APK"
    ls -lh "$SIGNED_APK"
else
    echo "❌ APK build failed"
    exit 1
fi

# Restore full dependencies
if [ -f "CleverFerret/build.gradle.kts.full" ]; then
    echo "🔄 Restoring full dependencies..."
    cp CleverFerret/build.gradle.kts.full CleverFerret/build.gradle.kts
fi

echo "🎉 Build completed successfully!"
EOF
    
    chmod +x build-cleverferret.sh
    log_success "Build wrapper script created: build-cleverferret.sh"
}

# Main setup function
main() {
    echo
    log_info "Starting CleverFerret build environment setup..."
    echo
    
    detect_os
    install_java
    install_android_sdk
    create_gradle_properties
    create_local_properties
    create_debug_keystore
    create_build_wrapper
    verify_environment
    
    echo
    log_success "🎉 CleverFerret build environment setup complete!"
    echo
    echo "📋 Next steps:"
    echo "  1. Run: ./build-cleverferret.sh"
    echo "  2. Install APK from builds/ directory"
    echo "  3. Test the enhanced CleverFerret app"
    echo
    echo "📚 For more information, see BUILD_TOOLS_SETUP.md"
    echo
}

# Run main function
main "$@"