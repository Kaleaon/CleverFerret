package com.universalmedialibrary.ui.player

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ModernAudioPlayerViewModel @Inject constructor(
    // TODO: Inject MusicPlaybackService when available
) : ViewModel() {

    private val _uiState = MutableStateFlow(AudioPlayerUiState())
    val uiState: StateFlow<AudioPlayerUiState> = _uiState.asStateFlow()

    fun togglePlayPause() {
        _uiState.value = _uiState.value.copy(
            isPlaying = !_uiState.value.isPlaying
        )
        // TODO: Call playback service
    }

    fun previous() {
        // TODO: Call playback service
    }

    fun next() {
        // TODO: Call playback service
    }

    fun toggleShuffle() {
        _uiState.value = _uiState.value.copy(
            isShuffleEnabled = !_uiState.value.isShuffleEnabled
        )
        // TODO: Call playback service
    }

    fun toggleRepeat() {
        val newMode = when (_uiState.value.repeatMode) {
            RepeatMode.OFF -> RepeatMode.ALL
            RepeatMode.ALL -> RepeatMode.ONE
            RepeatMode.ONE -> RepeatMode.OFF
        }
        _uiState.value = _uiState.value.copy(repeatMode = newMode)
        // TODO: Call playback service
    }

    fun toggleLike() {
        _uiState.value = _uiState.value.copy(
            isLiked = !_uiState.value.isLiked
        )
        // TODO: Save to database
    }

    fun seekTo(position: Long) {
        _uiState.value = _uiState.value.copy(currentPosition = position)
        // TODO: Call playback service
    }
}

data class AudioPlayerUiState(
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
