package com.universalmedialibrary.ui.player

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ModernAudioPlayerViewModel @Inject constructor(
    private val audioPlaybackManager: AudioPlaybackManager,
    private val database: AppDatabase
) : ViewModel() {

    private val _uiState = MutableStateFlow(ModernAudioPlayerUiState())
    val uiState: StateFlow<ModernAudioPlayerUiState> = _uiState.asStateFlow()

    private var currentTrackId: Long? = null

    init {
        // Observe playback state from AudioPlaybackManager
        viewModelScope.launch {
            audioPlaybackManager.state.collect { audioState ->
                val currentPosition = if (audioState.isPlaying) {
                    audioPlaybackManager.exoPlayer.currentPosition
                } else {
                    audioState.currentPosition
                }
                
                val progress = if (audioState.duration > 0) {
                    currentPosition.toFloat() / audioState.duration.toFloat()
                } else {
                    0f
                }

                _uiState.value = _uiState.value.copy(
                    isPlaying = audioState.isPlaying,
                    currentPosition = currentPosition,
                    duration = audioState.duration,
                    progress = progress,
                    isShuffleEnabled = audioState.isShuffleEnabled,
                    repeatMode = when (audioState.repeatMode) {
                        com.universalmedialibrary.services.audio.RepeatMode.OFF -> RepeatMode.OFF
                        com.universalmedialibrary.services.audio.RepeatMode.ONE -> RepeatMode.ONE
                        com.universalmedialibrary.services.audio.RepeatMode.ALL -> RepeatMode.ALL
                    },
                    currentTrack = audioState.title?.let { title ->
                        AudioTrack(
                            id = currentTrackId ?: 0L,
                            title = title,
                            artist = audioState.artist ?: "Unknown Artist",
                            album = audioState.album,
                            coverUrl = null,
                            duration = audioState.duration
                        )
                    }
                )
            }
        }

        // Update current position periodically when playing
        viewModelScope.launch {
            while (true) {
                delay(500) // Update twice per second
                if (_uiState.value.isPlaying) {
                    val currentPosition = audioPlaybackManager.exoPlayer.currentPosition
                    val duration = _uiState.value.duration
                    val progress = if (duration > 0) {
                        currentPosition.toFloat() / duration.toFloat()
                    } else {
                        0f
                    }
                    _uiState.value = _uiState.value.copy(
                        currentPosition = currentPosition,
                        progress = progress
                    )
                }
            }
        }

        // Load liked state for current track
        viewModelScope.launch {
            _uiState.map { it.currentTrack?.id }.distinctUntilChanged().collect { trackId ->
                if (trackId != null && trackId > 0) {
                    currentTrackId = trackId
                    loadLikedState(trackId)
                }
            }
        }
    }

    fun togglePlayPause() {
        audioPlaybackManager.togglePlayPause()
    }

    fun previous() {
        audioPlaybackManager.skipToPrevious()
    }

    fun next() {
        audioPlaybackManager.skipToNext()
    }

    fun toggleShuffle() {
        audioPlaybackManager.toggleShuffle()
    }

    fun toggleRepeat() {
        audioPlaybackManager.toggleRepeat()
    }

    fun toggleLike() {
        val trackId = currentTrackId ?: return
        val newLikedState = !_uiState.value.isLiked
        
        viewModelScope.launch {
            try {
                // Update UI optimistically
                _uiState.value = _uiState.value.copy(isLiked = newLikedState)
                
                // Update database
                val mediaItem = database.mediaItemDao().getMediaItemById(trackId)
                if (mediaItem != null) {
                    database.mediaItemDao().updateMediaItem(
                        mediaItem.copy(isFavorite = newLikedState)
                    )
                }
            } catch (e: Exception) {
                // Revert on error
                _uiState.value = _uiState.value.copy(isLiked = !newLikedState)
            }
        }
    }

    fun seekTo(position: Long) {
        audioPlaybackManager.seekTo(position)
    }

    fun setVolume(volume: Float) {
        audioPlaybackManager.setVolume(volume)
    }

    private suspend fun loadLikedState(trackId: Long) {
        try {
            val mediaItem = database.mediaItemDao().getMediaItemById(trackId)
            _uiState.value = _uiState.value.copy(
                isLiked = mediaItem?.isFavorite ?: false
            )
        } catch (e: Exception) {
            // Keep current state on error
        }
    }
}

data class ModernAudioPlayerUiState(
    val currentTrack: AudioTrack? = null,
    val isPlaying: Boolean = false,
    val currentPosition: Long = 0L,
    val duration: Long = 0L,
    val progress: Float = 0f,
    val isShuffleEnabled: Boolean = false,
    val repeatMode: RepeatMode = RepeatMode.OFF,
    val isLiked: Boolean = false
)

data class AudioTrack(
    val id: Long,
    val title: String,
    val artist: String,
    val album: String? = null,
    val coverUrl: String? = null,
    val duration: Long = 0L
)
