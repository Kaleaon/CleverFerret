package com.universalmedialibrary.ui.podcast

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.podcast.PodcastEpisode
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class PodcastPlayerViewModel @Inject constructor(
    private val repository: PodcastRepository,
    private val audioPlaybackManager: AudioPlaybackManager
) : ViewModel() {

    private val _uiState = MutableStateFlow(PodcastPlayerUiState())
    val uiState: StateFlow<PodcastPlayerUiState> = _uiState.asStateFlow()

    private var loadEpisodeJob: Job? = null
    private var positionUpdateJob: Job? = null

    val playbackState = audioPlaybackManager.state

    init {
        // Track playback position updates
        positionUpdateJob = viewModelScope.launch {
            playbackState.collect { state ->
                if (state.isPlaying) {
                    _uiState.value = _uiState.value.copy(
                        isPlaying = true,
                        currentPosition = audioPlaybackManager.exoPlayer.currentPosition
                    )
                } else {
                    _uiState.value = _uiState.value.copy(isPlaying = false)
                }
            }
        }
    }

    override fun onCleared() {
        super.onCleared()
        positionUpdateJob?.cancel()
        loadEpisodeJob?.cancel()
    }

    fun loadEpisode(episodeId: Long) {
        loadEpisodeJob?.cancel()
        loadEpisodeJob = viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)

            repository.getEpisodeById(episodeId)
                .catch { e ->
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = "Failed to load episode: ${e.message}"
                    )
                }
                .collect { episode ->
                    _uiState.value = _uiState.value.copy(
                        episode = episode,
                        isLoading = false
                    )
                }
        }
    }

    fun play() {
        _uiState.value.episode?.let { episode ->
            val uri = Uri.parse(episode.localFilePath ?: episode.audioUrl)

            // Create metadata for the player
            val metadata = MediaMetadata.Builder()
                .setTitle(episode.title)
                .setArtist(episode.description ?: "Podcast Episode")
                .build()

            // Load and play
            audioPlaybackManager.loadSingle(uri, metadata, playWhenReady = true)
            _uiState.value = _uiState.value.copy(isPlaying = true)

            // Update play position in database
            viewModelScope.launch {
                repository.updatePlayPosition(episode.id, _uiState.value.currentPosition)
            }
        }
    }

    fun pause() {
        audioPlaybackManager.exoPlayer.pause()
        _uiState.value = _uiState.value.copy(isPlaying = false)

        // Save current position
        _uiState.value.episode?.let { episode ->
            viewModelScope.launch {
                repository.updatePlayPosition(episode.id, audioPlaybackManager.exoPlayer.currentPosition)
            }
        }
    }

    fun seekTo(position: Long) {
        audioPlaybackManager.exoPlayer.seekTo(position)
        _uiState.value = _uiState.value.copy(currentPosition = position)

        // Save position to database
        _uiState.value.episode?.let { episode ->
            viewModelScope.launch {
                repository.updatePlayPosition(episode.id, position)
            }
        }
    }

    fun skipForward() {
        val newPosition = _uiState.value.currentPosition + 30000 // 30 seconds
        seekTo(newPosition.coerceAtMost(_uiState.value.episode?.duration ?: 0))
    }

    fun skipBackward() {
        val newPosition = _uiState.value.currentPosition - 15000 // 15 seconds
        seekTo(newPosition.coerceAtLeast(0))
    }

    fun togglePlayPause() {
        if (_uiState.value.isPlaying) {
            pause()
        } else {
            play()
        }
    }

    fun markAsPlayed() {
        viewModelScope.launch {
            _uiState.value.episode?.let { episode ->
                repository.markEpisodeAsPlayed(episode.id)
            }
        }
    }

    fun toggleFavorite() {
        viewModelScope.launch {
            _uiState.value.episode?.let { episode ->
                repository.toggleEpisodeFavorite(episode.id, !episode.favorite)
            }
        }
    }
}

data class PodcastPlayerUiState(
    val episode: PodcastEpisode? = null,
    val isLoading: Boolean = false,
    val isPlaying: Boolean = false,
    val currentPosition: Long = 0,
    val error: String? = null
)
