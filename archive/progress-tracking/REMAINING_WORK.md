# CleverFerret - Remaining Work

## 🎯 Priority Analysis

Based on comprehensive code analysis, here's what still needs to be done:

---

## 🔴 HIGH PRIORITY - User-Facing Features

### 1. Navigation Implementation (5 TODOs)
**Impact**: Users can't navigate between screens  
**Files Affected**:
- `LibraryManagementScreen.kt` - Line 119: Navigate to library contents
- `VideoLibraryScreen.kt` - Line 109: Navigate to video player  
- `EnhancedEReaderScreen.kt` - Line 308: Chapter navigation

**What's Needed**:
```kotlin
// Add navigation callbacks to all screens
onLibraryClick = { library ->
    navController.navigate("library/${library.id}/contents")
}
```

**Effort**: 2-3 hours  
**Priority**: HIGH - Core UX

### 2. Re-enable Comic Translation Service
**Impact**: Comic translation feature non-functional  
**File**: `services/comic/GeminiComicService.kt.disabled` (687 lines, complete implementation)

**What's Needed**:
1. Remove `.disabled` extension
2. Re-enable in `UnifiedReaderService.kt`
3. Add Gemini API key configuration UI
4. Test with sample comic

**Effort**: 1 hour (already implemented, just disabled)  
**Priority**: HIGH - Major feature

### 3. Playlist Integration with History (13 TODOs)
**Impact**: Watch/listen history not tracked  
**Files**: All playlist managers (TV, Movies, Music, Audiobooks)

**Examples**:
- TVShowPlaylistManager.kt: Lines 187, 281, 339, 401
- AudiobookPlaylistManager.kt: Lines 292, 325, 326, 327
- MoviePlaylistManager.kt: Lines 304, 305

**What's Needed**:
```kotlin
// Create watch/reading history tracking
interface HistoryRepository {
    suspend fun recordProgress(itemId: Long, position: Long)
    suspend fun getLastWatched(seriesId: Long): Episode?
    suspend fun isFinished(itemId: Long): Boolean
}
```

**Effort**: 4-6 hours  
**Priority**: HIGH - Core functionality

### 4. Media Duration Extraction (4 TODOs)
**Impact**: Media players show wrong durations  
**Files**: 
- `AdvancedMusicPlayerService.kt` - Line 350
- All playlist managers

**What's Needed**:
```kotlin
// Use MediaMetadataRetriever
val retriever = MediaMetadataRetriever()
retriever.setDataSource(filePath)
val duration = retriever.extractMetadata(
    MediaMetadataRetriever.METADATA_KEY_DURATION
)?.toLongOrNull() ?: 0L
```

**Effort**: 2 hours  
**Priority**: HIGH - Display correctness

---

## 🟡 MEDIUM PRIORITY - Enhanced Features

### 5. Sleep Timer Implementation (3 TODOs)
**Impact**: Missing convenience feature  
**Files**: AudiobookPlayerScreen.kt

**What's Needed**:
```kotlin
class SleepTimerManager {
    fun startTimer(durationMinutes: Int, onComplete: () -> Unit)
    fun pauseTimer()
    fun cancelTimer()
}
```

**Effort**: 2-3 hours  
**Priority**: MEDIUM - Nice to have

### 6. Backup/Restore Service (2 TODOs)
**Impact**: Users can't backup their data  
**File**: `data/preferences/UserLibraryBackupService.kt.disabled` (exists but disabled)

**What's Needed**:
1. Re-enable service
2. Export to JSON/ZIP
3. Import validation
4. Add to settings UI

**Effort**: 3-4 hours  
**Priority**: MEDIUM - Data safety

### 7. Advanced TTS Providers (3 TODOs)
**Impact**: Limited TTS options  
**File**: `services/tts/TtsProviderManager.kt`

**What's Needed**:
```kotlin
// Implement additional providers
- Google Cloud TTS (already has Gemini)
- ElevenLabs TTS
- OpenAI TTS
```

**Effort**: 4-6 hours per provider  
**Priority**: MEDIUM - Feature expansion

### 8. Chapter/Bookmarks UI (6 TODOs)
**Impact**: Poor reading experience  
**Files**: AudiobookPlayerScreen.kt, PDFReaderViewModel.kt

**What's Needed**:
```kotlin
@Composable
fun ChapterListDialog(
    chapters: List<Chapter>,
    currentChapter: Int,
    onChapterSelect: (Int) -> Unit
)

@Composable  
fun BookmarksDialog(
    bookmarks: List<Bookmark>,
    onBookmarkSelect: (Bookmark) -> Unit,
    onBookmarkDelete: (Bookmark) -> Unit
)
```

**Effort**: 3-4 hours  
**Priority**: MEDIUM - UX improvement

### 9. Settings Persistence (2 TODOs)
**Impact**: Settings don't persist  
**File**: SettingsViewModel.kt

**What's Needed**:
```kotlin
// Add Room entities for settings
@Entity(tableName = "security_settings")
data class SecuritySettingsEntity(...)

@Entity(tableName = "general_settings")  
data class GeneralSettingsEntity(...)
```

**Effort**: 2 hours  
**Priority**: MEDIUM - Data persistence

---

## 🟢 LOW PRIORITY - Code Quality

### 10. Wildcard Import Cleanup (192 files remaining)
**Impact**: Code maintainability  
**Effort**: 8-10 hours (automated script possible)  
**Priority**: LOW - Aesthetic

### 11. Complete Test Coverage (19 tests exist)
**Impact**: Code reliability  
**What's Needed**:
- Unit tests for new utilities (ValidationUtils, ErrorHandler)
- Integration tests for services
- UI tests for critical flows

**Effort**: 20+ hours  
**Priority**: LOW - Quality assurance

### 12. Re-enable or Remove Disabled Files (6 files)
**Files**:
- RadioPlayerWidget.kt.disabled
- ComicReaderViewModel.kt.disabled
- MetadataExtractor.kt.disabled
- GeminiComicService.kt.disabled ← Re-enable this!
- ComicDataService.kt.disabled
- UserLibraryBackupService.kt.disabled ← Re-enable this!

**Decision needed**: Keep or remove each file  
**Effort**: 1-2 hours  
**Priority**: LOW - Cleanup

---

## 🔵 INFRASTRUCTURE - Backend/Services

### 13. PWA Dependencies Installation
**Impact**: PWA won't run  
**Command**: 
```bash
cd pwa-demo
npm install
```

**Missing packages**: All (node_modules not installed)  
**Effort**: 5 minutes  
**Priority**: HIGH if using PWA

### 14. Calibre Database Reader
**Status**: Exists but may be incomplete  
**File**: CalibreImportService.kt references `CalibreDatabaseReader`

**Verify**:
```bash
# Check if CalibreDatabaseReader is implemented
find . -name "*CalibreDatabaseReader*"
```

**Effort**: Unknown (needs investigation)  
**Priority**: MEDIUM - Calibre import

### 15. Media3 Integration
**Impact**: Modern media playback  
**File**: UniversalMediaPlayerService.kt - "Add ExoPlayer support"

**What's Needed**:
```kotlin
// Replace legacy MediaPlayer with Media3 ExoPlayer
val player = ExoPlayer.Builder(context)
    .build()
    .apply {
        setMediaItem(MediaItem.fromUri(uri))
        prepare()
        play()
    }
```

**Effort**: 4-6 hours  
**Priority**: MEDIUM - Modern APIs

---

## 📊 Summary by Category

### User-Facing (Must Fix)
| Task | Files | LOC | Hours | Priority |
|------|-------|-----|-------|----------|
| Navigation | 5 | ~50 | 3 | HIGH |
| Comic Service | 1 | 0 | 1 | HIGH |
| History Tracking | 6 | ~200 | 6 | HIGH |
| Duration Extraction | 4 | ~50 | 2 | HIGH |
| **SUBTOTAL** | **16** | **~300** | **12** | |

### Enhanced Features (Should Fix)
| Task | Files | LOC | Hours | Priority |
|------|-------|-----|-------|----------|
| Sleep Timer | 1 | ~80 | 3 | MEDIUM |
| Backup/Restore | 1 | 0 | 4 | MEDIUM |
| TTS Providers | 1 | ~300 | 15 | MEDIUM |
| Chapter/Bookmarks | 3 | ~150 | 4 | MEDIUM |
| Settings Persist | 1 | ~80 | 2 | MEDIUM |
| **SUBTOTAL** | **7** | **~610** | **28** | |

### Code Quality (Nice to Fix)
| Task | Files | LOC | Hours | Priority |
|------|-------|-----|-------|----------|
| Import Cleanup | 192 | 0 | 10 | LOW |
| Test Coverage | 50+ | ~1000 | 20 | LOW |
| File Cleanup | 6 | 0 | 2 | LOW |
| **SUBTOTAL** | **248+** | **~1000** | **32** | |

### Infrastructure
| Task | Files | LOC | Hours | Priority |
|------|-------|-----|-------|----------|
| PWA Install | 0 | 0 | 0.1 | HIGH* |
| Calibre Reader | 1 | ? | ? | MEDIUM |
| Media3 Integration | 1 | ~200 | 6 | MEDIUM |
| **SUBTOTAL** | **2** | **~200** | **6+** | |

**Total Remaining**: 273+ files, ~2110 lines, ~78 hours

---

## 🎯 Recommended Next Steps

### Sprint 1: Core Functionality (12 hours)
1. ✅ Implement navigation callbacks (3h)
2. ✅ Re-enable GeminiComicService (1h)
3. ✅ Add history tracking system (6h)
4. ✅ Extract media durations (2h)

### Sprint 2: Enhanced UX (14 hours)
1. ✅ Implement sleep timer (3h)
2. ✅ Re-enable backup service (4h)
3. ✅ Add chapter/bookmarks UI (4h)
4. ✅ Settings persistence (2h)

### Sprint 3: Code Quality (16 hours)
1. ✅ Write unit tests for utilities (4h)
2. ✅ Integration tests for services (6h)
3. ✅ Wildcard import cleanup (6h)

### Sprint 4: Polish (8 hours)
1. ✅ UI/UX refinements
2. ✅ Performance optimization
3. ✅ Documentation updates

---

## 🚀 Quick Wins (Can Do Now)

These take < 1 hour each:

1. **Re-enable GeminiComicService** (5 min)
   ```bash
   mv services/comic/GeminiComicService.kt.disabled \
      services/comic/GeminiComicService.kt
   ```

2. **Install PWA dependencies** (5 min)
   ```bash
   cd pwa-demo && npm install
   ```

3. **Add navigation to LibraryScreen** (30 min)
   ```kotlin
   onLibraryClick = { library ->
       navController.navigate("library/${library.id}")
   }
   ```

4. **Fix video player navigation** (15 min)
   ```kotlin
   onClick = { 
       navController.navigate("player/video/${video.id}") 
   }
   ```

---

## 💡 Feature Additions (Not in Current Code)

These would be new features:

1. **Cloud Sync** - Sync across devices
2. **Social Features** - Reading lists, recommendations
3. **Advanced Search** - Full-text search with filters
4. **Statistics Dashboard** - Reading/listening stats
5. **Themes Store** - Download custom themes
6. **Plugin System** - Community extensions
7. **Offline Download Manager** - Queue downloads
8. **Parental Controls** - Content filtering

---

## 📝 Documentation Needs

1. **API Documentation** - Document all public APIs
2. **Architecture Decision Records** - Why certain choices were made
3. **Deployment Guide** - Step-by-step deployment
4. **Troubleshooting Guide** - Common issues
5. **Contributing Guide** - How to contribute (exists but needs update)
6. **User Manual** - End-user documentation

---

## ✅ Completion Criteria

### Definition of Done:
- [ ] All HIGH priority TODOs implemented
- [ ] Navigation works end-to-end
- [ ] History tracking functional
- [ ] Media durations accurate
- [ ] Comic translation working
- [ ] All services enabled
- [ ] Tests pass
- [ ] No critical bugs
- [ ] Documentation updated

### Ready for Production:
- [ ] All MEDIUM priority items completed
- [ ] Test coverage > 70%
- [ ] Performance benchmarked
- [ ] Security audit passed
- [ ] Accessibility tested
- [ ] Documentation complete

---

**Generated**: 2025-10-20  
**Status**: 82 TODOs remaining (64 completed)  
**Estimated Total Effort**: 78+ hours  
**Critical Path**: 12 hours (Sprint 1)
