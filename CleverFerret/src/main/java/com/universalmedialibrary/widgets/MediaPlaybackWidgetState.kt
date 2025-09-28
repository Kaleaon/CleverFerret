package com.universalmedialibrary.widgets

import com.universalmedialibrary.data.local.entity.MediaItem

/**
 * State data class for Media Playback Widget
 */
data class MediaPlaybackWidgetState(
    val currentMedia: MediaItem? = null,
    val isPlaying: Boolean = false,
    val isLoading: Boolean = false,
    val position: Long = 0L,
    val duration: Long = 0L,
    val artworkUri: String? = null,
    val error: String? = null
) {
    val hasMedia: Boolean get() = currentMedia != null
    val hasError: Boolean get() = error != null
    val canPlay: Boolean get() = hasMedia && !isLoading && !hasError
    
    /**
     * Get display title based on media type
     */
    val displayTitle: String get() = when {
        currentMedia == null -> "No Media"
        currentMedia.mediaType == "BOOK" || currentMedia.mediaType == "EBOOK" -> {
            // For books, show the title from filename
            currentMedia.fileName.substringBeforeLast('.')
        }
        currentMedia.mediaType.startsWith("MUSIC") -> {
            // For music, show the track name
            currentMedia.fileName.substringBeforeLast('.')
        }
        currentMedia.mediaType == "MOVIE" || currentMedia.mediaType == "TV_SHOW" -> {
            // For videos, show the title
            currentMedia.fileName.substringBeforeLast('.')
        }
        else -> currentMedia.fileName.substringBeforeLast('.')
    }
    
    /**
     * Get display subtitle (author/artist) based on media type
     */
    val displaySubtitle: String get() = when {
        currentMedia == null -> ""
        currentMedia.mediaType == "BOOK" || currentMedia.mediaType == "EBOOK" -> "Book"
        currentMedia.mediaType.startsWith("MUSIC") -> "Music"
        currentMedia.mediaType == "MOVIE" -> "Movie"
        currentMedia.mediaType == "TV_SHOW" -> "TV Show"
        else -> currentMedia.mediaType.lowercase().replaceFirstChar { it.uppercase() }
    }
}