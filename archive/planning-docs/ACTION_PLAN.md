# CleverFerret - Immediate Action Plan

## 📋 Executive Summary

**Current State**: Core functionality working, 82 TODOs remaining  
**Estimated Completion**: 12 hours for critical path, 40 hours for full polish  
**Risk Level**: LOW - No blockers, all infrastructure in place

---

## 🎯 Phase 1: Critical Fixes (12 hours) - DO FIRST

### Task 1.1: Re-enable Comic Translation Service (1 hour)
**Status**: ⚠️ Complete implementation exists but disabled  
**Impact**: Major feature completely non-functional

```bash
# Step 1: Re-enable the service
cd CleverFerret/src/main/java/com/universalmedialibrary/services/comic/
mv GeminiComicService.kt.disabled GeminiComicService.kt
mv ComicDataService.kt.disabled ComicDataService.kt

# Step 2: Update UnifiedReaderService.kt - remove TODO comments
# Lines 109, 229: Remove comments, enable the code
```

**Files to modify**:
1. `services/reader/UnifiedReaderService.kt` - Remove `// TODO: Re-enable` comments
2. Test with sample comic book

**Verification**: Load a comic, attempt translation

---

### Task 1.2: Implement Navigation (3 hours)
**Status**: ⚠️ 5+ navigation TODOs blocking user flows  
**Impact**: Users cannot navigate between major screens

#### 1.2.1: Library Navigation
**File**: `ui/library/LibraryManagementScreen.kt` Line 119

```kotlin
// Replace TODO with:
onLibraryClick = { library ->
    navController.navigate("library/${library.id}/media")
}
```

#### 1.2.2: Video Player Navigation  
**File**: `ui/video/VideoLibraryScreen.kt` Line 109

```kotlin
// Replace TODO with:
onClick = { 
    navController.navigate("player/video/${video.itemId}") 
}
```

#### 1.2.3: Chapter Navigation
**File**: `ui/reader/EnhancedEReaderScreen.kt` Line 308

```kotlin
// Replace TODO with:
onClick = { 
    viewModel.navigateToChapter(chapter.index) 
}
```

**Verification**: Test navigation flow from library → media → player

---

### Task 1.3: History Tracking System (6 hours)
**Status**: ⚠️ 13 TODOs - Core feature missing  
**Impact**: No watch/reading history, no progress tracking

#### Step 1: Create Repository (2 hours)
**New File**: `data/repository/HistoryRepository.kt`

```kotlin
@Singleton
class HistoryRepository @Inject constructor(
    private val progressDao: ReadingProgressDao,
    private val watchHistoryDao: WatchHistoryDao
) {
    // Reading progress
    suspend fun updateReadingProgress(
        itemId: Long, 
        currentPage: Int,
        totalPages: Int,
        position: Long
    )
    
    suspend fun getReadingProgress(itemId: Long): ReadingProgress?
    
    suspend fun isBookFinished(itemId: Long): Boolean
    
    // Watch history  
    suspend fun recordWatchProgress(
        itemId: Long,
        position: Long,
        duration: Long
    )
    
    suspend fun getLastWatchedEpisode(seriesId: Long): Episode?
    
    suspend fun isWatched(itemId: Long): Boolean
    
    // Play count
    suspend fun incrementPlayCount(itemId: Long)
    
    suspend fun getPlayCount(itemId: Long): Int
}
```

#### Step 2: Update Playlist Managers (3 hours)

**Files to modify**:
- `services/playlist/TVShowPlaylistManager.kt`
- `services/playlist/AudiobookPlaylistManager.kt`  
- `services/playlist/MoviePlaylistManager.kt`
- `services/playlist/MusicPlaylistManager.kt`

**Pattern to apply**:
```kotlin
// Replace all TODO comments with:
watched = historyRepository.isWatched(episode.itemId),
progress = historyRepository.getProgress(episode.itemId),
bookmarks = historyRepository.getBookmarks(episode.itemId),
isFinished = historyRepository.isFinished(episode.itemId)
```

#### Step 3: Add DI Module (30 min)

**File**: `di/RepositoryModule.kt`

```kotlin
@Module
@InstallIn(SingletonComponent::class)
object HistoryModule {
    @Provides
    @Singleton
    fun provideHistoryRepository(
        progressDao: ReadingProgressDao,
        watchHistoryDao: WatchHistoryDao
    ): HistoryRepository = HistoryRepository(progressDao, watchHistoryDao)
}
```

#### Step 4: Test Integration (30 min)

**Verification**:
1. Play a track → check play count increments
2. Read a book → check progress saved
3. Watch episode → check marked as watched

---

### Task 1.4: Media Duration Extraction (2 hours)
**Status**: ⚠️ Media showing 0:00 duration  
**Impact**: Poor UX, broken progress bars

#### Implementation
**File**: `services/media/MetadataExtractionService.kt`

Add function:
```kotlin
fun extractMediaDuration(filePath: String): Long {
    val retriever = MediaMetadataRetriever()
    return try {
        retriever.setDataSource(filePath)
        retriever.extractMetadata(
            MediaMetadataRetriever.METADATA_KEY_DURATION
        )?.toLongOrNull() ?: 0L
    } catch (e: Exception) {
        ErrorHandler.logError(
            message = "Failed to extract duration",
            error = e,
            context = mapOf("filePath" to filePath)
        )
        0L
    } finally {
        retriever.release()
    }
}
```

**Files to update**:
- `services/music/AdvancedMusicPlayerService.kt` Line 350
- `services/audiobook/AudiobookService.kt` Line 147
- All playlist managers (replace `0L` with actual extraction)

**Verification**: Check media player shows correct duration

---

## 🎯 Phase 2: Enhanced Features (14 hours) - DO NEXT

### Task 2.1: Sleep Timer (3 hours)

**New File**: `services/media/SleepTimerManager.kt`

```kotlin
@Singleton
class SleepTimerManager @Inject constructor() {
    private var timerJob: Job? = null
    private val _timeRemaining = MutableStateFlow(0L)
    val timeRemaining: StateFlow<Long> = _timeRemaining.asStateFlow()
    
    fun startTimer(durationMinutes: Int, onComplete: () -> Unit) {
        timerJob?.cancel()
        timerJob = CoroutineScope(Dispatchers.Default).launch {
            var remaining = durationMinutes * 60L
            while (remaining > 0) {
                _timeRemaining.value = remaining
                delay(1000)
                remaining--
            }
            onComplete()
        }
    }
    
    fun pauseTimer() {
        timerJob?.cancel()
    }
    
    fun cancelTimer() {
        timerJob?.cancel()
        _timeRemaining.value = 0
    }
}
```

**UI Integration**: `ui/audiobook/AudiobookPlayerScreen.kt`

---

### Task 2.2: Backup/Restore Service (4 hours)

**File**: Re-enable `data/preferences/UserLibraryBackupService.kt.disabled`

```bash
mv UserLibraryBackupService.kt.disabled UserLibraryBackupService.kt
```

Add backup functionality:
```kotlin
suspend fun createBackup(): File {
    val backupData = BackupData(
        libraries = libraryDao.getAllLibraries(),
        mediaItems = mediaItemDao.getAllMediaItems(),
        progress = progressDao.getAllProgress(),
        bookmarks = bookmarksDao.getAllBookmarks(),
        settings = settingsRepository.getAllSettings(),
        timestamp = System.currentTimeMillis()
    )
    
    val json = Json.encodeToString(backupData)
    val backupFile = File(context.filesDir, "backup_${timestamp}.json")
    backupFile.writeText(json)
    
    // Optionally compress to ZIP
    return backupFile
}

suspend fun restoreBackup(backupFile: File) {
    val json = backupFile.readText()
    val backupData = Json.decodeFromString<BackupData>(json)
    
    // Validate backup
    ValidationUtils.validateBackup(backupData)
    
    // Clear existing data
    database.clearAllTables()
    
    // Restore data
    libraryDao.insertAll(backupData.libraries)
    mediaItemDao.insertAll(backupData.mediaItems)
    // ... restore all tables
}
```

**UI**: Add to `ui/settings/ReadingPreferencesScreen.kt` Line 454

---

### Task 2.3: Chapter & Bookmarks UI (4 hours)

**New File**: `ui/components/ChapterListDialog.kt`

```kotlin
@Composable
fun ChapterListDialog(
    chapters: List<Chapter>,
    currentChapter: Int,
    onChapterSelect: (Int) -> Unit,
    onDismiss: () -> Unit
) {
    Dialog(onDismissRequest = onDismiss) {
        Card {
            LazyColumn {
                items(chapters) { chapter ->
                    ListItem(
                        headlineContent = { Text(chapter.title) },
                        supportingContent = { Text("Page ${chapter.startPage}") },
                        leadingContent = {
                            if (chapter.index == currentChapter) {
                                Icon(Icons.Default.PlayArrow, "Current")
                            }
                        },
                        modifier = Modifier.clickable { 
                            onChapterSelect(chapter.index)
                            onDismiss()
                        }
                    )
                }
            }
        }
    }
}
```

**Similar for BookmarksDialog**

**Integration**: Update TODOs in:
- `ui/audiobook/AudiobookPlayerScreen.kt` Lines 606, 625
- `ui/reader/PDFReaderViewModel.kt` Lines 161, 165

---

### Task 2.4: Settings Persistence (2 hours)

**New Entities**: 
```kotlin
@Entity(tableName = "security_settings")
data class SecuritySettingsEntity(
    @PrimaryKey val id: Int = 1,
    val requireBiometric: Boolean = false,
    val lockTimeout: Int = 5,
    val allowScreenshots: Boolean = true
)

@Entity(tableName = "general_settings")
data class GeneralSettingsEntity(
    @PrimaryKey val id: Int = 1,
    val language: String = "en",
    val theme: String = "auto",
    val fontSize: Int = 16
)
```

**DAOs**: Create corresponding DAOs  
**Integration**: Update `ui/settings/SettingsViewModel.kt`

---

## 🎯 Phase 3: Infrastructure (6 hours)

### Task 3.1: Install PWA Dependencies (5 minutes)

```bash
cd pwa-demo
npm install
npm run dev  # Test it works
```

---

### Task 3.2: Media3 Migration (6 hours)

**Why**: Modern API, better performance, active maintenance

**File**: `services/media/UniversalMediaPlayerService.kt`

```kotlin
// Replace MediaPlayer with ExoPlayer
private lateinit var player: ExoPlayer

override fun onCreate() {
    super.onCreate()
    player = ExoPlayer.Builder(this)
        .setAudioAttributes(
            AudioAttributes.Builder()
                .setContentType(C.AUDIO_CONTENT_TYPE_MUSIC)
                .setUsage(C.USAGE_MEDIA)
                .build(),
            true
        )
        .build()
        
    player.addListener(object : Player.Listener {
        override fun onPlaybackStateChanged(state: Int) {
            // Handle state changes
        }
    })
}

fun playMedia(uri: Uri) {
    val mediaItem = MediaItem.fromUri(uri)
    player.setMediaItem(mediaItem)
    player.prepare()
    player.play()
}
```

**Migration checklist**:
- [ ] Replace MediaPlayer → ExoPlayer
- [ ] Update MediaSession integration
- [ ] Test audio playback
- [ ] Test video playback
- [ ] Update notification handling

---

## 🎯 Phase 4: Code Quality (16 hours) - OPTIONAL

### Automated Import Cleanup

**Script**: `scripts/fix-imports.sh`

```bash
#!/bin/bash
# Fix wildcard imports automatically

find CleverFerret/src/main -name "*.kt" | while read file; do
    # Extract used icons
    icons=$(grep -o "Icons\.[A-Za-z]*\.[A-Za-z]*" "$file" | sort | uniq)
    
    # Generate import statements
    imports=""
    while IFS= read -r icon; do
        imports+="import androidx.compose.material.icons.${icon}\n"
    done <<< "$icons"
    
    # Replace wildcard import with specific imports
    sed -i "/import.*Icons.*\.\*/c\\$imports" "$file"
done
```

**Run**: `./scripts/fix-imports.sh`

---

### Unit Tests for New Utilities

**File**: `src/test/.../utils/ValidationUtilsTest.kt`

```kotlin
class ValidationUtilsTest {
    @Test
    fun `library name validation`() {
        assertNull(ValidationUtils.validateLibraryName("Valid Name"))
        assertNotNull(ValidationUtils.validateLibraryName(""))
        assertNotNull(ValidationUtils.validateLibraryName("a"))
        assertNotNull(ValidationUtils.validateLibraryName("Invalid@Name"))
    }
    
    @Test
    fun `path validation prevents traversal`() {
        assertNotNull(ValidationUtils.validatePath("../etc/passwd"))
        assertNull(ValidationUtils.validatePath("/valid/path"))
    }
    
    // ... 20+ more tests
}
```

**Similar for ErrorHandlerTest**

---

## 📊 Tracking Progress

### Checklist

**Phase 1: Critical (12h)**
- [ ] Re-enable comic service (1h)
- [ ] Implement navigation (3h)
- [ ] History tracking system (6h)
- [ ] Media duration extraction (2h)

**Phase 2: Enhanced (14h)**
- [ ] Sleep timer (3h)
- [ ] Backup/restore (4h)
- [ ] Chapter/bookmarks UI (4h)
- [ ] Settings persistence (2h)

**Phase 3: Infrastructure (6h)**
- [ ] PWA setup (0.1h)
- [ ] Media3 migration (6h)

**Phase 4: Quality (16h)**
- [ ] Import cleanup (6h)
- [ ] Unit tests (6h)
- [ ] Integration tests (4h)

---

## 🚀 Quick Start

**To get started right now:**

```bash
# 1. Re-enable comic service (5 min)
cd CleverFerret/src/main/java/com/universalmedialibrary/services/comic/
mv GeminiComicService.kt.disabled GeminiComicService.kt
mv ComicDataService.kt.disabled ComicDataService.kt

# 2. Install PWA dependencies (5 min)
cd pwa-demo
npm install

# 3. Start implementing navigation (30 min)
# Open LibraryManagementScreen.kt and fix line 119

# 4. Test your changes
./gradlew assembleDebug
```

---

## 📝 Notes

- All infrastructure is in place (databases, repositories, services)
- No architectural changes needed
- Most work is "filling in the blanks"
- Critical path is just 12 hours
- Everything else is optional enhancements

---

**Status**: Ready to implement  
**Blocker**: None  
**Risk**: Low  
**Estimated Completion**: 2-3 days for critical path
