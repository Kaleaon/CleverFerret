#!/bin/bash

# A shell script to set up the Android SDK for Google Jules.
# Based on the script provided by the user.
# NOTE: Sudo commands are removed as they are not available in this environment.

# --- Configuration ---
SDK_VERSION="11076708"
ANDROID_HOME_DIR="/app/android_sdk"

# --- Script Execution ---
set -e
echo "🚀 Starting Android SDK setup (Jules' version)..."

# 1. Check for dependencies (assuming they are pre-installed)
echo "Checking for dependencies (wget, unzip, java)..."
if ! command -v wget &> /dev/null || ! command -v unzip &> /dev/null || ! command -v java &> /dev/null
then
    echo "ERROR: A required dependency (wget, unzip, or java) is not installed."
    exit 1
fi
echo "✅ Dependencies found."

# 2. Create SDK directory
echo "Creating Android SDK directory at $ANDROID_HOME_DIR..."
mkdir -p "$ANDROID_HOME_DIR"

# 3. Download and Unzip Android SDK Command-line Tools
echo "Downloading Android SDK command-line tools..."
cd "$HOME"
wget "https://dl.google.com/android/repository/commandlinetools-linux-${SDK_VERSION}_latest.zip" -O commandlinetools.zip

echo "Unzipping tools..."
# Create the target path and unzip directly into it, then rename the created folder
mkdir -p "$ANDROID_HOME_DIR/cmdline-tools"
unzip commandlinetools.zip -d "$ANDROID_HOME_DIR/cmdline-tools"
mv "$ANDROID_HOME_DIR/cmdline-tools/cmdline-tools" "$ANDROID_HOME_DIR/cmdline-tools/latest"

echo "Cleaning up downloaded zip file..."
rm commandlinetools.zip

# 4. Set Environment Variables for this session
echo "Setting up environment variables for the current session..."
export ANDROID_HOME="$ANDROID_HOME_DIR"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

# 5. Accept SDK Licenses and Install Packages
echo "Accepting SDK licenses..."
yes | sdkmanager --licenses

echo "Installing latest platform-tools and build-tools..."
sdkmanager "platform-tools" "build-tools;34.0.0"

echo "✅ Android SDK setup complete!"
echo "SDK Location: $ANDROID_HOME"
echo "PATH: $PATH"
