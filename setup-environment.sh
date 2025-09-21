#!/bin/bash
# CleverFerret Environment Setup
# Source this file to set up environment variables

export ANDROID_HOME="/opt/android-sdk"
export ANDROID_SDK_ROOT="/opt/android-sdk"
export JAVA_HOME=${JAVA_HOME:-$(readlink -f /usr/bin/java | sed "s:bin/java::")}
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/build-tools/33.0.2:$ANDROID_HOME/platform-tools"

echo "✅ CleverFerret environment variables set"
echo "ANDROID_HOME: $ANDROID_HOME"
echo "JAVA_HOME: $JAVA_HOME"
