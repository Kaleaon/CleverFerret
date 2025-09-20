# 🦫 CleverFerret Universal Media Library

## 📖 Overview

CleverFerret is a comprehensive Universal Media Library Android application with **revolutionary multi-architecture build support** and **AI-powered development workflow**. This system automatically detects your development machine's architecture, configures the appropriate Android build tools, and uses AI to review every code change, ensuring seamless compilation and high-quality builds across **ARM64, x86_64, ARM32, and x86** architectures.

## 🏗️ Universal Build System + AI Review

### Key Features

- **🤖 AI-Powered Code Review**: Every push is automatically reviewed by Gemini AI for quality and safety
- **🎯 Automatic Architecture Detection**: Detects host system architecture automatically
- **🔧 Smart AAPT2 Configuration**: Uses architecture-specific AAPT2 binaries for optimal compatibility
- **📱 Multi-Architecture APK Generation**: Builds APKs for all major Android architectures
- **🚀 Auto-Build & Publish**: Successful reviews trigger automatic builds and publishing
- **🛡️ Quality Gates**: Blocks builds that don't meet safety and quality standards
- **🛠️ Comprehensive Tooling**: Integrated diagnostics, testing, and build verification

### Supported Architectures

| Host Architecture | Android ABI | AAPT2 Support | Status |
|------------------|-------------|---------------|---------|
| ARM64 (aarch64) | arm64-v8a | ✅ | Primary |
| x86_64 (amd64) | x86_64 | ✅ | Primary |
| ARM32 (armv7l) | armeabi-v7a | ✅ | Supported |
| x86 (i386/i686) | x86 | ✅ | Supported |

## 🤖 AI Review System

CleverFerret features an advanced AI-powered development workflow that automatically reviews every code change with **comprehensive failure analysis**:

### Review Process

1. **Push Detection** - System detects new commits
2. **AI Analysis** - Gemini Pro analyzes changes for:
   - Build safety and compatibility
   - Architecture support maintenance
   - Code quality and best practices
   - Integration safety (AI tools, dependencies)
3. **Quality Gate** - Changes must pass AI review to proceed
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

## 🛠️ Development & Contribution

For detailed instructions on how to set up your development environment, build the project, run tests, and contribute, please see our comprehensive **[AI Assistant Guide](./AGENTS.md)**.

This guide is the single source of truth for all development-related activities and is intended for both human developers and AI assistants.

## 📚 Documentation

For more in-depth documentation about the project's architecture, features, and systems, please refer to the files in the `docs/` directory.

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