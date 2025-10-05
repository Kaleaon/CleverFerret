package com.universalmedialibrary.data.repository.podcast

import com.universalmedialibrary.data.local.dao.PodcastDao
import com.universalmedialibrary.data.local.dao.PodcastEpisodeDao
import com.universalmedialibrary.data.local.dao.PodcastSubscriptionDao
import com.universalmedialibrary.data.local.entity.podcast.PodcastEntity
import com.universalmedialibrary.data.local.entity.podcast.PodcastEpisodeEntity
import com.universalmedialibrary.data.local.entity.podcast.PodcastSubscriptionEntity
import com.universalmedialibrary.services.podcast.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for podcast data
 * Based on AntennaPod's repository pattern for clean architecture
 * 
 * Coordinates between:
 * - Local database (Room)
 * - Remote RSS feeds (PodcastService)
 * - Search APIs
 */
@Singleton
class PodcastRepository @Inject constructor(
    private val podcastDao: PodcastDao,
    private val episodeDao: PodcastEpisodeDao,
    private val subscriptionDao: PodcastSubscriptionDao,
    private val podcastService: PodcastService
) {
    
    // ===== Podcast Operations =====
    
    fun getAllPodcasts(): Flow<List<Podcast>> =
        podcastDao.getAllPodcasts().map { entities ->
            entities.map { it.toDomain() }
        }
    
    fun getSubscribedPodcasts(): Flow<List<Podcast>> =
        podcastDao.getSubscribedPodcasts().map { entities ->
            entities.map { it.toDomain() }
        }
    
    fun getPodcastById(id: Long): Flow<Podcast?> =
        podcastDao.getPodcastById(id).map { it?.toDomain() }
    
    fun getFavoritePodcasts(): Flow<List<Podcast>> =
        podcastDao.getFavoritePodcasts().map { entities ->
            entities.map { it.toDomain() }
        }
    
    fun getPodcastsWithNewEpisodes(): Flow<List<Podcast>> =
        podcastDao.getPodcastsWithNewEpisodes().map { entities ->
            entities.map { it.toDomain() }
        }
    
    fun searchPodcasts(query: String): Flow<List<Podcast>> =
        podcastDao.searchPodcasts(query).map { entities ->
            entities.map { it.toDomain() }
        }
    
    suspend fun insertPodcast(podcast: Podcast): Long {
        return podcastDao.insertPodcast(podcast.toEntity())
    }
    
    suspend fun updatePodcast(podcast: Podcast) {
        podcastDao.updatePodcast(podcast.toEntity())
    }
    
    suspend fun deletePodcast(podcast: Podcast) {
        podcastDao.deletePodcast(podcast.toEntity())
    }
    
    suspend fun subscribeToPodcast(feedUrl: String): PodcastOperationResult {
        return try {
            // Check if already subscribed
            val existing = podcastDao.getPodcastByFeedUrl(feedUrl)
            if (existing != null && existing.isSubscribed) {
                return PodcastOperationResult.Error("Already subscribed to this podcast")
            }
            
            // Parse RSS feed
            val rssFeed = podcastService.parseRSSFeed(feedUrl)
            
            // Create podcast entity
            val podcastEntity = PodcastEntity(
                title = rssFeed.title,
                description = rssFeed.description,
                author = rssFeed.author,
                feedUrl = feedUrl,
                websiteUrl = rssFeed.link,
                imageUrl = rssFeed.imageUrl,
                category = rssFeed.category,
                language = rssFeed.language,
                explicit = rssFeed.explicit,
                isSubscribed = true,
                subscribedAt = System.currentTimeMillis(),
                lastUpdated = System.currentTimeMillis(),
                totalEpisodes = rssFeed.items.size
            )
            
            // Insert podcast
            val podcastId = if (existing != null) {
                podcastDao.subscribe(existing.id)
                existing.id
            } else {
                podcastDao.insertPodcast(podcastEntity)
            }
            
            // Insert episodes
            val episodeEntities = rssFeed.items.mapIndexed { index, item ->
                PodcastEpisodeEntity(
                    podcastId = podcastId,
                    guid = item.guid ?: "$feedUrl-$index",
                    title = item.title,
                    description = item.description,
                    audioUrl = item.audioUrl ?: "",
                    duration = parseDuration(item.duration),
                    publishDate = parsePublishDate(item.pubDate),
                    episodeNumber = item.episodeNumber,
                    seasonNumber = item.seasonNumber,
                    imageUrl = item.imageUrl ?: rssFeed.imageUrl,
                    fileSize = item.fileSize ?: 0,
                    mimeType = "audio/mpeg"
                )
            }
            episodeDao.insertEpisodes(episodeEntities)
            
            // Create subscription settings
            val subscription = PodcastSubscriptionEntity(
                podcastId = podcastId,
                subscribedAt = System.currentTimeMillis()
            )
            subscriptionDao.insertSubscription(subscription)
            
            PodcastOperationResult.Success("Subscribed to ${rssFeed.title}")
        } catch (e: Exception) {
            PodcastOperationResult.Error("Failed to subscribe: ${e.message}", e)
        }
    }
    
    suspend fun unsubscribe(podcastId: Long) {
        podcastDao.unsubscribe(podcastId)
    }
    
    suspend fun toggleFavorite(podcastId: Long, favorite: Boolean) {
        podcastDao.updateFavoriteStatus(podcastId, favorite)
    }
    
    // ===== Episode Operations =====
    
    fun getEpisodesByPodcast(podcastId: Long): Flow<List<PodcastEpisode>> =
        episodeDao.getEpisodesByPodcast(podcastId).map { entities ->
            entities.map { it.toDomain() }
        }
    
    fun getEpisodeById(id: Long): Flow<PodcastEpisode?> =
        episodeDao.getEpisodeById(id).map { it?.toDomain() }
    
    fun getDownloadedEpisodes(): Flow<List<PodcastEpisode>> =
        episodeDao.getDownloadedEpisodes().map { entities ->
            entities.map { it.toDomain() }
        }
    
    fun getNewEpisodes(): Flow<List<PodcastEpisode>> =
        episodeDao.getNewEpisodes().map { entities ->
            entities.map { it.toDomain() }
        }
    
    fun getFavoriteEpisodes(): Flow<List<PodcastEpisode>> =
        episodeDao.getFavoriteEpisodes().map { entities ->
            entities.map { it.toDomain() }
        }
    
    fun getQueuedEpisodes(): Flow<List<PodcastEpisode>> =
        episodeDao.getQueuedEpisodes().map { entities ->
            entities.map { it.toDomain() }
        }
    
    suspend fun updateEpisode(episode: PodcastEpisode) {
        episodeDao.updateEpisode(episode.toEntity())
    }
    
    suspend fun markEpisodeAsPlayed(episodeId: Long) {
        episodeDao.markAsPlayed(episodeId)
    }
    
    suspend fun markEpisodeAsUnplayed(episodeId: Long) {
        episodeDao.markAsUnplayed(episodeId)
    }
    
    suspend fun updatePlayPosition(episodeId: Long, position: Long) {
        episodeDao.updatePlayPosition(episodeId, position)
    }
    
    suspend fun toggleEpisodeFavorite(episodeId: Long, favorite: Boolean) {
        episodeDao.updateFavoriteStatus(episodeId, favorite)
    }
    
    // ===== Search Operations =====
    
    suspend fun searchPodcastsOnline(query: String, apiKeys: Map<String, String> = emptyMap()): List<PodcastSearchResult> {
        return podcastService.searchPodcasts(query, apiKeys)
    }
    
    // ===== Refresh Operations =====
    
    suspend fun refreshPodcast(podcastId: Long): PodcastOperationResult {
        return try {
            val podcast = podcastDao.getPodcastById(podcastId)
                .map { it?.toDomain() }
                .firstOrNull()
                ?: return PodcastOperationResult.Error("Podcast not found")
            
            val rssFeed = podcastService.parseRSSFeed(podcast.feedUrl)
            
            // Update podcast info
            podcastDao.updateLastUpdated(podcastId, System.currentTimeMillis(), rssFeed.items.size)
            
            // Get existing episodes
            val existingGuids = episodeDao.getEpisodesByPodcast(podcastId)
                .map { episodes -> episodes.map { it.guid }.toSet() }
                .firstOrNull() ?: emptySet()
            
            // Find new episodes
            val newEpisodes = rssFeed.items
                .filter { item -> item.guid !in existingGuids }
                .map { item ->
                    PodcastEpisodeEntity(
                        podcastId = podcastId,
                        guid = item.guid ?: "${podcast.feedUrl}-${System.currentTimeMillis()}",
                        title = item.title,
                        description = item.description,
                        audioUrl = item.audioUrl ?: "",
                        duration = parseDuration(item.duration),
                        publishDate = parsePublishDate(item.pubDate),
                        episodeNumber = item.episodeNumber,
                        seasonNumber = item.seasonNumber,
                        imageUrl = item.imageUrl ?: podcast.imageUrl,
                        fileSize = item.fileSize ?: 0
                    )
                }
            
            if (newEpisodes.isNotEmpty()) {
                episodeDao.insertEpisodes(newEpisodes)
                
                // Update new episode count
                val newCount = episodeDao.getNewEpisodeCountForPodcast(podcastId)
                podcastDao.updateNewEpisodeCount(podcastId, newCount)
            }
            
            podcastDao.updateLastChecked(podcastId, System.currentTimeMillis())
            
            PodcastOperationResult.Success("Found ${newEpisodes.size} new episodes")
        } catch (e: Exception) {
            PodcastOperationResult.Error("Failed to refresh: ${e.message}", e)
        }
    }
    
    // ===== Helper Methods =====
    
    private fun parseDuration(durationStr: String?): Long {
        if (durationStr.isNullOrEmpty()) return 0L
        
        return try {
            if (durationStr.contains(":")) {
                val parts = durationStr.split(":")
                when (parts.size) {
                    3 -> { // HH:MM:SS
                        val hours = parts[0].toLong()
                        val minutes = parts[1].toLong()
                        val seconds = parts[2].toLong()
                        (hours * 3600 + minutes * 60 + seconds) * 1000
                    }
                    2 -> { // MM:SS
                        val minutes = parts[0].toLong()
                        val seconds = parts[1].toLong()
                        (minutes * 60 + seconds) * 1000
                    }
                    else -> 0L
                }
            } else {
                // Assume it's seconds
                (durationStr.toLongOrNull() ?: 0L) * 1000
            }
        } catch (e: Exception) {
            0L
        }
    }
    
    private fun parsePublishDate(dateStr: String?): Long {
        if (dateStr.isNullOrEmpty()) return System.currentTimeMillis()
        
        return try {
            val format = java.text.SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", java.util.Locale.ENGLISH)
            format.parse(dateStr)?.time ?: System.currentTimeMillis()
        } catch (e: Exception) {
            System.currentTimeMillis()
        }
    }
}