# Reading Experience Enhancements

This document describes the reading enhancements inspired by [LibreraReader](https://github.com/foobnix/LibreraReader) that have been integrated into CleverFerret to improve the book, magazine, and comic reading experience.

## Overview

CleverFerret has integrated several advanced reading features from LibreraReader, a popular open-source ebook reader, while maintaining full compatibility with existing functionality. These enhancements provide a more customizable and comfortable reading experience across all media types.

## New Features

### 1. ComicInfo.xml Metadata Parser

**Location**: `com.universalmedialibrary.utils.ComicInfoParser`

Automatically extracts rich metadata from comic book archives (CBZ/CBR) that include ComicInfo.xml files.

#### Supported Fields:
- **Basic Info**: Title, Series, Number, Summary
- **Credits**: Writer, Penciller, Inker, Colorist, Letterer, Cover Artist, Editor
- **Publication**: Publisher, Genre, Year, Month, Day
- **Technical**: Page Count, Language, Format, Age Rating, Community Rating

#### Usage:

```kotlin
// Extract metadata from a comic archive
val comicInfo = ComicArchiveUtils.extractComicInfo(context, uri, fileName)

comicInfo?.let {
    println("Title: ${it.title}")
    println("Writer: ${it.writer}")
    println("Series: ${it.series} #${it.number}")
    println("Summary: ${it.summary}")
}
```

#### Benefits:
- Automatic metadata detection without manual entry
- Consistent with Calibre and other comic readers
- Improves library organization and search
- Provides rich context for readers

### 2. Reading Ruler

**Location**: `com.universalmedialibrary.ui.reader.components.ReadingRulerComponent`

A visual guide that highlights a specific line or section of text, helping readers focus and reducing eye strain during long reading sessions.

#### Features:
- Adjustable position via drag gesture
- Customizable height (default: 60dp)
- Configurable transparency and color
- Smooth overlay transitions

#### Usage:

```kotlin
var rulerEnabled by remember { mutableStateOf(false) }
var rulerPosition by remember { mutableStateOf(0.5f) }

Box(modifier = Modifier.fillMaxSize()) {
    // Your reading content here
    
    ReadingRuler(
        enabled = rulerEnabled,
        rulerPosition = rulerPosition,
        rulerHeight = 60.dp,
        rulerColor = Color.Gray,
        rulerAlpha = 0.3f,
        onPositionChange = { rulerPosition = it }
    )
}
```

#### Benefits:
- Helps maintain reading position
- Reduces eye strain
- Useful for dyslexic readers
- Improves focus during speed reading

### 3. RSVP Reader (Rapid Serial Visual Presentation)

**Location**: `com.universalmedialibrary.ui.reader.components.RsvpReader`

Speed reading mode that displays words one at a time at a fixed position, minimizing eye movement and enabling faster reading comprehension.

#### Features:
- Configurable reading speed (100-600 WPM)
- Optimal Recognition Point (ORP) highlighting
- Play/pause controls
- Progress tracking
- Word-by-word navigation
- Preset speed options (Slow, Normal, Fast, Ultra)

#### Usage:

```kotlin
RsvpReader(
    text = bookText,
    wordsPerMinute = 250,
    fontSize = 32.sp,
    onComplete = { /* Reading finished */ },
    onClose = { /* Close RSVP mode */ }
)
```

#### ORP Algorithm:
The system automatically calculates the optimal recognition point for each word:
- 1 character words: position 0
- 2-4 character words: position 1
- 5-8 character words: position 2
- 9-12 character words: position 3
- Longer words: approximately 1/3 from start

#### Benefits:
- Significantly faster reading speeds
- Reduced eye strain and fatigue
- Improved focus and comprehension
- Eliminates regression and subvocalization
- Perfect for reviewing or skimming content

### 4. Enhanced Auto-Scroll

**Location**: `com.universalmedialibrary.ui.reader.components.EnhancedAutoScroll`

Smooth, automatic scrolling with fine-grained speed control, ideal for hands-free reading (musician mode).

#### Features:
- Speed range: 0.1x to 5.0x
- Preset speeds: Slow (0.5x), Normal (1.0x), Fast (2.0x), Ultra (3.0x)
- Smooth 60fps scrolling
- Play/pause controls
- Quick speed adjustment buttons
- Expandable settings panel

#### Usage:

```kotlin
val autoScrollState = rememberAutoScrollState()

// Display controls
EnhancedAutoScrollControls(
    isScrolling = autoScrollState.isScrolling,
    scrollSpeed = autoScrollState.speed,
    onScrollToggle = { autoScrollState.toggle() },
    onSpeedChange = { autoScrollState.updateSpeed(it) }
)

// Apply scrolling effect
AutoScrollEffect(
    enabled = autoScrollState.isScrolling,
    speed = autoScrollState.speed,
    onScroll = { delta ->
        // Scroll your content by delta pixels
        scrollState.animateScrollBy(delta)
    }
)
```

#### Benefits:
- Hands-free reading
- Consistent reading pace
- Perfect for presentations or shared reading
- Reduces manual scrolling fatigue
- Musicians can read sheet music without touching device

### 5. Comprehensive Color Schemes

**Location**: `com.universalmedialibrary.ui.reader.components.ReaderColorSchemes`

14 professionally designed color schemes optimized for different lighting conditions and reader preferences.

#### Available Schemes:

**Day Modes** (4 schemes):
- Classic Day: White background, black text
- Warm Day: Cornsilk background for warmer tone
- Paper Day: Ivory background mimicking paper
- High Contrast Day: Maximum contrast for visibility

**Sepia Modes** (2 schemes):
- Sepia: Traditional sepia tones
- Dark Sepia: Deeper sepia for reduced brightness

**Night Modes** (7 schemes):
- Classic Night: Black background, gray text
- Dark Gray: Softer than pure black
- OLED Black: Pure black for OLED displays
- Midnight Blue: Blue-tinted dark mode
- Dark Green: Green-tinted for reduced eye strain
- Amber Night: Warm amber tones
- High Contrast Night: Maximum contrast in dark

#### Usage:

```kotlin
// Quick mode selection
var themeMode by remember { mutableStateOf(ReaderThemeMode.DAY) }
val colorScheme = themeMode.getDefaultScheme()

// Or specific scheme selection
val colorScheme = ReaderColorScheme.OLED

// Apply colors
Box(
    modifier = Modifier
        .fillMaxSize()
        .background(colorScheme.backgroundColor)
) {
    Text(
        text = content,
        color = colorScheme.textColor
    )
    
    // Links use scheme's link color
    ClickableText(
        text = linkText,
        style = TextStyle(color = colorScheme.linkColor)
    )
}
```

#### Color Psychology:
- **Warm tones**: Reduce blue light, better for evening reading
- **Sepia**: Mimics aged paper, comfortable for long sessions
- **Dark modes**: Reduce eye strain in low light
- **OLED**: Saves battery on OLED displays
- **High contrast**: Improves accessibility

## Integration Guidelines

### For UI Developers

1. **Reading Screens**: Consider adding RSVP mode as an alternative reading option
2. **Settings**: Expose color scheme selection in reader settings
3. **Comic Readers**: Integrate ComicInfo parser for automatic metadata
4. **Long Documents**: Add auto-scroll and ruler for enhanced reading
5. **Accessibility**: Use high-contrast schemes for accessibility features

### For Feature Development

All new features are:
- **Self-contained**: Can be used independently
- **Composable**: Built with Jetpack Compose
- **Customizable**: Support theming and configuration
- **Compatible**: Work alongside existing features
- **Tested**: Include unit tests where applicable

### Compatibility Notes

These enhancements maintain full compatibility with:
- Existing reader screens (EPUB, PDF, Comic)
- Current theming system
- Calibre library imports
- All media types (books, magazines, comics)
- TTS integration
- Bookmark systems
- Reading statistics

## Performance Considerations

- **RSVP Reader**: Minimal memory usage, processes text on-demand
- **Auto-Scroll**: 60fps smooth scrolling with minimal CPU
- **Reading Ruler**: GPU-accelerated Canvas rendering
- **Color Schemes**: Compile-time constants, zero runtime overhead
- **ComicInfo Parser**: Parses XML only once during import

## Future Enhancements

Potential additions based on LibreraReader features:
- Custom CSS injection for advanced text styling
- TTS integration with RSVP mode
- Bookmark export/import with LibreraReader format
- Reading statistics and goals
- Advanced gesture controls
- Brightness/contrast filters
- Text reflow improvements

## Credits

These enhancements are inspired by [LibreraReader](https://github.com/foobnix/LibreraReader) by Ivan Ivanenko (foobnix), a comprehensive open-source ebook reader. The implementations in CleverFerret are original code designed to work within the CleverFerret architecture while maintaining the spirit and usability of the original features.

## License Compatibility

LibreraReader is licensed under GPL v3+. The enhancements in CleverFerret are:
- Original implementations inspired by LibreraReader's features
- Designed specifically for CleverFerret's Compose-based architecture
- Compatible with CleverFerret's licensing
- Do not include any direct code from LibreraReader

## References

- [LibreraReader GitHub](https://github.com/foobnix/LibreraReader)
- [ComicInfo.xml Specification](https://anansi-project.github.io/docs/comicinfo/schemas/v2.0)
- [RSVP Reading Research](https://en.wikipedia.org/wiki/Rapid_serial_visual_presentation)
- [Optimal Recognition Point Study](https://en.wikipedia.org/wiki/Eye_tracking)
