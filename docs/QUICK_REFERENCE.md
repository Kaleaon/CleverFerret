# CleverFerret - Quick Reference Guide

**Version:** 1.6.5 (Build 27)  
**Last Updated:** December 30, 2024

Quick reference for developers working on CleverFerret.

---

## 🚀 Quick Start

### Setup

1. **Clone repository**
   ```bash
   git clone https://github.com/Kaleaon/CleverFerret.git
   cd CleverFerret
   ```

2. **Configure API keys**
   ```bash
   cp secrets.properties.template secrets.properties
   # Edit secrets.properties with your API keys
   ```

3. **Build**
   ```bash
   ./gradlew assembleDebug
   ```

4. **Run**
   ```bash
   ./gradlew installDebug
   ```

---

## 📁 Project Structure

```
CleverFerret/
├── CleverFerret/          # Main Android app module
│   ├── src/main/
│   │   ├── java/com/universalmedialibrary/
│   │   │   ├── ui/         # Compose UI screens
│   │   │   ├── services/   # Background services
│   │   │   ├── parsers/    # Document parsers
│   │   │   ├── widgets/    # Home screen widgets
│   │   │   └── ...
│   │   ├── res/           # Resources
│   │   └── AndroidManifest.xml
│   └── build.gradle.kts
├── docs/                  # Documentation
│   ├── features/         # Feature docs
│   ├── implementation/   # Technical guides
│   ├── planning/        # Roadmaps
│   ├── security/        # Security docs
│   └── archive/         # Historical docs
├── build.gradle.kts      # Root build file
└── settings.gradle.kts   # Project settings
```

---

## 🔧 Common Tasks

### Build Commands

```bash
# Debug build
./gradlew assembleDebug

# Release build (requires signing)
./gradlew assembleRelease

# Install on device
./gradlew installDebug

# Clean build
./gradlew clean

# Lint check
./gradlew lint

# Run tests
./gradlew test
```

### Development

```bash
# Check dependencies
./gradlew dependencies

# Check for outdated dependencies
./gradlew dependencyUpdates

# Generate dependency report
./gradlew buildHealth
```

---

## 📚 Key Documentation

| Document | Purpose |
|----------|---------|
| [FEATURES_STATUS](FEATURES_STATUS.md) | What's enabled/disabled |
| [CODE_REVIEW](CODE_REVIEW.md) | Code quality & recommendations |
| [SECURITY_PRACTICES](security/SECURITY_PRACTICES.md) | Security guidelines |
| [ROADMAP](ROADMAP.md) | Planned features |
| [ARCHITECTURE](ARCHITECTURE.md) | System design |

---

## 🎯 Current Status

### ✅ Working Features
- EPUB/PDF reading
- Music/Audiobook playback
- 13 home screen widgets
- Chromecast support
- Android Auto integration
- File browsing

### 🔄 In Progress
- MOBI/AZW parsing integration
- Cloud sync (Google Drive, Dropbox)
- AI features (OpenAI integration)
- OPDS catalog browsing

### ❌ Not Yet Implemented
- Plex authentication
- Multi-room audio (Snapcast)
- Some legacy file formats

See [FEATURES_STATUS.md](FEATURES_STATUS.md) for complete details.

---

## 🔒 Security Checklist

Before committing:

- [ ] No hardcoded API keys
- [ ] secrets.properties not committed
- [ ] Network requests use HTTPS
- [ ] Sensitive data properly encrypted
- [ ] Permissions properly requested

See [SECURITY_PRACTICES.md](security/SECURITY_PRACTICES.md) for details.

---

## 🐛 Debugging

### Logs

```bash
# View app logs
adb logcat | grep CleverFerret

# Clear logs
adb logcat -c
```

### Common Issues

**Build fails with "KEYSTORE not found"**
- This is normal for debug builds
- Release builds need signing configured

**"secrets.properties not found"**
- Copy secrets.properties.template to secrets.properties
- Add your API keys

**Network security errors**
- Check network_security_config.xml
- Ensure HTTPS is used, or add domain to cleartext exceptions

---

## 📊 Code Statistics

- **Kotlin files**: 986
- **Min SDK**: 26 (Android 8.0+)
- **Target SDK**: 36 (Android 15)
- **Supported formats**: 17+ file types
- **Widgets**: 13 implementations
- **Services**: 5 foreground services

---

## 🤝 Contributing

### Code Style
- Kotlin coding conventions
- Material Design 3 guidelines
- MVVM architecture pattern

### Before Submitting PR
1. Run lint: `./gradlew lint`
2. Run tests: `./gradlew test`
3. Update documentation if needed
4. Check security best practices

### Documentation
- Update feature status if adding features
- Add implementation notes in docs/implementation/
- Update roadmap if completing planned items

---

## 🆘 Getting Help

### Resources
- [Documentation Index](INDEX.md)
- [GitHub Issues](https://github.com/Kaleaon/CleverFerret/issues)
- [Pull Requests](https://github.com/Kaleaon/CleverFerret/pulls)

### Troubleshooting
1. Check [CODE_REVIEW.md](CODE_REVIEW.md) for known issues
2. Search existing GitHub issues
3. Check logs with `adb logcat`
4. Review [ARCHITECTURE.md](ARCHITECTURE.md) for system design

---

## 📝 Version History

### 1.6.5 (Current)
- Documentation reorganization
- Security improvements (HTTPS enforcement)
- API key management
- Comprehensive feature documentation

### Previous
See [archive/](archive/) for historical changes.

---

**Quick Links:**
- [Full Documentation Index](INDEX.md)
- [Feature Status](FEATURES_STATUS.md)
- [Code Review](CODE_REVIEW.md)
- [Security](security/SECURITY_PRACTICES.md)
