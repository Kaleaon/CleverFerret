# PR Review - Fixes Needed

## Critical Issues (Must Fix Before Merge)

### 1. ❌ COMPILATION ERRORS - Blocking
**Status:** Build fails - cannot merge

#### a) EpubReaderEngine.kt:390
- **Error:** Unresolved reference 'content'
- **Issue:** Variable 'content' used but never defined when creating EpubChapter
- **Fix Needed:** Read content from zip entry before using it
```kotlin
val content = zipFile.getInputStream(entry).bufferedReader().use { it.readText() }
chapters.add(EpubChapter(...))
```

#### b) JellyfinClient.kt:34
- **Error:** Invalid Jellyfin initialization syntax  
- **Current:** `Jellyfin { httpClientOptions { ... } }`
- **Fix Needed:** Use proper JellyfinOptions.Builder
```kotlin
jellyfin = Jellyfin(
    JellyfinOptions.Builder()
        .apply {
            // Configure options
        }
        .build()
)
```

#### c) EnhancedEReaderScreen.kt:296, 303
- **Error:** Unresolved reference 'chapters', should be 'uiState.chapters'  
- **Status:** Partially fixed but still has issues
- **Fix Needed:** Ensure all 'chapters' references use 'uiState.chapters'

### 2. ❌ AudiobookService.deleteBookmark() - Non-functional
**Severity:** HIGH - Feature doesn't work
**Reviewers:** @codoki, @coderabbitai (both flagged as critical)

**Problem:** Method is a complete no-op placeholder:
```kotlin
fun deleteBookmark(bookmark: AudiobookBookmark) {
    // Delete a bookmark
    // Would need bookmark deletion from persistence
}
```

**Impact:** UI calls deleteBookmark but nothing happens - silent failure

**Fix Options:**
1. **Implement properly** with persistence (preferred):
```kotlin
fun deleteBookmark(bookmark: AudiobookBookmark) {
    val updatedBookmarks = _audiobookState.value.bookmarks.filterNot { it.id == bookmark.id }
    updateAudiobookState(bookmarks = updatedBookmarks)
    // TODO: Persist to database when available
}
```

2. **Fail fast** if not ready:
```kotlin
fun deleteBookmark(bookmark: AudiobookBookmark) {
    throw NotImplementedError("Bookmark deletion not yet implemented - persistence layer required")
}
```

### 3. ❌ MediaPlaybackWidget Actions - Non-functional  
**Severity:** HIGH - Widget buttons don't work
**Reviewers:** @codoki, @coderabbitai (both flagged as critical)

**Problem:** All widget action callbacks are empty:
- PlayPauseAction.onAction() - empty
- PreviousAction.onAction() - empty  
- NextAction.onAction() - empty

**Current Code:**
```kotlin
class PlayPauseAction : ActionCallback {
    override suspend fun onAction(...) {
        // MediaPlaybackWidgetService handles play/pause action
        // Service is injected and observed via StateFlow
        // Widget updates automatically through MediaPlaybackWidgetService.widgetState
    }
}
```

**Impact:** Tapping widget buttons does nothing

**Fix Needed:** Wire actions to service methods:
```kotlin
class PlayPauseAction : ActionCallback {
    override suspend fun onAction(context: Context, glanceId: GlanceId, parameters: ActionParameters) {
        val intent = Intent(context, MediaPlaybackWidgetService::class.java)
            .setAction(MediaPlaybackWidgetService.ACTION_TOGGLE_PLAY_PAUSE)
        context.startService(intent)
    }
}
```

**OR** use direct service access if available via Hilt in widget context.

### 4. ❌ AudiobookPlayerViewModel.deleteBookmark() - No Error Handling
**Severity:** MAJOR  
**Reviewer:** @coderabbitai

**Problem:** No error handling or user feedback:
```kotlin
fun deleteBookmark(bookmark: AudiobookBookmark) {
    viewModelScope.launch {
        audiobookService.deleteBookmark(bookmark)
    }
}
```

**Fix Needed:**
```kotlin
fun deleteBookmark(bookmark: AudiobookBookmark) {
    viewModelScope.launch {
        try {
            audiobookService.deleteBookmark(bookmark)
            // TODO: Show success feedback
        } catch (e: Exception) {
            Log.e("AudiobookPlayerViewModel", "Failed to delete bookmark", e)
            // TODO: Show error to user
        }
    }
}
```

## Medium Priority Issues

### 5. ⚠️ JellyfinClient - Missing clientInfo
**Severity:** MEDIUM
**Reviewer:** @codoki

**Problem:** Removed clientInfo (name/version) from Jellyfin initialization  
**Impact:** Some Jellyfin servers rely on client identification for diagnostics

**Fix:**
```kotlin
jellyfin = Jellyfin(
    JellyfinOptions.Builder()
        .clientInfo("CleverFerret", "1.1")
        .build()
)
```

### 6. ⚠️ MediaPlaybackWidgetContent - Misleading Documentation
**Severity:** MEDIUM
**Reviewer:** @coderabbitai

**Problem:** Comments claim state is managed by service, but widget shows hardcoded static content
- "No Media Playing"
- "Tap play to start"

**Fix:** Either:
1. Implement actual state observation from MediaPlaybackWidgetService
2. Update comments to reflect current placeholder status

## Low Priority / Code Quality

### 7. 📝 ComicReaderEngine - Resource Leak
**Severity:** LOW (Outside diff range)
**Reviewer:** @coderabbitai

**Problem:** InputStream not closed in page rendering
**Fix:** Wrap in `.use { }` block

### 8. 📝 Documentation - Code blocks missing language identifiers
**Severity:** LOW
**Files:** DEPLOYMENT_SUMMARY.md, TASK_COMPLETION_REPORT.md

---

## Radio Functionality Status ✅

**Good News:** Internet radio implementation looks complete and functional:

✅ **RadioScreen.kt** - Full UI with station list, favorites, recent  
✅ **RadioViewModel.kt** - Proper implementation with AudioPlaybackManager  
✅ **RadioStationDao.kt** - Complete database operations  
✅ **RadioStation entity** - Properly defined  
✅ **Default stations** - BBC Radio 1, NPR, Jazz FM, Classical, SomaFM  
✅ **Playback integration** - Uses AudioPlaybackManager.loadSingle()  

**Verified:**
- Station playback via `playStation()` method
- Play/pause/stop controls
- Favorite management
- Recently played tracking
- Add custom stations dialog
- Proper state management with StateFlow

**No issues found** with radio functionality. ✅

---

## Summary

**Blocking Issues:** 3 compilation errors + 2 non-functional features
**Must Fix:** 4 critical issues before merge
**Should Fix:** 2 medium priority issues
**Nice to Have:** 2 low priority improvements

**Radio Status:** ✅ Fully functional, no issues

**Recommendation:** Fix critical issues (1-4) before merging. Radio is working properly.
