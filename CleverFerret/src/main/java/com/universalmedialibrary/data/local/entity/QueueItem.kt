package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity representing an item in a playback queue
 *
 * Links MediaItems to PlaybackQueues with position and metadata.
 * Supports all media types with type-specific metadata.
 */
@Entity(
    tableName = "queue_items",
    foreignKeys = [
        ForeignKey(
            entity = PlaybackQueue::class,
            parentColumns = ["queueId"],
            childColumns = ["queueId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["mediaItemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["queueId", "queuePosition"], unique = true),
        Index(value = ["mediaItemId"]),
        Index(value = ["queueId", "isCurrentlyPlaying"]),
        Index(value = ["addedToQueue"])
    ]
)
data class QueueItem(
    @PrimaryKey(autoGenerate = true)
    val queueItemId: Long = 0,

    val queueId: Long,
    val mediaItemId: Long,
    val queuePosition: Int, // Order in queue (0-based)

    val isCurrentlyPlaying: Boolean = false,
    val playbackPositionMs: Long = 0, // Current position in media
    val durationMs: Long = 0, // Total duration (cached)

    // Media type-specific data
    val mediaType: String, // "MUSIC", "AUDIOBOOK", "TTS", "VIDEO", "PODCAST"
    val chapterIndex: Int? = null, // For audiobooks/podcasts
    val chapterTitle: String? = null,
    val playbackSpeed: Float = 1.0f,

    // Metadata cache for quick access
    val title: String = "",
    val artist: String? = null,
    val album: String? = null,
    val coverArtUrl: String? = null,

    // Queue management
    val addedToQueue: Long = System.currentTimeMillis(),
    val lastPlayed: Long? = null,
    val playCount: Int = 0,

    // Playback settings
    val skipSilence: Boolean = false,
    val crossfadeEnabled: Boolean = false
)
