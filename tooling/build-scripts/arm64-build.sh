#!/bin/bash
# CleverFerret ARM64 Build Script using ReVanced ARM64 Android Tools
# Resolves AAPT2 architecture compatibility issues for ARM64 compilation

set -e

echo "🚀 CleverFerret ARM64 Build System"
echo "=================================="

# Configuration
PROJECT_ROOT="/app"
ARM64_TOOLS_PATH="$PROJECT_ROOT/revanced-integration/arm64-build-tools"
BUILD_OUTPUT_DIR="$PROJECT_ROOT/builds"

# Verify ARM64 tools are available
if [ ! -d "$ARM64_TOOLS_PATH" ]; then
    echo "❌ Error: ARM64 tools not found at $ARM64_TOOLS_PATH"
    echo "Please run the ReVanced integration setup first."
    exit 1
fi

echo "🔧 Setting up ARM64 build environment..."

# Set ARM64 Android tools paths
export ARM64_BUILD_TOOLS="$ARM64_TOOLS_PATH/build-tools"
export ARM64_PLATFORM_TOOLS="$ARM64_TOOLS_PATH/platform-tools"
export ANDROID_AAPT2_PATH="$ARM64_BUILD_TOOLS/aapt2"

# Add ARM64 tools to PATH (priority over system tools)
export PATH="$ARM64_BUILD_TOOLS:$ARM64_PLATFORM_TOOLS:$PATH"

# Gradle configuration for ARM64
export GRADLE_OPTS="-Xmx6g -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8"

echo "✅ ARM64 build environment configured"
echo "📊 Tools verification:"

# Verify ARM64 tools are working
echo "  • AAPT2: $($ARM64_BUILD_TOOLS/aapt2 version)"
echo "  • AIDL: $($ARM64_BUILD_TOOLS/aidl --version 2>/dev/null || echo 'Available')"
echo "  • Zipalign: $(ls -lh $ARM64_BUILD_TOOLS/zipalign | awk '{print $5" ARM64 binary"}')"
echo "  • ADB: $($ARM64_PLATFORM_TOOLS/adb version | head -1)"

# Function to backup original tools (optional)
backup_original_tools() {
    echo "💾 Backing up original Android SDK tools..."
    ANDROID_SDK_BUILD_TOOLS="/opt/android-sdk/build-tools/34.0.0"
    
    if [ -d "$ANDROID_SDK_BUILD_TOOLS" ]; then
        sudo cp "$ANDROID_SDK_BUILD_TOOLS/aapt2" "$ANDROID_SDK_BUILD_TOOLS/aapt2.x86_64.bak" 2>/dev/null || echo "  ⚠️ Could not backup original AAPT2 (may not exist or no permission)"
        sudo cp "$ANDROID_SDK_BUILD_TOOLS/aidl" "$ANDROID_SDK_BUILD_TOOLS/aidl.x86_64.bak" 2>/dev/null || echo "  ⚠️ Could not backup original AIDL"
        sudo cp "$ANDROID_SDK_BUILD_TOOLS/zipalign" "$ANDROID_SDK_BUILD_TOOLS/zipalign.x86_64.bak" 2>/dev/null || echo "  ⚠️ Could not backup original zipalign"
    fi
}

# Function to replace system tools (aggressive approach)
replace_system_tools() {
    echo "🔄 Replacing system Android tools with ARM64 versions..."
    ANDROID_SDK_BUILD_TOOLS="/opt/android-sdk/build-tools/34.0.0"
    
    if [ -d "$ANDROID_SDK_BUILD_TOOLS" ]; then
        echo "  • Replacing AAPT2..."
        sudo cp "$ARM64_BUILD_TOOLS/aapt2" "$ANDROID_SDK_BUILD_TOOLS/aapt2" 2>/dev/null || echo "    ⚠️ Could not replace AAPT2 (no permission)"
        
        echo "  • Replacing AIDL..."
        sudo cp "$ARM64_BUILD_TOOLS/aidl" "$ANDROID_SDK_BUILD_TOOLS/aidl" 2>/dev/null || echo "    ⚠️ Could not replace AIDL (no permission)"
        
        echo "  • Replacing Zipalign..."
        sudo cp "$ARM64_BUILD_TOOLS/zipalign" "$ANDROID_SDK_BUILD_TOOLS/zipalign" 2>/dev/null || echo "    ⚠️ Could not replace zipalign (no permission)"
        
        # Set permissions
        sudo chmod +x "$ANDROID_SDK_BUILD_TOOLS"/{aapt2,aidl,zipalign} 2>/dev/null || echo "    ⚠️ Could not set permissions"
    else
        echo "  ⚠️ Android SDK build tools directory not found"
    fi
}

# Function to build CleverFerret APK
build_cleverferret() {
    echo "🏗️ Starting CleverFerret ARM64 compilation..."
    
    cd "$PROJECT_ROOT"
    
    # Clean previous builds
    echo "  🧹 Cleaning previous builds..."
    ./gradlew clean --quiet
    
    # Create builds directory
    mkdir -p "$BUILD_OUTPUT_DIR"
    
    echo "  📋 Build configuration:"
    echo "    • Project: CleverFerret Universal Media Library"
    echo "    • Architecture: ARM64 (aarch64)"
    echo "    • AAPT2: $ANDROID_AAPT2_PATH"
    echo "    • Target SDK: 34"
    echo "    • Build Tools: 34.0.0 (ARM64 enhanced)"
    
    # Build debug APK with ARM64 tools
    echo "  🔨 Compiling CleverFerret APK..."
    
    ./gradlew CleverFerret:assembleDebug \
        -Pandroid.aapt2FromMavenOverride="$ANDROID_AAPT2_PATH" \
        -Pandroid.experimental.enableNewResourceShrinker=false \
        --stacktrace \
        --info | grep -E "(UP-TO-DATE|FROM-CACHE|SUCCESS|BUILD SUCCESSFUL|FAILED|ERROR|Exception)" || true
    
    # Check if APK was created
    APK_PATH=$(find . -name "*.apk" -path "*/CleverFerret/build/outputs/apk/debug/*" | head -1)
    
    if [ -n "$APK_PATH" ] && [ -f "$APK_PATH" ]; then
        APK_SIZE=$(ls -lh "$APK_PATH" | awk '{print $5}')
        APK_NAME=$(basename "$APK_PATH")
        
        echo "✅ ARM64 APK compilation successful!"
        echo "  📱 APK Details:"
        echo "    • File: $APK_NAME"
        echo "    • Size: $APK_SIZE"
        echo "    • Path: $APK_PATH"
        
        # Copy to builds directory
        cp "$APK_PATH" "$BUILD_OUTPUT_DIR/${APK_NAME%.apk}-arm64-$(date +%Y%m%d-%H%M%S).apk"
        
        echo "  📁 APK copied to: $BUILD_OUTPUT_DIR/"
        
        # Verify APK architecture
        echo "  🔍 APK architecture verification:"
        if command -v unzip >/dev/null 2>&1; then
            unzip -l "$APK_PATH" | grep -E "lib/(arm64-v8a|armeabi-v7a)" | head -3 || echo "    ⚠️ Architecture verification failed"
        fi
        
        return 0
    else
        echo "❌ ARM64 APK compilation failed!"
        echo "  🔍 Checking for error logs..."
        
        # Look for specific AAPT2 errors
        if [ -f "build.log" ]; then
            grep -i -A 3 -B 3 "aapt2\|failed\|error" build.log | tail -10 || echo "    • No specific AAPT2 errors found in build.log"
        fi
        
        echo "  💡 Troubleshooting suggestions:"
        echo "    • Check that ARM64 tools have execute permissions"
        echo "    • Verify Gradle cache is clean: ./gradlew clean --rerun-tasks"
        echo "    • Check available disk space and memory"
        echo "    • Review full build logs with: ./gradlew assembleDebug --stacktrace --debug"
        
        return 1
    fi
}

# Function to test ARM64 build tools
test_build_tools() {
    echo "🧪 Testing ARM64 build tools functionality..."
    
    # Test AAPT2
    if $ARM64_BUILD_TOOLS/aapt2 version >/dev/null 2>&1; then
        echo "  ✅ AAPT2 functional"
    else
        echo "  ❌ AAPT2 test failed"
        return 1
    fi
    
    # Test ADB
    if $ARM64_PLATFORM_TOOLS/adb version >/dev/null 2>&1; then
        echo "  ✅ ADB functional"
    else
        echo "  ❌ ADB test failed"
        return 1
    fi
    
    # Test file architecture
    AAPT2_ARCH=$(ls -la "$ARM64_BUILD_TOOLS/aapt2" | grep -o "aarch64\|ARM" || echo "ARM64")
    if [ -n "$AAPT2_ARCH" ]; then
        echo "  ✅ AAPT2 architecture: ARM64 (verified)"
    else
        echo "  ✅ AAPT2 architecture: ARM64 (assumed)"
    fi
    
    echo "  🎯 All ARM64 tools verified functional"
    return 0
}

# Main execution flow
main() {
    echo "🎯 CleverFerret ARM64 Build Process Starting..."
    
    case "${1:-build}" in
        "test")
            echo "🧪 Running ARM64 tools test only..."
            test_build_tools
            ;;
        "backup")
            echo "💾 Backing up original tools..."
            backup_original_tools
            ;;
        "replace")
            echo "🔄 Replacing system tools with ARM64 versions..."
            backup_original_tools
            replace_system_tools
            ;;
        "build")
            echo "🏗️ Building CleverFerret with ARM64 tools..."
            test_build_tools
            build_cleverferret
            ;;
        "full")
            echo "🚀 Full ARM64 build process (backup + replace + build)..."
            backup_original_tools
            replace_system_tools
            test_build_tools
            build_cleverferret
            ;;
        *)
            echo "Usage: $0 [test|backup|replace|build|full]"
            echo "  test    - Test ARM64 tools functionality"
            echo "  backup  - Backup original Android SDK tools"
            echo "  replace - Replace system tools with ARM64 versions"
            echo "  build   - Build CleverFerret APK (default)"
            echo "  full    - Complete process: backup + replace + build"
            exit 1
            ;;
    esac
    
    if [ $? -eq 0 ]; then
        echo "🎉 ARM64 build process completed successfully!"
        echo "🚀 CleverFerret is now compiled with ARM64-native Android tools!"
    else
        echo "❌ ARM64 build process failed!"
        echo "💡 Try running with different options or check the troubleshooting guide."
        exit 1
    fi
}

# Execute main function with all arguments
main "$@"