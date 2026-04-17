#!/bin/bash
set -e

echo "🔨 Building CleverFerret with Permanent Fixes"
echo "============================================"

# Set environment
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/build-tools/33.0.2:$ANDROID_HOME/platform-tools:$PATH"

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
    
    "$ANDROID_HOME/build-tools/33.0.2/apksigner" sign \
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
