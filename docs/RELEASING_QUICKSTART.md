# Quick Start: Creating a Release

This is a quick reference for maintainers. For full details, see [RELEASE.md](RELEASE.md).

---

## 🚀 Create a Release (5 minutes)

### Step 1: Update Version

Edit `CleverFerret/build.gradle.kts`:

```kotlin
versionCode = 2          // Increment (integer)
versionName = "1.1.0"    // Update (semantic versioning)
```

### Step 2: Commit and Tag

```bash
git add CleverFerret/build.gradle.kts
git commit -m "Bump version to 1.1.0"
git tag v1.1.0
git push origin main
git push origin v1.1.0
```

### Step 3: Wait

GitHub Actions will automatically:
- ✅ Build APKs (debug + release)
- ✅ Generate checksums
- ✅ Create GitHub release
- ✅ Upload assets

Check progress: https://github.com/Kaleaon/CleverFerret/actions

---

## 🔐 First Time Setup: Signing Keys

Only needed once. See [RELEASE.md#setting-up-apk-signing](RELEASE.md#setting-up-apk-signing-for-maintainers) for full details.

### Generate Keystore

```bash
keytool -genkey -v -keystore cleverferret-release.jks \
  -keyalg RSA -keysize 2048 -validity 10000 -alias cleverferret
```

### Add to GitHub Secrets

Repository Settings → Secrets → Actions → New secret:

- `KEYSTORE_FILE_BASE64`: `base64 -i cleverferret-release.jks`
- `KEYSTORE_PASSWORD`: Your keystore password
- `KEY_ALIAS`: `cleverferret` (or your alias)
- `KEY_PASSWORD`: Your key password

---

## ✅ Verification

After release is created:

1. Go to https://github.com/Kaleaon/CleverFerret/releases
2. Verify APKs are uploaded
3. Download and test installation
4. Verify checksum:
   ```bash
   sha256sum CleverFerret-v1.1.0-release.apk
   ```

---

## 🐛 Troubleshooting

### Build Failed in Actions

1. Go to Actions tab
2. Click on failed workflow
3. Check logs for errors
4. Common fixes:
   - Fix compilation errors
   - Update dependencies
   - Check signing secrets

### APK is Unsigned

- Signing secrets not configured
- APK still installable
- See "First Time Setup" above

### Wrong Version Number

1. Fix version in `build.gradle.kts`
2. Delete the tag:
   ```bash
   git tag -d v1.1.0
   git push origin :refs/tags/v1.1.0
   ```
3. Re-create the tag after fixing

---

## 📚 More Information

- [RELEASE.md](RELEASE.md) - Complete release guide
- [INSTALL.md](INSTALL.md) - User installation guide
- [BUILD_RELEASE_AUTOMATION.md](BUILD_RELEASE_AUTOMATION.md) - Technical details
- [GitHub Actions](https://github.com/Kaleaon/CleverFerret/actions) - Build status

---

**Need Help?** Create an issue or check existing documentation.
