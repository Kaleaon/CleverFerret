# CleverFerret - Universal Media Library

CleverFerret is a comprehensive media library application for Android, designed to organize and play/read various media formats including Books, Comics, Music, Audiobooks, Podcasts, Radio, and Videos.

## 🚀 Features

### 📚 Reading
*   **Multi-Format Support:** EPUB, PDF, CBZ, CBR, MOBI, AZW3, DJVU, FB2, TXT, RTF, HTML.
*   **Enhanced Reader:** Customizable fonts, themes (Sepia, Night, etc.), brightness control, and bookmarking.
*   **Comics:** Dedicated comic reader for CBZ/CBR archives.
*   **AI Insights:** (Experimental) Generate summaries and character analysis for your books.

### 🎧 Audio & Music
*   **Universal Player:** Unified playback interface for Music, Audiobooks, and Podcasts.
*   **Multi-Room Audio:** (Experimental) Sync playback across multiple devices using Snapcast protocol.
*   **Smart Playlists:** "Most Played", "Favorites", and custom playlists.
*   **Metadata Support:** ID3 tags, cover art, and artist/album organization.

### 🌐 Web Fiction
*   **Reddit Integration:** Download and organize serials from Reddit (e.g., r/HFY) as EPUBs.
*   **Thread Continuations:** Automatically captures author comments and continuations.
*   **Fanfiction:** Specialized tools for managing fanfiction metadata and tags.

### 📡 Connectivity
*   **OPDS Support:** Browse and download from Calibre and other OPDS catalogues.
*   **Cloud Sync:** (In Progress) Sync progress and libraries across devices.
*   **Plex Integration:** (Beta) Access your Plex media libraries directly.

## 🛠️ Technical Architecture

*   **Language:** Kotlin
*   **UI Framework:** Jetpack Compose (Material3)
*   **Architecture:** MVVM (Model-View-ViewModel) + Repository Pattern
*   **Dependency Injection:** Hilt
*   **Local Database:** Room (SQLite)
*   **Async:** Coroutines & Flow
*   **Media Engine:** ExoPlayer (Media3)

## 📂 Project Structure

*   `CleverFerret/`: Main Android application source code.
*   `tooling/`: Build and development automation scripts.
*   `docs/`: Product and engineering documentation.
*   `infra/`: CI/CD, container, and deployment definitions.
*   `archive/`: Historical non-runtime artifacts.
*   `android-sdk/`: Local Android SDK dependencies (legacy environment support).

## 📝 Documentation

### Quick Links
*   **[📖 Documentation Index](docs/INDEX.md)**: Complete guide to all documentation
*   **[✨ Feature Status](docs/FEATURES_STATUS.md)**: Comprehensive overview of all enabled/disabled features
*   **[📊 Improvements Summary](docs/IMPROVEMENTS_SUMMARY.md)**: Recent improvements and reorganization
*   **[🗺️ Roadmap](docs/ROADMAP.md)**: Planned features and known issues
*   **[🏗️ Architecture](docs/ARCHITECTURE.md)**: System architecture and design patterns
*   **[🔒 Security Practices](docs/security/SECURITY_PRACTICES.md)**: Security guidelines and best practices

### Key Documentation
*   **[Supported Formats](docs/FEATURES.md)**: File format support details
*   **[Code Review](docs/CODE_REVIEW.md)**: Comprehensive code review and recommendations
*   **[Implementation Guides](docs/implementation/)**: Parser integration and technical guides
*   **[Planning & TODO](docs/planning/)**: Development roadmap and task lists
*   **[Historical Archives](docs/archive/)**: Completed work and research notes


## 🧭 Frontend Workspace Status

The standalone JavaScript frontend is **inactive** for now. The former `frontend/` directory has been archived to `archive/frontend/`, and dependency artifacts were removed from Git to avoid stale package-manager state.

If frontend work is restarted, expected bootstrap commands are:

```bash
mkdir -p frontend/src frontend/tests
cd frontend
# choose one package manager, then initialize
# npm example:
npm init -y
npm install
npm run dev
npm run build
npm test
```


## 🧪 Build and CI Artifacts

Build diagnostics should be generated as immutable artifacts under `archive/development-artifacts/` (or CI artifact uploads), not as mutable root-level log files.

Naming convention for generated local artifacts:

- `clean-build-<commit-sha>-<utc-timestamp>.log`
- `compile-log-<commit-sha>-historical.txt` (for archived legacy snapshots)

Example:

```bash
COMMIT_SHA=$(git rev-parse --short HEAD)
TS=$(date -u +%Y%m%dT%H%M%SZ)
./gradlew clean :CleverFerret:assembleDebug --no-daemon --stacktrace \
  | tee "archive/development-artifacts/clean-build-${COMMIT_SHA}-${TS}.log"
```

For pull requests, prefer attaching CI-produced logs/reports as workflow artifacts and linking those in review notes.

## 🚧 Status

Active development. High-priority functionality (Playback, Reader, Library Management) is stable. Cloud Sync and AI features are in active development.
