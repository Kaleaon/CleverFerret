package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity representing a playback session state
 * 
 * Tracks the current playback state across app restarts and provides
 * context for resuming playback exactly where the user left off.
 */
@Entity(
    tableName = "playback_sessions",
    foreignKeys = [
        ForeignKey(
            entity = PlaybackQueue::class,
            parentColumns = ["queueId"],
            childColumns = ["activeQueueId"],
            onDelete = ForeignKey.SET_NULL
        ),
        ForeignKey(
            entity = QueueItem::class,
            parentColumns = ["queueItemId"],
            childColumns = ["currentQueueItemId"],
            onDelete = ForeignKey.SET_NULL
        )
    ],
    indices = [
        Index(value = ["sessionName"], unique = true),
        Index(value = ["isActive"]),
        Index(value = ["lastUsed"]),
        Index(value = ["activeQueueId"]),
        Index(value = ["currentQueueItemId"])
    ]
)
data class PlaybackSession(
    @PrimaryKey(autoGenerate = true)
    val sessionId: Long = 0,
    
    val sessionName: String, // "DEFAULT", "MUSIC_SESSION", "AUDIOBOOK_SESSION"
    val sessionType: String, // "GLOBAL", "MUSIC", "AUDIOBOOK", "TTS"
    
    val isActive: Boolean = false,
    val activeQueueId: Long? = null,
    val currentQueueItemId: Long? = null,
    
    // Playback state
    val isPlaying: Boolean = false,
    val isPaused: Boolean = false,
    val currentPositionMs: Long = 0,
    val playbackSpeed: Float = 1.0f,
    val volume: Float = 1.0f,
    
    // Audio settings
    val audioFocusGained: Boolean = false,
    val skipSilenceEnabled: Boolean = false,
    val crossfadeEnabled: Boolean = false,
    val crossfadeDurationMs: Int = 0,
    
    // Advanced features
    val sleepTimerEndTime: Long? = null,
    val sleepTimerPauseOnComplete: Boolean = true,
    val equalizerPreset: String? = null,
    
    // Session metadata
    val created: Long = System.currentTimeMillis(),
    val lastUsed: Long = System.currentTimeMillis(),
    val sessionDurationMs: Long = 0, // Total time in this session
    
    // Platform integration
    val mediaSessionToken: String? = null,
    val notificationId: Int? = null
)