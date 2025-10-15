# Development Guide

Complete guide for developers who want to build, test, and contribute to CleverFerret.

---

## Prerequisites

### Required Software

- **Android Studio**: Latest stable version (Hedgehog or later recommended)
- **JDK**: Java Development Kit 17 or higher
- **Git**: For version control

### Android SDK Components

Install these through Android Studio SDK Manager:
- **Android SDK Platform 34** (compileSdk)
- **Android SDK Build-Tools 33.0.2**
- **Android SDK Platform-Tools**

---

## Project Setup

### 1. Clone the Repository

```bash
git clone https://github.com/Kaleaon/CleverFerret.git
cd CleverFerret
```

### 2. Open in Android Studio

1. Launch Android Studio
2. Select **Open an Existing Project**
3. Navigate to the cloned directory
4. Wait for Gradle sync to complete

### 3. Build the Project

**Using Android Studio:**
- Go to **Build** → **Make Project**
- Or click the hammer icon in the toolbar

**Using Command Line:**
```bash
# Clean build
./gradlew clean

# Build debug APK (takes ~5 minutes first time)
./gradlew assembleDebug

# Build release APK (takes ~2 minutes)
./gradlew assembleRelease
```

**Important**: First build takes 5-10 minutes. Incremental builds are much faster (1-2 seconds).

---

## Running the App

### On Emulator

1. **Create AVD** (Android Virtual Device):
   - Tools → Device Manager → Create Device
   - Choose a device (e.g., Pixel 5)
   - Select Android API 26+ system image
   - Click Finish

2. **Run the app**:
   - Click the green play button
   - Or press `Shift + F10`

### On Physical Device

1. **Enable Developer Options**:
   - Settings → About Phone → Tap "Build Number" 7 times

2. **Enable USB Debugging**:
   - Settings → Developer Options → USB Debugging

3. **Connect device** via USB and run from Android Studio

---

## Testing

### Running Tests

```bash
# Run all unit tests (~45 seconds)
./gradlew testDebugUnitTest

# Run tests for all variants
./gradlew test

# Generate code coverage report
./gradlew jacocoTestReport
```

**Test Files Location:**
- Unit tests: `CleverFerret/src/test/java/`
- Integration tests: `CleverFerret/src/androidTest/java/`

### Current Test Status

✅ 20 unit tests (all passing)
- LibraryTest
- PeopleTest
- MediaItemDaoTest
- CalibreImportServiceTest
- CalibreImportIntegrationTest

---

## Code Quality

### Code Formatting

The project uses **Spotless** with **ktlint** for consistent code style.

```bash
# Check code formatting
./gradlew spotlessCheck

# Auto-format code (run before committing!)
./gradlew spotlessApply
```

**Important**: Spotless checks will fail the build if code isn't properly formatted. Always run `spotlessApply` before committing.

### Linting

```bash
# Run Android Lint (~49 seconds)
./gradlew lint

# Continue on lint errors (to see all issues)
./gradlew lint --continue
```

**Current Status**: Lint succeeds with 31 warnings (0 errors). This is expected.

### Full Verification

```bash
# Run all checks except lint (~45 seconds)
./gradlew check -x lint
```

---

## Project Structure

```
CleverFerret/
├── src/main/
│   ├── AndroidManifest.xml
│   ├── java/com/universalmedialibrary/
│   │   ├── MainActivity.kt           # Main activity
│   │   ├── MainApplication.kt        # Application class
│   │   ├── data/                     # Room database layer
│   │   │   ├── local/                # Entities, DAOs, Database
│   │   │   └── ...
│   │   ├── di/                       # Hilt dependency injection
│   │   ├── services/                 # Background services
│   │   │   └── CalibreImportForegroundService.kt
│   │   └── ui/                       # Compose UI components
│   │       ├── screens/              # Screen composables
│   │       └── viewmodels/           # ViewModels
│   └── res/                          # Resources (layouts, strings, etc.)
├── src/test/                         # Unit tests
└── build.gradle.kts                  # Module build configuration
```

### Key Packages

- **`data.local`**: Room database entities, DAOs, and database definition
- **`di`**: Hilt modules for dependency injection
- **`services`**: Background services (e.g., Calibre import)
- **`ui`**: Jetpack Compose UI and ViewModels

---

## Build Configuration

### Version Information

- **Min SDK**: 26 (Android 8.0)
- **Target SDK**: 34 (Android 14)
- **Compile SDK**: 36
- **Kotlin**: 2.0.20
- **Gradle**: 8.13
- **Android Gradle Plugin**: 8.13.0

### Key Dependencies

- **Jetpack Compose BOM**: 2025.10.00
- **Hilt**: 2.52
- **Room**: 2.8.2
- **kotlinx-serialization-json**: 1.7.3
- **AndroidX Core**: Latest stable

See `build.gradle.kts` for complete dependency list.

---

## Common Development Tasks

### Adding a New Feature

1. Create a new branch: `git checkout -b feature/your-feature`
2. Implement your feature following the architecture pattern
3. Add tests for new functionality
4. Run code quality checks: `./gradlew spotlessApply lint test`
5. Commit with clear message
6. Push and create a pull request

### Updating Dependencies

1. Edit `build.gradle.kts` (module level)
2. Sync Gradle: **File** → **Sync Project with Gradle Files**
3. Run tests to ensure compatibility
4. Update documentation if needed

### Database Migrations

When changing Room entities:

1. Update entity classes in `data.local`
2. Increment database version in `AppDatabase.kt`
3. Add migration strategy
4. Test migration thoroughly

---

## Contributing

### Before Submitting a PR

1. **Format code**: `./gradlew spotlessApply`
2. **Run tests**: `./gradlew testDebugUnitTest`
3. **Check lint**: `./gradlew lint`
4. **Build successfully**: `./gradlew assembleDebug`
5. **Write clear commit messages**
6. **Update documentation** if needed

### Commit Message Format

```
Type: Brief description (50 chars max)

Detailed explanation if necessary. Wrap at 72 characters.

- Bullet points for multiple changes
- Reference issues: Fixes #123
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

### Code Review Process

1. Submit PR with clear description
2. Automated checks run (CI/CD)
3. Code review by maintainers
4. Address feedback
5. Merge when approved

---

## Troubleshooting

### Gradle Sync Fails

1. **Invalid cache**: File → Invalidate Caches → Restart
2. **Clean project**: `./gradlew clean`
3. **Check JDK version**: File → Project Structure → SDK Location

### Build Errors

- **"Unresolved reference"**: Sync project with Gradle
- **"Duplicate class"**: Clean and rebuild
- **"Out of memory"**: Increase heap size in `gradle.properties`

### Test Failures

1. **Check test output** in Android Studio
2. **Run tests individually** to isolate issues
3. **Verify database state** for integration tests
4. **Check logs**: View → Tool Windows → Logcat

---

## CI/CD Pipeline

GitHub Actions automatically:
- ✅ Builds the project
- ✅ Runs unit tests
- ✅ Generates code coverage
- ✅ Runs lint checks
- ✅ Creates release APKs (on tags)

See `.github/workflows/` for pipeline definitions.

---

## Development Tools

### Recommended Android Studio Plugins

- **Kotlin Plugin**: Pre-installed, keep updated
- **Compose Multipreview**: Preview multiple screen states
- **Database Inspector**: View Room database at runtime

### Useful Gradle Commands

```bash
# List all tasks
./gradlew tasks

# Build with stack trace
./gradlew assembleDebug --stacktrace

# Skip tests
./gradlew assembleDebug -x test

# Clean and build
./gradlew clean assembleDebug

# Generate dependency tree
./gradlew dependencies
```

---

## Getting Help

- **Documentation**: Check [docs/README.md](README.md) for all guides
- **Issues**: [GitHub Issues](https://github.com/Kaleaon/CleverFerret/issues)
- **Discussions**: [GitHub Discussions](https://github.com/Kaleaon/CleverFerret/discussions)
- **Contributing Guide**: [CONTRIBUTING.md](../CONTRIBUTING.md)

---

## Additional Resources

- [Android Developer Guides](https://developer.android.com/guide)
- [Jetpack Compose Documentation](https://developer.android.com/jetpack/compose)
- [Kotlin Language Guide](https://kotlinlang.org/docs/home.html)
- [Material Design 3](https://m3.material.io/)

---

**Happy coding!** 🚀
