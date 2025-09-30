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
- [ ] `ui/main/MainViewModel.kt.disabled` - Core app navigation
- [ ] `ui/library/LibraryDetailsViewModel.kt.disabled`
- [ ] `ui/bookshelf/BookshelfScreen.kt.disabled`
- [ ] `ui/bookshelf/BookshelfViewModel.kt.disabled`
- [ ] `ui/bookshelf/BookshelfComponents.kt.disabled`
- [ ] `ui/bookshelf/EnhancedBookshelfScreen.kt.disabled`

#### Reader Components
- [ ] `ui/reader/EReaderScreen.kt.disabled`
- [ ] `ui/reader/EReaderViewModel.kt.disabled`
- [ ] `ui/reader/EnhancedEReaderScreen.kt.disabled`
- [ ] `ui/reader/EPUBReaderScreen.kt.disabled`
- [ ] `ui/reader/PDFReaderViewModel.kt.disabled`
- [ ] `ui/reader/EnhancedPDFReaderScreen.kt.disabled`
- [ ] `ui/reader/components/DocumentReaderComponents.kt.disabled`
- [ ] `ui/reader/components/ComicReaderComponents.kt.disabled`
- [ ] `ui/reader/components/ReaderModels.kt.disabled`

#### Media Players
- [ ] `ui/player/AdvancedVideoPlayerScreen.kt.disabled`
- [ ] `ui/player/UniversalVideoPlayerScreen.kt.disabled`
- [ ] `ui/player/UniversalVideoPlayerViewModel.kt.disabled`
- [ ] `ui/audiobook/AudiobookPlayerScreen.kt.disabled`
- [ ] `ui/audiobook/AudiobookPlayerViewModel.kt.disabled`
- [ ] `ui/music/MusicPlayerScreen.kt.disabled`
- [ ] `ui/music/MusicPlayerViewModel.kt.disabled`

#### Metadata Editors
- [ ] `ui/metadata/MetadataEditorScreen.kt.disabled`
- [ ] `ui/metadata/MetadataEditorViewModel.kt.disabled`
- [ ] `ui/metadata/EnhancedMetadataEditor.kt.disabled`
- [ ] `ui/metadata/EnhancedMetadataViewModel.kt.disabled`
- [ ] `ui/metadata/MetadataEditorModels.kt.disabled`
- [ ] `ui/metadata/ChipInputs.kt.disabled`

#### Settings
- [ ] `ui/settings/SettingsScreen.kt.disabled`
- [ ] `ui/settings/SecurityAndAboutScreens.kt.disabled`
- [ ] `ui/settings/ReaderSettingsScreen.kt.disabled`
- [ ] `ui/settings/APISettingsScreen.kt.disabled`
- [ ] `ui/settings/ApiSettingsScreen.kt.disabled`

#### Web Fiction
- [ ] `ui/webfiction/WebFictionViewModel.kt.disabled`
- [ ] `ui/webfiction/WebFictionManagerScreen.kt.disabled`

#### Podcast
- [ ] `ui/podcast/PodcastScreen.kt.disabled`
- [ ] `ui/podcast/PodcastViewModel.kt.disabled`

#### Plex Integration
- [ ] `ui/plex/PlexIntegrationScreen.kt.disabled`
- [ ] `ui/plex/PlexIntegrationViewModel.kt.disabled`

### 2. Services & Integration (Priority: MEDIUM)
**Count**: ~20 files
**Status**: Not Started
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
**Status**: Not Started

- [ ] `ui/icons/PhosphorIcons.kt.disabled`
- [ ] `ui/components/MediaItemHandler.kt.disabled`
- [ ] `ui/viewer/MediaViewerManager.kt.disabled`
- [ ] `ui/viewer/common/ViewerSettings.kt.disabled`

## Repair Strategy

### Phase 1: Update Dependencies & Modernize (Priority: CRITICAL)
**Status**: Not Started
**Goal**: Update to modern Kotlin 2.1.0 and remove deprecated dependencies

#### Tasks:
1. [ ] Review and update all Kotlin dependencies to 2.1.0 compatible versions
2. [ ] Remove deprecated Kapt usage, migrate to KSP where needed
3. [ ] Update Compose BOM to latest stable
4. [ ] Update AndroidX libraries to latest stable
5. [ ] Update Hilt to latest version
6. [ ] Update Room to latest version
7. [ ] Update Coroutines to latest version
8. [ ] Remove any obsolete dependencies

#### Known Issues to Fix:
- Deprecated Kapt usage (prefer KSP)
- Old Compose compiler version
- Deprecated AndroidX APIs
- Obsolete Gradle configurations

### Phase 2: Core Components (Priority: HIGH)
**Status**: Not Started
**Goal**: Re-enable essential shared components first

1. [ ] PhosphorIcons.kt - Icon library used throughout
2. [ ] MainViewModel.kt - Already created stub, needs full implementation
3. [ ] MediaItemHandler.kt - Core media handling
4. [ ] MediaViewerManager.kt - Media type detection

### Phase 3: Data Layer (Priority: HIGH)
**Status**: Not Started
**Goal**: Enable database access layer

1. [ ] Enable mediaItemDao in AppDatabase
2. [ ] Enable metadataDao in AppDatabase
3. [ ] Enable bookmarkDao in AppDatabase
4. [ ] Update DatabaseModule with all DAOs

### Phase 4: UI Screens by Module (Priority: MEDIUM)
**Status**: Not Started
**Goal**: Re-enable UI screens module by module

#### Order:
1. Library & Bookshelf (core functionality)
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
- **Files Repaired**: 0
- **Files In Progress**: 0
- **Files Remaining**: 104
- **Completion**: 0%

### Recent Repairs
*None yet - starting fresh*

## Next Steps

1. ✅ Create this repair plan document
2. ⬜ Update dependencies to modern Kotlin 2.1.0
3. ⬜ Start with Phase 2: Core Components
4. ⬜ Repair files incrementally, testing after each
5. ⬜ Update progress in this document
6. ⬜ Commit working repairs progressively

## Notes

- Each file should be tested individually before moving to next
- Build must remain in working state after each repair
- Document any breaking changes or migration notes
- Keep TODO comments for incomplete functionality
- Test both compilation and runtime behavior where possible
