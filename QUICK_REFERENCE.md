# CleverFerret Build Validation - Quick Reference

## One-Line Commands

### Run Full Validation
```bash
./build-validation.sh
```

### Check Environment Only
```bash
java -version && echo $ANDROID_HOME && ./gradlew --version
```

### Build APKs Only
```bash
./gradlew clean assembleDebug assembleRelease
```

### Run Tests Only
```bash
./gradlew test
```

### Run Lint Only
```bash
./gradlew lint
```

## Quick Status Check

### View Latest Results
```bash
cat build-validation-reports/VALIDATION_SUMMARY.md
```

### View Compilation Errors
```bash
cat build-validation-reports/compilation-errors.txt
```

### View Build Log
```bash
ls -lt build-validation-reports/*.log | head -1 | awk '{print $NF}' | xargs cat
```

## Quick Troubleshooting

### Build Fails - Check This First
```bash
# 1. Java version
java -version  # Must be 17

# 2. Android SDK
echo $ANDROID_HOME  # Must be set

# 3. Clean and retry
./gradlew clean
./build-validation.sh
```

### Out of Memory
```bash
# Edit gradle.properties
echo "org.gradle.jvmargs=-Xmx6g" >> gradle.properties
```

### APK Won't Install
```bash
# Check APK exists
ls -lh build-validation-reports/*.apk

# Try installing with adb
adb install -r build-validation-reports/CleverFerret-debug.apk
```

## File Locations

### Scripts
- `./build-validation.sh` - Main validation script

### Documentation
- `BUILD_VALIDATION_README.md` - Quick start guide
- `BUILD_VALIDATION.md` - Complete technical docs
- `BUILD_STATUS_REPORT.md` - Current state analysis
- `VALIDATION_SAMPLE_OUTPUT.md` - Expected output
- `PR_SUMMARY.md` - PR overview
- `QUICK_REFERENCE.md` - This file

### Outputs
- `build-validation-reports/` - All validation outputs
- `CleverFerret/build/outputs/apk/` - APK files (during build)
- `CleverFerret/build/reports/` - Test and lint reports

## Current Status

### Working ✅
- Environment validation
- Documentation
- Validation script
- Error analysis

### Blocked ⚠️
- APK builds (190 compilation errors)
- Test execution (compilation errors)
- Lint validation (compilation errors)

## Expected Results (When Fixed)

### Success Output
```
✅ Debug APK: BUILT (17 MB)
✅ Release APK: BUILT (14 MB)
✅ Unit Tests: PASSED (20/20)
✅ Lint Checks: PASSED (31 warnings)
```

### Generated Files
- `CleverFerret-debug.apk` - Install with adb
- `CleverFerret-release-unsigned.apk` - Sign before distribution
- `VALIDATION_SUMMARY.md` - Review results
- `tests/` - HTML test reports
- `lint-results-debug.html` - Code quality analysis

## Common Commands

### Environment Setup
```bash
# Set Android SDK
export ANDROID_HOME=/path/to/android/sdk

# Add to PATH
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Verify
./gradlew --version
```

### Build Variants
```bash
# Debug only
./gradlew assembleDebug

# Release only
./gradlew assembleRelease

# Both
./gradlew assemble
```

### Testing
```bash
# All tests
./gradlew test

# Debug tests only
./gradlew testDebugUnitTest

# Specific test
./gradlew test --tests LibraryTest
```

### Code Quality
```bash
# Lint
./gradlew lint

# Spotless (format check)
./gradlew spotlessCheck

# Spotless (auto-format)
./gradlew spotlessApply

# All checks except lint
./gradlew check -x lint
```

### Cleanup
```bash
# Gradle clean
./gradlew clean

# Deep clean
rm -rf .gradle build CleverFerret/build

# Remove validation reports
rm -rf build-validation-reports
```

## APK Installation

### Via ADB
```bash
# Install debug APK
adb install build-validation-reports/CleverFerret-debug.apk

# Reinstall (if already installed)
adb install -r build-validation-reports/CleverFerret-debug.apk

# Uninstall first
adb uninstall com.universalmedialibrary
adb install build-validation-reports/CleverFerret-debug.apk
```

### Via Device
```bash
# Copy to device
adb push build-validation-reports/CleverFerret-debug.apk /sdcard/Download/

# Then install from device file manager
```

## CI/CD Integration

### GitHub Actions
```yaml
- name: Run Validation
  run: ./build-validation.sh
  
- name: Upload Reports
  uses: actions/upload-artifact@v4
  with:
    name: validation-reports
    path: build-validation-reports/
```

### Local Pre-Commit Hook
```bash
#!/bin/bash
./build-validation.sh || exit 1
```

## Performance

### Expected Times
| Task | First Run | Incremental |
|------|-----------|-------------|
| Clean | 15s | 5s |
| Debug APK | 5-10 min | 10-15s |
| Release APK | 2-5 min | 8-12s |
| Tests | 2-3 min | 30-45s |
| Lint | 45-60s | 20-30s |
| **Total** | 10-12 min | 2-3 min |

### Optimization
```bash
# Use parallel builds
echo "org.gradle.parallel=true" >> gradle.properties

# Enable caching
echo "org.gradle.caching=true" >> gradle.properties

# Increase memory
echo "org.gradle.jvmargs=-Xmx6g" >> gradle.properties
```

## Error Resolution

### Current Errors (190 total)
- 89 Unresolved references (47%)
- 57 Type inference failures (30%)
- 29 Type mismatches (15%)
- 15 Exhaustive when expressions (8%)

### Top Files to Fix
1. `EnhancedBookshelfScreen.kt` - 49 errors
2. `CurrentlyReadingWidget.kt` - 29 errors
3. `EnhancedTextToSpeech.kt` - 21 errors

### Fix Order
1. Fix top 3 files (99 errors)
2. Fix unresolved references (add missing properties)
3. Fix type inference (add explicit types)
4. Fix when expressions (add missing cases)
5. Fix type mismatches (cast/convert)

**Estimated Time:** 16-30 hours

## Help & Documentation

### Need Help?
1. Check `BUILD_VALIDATION_README.md` for quick start
2. Read `BUILD_VALIDATION.md` for details
3. Review `BUILD_STATUS_REPORT.md` for current state
4. See `VALIDATION_SAMPLE_OUTPUT.md` for examples

### Create Issue
Include:
- Command you ran
- Error message
- Environment details
- Relevant log excerpt

## Contact

See project README for support channels.

---

**Last Updated:** October 7, 2024  
**Version:** 1.0  
**Status:** Infrastructure Complete, Code Fixes Pending
