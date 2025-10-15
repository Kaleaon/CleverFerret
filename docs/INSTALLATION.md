# Installation Guide

> **Note**: This document has been superseded by [INSTALL.md](INSTALL.md) which includes updated instructions for the automated build system.
> 
> For the latest installation instructions, please see **[INSTALL.md](INSTALL.md)**.

---

## Legacy Installation Guide

Complete guide to installing CleverFerret on your Android device.

---

## System Requirements

- **Android Version**: 8.0+ (API level 36 or higher)
- **Storage**: At least 100 MB of free space
- **RAM**: 2GB minimum, 4GB recommended
- **Architecture**: Universal (ARM64, ARM32, x86_64, x86)

---

## Installation Steps

### 1. Download the APK

Download the latest release APK from the [Releases page](https://github.com/Kaleaon/CleverFerret/releases).

**Choose the right version:**
- **Release APK**: Recommended for most users (optimized, smaller size)
- **Debug APK**: For developers and testing purposes

### 2. Enable Unknown Sources

Before installing, you need to allow installation from unknown sources:

**For Android 8.0 - 12:**
1. Go to **Settings** → **Security** → **Unknown Sources**
2. Enable the option

**For Android 13+:**
1. Go to **Settings** → **Apps & notifications** → **Special app access** → **Install unknown apps**
2. Select your browser or file manager
3. Enable "Allow from this source"

### 3. Install the APK

1. Open the downloaded APK file
2. Tap **Install** when prompted
3. Wait for installation to complete
4. Tap **Open** or find CleverFerret in your app drawer

### 4. First Launch Setup

When you first open CleverFerret:

1. **Grant Permissions**: Allow storage access when prompted (required for media scanning)
2. **Choose Setup Method**:
   - **Create New Library**: Start fresh and add media manually
   - **Import from Calibre**: Import existing Calibre library with metadata

---

## First Run Experience

CleverFerret starts in a clean, first-run state:

- ✅ Empty library (no existing data)
- ✅ Ready to create new libraries
- ✅ Import option for Calibre users
- ✅ Clean database and preferences

### Creating a New Library

1. Tap the **"+"** button on the home screen
2. Enter a name for your library
3. Choose the media type (Books, Music, Movies)
4. Start adding media items

### Importing from Calibre

1. Tap the **menu button (⋮)** in the top bar
2. Select **"Import Calibre Library"**
3. Navigate to your Calibre `metadata.db` file
4. Select the root folder of your Calibre library
5. Wait for import to complete (runs in background)

---

## Troubleshooting

### Installation Issues

#### "App not installed" error
- **Solution**: Enable installation from unknown sources (see step 2 above)
- **Alternative**: Clear Package Installer cache: Settings → Apps → Package Installer → Storage → Clear Cache

#### "Parse error" or corrupted APK
- **Solution**: Download the APK again (file may be corrupted)
- **Alternative**: Try downloading with a different browser

#### "Insufficient storage" error
- **Solution**: Free up at least 100 MB of space
- **Check**: Go to Settings → Storage to see available space

#### Installation fails on Android 13+
- **Note**: App now properly requests notification permissions
- **Solution**: Grant notification permission when prompted (needed for import progress)

### App Permissions

CleverFerret requests these permissions:

- **Storage**: Required to scan and access your media files
- **Notifications** (Android 13+): For import progress updates
- **Foreground Service**: For long-running import operations

All permissions are used only for stated purposes. No data is sent to external servers.

### App Won't Start

1. **Restart your device** and try again
2. **Clear app data**: Settings → Apps → CleverFerret → Storage → Clear Data
3. **Reinstall**: Uninstall and reinstall the app
4. **Check Android version**: Verify you're running Android 15 or higher

### Empty Library After Launch

This is **expected behavior** on first run. The app starts clean so you can:
- Create new libraries tailored to your needs
- Import from Calibre with all your existing metadata
- Organize media exactly how you want

---

## Verification (Optional)

You can verify the APK file integrity using checksums:

### Using SHA256
```bash
# On Linux/Mac
sha256sum CleverFerret-v1.0.0-release.apk

# On Windows (PowerShell)
Get-FileHash CleverFerret-v1.0.0-release.apk -Algorithm SHA256
```

Compare the output with the checksum file included in the release.

---

## Advanced Installation

### Installing via ADB (Developers)

If you have Android Debug Bridge (ADB) installed:

```bash
# Connect your device with USB debugging enabled
adb devices

# Install the APK
adb install CleverFerret-v1.0.0-release.apk

# Install with replace (if already installed)
adb install -r CleverFerret-v1.0.0-release.apk
```

---

## Getting Help

If you encounter issues not covered here:

1. Check the [GitHub Issues](https://github.com/Kaleaon/CleverFerret/issues) page
2. Search for similar problems or solutions
3. Create a new issue with:
   - Your Android version
   - Device model
   - Steps to reproduce the problem
   - Screenshots if applicable

---

## Next Steps

After installation:

- **Explore Features**: Try creating libraries and adding media
- **Configure Settings**: Customize themes and preferences
- **Import Calibre**: If you have an existing library
- **Check Updates**: Watch the [Releases page](https://github.com/Kaleaon/CleverFerret/releases) for updates

---

**Need more help?** See the [full documentation](README.md) or ask in [GitHub Discussions](https://github.com/Kaleaon/CleverFerret/discussions).
