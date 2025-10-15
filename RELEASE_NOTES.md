# CleverFerret v1.0.0

## 📱 System Requirements
- Android 15+ (API level 36 or higher)
- 100 MB free storage space
- Permissions: Storage, Network access

## 📦 Installation

### Download
Choose one of the APK files:
- **universal-media-library-v1.0-signed.apk** - Recommended for production use
- **universal-media-library-v1.0.apk** - Debug version with additional logging

### Install Steps
1. Download the APK file
2. Enable "Install from unknown sources" in Android settings if needed
3. Open the downloaded APK file
4. Follow the installation prompts
5. Grant necessary permissions when the app launches

## 🎉 Features

### Media Library Management
- **Multi-format Support**: 
  - Books: EPUB, PDF, MOBI, AZW
  - Comics: CBZ, CBR, CB7, CBT
  - Audio: MP3, M4A, FLAC, OGG, WAV
  - Video: MP4, MKV, AVI, WEBM
  - Images: JPEG, PNG, GIF, WEBP

### Content Sources
- **Local Storage**: Scan and import from device storage
- **Calibre Libraries**: Import and sync Calibre book collections
- **Network Storage**: Access SMB/CIFS network shares
- **Media Servers**: Connect to Jellyfin, Plex, and Emby
- **OPDS Catalogs**: Browse online book catalogs

### Reading & Playback
- **EPUB Reader**: Built-in reader with customizable settings
- **PDF Viewer**: Fast PDF rendering with zoom and search
- **Comic Reader**: Page-by-page comic viewing
- **Audio Player**: Feature-rich music and audiobook player
- **Video Player**: Hardware-accelerated video playback

### Smart Organization
- **Unified Library**: All your media in one place
- **Tags & Collections**: Organize content your way
- **Search**: Fast full-text search across your library
- **Metadata Editor**: Edit and enhance media information
- **Cover Art**: Automatic and manual cover management

### Modern Experience
- **Material 3 Design**: Beautiful, modern interface
- **Dark Mode**: Easy on the eyes
- **Home Screen Widgets**: Quick access to your media
- **Chromecast Support**: Stream to your TV
- **Offline Mode**: Access your media anywhere

### AI-Powered Features
- **Content Analysis**: Powered by Google Gemini
- **Smart Recommendations**: Discover similar content
- **Metadata Enhancement**: Automatic metadata extraction

## 🔐 Security & Privacy
- **Encrypted Storage**: Sensitive credentials stored securely
- **Biometric Lock**: Protect your library with fingerprint/face unlock
- **No Analytics**: Your data stays on your device
- **Open Source**: Transparent and auditable code

## 🆕 What's New in v1.0.0

### Initial Release Highlights
- Complete rewrite in Kotlin with Jetpack Compose
- Unified media library supporting 10+ formats
- Multiple content source integrations
- Modern Material 3 UI
- Home screen widgets
- Chromecast support
- AI-powered features with Gemini
- Secure credential storage
- Comprehensive settings and customization

### Included Components
- ✅ Core media playback engine
- ✅ Library management system
- ✅ EPUB/PDF reader
- ✅ Comic reader (CBZ/CBR)
- ✅ Audio player with playlist support
- ✅ Video player with subtitle support
- ✅ Calibre import service
- ✅ Network storage browser
- ✅ Media server integrations (Jellyfin/Plex/Emby)
- ✅ OPDS catalog browser (basic)
- ✅ Metadata editor
- ✅ Tag and collection management
- ✅ Search and filtering
- ✅ Home screen widgets
- ✅ Chromecast support
- ✅ Settings and preferences

## 🔐 Checksums (SHA256)

**Signed Release APK:**
```
cd10c8307b6e21b165ccd86a933fa59c3148de5f1d3c05e116d1afa5df123794  universal-media-library-v1.0-signed.apk
```

**Debug APK:**
```
ce25cc8f973fc8f1d5d9865a26caa3991bb972b5bfbe182d88f7c0ae9877849b  universal-media-library-v1.0.apk
```

## 📝 Known Issues & Limitations

### Temporary Limitations (Coming in v1.1.0)
- **Advanced OPDS Features**: Full OPDS 2.0 support planned
- **Audiobook Manifests**: Readium audiobook format support planned
- **Advanced EPUB Features**: Some Readium-specific features disabled

These limitations are due to ongoing migration to Readium Kotlin Toolkit 3.1.2 API. Core functionality for all formats remains fully operational.

### Workarounds
- **OPDS**: Basic catalog browsing works, advanced authentication coming soon
- **Audiobooks**: Use standard MP3/M4A files (fully supported)
- **EPUBs**: Standard EPUB 2/3 files work perfectly

## 🐛 Bug Reports & Feature Requests

Found a bug or have a suggestion?
- **Issues**: https://github.com/YOUR_REPO/issues
- **Discussions**: https://github.com/YOUR_REPO/discussions

## 📖 Documentation

- **Installation Guide**: See INSTALL.md
- **User Guide**: See USER_GUIDE.md  
- **Developer Docs**: See CONTRIBUTING.md

## 🙏 Acknowledgments

Built with these excellent open-source libraries:
- **Jetpack Compose**: Modern Android UI
- **Material 3**: Beautiful design system
- **Readium**: EPUB and digital publishing
- **ExoPlayer**: Professional media playback
- **Room**: Local database
- **Hilt**: Dependency injection
- **Coil**: Image loading
- **Retrofit**: Network communication
- **Jellyfin SDK**: Media server integration

## 📄 License

This project is licensed under the MIT License. See LICENSE file for details.

---

**Version**: 1.0.0  
**Build Date**: October 12, 2025  
**Min SDK**: 26 (Android 8.0)  
**Target SDK**: 36  
**APK Size**: ~17 MB
