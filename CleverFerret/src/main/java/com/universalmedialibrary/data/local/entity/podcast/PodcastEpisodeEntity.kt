package com.universalmedialibrary.data.local.entity.podcast

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Podcast episode entity
 * Based on AntennaPod's FeedItem entity architecture
 */
@Entity(
    tableName = "podcast_episodes",
    foreignKeys = [
        ForeignKey(
            entity = PodcastEntity::class,
            parentColumns = ["id"],
            childColumns = ["podcastId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["podcastId"]),
        Index(value = ["guid"], unique = true),
        Index(value = ["publishDate"]),
        Index(value = ["isNew"]),
        Index(value = ["downloaded"])
    ]
)
data class PodcastEpisodeEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    // Foreign key
    val podcastId: Long,

    // Basic info
    val guid: String, // Unique identifier from RSS feed
    val title: String,
    val description: String? = null,
    val link: String? = null,

    // Media info
    val audioUrl: String,
    val mimeType: String? = null,
    val fileSize: Long = 0, // in bytes
    val duration: Long = 0, // in milliseconds

    // Publishing info
    val publishDate: Long,
    val episodeNumber: Int? = null,
    val seasonNumber: Int? = null,

    // Images
    val imageUrl: String? = null,
    val localImagePath: String? = null,

    // Download status
    val downloaded: Boolean = false,
    val localFilePath: String? = null,
    val localFileChecksum: String? = null,
    val downloadProgress: Float = 0f, // 0.0 to 1.0
    val downloadedAt: Long? = null,
    val downloadError: String? = null,

    // Playback status
    val played: Boolean = false,
    val playPosition: Long = 0, // in milliseconds
    val playbackSpeed: Float? = null, // null = use podcast default
    val lastPlayedAt: Long? = null,

    // User flags
    val isNew: Boolean = true,
    val isFavorite: Boolean = false,
    val isQueued: Boolean = false,
    val queuePosition: Int? = null,

    // Chapter support
    val hasChapters: Boolean = false,
    val chaptersUrl: String? = null,

    // Metadata
    val addedAt: Long = System.currentTimeMillis(),
    val modifiedAt: Long = System.currentTimeMillis()
)
