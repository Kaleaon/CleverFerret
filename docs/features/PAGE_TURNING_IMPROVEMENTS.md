# Page Turning Effects Implementation

## Overview
This document describes the enhanced page turning effects added to Clever Ferret, inspired by Moonreader's polished page turning experience.

## Features Implemented

### 1. Enhanced Curl Animation
The curl animation has been significantly improved with:
- **3D Perspective Transformation**: Realistic page curl using rotation and transform origin
- **Gradient Shadows**: Dynamic shadow gradients that follow the curling edge
- **Smooth Transitions**: Better alpha blending as the page curls
- **Configurable Intensity**: Adjustable curl intensity (0.5x to 2.0x)

### 2. Page Turn Controller System
A complete page turning system that handles:
- **Drag Gestures**: Horizontal drag to initiate page turns
- **Threshold Detection**: Configurable swipe threshold (10% to 90%)
- **Sound Effects**: Optional page turn sound (requires sound file in res/raw/)
- **Haptic Feedback**: Vibration on page turn (configurable)
- **Animation State**: Proper state management for turning, dragging, and idle states
- **Cancel Animation**: Smooth return animation if swipe is insufficient

### 3. Dual-Page Mode
Support for reading two pages side-by-side:
- **Automatic Detection**: Detects foldable devices and landscape orientation
- **Book-Style Background**: Optional book-style beige background with spine
- **Configurable Gap**: Adjustable gap between pages (0-24dp)
- **Landscape-Only Option**: Can be enabled only in landscape mode
- **Foldable Support**: Automatic detection for foldable devices

## Animation Types

All animation types from the original implementation are supported:

1. **NONE**: Instant page change
2. **SLIDE**: Horizontal slide transition
3. **FADE**: Cross-fade between pages
4. **CURL**: Realistic page curl (enhanced)
5. **FLIP_HORIZONTAL**: 3D horizontal flip
6. **FLIP_VERTICAL**: 3D vertical flip
7. **CUBE**: Cube rotation effect
8. **ACCORDION**: Accordion fold effect
9. **ZOOM**: Zoom in/out transition

## Integration Example

```kotlin
@Composable
fun EnhancedReaderWithPageTurns(
    bookFilePath: String,
    onBack: () -> Unit,
    viewModel: EnhancedEReaderViewModel
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    
    // Page turn settings
    var animationSettings by remember { 
        mutableStateOf(
            AnimationSettings(
                animation = PageTurnAnimation.CURL,
                duration = 300,
                swipeThreshold = 0.3f,
                enableHapticFeedback = true,
                showShadows = true,
                curlIntensity = 1.0f
            )
        )
    }
    
    // Page turn controller
    val pageTurnController = rememberPageTurnController(
        onPageTurn = { direction ->
            when (direction) {
                PageTurnDirection.FORWARD -> viewModel.nextChapter()
                PageTurnDirection.BACKWARD -> viewModel.previousChapter()
                else -> {}
            }
        },
        animationSettings = animationSettings,
        enableSound = true, // Requires page_turn.mp3 in res/raw/
        enableHaptic = true
    )
    
    // Dual-page settings
    var dualPageSettings by remember {
        mutableStateOf(
            DualPageSettings(
                enabled = false,
                onlyInLandscape = true,
                showBookStyleBackground = true
            )
        )
    }
    
    Box(modifier = Modifier.fillMaxSize()) {
        if (dualPageSettings.enabled) {
            // Dual-page mode
            DualPageReader(
                leftPage = {
                    ReadingContent(
                        content = uiState.currentChapterContent,
                        fontSize = fontSize,
                        fontFamily = fontFamily,
                        textColor = textColor
                    )
                },
                rightPage = {
                    ReadingContent(
                        content = uiState.nextChapterContent,
                        fontSize = fontSize,
                        fontFamily = fontFamily,
                        textColor = textColor
                    )
                },
                settings = dualPageSettings
            )
        } else {
            // Single page with animations
            PageTurnWrapper(
                currentPage = {
                    ReadingContent(
                        content = uiState.currentChapterContent,
                        fontSize = fontSize,
                        fontFamily = fontFamily,
                        textColor = textColor
                    )
                },
                nextPage = {
                    ReadingContent(
                        content = uiState.nextChapterContent,
                        fontSize = fontSize,
                        fontFamily = fontFamily,
                        textColor = textColor
                    )
                },
                previousPage = {
                    ReadingContent(
                        content = uiState.previousChapterContent,
                        fontSize = fontSize,
                        fontFamily = fontFamily,
                        textColor = textColor
                    )
                },
                controller = pageTurnController,
                animationSettings = animationSettings
            )
        }
    }
}
```

## Configuration Options

### AnimationSettings
- `animation`: Type of animation (PageTurnAnimation enum)
- `duration`: Animation duration in milliseconds (100-1000ms)
- `swipeThreshold`: Minimum swipe distance to trigger turn (0.1-0.9)
- `enableHapticFeedback`: Enable vibration on page turn
- `showShadows`: Show shadows in animations
- `curlIntensity`: Curl intensity multiplier (0.5-2.0)

### DualPageSettings
- `enabled`: Enable dual-page mode
- `onlyInLandscape`: Only show dual-page in landscape
- `showBookStyleBackground`: Show book-style beige background
- `pageGap`: Gap between pages in dp (0-24)
- `autoDetectFoldable`: Automatically detect foldable devices

## Sound Effects

To enable page turn sounds:
1. Add a sound file (e.g., `page_turn.mp3`) to `res/raw/`
2. Update `PageTurnController` to load the correct resource:
   ```kotlin
   mediaPlayer = MediaPlayer.create(context, R.raw.page_turn)
   ```
3. Set `enableSound = true` in `rememberPageTurnController`

## Moonreader-Inspired Features

These improvements bring Clever Ferret's page turning experience closer to Moonreader:

1. **Realistic Curl Animation**: Enhanced 3D curl effect similar to Moonreader
2. **Sound Feedback**: Optional page turn sounds
3. **Haptic Feedback**: Vibration on page turns
4. **Dual-Page Mode**: Support for foldable devices and landscape reading
5. **Book-Style Background**: Optional book-style appearance in dual-page mode
6. **Configurable Sensitivity**: Adjustable swipe threshold for different user preferences

## Performance Considerations

- Animations use Compose's graphicsLayer for hardware acceleration
- Sound playback is handled asynchronously to avoid blocking UI
- Haptic feedback uses system vibrator with proper API level checks
- Dual-page mode only renders when enabled to save resources

## Future Enhancements

1. **Custom Sound Library**: Multiple page turn sound options
2. **Animation Presets**: Pre-configured animation sets (Fast, Smooth, Realistic)
3. **Gesture Customization**: Customizable swipe zones and directions
4. **E-Ink Mode**: Disable animations for e-ink displays
5. **Page Turn Statistics**: Track page turn speed and preferences
