package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.PodcastEpisodeDao
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
import com.universalmedialibrary.services.podcast.Podcast as DomainPodcast
import com.universalmedialibrary.services.podcast.PodcastEpisode as DomainEpisode
import com.universalmedialibrary.ui.media.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

/**
 * ViewModel for Clean media-centric Podcast Screen
 */
@HiltViewModel
class PodcastViewModel @Inject constructor(
    private val podcastRepository: PodcastRepository,
    private val episodeDao: PodcastEpisodeDao,
    private val downloadManager: PodcastDownloadManager
) : ViewModel() {

    private val nowPlaying = MutableStateFlow<PodcastEpisode?>(null)
    private val isLoading = MutableStateFlow(true)

    private data class Snapshot(
        val podcasts: List<DomainPodcast>,
        val newEpisodes: List<DomainEpisode>,
        val queuedEpisodes: List<DomainEpisode>,
        val downloadedEpisodes: List<DomainEpisode>
    )

    val uiState: StateFlow<PodcastScreenState> =
        combine(
            combine(
                podcastRepository.getSubscribedPodcasts(),
                podcastRepository.getNewEpisodes(),
                podcastRepository.getQueuedEpisodes(),
                podcastRepository.getDownloadedEpisodes()
            ) { podcasts, newEpisodes, queuedEpisodes, downloadedEpisodes ->
                Snapshot(
                    podcasts = podcasts,
                    newEpisodes = newEpisodes,
                    queuedEpisodes = queuedEpisodes,
                    downloadedEpisodes = downloadedEpisodes
                )
            },
            nowPlaying,
            isLoading
        ) { snapshot, nowPlayingEpisode, loading ->
            val podcastsById = snapshot.podcasts.associateBy { it.id }
            val newCountByPodcast = snapshot.newEpisodes.groupingBy { it.podcastId }.eachCount()

            val shows = snapshot.podcasts
                .sortedBy { it.title.lowercase(Locale.getDefault()) }
                .map { podcast ->
                    podcast.toUiShow(unplayedCount = newCountByPodcast[podcast.id] ?: 0)
                }

            val latest = snapshot.newEpisodes
                .sortedByDescending { it.publishDate }
                .map { it.toUiEpisode(podcastsById) }

            val queued = snapshot.queuedEpisodes
                .sortedByDescending { it.publishDate }
                .map { it.toUiEpisode(podcastsById) }

            val downloaded = snapshot.downloadedEpisodes
                .sortedByDescending { it.publishDate }
                .map { it.toUiEpisode(podcastsById) }

            PodcastScreenState(
                subscribedShows = shows,
                latestEpisodes = latest,
                queuedEpisodes = queued,
                downloadedEpisodes = downloaded,
                nowPlaying = nowPlayingEpisode,
                isLoading = loading
            )
        }.stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5_000),
            initialValue = PodcastScreenState(isLoading = true)
        )

    init {
        // Mark as loaded once our flows begin emitting.
        viewModelScope.launch {
            isLoading.value = false
        }
    }
    
    fun playEpisode(episode: PodcastEpisode) {
        viewModelScope.launch {
            nowPlaying.value = episode.copy(isPlaying = true)
        }
    }
    
    fun downloadEpisode(episode: PodcastEpisode) {
        viewModelScope.launch {
            val episodeId = episode.id.toLongOrNull() ?: return@launch
            val audioUrl = episode.audioUrl?.takeIf { it.isNotBlank() } ?: return@launch
            downloadManager.downloadEpisode(
                episodeId = episodeId,
                audioUrl = audioUrl,
                episodeTitle = episode.title,
                podcastTitle = episode.showTitle
            )
        }
    }
    
    fun addToQueue(episode: PodcastEpisode) {
        viewModelScope.launch {
            val episodeId = episode.id.toLongOrNull() ?: return@launch
            // Put at end; DB ordering is handled by queuePosition.
            val position = uiState.value.queuedEpisodes.size + 1
            episodeDao.updateQueueStatus(id = episodeId, queued = true, position = position)
        }
    }
    
    fun removeFromQueue(episode: PodcastEpisode) {
        viewModelScope.launch {
            val episodeId = episode.id.toLongOrNull() ?: return@launch
            episodeDao.updateQueueStatus(id = episodeId, queued = false, position = null)
        }
    }
    
    fun markAsPlayed(episode: PodcastEpisode) {
        viewModelScope.launch {
            val episodeId = episode.id.toLongOrNull() ?: return@launch
            episodeDao.markAsPlayed(episodeId)
        }
    }
    
    fun refreshFeeds() {
        viewModelScope.launch {
            // Feed refresh is handled by PodcastService/Repository when subscriptions update.
            // Keep this as a lightweight UI hint.
            isLoading.value = true
            isLoading.value = false
        }
    }
    
    fun importOpml(opmlContent: String) {
        viewModelScope.launch {
            // OPML import is handled by the legacy podcast manager for now.
            // Wire this to a proper importer when the media-centric flow is finalized.
        }
    }
    
    fun exportOpml(): String {
        // OPML export is handled by the legacy podcast manager for now.
        return """<?xml version="1.0" encoding="UTF-8"?>
            |<opml version="1.0">
            |  <head><title>Podcast Subscriptions</title></head>
            |  <body></body>
            |</opml>""".trimMargin()
    }

    private fun DomainPodcast.toUiShow(unplayedCount: Int): PodcastShow {
        return PodcastShow(
            id = id.toString(),
            title = title,
            author = author ?: "Podcast",
            artworkUrl = imageUrl,
            description = description,
            episodeCount = episodeCount,
            unplayedCount = unplayedCount,
            lastUpdated = formatDate(lastUpdated)
        )
    }

    private fun DomainEpisode.toUiEpisode(podcastsById: Map<Long, DomainPodcast>): PodcastEpisode {
        val show = podcastsById[podcastId]
        val durationString = formatDuration(duration)
        val progress = if (duration > 0) (playPosition.toFloat() / duration.toFloat()).coerceIn(0f, 1f) else 0f
        val remaining = (duration - playPosition).coerceAtLeast(0L)

        return PodcastEpisode(
            id = id.toString(),
            showId = podcastId.toString(),
            showTitle = show?.title ?: "Podcast",
            showArtworkUrl = show?.imageUrl ?: imageUrl,
            title = title,
            description = description,
            audioUrl = audioUrl,
            publishedDate = formatDate(publishDate),
            duration = durationString,
            progress = progress,
            remainingTime = if (progress in 0f..0.999f && remaining > 0) formatDuration(remaining) else null,
            isNew = isNew,
            isDownloaded = downloaded,
            isPlaying = false,
            fileSize = if (fileSize > 0) formatBytes(fileSize) else null
        )
    }

    private fun formatDuration(durationMs: Long): String {
        if (durationMs <= 0) return "0:00"
        val totalSeconds = durationMs / 1000
        val hours = totalSeconds / 3600
        val minutes = (totalSeconds % 3600) / 60
        val seconds = totalSeconds % 60
        return if (hours > 0) {
            "%d:%02d:%02d".format(hours, minutes, seconds)
        } else {
            "%d:%02d".format(minutes, seconds)
        }
    }

    private fun formatBytes(bytes: Long): String {
        val kb = 1024.0
        val mb = kb * 1024.0
        val gb = mb * 1024.0
        return when {
            bytes >= gb -> "%.1f GB".format(bytes / gb)
            bytes >= mb -> "%.1f MB".format(bytes / mb)
            bytes >= kb -> "%.0f KB".format(bytes / kb)
            else -> "$bytes B"
        }
    }

    private fun formatDate(epochMs: Long): String {
        return try {
            SimpleDateFormat("MMM d, yyyy", Locale.getDefault()).format(Date(epochMs))
        } catch (_: Exception) {
            ""
        }
    }
}
