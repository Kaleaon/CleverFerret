#!/bin/bash

echo "🚀 Building Enhanced CleverFerret APK..."

# Set environment
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/build-tools/34.0.0

cd /app

# Clean everything
echo "🧹 Cleaning build cache..."
rm -rf ~/.gradle .gradle CleverFerret/build

# Build with timeout and background monitoring
echo "🔨 Starting build process..."
timeout 600s ./gradlew --no-daemon --parallel --build-cache assembleDebug > build_enhanced.log 2>&1 &
BUILD_PID=$!

# Monitor progress
for i in {1..10}; do
    sleep 30
    if ! kill -0 $BUILD_PID 2>/dev/null; then
        echo "✅ Build process completed!"
        break
    fi
    echo "⏳ Build in progress... (${i}/10 - 30s intervals)"
    
    # Check if APK was created
    if [ -f "CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk" ]; then
        echo "🎉 APK found! Build successful!"
        kill $BUILD_PID 2>/dev/null
        break
    fi
done

# Check final result
if [ -f "CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk" ]; then
    echo "✅ Enhanced APK built successfully!"
    ls -lh CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk
    
    # Copy to builds directory
    cp CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk builds/CleverFerret-enhanced-v1.1.apk
    echo "📦 APK copied to builds/CleverFerret-enhanced-v1.1.apk"
    
    # Sign the APK
    echo "🔐 Signing enhanced APK..."
    $ANDROID_HOME/build-tools/34.0.0/apksigner sign --ks ~/.android/debug.keystore --ks-pass pass:android --key-pass pass:android builds/CleverFerret-enhanced-v1.1.apk
    
    echo "✅ Enhanced and signed APK ready!"
    ls -lh builds/CleverFerret-enhanced-v1.1.apk
else
    echo "❌ Build failed or timed out. Check build_enhanced.log for details."
    tail -20 build_enhanced.log
fi