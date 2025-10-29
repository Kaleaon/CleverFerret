# CleverFerret - Broken Features Detailed List

**Last Updated**: January 2025  
**Build Status**: ❌ FAILING

This document provides a detailed breakdown of what is broken in CleverFerret, organized by component and severity.

---

## 🚨 CRITICAL - Build System (BLOCKS EVERYTHING)

### Compilation Failures by Category

#### 1. Data Model Issues (25 files)

**WebFiction Data Models** - `services/webfiction/WebFictionModels.kt`
- ❌ Missing parameters: `site`, `totalChapters`, `coverUrl`, `chapters`
- ❌ Wrong parameter types: `status` expects enum but gets String, `updatedAt` expects Long but gets String
- ❌ Missing required parameters: `genre`, `fandom`, `language`, `chapterCount`, `rating`
- **Impact**: All web fiction features non-functional
- **Affected UI**: WebFictionManagerScreen.kt, WebFictionViewModel.kt

**Podcast Data Models** - `services/podcast/PodcastModels.kt`
- ❌ Data model parameter mismatches
- **Impact**: Podcast features non-functional
- **Affected UI**: PodcastManagerScreen.kt, PodcastPlayerScreen.kt, PodcastViewModel.kt

**Analysis Models** - `services/analysis/AnalysisModels.kt`
- ❌ Compilation errors
- **Impact**: AI/ML analysis features non-functional

**Reader Models** - `ui/reader/components/ReaderModels.kt`
- ❌ Compilation errors
- **Impact**: Advanced reader features broken

#### 2. ViewModel Issues (15 files)

**Missing ViewModels**
- ❌ `SettingsViewModel` - Referenced but doesn't exist
  - Affected: SettingsScreen.kt, SecurityAndAboutScreens.kt

**Broken ViewModels**
- ❌ `APISettingsViewModel.kt` - Compilation errors
- ❌ `WebFictionViewModel.kt` - Data model mismatch errors (25+ errors)
- ❌ `BookshelfViewModel.kt` - Compilation errors
- ❌ `BookDetailsViewModel.kt` - Compilation errors
- ❌ `LibraryDetailsViewModel.kt` - Compilation errors
- ❌ `LibraryListViewModel.kt` - Compilation errors
- ❌ `LibraryManagementViewModel.kt` - Compilation errors
- ❌ `UniversalMediaLibraryViewModel.kt` - Compilation errors
- ❌ `MetadataEditorViewModel.kt` - Compilation errors
- ❌ `AdvancedVideoPlayerViewModel.kt` - Compilation errors
- ❌ `UniversalVideoPlayerViewModel.kt` - Compilation errors
- ❌ `PodcastPlayerViewModel.kt` - Compilation errors
- ❌ `PodcastViewModel.kt` - Compilation errors
- ❌ `AdvancedComicReaderViewModel.kt` - Compilation errors
- ❌ `AdvancedDocumentReaderViewModel.kt` - Compilation errors

#### 3. Service Layer Issues (25 files)

**Core Services**
- ❌ `CalibreImportService.kt` - Compilation errors
- ❌ `MediaScannerService.kt` - Compilation errors
- ❌ `StorageAccessService.kt` - Compilation errors

**Audio Services**
- ❌ `AudioPlaybackManager.kt` - Type inference failure
  - Error: Cannot infer type parameter 'T'
  - Impact: Audio playback completely broken

**Content Creation Services**
- ❌ `FanfictionToEPUBConverter.kt` - Compilation errors
- ❌ `FanfictionToEpubConverter.kt` - Compilation errors (duplicate file?)
- ❌ `FanfictionToEpubConverterBasic.kt` - Compilation errors
- ❌ `NewsToEPUBConverter.kt` - Compilation errors
- ❌ `NewsToEpubConverter.kt` - Compilation errors (duplicate file?)
- ❌ `StoryUpdateManager.kt` - Compilation errors

**Reader Services**
- ❌ `EPUBReaderService.kt` - Compilation errors
- ❌ `EpubReaderEngine.kt` - Compilation errors
- ❌ `EpubReaderService.kt` - Compilation errors (duplicate file?)
- ❌ `UniversalReaderService.kt` - Compilation errors

**AI/Analysis Services**
- ❌ `GemmaLLMService.kt` - Compilation errors
- ❌ `SmartContentAnalyzer.kt` - Compilation errors
- ❌ `MetadataExtractor.kt` - Compilation errors
- ❌ `OCRService.kt` - Compilation errors
- ❌ `GeminiService.kt` - Compilation errors

**Metadata Services**
- ❌ `ComprehensiveMetadataService.kt` - Compilation errors
- ❌ `MetadataApiService.kt` - Compilation errors
- ❌ `MetadataServiceModels.kt` - Compilation errors
- ❌ `RealMetadataService.kt` - Compilation errors
- ❌ `MusicMetadataService.kt` - Compilation errors

**Media Services**
- ❌ `MediaButtonReceiver.kt` - Compilation errors
- ❌ `MediaNotificationService.kt` - Compilation errors
- ❌ `MediaSessionManager.kt` - Compilation errors

**Integration Services**
- ❌ `IntegrationManager.kt` - Compilation errors
- ❌ `PlexServiceResults.kt` - Compilation errors
- ❌ `PlexApi.kt` - Compilation errors
- ❌ `PlexIntegrationService.kt` - Compilation errors

**Other Services**
- ❌ `UnifiedPlaybackQueueManager.kt` - Compilation errors
- ❌ `PodcastService.kt` - Compilation errors
- ❌ `ComprehensiveVideoService.kt` - Compilation errors
- ❌ `WebFictionService.kt` - Compilation errors
- ❌ `ArtworkLoader.kt` - Compilation errors

#### 4. UI Component Issues (20 files)

**Main Activity**
- ❌ `MainActivity.kt` - Compilation errors
- Impact: App may not launch

**Bookshelf UI**
- ❌ `BookshelfComponents.kt` - Compilation errors
- ❌ `BookshelfScreen.kt` - Compilation errors
- ❌ `EnhancedBookshelfScreen.kt` - Compilation errors

**Library UI**
- ❌ `LibraryManagementScreen.kt` - Compilation errors
- ❌ `UniversalMediaLibraryScreen.kt` - Compilation errors

**Details UI**
- ❌ `BookDetailsScreen.kt` - Compilation errors

**Player UI**
- ❌ `AdvancedVideoPlayerScreen.kt` - Compilation errors
- ❌ `UniversalVideoPlayerScreen.kt` - Compilation errors
- ❌ `QueueScreen.kt` - Compilation errors
- ❌ `NowPlayingScreen.kt` - Compilation errors

**Reader UI**
- ❌ `AdvancedComicReader.kt` - Compilation errors
- ❌ `EPUBReaderScreen.kt` - Compilation errors
- ❌ `EnhancedEReaderScreen.kt` - Compilation errors
- ❌ `ComicReaderComponents.kt` - Compilation errors
- ❌ `DocumentReaderComponents.kt` - Compilation errors

**Settings UI**
- ❌ `ApiSettingsScreen.kt` - Compilation errors
- ❌ `ReaderSettingsScreen.kt` - Compilation errors
- ❌ `SecurityAndAboutScreens.kt` - Compilation errors (10+ errors)
  - Missing SettingsViewModel
  - Unresolved references to security settings properties
  - Property delegate resolution failures
- ❌ `SettingsScreen.kt` - Compilation errors

**Podcast UI**
- ❌ `PodcastManagerScreen.kt` - Compilation errors
- ❌ `PodcastPlayerScreen.kt` - Compilation errors

**Web Fiction UI**
- ❌ `WebFictionManagerScreen.kt` - Compilation errors (5+ errors)

**Other UI**
- ❌ `MetadataEditorScreen.kt` - Compilation errors
- ❌ `MusicLibraryScreen.kt` - Compilation errors
- ❌ `MediaItemHandler.kt` - Compilation errors

**Test UI**
- ❌ `EPUBTestActivity.kt` - Compilation errors

---

## ⚠️ HIGH PRIORITY - Core Features (Cannot Test Until Build Fixed)

### 1. Library Management
**Status**: Unknown - blocked by compilation failures  
**Components Affected**:
- LibraryListViewModel
- LibraryManagementScreen
- LibraryManagementViewModel
- UniversalMediaLibraryScreen
- UniversalMediaLibraryViewModel

**Suspected Issues**:
- UI may not properly trigger file scanning
- Storage Access Framework integration unclear
- Permission handling untested

**Testing Required**:
- [ ] Create new library
- [ ] Select folder
- [ ] Verify files are scanned
- [ ] Verify library appears in list
- [ ] Verify library can be opened

### 2. Media Playback
**Status**: Unknown - blocked by compilation failures  
**Components Affected**:
- AudioPlaybackManager (CRITICAL - type inference failure)
- All player screens
- All player ViewModels
- MediaItemHandler
- Navigation routing

**Suspected Issues**:
- Audio playback completely broken (type inference)
- Video player integration uncertain
- EPUB reader integration uncertain
- PDF reader integration uncertain
- Navigation may not work

**Testing Required**:
- [ ] Tap book → verify EPUB reader opens
- [ ] Tap PDF → verify PDF reader opens
- [ ] Tap audio → verify audio player opens
- [ ] Tap video → verify video player opens
- [ ] Verify playback controls work
- [ ] Verify back navigation works

### 3. Calibre Import
**Status**: Unknown - blocked by compilation failures  
**Components Affected**:
- CalibreImportService
- Import UI integration
- Database integration

**Suspected Issues**:
- Service has compilation errors
- UI integration may be broken
- End-to-end flow untested

**Testing Required**:
- [ ] Select Calibre metadata.db file
- [ ] Select Calibre library folder
- [ ] Verify import progress shown
- [ ] Verify books appear in library
- [ ] Verify metadata imported correctly
- [ ] Verify cover images imported

### 4. File System Access
**Status**: Unknown - blocked by compilation failures  
**Components Affected**:
- StorageAccessService
- MediaScannerService
- Permission handling

**Suspected Issues**:
- Services have compilation errors
- Permission flow untested
- SAF integration unclear

**Testing Required**:
- [ ] Request storage permissions
- [ ] Select folder with SAF
- [ ] Verify app can read files
- [ ] Verify app can scan media
- [ ] Test on Android 10+ (scoped storage)

---

## 🔧 MEDIUM PRIORITY - Advanced Features (All Broken)

### Web Fiction Management
**Status**: COMPLETELY BROKEN  
**Reason**: 25+ data model errors in WebFictionViewModel  
**Features Broken**:
- Cannot add web fiction sources
- Cannot track story updates
- Cannot download chapters
- Cannot convert to EPUB
- UI completely non-functional

### Podcast Management
**Status**: COMPLETELY BROKEN  
**Reason**: Data model mismatches, ViewModel errors  
**Features Broken**:
- Cannot add podcast feeds
- Cannot download episodes
- Cannot play podcasts
- UI completely non-functional

### Plex Integration
**Status**: COMPLETELY BROKEN  
**Reason**: Service layer compilation errors  
**Features Broken**:
- Cannot connect to Plex server
- Cannot browse Plex libraries
- Cannot sync metadata
- All integration features broken

### AI/ML Analysis
**Status**: COMPLETELY BROKEN  
**Reason**: All analysis services have compilation errors  
**Recommendation**: **REMOVE most AI/ML features, KEEP only Gemini for OCR**

**Features to Remove**:
- ❌ Gemma LLM (complex, resource-intensive, not essential)
- ❌ Smart content analysis (incomplete, complex)
- ❌ Advanced NLP features (heavy, incomplete)

**Feature to Keep & Fix**:
- ✅ **Gemini Service** - Keep as plugin for screenshot-based OCR and text scanning
  - Use for: Taking screenshots of pages, extracting text via OCR
  - Use for: Book identification from cover images
  - Lightweight, API-based, optional feature
  - Already has good architecture in `services/gemini/GeminiService.kt`

### Advanced Readers
**Status**: COMPLETELY BROKEN  
**Reason**: Reader service and UI compilation errors  
**Features Broken**:
- Advanced EPUB features
- Comic reader (CBZ/CBR)
- Advanced PDF features
- Document annotation
- All reader customization

### Content Creation
**Status**: COMPLETELY BROKEN  
**Reason**: All converter services have compilation errors  
**Features Broken**:
- Fanfiction to EPUB conversion
- News to EPUB conversion
- Web content scraping
- Story update tracking
- Auto-download features

### Music Library
**Status**: COMPLETELY BROKEN  
**Reason**: UI and service compilation errors  
**Features Broken**:
- Music library browsing
- Music metadata
- Audio playback (CRITICAL - AudioPlaybackManager broken)
- Playlist management

### Video Library
**Status**: COMPLETELY BROKEN  
**Reason**: Player and service compilation errors  
**Features Broken**:
- Video library browsing
- Video playback
- Video metadata
- Advanced video features

### Settings & Configuration
**Status**: COMPLETELY BROKEN  
**Reason**: Missing SettingsViewModel, multiple screen errors  
**Features Broken**:
- Cannot access settings
- Cannot configure app
- Cannot set up API keys
- Cannot configure security
- Cannot customize reader
- All settings non-functional

### Metadata Editing
**Status**: COMPLETELY BROKEN  
**Reason**: Editor screen and ViewModel errors  
**Features Broken**:
- Cannot edit metadata manually
- Cannot fetch metadata from online sources
- Cannot manage custom tags
- All metadata features broken

---

## 📊 FEATURES SUMMARY BY STATUS

### Working Features: 0
- **None** - Application does not compile

### Partially Working: 0
- **None** - Cannot test until compilation succeeds

### Broken Features: ALL
- **Core**: Library management, media playback, file system, Calibre import
- **Advanced**: Web fiction, podcasts, Plex, AI/ML, readers, content creation
- **UI**: Settings, metadata editing, all specialized screens
- **Services**: Audio, video, metadata, integration, analysis

### Not Implemented: 20+ (Phase 2 features)
- All Phase 2 roadmap features not started
- Cannot begin until Phase 1 compilation fixed

---

## 🎯 FIX PRIORITY ORDER

### Priority 1: Enable Compilation (Must fix first)
1. Fix data model mismatches (WebFiction, Podcast, etc.)
2. Create missing ViewModels (SettingsViewModel)
3. Fix service layer type inference (AudioPlaybackManager)
4. Fix UI property delegate issues

### Priority 2: Core Feature Verification
1. Verify MainActivity launches
2. Test library creation
3. Test media playback
4. Test file system access
5. Test Calibre import

### Priority 3: Fix Critical Bugs
1. Fix audio playback (AudioPlaybackManager critical)
2. Fix navigation issues
3. Fix file scanning
4. Fix permission handling

### Priority 4: Advanced Features
1. Web fiction (if needed)
2. Podcasts (if needed)
3. Content creation (if needed)
4. AI/ML (if needed)
5. Settings (essential for usability)

---

## 📝 RECOMMENDATIONS

### Immediate (This Week)
1. Focus exclusively on fixing compilation errors
2. Do NOT attempt to add new features
3. Start with data model fixes (quickest wins)
4. Then fix ViewModels
5. Then fix service layer

### Short Term (Weeks 2-4)
1. Get application to compile
2. Generate debug APK
3. Test core features
4. Fix critical bugs found
5. Verify core functionality works

### Medium Term (Months 2-3)
1. Complete Phase 1 issues (#08-#12)
2. Fix or remove advanced features
3. Decide which features to keep vs remove
4. Focus on core media library functionality

### Long Term (Months 3-6)
1. Polish core features
2. Add Phase 2 features selectively
3. Prepare for publication
4. User testing and feedback

---

## ⚠️ WARNING

**DO NOT attempt to publish this application in its current state.**

The application:
- ❌ Does not compile
- ❌ Cannot create APK
- ❌ Cannot be tested
- ❌ Has 85 files with errors
- ❌ Has zero working features

**Estimated time to publication-ready**: 3-6 months minimum

---

**Document Created**: January 2025  
**Next Update**: After compilation errors resolved
