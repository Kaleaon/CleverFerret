package com.universalmedialibrary.services.media

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Media Library Service for CleverFerret
 * 
 * Core service for managing media files, playlists, and playback:
 * - Media file management
 * - Playlist creation and management
 * - Playback state management
 * - Library organization
 */
@Singleton
class MediaLibraryService @Inject constructor() {
    
    private val _currentPlaylist = MutableStateFlow<MediaPlaylist?>(null)
    val currentPlaylist: Flow<MediaPlaylist?> = _currentPlaylist.asStateFlow()
    
    private val _currentlyPlaying = MutableStateFlow<MediaItem?>(null)
    val currentlyPlaying: Flow<MediaItem?> = _currentlyPlaying.asStateFlow()
    
    private val _playbackState = MutableStateFlow(PlaybackState.STOPPED)
    val playbackState: Flow<PlaybackState> = _playbackState.asStateFlow()
    
    private val _mediaLibrary = MutableStateFlow<List<MediaItem>>(emptyList())
    val mediaLibrary: Flow<List<MediaItem>> = _mediaLibrary.asStateFlow()

    /**
     * Add media item to library
     */
    suspend fun addMediaItem(item: MediaItem): Boolean {
        val currentLibrary = _mediaLibrary.value.toMutableList()
        currentLibrary.add(item)
        _mediaLibrary.value = currentLibrary
        return true
    }

    /**
     * Remove media item from library
     */
    suspend fun removeMediaItem(itemId: String): Boolean {
        val currentLibrary = _mediaLibrary.value.toMutableList()
        val removed = currentLibrary.removeAll { it.id == itemId }
        if (removed) {
            _mediaLibrary.value = currentLibrary
        }
        return removed
    }

    /**
     * Get currently playing media item
     */
    fun getCurrentlyPlaying(): MediaItem? {
        return _currentlyPlaying.value
    }

    /**
     * Start playing media item
     */
    suspend fun playMedia(item: MediaItem) {
        _currentlyPlaying.value = item
        _playbackState.value = PlaybackState.PLAYING
    }

    /**
     * Pause playback
     */
    suspend fun pausePlayback() {
        if (_playbackState.value == PlaybackState.PLAYING) {
            _playbackState.value = PlaybackState.PAUSED
        }
    }

    /**
     * Resume playback
     */
    suspend fun resumePlayback() {
        if (_playbackState.value == PlaybackState.PAUSED) {
            _playbackState.value = PlaybackState.PLAYING
        }
    }

    /**
     * Stop playback
     */
    suspend fun stopPlayback() {
        _currentlyPlaying.value = null
        _playbackState.value = PlaybackState.STOPPED
    }

    /**
     * Create playlist
     */
    suspend fun createPlaylist(name: String, items: List<MediaItem>): MediaPlaylist {
        return MediaPlaylist(
            id = generateId(),
            name = name,
            items = items,
            createdAt = System.currentTimeMillis()
        )
    }

    /**
     * Load playlist
     */
    suspend fun loadPlaylist(playlist: MediaPlaylist) {
        _currentPlaylist.value = playlist
        if (playlist.items.isNotEmpty()) {
            playMedia(playlist.items[0])
        }
    }

    /**
     * Search media library
     */
    suspend fun searchMedia(query: String): List<MediaItem> {
        return _mediaLibrary.value.filter { item ->
            item.title.contains(query, ignoreCase = true) ||
            item.artist?.contains(query, ignoreCase = true) == true ||
            item.album?.contains(query, ignoreCase = true) == true
        }
    }

    private fun generateId(): String {
        return "media_${System.currentTimeMillis()}_${(1000..9999).random()}"
    }
}

/**
 * Data classes for media operations
 */
data class MediaItem(
    val id: String,
    val title: String,
    val artist: String? = null,
    val album: String? = null,
    val duration: Long? = null,
    val mimeType: String,
    val url: String,
    val thumbnailUrl: String? = null,
    val lastModified: Long = System.currentTimeMillis()
)

data class MediaPlaylist(
    val id: String,
    val name: String,
    val items: List<MediaItem>,
    val createdAt: Long,
    val description: String? = null
)

enum class PlaybackState {
    STOPPED, PLAYING, PAUSED, BUFFERING
}