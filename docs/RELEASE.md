# Release Instructions

## Automated Release Process

CleverFerret uses automated GitHub Actions workflows to build and publish releases. This document explains how to create releases and configure the build system.

---

## Creating a New Release

### Automated Release (Recommended)

The easiest way to create a release is by pushing a version tag:

```bash
# 1. Update version in build.gradle.kts (if needed)
# Edit CleverFerret/build.gradle.kts:
#   versionCode = 2
#   versionName = "1.1.0"

# 2. Commit the version change
git add CleverFerret/build.gradle.kts
git commit -m "Bump version to 1.1.0"

# 3. Create and push a version tag
git tag v1.1.0
git push origin main
git push origin v1.1.0
```

**What happens automatically:**
1. ✅ GitHub Actions workflow triggers on the tag push
2. ✅ Builds debug and release APKs
3. ✅ Generates SHA256 checksums for verification
4. ✅ Creates a GitHub release with the tag name
5. ✅ Uploads APKs and checksums as release assets
6. ✅ Includes automatically generated release notes

---

## Manual Release (Legacy)

If you need to create a release manually, follow these steps:

### 1. Create GitHub Release

1. Go to the [Releases page](https://github.com/Kaleaon/CleverFerret/releases)
2. Click "Create a new release"
3. Set tag version to `v1.0.0` (or your desired version)
4. Target the main branch or current development branch
5. Set release title to: `CleverFerret v1.0.0`
6. Use this description template:

```markdown
## Universal Media Library v1.0.0 - First Release

This is the first release of the Universal Media Library for Android.

### 🎉 What's New
- ✅ Basic library management interface
- ✅ Calibre library import capability  
- ✅ Modern Material You UI design
- ✅ Room database for local data storage
- ✅ First-run ready state (empty, clean installation)

### 📱 System Requirements
- Android 8.0+ (API level 26 or higher)
- 100 MB free storage space

### 📦 Installation
1. Download the APK below
2. Enable "Install from unknown sources" in Android settings
3. Install the APK
4. See [INSTALL.md](./INSTALL.md) for detailed instructions

### 🚀 First Run Experience
The app starts in a clean, first-run state with:
- Empty library (no existing data)
- Ready to create new libraries or import from Calibre
- Clean database and preferences

### 🐛 Known Issues
This is an early development release. Please report issues on the [Issues page](https://github.com/Kaleaon/Android-calibre/issues).

### 🛠️ For Developers
- Built with Kotlin, Jetpack Compose, and Material You
- Uses Room database for local storage
- Hilt for dependency injection
- Automated CI/CD with GitHub Actions
```

7. Check "Set as a pre-release" (since this is early development)
8. Upload the APK: `CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk`

### 2. APK Location

The release APK is located at:
```
CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk
```

File size: ~13-16 MB
SHA256: (calculate with `sha256sum CleverFerret-release-unsigned.apk`)

### 3. Verification

To verify the app is in first-run state:

1. Install the APK on a device/emulator
2. Launch the app
3. Verify you see an empty library screen
4. Verify the "+" button works to create libraries
5. Verify the menu option to "Import Calibre Library" is available
6. Verify no pre-existing data or preferences

---

## Setting Up APK Signing (For Maintainers)

To enable signed release APKs, you need to configure signing keys in GitHub Secrets.

### 1. Generate a Keystore

If you don't have a keystore yet:

```bash
keytool -genkey -v -keystore cleverferret-release.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias cleverferret
```

**Important:** Store the keystore file and passwords securely!

### 2. Encode Keystore for GitHub

```bash
# Convert keystore to base64
base64 -i cleverferret-release.jks -o keystore.base64

# On macOS, use:
base64 -i cleverferret-release.jks -o keystore.base64
```

### 3. Add GitHub Secrets

Go to your repository Settings → Secrets and variables → Actions, and add:

- `KEYSTORE_FILE_BASE64`: Content of `keystore.base64` file
- `KEYSTORE_PASSWORD`: Password for the keystore
- `KEY_ALIAS`: Alias used when creating the keystore
- `KEY_PASSWORD`: Password for the key

### 4. Update Workflow (If Needed)

The workflow in `.github/workflows/main.yml` is already configured to:
- Decode the base64 keystore
- Use environment variables for signing
- Sign the release APK automatically

---

## Build Configuration

### Version Management

Version information is defined in `CleverFerret/build.gradle.kts`:

```kotlin
defaultConfig {
    versionCode = 1      // Integer, increment for each release
    versionName = "1.0"  // String, semantic versioning (e.g., "1.2.3")
}
```

The `version.gradle` script provides Gradle tasks:
- `./gradlew printVersionName` - Display current version name
- `./gradlew printVersionCode` - Display current version code
- `./gradlew printVersionInfo` - Display all version information

### ProGuard/R8 Configuration

Release builds now use ProGuard/R8 for:
- Code shrinking (removes unused code)
- Resource shrinking (removes unused resources)
- Code obfuscation (makes reverse engineering harder)

Configuration is in:
- `CleverFerret/build.gradle.kts` - Build settings
- `CleverFerret/proguard-rules.pro` - ProGuard rules

### Build Types

- **Debug**: For development and testing
  - Includes debugging symbols
  - Larger file size (~20-25 MB)
  - Faster build time
  - Package name: `com.universalmedialibrary.debug`

- **Release**: For distribution
  - Optimized with R8
  - Smaller file size (~13-16 MB)
  - Requires signing for installation
  - Package name: `com.universalmedialibrary`

---

## Verification

### Verify APK Checksums

After downloading an APK:

```bash
# On Linux/macOS
sha256sum CleverFerret-v1.0-release.apk

# On Windows (PowerShell)
Get-FileHash CleverFerret-v1.0-release.apk -Algorithm SHA256
```

Compare the output with the checksum in the release notes or `.sha256` file.

### Test Installation

1. Install the APK on a device/emulator
2. Launch the app
3. Verify the app version in Settings → About
4. Test core functionality:
   - Create a library
   - Import from Calibre (if configured)
   - Browse media items

---

## Troubleshooting

### Release Workflow Fails

1. **Check workflow logs**: Go to Actions tab in GitHub
2. **Common issues**:
   - Missing secrets for signing
   - Build errors (check compilation logs)
   - Network timeouts (retry the workflow)

### Version Mismatch

If the APK version doesn't match expectations:
1. Check `build.gradle.kts` version settings
2. Ensure changes were committed before tagging
3. Verify the tag points to the correct commit

### Unsigned APK

If you get an unsigned APK:
- Signing secrets are not configured
- APK will be named `*-unsigned.apk`
- Still installable but shows "Unknown source" warning

---

## Build Information

- **Min SDK:** 26 (Android 8.0)
- **Target SDK:** 36 (Android 14)
- **Compile SDK:** 36
- **Build Tools:** Latest (managed by Android Gradle Plugin)
- **Java Version:** 17
- **Kotlin Version:** 2.0.21
- **Gradle:** 8.13

---

## Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Android App Signing](https://developer.android.com/studio/publish/app-signing)
- [ProGuard Configuration](https://developer.android.com/studio/build/shrink-code)
- [Semantic Versioning](https://semver.org/)