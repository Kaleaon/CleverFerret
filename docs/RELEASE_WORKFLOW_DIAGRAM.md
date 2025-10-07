# Release Workflow Diagram

This diagram shows how the automated build and release system works.

---

## 🔄 Automated Release Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                    MAINTAINER ACTIONS                             │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  Update Version  │
                    │  in build.gradle │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  Commit Changes  │
                    │  git commit -am  │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │   Create Tag     │
                    │   git tag vX.Y   │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │   Push to GitHub │
                    │  git push origin │
                    │  git push tag    │
                    └──────────────────┘
                              │
┌─────────────────────────────────────────────────────────────────┐
│                  GITHUB ACTIONS WORKFLOW                          │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  Workflow Trigger│
                    │  (on: tags: v*)  │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │   Setup Build    │
                    │  - Java 17       │
                    │  - Android SDK   │
                    │  - Gradle Cache  │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │ Extract Version  │
                    │ printVersionName │
                    │ printVersionCode │
                    └──────────────────┘
                              │
                              ├─────────────────┐
                              ▼                 ▼
                    ┌──────────────────┐  ┌──────────────────┐
                    │  Build Debug APK │  │Build Release APK │
                    │  assembleDebug   │  │ assembleRelease  │
                    │                  │  │  - ProGuard/R8   │
                    │  20-25 MB        │  │  - Signing       │
                    └──────────────────┘  │  13-16 MB        │
                              │           └──────────────────┘
                              │                 │
                              └────────┬────────┘
                                       ▼
                             ┌──────────────────┐
                             │  Sign Release    │
                             │  (if configured) │
                             │  - Decode base64 │
                             │  - jarsigner     │
                             └──────────────────┘
                                       │
                                       ▼
                             ┌──────────────────┐
                             │   Rename APKs    │
                             │  CleverFerret-   │
                             │  vX.Y-debug.apk  │
                             │  vX.Y-release.apk│
                             └──────────────────┘
                                       │
                                       ▼
                             ┌──────────────────┐
                             │Generate Checksums│
                             │   SHA256 for:    │
                             │   - debug.apk    │
                             │   - release.apk  │
                             └──────────────────┘
                                       │
                                       ▼
                             ┌──────────────────┐
                             │Upload Artifacts  │
                             │  - debug-apk     │
                             │  - release-apk   │
                             │  - checksums     │
                             └──────────────────┘
                                       │
                                       ▼
                             ┌──────────────────┐
                             │Security Scan     │
                             │ (optional)       │
                             └──────────────────┘
                                       │
                                       ▼
                             ┌──────────────────┐
                             │Generate Release  │
                             │     Notes        │
                             │  - Commit history│
                             │  - Checksums     │
                             │  - Instructions  │
                             └──────────────────┘
                                       │
                                       ▼
                             ┌──────────────────┐
                             │  Create GitHub   │
                             │     Release      │
                             │  - Tag name      │
                             │  - Release notes │
                             └──────────────────┘
                                       │
                                       ▼
                             ┌──────────────────┐
                             │   Upload Assets  │
                             │  - debug.apk     │
                             │  - release.apk   │
                             │  - debug.sha256  │
                             │  - release.sha256│
                             └──────────────────┘
                                       │
┌─────────────────────────────────────────────────────────────────┐
│                      USER ACTIONS                                 │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  Visit Releases  │
                    │      Page        │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  Download APK    │
                    │  (release or     │
                    │   debug)         │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  Verify Checksum │
                    │   (optional)     │
                    │  sha256sum       │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  Install APK     │
                    │  - Enable unknown│
                    │    sources       │
                    │  - Install       │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  Launch App! 🎉  │
                    └──────────────────┘
```

---

## 🔐 Signing Configuration (One-time Setup)

```
┌─────────────────────────────────────────────────────────────────┐
│                   MAINTAINER (One Time)                           │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │ Generate Keystore│
                    │  keytool -genkey │
                    │  release.jks     │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  Encode Base64   │
                    │  base64 -i       │
                    │  keystore.base64 │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │ Add GitHub       │
                    │    Secrets       │
                    │  - KEYSTORE_FILE │
                    │  - PASSWORD      │
                    │  - KEY_ALIAS     │
                    │  - KEY_PASSWORD  │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  ✅ Done!        │
                    │  All future      │
                    │  releases will   │
                    │  be signed       │
                    └──────────────────┘
```

---

## 📊 Build Optimization Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                    SOURCE CODE                                    │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │   Kotlin Files   │
                    │   ~500+ classes  │
                    └──────────────────┘
                              │
                              ├─────────────────┐
                              ▼                 ▼
                    ┌──────────────────┐  ┌──────────────────┐
                    │  DEBUG BUILD     │  │  RELEASE BUILD   │
                    │                  │  │                  │
                    │  No optimization │  │  ✅ ProGuard/R8  │
                    │  All symbols     │  │  ✅ Shrinking    │
                    │  Faster compile  │  │  ✅ Obfuscation  │
                    └──────────────────┘  └──────────────────┘
                              │                 │
                              ▼                 ▼
                    ┌──────────────────┐  ┌──────────────────┐
                    │  20-25 MB        │  │  13-16 MB        │
                    │  ~2 min build    │  │  ~5 min build    │
                    └──────────────────┘  └──────────────────┘
```

---

## 📝 Documentation Structure

```
docs/
├── INSTALL.md                    # User installation guide
│   ├── Prerequisites
│   ├── Step-by-step install
│   ├── Verification
│   └── Troubleshooting
│
├── RELEASE.md                    # Developer release guide
│   ├── Automated release
│   ├── Signing setup
│   ├── Build configuration
│   └── Troubleshooting
│
├── RELEASING_QUICKSTART.md       # Quick reference
│   ├── 5-minute guide
│   └── Common commands
│
├── BUILD_RELEASE_AUTOMATION.md   # Technical details
│   ├── Implementation summary
│   ├── Requirements checklist
│   └── Maintenance guide
│
└── RELEASE_WORKFLOW_DIAGRAM.md   # This file
    └── Visual flowcharts
```

---

## 🎯 Key Components

### 1. Version Management
- `version.gradle` - Gradle script for version extraction
- Tasks: `printVersionName`, `printVersionCode`, `printVersionInfo`

### 2. Build Configuration
- `build.gradle.kts` - Signing config, ProGuard, build variants
- ProGuard rules for optimization

### 3. GitHub Actions
- `.github/workflows/main.yml` - CI/CD pipeline
- Triggers, builds, signs, releases

### 4. Documentation
- User guides (INSTALL.md)
- Developer guides (RELEASE.md)
- Quick references (RELEASING_QUICKSTART.md)
- Technical docs (BUILD_RELEASE_AUTOMATION.md)

---

## ⏱️ Timeline Estimates

| Action | Time | Who |
|--------|------|-----|
| Setup signing (first time) | 10 min | Maintainer |
| Create release | 5 min | Maintainer |
| GitHub Actions build | 5-8 min | Automated |
| Download APK | 1 min | User |
| Install APK | 2 min | User |
| **Total (first release)** | **~30 min** | - |
| **Total (subsequent)** | **~15 min** | - |

---

## 🎉 Benefits Summary

### Before Automation
- ⏰ Manual builds (30+ min per release)
- 📦 Large APKs (20-25 MB)
- ❌ No verification (no checksums)
- 📝 Manual release notes
- 🔧 Complex setup for users

### After Automation
- ⚡ Automated builds (5 min hands-on)
- 📦 Optimized APKs (13-16 MB, 40% smaller)
- ✅ SHA256 checksums included
- 📝 Auto-generated release notes
- 📖 Clear installation guides

---

## 📚 Related Files

- [INSTALL.md](INSTALL.md) - User installation
- [RELEASE.md](RELEASE.md) - Release process
- [RELEASING_QUICKSTART.md](RELEASING_QUICKSTART.md) - Quick reference
- [BUILD_RELEASE_AUTOMATION.md](BUILD_RELEASE_AUTOMATION.md) - Technical details
- [README.md](../README.md) - Project overview
