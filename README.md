# 🦫 CleverFerret Universal Media Library

![Android CI](https://github.com/Kaleaon/CleverFerret/workflows/Android%20CI/badge.svg)
[![Latest Release](https://img.shields.io/github/v/release/Kaleaon/CleverFerret)](https://github.com/Kaleaon/CleverFerret/releases)

<!-- AI Review & Upload System: ENABLED ✅ -->

## 📱 Direct APK Downloads

### 🔥 Latest Release APK (Recommended)
**[Download CleverFerret-release-latest.apk](https://github.com/Kaleaon/CleverFerret/raw/main/builds/latest/CleverFerret-release-latest.apk)** (~10MB)

### 🛠️ Debug APK (Development)
**[Download CleverFerret-debug-latest.apk](https://github.com/Kaleaon/CleverFerret/raw/main/builds/latest/CleverFerret-debug-latest.apk)** (~13MB)

### 📦 Stable Releases
Check the [Releases page](https://github.com/Kaleaon/CleverFerret/releases) for versioned releases with full release notes.

---

## 📖 Overview

CleverFerret is a **working Android application** for creating a Universal Media Library for managing books, music, movies, and podcasts. The project uses modern Android architecture and is currently functional for development and testing.

## ✅ Current Build Status

**✅ Successfully Building**: The application compiles and generates working APK files.

- **Build Time**: ~5 minutes (initial), ~2 minutes (incremental)
- **Test Time**: ~45 seconds  
- **APK Size**: ~10MB (Release), ~13MB (Debug)
- **Target**: Android API 34 (Android 14)
- **Minimum**: Android API 24 (Android 7.0)

### Quick Start
```bash
# Build debug APK
./gradlew assembleDebug

# Run tests
./gradlew testDebugUnitTest

# Generated APK location
# CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk
```

## 🏗️ Architecture
- **📱 Modern Android Architecture**: Jetpack Compose UI with Material 3 design
- **🔧 Dependency Injection**: Hilt DI framework configured  
- **🗄️ Database Layer**: Room database with media library schema
- **🎨 UI Framework**: Compose-based screens for media management
- **📱 Navigation**: Navigation Compose for screen transitions

### Planned Features (In Development)
- **📚 Universal Media Support**: Books (EPUB/PDF), Music (MP3/FLAC), Movies (MP4), Podcasts
- **📖 E-Reader**: Document viewing and reading capabilities
- **🎵 Audio Player**: Music playbook with metadata support  
- **🎬 Video Player**: Video playback integration
- **📊 Calibre Integration**: Import libraries from Calibre

## 🛠️ Build Instructions

```bash
# Clone the repository
git clone https://github.com/Kaleaon/CleverFerret.git
cd CleverFerret

# Build debug APK
./gradlew assembleDebug

# Run tests
./gradlew testDebugUnitTest

# Find your APK
ls -la CleverFerret/build/outputs/apk/debug/
```

### Requirements
- Java 17 or higher
- Android SDK (API 34)
- Build tools 33.0.2+

### CI/CD
GitHub Actions automatically builds and tests on every push, producing APK artifacts.

## 📝 Documentation
- [BUILD_STATUS.md](BUILD_STATUS.md) - Current build status and instructions
- [CLEVERFERRET_APK_READY.md](CLEVERFERRET_APK_READY.md) - APK availability information
4. **Detailed Failure Analysis** - Failed reviews include:
   - **Why it failed** - Comprehensive explanations
   - **What's problematic** - Specific issue identification  
   - **Impact assessment** - What could break
   - **Step-by-step fixes** - How to resolve issues
   - **Code examples** - Corrected code snippets
5. **Auto-Build** - Approved changes trigger automatic APK builds
6. **Auto-Publish** - Successful builds are committed to `builds/` directory

### Benefits

- ✅ **Prevents Breaking Changes** - Blocks builds that could break functionality
- ✅ **Maintains Quality** - Ensures code meets project standards
- ✅ **Faster Feedback** - Immediate review results on pull requests
- ✅ **Zero Configuration** - Works automatically on every push
- ✅ **Always Current** - Latest approved builds always available

### Build Downloads

🎯 **Ready-to-install APKs** are available in the [`builds/`](./builds/) directory after each successful AI review.

## 🚀 Quick Start

### Prerequisites

1. **Java 17+** (OpenJDK recommended)
2. **Android SDK** with Platform 34 and Build Tools 33.0.2+
3. **Git** (for cloning the repository)

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd CleverFerret

# Make build scripts executable
chmod +x build-scripts/*.sh

# Run system diagnostics
./build-scripts/universal-build.sh info
```

## 🛠️ Building (Current Issues)

**⚠️ Build Status**: The project currently has compilation issues and cannot be built successfully.

### Known Issues
- Dependency resolution failures
- Kotlin compilation errors during kapt phase
- Missing or incompatible library dependencies

### Standard Android Build Commands
```bash
# These commands currently fail due to compilation issues:
./gradlew assembleDebug    # Debug build (currently failing)
./gradlew testDebugUnitTest    # Unit tests (currently failing)
```

### Development Environment Setup
- **Java**: OpenJDK 17 or later
- **Android SDK**: API 34 with build tools 34.0.0
- **IDE**: Android Studio or IntelliJ with Android plugin

## 🔧 Project Structure

The project follows modern Android development patterns:

```
CleverFerret/
├── src/main/java/com/universalmedialibrary/
│   ├── MainActivity.kt                 # Main entry point
│   ├── CleverFerretApplication.kt     # App class with Hilt
│   ├── data/                          # Room database entities
│   ├── ui/                            # Compose UI screens  
│   ├── services/                      # Background services
│   └── navigation/                    # Navigation setup
├── build.gradle.kts                   # Module configuration
└── src/test/                          # Unit tests
```
    D --> E[Run Build Tasks]
    E --> F[Generate Multi-Arch APKs]
    F --> G[Verify & Report Results]
```

## 📱 Application Features

### Core Functionality

- **📚 eBook Library**: Support for EPUB, PDF, and text formats
- **🎵 Music Player**: Advanced audio playback with metadata support
- **🎬 Video Library**: Video file management and playback
- **🎧 Podcast Manager**: Podcast subscription and playback
- **📖 Calibre Integration**: Import and sync with Calibre libraries
- **🔍 Universal Search**: Search across all media types
- **🏷️ Smart Metadata**: Automatic metadata extraction and management

### Technical Stack

- **UI Framework**: Jetpack Compose with Material 3
- **Architecture**: MVVM with Hilt dependency injection
- **Database**: Room with SQLite
- **Media Playback**: Media3 ExoPlayer
- **Networking**: OkHttp3 with Kotlin Serialization
- **File Processing**: Apache Commons, iText7, JSoup

## 🛠️ Development Guide

### Automated Build Workflows

The project includes multiple CI/CD workflows for different purposes:

*   **Comprehensive CI** (`android_ci.yml`): Full build, test, lint, and coverage analysis
*   **Release Builds** (`release.yml`): Automated release builds when tags are pushed
*   **Automated Build** (`automated-build.yml`): Quick builds using third-party automation

For more details on the automated build workflow, see [AUTOMATED_BUILD.md](./AUTOMATED_BUILD.md).

### Project Structure

```
CleverFerret/
├── android-tools/              # Multi-architecture build tools
├── build-scripts/              # Universal build scripts
├── buildSrc/                   # Gradle plugins and build logic
├── CleverFerret/              # Main Android application
│   ├── src/main/java/         # Kotlin source code
│   ├── src/main/res/          # Android resources
│   └── build.gradle.kts       # App build configuration
├── docs/                      # Comprehensive documentation
├── builds/                    # Generated APK files
└── README.md                  # This file
```

### Build Commands

#### Universal Build Script

```bash
# Show system information
./build-scripts/universal-build.sh info

# Test build environment
./build-scripts/universal-build.sh test-env

# Debug build
./build-scripts/universal-build.sh build debug

# Release build
./build-scripts/universal-build.sh build release

# Clean and build
./build-scripts/universal-build.sh full-build

# Clean only
./build-scripts/universal-build.sh clean

# Help
./build-scripts/universal-build.sh help
```

#### Gradle Tasks

```bash
# Architecture information
./gradlew architectureInfo

# System diagnostics
./gradlew diagnose

# Configure android tools
./gradlew configureAndroidTools

# Build configuration info
./gradlew logBuildConfig

# Clean all
./gradlew cleanAll
```

### Environment Setup

#### Linux/macOS

```bash
# Install Java 17
sudo apt install openjdk-17-jdk  # Ubuntu/Debian
brew install openjdk@17          # macOS

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Install Android SDK
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
```

#### Windows

```powershell
# Install Java 17 (use installer from Oracle/OpenJDK)
# Set environment variables
$env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
$env:ANDROID_HOME = "C:\Android\Sdk"
$env:PATH += ";$env:ANDROID_HOME\cmdline-tools\latest\bin"
```

## 🧪 Testing

### Automated Testing

```bash
# Run all tests
./gradlew test

# Run instrumented tests
./gradlew connectedAndroidTest

# Run specific test suite
./gradlew testDebugUnitTest
```

### Manual Testing

```bash
# Install debug APK
adb install -r builds/app-debug.apk

# Install specific architecture
adb install -r builds/app-arm64-v8a-debug.apk
```

## 🐛 Troubleshooting

### Common Issues

#### Build Fails with "AAPT2 Process Failed"

**Cause**: Incompatible AAPT2 binary for your architecture

**Solution**:
```bash
# Clean and reconfigure
./build-scripts/universal-build.sh clean
./gradlew configureAndroidTools
./build-scripts/universal-build.sh build
```

#### "Android Tools Not Found"

**Cause**: android-tools directory missing

**Solution**:
```bash
# Verify android-tools existence
ls -la android-tools/
./gradlew architectureInfo
```

#### "Java Version Not Supported"

**Cause**: Java version < 17

**Solution**:
```bash
# Check Java version
java -version
# Install Java 17+ and set JAVA_HOME
```

#### Memory Issues During Build

**Cause**: Insufficient heap memory

**Solution**:
```bash
# Set Gradle options
export GRADLE_OPTS="-Xmx4g -XX:MaxMetaspaceSize=1g"
```

### Diagnostic Commands

```bash
# Comprehensive system check
./gradlew diagnose

# Architecture detection test
./build-scripts/universal-build.sh info

# Build environment test
./build-scripts/universal-build.sh test-env

# Gradle configuration check
./gradlew architectureInfo
```

## 📚 Documentation

### Comprehensive Guides

- [**Build System Architecture**](docs/BUILD_SYSTEM.md) - Deep dive into the universal build system
- [**Android Tools Integration**](docs/ANDROID_TOOLS.md) - How android-tools are integrated
- [**Multi-Architecture Support**](docs/MULTI_ARCH.md) - Architecture compatibility details
- [**Troubleshooting Guide**](docs/TROUBLESHOOTING.md) - Common issues and solutions
- [**Development Setup**](docs/DEVELOPMENT.md) - Setting up development environment
- [**API Documentation**](docs/API.md) - Application architecture and APIs

### Architecture Documentation

- [**Application Architecture**](docs/architecture/APPLICATION.md)
- [**Build System Design**](docs/architecture/BUILD_SYSTEM.md)
- [**Database Schema**](docs/architecture/DATABASE.md)
- [**Media Processing Pipeline**](docs/architecture/MEDIA_PIPELINE.md)

## 🤝 Contributing

### Development Workflow

1. **Fork and Clone**
   ```bash
   git clone <your-fork-url>
   cd CleverFerret
   ```

2. **Setup Environment**
   ```bash
   ./build-scripts/universal-build.sh test-env
   ```

3. **Make Changes**
   - Follow existing code patterns
   - Add tests for new features
   - Update documentation

4. **Test Thoroughly**
   ```bash
   ./build-scripts/universal-build.sh full-build
   ./gradlew test
   ```

5. **Submit Pull Request**
   - Clear description of changes
   - Include test results
   - Update documentation if needed

### Code Style

- **Kotlin**: Follow official Kotlin coding conventions
- **Comments**: Document complex logic and architecture decisions
- **Testing**: Unit tests for business logic, integration tests for components

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

The integrated android-tools are licensed under Apache 2.0 from the original [android-tools repository](https://github.com/JonForShort/android-tools).

## 🙏 Acknowledgments

- **JonForShort/android-tools** - Pre-compiled Android build tools for multiple architectures
- **Android Open Source Project** - Core Android development tools
- **Gradle Team** - Build automation system
- **Jetpack Compose Team** - Modern Android UI toolkit

## 📞 Support

### Getting Help

1. **Check Documentation**: Start with this README and the docs/ directory
2. **Run Diagnostics**: Use `./gradlew diagnose` for system analysis
3. **Search Issues**: Check existing GitHub issues
4. **Create Issue**: Provide system info and error logs

### System Information Template

When reporting issues, include:

```bash
# Run this command and include output
./gradlew diagnose
./build-scripts/universal-build.sh info
```

---

**🦫 CleverFerret - Universal Media Library with Universal Build Support**

*Build once, run everywhere. Develop anywhere, deploy everywhere.*