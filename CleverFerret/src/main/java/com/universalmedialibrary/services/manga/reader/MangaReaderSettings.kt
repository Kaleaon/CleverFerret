package com.universalmedialibrary.services.manga.reader

import kotlinx.serialization.Serializable

/**
 * Manga Reader Settings
 * 
 * Comprehensive settings for manga/webtoon reading experience
 * Inspired by Futon/Kotatsu reader settings
 */
@Serializable
data class MangaReaderSettings(
    // Reading Mode
    val readerMode: ReaderMode = ReaderMode.STANDARD,
    val readingDirection: ReadingDirection = ReadingDirection.LTR,
    
    // Page Display
    val zoomMode: ZoomMode = ZoomMode.FIT_WIDTH,
    val doublePage: Boolean = false,
    val keepScreenOn: Boolean = true,
    val showPageNumbers: Boolean = true,
    
    // Page Cropping (edge detection)
    val cropBorders: Boolean = true,
    val cropBordersWebtoon: Boolean = false,
    val cropBordersThreshold: Float = 0.15f, // % of white/black to consider as border
    
    // Background & Color
    val backgroundColor: ReaderBackground = ReaderBackground.DEFAULT,
    val colorFilter: ColorFilterSettings? = null,
    val use32BitColor: Boolean = false,
    
    // Navigation
    val tapNavigation: Boolean = true,
    val tapZones: TapZoneConfig = TapZoneConfig.DEFAULT,
    val volumeKeysNavigation: Boolean = false,
    val swipeNavigation: Boolean = true,
    
    // Webtoon-specific
    val webtoonGapBetweenPages: Int = 0, // dp
    val webtoonSidePadding: Int = 0, // dp
    val webtoonScrollSpeed: Float = 1.0f,
    
    // Animation
    val pageTransitionAnimation: PageAnimation = PageAnimation.SLIDE,
    val animationDuration: Int = 300,
    
    // Auto-scroll
    val autoScrollEnabled: Boolean = false,
    val autoScrollSpeed: Float = 1.0f, // pages per minute
    
    // Preloading
    val preloadPages: Int = 3,
    val cachePages: Int = 10
)

/**
 * Reader mode
 */
enum class ReaderMode {
    STANDARD,      // Single page at a time
    WEBTOON,       // Continuous vertical scroll
    DOUBLE_PAGE,   // Two pages side by side (tablet)
    REVERSED,      // Right to left (manga)
    CONTINUOUS_VERTICAL,
    CONTINUOUS_HORIZONTAL
}

/**
 * Reading direction
 */
enum class ReadingDirection {
    LTR,  // Left to right (western comics)
    RTL,  // Right to left (manga)
    TTB,  // Top to bottom (webtoon)
    BTT   // Bottom to top (rare)
}

/**
 * Zoom/fit mode
 */
enum class ZoomMode {
    FIT_WIDTH,
    FIT_HEIGHT,
    FIT_SCREEN,
    ORIGINAL,
    SMART_FIT  // Auto-detect best fit
}

/**
 * Reader background
 */
enum class ReaderBackground {
    DEFAULT,
    BLACK,
    GRAY,
    WHITE,
    SEPIA,
    CUSTOM
}

/**
 * Page transition animation
 */
enum class PageAnimation {
    NONE,
    SLIDE,
    FADE,
    CURL
}

/**
 * Tap zone configuration
 */
@Serializable
data class TapZoneConfig(
    val leftAction: TapAction = TapAction.PREVIOUS_PAGE,
    val centerAction: TapAction = TapAction.TOGGLE_CONTROLS,
    val rightAction: TapAction = TapAction.NEXT_PAGE,
    val topAction: TapAction = TapAction.PREVIOUS_CHAPTER,
    val bottomAction: TapAction = TapAction.NEXT_CHAPTER
) {
    companion object {
        val DEFAULT = TapZoneConfig()
        
        val MANGA_RTL = TapZoneConfig(
            leftAction = TapAction.NEXT_PAGE,
            rightAction = TapAction.PREVIOUS_PAGE
        )
    }
}

/**
 * Tap actions
 */
enum class TapAction {
    NONE,
    NEXT_PAGE,
    PREVIOUS_PAGE,
    NEXT_CHAPTER,
    PREVIOUS_CHAPTER,
    TOGGLE_CONTROLS,
    ZOOM_IN,
    ZOOM_OUT,
    OPEN_MENU
}

/**
 * Color filter settings
 */
@Serializable
data class ColorFilterSettings(
    val brightness: Float = 0f,      // -1 to 1
    val contrast: Float = 0f,        // -1 to 1
    val saturation: Float = 0f,      // -1 to 1
    val warmth: Float = 0f,          // Blue light filter
    val inverted: Boolean = false,
    val grayscale: Boolean = false
) {
    val isEmpty: Boolean
        get() = brightness == 0f && contrast == 0f && saturation == 0f && 
                warmth == 0f && !inverted && !grayscale
}

/**
 * Page state for reader
 */
@Serializable
data class MangaPageState(
    val pageIndex: Int,
    val totalPages: Int,
    val chapterIndex: Int,
    val totalChapters: Int,
    val chapterTitle: String,
    val mangaTitle: String,
    val progress: Float = 0f,  // 0-1
    val isLoading: Boolean = false,
    val error: String? = null
)
