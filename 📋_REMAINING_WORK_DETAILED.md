# 📋 Remaining Work - Detailed Breakdown
## What Needs to Be Completed

**Date**: 2025-10-27  
**Remaining TODOs**: 75  
**Completion Status**: 29% Complete (31 of 106 resolved)

---

## 🎯 Priority Breakdown

### 🔴 HIGH PRIORITY (15 TODOs) - Should Complete Next

These are valuable features with high user impact that can be completed relatively quickly.

#### 1. **Playlist Management** (5 TODOs)
**Location**: `EnhancedMusicPlayerScreen.kt`, `NowPlayingViewModel.kt`

**What's Missing**:
```kotlin
// Currently shows empty list
playlists = emptyList(), // TODO: Load actual playlists

// No functionality
onPlaylistSelected = { /* TODO: Add to playlist */ },
onCreateNew = { /* TODO: Create new playlist */ },
```

**What Needs Done**:
- Load playlists from `PlaylistDao`
- Implement add track to playlist
- Create new playlist dialog
- Update playlist UI

**Estimated Time**: 2-3 hours  
**Impact**: High - Users can't manage playlists currently

---

#### 2. **Page Selector & Bookmarks in PDF Reader** (2 TODOs)
**Location**: `PDFReaderViewModel.kt`

**What's Missing**:
```kotlin
fun showPageSelector() {
    // TODO: Implement page selector dialog UI
}

fun showBookmarks() {
    // TODO: Implement bookmarks dialog UI
}
```

**What Needs Done**:
- Integrate `PageSelectorDialog` component (already exists!)
- Integrate `BookmarksDialog` component (already exists!)
- Wire up ViewModel functions

**Estimated Time**: 1 hour  
**Impact**: High - We already have the components, just need to connect them

---

#### 3. **Success/Error Feedback** (2 TODOs)
**Location**: `AudiobookPlayerViewModel.kt`

**What's Missing**:
```kotlin
// No user feedback on bookmark creation
success -> {
    // TODO: Show success feedback via SharedFlow<UiEvent>
}
error -> {
    // TODO: Show error message via SharedFlow<UiEvent>
}
```

**What Needs Done**:
- Add `SharedFlow<UiEvent>` to ViewModel
- Emit success/error events
- Handle in UI with Snackbar

**Estimated Time**: 1-2 hours  
**Impact**: Medium - Better UX

---

#### 4. **Settings Backup Export/Import** (2 TODOs)
**Location**: `ReadingPreferencesScreen.kt`

**What's Missing**:
```kotlin
// Export button does nothing
onClick = {
    // TODO: Integrate SettingsBackupService.exportToStorage()
    // TODO: Show snackbar with success/error message
}

// Import button does nothing
onClick = {
    // TODO: Show Android file picker
    // TODO: Pass selected file to SettingsBackupService.importFromFile()
}
```

**What Needs Done**:
- Call existing `SettingsBackupService` methods
- Add file picker for import
- Show success/error feedback

**Estimated Time**: 2-3 hours  
**Impact**: High - Data backup is important

---

#### 5. **Search History Persistence** (3 TODOs)
**Location**: `EnhancedSearchService.kt`, `EnhancedSearchViewModel.kt`

**What's Missing**:
```kotlin
// Search history not saved
// TODO: Save to search history when implemented
// TODO: Get from search history when implemented
// TODO: Implement when search history DAO is available
```

**What Needs Done**:
- Create `SearchHistoryEntity` and `SearchHistoryDao`
- Save searches to database
- Load recent searches for suggestions
- Clear old searches periodically

**Estimated Time**: 3-4 hours  
**Impact**: Medium - Nice feature, improves search UX

---

#### 6. **Old Time Radio Loading** (1 TODO)
**Location**: `OldTimeRadioScreen.kt`

**What's Missing**:
```kotlin
RadioStationList(
    stations = emptyList(), // TODO: Load from database
)
```

**What Needs Done**:
- Query `RadioStationDao` for stations
- Display in UI
- Handle empty state

**Estimated Time**: 1 hour  
**Impact**: High - Feature is non-functional

---

### 🟡 MEDIUM PRIORITY (25 TODOs) - Good to Have

These require more work but would complete major features.

#### 7. **Metadata Integration** (8 TODOs)
**Locations**: Multiple playlist managers, ViewModels

**What's Missing**:
- Genre filtering for movies/music
- Director filtering for movies
- Author metadata for books
- Series information for books

**Example**:
```kotlin
// TODO: Filter by genre when metadata is available
// TODO: Filter by director when metadata is available
// TODO: Query BookMetadata.author via MediaItemDao join
// TODO: Query via book_series_link: seriesDao.getSeriesForBook(bookId)
```

**What Needs Done**:
- Create metadata query functions
- Join tables for related data
- Update UI to display metadata
- Add filtering capabilities

**Estimated Time**: 1-2 days  
**Impact**: High - Much richer content display

---

#### 8. **Duration Calculations** (4 TODOs)
**Locations**: Playlist managers

**What's Missing**:
```kotlin
totalDuration = 0L // TODO: Calculate from track/movie durations
```

**What Needs Done**:
- Extract duration from media files using `MediaMetadataRetriever`
- Store in `MediaItem` or metadata table
- Sum durations for playlists
- Display formatted durations

**Estimated Time**: 4-6 hours  
**Impact**: Medium - Nice stat for users

---

#### 9. **Play Count Tracking** (1 TODO)
**Location**: `MusicPlaylistManager.kt`

**What's Missing**:
```kotlin
// TODO: Implement when play count tracking is available
val tracks = mediaItemDao.getMediaItemsByType("MUSIC_TRACK").first()
    .take(limit) // Should sort by play count
```

**What Needs Done**:
- Add play count to progress tracking
- Increment on track completion
- Sort "Most Played" by count

**Estimated Time**: 2-3 hours  
**Impact**: Medium - Popular music feature

---

#### 10. **Recommendation Dismissal** (1 TODO)
**Location**: `RecommendationsViewModel.kt`

**What's Missing**:
```kotlin
fun dismissRecommendation(id: String) {
    // TODO: Persist dismissal to prevent showing again
}
```

**What Needs Done**:
- Create dismissed recommendations table
- Store dismissed items
- Filter out from future recommendations

**Estimated Time**: 2 hours  
**Impact**: Low - Nice to have

---

#### 11. **Genre Support** (1 TODO)
**Location**: `RecommendationsViewModel.kt`

**What's Missing**:
```kotlin
fun generateGenreRecommendations() {
    // TODO: Add genre support
}
```

**What Needs Done**:
- Extract/store genre from metadata
- Create genre-based recommendation logic
- Display genre recommendations

**Estimated Time**: 3-4 hours  
**Impact**: Medium - Better recommendations

---

#### 12. **Full Playlist Viewing** (1 TODO)
**Location**: `MusicLibraryScreen.kt`

**What's Missing**:
```kotlin
// TODO: Implement full playlist viewing and management
```

**What Needs Done**:
- Create playlist detail screen
- Show all tracks in playlist
- Edit playlist (add/remove/reorder)
- Delete playlist

**Estimated Time**: 4-6 hours  
**Impact**: High - Core feature

---

#### 13. **TV Metadata Filtering** (1 TODO)
**Location**: `TVShowPlaylistManager.kt`

**What's Missing**:
```kotlin
// TODO: Query TVMetadata table for proper filtering:
// JOIN tv_metadata ON media_items.item_id = tv_metadata.item_id
// WHERE show_name = :showName AND season = :seasonNumber
```

**What Needs Done**:
- Create TV metadata table if missing
- Store show name, season, episode info
- Join query for filtering
- Update season playlist creation

**Estimated Time**: 3-4 hours  
**Impact**: High for TV show users

---

#### 14. **Album Artwork Loading** (1 TODO)
**Location**: `AdvancedMusicPlayerService.kt`

**What's Missing**:
```kotlin
artwork = null, // TODO: Load from albumArtUrl using Coil
```

**What Needs Done**:
- Use Coil image loader
- Load artwork from URL or embedded
- Display in player UI
- Handle missing artwork gracefully

**Estimated Time**: 2-3 hours  
**Impact**: High - Visual appeal

---

#### 15. **App Upgrade Backup** (1 TODO)
**Location**: `AppUpgradeManager.kt`

**What's Missing**:
```kotlin
// TODO: Integrate SettingsBackupService.exportToStorage() 
// to create automatic backup before upgrades
```

**What Needs Done**:
- Call backup service before migration
- Store backup with timestamp
- Add restoration option
- Test upgrade scenarios

**Estimated Time**: 2-3 hours  
**Impact**: High - Data safety

---

### 🟢 LOW PRIORITY (20 TODOs) - Future Enhancements

These are nice-to-have features or depend on external systems.

#### 16. **Audio Effects** (3 TODOs)
**Location**: `AdvancedMusicPlayerServiceExtensions.kt`

**What's Missing**:
```kotlin
// TODO: Implement when equalizer is added
// TODO: Implement when audio effects are added (reverb)
// TODO: Implement when audio effects are added (echo)
```

**What Needs Done**:
- Add Android Equalizer API
- Implement preset system
- Add effects (reverb, echo, etc.)
- UI controls

**Estimated Time**: 1-2 days  
**Impact**: Low - Advanced feature

---

#### 17. **Auto-Sync with WorkManager** (2 TODOs)
**Location**: `SyncViewModel.kt`

**What's Missing**:
```kotlin
// TODO: If true auto-sync scheduling is needed, use WorkManager
// TODO: Implement when service supports it
```

**What Needs Done**:
- Create WorkManager job
- Schedule periodic sync
- Handle sync conflicts
- Network connectivity checks

**Estimated Time**: 4-6 hours  
**Impact**: Medium - Background sync

---

#### 18. **Widget Implementation** (1 TODO)
**Location**: `MediaPlaybackWidget.kt`

**What's Missing**:
```kotlin
// TODO: Implement state observation from MediaPlaybackWidgetService
```

**What Needs Done**:
- Create widget service
- Update widget on playback changes
- Handle widget clicks
- Battery optimization

**Estimated Time**: 6-8 hours  
**Impact**: Medium - Convenient for users

---

#### 19. **Share Preset** (1 TODO)
**Location**: `PresetBrowserScreen.kt`

**What's Missing**:
```kotlin
// TODO: Share via Android share sheet
```

**What Needs Done**:
- Serialize preset to shareable format
- Create share intent
- Handle import on receive

**Estimated Time**: 2-3 hours  
**Impact**: Low - Nice feature

---

#### 20. **Apache Tika Integration** (2 TODOs)
**Location**: `MediaViewerManager.kt`

**What's Missing**:
```kotlin
// TODO: Consider adding Apache Tika dependency
// TODO: Enable Tika for content-based MIME type detection
```

**What Needs Done**:
- Add Tika dependency
- Implement MIME detection
- Handle various formats
- Performance optimization

**Estimated Time**: 4-6 hours  
**Impact**: Low - Better file detection

---

### ⚪ DEFERRED (15 TODOs) - Requires Design Decisions

These need architecture decisions or are future features.

#### 21. **Favorites System** (2 TODOs)
**Locations**: Multiple ViewModels

**What's Missing**:
```kotlin
isFavorite = false, // TODO: Add isFavorite field to MediaItem entity
```

**What Needs Done**:
- **SCHEMA CHANGE**: Add `isFavorite` column to `media_items` table
- Create migration
- Add toggle favorite function
- Filter by favorites

**Estimated Time**: 2-3 hours  
**Impact**: High - But requires database migration

---

#### 22. **Rating System** (1 TODO)
**Location**: `MoviePlaylistManager.kt`

**What's Missing**:
```kotlin
rating = 0f // TODO: Integrate with rating system
```

**What Needs Done**:
- Create rating entity and DAO
- Star rating UI component
- Store ratings per user
- Display in UI

**Estimated Time**: 4-6 hours  
**Impact**: Medium - Social feature

---

#### 23. **Advanced Features** (12+ TODOs)
Various locations with features that depend on:
- External metadata APIs
- ML/AI recommendations
- Social features
- Advanced analytics
- Cloud sync

**Estimated Time**: Weeks  
**Impact**: Variable - Long-term features

---

## 📊 Summary by Estimated Time

| Priority | TODOs | Time Estimate | Value |
|----------|-------|---------------|-------|
| 🔴 **High** | 15 | 2-3 days | Must-have features |
| 🟡 **Medium** | 25 | 1-2 weeks | Major enhancements |
| 🟢 **Low** | 20 | 1-2 weeks | Nice additions |
| ⚪ **Deferred** | 15 | Variable | Future work |

---

## 🎯 Recommended Next Steps

### Phase 1: Quick High-Value Items (1 day)
1. ✅ PDF Reader dialogs integration (1 hour)
2. ✅ Old Time Radio station loading (1 hour)
3. ✅ Playlist loading in music player (2 hours)
4. ✅ Settings backup integration (3 hours)
5. ✅ Success/error feedback (2 hours)

**Total**: ~8 hours | **Impact**: High | **ROI**: Excellent

### Phase 2: Playlist & Metadata (3-4 days)
1. ✅ Complete playlist management
2. ✅ Metadata integration (genres, authors, etc.)
3. ✅ Search history persistence
4. ✅ TV metadata filtering
5. ✅ Album artwork loading

**Total**: 3-4 days | **Impact**: High | **ROI**: Very Good

### Phase 3: Duration & Tracking (2-3 days)
1. ✅ Media duration extraction
2. ✅ Play count tracking
3. ✅ Playlist duration calculations
4. ✅ App upgrade backups

**Total**: 2-3 days | **Impact**: Medium | **ROI**: Good

### Phase 4: Advanced Features (2+ weeks)
1. Audio effects & equalizer
2. Widget implementation
3. Auto-sync with WorkManager
4. Full recommendation system
5. Rating system
6. Favorites with schema migration

**Total**: 2+ weeks | **Impact**: Variable | **ROI**: Long-term

---

## 💡 Key Insights

### What Can Be Done Quickly (< 1 day)
- PDF dialog integration (we have the components!)
- Old Time Radio loading (simple DAO query)
- Settings backup (service exists, just wire up)
- Playlist loading (PlaylistDao exists)

### What Requires More Thought
- Favorites system (database schema change)
- Rating system (new feature design)
- Audio effects (complex Android APIs)
- Widget (background service design)

### What's Blocked
- Some TODOs wait on metadata extraction
- Some wait on external APIs
- Some are true "future enhancements"

### Good News
- Most DAOs already exist
- Many services are complete
- UI components are ready
- Patterns are established

---

## 🚀 Conclusion

**75 TODOs remaining, but:**
- ✅ ~15 are quick high-value items (1 day)
- ✅ ~25 are solid medium-priority features (1 week)
- ⚠️ ~20 are nice-to-have enhancements (2 weeks)
- 🔮 ~15 are long-term/deferred

**Best ROI**: Focus on Phase 1 (Quick High-Value) next!

---

*Last Updated: 2025-10-27*  
*Current Completion: 29% (31/106 TODOs)*  
*Remaining: 75 TODOs*
