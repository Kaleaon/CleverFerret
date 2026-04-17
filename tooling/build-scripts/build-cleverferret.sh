#!/bin/bash
set -e

# Load canonical Android SDK version configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=tooling/build-scripts/android-sdk-versions.sh
source "$SCRIPT_DIR/android-sdk-versions.sh"

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
