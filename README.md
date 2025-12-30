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
*   `android-sdk/`: Local Android SDK dependencies.
*   `docs/`: Project documentation and logs.
*   `scripts/`: Utility scripts for building and maintenance.

## 📝 Documentation

### Quick Links
*   **[📖 Documentation Index](docs/INDEX.md)**: Complete guide to all documentation
*   **[✨ Feature Status](docs/FEATURES_STATUS.md)**: Comprehensive overview of all enabled/disabled features
*   **[🗺️ Roadmap](docs/ROADMAP.md)**: Planned features and known issues
*   **[🏗️ Architecture](docs/ARCHITECTURE.md)**: System architecture and design patterns

### Key Documentation
*   **[Supported Formats](docs/FEATURES.md)**: File format support details
*   **[Implementation Guides](docs/implementation/)**: Parser integration and technical guides
*   **[Planning & TODO](docs/planning/)**: Development roadmap and task lists
*   **[Historical Archives](docs/archive/)**: Completed work and research notes

## 🚧 Status

Active development. High-priority functionality (Playback, Reader, Library Management) is stable. Cloud Sync and AI features are in active development.
