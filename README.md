<p align="center">
  <img src="./logo.png" alt="CleverFerret logo" width="160">
</p>

<h1 align="center">CleverFerret</h1>

<p align="center">
  <strong>Universal Media Library for Android</strong><br>
  Manage books, music, movies, and more — all on your device
</p>

<p align="center">
  <a href="#-features">Features</a> •
  <a href="#-quick-start">Quick Start</a> •
  <a href="#-system-requirements">Requirements</a> •
  <a href="#-documentation">Documentation</a>
</p>

---

## 📖 About

CleverFerret is a comprehensive, self-contained Android app for managing your complete media library directly on your device. No external servers or desktop applications required — everything works offline with a modern, Material You interface.

### 🎯 Key Features

- **📚 Universal Library** - Books, comics, music, movies, podcasts in one place
- **📥 Calibre Import** - Seamlessly import your existing Calibre library
- **🎨 Material You** - Modern Android design with dynamic theming
- **💾 Local-First** - All data stored on your device with Room database
- **🔧 Extensible** - Architecture designed to support any media type

---

## 🚀 Quick Start

### For Users

1. **Download** the latest APK from [Releases](https://github.com/Kaleaon/CleverFerret/releases)
   - Choose `CleverFerret-vX.X-release.apk` for the optimized version
   - Or `CleverFerret-vX.X-debug.apk` for the debug version
2. **Install** following the instructions in [docs/INSTALL.md](docs/INSTALL.md)
3. **Verify** the APK checksum (optional but recommended) - see installation guide
4. **Launch** the app and create your first library or import from Calibre

> **Note**: CleverFerret is not yet available on Google Play Store. Direct APK installation is required.

### For Developers

```bash
# Clone the repository
git clone https://github.com/Kaleaon/CleverFerret.git
cd CleverFerret

# Build the project
./gradlew clean assembleDebug

# Run tests
./gradlew testDebugUnitTest
```

See [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) for complete setup instructions.

---

## 📱 System Requirements

- **Android**: 8.0+ (API level 26 or higher)
- **Storage**: 100 MB for app + space for your media
- **RAM**: 2GB minimum (4GB recommended)

---

## 🏗️ Architecture

CleverFerret uses modern Android development practices:

- **Language**: Kotlin
- **UI**: Jetpack Compose with Material 3
- **Architecture**: MVVM with Hilt dependency injection
- **Database**: Room (SQLite)
- **Async**: Kotlin Coroutines and Flow

See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for detailed architecture information.

---

## 📚 Documentation

- **[Installation Guide](docs/INSTALLATION.md)** - Installing the app on your device
- **[Development Guide](docs/DEVELOPMENT.md)** - Building, testing, and contributing
- **[Architecture Guide](docs/ARCHITECTURE.md)** - Technical architecture details
- **[Resources](docs/RESOURCES.md)** - External APIs, tools, and references
- **[Release Process](docs/RELEASE.md)** - Creating and publishing releases
- **[Import Logic](docs/analysis/IMPORT_LOGIC.md)** - Calibre import technical details

For a complete documentation index, see [docs/README.md](docs/README.md).

---

## 🤝 Contributing

We welcome contributions! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for:

- Code style guidelines
- Development workflow
- Pull request process
- Issue reporting

---

## 📊 Project Status

CleverFerret is in active development. Current implementation status:

✅ Core database layer (Room)  
✅ Calibre import functionality  
✅ Modern Jetpack Compose UI  
✅ Basic library management  
⏳ Advanced metadata fetching  
⏳ In-app media players  
⏳ Multi-format support expansion

For detailed status and roadmap, see [PROJECT_ROADMAP.md](PROJECT_ROADMAP.md).

---

## 📝 License

This project is Free and Open Source Software (FOSS). See [LICENSE](LICENSE) for details.

---

## 🙏 Acknowledgments

Built with modern Android technologies and inspired by the best media management tools. Special thanks to the open source community for libraries and tools that make this possible.

---

<p align="center">
  <sub>Made with ❤️ for the Android community</sub>
</p>