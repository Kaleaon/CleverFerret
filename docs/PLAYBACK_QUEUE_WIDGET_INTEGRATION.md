# Playback Queue, Artwork & Widget Integration

This document describes the scaffolding for integrating the playback queue, artwork loader, and homescreen widget to support both Plex and local media sources.

## Overview

This integration provides the foundation for displaying current media playback information on the Android homescreen via a widget, with support for:
- **Queue observability**: Reactive updates from UnifiedPlaybackQueueManager
- **Artwork loading**: Multi-source artwork loading with caching
- **Widget updates**: Homescreen widget displaying playback state

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                   UnifiedPlaybackQueueManager                 │
│  - currentQueue: StateFlow<PlaybackQueue?>                   │
│  - queueItems: StateFlow<List<QueueItem>>                    │
│  - currentItem: StateFlow<QueueItem?>                        │
│  - playbackState: StateFlow<UnifiedPlaybackState>            │
└───────────────────┬─────────────────────────────────────────┘
                    │ observes
                    ▼
┌─────────────────────────────────────────────────────────────┐
│              MediaPlaybackWidgetService                       │
│  - Combines queue state flows                                │
│  - Loads artwork via ArtworkLoader                           │
│  - Exposes widgetState: StateFlow<MediaPlaybackWidgetState>  │
│  - Handles widget action callbacks                           │
└───────────────────┬─────────────────────────────────────────┘
                    │ updates
                    ▼
┌─────────────────────────────────────────────────────────────┐
│         MediaPlaybackWidget (Glance - TODO - planned)         │
│  - Displays current media info                               │
│  - Shows artwork, title, artist                              │
│  - Playback controls (play/pause/next/previous)              │
└─────────────────────────────────────────────────────────────┘

                    │ loads artwork from
                    ▼
┌─────────────────────────────────────────────────────────────┐
│                    ArtworkLoader                              │
│  - Local file artwork (TODO: EPUB, MP3 ID3)                  │
│  - Plex server artwork URLs                                  │
│  - External URL loading                                      │
│  - Memory cache (LRU, 20% of available memory)               │
│  - Automatic downscaling                                     │
└─────────────────────────────────────────────────────────────┘
```

## Components

### 1. ArtworkLoader

**Location**: `services/artwork/ArtworkLoader.kt`

Multi-source artwork loading service with caching and downscaling.

**Features**:
- Loads artwork from local files, Plex servers, and external URLs
- Memory cache with LRU eviction (20% of available memory)
- Automatic bitmap downscaling for different use cases
- Async loading with coroutines
- Support for both MediaItem and PlexMediaItem

**Usage**:
```kotlin
// Inject the service
@Inject
lateinit var artworkLoader: ArtworkLoader

// Load artwork with downscaling
val bitmap = artworkLoader.loadArtwork(
    mediaItem = mediaItem,
    maxWidth = 256,
    maxHeight = 256
)

// Load Plex artwork
val plexBitmap = artworkLoader.loadPlexArtwork(
    plexItem = plexItem,
    plexServerUrl = "http://localhost:32400",
    plexToken = "your-token",
    maxWidth = 512,
    maxHeight = 512
)
```

**TODOs**:
- [ ] Implement artwork extraction from EPUB files (planned)
- [ ] Implement artwork extraction from MP3 ID3 tags (planned)
- [ ] Add disk cache for network-loaded artwork
- [ ] Add configurable cache size
- [ ] Add artwork preloading for queue items

### 2. MediaPlaybackWidgetState

**Location**: `widgets/MediaPlaybackWidgetState.kt`

Immutable state model representing the current widget display state.

**Properties**:
- `currentMedia`: Current MediaItem being played
- `title`, `subtitle`: Display text
- `artworkUri`: URI to cached artwork
- `isPlaying`, `isPaused`, `isBuffering`: Playback state
- `currentPositionMs`, `durationMs`: Playback position
- `queueSize`, `currentQueuePosition`: Queue information
- `isLoading`, `error`: Loading and error states

**Computed Properties**:
- `hasMedia`: Whether there's any media to display
- `canPlay`: Whether playback controls should be enabled
- `displayTitle`, `displaySubtitle`: Formatted display text
- `progressPercent`: Progress percentage (0-100)
- `formattedPosition`, `formattedDuration`: Time strings (MM:SS)
- `hasNextInQueue`, `hasPreviousInQueue`: Queue navigation

**Usage**:
```kotlin
// Create state from MediaItem
val state = MediaPlaybackWidgetState.fromMediaItem(
    mediaItem = mediaItem,
    isPlaying = true,
    currentPositionMs = 45000,
    durationMs = 180000
)

// Update state immutably
val newState = state.withPosition(50000)
    .withPlaybackState(playing = false, paused = true)
```

### 3. MediaPlaybackWidgetService

**Location**: `widgets/MediaPlaybackWidgetService.kt`

Service that observes the unified playback queue and updates widget state.

**Features**:
- Observes queue state changes from UnifiedPlaybackQueueManager
- Combines multiple state flows (currentItem, queueItems, playbackState)
- Loads artwork via ArtworkLoader (256x256 for widgets)
- Exposes StateFlow for widget updates
- Handles widget action callbacks (play/pause/next/previous)

**Usage**:
```kotlin
// Inject the service
@Inject
lateinit var widgetService: MediaPlaybackWidgetService

// Observe widget state
widgetService.widgetState.collect { state ->
    // Update widget UI
    updateWidgetUI(state)
}

// Handle user actions
widgetService.onPlayClicked()
widgetService.onPauseClicked()
widgetService.onNextClicked()
widgetService.onPreviousClicked()
```

**TODOs**:
- [ ] Implement actual widget update via Glance or RemoteViews
- [ ] Add error handling and retry logic for artwork loading
- [ ] Add preferences for widget customization
- [ ] Implement next/previous track playback in UnifiedPlaybackQueueManager

### 4. MediaPlaybackWidget

**Location**: `widgets/MediaPlaybackWidget.kt`

Scaffolding for Glance-based widget UI.

**Planned Features**:
- Display current media artwork
- Show title and artist/subtitle
- Play/pause button
- Previous/next track buttons
- Progress indicator
- Support for different widget sizes

**Future Implementation**:
```kotlin
object MediaPlaybackWidget : GlanceAppWidget() {
    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            MediaPlaybackWidgetContent()
        }
    }
}

@Composable
fun MediaPlaybackWidgetContent() {
    val state by widgetService.widgetState.collectAsState()
    
    Column {
        Image(bitmap = state.artworkBitmap)
        Text(text = state.displayTitle)
        Text(text = state.displaySubtitle)
        Row {
            Button(onClick = { onPreviousClicked() })
            Button(onClick = { if (state.isPlaying) onPauseClicked() else onPlayClicked() })
            Button(onClick = { onNextClicked() })
        }
    }
}
```

**TODOs**:
- [ ] Enable Glance dependencies in build.gradle.kts
- [ ] Implement Glance composable UI
- [ ] Wire up click actions to MediaPlaybackWidgetService
- [ ] Add configuration activity for widget customization

### 5. MediaPlaybackWidgetReceiver

**Location**: `widgets/MediaPlaybackWidgetReceiver.kt`

Basic AppWidgetProvider for widget lifecycle management.

**Features**:
- Handles widget lifecycle events (onUpdate, onEnabled, onDisabled, onDeleted)
- Intent action handlers (play/pause/next/previous)
- Logging for debugging

**Future Migration to Glance**:
```kotlin
class MediaPlaybackWidgetReceiver : GlanceAppWidgetReceiver() {
    override val glanceAppWidget: GlanceAppWidget = MediaPlaybackWidget
}
```

**AndroidManifest.xml Registration** (to be added):
```xml
<receiver 
    android:name=".widgets.MediaPlaybackWidgetReceiver"
    android:exported="true">
    <intent-filter>
        <action android:name="android.appwidget.action.APPWIDGET_UPDATE" />
    </intent-filter>
    <meta-data 
        android:name="android.appwidget.provider"
        android:resource="@xml/media_playback_widget_info" />
</receiver>
```

**Widget Configuration XML** (to be created at `res/xml/media_playback_widget_info.xml`):
```xml
<appwidget-provider xmlns:android="http://schemas.android.com/apk/res/android"
    android:description="@string/media_playback_widget_description"
    android:initialLayout="@layout/media_playback_widget"
    android:minWidth="250dp"
    android:minHeight="110dp"
    android:targetCellWidth="4"
    android:targetCellHeight="2"
    android:resizeMode="horizontal|vertical"
    android:updatePeriodMillis="0"
    android:widgetCategory="home_screen" />
```

## Integration with MediaNotificationService

**Location**: `services/media/MediaNotificationService.kt`

The notification service has been updated to support artwork loading:

```kotlin
@Inject
lateinit var artworkLoader: ArtworkLoader

fun updateNotificationWithArtwork(
    mediaItem: MediaItem,
    title: String,
    artist: String? = null,
    album: String? = null,
    isPlaying: Boolean = false
) {
    serviceScope.launch {
        // Load artwork with notification-appropriate size (512x512)
        val artwork = artworkLoader.loadArtwork(
            mediaItem = mediaItem,
            maxWidth = 512,
            maxHeight = 512
        )
        
        updateNotification(title, artist, album, artwork, isPlaying)
    }
}
```

## Dependency Injection

**Location**: `di/AppModule.kt`

Added OkHttpClient provider for ArtworkLoader:

```kotlin
@Provides
@Singleton
fun provideOkHttpClient(): OkHttpClient {
    return OkHttpClient.Builder()
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .writeTimeout(30, TimeUnit.SECONDS)
        .build()
}
```

All services are automatically provided via Hilt's `@Inject` and `@Singleton` annotations.

## Testing

**Location**: `test/services/artwork/ArtworkLoaderTest.kt`

Basic test structure with 9 test cases:
- Cache initialization and clearing
- Null returns for missing artwork
- Cache key generation consistency
- Remove cached artwork

**Existing Test**: `test/widgets/MediaPlaybackWidgetStateTest.kt`

Comprehensive tests for MediaPlaybackWidgetState with 7 test cases covering:
- Empty state defaults
- Media type display formatting
- Loading and error states
- Computed properties

## Build Configuration

**Location**: `CleverFerret/build.gradle.kts`

Added dependencies:
```kotlin
// Media3 session for enhanced media controls
implementation("androidx.media3:media3-session:1.4.1")

// Glance for widgets - TODO: Enable when ready for full widget implementation
// implementation("androidx.glance:glance-appwidget:1.1.0")
// implementation("androidx.glance:glance-material3:1.1.0")
```

## Data Flow

### Queue State → Widget State

```
UnifiedPlaybackQueueManager
  ├─ currentItem: StateFlow<QueueItem?>
  ├─ queueItems: StateFlow<List<QueueItem>>
  └─ playbackState: StateFlow<UnifiedPlaybackState>
         │
         │ combine()
         ▼
MediaPlaybackWidgetService
  ├─ Load MediaItem from database
  ├─ Load artwork via ArtworkLoader (256x256)
  └─ Build MediaPlaybackWidgetState
         │
         │ StateFlow
         ▼
MediaPlaybackWidget (Glance UI)
  └─ Display current state
```

### User Action → Queue Manager

```
Widget Button Click
         │
         ▼
MediaPlaybackWidgetReceiver
  └─ onReceive(ACTION_PLAY/PAUSE/NEXT/PREVIOUS)
         │
         ▼
MediaPlaybackWidgetService
  └─ onPlayClicked() / onPauseClicked() / etc.
         │
         ▼
UnifiedPlaybackQueueManager
  └─ play() / pause() / next() / previous()
         │
         ▼
ExoPlayerService
  └─ Actual playback control
```

## Known Limitations

1. **Pre-existing compilation errors**: The project has compilation errors in other components (CalibreImportService, SecurityAndAboutScreens, WebFictionViewModel) that are unrelated to this scaffolding.

2. **Glance dependencies commented**: Glance dependencies are commented out in build.gradle.kts until the widget UI is ready for full implementation.

3. **Artwork extraction not implemented**: Loading artwork from media file metadata (EPUB, MP3 ID3 tags) is not yet implemented. Currently returns null for local media items.

4. **No disk cache**: ArtworkLoader uses only memory cache. Network-loaded artwork is not persisted to disk.

5. **Next/Previous not fully implemented**: Widget service has placeholder implementations for next/previous track that log but don't actually change the playback queue.

## Next Steps

### Phase 1: Complete Artwork Loading
- [ ] Implement EPUB cover extraction
- [ ] Implement MP3 ID3 tag artwork extraction
- [ ] Add disk cache for network artwork
- [ ] Add artwork preloading for queue items

### Phase 2: Widget UI Implementation
- [ ] Enable Glance dependencies
- [ ] Create Glance composable UI
- [ ] Implement RemoteViews fallback for older Android versions
- [ ] Add widget configuration activity
- [ ] Create widget XML resources

### Phase 3: Queue Management
- [ ] Implement next() in UnifiedPlaybackQueueManager
- [ ] Implement previous() in UnifiedPlaybackQueueManager
- [ ] Add queue reordering support
- [ ] Add shuffle and repeat modes

### Phase 4: Testing & Polish
- [ ] Complete unit tests for ArtworkLoader
- [ ] Add integration tests for queue → widget flow
- [ ] Add UI tests for widget interactions
- [ ] Performance testing and optimization
- [ ] Add widget preview images

### Phase 5: Advanced Features
- [ ] Multiple widget sizes
- [ ] Widget customization options
- [ ] Material You theming
- [ ] Progress indicator on widget
- [ ] Quick settings tile integration

## References

- Issue #124: Widget and playback integration
- Issue #128: Queue management
- Issue #120: Artwork handling
- `docs/widgets/MEDIA_PLAYBACK_WIDGET.md`: Original widget documentation
- `ARCHITECTURE.md`: Overall app architecture
