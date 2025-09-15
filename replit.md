# CleverFerret Universal Media Library

## Overview

CleverFerret is a comprehensive Universal Media Library for Android that manages books, movies, music, podcasts, comics, and more directly on the user's device. Built as a fully self-contained native Android application, it eliminates the need for external servers or desktop applications. The app provides advanced media viewing capabilities that outperform popular readers like Moon+ Reader, with VLC-like video functionality and intelligent content analysis. Key features include seamless Calibre library import, AI-powered metadata correction, advanced document readers, comprehensive video/audio players, and smart content organization with automatic duplicate detection and genre classification.

## Recent Updates (September 15, 2025)

### Media File Access Implementation
- **Storage Access Framework (SAF)**: Implemented SAF-based directory selection for Android 11+ compatibility, replacing raw filesystem access
- **MediaScannerService**: Full implementation with MediaStore integration for standard media types and SAF for documents
- **Runtime Permissions**: Complete Android permission handling for all API levels with graceful degradation
- **Content Discovery**: Automatic scanning of media files with proper content URI handling

### Database Integration
- **Room Database**: Full implementation with version 5 schema including bookmark and reading progress tables
- **DAOs**: Complete implementation of LibraryDao, MediaItemDao, MetadataDao, and BookmarkDao with all necessary operations
- **Migrations**: Proper migration chain from version 1 to 5 with bookmark support
- **BookmarkService**: Real database operations replacing all mock data

### OCR and Text Extraction
- **ML Kit Integration**: Full OCR implementation using Google ML Kit for on-device text recognition
- **PDF Processing**: PdfRenderer integration for extracting text from PDF documents
- **EPUB Support**: ZIP-based EPUB text extraction with HTML parsing
- **Comic OCR**: Text extraction from comic archives (CBZ/CBR) with image processing

## User Preferences

Preferred communication style: Simple, everyday language.

## System Architecture

### Frontend Architecture
- **UI Framework**: Jetpack Compose with Material You design system
- **Navigation**: Android Navigation Component with type-safe routing
- **State Management**: MVVM pattern with StateFlow and LiveData
- **Dependency Injection**: Hilt for comprehensive dependency management
- **Theme System**: Dynamic Material You theming with dark/light mode support

### Backend Architecture
- **Database**: Room ORM with SQLite for local data storage
- **Architecture Pattern**: Clean Architecture with Repository pattern
- **Data Layer**: Comprehensive schema supporting multiple media types (books, movies, music, comics)
- **Services**: Background services for Calibre import, media scanning, and content analysis
- **API Layer**: Retrofit-based HTTP client for external service integrations

### Media Processing Capabilities
- **Document Reading**: Advanced EPUB3 support with MuPDF integration, custom typography controls, and night mode
- **Video Playback**: Dual-engine architecture (ExoPlayer + VLC SDK) supporting 200+ formats including H.264, H.265, VP9, AV1, MKV, RMVB
- **Audio Playback**: Professional-grade audio engine with multiple format support and advanced playback controls
- **Smart Content Analysis**: AI-powered OCR, genre classification, duplicate detection, and metadata correction using ML Kit

### Data Management
- **Import System**: Sophisticated Calibre metadata.db import with data cleaning and conflict resolution
- **Metadata Engine**: Multi-source metadata fetching with intelligent merging and user override capabilities
- **File Management**: Intelligent file path resolution, duplicate detection, and library organization

## External Dependencies

### Core Android Dependencies
- **AndroidX Libraries**: Core, Lifecycle, Navigation, WorkManager for modern Android development
- **Jetpack Compose**: Complete UI toolkit including Material3, Navigation, and ViewModel integration
- **Room Database**: Local SQLite database with advanced query capabilities and migration support
- **Hilt**: Dependency injection framework for clean architecture implementation

### Media & Content Processing
- **ExoPlayer (Media3)**: Primary video/audio playback engine with HLS, DASH, and RTSP support
- **VLC Android SDK**: Secondary video engine for exotic format support (200+ codecs)
- **Mobile FFmpeg**: Advanced video processing, format conversion, and metadata extraction
- **Google ML Kit**: OCR text recognition and language detection for intelligent content analysis
- **MuPDF**: High-performance PDF rendering and text extraction

### External API Integrations
- **Metadata Sources**: Google Books API, TMDB (movies), OMDb, MusicBrainz, Spotify Web API
- **Cloud Storage**: Dropbox SDK, Google Drive API, OneDrive integration for library synchronization
- **Plex Integration**: Comprehensive Plex Media Server API integration for library management

### Development & Build Tools
- **Gradle**: Build automation with Kotlin DSL and advanced dependency management
- **GitHub Actions**: Comprehensive CI/CD pipeline with automated testing, APK signing, and release management
- **Android Lint**: Extensive code quality analysis with custom lint configurations
- **JUnit & Espresso**: Unit and integration testing frameworks for quality assurance

### Network & Serialization
- **Retrofit**: HTTP client for RESTful API communication with automatic JSON/XML parsing
- **Coil**: Efficient image loading and caching for cover art and media thumbnails
- **Kotlinx Serialization**: Type-safe JSON serialization for data persistence and API communication