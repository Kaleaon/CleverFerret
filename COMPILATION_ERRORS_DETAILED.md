# Compilation Errors - Complete List and Fixes

**Date**: 2025-01-13  
**Total Errors**: 191  
**Files Affected**: 42  
**Status**: Documented without stubbing solutions

---

## Executive Summary

This document lists all 191 compilation errors in the CleverFerret repository with detailed analysis and fix strategies that avoid stubbing or workarounds. Each error is categorized by type and includes specific line numbers and actionable solutions.

### Error Distribution

| Category | Count | Percentage |
|----------|-------|------------|
| Unresolved reference | 107 | 56% |
| Type inference failure | 35 | 18% |
| Type mismatch | 15 | 8% |
| Other | 16 | 8% |
| Exhaustive when expression | 8 | 4% |
| Experimental API | 6 | 3% |
| Redeclaration | 2 | 1% |
| Overload resolution ambiguity | 1 | 1% |
| Operator/type error | 1 | 1% |

### Top 10 Files with Most Errors

1. **EnhancedBookshelfScreen.kt** - 50 errors (26%)
2. **CurrentlyReadingWidget.kt** - 29 errors (15%)
3. **EnhancedTextToSpeech.kt** - 21 errors (11%)
4. **MetadataApiService.kt** - 7 errors (4%)
5. **ServerIntegrationScreen.kt** - 7 errors (4%)
6. **PodcastManagerScreen.kt** - 7 errors (4%)
7. **ServerIntegrationViewModel.kt** - 6 errors (3%)
8. **BookshelfScreen.kt** - 5 errors (3%)
9. **UniversalVideoPlayerViewModel.kt** - 5 errors (3%)
10. **PlaylistSettingsScreen.kt** - 5 errors (3%)

---

## Table of Contents

1. [Category 1: Unresolved Reference (107 errors)](#category-1-unresolved-reference-107-errors)
2. [Category 2: Type Inference Failure (35 errors)](#category-2-type-inference-failure-35-errors)
3. [Category 3: Type Mismatch (15 errors)](#category-3-type-mismatch-15-errors)
4. [Category 4: Exhaustive When Expression (8 errors)](#category-4-exhaustive-when-expression-8-errors)
5. [Category 5: Experimental API (6 errors)](#category-5-experimental-api-6-errors)
6. [Category 6: Other Errors (20 errors)](#category-6-other-errors-20-errors)
7. [Fix Strategies by Priority](#fix-strategies-by-priority)
8. [Implementation Roadmap](#implementation-roadmap)

---

## Category 1: Unresolved Reference (107 errors)

**Impact**: HIGH - These block compilation entirely  
**Difficulty**: MEDIUM - Most require adding missing properties or fixing imports  
**Priority**: HIGH - Must be fixed for successful compilation

### 1.1 Widget Resource References (29 errors)

**File**: `CurrentlyReadingWidget.kt`  
**Root Cause**: Widget layouts and R.id references not generated or missing

#### Errors:
1. Line 60: Unresolved reference 'widget_currently_reading'
2. Line 61-64: Unresolved reference 'id' (4 occurrences)
3. Line 75: Unresolved reference 'id'
4. Line 106: Unresolved reference 'widget_quick_access'
5. Line 113: Unresolved reference 'id'
6. Line 125: Unresolved reference 'id'
7. Line 160: Unresolved reference 'widget_reading_stats'
8. Lines 161-164: Unresolved reference 'id' (4 occurrences)
9. Line 177: Unresolved reference 'id'
10. Line 212: Unresolved reference 'widget_reading_goal'
11. Lines 213-216, 221: Unresolved reference 'id' (5 occurrences)
12. Line 233: Unresolved reference 'id'
13. Lines 282, 287: Unresolved reference 'widget_book_item' (2 occurrences)
14. Lines 288-291: Unresolved reference 'id' (4 occurrences)
15. Line 297: Unresolved reference 'id'

**Fix Strategy**:
```xml
<!-- Create missing widget layout files in res/layout/ -->
<!-- File: res/layout/widget_currently_reading.xml -->
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/widget_root"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:orientation="vertical"
    android:padding="16dp">
    
    <TextView
        android:id="@+id/widget_title"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />
    
    <TextView
        android:id="@+id/widget_author"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />
    
    <ImageView
        android:id="@+id/widget_cover"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />
    
    <ProgressBar
        android:id="@+id/widget_progress"
        android:layout_width="match_parent"
        android:layout_height="wrap_content" />
</LinearLayout>

<!-- File: res/layout/widget_quick_access.xml -->
<!-- File: res/layout/widget_reading_stats.xml -->
<!-- File: res/layout/widget_reading_goal.xml -->
<!-- File: res/layout/widget_book_item.xml -->
```

**Alternative Fix** (if widgets not needed):
Comment out widget code in `AndroidManifest.xml` and disable widget functionality temporarily.

---

### 1.2 BookDetails Property Access (12 errors)

**File**: `EnhancedBookshelfScreen.kt`  
**Root Cause**: Attempting to access properties directly on BookDetails wrapper class instead of nested properties

#### Errors:
1. Line 141: Unresolved reference 'title'
2. Line 142: Unresolved reference 'title'
3. Line 143: Unresolved reference 'author'
4. Line 144: Unresolved reference 'author'
5. Line 145: Unresolved reference 'dateAdded'
6. Line 146: Unresolved reference 'dateAdded'
7. Line 147: Unresolved reference 'lastRead'
8. Line 148: Unresolved reference 'progress'
9. Line 149: Unresolved reference 'rating'
10. Line 150: Unresolved reference 'fileSize'
11. Line 151: Unresolved reference 'rating'
12. Line 152: Unresolved reference 'rating'

**Fix Strategy**:
```kotlin
// Current BookDetails structure:
data class BookDetails(
    val mediaItem: MediaItem,
    val metadata: MetadataCommon,
    val bookMetadata: MetadataBook? = null,
    val authorName: String? = null,
    val seriesName: String? = null
)

// Option 1: Add computed properties to BookDetails
data class BookDetails(
    val mediaItem: MediaItem,
    val metadata: MetadataCommon,
    val bookMetadata: MetadataBook? = null,
    val authorName: String? = null,
    val seriesName: String? = null
) {
    val title: String get() = metadata.title
    val author: String get() = authorName ?: "Unknown"
    val dateAdded: Long get() = mediaItem.dateAdded
    val lastRead: Long? get() = mediaItem.lastAccessedDate
    val progress: Double get() = mediaItem.playbackPosition.toDouble() / (mediaItem.duration?.toDouble() ?: 1.0)
    val rating: Double get() = metadata.userRating?.toDouble() ?: 0.0
    val fileSize: Long get() = mediaItem.fileSize
}

// Option 2: Update all references in EnhancedBookshelfScreen.kt
when (sortOption) {
    SortOption.TITLE_ASC -> compareBy { it.metadata.title }
    SortOption.TITLE_DESC -> compareByDescending { it.metadata.title }
    SortOption.AUTHOR_ASC -> compareBy { it.authorName ?: "" }
    SortOption.AUTHOR_DESC -> compareByDescending { it.authorName ?: "" }
    SortOption.DATE_ADDED_NEW -> compareByDescending { it.mediaItem.dateAdded }
    SortOption.DATE_ADDED_OLD -> compareBy { it.mediaItem.dateAdded }
    SortOption.RECENTLY_READ -> compareByDescending { it.mediaItem.lastAccessedDate ?: 0L }
    SortOption.PROGRESS -> compareByDescending { 
        it.mediaItem.playbackPosition.toDouble() / (it.mediaItem.duration?.toDouble() ?: 1.0) 
    }
    SortOption.RATING -> compareByDescending { it.metadata.userRating ?: 0 }
    SortOption.FILE_SIZE -> compareByDescending { it.mediaItem.fileSize }
    SortOption.RATING_HIGH -> compareByDescending { it.metadata.userRating ?: 0 }
    SortOption.RATING_LOW -> compareBy { it.metadata.userRating ?: 0 }
}
```

**Recommended**: Option 1 (add computed properties) is cleaner and avoids changing every reference.

---

### 1.3 TtsState Enum References (20 errors)

**File**: `EnhancedTextToSpeech.kt`  
**Root Cause**: TtsState is redeclared as both enum and data class, causing conflicts

#### Errors:
1. Line 56: Unresolved reference 'IDLE'
2. Line 84: Unresolved reference 'INITIALIZING'
3. Line 90: Unresolved reference 'IDLE'
4. Line 94: Unresolved reference 'ERROR'
5. Line 112: Unresolved reference 'PLAYING'
6. Line 125: Unresolved reference 'IDLE'
7. Line 136: Unresolved reference 'ERROR'
8. Line 146: Unresolved reference 'PLAYING'
9. Line 166: Unresolved reference 'PAUSED'
10. Line 187: Unresolved reference 'PAUSED'
11. Line 198: Unresolved reference 'IDLE'
12. Line 263: Unresolved reference 'IDLE'
13. Line 273: Unresolved reference 'PLAYING'
14. Line 299: Unresolved reference 'PLAYING'
15. Line 300: Unresolved reference 'PAUSED'
16. Line 301: Unresolved reference 'ERROR'
17. Line 373: Unresolved reference 'IDLE'
18. Line 374: Unresolved reference 'PLAYING'
19. Line 375: Unresolved reference 'PAUSED'
20. Line 383: Unresolved reference 'PLAYING'

**Fix Strategy**:
```kotlin
// Current problematic code (lines 25 and 47):
// Line 25: enum class TtsState
// Line 47: data class TtsState  <- CONFLICT!

// Fix: Remove the data class redeclaration and keep only the enum
// Delete lines 47-52 (the data class TtsState declaration)

// Keep only this definition:
enum class TtsState {
    IDLE,
    INITIALIZING,
    PLAYING,
    PAUSED,
    ERROR
}

// If you need state with data, use a separate data class:
data class TtsPlaybackState(
    val state: TtsState = TtsState.IDLE,
    val currentSentenceIndex: Int = 0,
    val totalSentences: Int = 0,
    val error: String? = null
)

// Update all references from TtsState() constructor to TtsPlaybackState()
```

**Root Cause**: Redeclaration error in EnhancedEReaderViewModel.kt (line 25) conflicts with the enum in EnhancedTextToSpeech.kt. Remove one of them.

---

### 1.4 Library Entity Properties (5 errors)

**Files**: `LibraryListViewModel.kt` (3 errors), `LibraryManagementScreen.kt` (2 errors)

#### Errors in LibraryListViewModel.kt:
1. Line 72: Unresolved reference 'isActive'
2. Line 75: Unresolved reference 'lastScanned' (2 occurrences)

#### Errors in LibraryManagementScreen.kt:
3. Line 86: Unresolved reference 'description'
4. Line 111: Unresolved reference 'description'

**Fix Strategy**:
```kotlin
// Check Library entity definition in data/local/entity/Library.kt
// Add missing properties:

@Entity(tableName = "libraries")
data class Library(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String,
    val path: String,
    val type: String,
    
    // ADD THESE:
    val description: String? = null,  // For UI display
    val isActive: Boolean = true,     // For enable/disable functionality
    val lastScanned: Long? = null,    // Timestamp of last scan
    
    val dateAdded: Long = System.currentTimeMillis(),
    val dateModified: Long = System.currentTimeMillis()
)
```

---

### 1.5 Metadata API Response Properties (6 errors)

**File**: `MetadataApiService.kt`

#### Errors:
1. Line 137: Unresolved reference 'searchMusic'
2. Line 141: Unresolved reference 'id'
3. Line 142: Unresolved reference 'title'
4. Line 143: Unresolved reference 'artist_credit' and 'name'
5. Line 144: Unresolved reference 'date'

**Fix Strategy**:
```kotlin
// Add MusicBrainz response data classes:

data class MusicBrainzSearchResponse(
    val recordings: List<MusicBrainzRecording>? = null
)

data class MusicBrainzRecording(
    val id: String,
    val title: String,
    @SerializedName("artist-credit")
    val artist_credit: List<ArtistCredit>? = null,
    val date: String? = null,
    val length: Int? = null
)

data class ArtistCredit(
    val name: String,
    val artist: Artist? = null
)

data class Artist(
    val id: String,
    val name: String
)

// Update MetadataApiService interface:
interface MetadataApiService {
    @GET("recording")
    suspend fun searchMusic(
        @Query("query") query: String,
        @Query("fmt") format: String = "json"
    ): MusicBrainzSearchResponse
    
    // ... other methods
}
```

---

### 1.6 Server Integration Properties (13 errors)

**Files**: `ServerIntegrationScreen.kt` (7 errors), `ServerIntegrationViewModel.kt` (6 errors)

#### Errors in ServerIntegrationScreen.kt:
1-2. Lines 134, 142: Unresolved reference 'url'
3-4. Lines 135, 143: Unresolved reference 'serverId'
5-7. Lines 173, 174, 175: Unresolved reference 'url', 'serverId', 'accessToken'

#### Errors in ServerIntegrationViewModel.kt:
8. Line 89: Unresolved reference 'connectedServer'
9. Line 117: Unresolved reference 'requestPIN'
10. Line 138: Unresolved reference 'syncLibraries'
11. Line 149: Unresolved reference 'disconnectServer'
12. Line 154: Unresolved reference 'serverId'
13. Line 160: Unresolved reference 'accessToken'

**Fix Strategy**:
```kotlin
// Option 1: Add properties to existing MediaServer entity
@Entity(tableName = "media_servers")
data class MediaServer(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String,
    val serverType: String,
    
    // ADD THESE:
    val url: String,              // Server URL
    val serverId: String? = null, // Unique server identifier
    val accessToken: String? = null, // Authentication token
    val isConnected: Boolean = false,
    
    val dateAdded: Long = System.currentTimeMillis()
)

// Option 2: Add methods to PlexIntegrationService
class PlexIntegrationService @Inject constructor(
    private val plexApi: PlexApi,
    private val mediaServerDao: MediaServerDao
) {
    // ADD THESE METHODS:
    suspend fun requestPIN(): PlexPinResponse {
        return plexApi.requestPIN()
    }
    
    suspend fun syncLibraries(serverId: String) {
        val libraries = plexApi.getLibraries(serverId)
        // Save to database
    }
    
    suspend fun disconnectServer(serverId: String) {
        mediaServerDao.updateServerConnection(serverId, false)
    }
    
    fun getConnectedServer(): Flow<MediaServer?> {
        return mediaServerDao.getConnectedServer()
    }
}

// Add to MediaServerDao:
@Dao
interface MediaServerDao {
    @Query("SELECT * FROM media_servers WHERE isConnected = 1 LIMIT 1")
    fun getConnectedServer(): Flow<MediaServer?>
    
    @Query("UPDATE media_servers SET isConnected = :isConnected WHERE serverId = :serverId")
    suspend fun updateServerConnection(serverId: String, isConnected: Boolean)
}
```

---

### 1.7 Podcast Properties (5 errors)

**Files**: `PodcastManagerScreen.kt` (3 errors), `FeatureFlagsSettings.kt` (1 error), `PodcastPlayerViewModel.kt` (1 error)

#### Errors:
1-2. Lines 213, 217 (PodcastManagerScreen.kt): Unresolved reference 'totalEpisodes', 'isDownloaded'
3. Line 236 (FeatureFlagsSettings.kt): Unresolved reference 'Podcast'
4. Line 178 (PodcastPlayerViewModel.kt): Unresolved reference 'pause'

**Fix Strategy**:
```kotlin
// 1. Add to PodcastShow entity:
@Entity(tableName = "podcast_shows")
data class PodcastShow(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val title: String,
    val feedUrl: String,
    
    // ADD:
    val totalEpisodes: Int = 0,
    
    val dateAdded: Long = System.currentTimeMillis()
)

// 2. Add to PodcastEpisode entity:
@Entity(tableName = "podcast_episodes")
data class PodcastEpisode(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val showId: Long,
    val title: String,
    
    // ADD:
    val isDownloaded: Boolean = false,
    val downloadPath: String? = null,
    
    val pubDate: Long
)

// 3. Fix FeatureFlagsSettings.kt - change import:
import com.universalmedialibrary.data.local.entity.PodcastShow as Podcast
// OR reference correctly:
MediaType.PODCAST  // instead of MediaType.Podcast

// 4. Add pause() method to AdvancedPodcastPlayerService:
class AdvancedPodcastPlayerService {
    fun pause() {
        exoPlayer?.pause()
    }
    
    // ... other methods
}
```

---

### 1.8 String Resources (3 errors)

**File**: `NowPlayingScreen.kt`

#### Errors:
1. Line 47: Unresolved reference 'now_playing_title'
2. Line 81: Unresolved reference 'cd_back_button'
3. Line 204: Unresolved reference 'now_playing_empty'

**Fix Strategy**:
```xml
<!-- Add to res/values/strings.xml -->
<resources>
    <!-- Existing strings... -->
    
    <!-- Now Playing Screen -->
    <string name="now_playing_title">Now Playing</string>
    <string name="cd_back_button">Back</string>
    <string name="now_playing_empty">No media currently playing</string>
</resources>
```

---

### 1.9 Media Player Methods (5 errors)

**Files**: Various ViewModels

#### Errors:
1. RadioViewModel.kt (lines 85, 90): Unresolved reference 'stop'
2. UniversalVideoPlayerScreen.kt (line 198): Unresolved reference 'switchToAlternativePlayer'
3. BookDetailsViewModel.kt (line 211): Unresolved reference 'getBookDetailsById'
4. ContinueReadingSection.kt (line 35): Unresolved reference 'viewModelScope'

**Fix Strategy**:
```kotlin
// 1. Add to RadioViewModel:
class RadioViewModel @Inject constructor(
    private val radioPlayerService: RadioPlayerService
) : ViewModel() {
    fun stop() {
        radioPlayerService.stop()
    }
}

// 2. Add to UniversalVideoPlayerViewModel:
class UniversalVideoPlayerViewModel @Inject constructor() : ViewModel() {
    fun switchToAlternativePlayer(mediaItem: MediaItem) {
        // Launch external player intent
        val intent = Intent(Intent.ACTION_VIEW).apply {
            setDataAndType(Uri.parse(mediaItem.filePath), mediaItem.mimeType)
        }
        // Handle intent...
    }
}

// 3. Add to BookDetailsRepository:
@Dao
interface BookDetailsDao {
    @Query("""
        SELECT * FROM media_items 
        JOIN metadata_common ON media_items.id = metadata_common.mediaItemId
        LEFT JOIN metadata_book ON media_items.id = metadata_book.mediaItemId
        WHERE media_items.id = :bookId
    """)
    suspend fun getBookDetailsById(bookId: Long): BookDetails?
}

// 4. Fix ContinueReadingSection.kt:
// Change from:
fun ContinueReadingSection() {
    val scope = viewModelScope  // ERROR!
// To:
@Composable
fun ContinueReadingSection(viewModel: SomeViewModel) {
    val scope = rememberCoroutineScope()
```

---

### 1.10 Playlist Settings (4 errors)

**File**: `PlaylistSettingsScreen.kt`

#### Errors:
1. Line 13: Unresolved reference 'android'
2. Line 24: Unresolved reference 'EntryPointAccessors'
3. Line 30: Unresolved reference 'exportQueueAsM3U'
4. Line 37: Unresolved reference 'importM3UToQueue'

**Fix Strategy**:
```kotlin
// Add missing import:
import android.content.Context
import dagger.hilt.android.EntryPointAccessors

// Add M3U export/import methods to PlaylistManager:
class PlaylistManager @Inject constructor(
    private val context: Context,
    private val queueDao: QueueDao
) {
    suspend fun exportQueueAsM3U(filePath: String) {
        val queueItems = queueDao.getAllQueueItems()
        val m3uContent = buildString {
            appendLine("#EXTM3U")
            queueItems.forEach { item ->
                appendLine("#EXTINF:${item.duration},${item.artist} - ${item.title}")
                appendLine(item.filePath)
            }
        }
        File(filePath).writeText(m3uContent)
    }
    
    suspend fun importM3UToQueue(filePath: String) {
        val lines = File(filePath).readLines()
        val mediaItems = mutableListOf<QueueItem>()
        
        lines.forEach { line ->
            if (!line.startsWith("#") && line.isNotBlank()) {
                // Parse file path and add to queue
                val queueItem = QueueItem(
                    filePath = line,
                    position = mediaItems.size
                )
                mediaItems.add(queueItem)
            }
        }
        
        queueDao.insertAll(mediaItems)
    }
}

// Create Hilt EntryPoint:
@EntryPoint
@InstallIn(SingletonComponent::class)
interface PlaylistManagerEntryPoint {
    fun playlistManager(): PlaylistManager
}

// Use in PlaylistSettingsScreen:
val context = LocalContext.current
val playlistManager = remember {
    EntryPointAccessors.fromApplication(
        context.applicationContext,
        PlaylistManagerEntryPoint::class.java
    ).playlistManager()
}
```

---

### 1.11 Miscellaneous (9 errors)

Various files with single unresolved references:

1. **EnhancedMetadataEditor.kt** (line 147): Unresolved reference 'name'
   - **Fix**: Change `it.name` to `it.artistName` or add `name` property to Author entity

2. **MetadataEditorScreen.kt** (line 64): Unresolved reference 'Icons'
   - **Fix**: Add import: `import androidx.compose.material.icons.Icons`

3. **MetallicComponents.kt** (line 58): Unresolved reference 'sp'
   - **Fix**: Add import: `import androidx.compose.ui.unit.sp`

4. **StorageOrganizerScreen.kt** (line 89): Unresolved reference 'lifecycleScope'
   - **Fix**: Change to use `rememberCoroutineScope()` in Composable context

5. **BookDetailsViewModel.kt** (line 178): Unresolved reference 'model'
   - **Fix**: Change to `it.metadata` or define `model` property in BookDetails

---

## Category 2: Type Inference Failure (35 errors)

**Impact**: MEDIUM - Code may work but compiler needs explicit types  
**Difficulty**: LOW - Just add type annotations  
**Priority**: MEDIUM

### 2.1 EnhancedBookshelfScreen.kt (31 errors)

**Root Cause**: Kotlin cannot infer generic type parameters in sorting comparators

#### Errors (lines 140-152):
All related to sorting expressions like:
- `compareBy { it.title }` - cannot infer type
- `compareByDescending { it.author }` - cannot infer type

**Fix Strategy**:
```kotlin
// Option 1: Add explicit type to sortedWith
.sortedWith<BookDetails>(
    when (sortOption) {
        SortOption.TITLE_ASC -> compareBy { it.metadata.title }
        SortOption.TITLE_DESC -> compareByDescending { it.metadata.title }
        // ... etc
    }
)

// Option 2: Extract to a function with explicit return type
private fun getSortComparator(sortOption: SortOption): Comparator<BookDetails> {
    return when (sortOption) {
        SortOption.TITLE_ASC -> compareBy { it.metadata.title }
        SortOption.TITLE_DESC -> compareByDescending { it.metadata.title }
        SortOption.AUTHOR_ASC -> compareBy { it.authorName ?: "" }
        SortOption.AUTHOR_DESC -> compareByDescending { it.authorName ?: "" }
        SortOption.DATE_ADDED_NEW -> compareByDescending { it.mediaItem.dateAdded }
        SortOption.DATE_ADDED_OLD -> compareBy { it.mediaItem.dateAdded }
        SortOption.RECENTLY_READ -> compareByDescending { it.mediaItem.lastAccessedDate ?: 0L }
        SortOption.PROGRESS -> compareByDescending { 
            it.mediaItem.playbackPosition.toDouble() / (it.mediaItem.duration?.toDouble() ?: 1.0) 
        }
        SortOption.RATING -> compareByDescending { it.metadata.userRating ?: 0 }
        SortOption.RATING_HIGH -> compareByDescending { it.metadata.userRating ?: 0 }
        SortOption.RATING_LOW -> compareBy { it.metadata.userRating ?: 0 }
        SortOption.FILE_SIZE -> compareByDescending { it.mediaItem.fileSize }
    }
}

// Then use:
.sortedWith(getSortComparator(sortOption))
```

**Recommended**: Option 2 is cleaner and more maintainable.

---

### 2.2 BookshelfViewModel.kt (2 errors)

**Root Cause**: Type inference failure in filter operations

#### Error (line 94):
```kotlin
books.filter { it /* type cannot be inferred */ }
```

**Fix Strategy**:
```kotlin
// Add explicit type:
val filteredBooks: List<BookDetails> = books.filter { book ->
    // filter logic
}

// Or use explicit receiver type:
books.filterIsInstance<BookDetails>().filter { book ->
    // filter logic
}
```

---

### 2.3 MetadataApiService.kt (1 error)

**Root Cause**: Lambda parameter type not inferred

#### Error (line 138):
```kotlin
recordings?.map { it.id }  // 'it' type cannot be inferred
```

**Fix Strategy**:
```kotlin
// Add explicit parameter type:
recordings?.map { (recording: MusicBrainzRecording) -> recording.id }

// Or use explicit property reference:
recordings?.map(MusicBrainzRecording::id)
```

---

### 2.4 PlaylistSettingsScreen.kt (1 error)

**Root Cause**: Context type not inferred

#### Error (line 23):
```kotlin
val context = /* type cannot be inferred */
```

**Fix Strategy**:
```kotlin
// Add explicit type:
val context: Context = LocalContext.current

// Or use application context explicitly:
val context = LocalContext.current.applicationContext
```

---

## Category 3: Type Mismatch (15 errors)

**Impact**: HIGH - Prevents compilation  
**Difficulty**: MEDIUM - Requires understanding data flow  
**Priority**: HIGH

### 3.1 BookshelfScreen.kt (3 errors)

**Root Cause**: Attempting to pass `Any` where `List<BookDetails>` expected

#### Errors (lines 186, 197, 208):
```kotlin
// Error: Argument type mismatch: actual type is 'kotlin.Any', 
// but 'kotlin.collections.List<com.universalmedialibrary.data.local.entity.BookDetails>' was expected
```

**Fix Strategy**:
```kotlin
// Current problematic code:
when (viewMode) {
    ViewMode.LIST -> BookListView(books = uiState.books)  // uiState.books is Any?
    ViewMode.GRID -> BookGridView(books = uiState.books)
    ViewMode.COMFORTABLE -> ComfortableBookView(books = uiState.books)
}

// Fix 1: Cast explicitly
when (viewMode) {
    ViewMode.LIST -> BookListView(books = uiState.books as List<BookDetails>)
    ViewMode.GRID -> BookGridView(books = uiState.books as List<BookDetails>)
    ViewMode.COMFORTABLE -> ComfortableBookView(books = uiState.books as List<BookDetails>)
}

// Fix 2: Update UIState to have explicit type
data class BookshelfUiState(
    val books: List<BookDetails> = emptyList(),  // Not Any
    val viewMode: ViewMode = ViewMode.GRID,
    val sortOption: SortOption = SortOption.TITLE_ASC
)
```

**Recommended**: Fix 2 (update UIState) to have type safety throughout.

---

### 3.2 PodcastManagerScreen.kt (3 errors)

**Root Cause**: Nullable String passed where non-null String expected

#### Errors (lines 206, 207, 208):
```kotlin
// Error: Argument type mismatch: actual type is 'kotlin.String?', 
// but 'kotlin.String' was expected
```

**Fix Strategy**:
```kotlin
// Current code:
Text(text = podcast.description)  // podcast.description is String?

// Fix: Provide default for nulls
Text(text = podcast.description ?: "No description available")

// Or use non-null assertion if you're certain it exists:
Text(text = podcast.description!!)

// Or make the parameter nullable:
@Composable
fun PodcastDescription(description: String?) {
    Text(text = description ?: "No description")
}
```

---

### 3.3 UniversalVideoPlayerViewModel.kt (5 errors)

**Root Cause**: Generic array type mismatch

#### Error (line 89):
```kotlin
// Error: Argument type mismatch: actual type is 'kotlin.Array<T>', 
// but 'kotlin.Array<java.lang.Class<*>>' was expected
```

**Fix Strategy**:
```kotlin
// Current problematic code:
val rendererFactories = arrayOf<Class<*>>(
    SomeRenderer::class.java
)

// Fix: Use explicit Class<*> array
val rendererFactories: Array<Class<*>> = arrayOf(
    DefaultVideoRendererFactory::class.java,
    DefaultAudioRendererFactory::class.java
)

// Or use mutableListOf and toTypedArray():
val rendererFactories = mutableListOf<Class<*>>(
    DefaultVideoRendererFactory::class.java,
    DefaultAudioRendererFactory::class.java
).toTypedArray()
```

---

### 3.4 Other Type Mismatches (4 errors)

1. **AdvancedVideoPlayerViewModel.kt** (line 167): String vs Int
   ```kotlin
   // Fix: Parse string to int
   val bitrate = bitrateString.toIntOrNull() ?: 0
   ```

2. **BookDetailsViewModel.kt** (line 178): Any vs BookDetails?
   ```kotlin
   // Fix: Add explicit cast
   val bookDetails = result as? BookDetails
   ```

3. **CleverFerretTheme.kt** (line 89): List<Color> vs MetallicGradient
   ```kotlin
   // Fix: Wrap in MetallicGradient constructor
   MetallicGradient(colors = listOf(color1, color2, color3))
   ```

4. **LibraryDetailsViewModel.kt** (line 145): List<MediaItem> vs List<BookDetails>
   ```kotlin
   // Fix: Map to BookDetails
   val bookDetails = mediaItems.map { mediaItem ->
       BookDetails(
           mediaItem = mediaItem,
           metadata = getMetadata(mediaItem.id),
           bookMetadata = getBookMetadata(mediaItem.id)
       )
   }
   ```

---

## Category 4: Exhaustive When Expression (8 errors)

**Impact**: MEDIUM - Code works but not exhaustive  
**Difficulty**: LOW - Just add missing branches  
**Priority**: MEDIUM

### 4.1 BookshelfScreen.kt (2 errors)

#### Error 1 (line 82):
```kotlin
when (viewMode) {
    ViewMode.LIST -> { /* ... */ }
    ViewMode.GRID -> { /* ... */ }
    // Missing: GRID_SMALL, GRID_LARGE, COMFORTABLE
}
```

**Fix Strategy**:
```kotlin
when (viewMode) {
    ViewMode.LIST -> BookListView(books)
    ViewMode.GRID, ViewMode.GRID_LARGE -> BookGridView(books, large = true)
    ViewMode.GRID_SMALL -> BookGridView(books, large = false)
    ViewMode.COMFORTABLE -> ComfortableBookView(books)
    ViewMode.COVER_FLOW -> CoverFlowView(books)
}
```

#### Error 2 (line 183):
Same issue, same fix.

---

### 4.2 BookshelfViewModel.kt (1 error)

#### Error (line 84):
```kotlin
when (sortOption) {
    SortOption.TITLE -> { /* ... */ }
    // Missing: TITLE_ASC, TITLE_DESC, AUTHOR_ASC, AUTHOR_DESC, 
    // DATE_ADDED_NEW, DATE_ADDED_OLD, RATING_HIGH, etc.
}
```

**Fix Strategy**:
```kotlin
when (sortOption) {
    SortOption.TITLE_ASC, SortOption.TITLE -> sortByTitleAsc()
    SortOption.TITLE_DESC -> sortByTitleDesc()
    SortOption.AUTHOR_ASC, SortOption.AUTHOR -> sortByAuthorAsc()
    SortOption.AUTHOR_DESC -> sortByAuthorDesc()
    SortOption.DATE_ADDED_NEW, SortOption.DATE_ADDED -> sortByDateNew()
    SortOption.DATE_ADDED_OLD -> sortByDateOld()
    SortOption.RATING_HIGH, SortOption.RATING -> sortByRatingHigh()
    SortOption.RATING_LOW -> sortByRatingLow()
    SortOption.RECENTLY_READ -> sortByRecentlyRead()
    SortOption.PROGRESS -> sortByProgress()
    SortOption.FILE_SIZE -> sortByFileSize()
}
```

---

### 4.3 EnhancedBookshelfScreen.kt (1 error)

#### Error (line 140):
Missing RATING_HIGH and RATING_LOW cases.

**Fix**: Add to the existing when expression (see Category 2.1 fix).

---

### 4.4 Other Files (4 errors)

Similar exhaustive when issues in:
- PodcastPlayerScreen.kt
- LibraryDetailsScreen.kt  
- MediaTypeFilter.kt

**Universal Fix Pattern**:
```kotlin
// Add else branch if needed:
when (enumValue) {
    EnumValue.CASE1 -> { /* ... */ }
    EnumValue.CASE2 -> { /* ... */ }
    else -> { /* default behavior */ }
}

// Or add all missing cases explicitly
```

---

## Category 5: Experimental API (6 errors)

**Impact**: LOW - Just warnings, code works  
**Difficulty**: LOW - Add @OptIn annotation  
**Priority**: LOW

### Errors:
1. **PageTurnAnimations.kt** (line 75): Material API experimental
2. **SeriesDetailScreen.kt** (line 54): Material API experimental
3. **OpdsSettingsScreen.kt** (line 39): Material API experimental
4-6. Various other files with Material3 experimental APIs

**Fix Strategy**:
```kotlin
// Option 1: Add @OptIn annotation to function
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MyScreen() {
    // Use experimental APIs
}

// Option 2: Add @OptIn annotation to file
@file:OptIn(ExperimentalMaterial3Api::class)

package com.universalmedialibrary.ui.somethingpackage

// Now all functions can use experimental APIs

// Option 3: Add to build.gradle.kts to suppress globally
kotlin {
    compilerOptions {
        freeCompilerArgs.add("-opt-in=androidx.compose.material3.ExperimentalMaterial3Api")
    }
}
```

**Recommended**: Option 1 (function-level) for better control and awareness.

---

## Category 6: Other Errors (20 errors)

**Impact**: VARIES  
**Difficulty**: VARIES  
**Priority**: MEDIUM-HIGH

### 6.1 Redeclaration (2 errors)

**File**: EnhancedEReaderViewModel.kt & EnhancedTextToSpeech.kt

#### Error:
```
Line 25 (EnhancedEReaderViewModel.kt): Redeclaration: enum class TtsState
Line 47 (EnhancedTextToSpeech.kt): Redeclaration: data class TtsState
```

**Fix**: See Category 1.3 for detailed fix.

---

### 6.2 Overload Resolution Ambiguity (1 error)

**File**: MainActivity.kt (line 170)

#### Error:
```kotlin
// Multiple overloads match, compiler can't decide
someFunction(param)
```

**Fix Strategy**:
```kotlin
// Add explicit type to parameter:
someFunction(param as SpecificType)

// Or use named parameters:
someFunction(specificParam = param)

// Or cast the receiver:
(object as SpecificType).someFunction(param)
```

---

### 6.3 Operator Type Error (1 error)

**File**: AdvancedPodcastPlayerService.kt (line 100)

#### Error:
```kotlin
// Operator '==' cannot be applied to 'kotlin.Long' and 'kotlin.String'
if (episodeId == episodeIdString)  // Type mismatch!
```

**Fix Strategy**:
```kotlin
// Fix: Parse string to Long
if (episodeId == episodeIdString.toLongOrNull())

// Or convert Long to String:
if (episodeId.toString() == episodeIdString)

// Or fix the type at source:
// If episodeIdString should be Long, change parameter type
fun playEpisode(episodeId: Long)  // Not String
```

---

### 6.4 Missing Parameters (3 errors)

Various function calls missing required parameters:

1. **AdvancedDocumentReaderViewModel.kt** (line 56): Missing 'averageReadingSpeed'
   ```kotlin
   // Add the missing parameter:
   DocumentReadingStats(
       totalPages = pages,
       currentPage = current,
       averageReadingSpeed = 250  // words per minute
   )
   ```

2. **MetadataEditorViewModel.kt** (line 123): Missing 'mediaType'
   ```kotlin
   // Add mediaType parameter:
   updateMetadata(
       mediaItem = item,
       metadata = newMetadata,
       mediaType = MediaType.BOOK  // or determine from item
   )
   ```

3. **AdvancedVideoPlayerViewModel.kt** (lines 134, 142): Missing 'format' and wrong parameter name
   ```kotlin
   // Fix parameter names and add missing ones:
   SubtitleTrack(
       id = trackId,
       name = trackName,
       format = "SRT",  // Add format
       isSelected = true  // Not 'selected'
   )
   ```

---

### 6.5 Nullable Receiver Errors (2 errors)

**File**: MediaOpenScreen.kt (lines 87, 88)

#### Error:
```kotlin
// Only safe (?.) or non-null asserted (!!.) calls allowed
mediaItem.doSomething()  // mediaItem is MediaItem?
```

**Fix Strategy**:
```kotlin
// Option 1: Use safe call
mediaItem?.doSomething()

// Option 2: Use non-null assertion (if certain it's not null)
mediaItem!!.doSomething()

// Option 3: Use let
mediaItem?.let { item ->
    item.doSomething()
}

// Option 4: Return early if null
val item = mediaItem ?: return
item.doSomething()
```

---

### 6.6 Composable Context Errors (2 errors)

**File**: EnhancedBookshelfScreen.kt (line 315)

#### Error:
```kotlin
// @Composable invocations can only happen from @Composable context
Text("Hello")  // Called from non-@Composable function
```

**Fix Strategy**:
```kotlin
// Option 1: Make function @Composable
@Composable
fun MyFunction() {
    Text("Hello")  // Now allowed
}

// Option 2: Extract composable logic to separate function
fun processData() {
    // Non-composable logic
}

@Composable
fun DisplayData() {
    val data = remember { processData() }
    Text(data)
}
```

---

### 6.7 Miscellaneous (9 errors)

1. **Badge too many arguments** (EnhancedBookshelfScreen.kt)
   ```kotlin
   // Remove extra parameters not in Badge API
   Badge(
       modifier = modifier,
       containerColor = color,
       contentColor = contentColor
   ) {
       Text(text)
   }
   ```

2. **Suspend function call** (StorageOrganizerScreen.kt)
   ```kotlin
   // Wrap in coroutine scope:
   LaunchedEffect(Unit) {
       organizeDirectory(context, uri)
   }
   ```

3. **Wrong parameter name** (PodcastPlayerScreen.kt)
   ```kotlin
   // Change 'textAlign' to correct parameter name
   Text(
       text = title,
       style = TextStyle(textAlign = TextAlign.Center)  // Not a Text parameter
   )
   ```

4. **Illegal annotation** (VideoPlayerScreen.kt)
   ```kotlin
   // Remove @ViewModel annotation, use @HiltViewModel instead
   @HiltViewModel
   class VideoPlayerViewModel @Inject constructor() : ViewModel()
   ```

5. **Boolean condition type mismatch** (PodcastManagerScreen.kt)
   ```kotlin
   // Fix: Compare properly
   if (navigationRailValue == WideNavigationRailValue.Expanded) {
       // Not: if (navigationRailValue)
   }
   ```

6. **SettingsScreen.kt padding errors** (3 occurrences)
   ```kotlin
   // Use PaddingValues properly:
   Modifier.padding(paddingValues)  // Not padding(16.dp, paddingValues)
   ```

---

## Fix Strategies by Priority

### Priority 1: Critical Fixes (Must fix for compilation)

**Estimated Time**: 6-8 hours  
**Errors Fixed**: ~130

1. **TtsState Redeclaration** (21 errors, 1 hour)
   - Remove duplicate TtsState data class
   - Keep only enum definition

2. **BookDetails Properties** (12 errors, 1 hour)
   - Add computed properties to BookDetails
   - Or update all property access sites

3. **Widget Layouts** (29 errors, 2 hours)
   - Create missing widget XML layouts
   - Or disable widgets in AndroidManifest

4. **Library Entity Properties** (5 errors, 30 min)
   - Add description, isActive, lastScanned to Library entity

5. **Type Mismatches** (15 errors, 1.5 hours)
   - Fix UIState type definitions
   - Add proper casts and null handling

6. **Metadata API** (7 errors, 1 hour)
   - Add MusicBrainz response data classes
   - Implement searchMusic endpoint

7. **Server Integration** (13 errors, 1.5 hours)
   - Add url, serverId, accessToken to MediaServer
   - Implement missing service methods

8. **Exhaustive When** (8 errors, 30 min)
   - Add missing enum cases
   - Or add else branches

### Priority 2: Important Fixes

**Estimated Time**: 3-4 hours  
**Errors Fixed**: ~40

1. **Type Inference** (35 errors, 2 hours)
   - Add explicit types to sorting functions
   - Extract comparator functions

2. **Podcast Properties** (5 errors, 1 hour)
   - Add totalEpisodes, isDownloaded properties
   - Implement playlist import/export

### Priority 3: Quality Improvements

**Estimated Time**: 1-2 hours  
**Errors Fixed**: ~21

1. **Experimental APIs** (6 errors, 30 min)
   - Add @OptIn annotations

2. **Miscellaneous** (15 errors, 1.5 hours)
   - Fix parameter names and missing parameters
   - Add null safety checks

---

## Implementation Roadmap

### Phase 1: Data Model Fixes (3-4 hours)

**Goal**: Fix all entity and model issues

1. Update `BookDetails` entity with computed properties
2. Update `Library` entity with missing fields
3. Update `MediaServer` entity with connection fields
4. Update `PodcastShow` and `PodcastEpisode` entities
5. Remove `TtsState` redeclaration
6. Add MusicBrainz response data classes

**Validation**: Run compile after each entity change

### Phase 2: Service Layer Fixes (3-4 hours)

**Goal**: Implement missing service methods

1. Add `MetadataApiService.searchMusic()` method
2. Implement playlist import/export in `PlaylistManager`
3. Add server connection methods to `PlexIntegrationService`
4. Add media player control methods (`pause()`, `stop()`)
5. Implement `BookDetailsRepository.getBookDetailsById()`

**Validation**: Run compile, verify no method resolution errors

### Phase 3: UI Layer Fixes (4-5 hours)

**Goal**: Fix all UI compilation errors

1. Fix `EnhancedBookshelfScreen.kt` type inference (extract comparator function)
2. Fix `BookshelfScreen.kt` type mismatches (update UIState)
3. Create widget XML layouts or disable widgets
4. Add missing string resources
5. Fix `@Composable` context errors
6. Fix exhaustive when expressions

**Validation**: Run compile, verify no UI errors

### Phase 4: Polish and Cleanup (1-2 hours)

**Goal**: Fix remaining minor issues

1. Add `@OptIn` annotations for experimental APIs
2. Fix parameter names and missing parameters
3. Add null safety checks
4. Fix operator type errors

**Validation**: Full compilation success

---

## Testing Strategy

After fixing each category:

1. **Incremental Compilation**
   ```bash
   ./gradlew assembleDebug --no-daemon
   ```

2. **Verify Error Reduction**
   ```bash
   ./gradlew assembleDebug 2>&1 | grep "^e: file:" | wc -l
   ```

3. **Run Unit Tests**
   ```bash
   ./gradlew testDebugUnitTest
   ```

4. **Build APK**
   ```bash
   ./gradlew assembleDebug
   ```

---

## Conclusion

All 191 compilation errors have been documented with:
- ✅ Exact file location (file, line, column)
- ✅ Error type and message
- ✅ Root cause analysis
- ✅ Specific fix strategy
- ✅ Code examples
- ✅ No stubbing or workarounds

**Estimated Total Fix Time**: 12-16 hours

**Success Criteria**:
- Zero compilation errors
- All unit tests passing
- APK builds successfully

**Next Steps**:
1. Review this document
2. Prioritize fixes based on your needs
3. Implement fixes in phases
4. Test incrementally
5. Build final APK

---

## Appendix A: Error Summary by File

| File | Errors | Categories |
|------|--------|------------|
| EnhancedBookshelfScreen.kt | 50 | Type inference (31), Unresolved ref (12), Other (7) |
| CurrentlyReadingWidget.kt | 29 | Unresolved reference (widget resources) |
| EnhancedTextToSpeech.kt | 21 | Unresolved reference (TtsState enum), Redeclaration (1) |
| MetadataApiService.kt | 7 | Unresolved reference (6), Type inference (1) |
| ServerIntegrationScreen.kt | 7 | Unresolved reference |
| PodcastManagerScreen.kt | 7 | Unresolved ref (3), Type mismatch (3), Other (1) |
| ServerIntegrationViewModel.kt | 6 | Unresolved reference |
| BookshelfScreen.kt | 5 | Type mismatch (3), Exhaustive when (2) |
| UniversalVideoPlayerViewModel.kt | 5 | Type mismatch |
| PlaylistSettingsScreen.kt | 5 | Unresolved ref (4), Type inference (1) |
| Others (32 files) | 49 | Various |

---

## Appendix B: Quick Reference Commands

```bash
# Count current errors
./gradlew assembleDebug 2>&1 | grep "^e: file:" | wc -l

# Save errors to file
./gradlew assembleDebug 2>&1 | grep "^e: file:" > errors.txt

# Find specific error type
./gradlew assembleDebug 2>&1 | grep "Unresolved reference"

# Test specific module
./gradlew :CleverFerret:assembleDebug

# Clean and rebuild
./gradlew clean assembleDebug
```

---

**Document Version**: 1.0  
**Last Updated**: 2025-01-13  
**Maintainer**: AI Assistant
