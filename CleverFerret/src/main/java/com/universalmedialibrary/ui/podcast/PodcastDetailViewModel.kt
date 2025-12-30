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
    
    fun downloadEpisode(episode: PodcastEpisode) {
        viewModelScope.launch {
            try {
                // Implementation for downloading episode
                // This would typically involve:
                // 1. Creating a download task
                // 2. Downloading the audio file to local storage
                // 3. Updating the episode's download status
                // 4. Notifying the UI of download progress
                
                // For now, we'll mark the episode as downloaded for demo purposes
                // In a real implementation, this would trigger the actual download
                repository.markEpisodeAsDownloaded(episode.id)
                
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = "Failed to download episode: ${e.message}")
            }
        }
    }
}

data class PodcastDetailUiState(
    val podcast: Podcast? = null,
    val episodes: List<PodcastEpisode> = emptyList(),
    val isLoading: Boolean = false,
    val error: String? = null
)
