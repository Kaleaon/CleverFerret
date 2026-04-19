#!/bin/bash

# Canonical Android SDK version source for build scripts.
# compileSdk/targetSdk are parsed from CleverFerret/build.gradle.kts so the app module remains the source of truth.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
APP_BUILD_FILE="$PROJECT_ROOT/CleverFerret/build.gradle.kts"

if [ ! -f "$APP_BUILD_FILE" ]; then
    echo "❌ Unable to locate app build file: $APP_BUILD_FILE" >&2
    return 1 2>/dev/null || exit 1
fi

CF_COMPILE_SDK="$(awk -F'=' '/^[[:space:]]*compileSdk[[:space:]]*=/{if (match($2, /[0-9]+/)) {print substr($2, RSTART, RLENGTH); exit}}' "$APP_BUILD_FILE")"
CF_TARGET_SDK="$(awk -F'=' '/^[[:space:]]*targetSdk[[:space:]]*=/{if (match($2, /[0-9]+/)) {print substr($2, RSTART, RLENGTH); exit}}' "$APP_BUILD_FILE")"

if [ -z "$CF_COMPILE_SDK" ] || [ -z "$CF_TARGET_SDK" ]; then
    echo "❌ Failed to parse compileSdk/targetSdk from $APP_BUILD_FILE" >&2
    return 1 2>/dev/null || exit 1
fi

# Keep this aligned with the app module's SDK requirements.
CF_BUILD_TOOLS_VERSION="${CF_BUILD_TOOLS_VERSION:-36.0.0}"
CF_PLATFORM="android-$CF_COMPILE_SDK"

export CF_COMPILE_SDK
export CF_TARGET_SDK
export CF_BUILD_TOOLS_VERSION
export CF_PLATFORM
