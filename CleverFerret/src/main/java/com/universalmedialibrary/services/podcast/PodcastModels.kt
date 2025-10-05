package com.universalmedialibrary.services.podcast

import com.universalmedialibrary.data.local.entity.podcast.*

/**
 * Domain models for podcast services
 * These are data transfer objects used in the UI and service layers
 * They map to/from database entities
 */

// Domain model for Podcast (maps to PodcastEntity)
data class Podcast(
    val id: Long = 0,
    val title: String,
    val description: String? = null,
    val author: String? = null,
    val imageUrl: String? = null,
    val feedUrl: String,
    val websiteUrl: String? = null,
    val category: String? = null,
    val language: String? = null,
    val explicit: Boolean = false,
    val episodeCount: Int = 0,
    val lastUpdated: Long = System.currentTimeMillis(),
    val subscribed: Boolean = false,
    val autoDownload: Boolean = false,
    val isFavorite: Boolean = false
)

// Domain model for PodcastEpisode (maps to PodcastEpisodeEntity)
data class PodcastEpisode(
    val id: Long = 0,
    val podcastId: Long,
    val guid: String,
    val title: String,
    val description: String? = null,
    val audioUrl: String,
    val duration: Long = 0L, // in milliseconds
    val publishDate: Long,
    val episodeNumber: Int? = null,
    val seasonNumber: Int? = null,
    val imageUrl: String? = null,
    val fileSize: Long = 0L,
    val mimeType: String? = null,
    val downloaded: Boolean = false,
    val localFilePath: String? = null,
    val played: Boolean = false,
    val playPosition: Long = 0L,
    val favorite: Boolean = false,
    val isNew: Boolean = true
)

// Domain model for search results
data class PodcastSearchResult(
    val id: String,
    val title: String,
    val description: String?,
    val author: String?,
    val imageUrl: String?,
    val feedUrl: String,
    val category: String?,
    val episodeCount: Int?,
    val lastEpisodeDate: Long?,
    val source: String // "podcast_index", "itunes", etc.
)

// Domain model for subscription settings
data class PodcastSubscription(
    val podcastId: Long,
    val subscribedAt: Long,
    val autoDownload: Boolean,
    val downloadWifiOnly: Boolean,
    val keepEpisodes: Int,
    val notifyNewEpisodes: Boolean,
    val lastChecked: Long = 0L
)

// Result types
sealed class PodcastOperationResult {
    data class Success(val message: String) : PodcastOperationResult()
    data class Error(val message: String, val exception: Throwable? = null) : PodcastOperationResult()
}

data class PodcastDownloadProgress(
    val episodeId: Long,
    val progress: Float, // 0.0 to 1.0
    val downloadedBytes: Long,
    val totalBytes: Long,
    val status: DownloadStatus
)

enum class DownloadStatus {
    PENDING,
    DOWNLOADING,
    COMPLETED,
    FAILED,
    CANCELLED,
    PAUSED
}

// Mapper extensions to convert between domain models and entities
fun PodcastEntity.toDomain() = Podcast(
    id = id,
    title = title,
    description = description,
    author = author,
    imageUrl = imageUrl,
    feedUrl = feedUrl,
    websiteUrl = websiteUrl,
    category = category,
    language = language,
    explicit = explicit,
    episodeCount = totalEpisodes,
    lastUpdated = lastUpdated ?: System.currentTimeMillis(),
    subscribed = isSubscribed,
    autoDownload = autoDownload,
    isFavorite = isFavorite
)

fun Podcast.toEntity() = PodcastEntity(
    id = id,
    title = title,
    description = description,
    author = author,
    imageUrl = imageUrl,
    feedUrl = feedUrl,
    websiteUrl = websiteUrl,
    category = category,
    language = language,
    explicit = explicit,
    totalEpisodes = episodeCount,
    lastUpdated = lastUpdated,
    isSubscribed = subscribed,
    autoDownload = autoDownload,
    isFavorite = isFavorite
)

fun PodcastEpisodeEntity.toDomain() = PodcastEpisode(
    id = id,
    podcastId = podcastId,
    guid = guid,
    title = title,
    description = description,
    audioUrl = audioUrl,
    duration = duration,
    publishDate = publishDate,
    episodeNumber = episodeNumber,
    seasonNumber = seasonNumber,
    imageUrl = imageUrl,
    fileSize = fileSize,
    mimeType = mimeType,
    downloaded = downloaded,
    localFilePath = localFilePath,
    played = played,
    playPosition = playPosition,
    favorite = isFavorite,
    isNew = isNew
)

fun PodcastEpisode.toEntity() = PodcastEpisodeEntity(
    id = id,
    podcastId = podcastId,
    guid = guid,
    title = title,
    description = description,
    audioUrl = audioUrl,
    duration = duration,
    publishDate = publishDate,
    episodeNumber = episodeNumber,
    seasonNumber = seasonNumber,
    imageUrl = imageUrl,
    fileSize = fileSize,
    mimeType = mimeType,
    downloaded = downloaded,
    localFilePath = localFilePath,
    played = played,
    playPosition = playPosition,
    isFavorite = favorite,
    isNew = isNew
)
