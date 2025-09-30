# Disabled Files Repair Plan

## Overview
This document tracks the systematic repair of 104 disabled files in the CleverFerret project. Files were disabled to achieve a buildable state for the scaffolding PR. Each file will be analyzed, repaired, and re-enabled incrementally.

## Current Kotlin Version
- **Kotlin**: 2.1.0
- **Gradle**: 8.13
- **Compile SDK**: 36
- **Target SDK**: 36
- **Min SDK**: 26
- **JVM Target**: 17

## Categories of Disabled Files

### 1. UI Components (Priority: HIGH)
**Count**: ~70 files
**Status**: Not Started
**Dependencies**: ViewModel classes, data models

#### Main UI Screens
- [x] `ui/main/MainViewModel.kt` - ✅ Re-enabled (upgraded from stub to full implementation)
- [x] `ui/library/LibraryDetailsViewModel.kt` - ✅ Re-enabled
- [ ] `ui/bookshelf/BookshelfScreen.kt.disabled`
- [x] `ui/bookshelf/BookshelfViewModel.kt` - ✅ Re-enabled
- [ ] `ui/bookshelf/BookshelfComponents.kt.disabled`
- [x] `ui/bookshelf/EnhancedBookshelfScreen.kt` - ✅ Re-enabled
- [x] `ui/details/BookDetailsScreen.kt` - ✅ Re-enabled

#### Reader Components
- [x] `ui/reader/EReaderScreen.kt` - ✅ Re-enabled
- [x] `ui/reader/EReaderViewModel.kt` - ✅ Re-enabled
- [ ] `ui/reader/EnhancedEReaderScreen.kt.disabled`
- [ ] `ui/reader/EPUBReaderScreen.kt.disabled`
- [x] `ui/reader/PDFReaderViewModel.kt` - ✅ Re-enabled
- [ ] `ui/reader/EnhancedPDFReaderScreen.kt.disabled`
- [ ] `ui/reader/components/DocumentReaderComponents.kt.disabled`
- [ ] `ui/reader/components/ComicReaderComponents.kt.disabled`
- [x] `ui/reader/components/ReaderModels.kt` - ✅ Re-enabled
- [x] `ui/reader/ReadingStats.kt` - ✅ Re-enabled
- [x] `ui/reader/ReadingStatisticsViewModel.kt` - ✅ Re-enabled
- [x] `ui/reader/AdvancedDocumentReader.kt` - ✅ Re-enabled
- [x] `ui/reader/BookmarkViewModel.kt` - ✅ Re-enabled
- [x] `ui/reader/AutoScrollComponents.kt` - ✅ Re-enabled
- [x] `ui/reader/ReaderGestureHandler.kt` - ✅ Re-enabled
- [x] `ui/reader/SearchViewModel.kt` - ✅ Re-enabled
- [x] `ui/reader/EbookReaderScreen.kt` - ✅ Re-enabled
- [x] `ui/reader/ReadingStatisticsScreen.kt` - ✅ Re-enabled

#### Media Players
- [ ] `ui/player/AdvancedVideoPlayerScreen.kt.disabled`
- [ ] `ui/player/UniversalVideoPlayerScreen.kt.disabled`
- [ ] `ui/player/UniversalVideoPlayerViewModel.kt.disabled`
- [ ] `ui/audiobook/AudiobookPlayerScreen.kt.disabled`
- [x] `ui/audiobook/AudiobookPlayerViewModel.kt` - ✅ Re-enabled
- [ ] `ui/music/MusicPlayerScreen.kt.disabled`
- [x] `ui/music/MusicPlayerViewModel.kt` - ✅ Re-enabled
- [x] `ui/player/QueueScreen.kt` - ✅ Re-enabled
- [x] `ui/player/VideoPlayerViewModel.kt` - ✅ Re-enabled
- [x] `ui/player/components/PlayerModels.kt` - ✅ Re-enabled
- [x] `ui/music/MusicLibraryScreen.kt` - ✅ Re-enabled
- [x] `ui/music/MusicLibraryViewModel.kt` - ✅ Re-enabled
- [x] `ui/player/AudioPlayerScreen.kt` - ✅ Re-enabled
- [x] `ui/player/AdvancedVideoPlayerViewModel.kt` - ✅ Re-enabled
- [x] `ui/playback/NowPlayingViewModel.kt` - ✅ Re-enabled
- [x] `ui/podcast/PodcastPlayerViewModel.kt` - ✅ Re-enabled

#### Metadata Editors
- [ ] `ui/metadata/MetadataEditorScreen.kt.disabled`
- [x] `ui/metadata/MetadataEditorViewModel.kt` - ✅ Re-enabled
- [ ] `ui/metadata/EnhancedMetadataEditor.kt.disabled`
- [x] `ui/metadata/EnhancedMetadataViewModel.kt` - ✅ Re-enabled
- [x] `ui/metadata/MetadataEditorModels.kt` - ✅ Re-enabled
- [x] `ui/metadata/ChipInputs.kt` - ✅ Re-enabled

#### Settings
- [x] `ui/settings/SettingsScreen.kt` - ✅ Re-enabled
- [ ] `ui/settings/SecurityAndAboutScreens.kt.disabled`
- [ ] `ui/settings/ReaderSettingsScreen.kt.disabled`
- [ ] `ui/settings/APISettingsScreen.kt.disabled`
- [ ] `ui/settings/ApiSettingsScreen.kt.disabled`
- [x] `ui/settings/SecuritySettingsViewModel.kt` - ✅ Re-enabled
- [x] `ui/settings/SecuritySettingsScreen.kt` - ✅ Re-enabled
- [x] `ui/settings/APISettingsViewModel.kt` - ✅ Re-enabled

#### Web Fiction
- [x] `ui/webfiction/WebFictionViewModel.kt` - ✅ Re-enabled
- [ ] `ui/webfiction/WebFictionManagerScreen.kt.disabled`

#### Content Creation
- [x] `ui/contentcreation/ContentCreationScreen.kt` - ✅ Re-enabled
- [x] `ui/contentcreation/ContentCreationViewModel.kt` - ✅ Re-enabled

#### Podcast
- [ ] `ui/podcast/PodcastScreen.kt.disabled`
- [ ] `ui/podcast/PodcastViewModel.kt.disabled`

#### Plex Integration
- [ ] `ui/plex/PlexIntegrationScreen.kt.disabled`
- [ ] `ui/plex/PlexIntegrationViewModel.kt.disabled`
- [x] `ui/plex/PlexSyncViewModel.kt` - ✅ Re-enabled
- [x] `ui/plex/PlexAuthViewModel.kt` - ✅ Re-enabled
- [x] `ui/integration/PlexIntegrationViewModel.kt` - ✅ Re-enabled

#### Viewer Components
- [x] `ui/viewer/common/ViewerSettings.kt` - ✅ Re-enabled

### 2. Services & Integration (Priority: MEDIUM)
**Count**: ~20 files
**Status**: In Progress

#### Analysis Services
- [ ] `services/analysis/SmartContentAnalyzer.kt.disabled`
- [x] `services/analysis/AnalysisModels.kt` - ✅ Re-enabled
- [ ] `services/analysis/GemmaLLMService.kt.disabled`
- [x] `services/analysis/classification/ContentClassifier.kt` - ✅ Re-enabled
- [x] `services/analysis/comparison/ArchiveComparator.kt` - ✅ Re-enabled
- [ ] `services/analysis/fingerprint/ContentFingerprinter.kt.disabled`
- [x] `services/analysis/nlp/MetadataExtractor.kt` - ✅ Re-enabled
- [ ] `services/analysis/ocr/OCRService.kt.disabled`

#### Integration Services
- [x] `services/integration/IntegrationManager.kt` - ✅ Re-enabled
- [x] `services/integration/PlexServiceResults.kt` - ✅ Re-enabled
- [x] `services/integration/books/BookServicesIntegration.kt` - ✅ Re-enabled
- [x] `services/integration/calibre/CalibreIntegrationService.kt` - ✅ Re-enabled
- [x] `services/integration/cloud/CloudStorageService.kt` - ✅ Re-enabled
- [ ] `services/integration/plex/PlexIntegrationService.kt.disabled`
- [ ] `services/integration/plex/PlexApi.kt.disabled`
- [x] `services/integration/plex/PlexServiceResults.kt` - ✅ Re-enabled

#### Data Layer
- [x] `data/local/CleverFerretDatabase.kt` - ✅ Re-enabled
**Dependencies**: External libraries, API models

#### Analysis Services
- [ ] `services/analysis/SmartContentAnalyzer.kt.disabled`
- [ ] `services/analysis/AnalysisModels.kt.disabled`
- [ ] `services/analysis/GemmaLLMService.kt.disabled`
- [ ] `services/analysis/classification/ContentClassifier.kt.disabled`
- [ ] `services/analysis/comparison/ArchiveComparator.kt.disabled`
- [ ] `services/analysis/fingerprint/ContentFingerprinter.kt.disabled`
- [ ] `services/analysis/nlp/MetadataExtractor.kt.disabled`
- [ ] `services/analysis/ocr/OCRService.kt.disabled`

#### Integration Services
- [ ] `services/integration/IntegrationManager.kt.disabled`
- [ ] `services/integration/PlexServiceResults.kt.disabled`
- [ ] `services/integration/books/BookServicesIntegration.kt.disabled`
- [ ] `services/integration/calibre/CalibreIntegrationService.kt.disabled`
- [ ] `services/integration/cloud/CloudStorageService.kt.disabled`
- [ ] `services/integration/plex/PlexIntegrationService.kt.disabled`
- [ ] `services/integration/plex/PlexApi.kt.disabled`

### 3. Shared Components (Priority: HIGH)
**Count**: ~10 files
**Status**: ✅ COMPLETED

- [x] `ui/icons/PhosphorIcons.kt` - ✅ Re-enabled (commit b869cd1)
- [x] `ui/components/MediaItemHandler.kt` - ✅ Re-enabled
- [x] `ui/viewer/MediaViewerManager.kt` - ✅ Re-enabled
- [ ] `ui/viewer/common/ViewerSettings.kt.disabled`

## Repair Strategy

### Phase 1: Update Dependencies & Modernize (Priority: CRITICAL)
**Status**: ✅ COMPLETED
**Goal**: Update to modern Kotlin 2.1.0 and remove deprecated dependencies

#### Tasks:
1. [x] Review and update all Kotlin dependencies to 2.1.0 compatible versions - ✅ Already on Kotlin 2.1.0
2. [x] Remove deprecated Kapt usage, migrate to KSP where needed - ✅ Already using KSP
3. [x] Update Compose BOM to latest stable - ✅ Using Compose BOM 2025.09.01
4. [x] Update AndroidX libraries to latest stable - ✅ All updated
5. [x] Update Hilt to latest version - ✅ Using Hilt 2.54
6. [x] Update Room to latest version - ✅ Using Room 2.8.1
7. [x] Update Coroutines to latest version - ✅ Using 1.7.3
8. [x] Remove any obsolete dependencies - ✅ No obsolete dependencies found

#### Known Issues to Fix:
- ✅ Deprecated Kapt usage (prefer KSP) - Already using KSP
- ✅ Old Compose compiler version - Using latest
- ✅ Deprecated AndroidX APIs - All updated
- ✅ Obsolete Gradle configurations - Clean

### Phase 2: Core Components (Priority: HIGH)
**Status**: ✅ COMPLETED
**Goal**: Re-enable essential shared components first

1. [x] PhosphorIcons.kt - ✅ Icon library used throughout (commit b869cd1)
2. [ ] MainViewModel.kt - Already created stub, needs full implementation
3. [x] MediaItemHandler.kt - ✅ Core media handling re-enabled
4. [x] MediaViewerManager.kt - ✅ Media type detection re-enabled

### Phase 3: Data Layer (Priority: HIGH)
**Status**: ✅ COMPLETED
**Goal**: Enable database access layer

1. [x] Enable mediaItemDao in AppDatabase - ✅ Enabled
2. [x] Enable metadataDao in AppDatabase - ✅ Enabled
3. [x] Enable bookmarkDao in AppDatabase - ✅ Enabled
4. [x] Update DatabaseModule with all DAOs - ✅ Updated
5. [x] Update MediaPlaybackWidgetService to use real mediaItemDao - ✅ Updated

### Phase 4: UI Screens by Module (Priority: MEDIUM)
**Status**: In Progress
**Goal**: Re-enable UI screens module by module

#### Order:
1. Library & Bookshelf (core functionality) - Starting
2. Reader components (e-reader, PDF)
3. Settings screens
4. Media players (video, audio, music)
5. Metadata editors
6. Advanced features (WebFiction, Podcast, Plex)

### Phase 5: Integration Services (Priority: LOW)
**Status**: Not Started
**Goal**: Re-enable optional integration services

1. Analysis services
2. External API integrations
3. Cloud services

## Common Repair Patterns

### Pattern 1: Missing ViewModel Properties
**Issue**: ViewModel properties referenced in UI don't exist
**Fix**: 
- Add missing StateFlow properties to ViewModel
- Or comment out UI code referencing non-existent properties
- Or update UI to use correct property names

### Pattern 2: Data Model Mismatch
**Issue**: Constructor parameters don't match data class definition
**Fix**:
- Update data class to include missing fields
- Or update usage to provide required parameters
- Or make fields optional with defaults

### Pattern 3: Deprecated API Usage
**Issue**: Using deprecated Kotlin/Android APIs
**Fix**:
- Replace with modern equivalents
- Update imports
- Update function calls

### Pattern 4: Missing Dependencies
**Issue**: Classes depend on unavailable services
**Fix**:
- Add service to dependency injection
- Or make dependency optional
- Or create stub implementation

### Pattern 5: Type Mismatches
**Issue**: Kotlin type inference failures or wrong types
**Fix**:
- Add explicit types
- Convert between types
- Update function signatures

## Progress Tracking

### Statistics
- **Total Disabled Files**: 104
- **Files Repaired**: 59 (4 Phase 2-3, 25 Batch 1, 30 Batch 2)
- **Files In Progress**: 0
- **Files Remaining**: 45
- **Completion**: 57%

### Recent Repairs (Batch 2 - 30 files)

**Core ViewModels (7 files):**
1. ✅ MainViewModel.kt - Upgraded from stub to full implementation with LibraryDao
2. ✅ MetadataEditorViewModel.kt - Metadata editing state
3. ✅ MusicPlayerViewModel.kt - Music playback state
4. ✅ ContentCreationViewModel.kt - Content creation state
5. ✅ APISettingsViewModel.kt - API configuration
6. ✅ AudiobookPlayerViewModel.kt - Audiobook playback
7. ✅ WebFictionViewModel.kt - Web fiction management

**Reader Screens & ViewModels (8 files):**
8. ✅ EReaderScreen.kt - E-reader UI
9. ✅ PDFReaderViewModel.kt - PDF reading state
10. ✅ SearchViewModel.kt - Search functionality
11. ✅ EbookReaderScreen.kt - Ebook reading UI
12. ✅ ReadingStatisticsScreen.kt - Reading stats UI
13. ✅ ReaderGestureHandler.kt - Gesture controls
14. ✅ BookDetailsScreen.kt - Book details UI

**Player Components (4 files):**
15. ✅ AudioPlayerScreen.kt - Audio player UI
16. ✅ AdvancedVideoPlayerViewModel.kt - Video playback state
17. ✅ NowPlayingViewModel.kt - Now playing state
18. ✅ PodcastPlayerViewModel.kt - Podcast playback

**UI Components (4 files):**
19. ✅ ContentCreationScreen.kt - Content creation UI
20. ✅ SettingsScreen.kt - Settings UI
21. ✅ ChipInputs.kt - Tag/chip input components

**Services & Integration (7 files):**
22. ✅ AnalysisModels.kt - Analysis data models
23. ✅ ArchiveComparator.kt - Archive comparison service
24. ✅ ContentClassifier.kt - Content classification
25. ✅ MetadataExtractor.kt - Metadata extraction
26. ✅ IntegrationManager.kt - Integration orchestration
27. ✅ BookServicesIntegration.kt - Book service APIs
28. ✅ CalibreIntegrationService.kt - Calibre integration
29. ✅ CloudStorageService.kt - Cloud storage integration
30. ✅ PlexServiceResults.kt (2 files) - Plex service models
31. ✅ CleverFerretDatabase.kt - Alternative database implementation

**Summary:**
- All 30 files compile successfully
- Modern Kotlin 2.1.0 patterns throughout
- Proper database integration
- Full ViewModel implementations with proper DAOs
16. ✅ PlexAuthViewModel.kt - Plex authentication

**Screens & Components (9 files):**
17. ✅ QueueScreen.kt - Playback queue UI
18. ✅ AdvancedDocumentReader.kt - Advanced document reading
19. ✅ MusicLibraryScreen.kt - Music library UI
20. ✅ AutoScrollComponents.kt - Auto-scroll functionality
21. ✅ EnhancedBookshelfScreen.kt - Enhanced bookshelf UI
22. ✅ SecuritySettingsScreen.kt - Security settings UI
23. ✅ BookshelfViewModel.kt - Bookshelf state
24. ✅ PlexIntegrationViewModel.kt - Plex integration state

**Summary:**
- Model files: Simple data classes, no dependencies - all working
- ViewModels: Database access enabled, all compile successfully
- Screens: UI components with standard Compose patterns

## Next Steps

1. [x] Create this repair plan document
2. [x] Update dependencies to modern Kotlin 2.1.0 - Already on 2.1.0
3. [x] Complete Phase 2: Core Components - DONE
4. [x] Complete Phase 3: Data Layer - DONE
5. [x] Start Phase 4: UI Screens by Module - In Progress
6. [x] Update progress in this document - Done
7. ⬜ Continue with Library & Bookshelf screens
8. ⬜ Commit working repairs progressively

## Notes

- Each file should be tested individually before moving to next
- Build must remain in working state after each repair
- Document any breaking changes or migration notes
- Keep TODO comments for incomplete functionality
- Test both compilation and runtime behavior where possible
