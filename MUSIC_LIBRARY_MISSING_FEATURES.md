# Music Library Missing Features - Comprehensive List

## 🚨 Critical Navigation Issues (Currently Non-Functional)

### 1. **No Sorting Options**
- **Status**: Hardcoded to `TITLE ASC` only
- **Missing**: Sort by Artist, Album, Date Added, Duration, Recently Played, Year
- **Impact**: CRITICAL - Users can't organize their library
- **Fix**: Add SortOption enum and dropdown UI

### 2. **No Album View**
- **Status**: Album data collected but never displayed
- **Missing**: Album grid view, album detail page, album art display
- **Impact**: CRITICAL - Standard feature in all music apps
- **Fix**: Create AlbumsTab with grid layout

### 3. **No Artist View**  
- **Status**: Artist data collected but never displayed
- **Missing**: Artist list, artist detail page, songs by artist
- **Impact**: CRITICAL - Standard feature in all music apps
- **Fix**: Create ArtistsTab with list layout

### 4. **No Genre Support**
- **Status**: Genre data not even collected
- **Missing**: Genre filtering, genre browsing, genre detail pages
- **Impact**: HIGH - Common way to browse music
- **Fix**: Collect genre from MediaStore, create GenresTab

### 5. **No View Mode Toggle**
- **Status**: Only list view available
- **Missing**: Grid view, cover flow view
- **Impact**: HIGH - Standard UI feature
- **Fix**: Add ViewMode state and toggle button

### 6. **No Search**
- **Status**: No search functionality
- **Missing**: Search by title, artist, album
- **Impact**: CRITICAL - Essential for large libraries
- **Fix**: Add search bar with filter logic

### 7. **No Filters**
- **Status**: No filtering capability
- **Missing**: Filter by artist, album, genre, year, etc.
- **Impact**: HIGH - Essential for library navigation
- **Fix**: Add filter chips and filter logic

### 8. **No Tab Navigation**
- **Status**: Single flat list only
- **Missing**: Songs/Albums/Artists/Genres/Playlists tabs
- **Impact**: CRITICAL - Standard in all music apps
- **Fix**: Add TabRow with navigation

---

## 🎵 Player Features (Buttons Exist But Don't Work)

### 9. **No Playback Speed Control**
- **Status**: ExoPlayerService has method but no UI
- **Missing**: Speed selector (0.5x to 2x)
- **Impact**: MEDIUM - Useful for audiobooks-as-music
- **Fix**: Add speed control dialog

### 10. **No Working Equalizer**
- **Status**: Button exists, onClick is empty
- **Missing**: EQ presets, custom EQ bands
- **Impact**: HIGH - Users expect sound customization
- **Fix**: Implement EqualizerDialog with presets

### 11. **No Working Volume Control**
- **Status**: Button exists, onClick is empty
- **Missing**: Volume slider in player
- **Impact**: MEDIUM - Convenience feature
- **Fix**: Wire up volume slider to ExoPlayerService.setVolume()

### 12. **No Sleep Timer Integration**
- **Status**: SleepTimerManager exists but not integrated
- **Missing**: Sleep timer UI in player
- **Impact**: HIGH - Popular for bedtime listening
- **Fix**: Add sleep timer button and dialog

### 13. **No Working Favorites System**
- **Status**: Heart button exists, onClick is empty
- **Missing**: Save favorites, liked songs playlist
- **Impact**: CRITICAL - Essential user feature
- **Fix**: Implement favorites database and UI

### 14. **No Recently Played History**
- **Status**: PlaybackSession entity exists but no UI
- **Missing**: Recently played list, history view
- **Impact**: HIGH - Standard feature
- **Fix**: Query PlaybackSession and create history UI

### 15. **No Lyrics Display**
- **Status**: No lyrics support
- **Missing**: Synchronized or static lyrics display
- **Impact**: VERY HIGH - Extremely popular feature
- **Fix**: Add lyrics service and display UI

### 16. **No Smart Playlists**
- **Status**: Basic playlist infrastructure only
- **Missing**: Auto-generated playlists (Most Played, Recently Added, etc.)
- **Impact**: MEDIUM - Nice to have
- **Fix**: Implement smart playlist generator

### 17. **Gapless Playback Placeholder**
- **Status**: Method exists but not implemented
- **Missing**: Seamless album playback
- **Impact**: MEDIUM-HIGH - Important for albums
- **Fix**: Configure ExoPlayer for gapless

### 18. **Crossfade Placeholder**
- **Status**: Method exists but not implemented
- **Missing**: Fade between tracks
- **Impact**: MEDIUM - Nice to have
- **Fix**: Implement audio crossfade logic

### 19. **No Mini Player**
- **Status**: Only full-screen player
- **Missing**: Collapsed player bar while browsing
- **Impact**: HIGH - Standard in all music apps
- **Fix**: Create mini player composable

### 20. **No Working Share**
- **Status**: Share button exists, onClick is empty
- **Missing**: Share track info, file
- **Impact**: MEDIUM - Social feature
- **Fix**: Wire up Android share intent

### 21. **No Add to Playlist from Player**
- **Status**: Not visible in player
- **Missing**: Quick add to playlist button
- **Impact**: HIGH - Common workflow
- **Fix**: Add playlist selector dialog

---

## 📊 Missing Metadata & Display

### 22. **No Year/Decade Filtering**
- **Status**: Year data not collected
- **Missing**: Filter by year, decade view
- **Impact**: MEDIUM - Useful for organizing
- **Fix**: Collect YEAR from MediaStore

### 23. **No Album Artist Support**
- **Status**: Only ARTIST collected
- **Missing**: Compilation album support, album artist
- **Impact**: MEDIUM - Important for compilations
- **Fix**: Collect ALBUM_ARTIST from MediaStore

### 24. **No Disc Number Support**
- **Status**: Not collected or displayed
- **Missing**: Multi-disc album organization
- **Impact**: LOW-MEDIUM - Niche but important
- **Fix**: Collect DISC_NUMBER from MediaStore

### 25. **No Track Number Display**
- **Status**: Not collected or displayed
- **Missing**: Track order in albums
- **Impact**: MEDIUM - Important for album view
- **Fix**: Collect TRACK from MediaStore

### 26. **No Duration Display**
- **Status**: Not displayed in library
- **Missing**: Song length in track list
- **Impact**: MEDIUM - Useful information
- **Fix**: Collect and display DURATION

### 27. **No Play Count Tracking**
- **Status**: Not tracked or displayed
- **Missing**: Most played sorting, statistics
- **Impact**: MEDIUM - Nice for recommendations
- **Fix**: Implement play count tracking

### 28. **No Bitrate/Quality Display**
- **Status**: Not collected or displayed
- **Missing**: Audio quality indication
- **Impact**: LOW-MEDIUM - Useful for audiophiles
- **Fix**: Collect BITRATE from MediaStore

### 29. **No Recently Added Section**
- **Status**: Date added collected but not used
- **Missing**: Quick access to new music
- **Impact**: MEDIUM - Useful feature
- **Fix**: Add "Recently Added" filter

### 30. **No Jump to Current Song**
- **Status**: No navigation helper
- **Missing**: Quick return to playing track
- **Impact**: LOW-MEDIUM - Convenience
- **Fix**: Add "Go to current" button

---

## 🎨 UI/UX Enhancements

### 31. **No Swipe Gestures**
- **Status**: No gesture support
- **Missing**: Swipe to skip, swipe to dismiss
- **Impact**: MEDIUM - Modern UX expectation
- **Fix**: Add gesture handlers

### 32. **No Landscape Mode**
- **Status**: No specific landscape layout
- **Missing**: Optimized landscape UI
- **Impact**: LOW-MEDIUM - Device rotation support
- **Fix**: Add landscape-specific layouts

### 33. **No Dynamic Colors**
- **Status**: Static gradient only
- **Missing**: Colors from album art
- **Impact**: LOW - Nice visual touch
- **Fix**: Extract colors from album art

### 34. **No Folder View**
- **Status**: Can't browse by folder
- **Missing**: Folder-based browsing
- **Impact**: MEDIUM - Some users prefer this
- **Fix**: Add folder browsing mode

### 35. **No Drag & Drop Reordering**
- **Status**: Can't manually reorder queue
- **Missing**: Queue management via drag
- **Impact**: MEDIUM - Useful for queue control
- **Fix**: Implement drag-and-drop in queue

---

## Summary Statistics

**Total Missing Features**: 35
- **Critical**: 8 features
- **High Priority**: 11 features  
- **Medium Priority**: 13 features
- **Low Priority**: 3 features

**Features with existing infrastructure**: 15
**Features requiring new implementation**: 20

**Estimated Implementation Time**:
- Critical fixes: 3-4 days
- High priority: 3-4 days
- Medium priority: 4-5 days
- Low priority: 2-3 days
- **Total**: 12-16 days for complete implementation
