package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.media.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Clean media-centric Podcast Screen
 * 
 * Note: This is a simplified implementation with placeholder data.
 * Full service integration will be added when podcast services
 * are finalized.
 */
@HiltViewModel
class PodcastViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(PodcastScreenState())
    val uiState: StateFlow<PodcastScreenState> = _uiState.asStateFlow()
    
    init {
        loadPodcastData()
    }
    
    private fun loadPodcastData() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            // Simulate loading delay
            delay(300)
            
            _uiState.update {
                PodcastScreenState(
                    subscribedShows = generateSampleShows(),
                    latestEpisodes = generateSampleEpisodes(),
                    queuedEpisodes = emptyList(),
                    downloadedEpisodes = emptyList(),
                    isLoading = false
                )
            }
        }
    }
    
    private fun generateSampleShows(): List<PodcastShow> {
        return (1..5).map { index ->
            PodcastShow(
                id = "show_$index",
                title = "Sample Podcast $index",
                author = "Podcast Author $index",
                artworkUrl = null,
                description = "This is a sample podcast description.",
                episodeCount = 10 + index * 5,
                unplayedCount = index,
                lastUpdated = "Dec ${index}, 2024"
            )
        }
    }
    
    private fun generateSampleEpisodes(): List<PodcastEpisode> {
        return (1..10).map { index ->
            PodcastEpisode(
                id = "episode_$index",
                showId = "show_${(index % 5) + 1}",
                showTitle = "Sample Podcast ${(index % 5) + 1}",
                showArtworkUrl = null,
                title = "Episode $index: Sample Episode Title",
                description = "This is a sample episode description with some content.",
                publishedDate = "Dec ${10 - index}, 2024",
                duration = "${30 + index * 5}:00",
                progress = if (index % 3 == 0) 0.5f else 0f,
                remainingTime = if (index % 3 == 0) "${15 + index * 2}:00" else null,
                isNew = index <= 3,
                isDownloaded = index % 4 == 0,
                isPlaying = false
            )
        }
    }
    
    fun playEpisode(episode: PodcastEpisode) {
        viewModelScope.launch {
            _uiState.update { 
                it.copy(nowPlaying = episode.copy(isPlaying = true))
            }
        }
    }
    
    fun downloadEpisode(episode: PodcastEpisode) {
        viewModelScope.launch {
            // Simulate download
            val downloaded = _uiState.value.downloadedEpisodes + episode.copy(isDownloaded = true)
            _uiState.update { it.copy(downloadedEpisodes = downloaded) }
        }
    }
    
    fun addToQueue(episode: PodcastEpisode) {
        viewModelScope.launch {
            val queued = _uiState.value.queuedEpisodes + episode
            _uiState.update { it.copy(queuedEpisodes = queued) }
        }
    }
    
    fun removeFromQueue(episode: PodcastEpisode) {
        viewModelScope.launch {
            val queued = _uiState.value.queuedEpisodes.filter { it.id != episode.id }
            _uiState.update { it.copy(queuedEpisodes = queued) }
        }
    }
    
    fun markAsPlayed(episode: PodcastEpisode) {
        viewModelScope.launch {
            val latest = _uiState.value.latestEpisodes.map {
                if (it.id == episode.id) it.copy(isNew = false, progress = 1f) else it
            }
            _uiState.update { it.copy(latestEpisodes = latest) }
        }
    }
    
    fun refreshFeeds() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            delay(1000) // Simulate refresh
            loadPodcastData()
        }
    }
    
    fun importOpml(opmlContent: String) {
        viewModelScope.launch {
            // Placeholder for OPML import
            loadPodcastData()
        }
    }
    
    fun exportOpml(): String {
        // Placeholder for OPML export
        return """<?xml version="1.0" encoding="UTF-8"?>
            |<opml version="1.0">
            |  <head><title>Podcast Subscriptions</title></head>
            |  <body></body>
            |</opml>""".trimMargin()
    }
}
