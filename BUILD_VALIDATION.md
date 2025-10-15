# CleverFerret Android Build and Validation Workflow

This document describes the comprehensive build and validation workflow for the CleverFerret Android application.

## Overview

The CleverFerret Android app uses a standard Gradle-based build system with the following components:
- **Language:** Kotlin 2.1.0
- **Build System:** Gradle 8.13 with Android Gradle Plugin 8.13.0
- **Min SDK:** 26 (Android 8.0)
- **Target SDK:** 36 (Android 14+)
- **Architecture:** Jetpack Compose + Material You + Hilt + Room

## Prerequisites

### Required Software
1. **Java Development Kit (JDK) 17**
   - Required for Android Gradle Plugin 8.4.1+
   - Verify: `java -version` should show version 17.x.x

2. **Android SDK**
   - Platform Tools
   - Platform SDK: API 36 (android-36)
   - Build Tools: 36.0.0 or later
   - Set `ANDROID_HOME` environment variable

3. **Git**
   - For version control and dependency management

### Environment Setup
```bash
# Set Android SDK location
export ANDROID_HOME=/path/to/android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

# Verify environment
java -version                 # Should show Java 17
echo $ANDROID_HOME           # Should show SDK path
./gradlew --version          # Should show Gradle 8.13
```

## Build Commands

### 1. Clean Build
Remove all build artifacts before starting fresh:
```bash
./gradlew clean
```
**Expected Time:** 1-2 minutes first run  
**Success Criteria:** "BUILD SUCCESSFUL" message

### 2. Build Debug APK
Build the debug variant for development and testing:
```bash
./gradlew assembleDebug
```
**Expected Time:** 5-10 minutes first build, 1-2 seconds incremental  
**Output Location:** `CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk`  
**Expected Size:** ~15-20 MB  
**Success Criteria:**
- "BUILD SUCCESSFUL" message
- APK file exists at output location
- APK can be installed on device/emulator

#### Debug APK Details
- Signed with debug keystore (auto-generated)
- Debuggable: Yes
- Minification: Disabled
- ProGuard: Disabled
- Use for: Development, testing, debugging

### 3. Build Release APK
Build the release variant for distribution:
```bash
./gradlew assembleRelease
```
**Expected Time:** 2-5 minutes  
**Output Location:** `CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk`  
**Expected Size:** ~13-16 MB  
**Success Criteria:**
- "BUILD SUCCESSFUL" message  
- APK file exists at output location
- APK passes verification (if signed)

#### Release APK Details
- Requires signing for distribution (unsigned by default)
- Debuggable: No  
- Minification: Currently disabled (can be enabled)
- ProGuard: Available but not enabled
- Use for: Production distribution, Google Play Store

### 4. Signing Release APK
For production distribution, the release APK must be signed:

#### Using jarsigner (Java tool):
```bash
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
  -keystore release.keystore \
  CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk \
  releasekey
```

#### Using apksigner (Android tool):
```bash
$ANDROID_HOME/build-tools/36.0.0/apksigner sign \
  --ks release.keystore \
  --ks-key-alias releasekey \
  --out CleverFerret-release-signed.apk \
  CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk
```

**Note:** See `docs/dev/KEYSTORE_MANAGEMENT.md` for keystore creation and management.

## Testing

### Run All Unit Tests
Execute the complete test suite:
```bash
./gradlew test
```
**Expected Time:** 2-3 minutes  
**Expected Results:** 20 tests passing  
**Test Report:** `CleverFerret/build/reports/tests/testDebugUnitTest/index.html`

### Run Debug Unit Tests Only
```bash
./gradlew testDebugUnitTest
```

### Run Specific Test Class
```bash
./gradlew test --tests com.universalmedialibrary.data.LibraryTest
```

### Test Coverage Report
Generate code coverage analysis:
```bash
./gradlew jacocoTestReport
```
**Report Location:** `CleverFerret/build/reports/jacoco/jacocoTestReport/html/index.html`

### Current Test Status
The project includes the following test suites:
- ✅ LibraryTest
- ✅ PeopleTest
- ✅ MediaItemDaoTest
- ✅ CalibreImportServiceTest
- ✅ CalibreImportIntegrationTest

**Total:** 20 unit tests (all should pass)

## Code Quality Checks

### Lint Analysis
Run Android Lint to detect potential bugs and code quality issues:
```bash
./gradlew lint
```
**Expected Time:** 45-60 seconds  
**Expected Results:** 31 warnings, 0 errors (current baseline)  
**Report Location:** `CleverFerret/build/reports/lint-results-debug.html`

#### Known Lint Warnings (Expected)
- DefaultLocale: 6 warnings
- GradleDependency: 21 warnings  
- OldTargetApi: 1 warning
- SwitchIntDef: 2 warnings
- KaptUsageInsteadOfKsp: 1 warning

These warnings are acceptable for the current state and do not prevent builds.

### Spotless Code Formatting
Check code formatting compliance:
```bash
./gradlew spotlessCheck
```

Auto-format code to comply with standards:
```bash
./gradlew spotlessApply
```

### Full Verification (Without Lint)
Run all checks including tests:
```bash
./gradlew check -x lint
```
**Expected Time:** ~45 seconds  
**Runs:** All tests for debug and release variants

## Build Validation Workflow

### Automated Validation Script
Use the provided `build-validation.sh` script for comprehensive validation:

```bash
./build-validation.sh
```

This script performs the following steps:
1. ✅ Environment validation (Java 17, Android SDK, Gradle)
2. 🧹 Clean previous build artifacts
3. 📱 Build debug APK
4. 📱 Build release APK
5. 🧪 Run all unit tests
6. 🔍 Run lint checks
7. 📊 Generate validation summary report

**Output Directory:** `build-validation-reports/`

**Generated Files:**
- `VALIDATION_SUMMARY.md` - Comprehensive results summary
- `build-validation-YYYYMMDD-HHMMSS.log` - Detailed build log
- `CleverFerret-debug.apk` - Debug APK (if successful)
- `CleverFerret-release-unsigned.apk` - Release APK (if successful)
- `compilation-errors.txt` - List of compilation errors (if any)
- `tests/` - Test reports
- `lint-results-debug.html` - Lint analysis report

## Current Build Status

### ⚠️  Known Issues

**As of October 2024**, the project has compilation errors that prevent successful builds:

**Error Summary:**
- **Total Errors:** ~191 compilation errors
- **Affected Files:** 40+ source files
- **Primary Issues:**
  - Unresolved references (missing properties/methods)
  - Type inference failures
  - Non-exhaustive when expressions
  - Type mismatches

**Most Affected Files:**
1. `EnhancedBookshelfScreen.kt` - 50 errors
2. `CurrentlyReadingWidget.kt` - 29 errors
3. `EnhancedTextToSpeech.kt` - 21 errors
4. `PodcastManagerScreen.kt` - 7 errors
5. `MetadataApiService.kt` - 7 errors

**Root Causes:**
- Incomplete feature implementations
- API version mismatches
- Missing data model properties
- Incompatible library upgrades

### 🔧 Resolution Required

To restore builds to working state, the following fixes are needed:

1. **Resolve Unresolved References**
   - Add missing properties to data models
   - Implement missing methods in services
   - Fix import statements

2. **Fix Type Inference Issues**
   - Add explicit type annotations
   - Resolve generic type parameters
   - Fix lambda parameter types

3. **Complete When Expressions**
   - Add missing enum cases
   - Add else branches where appropriate

4. **Align API Versions**
   - Ensure consistent library versions
   - Update deprecated API usages
   - Resolve dependency conflicts

## CI/CD Integration

### GitHub Actions Workflow
The project includes a CI/CD pipeline (`.github/workflows/main.yml`) that:
- Runs on push to `main` and `develop` branches
- Executes on pull requests
- Can be manually triggered

**Workflow Steps:**
1. **Test Job:**
   - Compile project (`compileDebugKotlin`)
   - Run unit tests (`testDebugUnitTest`)
   - Run lint checks (`lintDebug`)
   - Upload test and lint reports

2. **Build Job:**
   - Build debug APK (`assembleDebug`)
   - Build release APK (`assembleRelease`)
   - Sign release APK (if secrets available)
   - Upload APK artifacts

3. **Security Scan Job:**
   - Scan APK for security vulnerabilities
   - Check for hardcoded secrets
   - Verify code signing

**Note:** Currently, the CI workflow uses `--continue` and `continue-on-error: true` to allow builds to proceed despite compilation errors. This should be removed once all errors are resolved.

## Success Criteria

A successful build and validation should meet the following criteria:

### ✅ Build Criteria
- [ ] Debug APK builds without errors
- [ ] Release APK builds without errors
- [ ] Debug APK size: 15-20 MB
- [ ] Release APK size: 13-16 MB
- [ ] APKs are properly signed
- [ ] APKs install on Android 15+ devices

### ✅ Test Criteria
- [ ] All 20 unit tests pass
- [ ] Test execution time < 3 minutes
- [ ] Code coverage > 60% (target)
- [ ] No test flakiness

### ✅ Quality Criteria  
- [ ] Lint errors: 0
- [ ] Lint warnings: ≤ 31 (current baseline)
- [ ] Code formatting: 100% compliant (Spotless)
- [ ] No security vulnerabilities (high/critical)

### ✅ Functional Criteria
- [ ] App launches successfully
- [ ] No crash on startup
- [ ] Main features accessible
- [ ] Database initializes correctly
- [ ] UI renders properly

## Build Optimization

### Improving Build Speed

1. **Enable Gradle Daemon:**
   ```bash
   # In gradle.properties
   org.gradle.daemon=true
   ```

2. **Increase Memory Allocation:**
   ```bash
   # In gradle.properties
   org.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g
   ```

3. **Enable Parallel Execution:**
   ```bash
   # In gradle.properties
   org.gradle.parallel=true
   org.gradle.caching=true
   ```

4. **Use Configuration Cache:**
   ```bash
   ./gradlew assembleDebug --configuration-cache
   ```

### Reducing APK Size

1. **Enable Minification:**
   ```kotlin
   // In build.gradle.kts
   buildTypes {
       release {
           isMinifyEnabled = true
           proguardFiles(...)
       }
   }
   ```

2. **Enable Resource Shrinking:**
   ```kotlin
   buildTypes {
       release {
           isShrinkResources = true
       }
   }
   ```

3. **Use APK Splits:**
   ```kotlin
   splits {
       abi {
           isEnable = true
           reset()
           include("armeabi-v7a", "arm64-v8a", "x86", "x86_64")
       }
   }
   ```

## Troubleshooting

### Build Fails with "Out of Memory"
**Solution:** Increase Gradle heap size in `gradle.properties`:
```properties
org.gradle.jvmargs=-Xmx6g -XX:MaxMetaspaceSize=2g
```

### Build Fails with "SDK Location Not Found"
**Solution:** Create `local.properties` with:
```properties
sdk.dir=/path/to/android/sdk
```

### Tests Fail with "No Tests Found"
**Solution:** Ensure test source set is configured:
```kotlin
sourceSets {
    test {
        java.srcDirs("src/test/java")
    }
}
```

### Lint Fails with Many Errors
**Solution:** Current lint configuration allows warnings. Check:
```kotlin
lint {
    abortOnError = false
    warningsAsErrors = false
}
```

### APK Won't Install on Device
**Possible Causes:**
- APK not signed (use debug keystore)
- Signature mismatch (uninstall old version)
- Min SDK not met (device < Android 8.0)
- Insufficient storage space

## Additional Resources

- **Project Documentation:** `/docs/DEVELOPMENT.md`
- **Keystore Management:** `/docs/dev/KEYSTORE_MANAGEMENT.md`
- **Contributing Guidelines:** `/CONTRIBUTING.md`
- **Release Process:** `/docs/RELEASE.md`
- **Architecture Guide:** `/README.md`

## Support

For build issues or questions:
1. Check this documentation first
2. Review GitHub Issues for similar problems
3. Check CI/CD build logs in GitHub Actions
4. Consult Android Studio build output
5. Create a new issue with:
   - Build command used
   - Full error message
   - Environment details (OS, Java version, SDK version)
   - Build log excerpt

---

**Last Updated:** October 2024  
**Maintainer:** CleverFerret Development Team  
**Version:** 1.0
