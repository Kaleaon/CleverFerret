# Contributing to CleverFerret

## Development Environment Setup

### Prerequisites
- Java 17 (JDK 17)
- Android SDK with API level 34
- Git

### Quick Start
1. Clone the repository
2. Run `./gradlew clean assembleDebug` to build the app
3. Run `./gradlew testDebugUnitTest` to run tests

### Build System
- The project uses Gradle 8.8 with Android Gradle Plugin 8.4.1
- Main module: `CleverFerret/`
- Target SDK: 34 (Android 14)
- Min SDK: 26 (Android 8.0)

### Project Structure
```
CleverFerret/
├── src/main/java/com/universalmedialibrary/
│   ├── MainActivity.kt          # Main entry point
│   ├── MainApplication.kt       # Application class with Hilt
│   ├── data/                    # Room database layer
│   ├── di/                      # Dependency injection
│   ├── services/                # Background services
│   └── ui/                      # Compose UI components
└── src/test/                    # Unit tests
```

### Running Tests
- Unit tests: `./gradlew testDebugUnitTest`
- Build time: ~3-5 minutes (first build), ~1-2 seconds (incremental)

## Code Quality Standards

### Formatting and Style
The project enforces code quality through automated tools:

#### Spotless with ktlint
- **Purpose**: Enforces consistent Kotlin code formatting
- **Configuration**: Uses ktlint 1.0.1 with custom rules (120 char line length, 4-space indentation)
- **Check code formatting**: `./gradlew spotlessCheck`
- **Auto-format code**: `./gradlew spotlessApply`
- **Important**: Always run `spotlessApply` before committing to avoid CI failures

#### Android Lint
- **Purpose**: Detects potential bugs and code quality issues
- **Run locally**: `./gradlew lint`
- **Reports**: Generated in `CleverFerret/build/reports/lint-results-*.html`
- **Note**: Lint warnings won't fail the build, but should be addressed when possible

### Pre-Commit Checklist
Before submitting code, ensure:
1. ✅ Code is properly formatted: `./gradlew spotlessApply`
2. ✅ Spotless check passes: `./gradlew spotlessCheck`
3. ✅ Build succeeds: `./gradlew assembleDebug`
4. ✅ Tests pass: `./gradlew testDebugUnitTest`
5. ✅ Lint check runs: `./gradlew lint` (review warnings)

### Continuous Integration
All pull requests are automatically checked for:
- Code formatting compliance (Spotless)
- Android Lint issues
- Static analysis (Detekt)
- Build success
- Test passage

**CI will fail if code is not properly formatted.** Make sure to run `spotlessApply` before pushing.

### Code Style
- Kotlin coding conventions
- Jetpack Compose for UI
- Hilt for dependency injection
- Room for database
- Line length: max 120 characters
- Indentation: 4 spaces
- Wildcard imports are allowed

## Pull Requests
- Keep changes focused and minimal
- Include tests for new functionality
- Ensure all existing tests pass
- Update documentation as needed
- Run code formatting before submission
- Respond to CI feedback promptly
