# 🤖 CleverFerret AI Assistant Guide

This guide provides comprehensive instructions for AI development assistants (like Jules, Copilot, Gemini) to work effectively with the CleverFerret Universal Media Library project.

---

## 📖 1. Project Overview

CleverFerret is a comprehensive Universal Media Library Android application with a **revolutionary multi-architecture build support** and an **AI-powered development workflow**.

### Key Features:
- **Universal Build System**: Automatically handles different CPU architectures (ARM64, x86_64, etc.).
- **AI-Powered Code Review**: Every code change is reviewed by an AI.
- **Multi-Media Support**: Manages ebooks, music, videos, and podcasts.
- **Modern Tech Stack**: Built with Kotlin, Jetpack Compose, Hilt, and Room.

### Technology Stack:
- **Language**: Kotlin
- **UI Framework**: Jetpack Compose with Material 3
- **Architecture**: MVVM with Hilt for Dependency Injection
- **Database**: Room with SQLite
- **Media Playback**: Media3 ExoPlayer
- **Build System**: Gradle with a custom Universal Build System

---

## 🛠️ 2. Environment Setup

### Prerequisites:
1.  **Java 17+**: OpenJDK is recommended.
2.  **Android SDK**: With Platform 34 and Build Tools 33.0.2+.
3.  **Git**: For cloning the repository.

### Automated Setup (Recommended):
For a fully automated setup, use the provided script.
```bash
# Make the script executable and run it
chmod +x build-scripts/ai-auto-setup.sh && ./build-scripts/ai-auto-setup.sh
```

### Manual Setup:
If manual setup is required, follow these steps:

1.  **Install Java 17**:
    ```bash
    # For Ubuntu/Debian
    sudo apt install openjdk-17-jdk

    # For macOS (using Homebrew)
    brew install openjdk@17
    ```

2.  **Set `JAVA_HOME`**:
    ```bash
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
    ```

3.  **Install Android SDK**:
    - Download the Android SDK command-line tools.
    - Set the `ANDROID_HOME` environment variable.
    ```bash
    export ANDROID_HOME=/path/to/your/android-sdk
    export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
    ```

---

## 🏗️ 3. Universal Build System

This project uses a custom **Universal Build System** to handle multi-architecture builds.

### How It Works:
1.  **Architecture Detection**: Automatically detects the host machine's architecture.
2.  **Tool Selection**: Selects the appropriate AAPT2 binary for the architecture.
3.  **Cache Management**: Manages Gradle caches to use compatible binaries.
4.  **APK Generation**: Builds APKs for all supported Android architectures.

### Key Build Scripts:
-   `build-scripts/universal-build.sh`: The main script for the universal build system.
-   `build-scripts/simple-build.sh`: A simplified script for common build tasks.
-   `build_enhanced_permanent.sh`: Builds with permanent fixes for reliability.

---

## 🚀 4. Building the Project

Always use the provided build scripts instead of raw Gradle commands to ensure a stable build environment.

### Recommended Build Commands:
```bash
# Quick build (detects architecture automatically)
./build-scripts/universal-build.sh build

# Full clean build
./build-scripts/universal-build.sh full-build

# Release build
./build-scripts/universal-build.sh build release
```

### Build with Permanent Fixes:
```bash
# This is a highly reliable build script
./build_enhanced_permanent.sh
```

### Build Timeouts (IMPORTANT):
-   **First build**: Can take up to 5 minutes. Set a timeout of 10+ minutes.
-   **Release build**: Can take up to 2 minutes. Set a timeout of 5+ minutes.
-   **NEVER CANCEL** a build in progress.

---

## 🧪 5. Testing

### Running Tests:
```bash
# Run all unit tests
./gradlew test

# Run instrumented tests
./gradlew connectedAndroidTest

# Run unit tests for the debug build variant
./gradlew testDebugUnitTest
```

### Test Timeouts:
-   `./gradlew testDebugUnitTest`: Can take up to 3 minutes. Set timeout accordingly.

### Lint and Code Quality:
```bash
# Run lint checks
./gradlew lint
```
**Note**: The project has known lint warnings which are expected. The build will still succeed.

---

## 🏛️ 6. Project Architecture

### Main Components:
-   **`CleverFerret/`**: The main Android application module.
-   **`build-scripts/`**: The Universal Build System scripts.
-   **`android-tools/`**: Pre-compiled, multi-architecture Android build tools.
-   **`docs/`**: Additional documentation.
-   **`builds/`**: Output directory for generated APKs.

### Package Structure (`CleverFerret/src/main/java/com/universalmedialibrary/`):
-   **`ui/`**: Jetpack Compose UI components and screens.
-   **`data/`**: Room database entities, DAOs, and repositories.
-   **`domain/`**: Business logic and use cases.
-   **`di/`**: Hilt dependency injection modules.
-   **`players/`**: Media player implementations.

---

## ✍️ 7. Development Guidelines

### Code Style:
-   Follow official Kotlin coding conventions.
-   Use Jetpack Compose for all UI development.
-   Follow MVVM architecture patterns.
-   Use Hilt for dependency injection.

### Git Workflow:
1.  Create a feature branch.
2.  Make changes and commit them.
3.  Push to the repository to trigger the AI code review and CI/CD pipeline.
4.  Ensure all automated checks pass before merging.

---

## 🐛 8. Troubleshooting

### Common Issues:

-   **"AAPT2 Process Failed"**:
    -   **Cause**: Incompatible AAPT2 binary.
    -   **Solution**: Run the self-healing script:
        ```bash
        ./build-scripts/simple-build.sh fix
        ./build-scripts/simple-build.sh build debug
        ```

-   **"Out of Memory Error"**:
    -   **Cause**: Insufficient heap memory for Gradle.
    -   **Solution**: Increase memory allocation:
        ```bash
        export GRADLE_OPTS="-Xmx6g -XX:MaxMetaspaceSize=2g"
        ./build-scripts/universal-build.sh build
        ```

-   **Build Timeouts**:
    -   **Cause**: Long first-time build process.
    -   **Solution**: Be patient and use longer timeouts for build commands.

### Diagnostic Commands:
```bash
# Comprehensive system check
./gradlew diagnose

# Architecture detection test
./build-scripts/universal-build.sh info

# Build environment test
./build-scripts/universal-build.sh test-env
```

---

## 💡 9. AI Tool Specific Tips

### For Jules:
-   Always start with `./build-scripts/universal-build.sh info` to understand the environment.
-   Use the build scripts for all build and test operations.
-   Refer to this document as the single source of truth.

### For GitHub Copilot:
-   Focus on idiomatic Kotlin and Jetpack Compose patterns.
-   Provide suggestions that are compatible with the existing MVVM architecture.

### For Gemini:
-   Assist with architectural decisions and complex debugging.
-   Help with performance optimizations across different CPU architectures.
