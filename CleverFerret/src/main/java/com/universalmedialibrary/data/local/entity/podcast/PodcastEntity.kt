package com.universalmedialibrary.data.local.entity.podcast

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Podcast entity - represents a podcast feed/show
 * Based on AntennaPod's Feed entity architecture
 */
@Entity(
    tableName = "podcasts",
    indices = [
        Index(value = ["feedUrl"], unique = true),
        Index(value = ["title"])
    ]
)
data class PodcastEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    // Basic info
    val title: String,
    val description: String? = null,
    val author: String? = null,
    val language: String? = null,

    // URLs
    val feedUrl: String,
    val websiteUrl: String? = null,
    val imageUrl: String? = null,
    val localImagePath: String? = null,

    // Categories and metadata
    val category: String? = null,
    val keywords: String? = null, // Comma-separated
    val explicit: Boolean = false,

    // Subscription info
    val isSubscribed: Boolean = false,
    val subscribedAt: Long? = null,

    // Auto-download settings
    val autoDownload: Boolean = false,
    val downloadWifiOnly: Boolean = true,
    val keepEpisodes: Int = 10, // Number of episodes to keep, -1 = all
    val autoDelete: Boolean = true,

    // Notifications
    val notifyNewEpisodes: Boolean = true,

    // Update info
    val lastChecked: Long? = null,
    val lastUpdated: Long? = null,
    val lastRefreshError: String? = null,

    // Stats
    val totalEpisodes: Int = 0,
    val newEpisodeCount: Int = 0,

    // Playback preferences
    val playbackSpeed: Float = 1.0f,
    val skipIntro: Int = 0, // Seconds to skip at start
    val skipOutro: Int = 0, // Seconds to skip at end

    // Organization
    val tags: String? = null, // Comma-separated tags
    val customOrder: Int = 0,
    val isFavorite: Boolean = false,

    // Metadata
    val createdAt: Long = System.currentTimeMillis(),
    val modifiedAt: Long = System.currentTimeMillis()
)
