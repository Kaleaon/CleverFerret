package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.TypeConverter
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

/**
 * Entity representing a collaborative playlist session
 * Supports Chromecast and Android Auto sharing with QR code joining
 */
@Entity(tableName = "collaborative_sessions")
data class CollaborativeSession(
    @PrimaryKey
    val sessionId: String, // Unique session identifier
    val name: String,
    val playlistId: Long, // Reference to the shared playlist
    val hostDeviceId: String, // Device that created the session
    val hostDeviceName: String,
    val sessionType: SessionType, // Chromecast, Android Auto, or Both
    val status: SessionStatus,
    val createdAt: Long = System.currentTimeMillis(),
    val startedAt: Long? = null,
    val endedAt: Long? = null,
    val maxClients: Int = 10, // Maximum number of connected devices
    val allowClientAdditions: Boolean = true, // Allow clients to add songs
    val allowClientVoting: Boolean = true, // Allow voting on next track
    val requiresApproval: Boolean = false, // Master must approve client additions
    val qrCodeData: String? = null, // QR code connection data
    val connectionPort: Int = 8080, // Port for WebSocket connections
    val castSessionId: String? = null, // Chromecast session ID if active
    val currentTrackIndex: Int = 0,
    val isPlaying: Boolean = false
)

/**
 * Session type for different casting targets
 */
enum class SessionType {
    CHROMECAST,      // Casting to Chromecast device
    ANDROID_AUTO,    // Sharing to Android Auto
    BOTH,            // Both Chromecast and Android Auto
    LOCAL            // Local network only (no casting)
}

/**
 * Status of a collaborative session
 */
enum class SessionStatus {
    CREATED,         // Session created but not started
    ACTIVE,          // Session active and accepting connections
    PAUSED,          // Playback paused
    ENDED,           // Session ended
    ERROR            // Session encountered an error
}

/**
 * Entity representing a connected client in a session
 */
@Entity(tableName = "session_clients")
data class SessionClient(
    @PrimaryKey
    val clientId: String, // Unique client identifier
    val sessionId: String, // Reference to session
    val deviceName: String,
    val deviceType: String, // Android, iOS, Web, etc.
    val joinedAt: Long = System.currentTimeMillis(),
    val lastActiveAt: Long = System.currentTimeMillis(),
    val permissions: ClientPermissions,
    val isConnected: Boolean = true,
    val contributedTracks: Int = 0, // Number of tracks added by this client
    val votesUsed: Int = 0 // Number of votes cast
)

/**
 * Permissions for a client in a session
 */
@Serializable
data class ClientPermissions(
    val canAddTracks: Boolean = true,
    val canVote: Boolean = true,
    val canRemoveTracks: Boolean = false,
    val canSkipTracks: Boolean = false,
    val canControlPlayback: Boolean = false,
    val maxTracksPerSession: Int = 5
)

/**
 * Entity representing a track in a collaborative session queue
 */
@Entity(tableName = "session_queue_items")
data class SessionQueueItem(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val sessionId: String,
    val mediaItemId: Long, // Reference to MediaItem
    val addedBy: String, // Client ID that added this track
    val position: Int, // Position in queue
    val votes: Int = 0, // Number of upvotes
    val addedAt: Long = System.currentTimeMillis(),
    val playedAt: Long? = null,
    val status: QueueItemStatus = QueueItemStatus.QUEUED,
    val approvedBy: String? = null // Host who approved it (if required)
)

/**
 * Status of a queue item
 */
enum class QueueItemStatus {
    QUEUED,          // Waiting to be played
    PLAYING,         // Currently playing
    PLAYED,          // Already played
    SKIPPED,         // Skipped by host/vote
    REMOVED          // Removed from queue
}

/**
 * Entity representing a vote on a queue item
 */
@Entity(
    tableName = "session_votes",
    primaryKeys = ["sessionId", "clientId", "queueItemId"]
)
data class SessionVote(
    val sessionId: String,
    val clientId: String,
    val queueItemId: Long,
    val voteType: VoteType,
    val timestamp: Long = System.currentTimeMillis()
)

/**
 * Type of vote
 */
enum class VoteType {
    UPVOTE,          // Vote to play sooner
    DOWNVOTE         // Vote to play later
}

/**
 * Type converters for collaborative session entities
 */
class CollaborativeSessionConverters {
    private val json = Json { ignoreUnknownKeys = true }

    @TypeConverter
    fun fromSessionType(value: SessionType): String = value.name

    @TypeConverter
    fun toSessionType(value: String): SessionType = SessionType.valueOf(value)

    @TypeConverter
    fun fromSessionStatus(value: SessionStatus): String = value.name

    @TypeConverter
    fun toSessionStatus(value: String): SessionStatus = SessionStatus.valueOf(value)

    @TypeConverter
    fun fromQueueItemStatus(value: QueueItemStatus): String = value.name

    @TypeConverter
    fun toQueueItemStatus(value: String): QueueItemStatus = QueueItemStatus.valueOf(value)

    @TypeConverter
    fun fromVoteType(value: VoteType): String = value.name

    @TypeConverter
    fun toVoteType(value: String): VoteType = VoteType.valueOf(value)

    @TypeConverter
    fun fromClientPermissions(value: ClientPermissions): String {
        return json.encodeToString(value)
    }

    @TypeConverter
    fun toClientPermissions(value: String): ClientPermissions {
        return json.decodeFromString(value)
    }
}
