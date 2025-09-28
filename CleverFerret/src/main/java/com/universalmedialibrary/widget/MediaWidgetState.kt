package com.universalmedialibrary.widget

import android.graphics.Bitmap

/**
 * State data for the media playback widget
 * 
 * Contains all information needed to render the widget UI including
 * current media info, playback state, and artwork.
 */
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
) {
    val hasError: Boolean get() = error != null
    val progress: Float get() = if (duration > 0) position.toFloat() / duration else 0f
    val hasArtwork: Boolean get() = artworkUri != null || artworkBitmap != null
}

/**
 * Media types supported by the widget
 */
enum class MediaType {
    BOOK,
    AUDIOBOOK,
    MUSIC,
    MOVIE,
    PODCAST,
    UNKNOWN
}

/**
 * Widget size variants for responsive design
 */
enum class WidgetSize {
    SMALL,   // Just artwork + play/pause
    MEDIUM,  // Add title/artist + basic controls  
    LARGE    // Full controls + progress + secondary actions
}

/**
 * Widget actions that can be triggered from the homescreen
 */
sealed class WidgetAction {
    object PlayPause : WidgetAction()
    object SkipNext : WidgetAction()
    object SkipPrevious : WidgetAction()
    object OpenApp : WidgetAction()
    data class SeekTo(val position: Long) : WidgetAction()
}