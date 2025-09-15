package com.universalmedialibrary.ui.viewer.common

import androidx.compose.ui.graphics.Color

/**
 * Common viewer settings and models
 */

data class ViewerSettings(
    val brightness: Float = 0.5f,
    val nightMode: Boolean = false,
    val blueLightFilter: Boolean = false,
    val keepScreenOn: Boolean = false,
    val backgroundColor: Color = Color.White,
    val textColor: Color = Color.Black,
    val fontSize: Float = 16f,
    val lineSpacing: Float = 1.5f,
    val autoScrollSpeed: Float = 1.0f
)

data class VideoSettings(
    val playbackSpeed: Float = 1.0f,
    val volume: Float = 1.0f,
    val brightness: Float = 0.5f,
    val subtitlesEnabled: Boolean = false,
    val subtitleLanguage: String? = null,
    val audioTrack: Int = 0,
    val hardwareAcceleration: Boolean = true,
    val autoPlay: Boolean = false,
    val continueWatching: Boolean = true,
    val skipIntroOutro: Boolean = false,
    val gestureControls: Boolean = true,
    val showThumbnailPreview: Boolean = true
)

data class ComicSettings(
    val readingMode: ReadingMode = ReadingMode.PAGE_BY_PAGE,
    val readingDirection: ReadingDirection = ReadingDirection.LEFT_TO_RIGHT,
    val fitMode: FitMode = FitMode.FIT_WIDTH,
    val enableZoom: Boolean = true,
    val maxZoom: Float = 3.0f,
    val backgroundColor: String = "#000000",
    val enablePageTurn: Boolean = true,
    val doubleTapZoom: Boolean = true,
    val panelDetection: Boolean = true,
    val smoothScrolling: Boolean = true
)

enum class ReadingMode {
    PAGE_BY_PAGE,
    CONTINUOUS_VERTICAL,
    CONTINUOUS_HORIZONTAL,
    WEBTOON
}

enum class ReadingDirection {
    LEFT_TO_RIGHT,
    RIGHT_TO_LEFT,
    VERTICAL
}

enum class FitMode {
    FIT_WIDTH,
    FIT_HEIGHT,
    FIT_SCREEN,
    ORIGINAL_SIZE
}

enum class TextAlignment {
    LEFT,
    CENTER,
    RIGHT,
    JUSTIFY
}

/**
 * Settings for plain-text/PDF document rendering controls
 */
data class DocumentSettings(
    val fontSize: Float = 16f,
    val lineSpacing: Float = 1.5f,
    val textAlignment: TextAlignment = TextAlignment.LEFT,
    val marginHorizontal: Float = 16f,
    val marginVertical: Float = 20f,
    val backgroundColor: String = "#FFFFFF",
    val textColor: String = "#000000",
    val enableSearch: Boolean = true,
    val enableBookmarks: Boolean = true,
    val enableNotes: Boolean = true,
    val autoScrollSpeed: Float = 1.0f
)