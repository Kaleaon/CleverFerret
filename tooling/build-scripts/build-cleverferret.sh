#!/bin/bash
set -e

# Load canonical Android SDK version configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=tooling/build-scripts/android-sdk-versions.sh
source "$SCRIPT_DIR/android-sdk-versions.sh"

echo "🔨 Building CleverFerret with Permanent Fixes"
echo "============================================"

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

# Set environment
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
./gradlew --no-daemon --parallel --build-cache --stacktrace assembleDebug

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
