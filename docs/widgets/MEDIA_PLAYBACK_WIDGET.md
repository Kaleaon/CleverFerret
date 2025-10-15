# CleverFerret Media Playback Widget

## Overview

The CleverFerret Media Playback Widget is a modern Android homescreen widget built with **Jetpack Glance** that provides quick access to media playback controls and "Now Playing" information. The widget supports all media types in CleverFerret including books/audiobooks, music, movies, TV shows, and podcasts.

## Features

### 🎨 **Visual Design**
- **Dynamic Color Theming**: Background colors automatically change based on media type
  - 🟢 **Books/eBooks**: Green gradient (`#2C5F2D`)
  - 🟣 **Music**: Purple gradient (`#7B1FA2`) 
  - 🔵 **Movies/TV**: Blue gradient (`#1565C0`)
  - 🟠 **Podcasts**: Orange gradient (`#EF6C00`)
  - ⚫ **Default**: Gray gradient (`#455A64`)

- **Gradient Scrim**: Semi-transparent black overlay (30% opacity) for text legibility
- **Material 3 Design**: Modern typography and spacing consistent with Android 14

### 🎮 **Playback Controls**
- **Previous**: Skip to previous track/chapter
- **Play/Pause**: Toggle playback with dynamic icon
- **Next**: Skip to next track/chapter
- **Tap to Open**: Tap anywhere on widget to open main app

### ♿ **Accessibility Features**
- **48dp Minimum Touch Targets**: All control buttons meet accessibility guidelines
- **56dp Primary Action**: Play/pause button has larger touch area for easier access
- **High Contrast**: White text/icons on colored backgrounds with scrim overlay
- **Clear Visual Hierarchy**: Title (16sp bold), subtitle (14sp), controls (18-24sp)

### 📱 **Responsive Design**
- **Minimum Size**: 250dp × 110dp (4×2 cells)
- **Scalable Layout**: Automatically adapts to different widget sizes
- **Content Priority**: Shows most important information (title, play/pause) first

## Technical Architecture

### Core Components

#### 1. **MediaPlaybackWidget** (Glance Composable)
```kotlin
object MediaPlaybackWidget : GlanceAppWidget()
```
- Main widget implementation using Jetpack Glance
- Renders UI based on stored preferences
- Handles click actions through callback system

#### 2. **MediaPlaybackWidgetReceiver** (AppWidgetProvider)
```kotlin  
class MediaPlaybackWidgetReceiver : GlanceAppWidgetReceiver()
```
- System integration point for widget lifecycle
- Registers widget with Android system

#### 3. **MediaPlaybackWidgetService** (State Manager)
```kotlin
@Singleton
class MediaPlaybackWidgetService @Inject constructor(...)
```
- Observes MediaPlayerService state changes
- Updates widget preferences when media changes
- Handles widget action callbacks

#### 4. **MediaPlaybackWidgetState** (Data Model)
```kotlin
data class MediaPlaybackWidgetState(...)
```
- Represents current widget state
- Provides computed properties for display logic

### State Management

The widget uses Android's **DataStore Preferences** for state persistence:

```kotlin
// Widget state keys
CURRENT_TITLE = stringPreferencesKey("current_title")
CURRENT_SUBTITLE = stringPreferencesKey("current_subtitle") 
IS_PLAYING = booleanPreferencesKey("is_playing")
MEDIA_TYPE = stringPreferencesKey("media_type")
ARTWORK_URI = stringPreferencesKey("artwork_uri")
```

### Media Type Detection

The widget automatically formats content based on media type:

| Media Type | Display Title | Display Subtitle |
|------------|---------------|------------------|
| `BOOK`, `EBOOK` | Filename (no extension) | "Book" |
| `MUSIC_TRACK`, `MUSIC_ALBUM` | Track name | "Music" |
| `MOVIE` | Movie title | "Movie" |
| `TV_SHOW` | Episode title | "TV Show" |
| `PODCAST_EPISODE` | Episode title | "Podcast" |

## Installation & Configuration

### AndroidManifest.xml Registration

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

### Widget Configuration (`res/xml/media_playback_widget_info.xml`)

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

### Dependency Injection Setup

```kotlin
@Provides
@Singleton
fun provideMediaPlaybackWidgetService(
    @ApplicationContext context: Context,
    universalMediaPlayerService: UniversalMediaPlayerService
): MediaPlaybackWidgetService {
    return MediaPlaybackWidgetService(context, universalMediaPlayerService)
}
```

## Usage Examples

### Adding Widget to Home Screen

1. Long-press on Android home screen
2. Tap "Widgets" 
3. Find "CleverFerret" section
4. Select "Media Playback Controls"
5. Drag to desired location

### Programmatic Widget Updates

```kotlin
// Update widget state from service
suspend fun updateWidgetWithCurrentMedia(mediaItem: MediaItem, isPlaying: Boolean) {
    val glanceIds = GlanceAppWidgetManager(context)
        .getGlanceIds(MediaPlaybackWidget::class.java)
    
    glanceIds.forEach { glanceId ->
        updateAppWidgetState(context, glanceId) { prefs ->
            prefs.toMutablePreferences().apply {
                this[CURRENT_TITLE] = mediaItem.displayTitle
                this[CURRENT_SUBTITLE] = mediaItem.displaySubtitle
                this[IS_PLAYING] = isPlaying
                this[MEDIA_TYPE] = mediaItem.mediaType
            }
        }
        MediaPlaybackWidget.update(context, glanceId)
    }
}
```

## Performance Considerations

### Update Throttling
- Widget updates are triggered only on media state changes
- Maximum update frequency: 1 Hz (once per second) as per requirements
- Batch updates when multiple properties change simultaneously

### Memory Management
- Uses lightweight DataStore preferences instead of complex serialization
- Minimal state storage (strings, booleans only)
- No bitmap caching in widget (artwork URLs only)

### Battery Optimization
- Widget updates are passive (triggered by media service, not polling)
- Uses efficient Glance rendering system
- Minimal background processing

## Testing

### Unit Tests
```kotlin
class MediaPlaybackWidgetStateTest {
    @Test
    fun `test book media displays correct title and subtitle`() {
        val bookMedia = MediaItem(mediaType = "BOOK", fileName = "Great Novel.epub")
        val state = MediaPlaybackWidgetState(currentMedia = bookMedia)
        
        assertEquals("Great Novel", state.displayTitle)
        assertEquals("Book", state.displaySubtitle)
    }
}
```

### Manual Testing Checklist
- [ ] Widget appears in Android widget picker
- [ ] Widget displays "No Media Playing" when idle
- [ ] Background color changes with media type
- [ ] Play/pause button updates correctly
- [ ] Tap to open launches main app
- [ ] Text remains legible on all backgrounds
- [ ] Touch targets are accessible (48dp minimum)

## Troubleshooting

### Common Issues

**Widget not appearing in picker**
- Verify AndroidManifest.xml registration
- Check widget info XML syntax
- Ensure minimum SDK version (API 36+)

**Widget shows blank content**
- Check DataStore preferences are being written
- Verify Glance dependency versions
- Test with simple static content first

**Accessibility issues**
- Validate touch target sizes (48dp minimum)
- Test with TalkBack enabled
- Ensure sufficient color contrast

**Performance problems**
- Monitor update frequency
- Check for memory leaks in service
- Profile with Android Studio

## Future Enhancements

### Planned Features
- [ ] **Artwork Display**: Full-bleed album/book cover backgrounds
- [ ] **Dynamic Sizing**: Small/medium/large widget variants
- [ ] **Material You Integration**: System color theming
- [ ] **Progress Indicator**: Playback position/chapter progress
- [ ] **Quick Actions**: Volume, shuffle, repeat controls

### Architecture Improvements
- [ ] **MediaSession Integration**: Full Android Media API support
- [ ] **Artwork Caching**: Pre-scaled image optimization
- [ ] **Configuration UI**: User-customizable widget options
- [ ] **Multiple Widgets**: Support for different widget instances

## Dependencies

```kotlin
// Jetpack Glance
implementation("androidx.glance:glance-appwidget:1.0.0")
implementation("androidx.glance:glance-material3:1.0.0")

// Existing CleverFerret dependencies
implementation("com.google.dagger:hilt-android:2.50")
implementation("androidx.compose:compose-bom:2024.05.00")
```

## Resources

- [Jetpack Glance Documentation](https://developer.android.com/jetpack/compose/glance)
- [Android Widget Guidelines](https://developer.android.com/develop/ui/views/appwidgets)
- [Material Design 3 Specifications](https://m3.material.io/)
- [Accessibility Best Practices](https://developer.android.com/guide/topics/ui/accessibility)

---

*This widget implementation provides a solid foundation for media playback control and can be extended with additional features as the CleverFerret ecosystem grows.*