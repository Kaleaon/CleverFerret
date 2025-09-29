# CleverFerret: Universal Media Library for Android

CleverFerret is a **working Android application** for creating a Universal Media Library for managing books, music, movies, and podcasts. The project uses modern Android architecture and is currently functional for development and testing.

## ✅ Current Build Status

**✅ Successfully Building**: The application compiles and generates working APK files.

- **Build Time**: ~5 minutes (initial), ~2 minutes (incremental)
- **Test Time**: ~45 seconds  
- **APK Size**: ~10MB (Release), ~13MB (Debug)
- **Target**: Android API 34 (Android 14)
- **Minimum**: Android API 26 (Android 8.0)

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

## 1. High-Level Vision

The goal is to create a new, fully self-contained, native Android application for managing a user's complete media library directly on their device. This includes books, comics, music, movies, podcasts, and more. The application will feature a modern, extensible, and user-friendly interface for organizing, viewing, and consuming all types of media, with powerful tools for metadata management.

## 2. Core Principles

- **On-Device First:** The entire library and its database will be managed on the user's device. No external server or desktop application will be required.
- **Extensible by Design:** The database schema and application architecture will be designed from the ground up to support a wide variety of media types.
- **User-Centric Metadata:** The user will have full control over their metadata, with powerful tools for manual editing and automatic fetching from multiple online sources.
- **Modern Native UI:** The application will be built with the latest Android technologies (Kotlin, Jetpack Compose, Material You).
- **Open Source:** The project will be developed as a Free and Open Source Software (FOSS) project.

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

## 3. Research Summary & Final Architecture

An extensive research and planning phase was conducted to determine the best architecture and components for this project. This section reflects the **revised architecture** based on our detailed investigation.

### Final Proposed Architecture (On-Device)

The project direction has been finalized. A **fully self-contained, on-device application is feasible**. This architecture does not require a separate computer or server.

1. **Core Concept:** The application will be a native Android app that directly reads and manages a user's media library, which will be stored on the device's local storage.

2. **Database Layer:** A new data layer will be built in **Kotlin** using standard Android SQLite libraries. It will be responsible for all database operations based on a custom, extensible schema designed for multiple media types. This layer will also handle the **advanced import and data cleaning of Calibre `metadata.db` files**.

3. **Reader Component (epub4j):**
   - The app will use the **`epub4j`** library as its core engine for parsing and handling e-book files.
   - **License:** This library is licensed under the permissive **Apache 2.0 license**, which aligns with our project's FOSS goals without the restrictions of AGPL.
   - **Feature Benchmark:** The feature set of **Moon+ Reader** will still be used as a benchmark for the quality and customization options to be built for the reading experience.

4. **Audio Component (AntennaPod Model):**
   - A dedicated audio player for music and audiobooks will be built, using the architecture of the **AntennaPod** project as a blueprint.

5. **Video Component (ExoPlayer or libvlc):**
   - The app will use a robust video playback engine. The default choice is **AndroidX Media3 (ExoPlayer)**.

6. **UI/UX (Jetpack Compose & Material You):**
   - The UI will be a modern, native Android interface built with **Kotlin** and **Jetpack Compose**.
   - The design will be inspired by **`book-story`** (for its Material You aesthetic) and **`Plexoid`** (for its multi-library organizational concepts).

### Advanced Metadata Strategy

The application will feature a powerful, multi-layered strategy for metadata.

1. **Automated Metadata Correction:**
   - **OCR on Covers:** The app will use **Google's ML Kit Text Recognition** (Apache 2.0 license) to perform OCR on book covers to identify and correct titles and authors.
   - **Text Analysis:** The app will use the **Apache OpenNLP** library (Apache 2.0 license) to perform Named Entity Recognition (NER) on the first few pages of e-books to programmatically identify and correct metadata.

2. **Manual Metadata Editing:**
   - A dedicated UI will be built to allow users to manually edit all metadata fields. This screen will show a "before and after" comparison when automated corrections are applied, giving the user full control.

3. **External Metadata Sources:**
   - The app will enrich its library by fetching data from a wide range of sources:
     - **Books:** Open Library API, **Google Books API**, **Hardcover API**.
     - **Comics:** ComicVine API.
     - **Audiobooks:** OverDrive API.
     - **Movies/TV:** The Movie Database (TMDB) API, **OMDb API**.
     - **Music:** MusicBrainz API, **Spotify Web API**.

4. **Embedded Metadata Tooling:**
   - **Reading:** The app will prioritize using standard Android libraries like `MediaMetadataRetriever` (for audio/video) and `ExifInterface` (for images) for reading embedded tags.
   - **Writing:** For writing metadata, the app will use `ExifInterface` for images. For audio and video, specialized libraries will be chosen during implementation to ensure robust tag writing capabilities.

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

## 📝 Documentation
- [BUILD_STATUS.md](BUILD_STATUS.md) - Current build status and instructions
- [CLEVERFERRET_APK_READY.md](CLEVERFERRET_APK_READY.md) - APK availability information
- [DATABASE_SCHEMA.md](DATABASE_SCHEMA.md) - Database design and schema
- [IMPORT_LOGIC.md](IMPORT_LOGIC.md) - Calibre import logic
- [RESOURCES.md](RESOURCES.md) - Development resources and references
- [UI_DESIGN_METADATA_EDITOR.md](UI_DESIGN_METADATA_EDITOR.md) - Metadata editor UI design

## 4. Development Plan

### Phase 1: Foundational Research & Component Selection (COMPLETE)
- E-Reader Component Investigation (Completed: `epub4j`)
- Data Correction Technology Research (Completed: ML Kit & OpenNLP)
- Expanded Metadata Source Research (Completed: New APIs identified)

### Phase 2: Architecture & Core Data Model (IN PROGRESS)
1. **System Architecture Design:** Update `README.md` and `RESOURCES.md` to reflect the new architecture.
2. **Advanced Database Schema and Import Logic:** Design the detailed SQLite schema and the logic for the Calibre import and data cleaning.
3. **Design Manual Metadata Editing UI:** Create mockups and specifications for the metadata editing screen.

### Phase 3: Implementation
1. **Implement Core Data Layer:** Build the database and the Calibre importer.
2. **Implement "Content-to-Epub" Features:** Build the news and fanfiction downloaders.
3. **Integrate Media Viewers & Players:** Integrate `epub4j` and build the audio/video players.
4. **Build the User Interface:** Build the main library screens and the manual metadata editor.

### Phase 4: Testing and Polish
- Perform end-to-end testing, paying special attention to the performance of `epub4j` and the accuracy of the data correction engine.
- Refine the UI and user experience.

## 5. Feature Roadmap (Inspired by Moon+ Reader)

The following features, inspired by the best-in-class Moon+ Reader Pro, should be considered as a long-term guide for implementation to ensure a competitive and full-featured application.

### Reading & Customization
- **Deep Visual Controls:** Line space, font scale, bold, italic, shadow, alpha colors, fading edge.
- **Theming:** Multiple embedded themes, including a Day/Night mode switcher.
- **Advanced Paging:** Support for touch screen, volume keys, and other hardware keys. Highly customizable gestures and key mappings.
- **Auto-Scroll:** Multiple modes (rolling blind, by pixel, by line, by page) with real-time speed control.
- **Ergonomics:** Brightness control via screen edge gestures; "Keep your eyes health" options for long reading sessions.
- **Page Effects:** Realistic page-turning animations.
- **Layout:** Justified text alignment, hyphenation mode, and dual-page mode for landscape.
- **EPUB3 Support:** Handle multimedia content (video and audio) embedded in ePub files.

### Library & Data Management
- **Bookshelf Design:** Advanced library organization with Favorites, Downloads, Authors, and Tags. Support for custom book covers.
- **Cloud Sync:** Backup and restore settings, reading positions, highlights, and notes to cloud services (e.g., Dropbox, WebDav).
- **Widgets:** Home screen widgets for displaying a "shelf" of favorite books.

### In-Reader Tools
- **Annotations:** Support for highlighting and annotating text.
- **Dictionary:** Offline and online dictionary integration.
- **Translation:** Integration with translation services.
- **Sharing:** Ability to share snippets, highlights, and notes.
- **Reading Ruler:** A tool to help focus reading on a specific line.

### Pro-Tier Features
- **Text-to-Speech (TTS):** "Shake to speak" or other easy-access TTS controls.
- **Advanced PDF:** High-performance PDF rendering with annotation support.
- **Security:** Option for password protection at startup.
- **Shortcuts:** "Book to home screen" shortcut creation.

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

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Android Open Source Project** - Core Android development tools
- **Gradle Team** - Build automation system
- **Jetpack Compose Team** - Modern Android UI toolkit
