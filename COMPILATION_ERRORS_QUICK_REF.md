# Compilation Errors - Quick Reference

**Total Errors**: 191 across 42 files  
**Full Documentation**: See [COMPILATION_ERRORS_DETAILED.md](./COMPILATION_ERRORS_DETAILED.md)

---

## At a Glance

| Priority | Category | Count | Est. Time | Impact |
|----------|----------|-------|-----------|--------|
| 🔴 HIGH | Unresolved reference | 107 | 6-8 hours | CRITICAL |
| 🟡 MEDIUM | Type inference failure | 35 | 2 hours | MEDIUM |
| 🔴 HIGH | Type mismatch | 15 | 1.5 hours | HIGH |
| 🟡 MEDIUM | Exhaustive when | 8 | 30 min | MEDIUM |
| 🟢 LOW | Experimental API | 6 | 30 min | LOW |
| 🔴 HIGH | Other | 20 | 2 hours | VARIES |

**Total Estimated Fix Time**: 12-16 hours

---

## Top 10 Problem Files

| # | File | Errors | Quick Fix |
|---|------|--------|-----------|
| 1 | `EnhancedBookshelfScreen.kt` | 50 | Add computed properties to BookDetails + explicit types |
| 2 | `CurrentlyReadingWidget.kt` | 29 | Create widget XML layouts OR disable widgets |
| 3 | `EnhancedTextToSpeech.kt` | 21 | Remove TtsState data class redeclaration |
| 4 | `MetadataApiService.kt` | 7 | Add MusicBrainz response classes + searchMusic() |
| 5 | `ServerIntegrationScreen.kt` | 7 | Add url/serverId/accessToken to MediaServer entity |
| 6 | `PodcastManagerScreen.kt` | 7 | Add totalEpisodes/isDownloaded properties |
| 7 | `ServerIntegrationViewModel.kt` | 6 | Implement server connection methods |
| 8 | `BookshelfScreen.kt` | 5 | Fix UIState type + add missing when branches |
| 9 | `UniversalVideoPlayerViewModel.kt` | 5 | Fix generic array types |
| 10 | `PlaylistSettingsScreen.kt` | 5 | Add import/export M3U methods |

---

## Quick Fix Checklist

### Phase 1: Data Models (3-4 hours) ✅ Fixes ~60 errors

- [ ] **BookDetails.kt**: Add computed properties
  ```kotlin
  val title: String get() = metadata.title
  val author: String get() = authorName ?: "Unknown"
  val dateAdded: Long get() = mediaItem.dateAdded
  val lastRead: Long? get() = mediaItem.lastAccessedDate
  val progress: Double get() = mediaItem.playbackPosition.toDouble() / (mediaItem.duration?.toDouble() ?: 1.0)
  val rating: Double get() = metadata.userRating?.toDouble() ?: 0.0
  val fileSize: Long get() = mediaItem.fileSize
  ```

- [ ] **EnhancedTextToSpeech.kt**: Remove TtsState data class (line 47)
  - Keep only the enum class TtsState definition

- [ ] **Library.kt**: Add missing properties
  ```kotlin
  val description: String? = null
  val isActive: Boolean = true
  val lastScanned: Long? = null
  ```

- [ ] **MediaServer.kt**: Add connection properties
  ```kotlin
  val url: String
  val serverId: String? = null
  val accessToken: String? = null
  val isConnected: Boolean = false
  ```

- [ ] **PodcastShow.kt & PodcastEpisode.kt**: Add properties
  ```kotlin
  // PodcastShow:
  val totalEpisodes: Int = 0
  
  // PodcastEpisode:
  val isDownloaded: Boolean = false
  val downloadPath: String? = null
  ```

- [ ] **MetadataApiService.kt**: Add MusicBrainz data classes
  ```kotlin
  data class MusicBrainzSearchResponse(
      val recordings: List<MusicBrainzRecording>? = null
  )
  
  data class MusicBrainzRecording(
      val id: String,
      val title: String,
      @SerializedName("artist-credit")
      val artist_credit: List<ArtistCredit>? = null,
      val date: String? = null
  )
  ```

### Phase 2: Service Methods (3-4 hours) ✅ Fixes ~30 errors

- [ ] **MetadataApiService.kt**: Add searchMusic() method
  ```kotlin
  @GET("recording")
  suspend fun searchMusic(
      @Query("query") query: String,
      @Query("fmt") format: String = "json"
  ): MusicBrainzSearchResponse
  ```

- [ ] **PlexIntegrationService.kt**: Add server methods
  ```kotlin
  suspend fun requestPIN(): PlexPinResponse
  suspend fun syncLibraries(serverId: String)
  suspend fun disconnectServer(serverId: String)
  fun getConnectedServer(): Flow<MediaServer?>
  ```

- [ ] **PlaylistManager.kt**: Add M3U import/export
  ```kotlin
  suspend fun exportQueueAsM3U(filePath: String)
  suspend fun importM3UToQueue(filePath: String)
  ```

- [ ] **BookDetailsDao.kt**: Add getBookDetailsById()
  ```kotlin
  @Query("SELECT * FROM media_items WHERE id = :bookId")
  suspend fun getBookDetailsById(bookId: Long): BookDetails?
  ```

- [ ] **RadioViewModel.kt**: Add stop() method
  ```kotlin
  fun stop() {
      radioPlayerService.stop()
  }
  ```

### Phase 3: UI Fixes (4-5 hours) ✅ Fixes ~80 errors

- [ ] **EnhancedBookshelfScreen.kt**: Extract comparator function
  ```kotlin
  private fun getSortComparator(sortOption: SortOption): Comparator<BookDetails> {
      return when (sortOption) {
          SortOption.TITLE_ASC -> compareBy { it.title }
          SortOption.TITLE_DESC -> compareByDescending { it.title }
          // ... all cases
      }
  }
  ```

- [ ] **BookshelfScreen.kt**: Fix UIState type
  ```kotlin
  data class BookshelfUiState(
      val books: List<BookDetails> = emptyList(),  // Not Any
      val viewMode: ViewMode = ViewMode.GRID,
      val sortOption: SortOption = SortOption.TITLE_ASC
  )
  ```

- [ ] **CurrentlyReadingWidget.kt**: Create widget layouts
  - Create `res/layout/widget_currently_reading.xml`
  - Create `res/layout/widget_quick_access.xml`
  - Create `res/layout/widget_reading_stats.xml`
  - Create `res/layout/widget_reading_goal.xml`
  - Create `res/layout/widget_book_item.xml`
  
  **OR** disable widgets in AndroidManifest.xml

- [ ] **res/values/strings.xml**: Add missing strings
  ```xml
  <string name="now_playing_title">Now Playing</string>
  <string name="cd_back_button">Back</string>
  <string name="now_playing_empty">No media currently playing</string>
  ```

- [ ] **BookshelfViewModel.kt**: Add all when branches
  ```kotlin
  when (sortOption) {
      SortOption.TITLE_ASC, SortOption.TITLE -> sortByTitleAsc()
      SortOption.TITLE_DESC -> sortByTitleDesc()
      // ... all enum values
  }
  ```

### Phase 4: Polish (1-2 hours) ✅ Fixes ~21 errors

- [ ] **Experimental APIs**: Add @OptIn annotations
  ```kotlin
  @OptIn(ExperimentalMaterial3Api::class)
  @Composable
  fun MyScreen() { /* ... */ }
  ```

- [ ] **Null safety**: Fix nullable receivers
  ```kotlin
  mediaItem?.doSomething()  // Add ? or !!
  ```

- [ ] **Type fixes**: Fix operator type errors
  ```kotlin
  // AdvancedPodcastPlayerService.kt line 100:
  if (episodeId == episodeIdString.toLongOrNull())
  ```

- [ ] **Parameter fixes**: Add missing parameters
  ```kotlin
  DocumentReadingStats(
      totalPages = pages,
      currentPage = current,
      averageReadingSpeed = 250  // Add this
  )
  ```

---

## Verification Commands

```bash
# Count current errors
./gradlew assembleDebug 2>&1 | grep "^e: file:" | wc -l

# Save errors to file
./gradlew assembleDebug 2>&1 | grep "^e: file:" > errors.txt

# Test after each phase
./gradlew clean assembleDebug

# Run unit tests
./gradlew testDebugUnitTest
```

---

## Success Criteria

- ✅ Zero compilation errors
- ✅ All unit tests passing
- ✅ APK builds successfully
- ✅ No stubbing or TODO comments

---

## Need More Details?

See the full documentation: [COMPILATION_ERRORS_DETAILED.md](./COMPILATION_ERRORS_DETAILED.md)

It includes:
- Exact line numbers for all 191 errors
- Detailed root cause analysis
- Multiple fix options with pros/cons
- Code examples for every fix
- Testing strategy
- Complete error listing by file
