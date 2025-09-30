package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Index

/**
 * Entity representing a persistent playback queue
 *
 * Supports multiple queue types:
 * - MAIN_QUEUE: Primary system-wide queue
 * - MUSIC_QUEUE: Music-specific queue with album/playlist context
 * - AUDIOBOOK_QUEUE: Audiobook chapter queue
 * - TTS_QUEUE: Text-to-speech reading queue
 * - CUSTOM: User-created custom queues
 */
@Entity(
    tableName = "playback_queues",
    indices = [
        Index(value = ["queueName"], unique = true),
        Index(value = ["isActive"]),
        Index(value = ["lastUsed"])
    ]
)
data class PlaybackQueue(
    @PrimaryKey(autoGenerate = true)
    val queueId: Long = 0,

    val queueName: String, // "MAIN_QUEUE", "MUSIC_QUEUE", etc.
    val displayName: String, // User-friendly name
    val queueType: String, // "MAIN", "MUSIC", "AUDIOBOOK", "TTS", "CUSTOM"

    val isActive: Boolean = false, // Currently playing queue
    val isPersistent: Boolean = true, // Whether to persist across sessions

    val repeatMode: String = "NONE", // "NONE", "ONE", "ALL", "SHUFFLE"
    val shuffleEnabled: Boolean = false,

    val created: Long = System.currentTimeMillis(),
    val lastUsed: Long = System.currentTimeMillis(),
    val lastModified: Long = System.currentTimeMillis()
)
