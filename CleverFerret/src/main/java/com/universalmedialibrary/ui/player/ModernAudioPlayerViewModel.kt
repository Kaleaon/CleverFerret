package com.universalmedialibrary.ui.player

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.data.repository.MediaRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ModernAudioPlayerViewModel @Inject constructor(
    private val audioPlaybackManager: AudioPlaybackManager,
    private val mediaRepository: MediaRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(ModernAudioPlayerUiState())
    val uiState: StateFlow<ModernAudioPlayerUiState> = _uiState.asStateFlow()

    init {
        // Observe audio playback state
        viewModelScope.launch {
            audioPlaybackManager.state.collect { audioState ->
                _uiState.value = _uiState.value.copy(
                    currentTrack = if (audioState.title != null) {
                        AudioTrack(
                            id = 0L,
                            title = audioState.title,
                            artist = audioState.artist ?: "Unknown Artist",
                            album = audioState.album,
                            duration = audioState.duration
                        )
                    } else {
                        _uiState.value.currentTrack
                    },
                    isPlaying = audioState.isPlaying,
                    currentPosition = audioPlaybackManager.exoPlayer.currentPosition,
                    duration = audioState.duration,
                    progress = if (audioState.duration > 0) {
                        audioPlaybackManager.exoPlayer.currentPosition.toFloat() / audioState.duration
                    } else 0f,
                    isShuffleEnabled = audioState.isShuffleEnabled,
                    repeatMode = when (audioState.repeatMode) {
                        com.universalmedialibrary.services.audio.RepeatMode.OFF -> RepeatMode.OFF
                        com.universalmedialibrary.services.audio.RepeatMode.ONE -> RepeatMode.ONE
                        com.universalmedialibrary.services.audio.RepeatMode.ALL -> RepeatMode.ALL
                    }
                )
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
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isLiked = !_uiState.value.isLiked
            )
            // Save like state to database if we have a current track
            // In a real implementation, we'd save this to a favorites table
        }
    }

    fun seekTo(position: Long) {
        audioPlaybackManager.seekTo(position)
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
