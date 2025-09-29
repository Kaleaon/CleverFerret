package com.universalmedialibrary.services.podcast

/**
 * Data models for podcast services
 */

data class Podcast(
    val id: String,
    val title: String,
    val description: String?,
    val author: String?,
    val imageUrl: String?,
    val feedUrl: String,
    val websiteUrl: String?,
    val category: String?,
    val language: String?,
    val explicit: Boolean = false,
    val episodeCount: Int = 0,
    val lastUpdated: Long = System.currentTimeMillis(),
    val subscribed: Boolean = false,
    val autoDownload: Boolean = false
)

data class PodcastEpisode(
    val id: String,
    val podcastId: String,
    val title: String,
    val description: String?,
    val audioUrl: String,
    val duration: Long = 0L, // in milliseconds
    val publishDate: Long,
    val episodeNumber: Int?,
    val seasonNumber: Int?,
    val imageUrl: String?,
    val fileSize: Long = 0L,
    val mimeType: String?,
    val downloaded: Boolean = false,
    val played: Boolean = false,
    val playPosition: Long = 0L,
    val favorite: Boolean = false
)

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

data class PodcastSubscription(
    val podcastId: String,
    val subscribedAt: Long,
    val autoDownload: Boolean,
    val downloadWifiOnly: Boolean,
    val keepEpisodes: Int, // number of episodes to keep
    val notifyNewEpisodes: Boolean,
    val lastChecked: Long = 0L
)

sealed class PodcastOperationResult {
    data class Success(val message: String) : PodcastOperationResult()
    data class Error(val message: String, val exception: Throwable? = null) : PodcastOperationResult()
}

data class PodcastDownloadProgress(
    val episodeId: String,
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