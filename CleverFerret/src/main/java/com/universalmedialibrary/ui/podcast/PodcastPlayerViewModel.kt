package com.universalmedialibrary.ui.podcast

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
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
    private val repository: PodcastRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(PodcastPlayerUiState())
    val uiState: StateFlow<PodcastPlayerUiState> = _uiState.asStateFlow()
    
    private var loadEpisodeJob: Job? = null
    
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
        // TODO: Integrate with AudioPlaybackManager
        _uiState.value = _uiState.value.copy(isPlaying = true)
    }
    
    fun pause() {
        // TODO: Integrate with AudioPlaybackManager
        _uiState.value = _uiState.value.copy(isPlaying = false)
    }
    
    fun seekTo(position: Long) {
        // TODO: Integrate with AudioPlaybackManager
        _uiState.value = _uiState.value.copy(currentPosition = position)
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