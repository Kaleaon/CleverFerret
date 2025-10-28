# TODO Categorization and Status

**Date**: 2025-10-27  
**Total TODOs**: 87 items  
**Status**: Categorized and being resolved

---

## Categories

### 🚀 QUICK WINS (Can implement immediately) - 15 items
**Simple navigation, error handling, UI polish**

1. Navigate to settings (LibraryManagementScreen.kt:57)
2. Navigate to library contents (LibraryManagementScreen.kt:58)
3. Navigate to video player (VideoLibraryScreen.kt:79)
4. Show error snackbar (LibraryManagementScreen.kt:59)
5. Show error snackbar (MusicPlayerScreen.kt:68)
6. Show toast/snackbar with result (ReadingPreferencesScreen.kt:75)
7. Show file picker for backup (ReadingPreferencesScreen.kt:76)
8. Pass preset back to visualizer (MainActivity.kt:2)
9. Show user dialog for backup restore (CleverFerretApplication.kt:1)
10. Share via Android share sheet (PresetBrowserScreen.kt:82)
11. Show UI to choose/create playlist (NowPlayingViewModel.kt:72)
12. Handle similar artists result (MusicPlayerViewModel.kt:70)
13. Handle top tracks result (MusicPlayerViewModel.kt:71)
14. Update track metadata in database (MusicPlayerViewModel.kt:69)
15. Add deleteBookmark method to ViewModel (AudiobookPlayerScreen.kt:50)

### 📊 METADATA & DATABASE (Need repository integration) - 20 items
**Require data layer connections**

1. Load audiobook cover art (AudiobookService.kt:11)
2. Extract author from metadata (AudiobookService.kt:12)
3. Extract cover image from EPUB (EpubReaderEngine.kt:14)
4. Load artwork from albumArtUrl (AdvancedMusicPlayerService.kt:21)
5. Extract duration from file metadata (AdvancedMusicPlayerService.kt:22)
6. Calculate total duration - books (AudiobookPlaylistManager.kt:29)
7. Calculate total duration - movies (MoviePlaylistManager.kt:34-35)
8. Calculate total duration - music (MusicPlaylistManager.kt:38)
9. Calculate total duration - TV (TVShowPlaylistManager.kt:43)
10. Fetch author from People table (BookshelfViewModel.kt:54)
11. Fetch series from Series table (BookshelfViewModel.kt:55)
12. Fetch author from metadata tables (UniversalMediaLibraryViewModel.kt:64)
13. Add favorite tracking (UniversalMediaLibraryViewModel.kt:65)
14. Add favorite field to entity (MediaItemDetailViewModel.kt:56)
15. Add progress tracking (UniversalMediaLibraryViewModel.kt:66)
16. Get actual item count (LibraryManagementScreen.kt:61)
17. Load artwork from MediaController (NowPlayingScreen.kt:67)
18. Set duration for MediaMetadata (MediaSessionManager.kt:19)
19. Add SecuritySettingsEntity persistence (SettingsViewModel.kt:77)
20. Add GeneralSettingsEntity persistence (SettingsViewModel.kt:78)

### 🎯 HISTORY & PROGRESS (Need HistoryRepository) - 13 items
**All need history tracking system**

1. Filter by author/genre (AudiobookPlaylistManager.kt:23-24)
2. Integrate with reading progress (AudiobookPlaylistManager.kt:25-28)
3. Filter by genre/director (MoviePlaylistManager.kt:30-31)
4. Integrate with watch history (MoviePlaylistManager.kt:32)
5. Integrate with rating system (MoviePlaylistManager.kt:33)
6. Filter by genre (MusicPlaylistManager.kt:36)
7. Implement play count tracking (MusicPlaylistManager.kt:37)
8. Filter by show/season (TVShowPlaylistManager.kt:39)
9. Integrate with watch history - last watched (TVShowPlaylistManager.kt:40)
10. Integrate with watch history - watched flag (TVShowPlaylistManager.kt:41)
11. Integrate with progress tracking (TVShowPlaylistManager.kt:42)
12. Integrate with watch history - general (TVShowPlaylistManager.kt:44)

### 🏗️ ARCHITECTURE (Need infrastructure/decisions) - 10 items
**Require architectural work**

1. Migrate to Media3 MediaSessionService (AudioPlaybackManager.kt:10)
2. Add ExoPlayer support (UniversalMediaPlayerService.kt:20)
3. Implement proper MediaNotificationService initialization (MediaNotificationService.kt:15-18)
4. Add Tika dependency for content type detection (MediaViewerManager.kt:80-81)
5. Implement actual media scanning (LibraryManagementViewModel.kt:62)
6. Implement actual Calibre import (LibraryManagementViewModel.kt:63)
7. Integrate text extraction library (PDFSearchEngine.kt:46)
8. Implement OCR-based search (PDFSearchEngine.kt:47)
9. Implement text search with PdfBox (PdfReaderEngine.kt:49)

### 🎨 UI COMPONENTS (Need component creation) - 12 items
**Require new UI components**

1. Implement chapter list UI (AudiobookPlayerScreen.kt:51)
2. Implement bookmarks UI (AudiobookPlayerScreen.kt:52)
3. Implement sleep timer dialog UI (AudiobookPlayerScreen.kt:53)
4. Implement page selector dialog (PDFReaderViewModel.kt:73)
5. Implement bookmarks dialog (PDFReaderViewModel.kt:74)
6. Widget state management (MediaPlaybackWidget.kt:83-86)
7. Add item count and stats (LibraryManagementScreen.kt:60)

### 🌐 FUTURE FEATURES (Nice to have) - 17 items
**Enhancement features**

1. Streaming support for remote EPUB files (EpubReaderEngine.kt:13)
2. Streaming support for remote PDF files (PdfReaderEngine.kt:48)
3. Streaming support for remote comic archives (ComicReaderEngine.kt:45)
4. Add support for tags and collections (UnifiedMediaModel.kt:3-9)
5. Add computed properties for artwork variants (UnifiedMediaModel.kt:4)
6. Add support for external media sources (UnifiedMediaModel.kt:5)
7. Add support for grouped media (UnifiedMediaModel.kt:6)
8. Add support for media relationships (UnifiedMediaModel.kt:7)

---

## Resolution Strategy

### Phase 1: Quick Wins (Implementing Now)
Complete simple navigation and error handling

### Phase 2: Database Integration
Add metadata extraction and repository connections

### Phase 3: History System
Implement HistoryRepository and integrate

### Phase 4: UI Components
Create dialogs and missing components

### Phase 5: Architecture
Handle complex infrastructure changes

### Phase 6: Future Features
Enhancement and optimization work

---

**Status**: Categorized, beginning resolution
