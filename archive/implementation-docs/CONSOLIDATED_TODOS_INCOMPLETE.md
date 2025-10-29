# Consolidated TODOs - All Incomplete Items

**Date**: 2025-10-27  
**Source**: Audit of 363 .md files + codebase analysis  
**Status**: 📋 **COMPREHENSIVE TODO LIST**

---

## Overview

This document consolidates ALL incomplete TODO items from:
- Documentation files (58 files with unchecked items)
- Codebase TODOs (87 items from all_todos.txt)
- Feature implementation plans
- Testing checklists

---

## ✅ COMPILATION STATUS - VERIFIED (2025-10-27)

### Compilation Verification Results
**Source**: Linter verification (ReadLints tool)  
**Date**: 2025-10-27

**Status**: ✅ **LINTER SHOWS 0 ERRORS**

#### Verification Summary
- [x] SettingsViewModel - **EXISTS and is complete** (was claimed missing)
- [x] AudioPlaybackManager - **No errors found** (was claimed to have type inference failure)
- [x] Data Models - **Linter shows 0 errors** (was claimed 25 files with errors)
- [x] Services - **Linter shows 0 errors** (was claimed 25 files with errors)
- [x] UI Components - **Linter shows 0 errors** (was claimed 20 files with errors)
- [x] Full codebase scan - **0 linter errors total**

**FINDING**: The documentation claims of "85 compilation errors" are **NOT VERIFIED** by linter.

**LIMITATION**: Cannot perform actual Gradle build (no Android SDK in remote environment)

**SEE**: `COMPILATION_STATUS_VERIFICATION.md` for full details

#### What This Means:
- ✅ Syntax is correct
- ✅ Imports are valid
- ✅ Basic type checking passes
- ⚠️ **Cannot verify with actual build** (requires Android SDK)
- ⚠️ Some issues may only appear during compilation
- ⚠️ Runtime behavior unknown without testing

**Recommendation**: Attempt local build with Android SDK to get definitive status

**Previous "Critical" Issues - All Not Found**:
- [x] ~~Create SettingsViewModel~~ - **Already exists, complete**
- [x] ~~Fix AudioPlaybackManager type inference~~ - **No errors found**
- [x] ~~Fix 25 data model files~~ - **No linter errors**
- [x] ~~Fix 25 service files~~ - **No linter errors**
- [x] ~~Fix 20 UI files~~ - **No linter errors**

**Status Changed**: From "85 CRITICAL errors" to "0 linter errors, build verification pending"

---

## 📋 CODE TODO STATUS - VERIFIED (2025-10-27)

**Total TODOs in Codebase**: 106 items across 38 files  
**Source**: `all_todos.txt` + grep verification  
**Status**: ✅ Analyzed and categorized

### TODO Distribution:
| Category | Count | % | Status |
|----------|-------|---|--------|
| ✅ Already Implemented | ~25 | 24% | Remove TODO comments |
| 🔧 Simple Fixes | ~15 | 14% | Can do now (2-3 hours) |
| 📊 Database Integration | ~20 | 19% | Need repository hookup |
| 🎯 History System | ~13 | 12% | Need HistoryRepository |
| 🎨 UI Components | ~12 | 11% | Need component creation |
| 🏗️ Architecture | ~10 | 9% | Need design decisions |
| 🌐 Future Features | ~15 | 14% | Enhancement work |

### Key Findings:
1. **~25 TODOs Already Done** - Navigation, function signatures complete
2. **15 Quick Wins** - Error handling, simple additions (2-3 hours)
3. **60+ Complex** - Need repositories, components, architecture work

**See**: `TODO_RESOLUTION_REPORT.md` for complete analysis and implementation guides

**See**: `⭐_TODO_RESOLUTION_COMPLETE.md` for executive summary

---

## 🔴 HIGH PRIORITY - User-Facing Features

### 1. Navigation Implementation
**Source**: REMAINING_WORK.md, ACTION_PLAN.md  
**Impact**: Users cannot navigate between screens

- [ ] LibraryManagementScreen.kt Line 119: Navigate to library contents
- [ ] VideoLibraryScreen.kt Line 109: Navigate to video player
- [ ] EnhancedEReaderScreen.kt Line 308: Chapter navigation
- [ ] Add navigation callbacks to all detail screens
- [ ] Test navigation flow end-to-end

**Effort**: 2-3 hours  
**Status**: ⚠️ **HIGH** - Core UX broken

### 2. Re-enable Comic Translation Service
**Source**: REMAINING_WORK.md, ACTION_PLAN.md  
**Impact**: Major feature completely disabled

- [ ] Remove `.disabled` from GeminiComicService.kt (5 min)
- [ ] Remove `.disabled` from ComicDataService.kt (5 min)
- [ ] Re-enable in UnifiedReaderService.kt (15 min)
- [ ] Add Gemini API key configuration UI (30 min)
- [ ] Test with sample comic book (15 min)

**Effort**: 1 hour  
**Status**: ⚠️ **HIGH** - Feature exists but disabled

### 3. History Tracking System (13 TODOs)
**Source**: REMAINING_WORK.md, all_todos.txt  
**Impact**: No watch/reading progress tracking

#### Create HistoryRepository
- [ ] Create HistoryRepository interface
- [ ] Implement reading progress tracking
- [ ] Implement watch history tracking
- [ ] Implement play count tracking
- [ ] Add to dependency injection

#### Update Playlist Managers
**TVShowPlaylistManager.kt:**
- [ ] Line 187: Integrate watch history
- [ ] Line 281: Filter by watched status
- [ ] Line 339: Get last watched episode
- [ ] Line 401: Track episode progress

**AudiobookPlaylistManager.kt:**
- [ ] Line 292: Filter by completion
- [ ] Line 325: Track progress
- [ ] Line 326: Check if finished
- [ ] Line 327: Load bookmarks

**MoviePlaylistManager.kt:**
- [ ] Line 304: Track watched status
- [ ] Line 305: Track ratings

**MusicPlaylistManager.kt:**
- [ ] Line 336: Filter by genre
- [ ] Line 338: Track play count

**Effort**: 4-6 hours  
**Status**: ⚠️ **HIGH** - Core functionality missing

### 4. Media Duration Extraction (4 TODOs)
**Source**: REMAINING_WORK.md, all_todos.txt  
**Impact**: Players show incorrect durations

- [ ] AdvancedMusicPlayerService.kt Line 350: Extract actual duration
- [ ] AudiobookService.kt Line 147: Extract audiobook duration
- [ ] All playlist managers: Calculate total durations
- [ ] Add MediaMetadataRetriever helper service

**Effort**: 2 hours  
**Status**: ⚠️ **HIGH** - Display correctness

---

## 🟡 MEDIUM PRIORITY - Enhanced Features

### 5. Sleep Timer Implementation (3 TODOs)
**Source**: REMAINING_WORK.md, all_todos.txt  
**Files**: AudiobookPlayerScreen.kt Lines 606, 625, 636

- [ ] Create SleepTimerManager service
- [ ] Implement startTimer() with duration
- [ ] Implement pauseTimer()
- [ ] Implement cancelTimer()
- [ ] Add sleep timer dialog UI
- [ ] Test with audiobook playback

**Effort**: 2-3 hours  
**Status**: 🟡 **MEDIUM** - Nice to have

### 6. Backup/Restore Service (2 TODOs)
**Source**: REMAINING_WORK.md, all_todos.txt  
**Files**: ReadingPreferencesScreen.kt Lines 454, 476

- [ ] Re-enable UserLibraryBackupService.kt
- [ ] Implement createBackup() with JSON export
- [ ] Implement restoreBackup() with validation
- [ ] Add backup UI to settings
- [ ] Add file picker for restore
- [ ] Test backup/restore cycle

**Effort**: 3-4 hours  
**Status**: 🟡 **MEDIUM** - Data safety

### 7. Chapter & Bookmarks UI (6 TODOs)
**Source**: REMAINING_WORK.md, all_todos.txt  
**Files**: AudiobookPlayerScreen.kt, PDFReaderViewModel.kt

- [ ] Create ChapterListDialog component
- [ ] Create BookmarksDialog component
- [ ] AudiobookPlayerScreen Line 606: Implement chapter list
- [ ] AudiobookPlayerScreen Line 625: Implement bookmarks list
- [ ] PDFReaderViewModel Line 161: Implement page selector
- [ ] PDFReaderViewModel Line 165: Implement bookmarks dialog

**Effort**: 3-4 hours  
**Status**: 🟡 **MEDIUM** - UX improvement

### 8. Settings Persistence (2 TODOs)
**Source**: REMAINING_WORK.md, all_todos.txt  
**Files**: SettingsViewModel.kt

- [ ] Create SecuritySettingsEntity
- [ ] Create GeneralSettingsEntity
- [ ] Create corresponding DAOs
- [ ] Update SettingsViewModel to use entities
- [ ] Test settings persistence across app restarts

**Effort**: 2 hours  
**Status**: 🟡 **MEDIUM** - Data persistence

### 9. Metadata Enhancement (20+ TODOs)
**Source**: all_todos.txt

**EpubReaderEngine.kt:**
- [ ] Line 82: Implement streaming for remote EPUB files
- [ ] Line 108: Extract cover image from EPUB

**AudiobookService.kt:**
- [ ] Line 122: Load audiobook cover art
- [ ] Line 138: Extract author from metadata

**MediaSessionManager.kt:**
- [ ] Line 120: Set duration for MediaMetadata

**BookshelfViewModel.kt:**
- [ ] Line 142: Fetch author name from People table
- [ ] Line 143: Fetch series name from Series table

**And 14 more similar items...**

**Effort**: 6-8 hours  
**Status**: 🟡 **MEDIUM** - Enhanced metadata

---

## 🟢 LOW PRIORITY - Code Quality & Testing

### 10. Testing Checklist (COMPREHENSIVE_FIXES_AND_ENHANCEMENTS_COMPLETE.md)

#### Album Art Display
- [ ] Play music with album art metadata
- [ ] Verify art displays in Now Playing screen
- [ ] Test with different media types
- [ ] Check null handling for missing art

#### Media Duration
- [ ] Play various audio/video formats
- [ ] Verify progress bar accuracy
- [ ] Test time remaining calculations
- [ ] Verify no divide-by-zero errors

#### Complete Backups
- [ ] Create backup with all data types
- [ ] Verify all tables exported
- [ ] Restore on fresh install
- [ ] Verify data integrity

#### Widget Responsiveness
- [ ] Add radio widget to home screen
- [ ] Rapidly click widget buttons
- [ ] Verify no ANR dialogs
- [ ] Test favorite toggle

#### Enhanced Search
- [ ] Search with various queries
- [ ] Apply multiple filters
- [ ] Verify facet counts
- [ ] Test search suggestions
- [ ] Check result relevance

#### Intelligent Sync
- [ ] Create conflicts on two devices
- [ ] Sync and verify resolution
- [ ] Test each resolution strategy
- [ ] Verify no data loss

#### Smart Recommendations
- [ ] Request recommendations
- [ ] Verify relevance to history
- [ ] Test AI recommendations (with API key)
- [ ] Check confidence scores
- [ ] Verify deduplication

**Effort**: 8-12 hours  
**Status**: 🟢 **LOW** - Quality assurance

### 11. Wildcard Import Cleanup (192 files)
**Source**: REMAINING_WORK.md

- [ ] Create automated cleanup script
- [ ] Run on all 192 files with wildcard imports
- [ ] Verify no compilation errors after cleanup
- [ ] Commit changes

**Effort**: 8-10 hours  
**Status**: 🟢 **LOW** - Code maintainability

### 12. Complete Test Coverage
**Source**: REMAINING_WORK.md

- [ ] Write unit tests for ValidationUtils
- [ ] Write unit tests for ErrorHandler
- [ ] Write integration tests for services
- [ ] Write UI tests for critical flows
- [ ] Target: 70%+ code coverage

**Effort**: 20+ hours  
**Status**: 🟢 **LOW** - Quality assurance

---

## 🔵 INFRASTRUCTURE - Backend/Services

### 13. PWA Dependencies (CRITICAL if using PWA)
**Source**: REMAINING_WORK.md

- [ ] cd pwa-demo
- [ ] npm install
- [ ] npm run dev (verify)

**Effort**: 5 minutes  
**Status**: 🔵 **INFRASTRUCTURE**

### 14. Media3 Integration
**Source**: REMAINING_WORK.md, all_todos.txt  
**Files**: UniversalMediaPlayerService.kt

- [ ] Replace MediaPlayer with ExoPlayer
- [ ] Update MediaSession integration
- [ ] Test audio playback
- [ ] Test video playback
- [ ] Update notification handling

**Effort**: 4-6 hours  
**Status**: 🔵 **INFRASTRUCTURE** - Modern APIs

### 15. Additional TODOs from Codebase
**Source**: all_todos.txt (87 total items)

**CleverFerretApplication.kt:**
- [ ] Line 47: Show user dialog for restore from backup

**MainActivity.kt:**
- [ ] Line 285: Pass preset back to visualizer

**UnifiedMediaModel.kt (Future):**
- [ ] Add support for tags and collections
- [ ] Add computed properties for artwork variants
- [ ] Add support for external media sources (Plex, Jellyfin)
- [ ] Add support for grouped media (albums, series)
- [ ] Add support for media relationships

**PDFSearchEngine.kt:**
- [ ] Line 82: Integrate text extraction library
- [ ] Line 116: Implement OCR-based search using ML Kit

**ComicReaderEngine.kt:**
- [ ] Line 96: Implement streaming for remote comic archives

**PdfReaderEngine.kt:**
- [ ] Line 86: Implement streaming for remote PDF files
- [ ] Line 104: Implement text search using PdfBox or OCR

**And 70+ more items across the codebase...**

**Effort**: 40+ hours  
**Status**: 🔵 **INFRASTRUCTURE** - Various improvements

---

## 📚 FEATURES TO IMPLEMENT (From FEATURES_TO_IMPLEMENT.md)

### Phase 1: MVP (After compilation fix)

#### Library Management
- [ ] Delete libraries
- [ ] Edit library properties
- [ ] Library statistics/overview

#### Media Browsing
- [ ] Sort options (title, date, author)
- [ ] Filter options
- [ ] Search within library

#### Media Playback
- [ ] Fix AudioPlaybackManager (CRITICAL)
- [ ] Reading progress tracking
- [ ] Bookmark support
- [ ] Queue management
- [ ] Background playback
- [ ] Media controls integration

#### Settings
- [ ] Fix SettingsViewModel (CRITICAL)
- [ ] Theme selection
- [ ] Default library selection
- [ ] Storage preferences

### Phase 2: Enhanced Features (Future)

- [ ] Visual customization (fonts, colors, themes)
- [ ] Navigation & paging options
- [ ] Accessibility features
- [ ] Annotation & note-taking
- [ ] Dictionary integration
- [ ] Translation features
- [ ] Advanced library features
- [ ] Home screen widgets
- [ ] Sharing features
- [ ] EPUB3 support
- [ ] PDF enhancements
- [ ] Cloud sync
- [ ] Security features

### Phase 3: Advanced Features (Long-term)

- [ ] Web fiction to EPUB (fix or remove)
- [ ] Podcast support (fix or remove)
- [ ] Plex integration (fix or remove)
- [ ] Gemini OCR plugin (keep)
- [ ] Music library (fix or remove)
- [ ] Video library (fix or remove)
- [ ] Comics/manga reader (fix or remove)

---

## 📊 Summary Statistics

### By Priority
- **CRITICAL (Compilation)**: 85 errors across 85 files
- **HIGH Priority**: ~25 items (12 hours effort)
- **MEDIUM Priority**: ~40 items (28 hours effort)
- **LOW Priority**: ~40 items (40+ hours effort)
- **INFRASTRUCTURE**: ~15 items (20+ hours effort)
- **TOTAL**: ~205 actionable items

### By Category
- **Build/Compilation**: 85 items
- **User-Facing**: 25 items
- **Enhanced Features**: 40 items
- **Testing**: 30 items
- **Code Quality**: 10 items
- **Infrastructure**: 15 items

### Effort Estimates
- **Critical Path**: 2-4 weeks (fix compilation)
- **MVP Features**: 12 hours (after build works)
- **Enhanced Features**: 28 hours
- **Code Quality**: 40+ hours
- **TOTAL**: 80-120 hours minimum

---

## 🎯 Recommended Execution Order

### Sprint 1: Make It Build (2-4 weeks)
1. Fix all 85 compilation errors
2. Verify app builds and launches
3. Test basic functionality

### Sprint 2: Critical Features (2-3 days)
1. Implement navigation (3h)
2. Re-enable comic service (1h)
3. Add history tracking (6h)
4. Extract media durations (2h)

### Sprint 3: Enhanced UX (2 days)
1. Sleep timer (3h)
2. Backup/restore (4h)
3. Chapter/bookmarks UI (4h)
4. Settings persistence (2h)

### Sprint 4: Quality & Testing (2-3 days)
1. Run all test checklists (12h)
2. Fix bugs found during testing (8h)
3. Performance optimization (4h)

### Sprint 5: Polish (1 week)
1. Import cleanup (10h)
2. Write unit tests (20h)
3. Update documentation (8h)

---

## ✅ Completion Criteria

### Definition of Done (MVP):
- [ ] App compiles with 0 errors
- [ ] App launches on device
- [ ] All HIGH priority TODOs complete
- [ ] All MEDIUM priority TODOs complete
- [ ] Basic test checklist passes
- [ ] No critical bugs

### Ready for Production:
- [ ] All LOW priority items complete
- [ ] Test coverage > 70%
- [ ] Performance benchmarked
- [ ] Security audit passed
- [ ] Documentation accurate and complete

---

## 📝 Notes

1. **Do not start ANY feature work** until compilation errors are fixed
2. **Test each feature** as it's completed
3. **Update this document** as items are completed
4. **Create new issues** for items needing detailed planning
5. **Remove completed items** from this list regularly

---

## 🔗 Related Documents

- **Build Status**: ASSESSMENT_AT_A_GLANCE.md
- **Publication Readiness**: APP_PUBLICATION_READINESS.md
- **Broken Features**: BROKEN_FEATURES_LIST.md
- **Feature Plans**: FEATURES_TO_IMPLEMENT.md
- **Action Plan**: ACTION_PLAN.md
- **Remaining Work**: REMAINING_WORK.md
- **Audit Report**: DOCUMENTATION_AUDIT_REPORT.md

---

**Last Updated**: 2025-10-27  
**Status**: 📋 Comprehensive list of ALL incomplete items  
**Next**: Fix 85 compilation errors before tackling any of these TODOs
