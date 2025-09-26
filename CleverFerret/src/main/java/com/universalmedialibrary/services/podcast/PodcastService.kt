package com.universalmedialibrary.services.podcast

import android.content.Context
import com.universalmedialibrary.core.FeatureFlags
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.jsoup.Jsoup
import java.io.File
import java.io.FileOutputStream
import java.net.URL
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Podcast Service for discovery, subscription, and management
 * 
 * Provides functionality for:
 * - Searching and discovering podcasts
 * - Managing podcast subscriptions
 * - Downloading episodes for offline listening
 * - RSS feed parsing and updates
 */
@Singleton
class PodcastService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private val httpClient = OkHttpClient()
    
    private val _subscriptions = MutableStateFlow<List<PodcastSubscription>>(emptyList())
    val subscriptions: StateFlow<List<PodcastSubscription>> = _subscriptions.asStateFlow()
    
    private val _downloadQueue = MutableStateFlow<List<EpisodeDownload>>(emptyList())
    val downloadQueue: StateFlow<List<EpisodeDownload>> = _downloadQueue.asStateFlow()
    
    /**
     * Search for podcasts using iTunes Search API
     */
    suspend fun searchPodcasts(query: String, limit: Int = 20): PodcastSearchResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_PODCASTS) {
            return@withContext PodcastSearchResult(
                success = false,
                error = "Podcast features are disabled"
            )
        }
        
        try {
            val encodedQuery = java.net.URLEncoder.encode(query, "UTF-8")
            val url = "https://itunes.apple.com/search?term=$encodedQuery&media=podcast&limit=$limit"
            
            val request = Request.Builder()
                .url(url)
                .build()
            
            val response = httpClient.newCall(request).execute()
            val responseBody = response.body?.string()
            
            if (response.isSuccessful && responseBody != null) {
                // Parse iTunes Search API response
                val podcasts = parseItunesSearchResponse(responseBody)
                PodcastSearchResult(
                    success = true,
                    podcasts = podcasts
                )
            } else {
                PodcastSearchResult(
                    success = false,
                    error = "Search request failed: ${response.code}"
                )
            }
        } catch (e: Exception) {
            PodcastSearchResult(
                success = false,
                error = "Error searching podcasts: ${e.message}"
            )
        }
    }
    
    /**
     * Subscribe to a podcast by RSS feed URL
     */
    suspend fun subscribeToPodcast(feedUrl: String): SubscriptionResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_PODCASTS) {
            return@withContext SubscriptionResult(
                success = false,
                error = "Podcast features are disabled"
            )
        }
        
        try {
            val podcastInfo = parsePodcastFeed(feedUrl)
            if (podcastInfo != null) {
                val subscription = PodcastSubscription(
                    id = generateSubscriptionId(),
                    title = podcastInfo.title,
                    description = podcastInfo.description,
                    feedUrl = feedUrl,
                    imageUrl = podcastInfo.imageUrl,
                    author = podcastInfo.author,
                    subscribeDate = System.currentTimeMillis()
                )
                
                val currentSubs = _subscriptions.value.toMutableList()
                currentSubs.add(subscription)
                _subscriptions.value = currentSubs
                
                SubscriptionResult(
                    success = true,
                    subscription = subscription
                )
            } else {
                SubscriptionResult(
                    success = false,
                    error = "Failed to parse podcast feed"
                )
            }
        } catch (e: Exception) {
            SubscriptionResult(
                success = false,
                error = "Error subscribing to podcast: ${e.message}"
            )
        }
    }
    
    /**
     * Unsubscribe from a podcast
     */
    suspend fun unsubscribeFromPodcast(subscriptionId: String): Boolean = withContext(Dispatchers.IO) {
        try {
            val currentSubs = _subscriptions.value.toMutableList()
            val removed = currentSubs.removeIf { it.id == subscriptionId }
            if (removed) {
                _subscriptions.value = currentSubs
            }
            removed
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Get episodes for a subscribed podcast
     */
    suspend fun getEpisodes(subscription: PodcastSubscription): EpisodesResult = withContext(Dispatchers.IO) {
        try {
            val episodes = parsePodcastEpisodes(subscription.feedUrl)
            EpisodesResult(
                success = true,
                episodes = episodes
            )
        } catch (e: Exception) {
            EpisodesResult(
                success = false,
                error = "Error fetching episodes: ${e.message}"
            )
        }
    }
    
    /**
     * Download an episode for offline listening
     */
    suspend fun downloadEpisode(episode: PodcastEpisode): DownloadResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_PODCASTS) {
            return@withContext DownloadResult(
                success = false,
                error = "Podcast features are disabled"
            )
        }
        
        try {
            val downloadDir = File(context.getExternalFilesDir(null), "podcast_downloads")
            if (!downloadDir.exists()) {
                downloadDir.mkdirs()
            }
            
            val fileName = "${episode.id}_${System.currentTimeMillis()}.mp3"
            val outputFile = File(downloadDir, fileName)
            
            val download = EpisodeDownload(
                episodeId = episode.id,
                fileName = fileName,
                progress = 0f,
                status = DownloadStatus.DOWNLOADING
            )
            
            // Add to download queue
            val currentDownloads = _downloadQueue.value.toMutableList()
            currentDownloads.add(download)
            _downloadQueue.value = currentDownloads
            
            // Download the file
            val url = URL(episode.audioUrl)
            val connection = url.openConnection()
            val totalSize = connection.contentLength
            
            connection.getInputStream().use { input ->
                FileOutputStream(outputFile).use { output ->
                    val buffer = ByteArray(4096)
                    var downloaded = 0
                    var bytesRead: Int
                    
                    while (input.read(buffer).also { bytesRead = it } != -1) {
                        output.write(buffer, 0, bytesRead)
                        downloaded += bytesRead
                        
                        val progress = if (totalSize > 0) downloaded.toFloat() / totalSize else 0f
                        updateDownloadProgress(episode.id, progress)
                    }
                }
            }
            
            // Mark as completed
            updateDownloadStatus(episode.id, DownloadStatus.COMPLETED)
            
            DownloadResult(
                success = true,
                localPath = outputFile.absolutePath
            )
            
        } catch (e: Exception) {
            updateDownloadStatus(episode.id, DownloadStatus.FAILED)
            DownloadResult(
                success = false,
                error = "Error downloading episode: ${e.message}"
            )
        }
    }
    
    /**
     * Check if podcasts feature is available
     */
    fun isAvailable(): Boolean = FeatureFlags.ENABLE_PODCASTS
    
    private fun parseItunesSearchResponse(responseBody: String): List<PodcastInfo> {
        // This is a simplified parser - in production, use proper JSON parsing
        val podcasts = mutableListOf<PodcastInfo>()
        try {
            // Parse iTunes API JSON response
            // For now, return a mock result
            podcasts.add(
                PodcastInfo(
                    title = "Sample Podcast",
                    description = "A sample podcast from search results",
                    feedUrl = "https://example.com/feed.xml",
                    imageUrl = "https://example.com/image.jpg",
                    author = "Sample Author"
                )
            )
        } catch (e: Exception) {
            // Handle parsing errors
        }
        return podcasts
    }
    
    private suspend fun parsePodcastFeed(feedUrl: String): PodcastInfo? {
        return try {
            val request = Request.Builder().url(feedUrl).build()
            val response = httpClient.newCall(request).execute()
            val body = response.body?.string()
            
            if (response.isSuccessful && body != null) {
                val doc = Jsoup.parse(body, "", org.jsoup.parser.Parser.xmlParser())
                
                val title = doc.select("channel title").first()?.text() ?: "Unknown Podcast"
                val description = doc.select("channel description").first()?.text() ?: ""
                val imageUrl = doc.select("channel image url").first()?.text() ?: ""
                val author = doc.select("channel managingEditor").first()?.text() ?: ""
                
                PodcastInfo(
                    title = title,
                    description = description,
                    feedUrl = feedUrl,
                    imageUrl = imageUrl,
                    author = author
                )
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private suspend fun parsePodcastEpisodes(feedUrl: String): List<PodcastEpisode> {
        return try {
            val request = Request.Builder().url(feedUrl).build()
            val response = httpClient.newCall(request).execute()
            val body = response.body?.string()
            
            if (response.isSuccessful && body != null) {
                val doc = Jsoup.parse(body, "", org.jsoup.parser.Parser.xmlParser())
                val episodes = mutableListOf<PodcastEpisode>()
                
                doc.select("item").forEach { item ->
                    val title = item.select("title").first()?.text() ?: "Unknown Episode"
                    val description = item.select("description").first()?.text() ?: ""
                    val audioUrl = item.select("enclosure").first()?.attr("url") ?: ""
                    val pubDate = item.select("pubDate").first()?.text() ?: ""
                    
                    if (audioUrl.isNotEmpty()) {
                        episodes.add(
                            PodcastEpisode(
                                id = generateEpisodeId(),
                                title = title,
                                description = description,
                                audioUrl = audioUrl,
                                publishDate = pubDate,
                                duration = 0 // Could be parsed from duration tag if available
                            )
                        )
                    }
                }
                
                episodes
            } else {
                emptyList()
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private fun updateDownloadProgress(episodeId: String, progress: Float) {
        val currentDownloads = _downloadQueue.value.toMutableList()
        val index = currentDownloads.indexOfFirst { it.episodeId == episodeId }
        if (index >= 0) {
            currentDownloads[index] = currentDownloads[index].copy(progress = progress)
            _downloadQueue.value = currentDownloads
        }
    }
    
    private fun updateDownloadStatus(episodeId: String, status: DownloadStatus) {
        val currentDownloads = _downloadQueue.value.toMutableList()
        val index = currentDownloads.indexOfFirst { it.episodeId == episodeId }
        if (index >= 0) {
            currentDownloads[index] = currentDownloads[index].copy(status = status)
            _downloadQueue.value = currentDownloads
        }
    }
    
    private fun generateSubscriptionId(): String = "sub_${System.currentTimeMillis()}"
    private fun generateEpisodeId(): String = "ep_${System.currentTimeMillis()}"
}

// Data classes for podcast functionality

data class PodcastSearchResult(
    val success: Boolean,
    val podcasts: List<PodcastInfo> = emptyList(),
    val error: String? = null
)

data class PodcastInfo(
    val title: String,
    val description: String,
    val feedUrl: String,
    val imageUrl: String,
    val author: String
)

data class PodcastSubscription(
    val id: String,
    val title: String,
    val description: String,
    val feedUrl: String,
    val imageUrl: String,
    val author: String,
    val subscribeDate: Long
)

data class SubscriptionResult(
    val success: Boolean,
    val subscription: PodcastSubscription? = null,
    val error: String? = null
)

data class EpisodesResult(
    val success: Boolean,
    val episodes: List<PodcastEpisode> = emptyList(),
    val error: String? = null
)

data class PodcastEpisode(
    val id: String,
    val title: String,
    val description: String,
    val audioUrl: String,
    val publishDate: String,
    val duration: Long // in milliseconds
)

data class EpisodeDownload(
    val episodeId: String,
    val fileName: String,
    val progress: Float,
    val status: DownloadStatus
)

data class DownloadResult(
    val success: Boolean,
    val localPath: String? = null,
    val error: String? = null
)

enum class DownloadStatus {
    QUEUED,
    DOWNLOADING,
    COMPLETED,
    FAILED,
    PAUSED
}