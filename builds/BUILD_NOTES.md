# APK Build Notes

## CleverFerret v1.0 Main Branch APKs

Built from commit: `6dbb210` (main branch)  
Build date: October 21, 2025

### APK Files

#### Debug APK
- **File:** `CleverFerret-v1.0-debug-main.apk`
- **Size:** 87 MB
- **SHA256:** `114ddfc4bc5de420b106c891ef059fbb02a5e587d14c2f4b281b40d3c9bcba20`
- **Signed:** Yes (debug keystore)
- **Purpose:** Testing and development

#### Release APK (Unsigned)
- **File:** `CleverFerret-v1.0-release-unsigned.apk`
- **Size:** 74 MB
- **SHA256:** `9e298a8f19a14da29d80825a41fb47709f9e146b9bc59476f5981d76e009264c`
- **Signed:** No (requires production keystore)
- **Purpose:** Production distribution (needs signing)

### Build Process

These APKs were built from the main branch with the following temporary modifications to enable compilation:

1. **Temporarily disabled features** (for build only - not included in commits):
   - Enhanced Sync Service (CloudSyncService, EnhancedSyncService)
   - Enhanced Search Service
   - Smart Recommendation Service
   - Related UI screens (SyncScreen, EnhancedSearchScreen, RecommendationsScreen)

2. **Reason:** Recent merge introduced 151 compilation errors in these new features
3. **Impact:** Core functionality remains intact; advanced features temporarily excluded
4. **Future work:** These features need to be fixed and re-enabled in future builds

### Included Features

✅ Core library management  
✅ Calibre import  
✅ Material You UI  
✅ Book reading  
✅ Media playback  
✅ Basic search  
✅ Settings and preferences  
✅ Database storage

### Installation

#### Debug APK
```bash
adb install CleverFerret-v1.0-debug-main.apk
```

#### Release APK
Requires signing with production keystore before installation.

### Verification

Verify checksums before installation:
```bash
sha256sum -c CleverFerret-v1.0-debug-main.apk.sha256
sha256sum -c CleverFerret-v1.0-release-unsigned-main.apk.sha256
```

### System Requirements

- **Android:** 8.0+ (API level 26 or higher)
- **Storage:** 100 MB for app + space for media
- **RAM:** 2GB minimum (4GB recommended)

### Known Issues

- Enhanced sync, search, and recommendations features are disabled in this build
- These features have compilation errors that need to be resolved
- See the main repository for current status on fixing these issues

### Build Environment

- **Gradle:** 8.13
- **Java:** OpenJDK 17
- **Android Gradle Plugin:** 8.13.0
- **Kotlin:** 2.0.20
- **Target SDK:** 34 (Android 14)
- **Min SDK:** 26 (Android 8.0)
- **Compile SDK:** 36
