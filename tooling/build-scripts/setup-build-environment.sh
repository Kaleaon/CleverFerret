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

export JAVA_VERSION="17"
export SETUP_TIMESTAMP="$(date +%Y%m%d%H%M%S)"
export SETUP_GRADLE_OVERRIDES_FILE="gradle.setup-generated.properties"

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

backup_file() {
    local file_path="$1"
    if [ -f "$file_path" ]; then
        local backup_path="${file_path}.${SETUP_TIMESTAMP}.bak"
        cp "$file_path" "$backup_path"
        log_info "Backed up $file_path to $backup_path"
    fi
}

get_property_value() {
    local file_path="$1"
    local key="$2"
    awk -F'=' -v k="$key" '$1==k {print substr($0, index($0, "=")+1)}' "$file_path" 2>/dev/null | tail -n1
}

ensure_property() {
    local file_path="$1"
    local key="$2"
    local desired_value="$3"
    local reason="$4"
    local existing_value=""

    if [ -f "$file_path" ]; then
        existing_value="$(get_property_value "$file_path" "$key")"
    fi

    if [ -n "$existing_value" ]; then
        if [ "$existing_value" = "$desired_value" ]; then
            log_info "$file_path already has $key=$desired_value"
            return 0
        fi
        local backup_path="${file_path}.${SETUP_TIMESTAMP}.bak"
        cp "$file_path" "$backup_path"
        log_info "Backed up $file_path to $backup_path"
        if sed -i "s|^${key}=.*|${key}=${desired_value}|" "$file_path"; then
            log_info "Updated $file_path: $key from '$existing_value' to '$desired_value' ($reason)"
        else
            cp "$backup_path" "$file_path"
            log_error "Failed to update $file_path for key $key; restored from $backup_path"
            return 1
        fi
        return 0
    fi

    if [ ! -f "$file_path" ]; then
        touch "$file_path"
    fi
    printf "%s=%s\n" "$key" "$desired_value" >> "$file_path"
    log_info "Added $key=$desired_value to $file_path ($reason)"
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
    local preferred_version="$BUILD_TOOLS_VERSION"
    local selected_version=""

    if [ -d "$sdk_root/build-tools/$preferred_version" ]; then
        selected_version="$preferred_version"
    elif [ -d "$sdk_root/build-tools" ]; then
        selected_version="$(ls -1 "$sdk_root/build-tools" 2>/dev/null | sort -V | tail -n1)"
    fi

    echo "${selected_version:-$preferred_version}"
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
    SELECTED_BUILD_TOOLS_VERSION="$(select_build_tools_version "$ANDROID_HOME")"
    export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$SELECTED_BUILD_TOOLS_VERSION:$PATH"
    
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

# Create idempotent gradle configuration
create_gradle_properties() {
    log_info "Ensuring root gradle.properties has only required keys..."
    ensure_property "gradle.properties" "android.useAndroidX" "true" "AndroidX requirement"
    ensure_property "gradle.properties" "android.nonTransitiveRClass" "true" "Recommended Android setting"

    log_info "Writing setup-owned Gradle keys to $SETUP_GRADLE_OVERRIDES_FILE..."
    backup_file "$SETUP_GRADLE_OVERRIDES_FILE"
    local tmp_override_file
    tmp_override_file="$(mktemp)"
    cat > "$tmp_override_file" << EOF
# Generated by tooling/build-scripts/setup-build-environment.sh at $SETUP_TIMESTAMP
org.gradle.jvmargs=-Xmx6144m -XX:MaxMetaspaceSize=2g -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.configureondemand=true
org.gradle.daemon=false
android.enableJetifier=true
android.incremental=true
android.builder.sdkDownload=false
EOF
    mv "$tmp_override_file" "$SETUP_GRADLE_OVERRIDES_FILE"
    log_info "Rewrote $SETUP_GRADLE_OVERRIDES_FILE with setup-owned optimization keys"
    log_success "Gradle configuration updated idempotently"
}

# Create local.properties idempotently
create_local_properties() {
    log_info "Ensuring local.properties contains required keys..."
    ensure_property "local.properties" "sdk.dir" "$ANDROID_HOME" "Android SDK location"
    ensure_property "local.properties" "android.builder.sdkDownload" "false" "Disable automatic SDK download"
    log_success "local.properties updated idempotently"
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
    
    # Check required project keys in gradle.properties
    if [ -f "gradle.properties" ] && \
       grep -q "^android.useAndroidX=" "gradle.properties" && \
       grep -q "^android.nonTransitiveRClass=" "gradle.properties"; then
        log_success "gradle.properties contains required keys"
    else
        log_error "gradle.properties missing required keys"
        return 1
    fi

    # Check generated setup override file
    if [ -f "$SETUP_GRADLE_OVERRIDES_FILE" ] && grep -q "^org.gradle.jvmargs=" "$SETUP_GRADLE_OVERRIDES_FILE"; then
        log_success "$SETUP_GRADLE_OVERRIDES_FILE contains setup-owned keys"
    else
        log_error "$SETUP_GRADLE_OVERRIDES_FILE missing required setup-owned keys"
        return 1
    fi

    # Check local.properties required key
    if [ -f "local.properties" ] && grep -q "^sdk.dir=" "local.properties"; then
        log_success "local.properties contains sdk.dir"
    else
        log_error "local.properties missing sdk.dir"
        return 1
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
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/build-tools/33.0.2:$ANDROID_HOME/platform-tools:$PATH"
GRADLE_OVERRIDE_ARGS=()

# Load setup-owned Gradle overrides from generated file
if [ -f "gradle.setup-generated.properties" ]; then
    while IFS='=' read -r key value; do
        if [[ -z "$key" || "$key" =~ ^# ]]; then
            continue
        fi
        GRADLE_OVERRIDE_ARGS+=("-D${key}=${value}")
    done < "gradle.setup-generated.properties"
    echo "⚙️ Loaded setup overrides from gradle.setup-generated.properties"
fi
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

export ANDROID_HOME="$(resolve_android_sdk_root)"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
BUILD_TOOLS_VERSION="$(select_build_tools_version "$ANDROID_HOME")"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION:$PATH"
echo "📍 Resolved Android SDK: $ANDROID_HOME"
echo "🧰 Using build-tools: $BUILD_TOOLS_VERSION"

# PERMANENT FIX: Use minimal dependencies for reliable build
if [ -f "CleverFerret/build.gradle.kts.minimal" ]; then
    echo "📦 Using minimal dependencies for reliable build..."
    cp CleverFerret/build.gradle.kts CleverFerret/build.gradle.kts.full 2>/dev/null || true
    cp CleverFerret/build.gradle.kts.minimal CleverFerret/build.gradle.kts
fi
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/build-tools/$CF_BUILD_TOOLS_VERSION:$ANDROID_HOME/platform-tools:$PATH"

# Clean build
echo "🧹 Cleaning build environment..."
./gradlew clean --no-daemon

# Build with all optimizations
echo "🔨 Building APK..."
./gradlew --no-daemon --parallel --build-cache --stacktrace "${GRADLE_OVERRIDE_ARGS[@]}" assembleDebug

# Sign APK
if [ -f "CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk" ]; then
    echo "🔐 Signing APK..."
    
    APK_PATH="CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk"
    SIGNED_APK="builds/CleverFerret-enhanced-$(date +%Y%m%d).apk"
    
    mkdir -p builds
    cp "$APK_PATH" "$SIGNED_APK"
    
    "$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/apksigner" sign \
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

echo "🎉 Build completed successfully!"
EOF
    
    chmod +x build-cleverferret.sh
    log_success "Build wrapper script created: build-cleverferret.sh"
}

# Main setup function
main() {
    echo
    log_info "Starting CleverFerret build environment setup..."
    export ANDROID_HOME="$(resolve_android_sdk_root)"
    export ANDROID_SDK_ROOT="$ANDROID_HOME"
    export SELECTED_BUILD_TOOLS_VERSION="$BUILD_TOOLS_VERSION"
    log_info "Resolved Android SDK path: $ANDROID_HOME"
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
