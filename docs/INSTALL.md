# Installation Guide

This guide explains how to download and install CleverFerret on your Android device.

---

## Prerequisites

- Android 8.0 (Oreo) or higher (API level 26+)
- ~100 MB of free storage space
- Internet connection (for initial download)

---

## Installation Steps

### 1. Download the APK

Go to the [Releases page](https://github.com/Kaleaon/CleverFerret/releases) and download the latest APK file:

- **Recommended**: `CleverFerret-vX.X-release.apk` - Optimized production version
- **Alternative**: `CleverFerret-vX.X-debug.apk` - Debug version (larger file size)

### 2. Enable Installation from Unknown Sources

Since CleverFerret is not on the Google Play Store, you need to enable installation from unknown sources:

#### Android 8.0 - 10:
1. Go to **Settings** → **Security** (or **Lock screen and security**)
2. Enable **Unknown sources** or **Install unknown apps**
3. Find your browser or file manager in the list
4. Enable **Allow from this source**

#### Android 11+:
1. Try to install the APK
2. When prompted, tap **Settings**
3. Enable **Allow from this source**
4. Go back and try installing again

### 3. Install the APK

1. Open the downloaded APK file
   - From your browser's downloads
   - From your file manager app
   - From the notification bar
2. Tap **Install**
3. Wait for installation to complete
4. Tap **Open** to launch the app

---

## Verification

### Verify APK Authenticity (Optional but Recommended)

Before installing, you can verify the APK hasn't been tampered with:

1. Download the corresponding `.sha256` checksum file from the release
2. Calculate the checksum of your downloaded APK:

**On Linux/Mac:**
```bash
sha256sum CleverFerret-vX.X-release.apk
```

**On Windows (PowerShell):**
```powershell
Get-FileHash CleverFerret-vX.X-release.apk -Algorithm SHA256
```

**On Android (using Termux):**
```bash
sha256sum /sdcard/Download/CleverFerret-vX.X-release.apk
```

3. Compare the output with the checksum in the `.sha256` file or release notes

### Verify Installation

After installation:
1. Launch CleverFerret
2. You should see the main library screen
3. Check the app version in **Settings** → **About**

---

## First Run

When you first launch CleverFerret:

1. **Empty Library**: The app starts with no data
2. **Create a Library**: Tap the **+** button to create your first library
3. **Import from Calibre**: Use the menu option to import an existing Calibre library (optional)
4. **Grant Permissions**: Allow storage permissions when prompted to access your media files

---

## Updating

To update to a newer version:

1. Download the new APK from the [Releases page](https://github.com/Kaleaon/CleverFerret/releases)
2. Install the new APK over the existing installation
3. Your data and settings will be preserved

**Note**: Make sure to download the same variant (release or debug) that you originally installed.

---

## Uninstalling

To uninstall CleverFerret:

1. Go to **Settings** → **Apps**
2. Find **CleverFerret** in the list
3. Tap **Uninstall**
4. Confirm the uninstallation

**Note**: Uninstalling will delete all app data. If you want to keep your library, consider backing it up first.

---

## Troubleshooting

### Installation Failed

**Problem**: "App not installed" or "Installation blocked"

**Solutions**:
1. Ensure you have enough storage space
2. Enable installation from unknown sources (see step 2 above)
3. If updating, try uninstalling the old version first
4. Download the APK again (file might be corrupted)

### App Crashes on Launch

**Problem**: App crashes immediately after opening

**Solutions**:
1. Restart your device
2. Clear the app cache: **Settings** → **Apps** → **CleverFerret** → **Storage** → **Clear Cache**
3. Reinstall the app
4. Check if your Android version is 8.0 or higher

### Cannot Import Calibre Library

**Problem**: Import fails or doesn't show files

**Solutions**:
1. Grant storage permissions: **Settings** → **Apps** → **CleverFerret** → **Permissions** → **Storage**
2. Ensure your Calibre library is accessible on your device
3. Check that the Calibre library folder contains a `metadata.db` file

### "Unknown Source" Warning

**Problem**: Google Play Protect warns about unknown source

**Solutions**:
- This is expected for apps not from Google Play Store
- You can verify the APK checksum (see Verification section)
- Tap **Install anyway** if you trust the source
- CleverFerret is open source - you can review the code on GitHub

---

## Security Considerations

### Safe Installation

- ✅ **Download only from official sources**: GitHub releases page
- ✅ **Verify checksums**: Compare SHA256 checksums before installing
- ✅ **Review permissions**: CleverFerret only requests necessary permissions
- ❌ **Avoid unofficial sources**: Don't download from third-party app stores

### Permissions

CleverFerret requests:
- **Storage**: To read and manage your media library
- **Internet**: To sync with Calibre servers (if configured)
- **Notifications**: To show import/sync progress

---

## Getting Help

If you encounter issues:

1. Check the [Troubleshooting](#troubleshooting) section above
2. Search [existing issues](https://github.com/Kaleaon/CleverFerret/issues) on GitHub
3. Create a [new issue](https://github.com/Kaleaon/CleverFerret/issues/new) with:
   - Your Android version
   - CleverFerret version
   - Steps to reproduce the problem
   - Any error messages or screenshots

---

## Additional Resources

- [User Guide](./USER_GUIDE.md) - Learn how to use CleverFerret
- [Development Guide](./DEVELOPMENT.md) - Build from source
- [Release Notes](https://github.com/Kaleaon/CleverFerret/releases) - What's new in each version
