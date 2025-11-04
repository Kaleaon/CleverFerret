package com.universalmedialibrary.ui.playback

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.playback.RepeatMode
import com.universalmedialibrary.services.playback.UnifiedPlaybackQueueManager
import com.universalmedialibrary.data.local.dao.PlaylistDao
import com.universalmedialibrary.data.local.entity.Playlist
import com.universalmedialibrary.data.repository.PlaylistRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import java.util.Locale
import javax.inject.Inject

/**
 * ViewModel for the unified Now Playing screen
 *
 * Manages playback state and queue operations through the
 * UnifiedPlaybackQueueManager service.
 */
@HiltViewModel
class NowPlayingViewModel @Inject constructor(
    private val playbackQueueManager: UnifiedPlaybackQueueManager,
    private val playlistRepository: PlaylistRepository,
    private val playlistDao: PlaylistDao
) : ViewModel() {

    // Expose state flows from the queue manager
    val playbackState = playbackQueueManager.playbackState
    val currentItem = playbackQueueManager.currentItem
    val queueItems = playbackQueueManager.queueItems
    val currentQueue = playbackQueueManager.currentQueue
    val currentSession = playbackQueueManager.currentSession
    
    // Available playlists for "Add to Playlist" feature
    val availablePlaylists: StateFlow<List<Playlist>> = playlistDao.getAllPlaylistsFlow()
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )

    /**
     * Toggle play/pause
     */
    fun togglePlayPause() {
        if (playbackState.value.isPlaying) {
            playbackQueueManager.pause()
        } else {
            playbackQueueManager.play()
        }
    }

    /**
     * Skip to next item in queue
     */
    fun skipToNext() {
        viewModelScope.launch {
            playbackQueueManager.skipToNext()
        }
    }

    /**
     * Skip to previous item in queue
     */
    fun skipToPrevious() {
        viewModelScope.launch {
            playbackQueueManager.skipToPrevious()
        }
    }

    /**
     * Seek to specific position in current item
     */
    fun seekTo(positionMs: Long) {
        playbackQueueManager.seekTo(positionMs)
    }

    /**
     * Set playback speed
     */
    fun setPlaybackSpeed(speed: Float) {
        playbackQueueManager.setPlaybackSpeed(speed)
    }

    /**
     * Play specific item from queue
     */
    fun playQueueItem(queueItemId: Long) {
        viewModelScope.launch {
            playbackQueueManager.playQueueItem(queueItemId)
        }
    }

    /**
     * Remove item from queue
     */
    fun removeFromQueue(queueItemId: Long) {
        viewModelScope.launch {
            playbackQueueManager.removeFromQueue(queueItemId)
        }
    }

    /**
     * Toggle queue visibility (for future implementation)
     */
    fun toggleQueue() {
        // This is a UI state toggle, can be implemented when needed
    }

    /**
     * Toggle repeat mode
     */
    fun toggleRepeatMode() {
        viewModelScope.launch {
            val currentMode = currentQueue.value?.repeatMode ?: "NONE"
            val nextMode = when (currentMode) {
                "NONE" -> RepeatMode.ALL
                "ALL" -> RepeatMode.ONE
                "ONE" -> RepeatMode.SHUFFLE
                "SHUFFLE" -> RepeatMode.NONE
                else -> RepeatMode.NONE
            }
            playbackQueueManager.setRepeatMode(nextMode)
        }
    }

    /**
     * Toggle shuffle mode
     */
    fun toggleShuffle() {
        viewModelScope.launch {
            val currentShuffle = currentQueue.value?.shuffleEnabled ?: false
            playbackQueueManager.setShuffleMode(!currentShuffle)
        }
    }

    fun likeCurrentTrack() {
        viewModelScope.launch {
            currentItem.value?.let { item ->
                playlistRepository.addToLiked(item.mediaItemId)
            }
        }
    }

    fun addCurrentTrackToPlaylist(playlistId: Long) {
        viewModelScope.launch {
            currentItem.value?.let { item ->
                try {
                    playlistRepository.addToPlaylist(playlistId, item.mediaItemId)
                } catch (e: Exception) {
                    // Log error for debugging; UI can display a toast/snackbar via caller if needed
                    Log.e("NowPlayingViewModel", "Failed to add track to playlist", e)
                }
            }
        }
    }
    
    fun createPlaylistWithCurrentTrack(playlistName: String) {
        viewModelScope.launch {
            currentItem.value?.let { item ->
                playlistRepository.addToPlaylistByName(playlistName, item.mediaItemId)
            }
        }
    }

    /**
     * Switch to different queue type
     */
    fun switchToQueueType(queueType: String) {
        viewModelScope.launch {
            val queueName = when (queueType.uppercase()) {
                "MUSIC" -> "MUSIC_QUEUE"
                "AUDIOBOOK" -> "AUDIOBOOK_QUEUE"
                "TTS" -> "TTS_QUEUE"
                "PODCAST" -> "PODCAST_QUEUE"
                else -> "MAIN_QUEUE"
            }

            playbackQueueManager.createOrSwitchToQueue(
                queueName = queueName,
                queueType = queueType.uppercase(),
                displayName = queueType.lowercase().replaceFirstChar { it.uppercase() }
            )
        }
    }

    /**
     * Get formatted playback position
     */
    fun getFormattedPosition(): String {
        val positionMs = playbackState.value.currentPositionMs
        return formatTime(positionMs)
    }

    /**
     * Get formatted duration
     */
    fun getFormattedDuration(): String {
        val durationMs = playbackState.value.duration
        return formatTime(durationMs)
    }

    /**
     * Get playback progress as percentage (0.0 to 1.0)
     */
    fun getPlaybackProgress(): Float {
        val state = playbackState.value
        return if (state.duration > 0) {
            state.currentPositionMs.toFloat() / state.duration.toFloat()
        } else 0f
    }

    /**
     * Check if current media supports speed control
     */
    fun supportsSpeedControl(): Boolean {
        val mediaType = currentItem.value?.mediaType
        return mediaType in listOf("AUDIOBOOK", "TTS", "PODCAST")
    }

    /**
     * Check if current media supports chapter navigation
     */
    fun supportsChapterNavigation(): Boolean {
        val mediaType = currentItem.value?.mediaType
        val hasChapter = currentItem.value?.chapterIndex != null
        return mediaType in listOf("AUDIOBOOK", "PODCAST") && hasChapter
    }

    private fun formatTime(timeMs: Long): String {
        val totalSeconds = timeMs / 1000
        val minutes = totalSeconds / 60
        val seconds = totalSeconds % 60
        return String.format(Locale.getDefault(), "%d:%02d", minutes, seconds)
    }

    override fun onCleared() {
        super.onCleared()
        // ViewModel cleanup is handled by the queue manager
    }
}
