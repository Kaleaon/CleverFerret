package com.universalmedialibrary.services.podcast

/**
 * Represents a podcast show.
 *
 * @property id The unique identifier for the podcast.
 * @property title The title of the podcast.
 * @property description A summary or description of the podcast.
 * @property author The author or publisher of the podcast.
 * @property imageUrl The URL for the podcast's cover art.
 * @property feedUrl The URL of the podcast's RSS feed.
 * @property websiteUrl The URL of the podcast's official website.
 * @property category The category of the podcast.
 * @property language The language of the podcast.
 * @property explicit Whether the podcast contains explicit content.
 * @property episodeCount The total number of episodes.
 * @property lastUpdated The timestamp of when the podcast was last updated.
 * @property subscribed Whether the user is subscribed to this podcast.
 * @property autoDownload Whether to automatically download new episodes.
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

/**
 * Represents a single episode of a podcast.
 *
 * @property id The unique identifier for the episode.
 * @property podcastId The ID of the podcast this episode belongs to.
 * @property title The title of the episode.
 * @property description A summary or description of the episode.
 * @property audioUrl The URL of the episode's audio file.
 * @property duration The duration of the episode in milliseconds.
 * @property publishDate The timestamp of when the episode was published.
 * @property episodeNumber The episode number.
 * @property seasonNumber The season number.
 * @property imageUrl The URL for the episode's artwork.
 * @property fileSize The size of the audio file in bytes.
 * @property mimeType The MIME type of the audio file.
 * @property downloaded Whether the episode has been downloaded.
 * @property played Whether the episode has been played.
 * @property playPosition The last playback position in milliseconds.
 * @property favorite Whether the user has marked this episode as a favorite.
 */
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

/**
 * Represents a podcast search result from an external API.
 *
 * @property id The unique identifier from the source.
 * @property title The title of the podcast.
 * @property description A summary or description of the podcast.
 * @property author The author or publisher of the podcast.
 * @property imageUrl The URL for the podcast's cover art.
 * @property feedUrl The URL of the podcast's RSS feed.
 * @property category The category of the podcast.
 * @property episodeCount The total number of episodes.
 * @property lastEpisodeDate The timestamp of the last episode's publication.
 * @property source The source of the search result (e.g., "podcast_index", "itunes").
 */
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

/**
 * Represents a user's subscription to a podcast.
 *
 * @property podcastId The ID of the subscribed podcast.
 * @property subscribedAt The timestamp of when the user subscribed.
 * @property autoDownload Whether to automatically download new episodes.
 * @property downloadWifiOnly Whether to download only when connected to Wi-Fi.
 * @property keepEpisodes The number of recent episodes to keep downloaded.
 * @property notifyNewEpisodes Whether to notify the user about new episodes.
 * @property lastChecked The timestamp of when the feed was last checked for new episodes.
 */
data class PodcastSubscription(
    val podcastId: String,
    val subscribedAt: Long,
    val autoDownload: Boolean,
    val downloadWifiOnly: Boolean,
    val keepEpisodes: Int, // number of episodes to keep
    val notifyNewEpisodes: Boolean,
    val lastChecked: Long = 0L
)

/**
 * Represents the result of a podcast-related operation.
 */
sealed class PodcastOperationResult {
    /** A successful operation with a message. */
    data class Success(val message: String) : PodcastOperationResult()
    /** A failed operation with an error message. */
    data class Error(val message: String, val exception: Throwable? = null) : PodcastOperationResult()
}

/**
 * Represents the progress of a podcast episode download.
 *
 * @property episodeId The ID of the episode being downloaded.
 * @property progress The download progress, from 0.0 to 1.0.
 * @property downloadedBytes The number of bytes downloaded so far.
 * @property totalBytes The total size of the file in bytes.
 * @property status The current status of the download.
 */
data class PodcastDownloadProgress(
    val episodeId: String,
    val progress: Float, // 0.0 to 1.0
    val downloadedBytes: Long,
    val totalBytes: Long,
    val status: DownloadStatus
)

/**
 * The status of a download operation.
 */
enum class DownloadStatus {
    /** The download is waiting to start. */
    PENDING,
    /** The download is in progress. */
    DOWNLOADING,
    /** The download has completed successfully. */
    COMPLETED,
    /** The download has failed. */
    FAILED,
    /** The download has been cancelled. */
    CANCELLED,
    /** The download is paused. */
    PAUSED
}