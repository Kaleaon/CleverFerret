package com.universalmedialibrary.ui.viewer.common

import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.unit.sp

/**
 * Common settings shared across different viewers
 */
data class ViewerSettings(
    // General settings
    val brightness: Float = 1.0f,
    val keepScreenOn: Boolean = true,
    val fullScreenMode: Boolean = false,
    val systemBarsHidden: Boolean = false,
    
    // Reading settings (for text-based content)
    val fontSize: Float = 16f,
    val fontFamily: FontFamily = FontFamily.Default,
    val lineSpacing: Float = 1.5f,
    val textAlignment: TextAlignment = TextAlignment.JUSTIFY,
    val backgroundColor: Color = Color.White,
    val textColor: Color = Color.Black,
    val marginHorizontal: Float = 24f,
    val marginVertical: Float = 16f,
    
    // Page settings
    val pageTransition: PageTransition = PageTransition.SLIDE,
    val doubleTapToZoom: Boolean = true,
    val pinchToZoom: Boolean = true,
    val volumeKeysForNavigation: Boolean = false,
    
    // Reading modes
    val readingMode: ReadingMode = ReadingMode.SINGLE_PAGE,
    val readingDirection: ReadingDirection = ReadingDirection.LEFT_TO_RIGHT,
    
    // Advanced features
    val nightMode: Boolean = false,
    val blueLightFilter: Boolean = false,
    val autoBookmarks: Boolean = true,
    val readingAnalytics: Boolean = true
)

enum class TextAlignment {
    LEFT, CENTER, RIGHT, JUSTIFY
}

enum class PageTransition {
    SLIDE, FADE, CURL, NONE
}

enum class ReadingMode {
    SINGLE_PAGE, DOUBLE_PAGE, CONTINUOUS_SCROLL, GUIDED_VIEW
}

enum class ReadingDirection {
    LEFT_TO_RIGHT, RIGHT_TO_LEFT, TOP_TO_BOTTOM
}

/**
 * Video-specific settings
 */
data class VideoSettings(
    val subtitlesEnabled: Boolean = false,
    val selectedSubtitleTrack: Int = -1,
    val selectedAudioTrack: Int = 0,
    val playbackSpeed: Float = 1.0f,
    val gestureControls: Boolean = true,
    val pipModeEnabled: Boolean = true,
    val autoNextEpisode: Boolean = false,
    val skipIntro: Boolean = false,
    val rememberPosition: Boolean = true
)

/**
 * Comic-specific settings
 */
data class ComicSettings(
    val panelByPanelMode: Boolean = false,
    val smartPanelDetection: Boolean = true,
    val zoomOnPanelFocus: Boolean = true,
    val panelTransitionDuration: Long = 300L,
    val showPanelBorders: Boolean = false,
    val panelNavigationHints: Boolean = true,
    val webtoonMode: Boolean = false,
    val cropWhiteSpace: Boolean = true
)