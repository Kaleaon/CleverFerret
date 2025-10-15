# APK Build Fix - Android SDK Configuration

## Problem
The APK build was failing with the error:
```
SDK location not found. Define a valid SDK location with an ANDROID_HOME 
environment variable or by setting the sdk.dir path in your project's 
local properties file at '/workspace/local.properties'.
```

## Root Cause
The Android build system requires either:
1. An `ANDROID_HOME` environment variable pointing to the Android SDK, OR
2. A `local.properties` file with `sdk.dir` pointing to the Android SDK

In workspace/container environments, neither was configured by default.

## Solution
### Quick Fix (Manual)
Create a `local.properties` file in the project root:
```properties
sdk.dir=/workspace/android-sdk
```

### Automated Fix
The `build-scripts/setup-build-environment.sh` script resolves the Android SDK location as follows:
- If `ANDROID_HOME` is already set, it is respected and used as-is
- Otherwise, in workspace/container environments: `/workspace/android-sdk`
- Otherwise, default: `$HOME/Android/Sdk`

## Usage
### For Workspace/Container Environments
```bash
# The SDK is already at /workspace/android-sdk
./gradlew assembleDebug
```

### For Local Development
```bash
# Source the setup script to set the ANDROID_HOME environment variable
source ./build-scripts/setup-build-environment.sh

# Or manually create local.properties
echo "sdk.dir=$HOME/Android/Sdk" > local.properties

# Then build
./gradlew assembleDebug
```

### For CI/CD
The GitHub Actions workflow already handles this via `android-actions/setup-android@v3`.

## Verification
After the fix, you should be able to build successfully:
```bash
./gradlew assembleDebug
```

The APK will be located at:
```
CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk
```

## Notes
- `local.properties` is in `.gitignore` (as it should be) because it contains machine-specific paths
- The setup script sets the `ANDROID_HOME` environment variable when sourced, which is an alternative to using `local.properties`
- A pre-existing `ANDROID_HOME` environment variable takes precedence over auto-detection
- The fix ensures builds work in various environments without manual intervention
