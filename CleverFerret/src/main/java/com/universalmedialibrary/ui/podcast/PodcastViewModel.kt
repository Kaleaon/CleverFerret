package com.universalmedialibrary.ui.podcast

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.podcast.Podcast
import com.universalmedialibrary.services.podcast.PodcastEpisode
import com.universalmedialibrary.services.podcast.PodcastOperationResult
import com.universalmedialibrary.services.podcast.PodcastSearchResult
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class PodcastViewModel @Inject constructor(
    private val repository: PodcastRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(PodcastUiState())
    val uiState: StateFlow<PodcastUiState> = _uiState.asStateFlow()

    init {
        loadPodcasts()
        loadEpisodes()
    }

    fun searchPodcasts(query: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isSearching = true, 
                searchResults = emptyList(),
                error = null
            )
            
            try {
                val results = repository.searchPodcastsOnline(query)
                _uiState.value = _uiState.value.copy(
                    searchResults = results,
                    isSearching = false,
                    error = null
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isSearching = false,
                    error = "Search failed: ${e.message}"
                )
            }
        }
    }

    fun subscribeFromSearchResult(searchResult: PodcastSearchResult) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            
            try {
                when (val result = repository.subscribeToPodcast(searchResult.feedUrl)) {
                    is PodcastOperationResult.Success -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            error = null
                        )
                        // Podcasts will be reloaded automatically via Flow
                    }
                    is PodcastOperationResult.Error -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            error = result.message
                        )
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Subscription failed: ${e.message}"
                )
            }
        }
    }

    fun addPodcastByFeedUrl(feedUrl: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            
            try {
                when (val result = repository.subscribeToPodcast(feedUrl)) {
                    is PodcastOperationResult.Success -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            error = null
                        )
                        // Podcasts will be reloaded automatically via Flow
                    }
                    is PodcastOperationResult.Error -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            error = result.message
                        )
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to add podcast: ${e.message}"
                )
            }
        }
    }

    fun unsubscribeFromPodcast(podcast: Podcast) {
        viewModelScope.launch {
            try {
                repository.unsubscribe(podcast.id)
                // Podcasts will be reloaded automatically via Flow
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Failed to unsubscribe: ${e.message}"
                )
            }
        }
    }

    fun refreshAllPodcasts() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            
            try {
                _uiState.value.podcasts.forEach { podcast ->
                    repository.refreshPodcast(podcast.id)
                }
                _uiState.value = _uiState.value.copy(isLoading = false)
                // Episodes will be reloaded automatically via Flow
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Refresh failed: ${e.message}"
                )
            }
        }
    }

    fun downloadEpisode(episode: PodcastEpisode) {
        viewModelScope.launch {
            try {
                // TODO: Implement actual download manager
                // For now, just mark as downloaded in database
                val updatedEpisode = episode.copy(downloaded = true)
                repository.updateEpisode(updatedEpisode)
                // Episodes will be reloaded automatically via Flow
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Download failed: ${e.message}"
                )
            }
        }
    }

    fun deleteDownloadedEpisode(episode: PodcastEpisode) {
        viewModelScope.launch {
            try {
                // Delete local file if exists (validate it's in app storage)
                episode.localFilePath?.let { path ->
                    val file = java.io.File(path)
                    // Security: Only delete files in app's external files directory
                    val appStoragePath = android.os.Environment.getExternalStorageDirectory().absolutePath
                    if (file.exists() && file.absolutePath.startsWith(appStoragePath)) {
                        file.delete()
                    }
                }
                
                // Update episode status in database
                val updatedEpisode = episode.copy(
                    downloaded = false,
                    localFilePath = null
                )
                repository.updateEpisode(updatedEpisode)
                // Episodes will be reloaded automatically via Flow
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Failed to delete episode: ${e.message}"
                )
            }
        }
    }

    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }

    private fun loadPodcasts() {
        viewModelScope.launch {
            repository.getSubscribedPodcasts()
                .catch { e ->
                    _uiState.value = _uiState.value.copy(
                        error = "Failed to load podcasts: ${e.message}"
                    )
                }
                .collect { podcasts ->
                    _uiState.value = _uiState.value.copy(
                        podcasts = podcasts,
                        isLoading = false
                    )
                }
        }
    }
    
    private fun loadEpisodes() {
        viewModelScope.launch {
            repository.getDownloadedEpisodes()
                .catch { e ->
                    // Log error but don't show to user
                }
                .collect { episodes ->
                    _uiState.value = _uiState.value.copy(
                        downloadedEpisodes = episodes
                    )
                }
        }
    }
}

data class PodcastUiState(
    val podcasts: List<Podcast> = emptyList(),
    val allEpisodes: List<PodcastEpisode> = emptyList(),
    val downloadedEpisodes: List<PodcastEpisode> = emptyList(),
    val searchResults: List<PodcastSearchResult> = emptyList(),
    val isLoading: Boolean = false,
    val isSearching: Boolean = false,
    val error: String? = null
)