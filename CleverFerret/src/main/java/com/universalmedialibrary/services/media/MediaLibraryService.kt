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
    
    private val _currentPlaylist = MutableStateFlow<StreamMediaPlaylist?>(null)
    val currentPlaylist: Flow<StreamMediaPlaylist?> = _currentPlaylist.asStateFlow()
    
    private val _currentlyPlaying = MutableStateFlow<StreamMediaItem?>(null)
    val currentlyPlaying: Flow<StreamMediaItem?> = _currentlyPlaying.asStateFlow()
    
    private val _playbackState = MutableStateFlow(MediaPlaybackState.STOPPED)
    val playbackState: Flow<MediaPlaybackState> = _playbackState.asStateFlow()
    
    private val _mediaLibrary = MutableStateFlow<List<StreamMediaItem>>(emptyList())
    val mediaLibrary: Flow<List<StreamMediaItem>> = _mediaLibrary.asStateFlow()

    /**
     * Add media item to library
     */
    suspend fun addMediaItem(item: StreamMediaItem): Boolean {
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
    fun getCurrentlyPlaying(): StreamMediaItem? {
        return _currentlyPlaying.value
    }

    /**
     * Start playing media item
     */
    suspend fun playMedia(item: StreamMediaItem) {
        _currentlyPlaying.value = item
        _playbackState.value = MediaPlaybackState.PLAYING
    }

    /**
     * Pause playback
     */
    suspend fun pausePlayback() {
        if (_playbackState.value == MediaPlaybackState.PLAYING) {
            _playbackState.value = MediaPlaybackState.PAUSED
        }
    }

    /**
     * Resume playback
     */
    suspend fun resumePlayback() {
        if (_playbackState.value == MediaPlaybackState.PAUSED) {
            _playbackState.value = MediaPlaybackState.PLAYING
        }
    }

    /**
     * Stop playback
     */
    suspend fun stopPlayback() {
        _currentlyPlaying.value = null
        _playbackState.value = MediaPlaybackState.STOPPED
    }

    /**
     * Create playlist
     */
    suspend fun createPlaylist(name: String, items: List<StreamMediaItem>): StreamMediaPlaylist {
        return StreamMediaPlaylist(
            id = generateId(),
            name = name,
            items = items,
            createdAt = System.currentTimeMillis()
        )
    }

    /**
     * Load playlist
     */
    suspend fun loadPlaylist(playlist: StreamMediaPlaylist) {
        _currentPlaylist.value = playlist
        if (playlist.items.isNotEmpty()) {
            playMedia(playlist.items[0])
        }
    }

    /**
     * Search media library
     */
    suspend fun searchMedia(query: String): List<StreamMediaItem> {
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
data class StreamMediaItem(
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

data class StreamMediaPlaylist(
    val id: String,
    val name: String,
    val items: List<StreamMediaItem>,
    val createdAt: Long,
    val description: String? = null
)

enum class MediaPlaybackState {
    STOPPED, PLAYING, PAUSED, BUFFERING
}