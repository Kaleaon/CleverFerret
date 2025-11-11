package com.universalmedialibrary.ui.podcast

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.DownloadContentMetadata
import com.universalmedialibrary.services.DownloadSafetyChecker
import com.universalmedialibrary.services.DownloadSafetyResult
import com.universalmedialibrary.services.podcast.Podcast
import com.universalmedialibrary.services.podcast.PodcastEpisode
import com.universalmedialibrary.services.podcast.PodcastOperationResult
import com.universalmedialibrary.services.podcast.PodcastSearchResult
import com.universalmedialibrary.ui.components.pin.PinChallenge
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class PodcastViewModel @Inject constructor(
    private val repository: PodcastRepository,
    private val downloadManager: com.universalmedialibrary.services.podcast.PodcastDownloadManager,
    private val downloadSafetyChecker: DownloadSafetyChecker
) : ViewModel() {

    private val _uiState = MutableStateFlow(PodcastUiState())
    val uiState: StateFlow<PodcastUiState> = _uiState.asStateFlow()
    private val _pendingPinChallenge = MutableStateFlow<PinChallenge?>(null)
    val pendingPinChallenge: StateFlow<PinChallenge?> = _pendingPinChallenge.asStateFlow()
    private var pendingPinAction: (() -> Unit)? = null

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

    fun downloadEpisode(episode: PodcastEpisode, bypassPin: Boolean = false) {
        viewModelScope.launch {
            try {
                if (!bypassPin && _pendingPinChallenge.value != null) {
                    _uiState.value = _uiState.value.copy(
                        error = "Complete the current PIN unlock before starting another download."
                    )
                    return@launch
                }

                // Find podcast for title
                val podcast = _uiState.value.podcasts.find { it.id == episode.podcastId }
                val podcastTitle = podcast?.title ?: "Unknown Podcast"
                val rating = if (podcast?.explicit == true) "EXPLICIT" else null
                val tags = buildList {
                    podcast?.category?.takeIf { it.isNotBlank() }?.let { add(it) }
                }

                when (val safetyResult = downloadSafetyChecker.checkDownload(
                    DownloadContentMetadata(
                        rating = rating,
                        title = episode.title,
                        mediaType = "PODCAST",
                        tags = tags,
                        bypassPinCheck = bypassPin
                    )
                )) {
                    is DownloadSafetyResult.Blocked -> {
                        _uiState.value = _uiState.value.copy(
                            error = safetyResult.reason
                        )
                        return@launch
                    }
                    is DownloadSafetyResult.RequiresPin -> {
                        pendingPinAction = { downloadEpisode(episode, bypassPin = true) }
                        _pendingPinChallenge.value = PinChallenge(
                            title = episode.title,
                            rating = rating,
                            mediaType = "PODCAST",
                            tags = tags,
                            description = safetyResult.contentRating?.let {
                                "Enter your PIN to download this episode."
                            } ?: "Enter your PIN to download this episode."
                        )
                        _uiState.value = _uiState.value.copy(error = null)
                        return@launch
                    }
                    DownloadSafetyResult.Allowed -> {
                        // proceed
                    }
                }

                _uiState.value = _uiState.value.copy(error = null)

                // Start download using Android DownloadManager
                downloadManager.downloadEpisode(
                    episodeId = episode.id,
                    audioUrl = episode.audioUrl,
                    episodeTitle = episode.title,
                    podcastTitle = podcastTitle
                )

                // Update UI state
                _uiState.value = _uiState.value.copy(error = null)
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Download failed: ${e.message}"
                )
            }
        }
    }

    fun cancelDownload(episode: PodcastEpisode) {
        downloadManager.cancelDownload(episode.id)
    }

    val downloadProgress = downloadManager.downloadProgress

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

    fun dismissPinChallenge() {
        pendingPinAction = null
        _pendingPinChallenge.value = null
    }

    suspend fun verifyPin(pin: String): Boolean =
        downloadSafetyChecker.verifyPinForDownload(pin)

    fun onPinUnlockGranted() {
        val action = pendingPinAction
        pendingPinAction = null
        _pendingPinChallenge.value = null
        action?.invoke()
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
