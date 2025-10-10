# Android to PWA Migration Summary

## Overview
This document tracks the migration of CleverFerret Android app (403 Kotlin files) to PWA (React + TypeScript).

## Migration Statistics
- **Total Android Files**: 403 Kotlin files
- **Total Screens**: 66 Screen components
- **Total Services**: 107 Service files
- **Estimated Lines of Code**: ~50,000+ LOC

## Migration Status

### ✅ Completed

#### Data Models & Entities (100%)
All data models have been migrated to TypeScript interfaces:

1. **Core Entities** (`pwa-demo/src/data/local/entity/types.ts`)
   - MediaItem, Library, MetadataCommon
   - MetadataBook, MetadataMovie, MetadataMusicTrack
   - People, ItemPersonRole, Series, Album, Genre
   - Playlist, PlaylistItem
   - Bookmark, ReadingProgress, ReadingSession
   - TextAnnotation, SearchIndex, ReadingStatistics
   - UnifiedTag, UnifiedCollection
   - PlaybackQueue, QueueItem, PlaybackSession
   - RadioStation, ReaderSettingsEntity
   - PlexServer, PlexMediaItem, EmbyServer, JellyfinServer
   - DownloadedStory, StoryUpdate
   - SharedLink, MaintenanceChange, APIKey
   - BookDetails

2. **Podcast Entities** (`pwa-demo/src/data/local/entity/podcast-types.ts`)
   - PodcastEntity
   - PodcastEpisodeEntity
   - PodcastSubscriptionEntity
   - PodcastChapterEntity

3. **Plex Integration** (`pwa-demo/src/data/local/entity/plex-types.ts`)
   - PlexTag, PlexMediaTag
   - PlexCollection, PlexCollectionItem
   - PlexProgress, PlexRating

4. **UI Models** (`pwa-demo/src/ui/models/types.ts`)
   - AppSettings, ReaderSettings, AudiobookSettings
   - MetadataSettings, CloudSyncSettings
   - InterfaceSettings, ImportSettings
   - MediaCategory enum
   - Font, Theme, and UI enums

### 🚧 In Progress

#### Database Layer
- Directory structure created
- Need to implement Dexie.js schemas based on entities
- Need to create DAO equivalents using Dexie

#### Services
- Directory structure created for all services:
  - analysis, artwork, audio, audiobook
  - cache, cast, contentcreation, debug
  - duplicates, epub, gemini, integration
  - maintenance, media, metadata, music
  - network, notification, opds, playback
  - playlist, podcast, reader, security
  - sharing, sync, thumbnails, tts
  - video, visualizer, webfiction

#### UI Components
- Some screens already exist in pwa-demo/src/components/
- Need to migrate 66 Android Screens to React components

### 📝 TODO

#### High Priority
1. **Main App Structure**
   - Create App.tsx based on MainActivity navigation
   - Implement routing with React Router
   - Set up theme system

2. **Database Implementation**
   - Implement Dexie.js database with all entities
   - Create repository pattern
   - Implement DAOs

3. **Core Screens** (Priority order based on MainActivity)
   - Home/Library List Screen
   - Library Details Screen
   - Media Item Detail Screen
   - Reader Screens (E-Reader, PDF, EPUB, Comic)
   - Player Screens (Audio, Video, Podcast)
   - Settings Screens

4. **Core Services**
   - Database Service
   - Metadata API Service
   - Network Manager
   - Cache Manager
   - Playback Managers

#### Medium Priority
5. **Integration Services**
   - Plex Integration
   - Emby/Jellyfin Integration
   - Calibre Import
   - OPDS Server

6. **Additional Screens**
   - Collection Management
   - Maintenance Screen
   - Storage Browser
   - Import/Export

7. **Advanced Features**
   - Audio Visualizer
   - TTS Service
   - OCR/NER Services
   - WebFiction Downloader

#### Low Priority
8. **PWA Features**
   - Service Worker
   - Offline Support
   - Push Notifications
   - Background Sync

9. **Testing**
   - Unit Tests
   - Integration Tests
   - E2E Tests

## Android File Mapping

### MainActivity.kt → App.tsx
Main navigation hub with these routes:
- `/` → Home/Library List
- `/library/:id` → Library Details
- `/detail/:id` → Media Item Detail
- `/open/:id` → Media Viewer/Player
- `/reader/:id` → E-Reader
- `/audio_player/:id` → Audio Player
- `/video_player/:id` → Video Player
- `/podcasts` → Podcast Manager
- `/music` → Music Library
- `/radio` → Radio Streams
- `/videos` → Video Library
- `/settings` → Settings
- `/maintenance` → Maintenance
- `/collections` → Collections
- `/servers` → Server Integration
- `/visualizer` → Audio Visualizer

### Screen Components (66 total)
```
ui/
├── bookshelf/
│   └── BookshelfScreen.kt → BookshelfScreen.tsx
├── collections/
│   └── CollectionDetailScreen.kt → CollectionDetailScreen.tsx
├── detail/
│   └── MediaItemDetailScreen.kt → MediaItemDetailScreen.tsx
├── filepicker/
│   └── StorageBrowserScreen.kt → StorageBrowserScreen.tsx
├── integration/
│   ├── ServerIntegrationScreen.kt → ServerIntegrationScreen.tsx
│   └── PlexIntegrationScreen.kt → PlexIntegrationScreen.tsx
├── library/
│   ├── LibraryListScreen.kt → LibraryListScreen.tsx
│   ├── LibraryDetailsScreen.kt → LibraryDetailsScreen.tsx
│   ├── LibraryManagementScreen.kt → LibraryManagementScreen.tsx
│   └── UniversalMediaLibraryScreen.kt → UniversalMediaLibraryScreen.tsx
├── maintenance/
│   └── MaintenanceScreen.kt → MaintenanceScreen.tsx
├── metadata/
│   └── MetadataEditorScreen.kt → MetadataEditorScreen.tsx
├── music/
│   ├── MusicLibraryScreen.kt → MusicLibraryScreen.tsx
│   └── MusicPlayerScreen.kt → MusicPlayerScreen.tsx
├── player/
│   ├── AudioPlayerScreen.kt → AudioPlayerScreen.tsx
│   ├── VideoPlayerScreen.kt → VideoPlayerScreen.tsx
│   ├── ModernAudioPlayerScreen.kt → ModernAudioPlayerScreen.tsx
│   ├── ModernVideoPlayerScreen.kt → ModernVideoPlayerScreen.tsx
│   ├── QueueScreen.kt → QueueScreen.tsx
│   └── AdvancedVideoPlayerScreen.kt → AdvancedVideoPlayerScreen.tsx
├── podcast/
│   ├── PodcastManagerScreen.kt → PodcastManagerScreen.tsx
│   └── PodcastPlayerScreen.kt → PodcastPlayerScreen.tsx
├── radio/
│   └── RadioScreen.kt → RadioScreen.tsx
├── reader/
│   ├── EReaderScreen.kt → EReaderScreen.tsx
│   ├── EnhancedEReaderScreen.kt → EnhancedEReaderScreen.tsx
│   ├── EPUBReaderScreen.kt → EPUBReaderScreen.tsx
│   ├── PDFReaderScreen.kt → PDFReaderScreen.tsx
│   ├── ComicReaderScreen.kt → ComicReaderScreen.tsx
│   ├── BookmarkScreen.kt → BookmarkScreen.tsx
│   ├── SearchScreen.kt → SearchScreen.tsx
│   └── ReadingStatisticsScreen.kt → ReadingStatisticsScreen.tsx
├── series/
│   └── SeriesDetailScreen.kt → SeriesDetailScreen.tsx
├── settings/
│   ├── SettingsScreen.kt → SettingsScreen.tsx
│   ├── ImportExportScreen.kt → ImportExportScreen.tsx
│   ├── APIKeysManagerScreen.kt → APIKeysManagerScreen.tsx
│   ├── ReaderSettingsScreen.kt → ReaderSettingsScreen.tsx
│   ├── OpdsSettingsScreen.kt → OpdsSettingsScreen.tsx
│   └── StorageOrganizerScreen.kt → StorageOrganizerScreen.tsx
└── visualizer/
    └── VisualizerScreen.kt → VisualizerScreen.tsx
```

### Services (107 total)
```
services/
├── analysis/ → TypeScript services
├── artwork/ → TypeScript services
├── audio/ → Web Audio API
├── audiobook/ → TypeScript services
├── cache/ → IndexedDB/localStorage
├── cast/ → Cast API if available
├── contentcreation/ → TypeScript services
├── debug/ → TypeScript utilities
├── duplicates/ → TypeScript services
├── epub/ → epub.js library
├── gemini/ → API client
├── integration/
│   ├── plex/ → Plex API client
│   ├── emby/ → Emby API client
│   ├── jellyfin/ → Jellyfin API client
│   ├── calibre/ → Calibre importer
│   └── cloud/ → Cloud sync
├── maintenance/ → TypeScript services
├── media/ → Media API
├── metadata/ → Metadata fetchers
├── music/ → Music services
├── network/ → Fetch API wrapper
├── notification/ → Notification API
├── opds/ → OPDS server/client
├── playback/ → Media Session API
├── playlist/ → Playlist managers
├── podcast/ → Podcast services
├── reader/ → Reader engines
├── security/ → Security services
├── sharing/ → Sharing API
├── sync/ → Sync services
├── thumbnails/ → Thumbnail generator
├── tts/ → Web Speech API
├── video/ → Video services
├── visualizer/ → Web Audio visualizer
└── webfiction/ → Story downloaders
```

## Technology Stack

### Android
- Kotlin
- Jetpack Compose
- Room Database
- Hilt (Dependency Injection)
- Coroutines
- ExoPlayer
- AndroidPDFView
- Various Android APIs

### PWA
- TypeScript
- React 18
- React Router
- Material-UI (MUI)
- Dexie.js (IndexedDB wrapper)
- Zustand (State management)
- Web APIs:
  - Media Session API
  - Web Audio API
  - File System Access API
  - Notifications API
  - Service Workers
  - IndexedDB
  - Web Speech API (TTS)

## Key Differences & Adaptations

### File System Access
- **Android**: Direct file system access via SAF
- **PWA**: File System Access API (Chrome/Edge), fallback to File API

### Database
- **Android**: Room (SQLite)
- **PWA**: Dexie.js (IndexedDB)

### Media Playback
- **Android**: ExoPlayer
- **PWA**: HTML5 Audio/Video + Media Session API

### Background Tasks
- **Android**: Services, WorkManager
- **PWA**: Service Workers, Background Sync API

### Notifications
- **Android**: NotificationManager
- **PWA**: Notifications API + Service Worker

### PDF/EPUB Reading
- **Android**: AndroidPDFView, custom EPUB parser
- **PWA**: PDF.js, epub.js

### Text-to-Speech
- **Android**: Android TTS Engine
- **PWA**: Web Speech API

### Audio Visualization
- **Android**: Android audio capture
- **PWA**: Web Audio API (AnalyserNode)

## Migration Approach

1. **Phase 1: Foundation** ✅
   - Set up project structure
   - Migrate all data models to TypeScript
   - Create type definitions

2. **Phase 2: Core Infrastructure** (Current)
   - Implement Dexie.js database
   - Create repository pattern
   - Set up routing

3. **Phase 3: Essential Features**
   - Library management
   - Media viewer/player
   - Basic reader

4. **Phase 4: Advanced Features**
   - Server integrations
   - Advanced readers
   - Metadata services

5. **Phase 5: PWA Features**
   - Service worker
   - Offline support
   - Install prompts

6. **Phase 6: Polish**
   - Testing
   - Performance optimization
   - UI/UX refinements

## Notes

- PWA will have some limitations compared to native Android app (file system access, background tasks)
- Some features may require different implementations (e.g., ExoPlayer → HTML5 media)
- Consider using Capacitor/Electron for desktop/mobile hybrid if full native features needed
- Service Worker required for true offline functionality
- IndexedDB has storage limits per origin (typically 50MB-unlimited depending on browser)

## Resources

- [Dexie.js Documentation](https://dexie.org/)
- [Media Session API](https://developer.mozilla.org/en-US/docs/Web/API/Media_Session_API)
- [File System Access API](https://developer.mozilla.org/en-US/docs/Web/API/File_System_Access_API)
- [epub.js](https://github.com/futurepress/epub.js/)
- [PDF.js](https://mozilla.github.io/pdf.js/)
- [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
