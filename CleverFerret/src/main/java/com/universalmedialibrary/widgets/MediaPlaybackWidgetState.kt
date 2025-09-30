package com.universalmedialibrary.widgets

import android.graphics.Bitmap
import com.universalmedialibrary.data.local.entity.MediaItem

/**
 * MediaPlaybackWidgetState
 * 
 * Represents the current state of the media playback widget.
 * Contains all data needed to render the widget UI.
 * 
 * This is a simple data class that can be easily serialized
 * to widget preferences for persistence.
 */
data class MediaPlaybackWidgetState(
    val currentMedia: MediaItem? = null,
    val title: String = "",
    val subtitle: String = "",
    val artworkUri: String? = null,
    val isPlaying: Boolean = false,
    val isPaused: Boolean = false,
    val isBuffering: Boolean = false,
    val currentPositionMs: Long = 0,
    val durationMs: Long = 0,
    val playbackSpeed: Float = 1.0f,
    val queueSize: Int = 0,
    val currentQueuePosition: Int = 0,
    val isLoading: Boolean = false,
    val error: String? = null
) {
    /**
     * Whether the widget has any media to display
     */
    val hasMedia: Boolean
        get() = currentMedia != null
    
    /**
     * Whether the widget is in an error state
     */
    val hasError: Boolean
        get() = error != null
    
    /**
     * Whether playback controls should be enabled
     */
    val canPlay: Boolean
        get() = hasMedia && !isLoading && !hasError
    
    /**
     * Display title for the widget
     * Falls back to filename if no title is set
     */
    val displayTitle: String
        get() = when {
            title.isNotEmpty() -> title
            currentMedia != null -> currentMedia.fileName.substringBeforeLast('.')
            else -> "No Media"
        }
    
    /**
     * Display subtitle for the widget
     * Shows media type or custom subtitle
     */
    val displaySubtitle: String
        get() = when {
            subtitle.isNotEmpty() -> subtitle
            currentMedia != null -> formatMediaType(currentMedia.mediaType)
            else -> ""
        }
    
    /**
     * Progress percentage (0-100)
     */
    val progressPercent: Int
        get() = if (durationMs > 0) {
            ((currentPositionMs.toFloat() / durationMs) * 100).toInt()
        } else {
            0
        }
    
    /**
     * Formatted current position (MM:SS)
     */
    val formattedPosition: String
        get() = formatTime(currentPositionMs)
    
    /**
     * Formatted duration (MM:SS)
     */
    val formattedDuration: String
        get() = formatTime(durationMs)
    
    /**
     * Whether there are more items in the queue
     */
    val hasNextInQueue: Boolean
        get() = currentQueuePosition < queueSize - 1
    
    /**
     * Whether there are previous items in the queue
     */
    val hasPreviousInQueue: Boolean
        get() = currentQueuePosition > 0
    
    private fun formatMediaType(mediaType: String): String {
        return when (mediaType.uppercase()) {
            "BOOK", "AUDIOBOOK" -> "Book"
            "MUSIC_TRACK", "MUSIC" -> "Music"
            "MOVIE" -> "Movie"
            "TV_SHOW" -> "TV Show"
            "PODCAST" -> "Podcast"
            "VIDEO" -> "Video"
            else -> mediaType.lowercase().replaceFirstChar { it.uppercase() }
        }
    }
    
    private fun formatTime(milliseconds: Long): String {
        val seconds = milliseconds / 1000
        val minutes = seconds / 60
        val remainingSeconds = seconds % 60
        return String.format("%d:%02d", minutes, remainingSeconds)
    }
    
    /**
     * Create a copy with updated playback position
     */
    fun withPosition(positionMs: Long): MediaPlaybackWidgetState {
        return copy(currentPositionMs = positionMs)
    }
    
    /**
     * Create a copy with updated playback state
     */
    fun withPlaybackState(playing: Boolean, paused: Boolean = false): MediaPlaybackWidgetState {
        return copy(isPlaying = playing, isPaused = paused)
    }
    
    /**
     * Create a copy with an error
     */
    fun withError(errorMessage: String): MediaPlaybackWidgetState {
        return copy(error = errorMessage, isLoading = false)
    }
    
    /**
     * Create a copy in loading state
     */
    fun withLoading(): MediaPlaybackWidgetState {
        return copy(isLoading = true, error = null)
    }
    
    companion object {
        /**
         * Create an empty state
         */
        fun empty(): MediaPlaybackWidgetState {
            return MediaPlaybackWidgetState()
        }
        
        /**
         * Create a state from a MediaItem
         */
        fun fromMediaItem(
            mediaItem: MediaItem,
            isPlaying: Boolean = false,
            currentPositionMs: Long = 0,
            durationMs: Long = 0
        ): MediaPlaybackWidgetState {
            return MediaPlaybackWidgetState(
                currentMedia = mediaItem,
                isPlaying = isPlaying,
                currentPositionMs = currentPositionMs,
                durationMs = durationMs
            )
        }
    }
}
