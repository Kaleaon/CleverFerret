# CleverFerret - Universal Media Library

**Android Development Instructions for GitHub Copilot**

This file provides comprehensive guidance for AI assistants working on the CleverFerret Universal Media Library Android application. Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

## Working Effectively

### Bootstrap and Build the Repository
- Install Java 17 (JDK 17): Required for Android Gradle Plugin 8.4.1
- Install Android SDK with required components:
  - `platform-tools`
  - `platforms;android-34` 
  - `build-tools;34.0.0`
- Build the project:
  - `./gradlew clean` -- takes 2 minutes first time with Gradle setup. NEVER CANCEL.
  - `./gradlew assembleDebug` -- takes 5 minutes for first build. NEVER CANCEL. Set timeout to 10+ minutes.
  - Incremental builds: `./gradlew assembleDebug` -- takes 1-2 seconds when no changes
  - Release build: `./gradlew assembleRelease` -- takes 2 minutes. NEVER CANCEL. Set timeout to 5+ minutes.

### Run Tests
- Unit tests: `./gradlew testDebugUnitTest` -- takes 45 seconds. NEVER CANCEL. Set timeout to 2+ minutes.
- All tests: `./gradlew test` -- runs unit tests for all variants
- Code coverage: `./gradlew jacocoTestReport` -- takes 6 seconds. Requires tests to run first.

### Lint and Code Quality  
- Lint check: `./gradlew lint` -- currently FAILS due to missing service class `CalibreImportForegroundService`
- Known lint issues: MissingClass (1 error), ScopedStorage (2 warnings), UnknownIssueId (6 warnings)
- Use skip lint for builds: `./gradlew check -x lint` -- takes ~45 seconds, runs all tests including release variant
- For development: Focus on unit tests and building rather than lint until missing service is implemented

### Application Information
- **Package Name:** `com.universalmedialibrary`
- **Main Module:** `CleverFerret`
- **Min SDK:** 24 (Android 7.0)
- **Target SDK:** 34 (Android 14)  
- **Version:** 1.0 (versionCode 1)
- **Architecture:** Kotlin + Jetpack Compose + Material You + Hilt + Room

## Validation

### Manual App Testing
- ALWAYS run through at least one complete end-to-end scenario after making changes
- Build APK location: `CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk`
- Release APK location: `CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk`
- You CANNOT run the Android app in this environment, but you can build and inspect the APK

### First-Run State Validation
The app is designed to start in a clean, first-run state:
1. Empty library screen (no existing data)
2. "+" button available to create new libraries
3. Menu option "Import Calibre Library" available  
4. Clean database and preferences
5. Ready for user to create new libraries or import from Calibre

### CI/CD Validation
- Always run the same checks as CI before committing:
  - `./gradlew --no-daemon --stacktrace assembleDebug`
  - `./gradlew --no-daemon --stacktrace testDebugUnitTest` 
  - `./gradlew --no-daemon --stacktrace jacocoTestReport`
  - `./gradlew --no-daemon --stacktrace lint` (currently fails - expect 1 error, 8 warnings)
- Alternative: `./gradlew check -x lint` -- runs all verification tasks except lint (~45 seconds)
- GitHub Actions workflows: `.github/workflows/android_ci.yml` and `.github/workflows/release.yml` may skip lint

## Common Tasks

### Key Project Structure
```
.
├── README.md                    # Project overview and architecture
├── build.gradle.kts            # Root build configuration  
├── settings.gradle.kts         # Gradle settings
├── gradle.properties           # Gradle properties
├── CleverFerret/               # Main Android module
│   ├── build.gradle.kts        # Module build configuration
│   ├── src/main/
│   │   ├── AndroidManifest.xml
│   │   └── java/com/universalmedialibrary/
│   │       ├── MainActivity.kt          # Main activity with Compose UI
│   │       ├── MainApplication.kt       # Application class with Hilt
│   │       ├── data/                    # Room database layer  
│   │       ├── di/                      # Hilt dependency injection
│   │       ├── services/                # Background services
│   │       └── ui/                      # Compose UI components
│   ├── src/test/                # Unit tests (20 tests, all pass)
│   └── src/androidTest/         # Instrumentation tests
├── .github/workflows/           # CI/CD automation
│   ├── android_ci.yml          # Main CI pipeline
│   └── release.yml             # Release automation
└── *.md                        # Documentation files
```

### Timing Expectations (CRITICAL - NEVER CANCEL)
- **First build**: ~5 minutes for `assembleDebug` - Set timeout to 10+ minutes
- **Release build**: ~2 minutes for `assembleRelease` - Set timeout to 5+ minutes  
- **Unit tests**: ~2m 27s for `testDebugUnitTest` - Set timeout to 3+ minutes
- **Full check without lint**: ~45 seconds for `check -x lint` - Set timeout to 2+ minutes
- **Lint check**: ~49 seconds (succeeds with warnings) - Set timeout to 2+ minutes
- **Incremental builds**: 1-2 seconds when no changes
- **Clean**: ~1m 26s first time with Gradle setup

### Development Dependencies
The project uses standard Android development dependencies:
- **Kotlin**: 1.9.23
- **Android Gradle Plugin**: 8.4.1  
- **Gradle**: 8.8
- **Jetpack Compose BOM**: 2024.05.00
- **Hilt**: 2.51.1
- **Room**: 2.6.1
- **AndroidX**: Latest stable versions

### Common Build Issues
- **Lint warnings are expected**: The project has 31 known lint warnings (DefaultLocale, obsolete dependencies, etc.)
- **Gradle deprecations**: Some deprecation warnings appear but don't affect functionality
- **Memory**: Gradle is configured with 2GB heap via `gradle.properties`
- **NDK not required**: Project doesn't use native code
- **Kotlin warnings**: ~15 Kotlin compiler warnings (deprecated APIs, unused variables, etc.) are expected

### Release Process
- Manual release: Follow instructions in `RELEASE.md`
- Automated release: Push tag starting with `v*` (e.g., `v1.0.1`) to trigger GitHub Actions
- Release APK path: `CleverFerret/build/outputs/apk/release/CleverFerret-release-unsigned.apk`
- Target file size: ~13-16 MB for release APK

## Key File References

### build.gradle.kts (CleverFerret module)
```kotlin
android {
    namespace = "com.universalmedialibrary"
    compileSdk = 34
    
    defaultConfig {
        applicationId = "com.universalmedialibrary"
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }
}
```

### AndroidManifest.xml
```xml
<application android:name=".MainApplication">
    <activity android:name=".MainActivity" android:exported="true">
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
    </activity>
    <service android:name=".services.CalibreImportForegroundService" />
</application>
```

### Test Command Output Reference
```bash
$ ./gradlew testDebugUnitTest
BUILD SUCCESSFUL in 2m 27s
# 20 tests pass including:
# - LibraryTest
# - PeopleTest  
# - MediaItemDaoTest
# - CalibreImportServiceTest
# - CalibreImportIntegrationTest

$ ./gradlew check -x lint
BUILD SUCCESSFUL in 45s
# Runs tests for debug and release variants
# 74 actionable tasks: 38 executed, 36 up-to-date
```

Always check the specific file you're working on by viewing its current content rather than making assumptions about the codebase structure.

## Code Patterns and Style

### Kotlin Best Practices
- Use data classes for model objects (e.g., `MediaItem`, `Library`)
- Prefer sealed classes for state management in ViewModels
- Use extension functions for utility operations
- Follow kotlinx.coroutines patterns for async operations

### Jetpack Compose Guidelines
- Use `@Composable` functions with proper state hoisting
- Implement ViewModel integration with `hiltViewModel()`
- Use `collectAsState()` for observing state changes
- Follow Material Design 3 theming patterns

### Architecture Patterns
- **MVVM**: ViewModels manage UI state, Views observe and react
- **Repository Pattern**: Abstract data layer with Room database
- **Dependency Injection**: Use Hilt annotations (`@HiltAndroidApp`, `@AndroidEntryPoint`)
- **Navigation**: Use Navigation Compose for screen transitions

### Common Code Issues to Watch For
- Missing service implementations (like `CalibreImportForegroundService`)
- Deprecated permission usage (use scoped storage permissions)
- Room database migrations when schema changes
- Proper error handling in coroutines with try-catch blocks

## Development Workflow

### Before Making Changes
1. Always run `./gradlew check -x lint` to validate current state
2. Check if related unit tests exist and are passing
3. Review existing code patterns in similar files
4. Ensure Hilt dependency injection is properly configured

### After Making Changes
1. Run relevant unit tests: `./gradlew testDebugUnitTest`
2. Build debug APK: `./gradlew assembleDebug`
3. Check for new lint issues (if fixing lint-related code)
4. Test integration points between components

### Testing Strategy
- **Unit Tests**: Focus on ViewModels, Repository classes, and utility functions
- **Integration Tests**: Test Room database operations and service integrations
- **UI Tests**: Limited due to Compose complexity, focus on state management
- **Manual Testing**: Build APK and validate core functionality

## Project-Specific Context

### Current Development Status
- **Working**: Core app structure, database schema, basic UI screens
- **In Progress**: Media library functionality, Calibre import services
- **Missing**: `CalibreImportForegroundService` implementation (causes lint failure)
- **Known Issues**: Storage permissions need scoped storage update for Android 13+

### Key Files to Understand
- `MainActivity.kt`: Entry point with Compose setup
- `MainApplication.kt`: Hilt application configuration
- `data/` directory: Room database entities and DAOs
- `ui/` directory: Compose screens and components
- `di/` directory: Hilt dependency modules

### External Dependencies
- **Room**: Database persistence with coroutines support
- **Hilt**: Dependency injection throughout the app
- **Compose BOM**: UI framework with Material Design 3
- **Navigation Compose**: Screen navigation and deep linking