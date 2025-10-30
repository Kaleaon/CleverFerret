# CleverFerret v1.5 Release Instructions

## Completed Steps ✅

1. ✅ Updated version to 1.5 in `CleverFerret/build.gradle.kts`:
   - versionCode: 5
   - versionName: "1.5"

2. ✅ Updated `RELEASE_NOTES.md` for version 1.5

3. ✅ Built APKs:
   - Debug APK: `builds/CleverFerret-v1.5-debug.apk` (48MB)
   - Release APK: `builds/CleverFerret-v1.5-release-unsigned.apk` (35MB)

4. ✅ Generated SHA256 checksums:
   - `c33b873eb6c352346a71c9bd37981f10f47e458eea8f5b7559be7a812a26c7f7  CleverFerret-v1.5-debug.apk`
   - `a444c2ff41e3f9553c1880751ed5be5f089f2e721fe54f2679991a0b60507646  CleverFerret-v1.5-release-unsigned.apk`

5. ✅ Created git tag `v1.5` locally

## Manual Steps Required 🔧

### Option 1: Merge PR and Tag from Main Branch (Recommended)

1. Merge this pull request to the main branch
2. After merge, checkout main and pull latest changes:
   ```bash
   git checkout main
   git pull origin main
   ```

3. Create and push the v1.5 tag:
   ```bash
   git tag -a v1.5 -m "Release version 1.5"
   git push origin v1.5
   ```

4. This will trigger the GitHub Actions workflow at `.github/workflows/main.yml` which will:
   - Run tests
   - Build APKs
   - Sign the release APK (if keystore secrets are configured)
   - Create a GitHub Release with the v1.5 tag
   - Upload APK artifacts to the release

### Option 2: Push Tag from Current Branch

If you want to release from this branch directly:

```bash
git push origin v1.5
```

Note: You'll need appropriate permissions to push tags to the repository.

## GitHub Actions Workflow

The release process is automated via `.github/workflows/main.yml`:

- **Trigger**: Push of tag matching `v*` pattern
- **Jobs**: 
  1. Test suite execution
  2. APK build (debug and release)
  3. APK signing (if secrets configured)
  4. Security scan
  5. GitHub Release creation
  6. Asset upload

## Verifying the Release

After pushing the tag, you can monitor the release process:

1. Go to: https://github.com/Kaleaon/CleverFerret/actions
2. Find the workflow run triggered by the `v1.5` tag
3. Once complete, visit: https://github.com/Kaleaon/CleverFerret/releases/tag/v1.5

The release page will include:
- Release notes generated from commit history
- CleverFerret-v1.5-debug.apk
- CleverFerret-v1.5-release.apk (signed if secrets available, otherwise unsigned)
- SHA256 checksums

## APK Installation

Users can download and install the APK:

1. Download `CleverFerret-v1.5-release.apk` from the release page
2. Enable "Install from unknown sources" on Android device if needed
3. Install the APK
4. Grant necessary permissions when launching the app

## Build Details

- **Build Date**: October 30, 2025
- **Android Min SDK**: 26 (Android 8.0)
- **Android Target SDK**: 36 (Android 15)
- **Gradle Version**: 8.13
- **Java Version**: 17
- **Kotlin Version**: 2.1.0
