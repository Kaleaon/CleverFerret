#!/bin/bash

# Simple build script for CleverFerret
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

echo "Starting CleverFerret build process..."
echo "Android Home: $ANDROID_HOME"
echo "Java Version: $(java -version 2>&1 | head -1)"

cd /app

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf ~/.gradle/caches/transforms-*
rm -rf .gradle/8.*
rm -rf CleverFerret/build

# Run a simple sync first
echo "Running gradle sync..."
timeout 120 ./gradlew --no-daemon --console=plain --warning-mode=none help

# Try a simple task
echo "Running simple assemble task..."
timeout 300 ./gradlew --no-daemon --console=plain assembleDebug

echo "Build process completed"