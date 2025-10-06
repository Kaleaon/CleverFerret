package com.universalmedialibrary.data.local.entity.podcast

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Podcast subscription settings
 * Stores per-podcast preferences for subscriptions
 */
@Entity(
    tableName = "podcast_subscriptions",
    foreignKeys = [
        ForeignKey(
            entity = PodcastEntity::class,
            parentColumns = ["id"],
            childColumns = ["podcastId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["podcastId"], unique = true)
    ]
)
data class PodcastSubscriptionEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    // Foreign key
    val podcastId: Long,

    // Subscription info
    val subscribedAt: Long,
    val isActive: Boolean = true,

    // Auto-download settings
    val autoDownload: Boolean = false,
    val downloadWifiOnly: Boolean = true,
    val downloadLimit: Int = 5, // Max episodes to auto-download

    // Episode management
    val keepEpisodes: Int = 10, // Number to keep, -1 = all
    val autoDelete: Boolean = true,
    val deleteAfterPlayed: Boolean = false,

    // Notifications
    val notifyNewEpisodes: Boolean = true,
    val notificationSound: String? = null,

    // Update frequency
    val updateInterval: Long = 3600000, // 1 hour in milliseconds
    val lastChecked: Long = 0,

    // Playback preferences
    val defaultPlaybackSpeed: Float = 1.0f,
    val skipIntro: Int = 0,
    val skipOutro: Int = 0,
    val removesilence: Boolean = false,

    // Filter settings
    val episodeFilter: String? = null, // JSON string for complex filters
    val sortOrder: String = "newest_first", // newest_first, oldest_first, etc.

    // Metadata
    val modifiedAt: Long = System.currentTimeMillis()
)
