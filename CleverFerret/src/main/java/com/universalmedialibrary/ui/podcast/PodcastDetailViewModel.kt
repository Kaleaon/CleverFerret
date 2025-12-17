package com.universalmedialibrary.ui.podcast

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.podcast.Podcast
import com.universalmedialibrary.services.podcast.PodcastEpisode
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class PodcastDetailViewModel @Inject constructor(
    private val repository: PodcastRepository,
    savedStateHandle: SavedStateHandle
) : ViewModel() {

    private val podcastId: Long = savedStateHandle.get<Any>("podcastId")?.toString()?.toLongOrNull() ?: -1L

    private val _uiState = MutableStateFlow(PodcastDetailUiState())
    val uiState: StateFlow<PodcastDetailUiState> = _uiState.asStateFlow()

    init {
        if (podcastId != -1L) {
            loadPodcast()
            loadEpisodes()
        } else {
            _uiState.value = _uiState.value.copy(error = "Invalid Podcast ID")
        }
    }

    private fun loadPodcast() {
        viewModelScope.launch {
            repository.getPodcastById(podcastId)
                .catch { e ->
                    _uiState.value = _uiState.value.copy(error = "Failed to load podcast: ${e.message}")
                }
                .collect { podcast ->
                    _uiState.value = _uiState.value.copy(podcast = podcast)
                }
        }
    }

    private fun loadEpisodes() {
        viewModelScope.launch {
            repository.getEpisodesByPodcast(podcastId)
                .catch { e ->
                     _uiState.value = _uiState.value.copy(error = "Failed to load episodes: ${e.message}")
                }
                .collect { episodes ->
                    _uiState.value = _uiState.value.copy(episodes = episodes)
                }
        }
    }
    
    fun refreshPodcast() {
        viewModelScope.launch {
             _uiState.value = _uiState.value.copy(isLoading = true)
             // We don't check result here for now as flow updates will handle UI
            repository.refreshPodcast(podcastId)
             _uiState.value = _uiState.value.copy(isLoading = false)
        }
    }
}

data class PodcastDetailUiState(
    val podcast: Podcast? = null,
    val episodes: List<PodcastEpisode> = emptyList(),
    val isLoading: Boolean = false,
    val error: String? = null
)
