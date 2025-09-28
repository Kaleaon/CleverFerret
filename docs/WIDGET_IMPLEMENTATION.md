# Jetpack Glance Homescreen Widget Implementation

## Overview

CleverFerret now includes a modern Jetpack Glance homescreen widget that provides media playback controls and Now Playing information directly from the Android homescreen. The widget supports all media types (books, audiobooks, music, movies, podcasts) with a responsive design that adapts to different widget sizes.

## Features

### 🎨 Visual Design
- **Full-bleed artwork background** with media cover art or fallback colors
- **Gradient scrim overlay** for text legibility (transparent to 60% black)
- **Material You theming** with dynamic colors based on media type
- **Responsive layouts** for small (100x100dp), medium (250x100dp), and large (250x150dp) sizes

### 🎵 Media Support
- **Universal media types**: Books, Audiobooks, Music, Movies, Podcasts
- **Dynamic metadata**: Title, artist/author display with proper truncation
- **Artwork handling**: Pre-scaled images with content URI support
- **Fallback colors**: Media type-specific colors when artwork unavailable

### 🎛️ Controls
- **Play/Pause button** with loading state animation
- **Skip Previous/Next** buttons (future enhancement)
- **Progress indication** (large widget only)
- **Tap-to-open** app functionality

### ♿ Accessibility
- **48dp minimum tap targets** following Material Design guidelines
- **Content descriptions** for all interactive elements
- **High contrast** text with gradient scrim
- **Screen reader compatibility**

## Architecture

### Core Components

```
com.universalmedialibrary.widget/
├── MediaWidgetState.kt              # State data classes
├── MediaWidgetStateManager.kt       # Full state manager (future)
├── MediaWidgetSimpleStateManager.kt # Simple state manager (current)
├── MediaWidgetGlanceAppWidget.kt    # Main Glance widget
├── MediaWidgetLayout.kt             # UI layouts and components
└── MediaWidgetActions.kt            # Action callbacks
```

### State Management

```kotlin
data class MediaWidgetState(
    val title: String = "",
    val artist: String = "",
    val isPlaying: Boolean = false,
    val hasMedia: Boolean = false,
    val mediaType: MediaType = MediaType.UNKNOWN,
    val artworkUri: String? = null,
    val artworkBitmap: Bitmap? = null,
    val duration: Long = 0L,
    val position: Long = 0L,
    val canSkipPrevious: Boolean = false,
    val canSkipNext: Boolean = false,
    val isLoading: Boolean = false,
    val error: String? = null
)
```

### Widget Sizes

| Size | Dimensions | Features |
|------|------------|----------|
| **Small** | 100×100dp | Artwork + Play/Pause only |
| **Medium** | 250×100dp | + Title/Artist + Basic controls |
| **Large** | 250×150dp | + Progress bar + Full controls |

## Implementation Details

### Jetpack Glance Benefits
- **Modern API**: Compose-like syntax for widget development
- **Better performance**: Optimized rendering and updates
- **Material You integration**: Automatic theming support
- **Responsive design**: Built-in size adaptation
- **Future-proof**: Google's recommended widget framework

### Performance Optimizations
- **Pre-scaled artwork**: Images scaled to widget size before display
- **Throttled updates**: Maximum 1Hz update frequency
- **Efficient state management**: StateFlow-based reactive updates
- **Memory optimization**: Bitmap recycling and caching

### Dynamic Color System
```kotlin
private fun getMediaTypeColor(mediaType: MediaType): Color {
    return when (mediaType) {
        MediaType.BOOK -> Color(0xFF4CAF50)        // Green
        MediaType.AUDIOBOOK -> Color(0xFF2196F3)   // Blue  
        MediaType.MUSIC -> Color(0xFFFF9800)       // Orange
        MediaType.MOVIE -> Color(0xFF9C27B0)       // Purple
        MediaType.PODCAST -> Color(0xFF607D8B)     // Blue Grey
        MediaType.UNKNOWN -> Color(0xFF757575)     // Grey
    }
}
```

## Usage

### Adding the Widget
1. Long-press on Android homescreen
2. Tap "Widgets"
3. Find "Clever Ferret" section
4. Select "Media Controls" widget
5. Choose desired size and place on homescreen

### Widget Behavior
- **No media**: Shows app icon with "Tap to open" message
- **Media playing**: Shows artwork, title, artist, and controls
- **Loading state**: Shows spinner icon while buffering
- **Error state**: Shows error indicator with tap-to-open

### Widget Actions
- **Play/Pause**: Toggle playback state
- **Skip Previous/Next**: Navigate tracks (future enhancement)
- **Tap background**: Open CleverFerret app
- **Long-press**: Android widget configuration menu

## Future Enhancements

### Phase 2: Full Integration
- [ ] Connect to `UniversalMediaPlayerService`
- [ ] Real-time state synchronization
- [ ] Hilt dependency injection for widgets
- [ ] MediaSession integration
- [ ] Notification sync

### Phase 3: Advanced Features
- [ ] Skip Previous/Next functionality
- [ ] Progress bar seeking
- [ ] Multiple widget instances
- [ ] Widget configuration activity
- [ ] Queue/playlist display

### Phase 4: Polish
- [ ] Advanced animations
- [ ] Custom artwork effects
- [ ] Widget themes
- [ ] Accessibility improvements
- [ ] RTL support

## Technical Notes

### Dependencies Added
```kotlin
// Jetpack Glance for modern app widgets
implementation("androidx.glance:glance-appwidget:1.1.0")
implementation("androidx.glance:glance-material3:1.1.0")
```

### Manifest Registration
```xml
<receiver
    android:name=".widget.MediaWidgetReceiver"
    android:exported="false">
    <intent-filter>
        <action android:name="android.appwidget.action.APPWIDGET_UPDATE" />
    </intent-filter>
    <meta-data
        android:name="android.appwidget.provider"
        android:resource="@xml/media_widget_info" />
</receiver>
```

### Widget Provider Configuration
- **Update period**: Manual updates only (0ms)
- **Resize mode**: Horizontal and vertical
- **Target cells**: 4×2 (medium size)
- **Categories**: Home screen widgets
- **Preview layouts**: Initial, keyguard, and picker preview

## Testing

The widget implementation includes comprehensive unit tests:

```bash
./gradlew testDebugUnitTest
```

Tests cover:
- State management and data classes
- Widget actions and callbacks
- Media type handling
- Progress calculations
- Error states and edge cases

## Design Philosophy

The widget follows CleverFerret's design principles:
- **Minimal and elegant**: Clean interface focused on essential controls
- **Universal media support**: Works with all supported media types
- **Performance-first**: Optimized for battery and memory usage
- **Accessibility-conscious**: Inclusive design for all users
- **Future-ready**: Architecture designed for easy enhancement

The implementation provides a solid foundation that can be enhanced with additional features while maintaining excellent performance and user experience.