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

### Code Style
- Kotlin coding conventions
- Jetpack Compose for UI
- Hilt for dependency injection
- Room for database

## Pull Requests
- Keep changes focused and minimal
- Include tests for new functionality
- Ensure all existing tests pass
- Update documentation as needed