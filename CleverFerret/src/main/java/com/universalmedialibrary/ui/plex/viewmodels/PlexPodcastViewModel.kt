package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
import com.universalmedialibrary.ui.plex.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Plex-style Podcast Screen
 */
@HiltViewModel
class PlexPodcastViewModel @Inject constructor(
    private val podcastService: PodcastService,
    private val podcastRepository: PodcastRepository,
    private val downloadManager: PodcastDownloadManager
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(PodcastScreenState())
    val uiState: StateFlow<PodcastScreenState> = _uiState.asStateFlow()
    
    init {
        loadPodcastData()
        observeNowPlaying()
    }
    
    private fun loadPodcastData() {
        viewModelScope.launch {
            combine(
                loadSubscribedShows(),
                loadLatestEpisodes(),
                loadQueuedEpisodes(),
                loadDownloadedEpisodes()
            ) { shows, latest, queued, downloaded ->
                PodcastScreenState(
                    subscribedShows = shows,
                    latestEpisodes = latest,
                    queuedEpisodes = queued,
                    downloadedEpisodes = downloaded,
                    isLoading = false
                )
            }.collect { state ->
                _uiState.value = state.copy(nowPlaying = _uiState.value.nowPlaying)
            }
        }
    }
    
    private fun observeNowPlaying() {
        viewModelScope.launch {
            podcastService.currentEpisode.collect { episode ->
                val podcastEpisode = episode?.let {
                    PodcastEpisode(
                        id = it.id.toString(),
                        showId = it.showId.toString(),
                        showTitle = it.showTitle,
                        showArtworkUrl = it.showArtworkUrl,
                        title = it.title,
                        description = it.description,
                        publishedDate = formatDate(it.publishedDate),
                        duration = formatDuration(it.duration),
                        progress = podcastService.progress.value,
                        remainingTime = formatDuration(it.duration - (it.duration * podcastService.progress.value).toLong()),
                        isNew = false,
                        isDownloaded = it.isDownloaded,
                        isPlaying = podcastService.isPlaying.value,
                        playbackSpeed = podcastService.playbackSpeed.value
                    )
                }
                _uiState.update { it.copy(nowPlaying = podcastEpisode) }
            }
        }
    }
    
    private fun loadSubscribedShows(): Flow<List<PodcastShow>> =
        podcastRepository.getSubscribedShows().map { shows ->
            shows.map { show ->
                PodcastShow(
                    id = show.id.toString(),
                    title = show.title,
                    author = show.author,
                    artworkUrl = show.artworkUrl,
                    description = show.description,
                    episodeCount = show.episodeCount,
                    unplayedCount = show.unplayedCount,
                    lastUpdated = show.lastUpdated?.let { formatDate(it) }
                )
            }
        }
    
    private fun loadLatestEpisodes(): Flow<List<PodcastEpisode>> =
        podcastRepository.getLatestEpisodes(limit = 50).map { episodes ->
            episodes.map { it.toPodcastEpisode() }
        }
    
    private fun loadQueuedEpisodes(): Flow<List<PodcastEpisode>> =
        podcastRepository.getQueuedEpisodes().map { episodes ->
            episodes.map { it.toPodcastEpisode() }
        }
    
    private fun loadDownloadedEpisodes(): Flow<List<PodcastEpisode>> =
        podcastRepository.getDownloadedEpisodes().map { episodes ->
            episodes.map { it.toPodcastEpisode() }
        }
    
    fun playEpisode(episode: PodcastEpisode) {
        viewModelScope.launch {
            podcastService.playEpisode(episode.id.toLong())
        }
    }
    
    fun downloadEpisode(episode: PodcastEpisode) {
        viewModelScope.launch {
            downloadManager.downloadEpisode(episode.id.toLong())
        }
    }
    
    fun addToQueue(episode: PodcastEpisode) {
        viewModelScope.launch {
            podcastRepository.addToQueue(episode.id.toLong())
            loadPodcastData()
        }
    }
    
    fun removeFromQueue(episode: PodcastEpisode) {
        viewModelScope.launch {
            podcastRepository.removeFromQueue(episode.id.toLong())
            loadPodcastData()
        }
    }
    
    fun markAsPlayed(episode: PodcastEpisode) {
        viewModelScope.launch {
            podcastRepository.markAsPlayed(episode.id.toLong())
            loadPodcastData()
        }
    }
    
    fun refreshFeeds() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            podcastService.refreshAllFeeds()
            loadPodcastData()
        }
    }
    
    fun importOpml(opmlContent: String) {
        viewModelScope.launch {
            podcastService.importOpml(opmlContent)
            loadPodcastData()
        }
    }
    
    fun exportOpml(): String {
        return podcastService.exportOpml()
    }
    
    private fun Any.toPodcastEpisode(): PodcastEpisode {
        // This would use actual model properties
        return PodcastEpisode(
            id = hashCode().toString(),
            showId = "0",
            showTitle = "",
            showArtworkUrl = null,
            title = toString(),
            description = null,
            publishedDate = "",
            duration = "",
            progress = 0f,
            remainingTime = null,
            isNew = false,
            isDownloaded = false,
            isPlaying = false
        )
    }
    
    private fun formatDuration(ms: Long): String {
        val seconds = (ms / 1000) % 60
        val minutes = (ms / (1000 * 60)) % 60
        val hours = ms / (1000 * 60 * 60)
        return if (hours > 0) {
            "%d:%02d:%02d".format(hours, minutes, seconds)
        } else {
            "%d:%02d".format(minutes, seconds)
        }
    }
    
    private fun formatDate(timestamp: Long): String {
        val sdf = java.text.SimpleDateFormat("MMM d, yyyy", java.util.Locale.getDefault())
        return sdf.format(java.util.Date(timestamp))
    }
}
