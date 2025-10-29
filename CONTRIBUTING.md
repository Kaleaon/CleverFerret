# Contributing to CleverFerret

Thank you for your interest in contributing to CleverFerret! This guide will help you get started.

## 📋 Table of Contents
- [Development Environment Setup](#development-environment-setup)
- [Code Quality Standards](#code-quality-standards)
- [Testing Guidelines](#testing-guidelines)
- [Pull Request Process](#pull-request-process)
- [Project Structure](#project-structure)

## 🚀 Development Environment Setup

### Prerequisites
- **Java 17 (JDK 17)** - Required for Android Gradle Plugin 8.4.1
- **Android SDK** with the following components:
  - `platform-tools`
  - `platforms;android-36`
  - `build-tools;33.0.2`
- **Git** for version control

### Quick Start
```bash
# Clone the repository
git clone https://github.com/Kaleaon/CleverFerret.git
cd CleverFerret

# Clean and build (first build takes ~5 minutes)
./gradlew clean
./gradlew assembleDebug

# Run tests (~2 minutes)
./gradlew testDebugUnitTest
```

### Build System Details
- **Gradle**: 8.13
- **Android Gradle Plugin**: 8.13.0
- **Kotlin**: 2.0.20
- **Target SDK**: 36 (Android 14+)
- **Min SDK**: 26 (Android 8.0)
- **Main Module**: `CleverFerret/`

### Expected Build Times
- **First build**: ~5 minutes (downloads dependencies)
- **Clean build**: ~2 minutes
- **Incremental build**: 1-2 seconds
- **Unit tests**: ~45 seconds
- **Lint check**: ~49 seconds (succeeds with warnings)

## 📁 Project Structure

```
CleverFerret/
├── src/main/java/com/universalmedialibrary/
│   ├── MainActivity.kt           # Main entry point
│   ├── MainApplication.kt        # Application class with Hilt
│   ├── data/
│   │   ├── local/               # Room database (entities, DAOs)
│   │   └── repository/          # Repository pattern
│   ├── di/                      # Hilt dependency injection modules
│   ├── services/                # Background services
│   │   ├── tts/                 # Text-to-speech
│   │   ├── media/               # Media playback
│   │   ├── integration/         # External API integrations
│   │   └── ...
│   ├── ui/                      # Jetpack Compose UI
│   │   ├── components/          # Reusable composables
│   │   ├── screens/             # Screen-level composables
│   │   ├── theme/               # Material Design theming
│   │   └── viewmodels/          # ViewModels
│   └── utils/                   # Utility classes
├── src/test/                    # Unit tests
└── src/androidTest/             # Instrumentation tests
```

## ✨ Code Quality Standards

### Code Style
- **Language**: Kotlin with modern idioms
- **UI Framework**: Jetpack Compose
- **DI Framework**: Hilt
- **Database**: Room
- **Async**: Kotlin Coroutines and Flow
- **Indentation**: 4 spaces
- **Line Length**: Max 120 characters (guideline, not enforced)

### Kotlin Conventions
- Use immutable data types when possible (`val` over `var`)
- Prefer expression bodies for simple functions
- Use named arguments for improved readability
- Document public APIs with KDoc
- Use meaningful variable and function names

### Pre-Commit Checklist
Before submitting code, ensure:

1. ✅ **Build succeeds**
   ```bash
   ./gradlew assembleDebug
   ```

2. ✅ **Tests pass**
   ```bash
   ./gradlew testDebugUnitTest
   ```

3. ✅ **Lint check runs** (warnings expected)
   ```bash
   ./gradlew lint
   ```
   - Review HTML report: `CleverFerret/build/reports/lint-results-*.html`
   - Fix critical issues (errors), address warnings when reasonable

4. ✅ **Code is documented**
   - Add KDoc to public functions and classes
   - Update relevant documentation files

5. ✅ **No unintended changes**
   - Review `git diff` before committing
   - Don't commit build artifacts or IDE files

### Documentation Standards
- Add KDoc comments to all public APIs
- Include parameter descriptions with `@param`
- Document return values with `@return`
- Add usage examples for complex APIs
- Update relevant `.md` files when adding features

## 🧪 Testing Guidelines

### Unit Tests
- Write tests for new functionality
- Follow existing test patterns
- Use descriptive test names: `testFeature_condition_expectedResult`
- Mock external dependencies
- Test edge cases and error conditions

### Running Tests
```bash
# Run all unit tests
./gradlew testDebugUnitTest

# Run specific test
./gradlew testDebugUnitTest --tests "com.example.MyTest"

# Run tests with coverage
./gradlew jacocoTestReport
```

### Test Structure
```kotlin
class MyServiceTest {
    @Test
    fun `myFunction returns expected value when given valid input`() {
        // Arrange
        val input = "test"
        
        // Act
        val result = myService.myFunction(input)
        
        // Assert
        assertEquals("expected", result)
    }
}
```

## 🔄 Pull Request Process

### Before Submitting
1. Create a focused branch from `main`
   ```bash
   git checkout -b feature/my-feature
   ```

2. Make minimal, focused changes
   - One feature or bug fix per PR
   - Keep changes as small as possible
   - Don't refactor unrelated code

3. Write clear commit messages
   ```
   Add feature X to improve Y
   
   - Added new component for Z
   - Updated documentation
   - Added unit tests
   ```

4. Run the pre-commit checklist (above)

### Submitting a PR
1. Push your branch to GitHub
2. Create a pull request with:
   - **Clear title** describing the change
   - **Description** explaining what and why
   - **Testing notes** describing how to test
   - **Screenshots** for UI changes

3. Respond to feedback promptly
4. Keep PR updated with `main` if needed

### PR Review Checklist
Reviewers will check for:
- ✅ Code follows project conventions
- ✅ Changes are minimal and focused
- ✅ Tests are included and passing
- ✅ Documentation is updated
- ✅ No unnecessary changes or reformatting
- ✅ CI checks pass

## 🐛 Reporting Issues

When reporting bugs, include:
- Steps to reproduce
- Expected vs actual behavior
- Device/Android version
- Relevant logs or screenshots

## 📚 Additional Resources

- [DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md) - Detailed development guide
- [CODE_QUALITY.md](CODE_QUALITY.md) - Code quality tools and processes
- [ARCHITECTURE.md](docs/ARCHITECTURE.md) - Technical architecture
- [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md) - Complete docs index

## 🙏 Thank You!

Your contributions help make CleverFerret better for everyone. We appreciate your time and effort!

---

*For questions or help, open an issue on GitHub or check existing documentation.*
