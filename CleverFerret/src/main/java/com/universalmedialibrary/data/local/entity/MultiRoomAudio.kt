package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * Multi-room audio synchronization entities inspired by Snapcast.
 */

@Serializable
@Entity(
    tableName = "audio_sync_servers",
    indices = [Index(value = ["serverName"], unique = true)]
)
data class AudioSyncServer(
    @PrimaryKey(autoGenerate = true)
    val serverId: Long = 0,

    val serverName: String,
    val serverUrl: String,
    val port: Int = 1704,

    // Server Configuration
    val enabled: Boolean = true,
    val isLocalServer: Boolean = false,

    // Audio Configuration
    val codec: AudioCodec = AudioCodec.FLAC,
    val sampleRate: Int = 48000,
    val bitDepth: Int = 16,
    val channels: Int = 2,

    // Network
    val bufferMs: Int = 1000,
    val latencyMs: Int = 0,

    // Metadata
    val lastConnected: Long? = null,
    val createdAt: Long = System.currentTimeMillis()
)

@Serializable
@Entity(
    tableName = "audio_sync_clients",
    indices = [
        Index(value = ["serverId"]),
        Index(value = ["clientId"], unique = true)
    ]
)
data class AudioSyncClient(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    val serverId: Long,
    val clientId: String,
    val clientName: String,

    // Client Configuration
    val enabled: Boolean = true,
    val volume: Int = 100,
    val muted: Boolean = false,

    // Sync Configuration
    val latencyMs: Int = 0,
    val groupId: Long? = null,

    // Status
    val connected: Boolean = false,
    val lastSeen: Long? = null,

    // Device Info
    val deviceType: String? = null,
    val osVersion: String? = null,
    val appVersion: String? = null
)

@Serializable
@Entity(
    tableName = "audio_sync_groups",
    indices = [Index(value = ["serverId"])]
)
data class AudioSyncGroup(
    @PrimaryKey(autoGenerate = true)
    val groupId: Long = 0,

    val serverId: Long,
    val groupName: String,

    // Group Configuration
    val enabled: Boolean = true,
    val volume: Int = 100,
    val muted: Boolean = false,

    // Stream Configuration
    val streamId: String? = null,

    // Metadata
    val createdAt: Long = System.currentTimeMillis()
)

@Serializable
@Entity(
    tableName = "audio_streams",
    indices = [Index(value = ["serverId"])]
)
data class AudioStream(
    @PrimaryKey(autoGenerate = true)
    val streamId: Long = 0,

    val serverId: Long,
    val streamName: String,
    val streamType: StreamType,

    // Source Configuration
    val sourceUri: String,
    val codec: AudioCodec = AudioCodec.FLAC,
    val sampleRate: Int = 48000,
    val bitDepth: Int = 16,
    val channels: Int = 2,

    // Status
    val enabled: Boolean = true,
    val playing: Boolean = false,

    // Metadata
    val createdAt: Long = System.currentTimeMillis()
)

enum class AudioCodec {
    PCM,
    FLAC,
    VORBIS,
    OPUS
}

enum class StreamType {
    PIPE,
    ALSA,
    TCP,
    PROCESS,
    FILE,
    HTTP
}

@Serializable
@Entity(
    tableName = "sync_statistics",
    indices = [
        Index(value = ["clientId"]),
        Index(value = ["timestamp"])
    ]
)
data class SyncStatistics(
    @PrimaryKey(autoGenerate = true)
    val statId: Long = 0,

    val clientId: String,
    val timestamp: Long = System.currentTimeMillis(),

    // Sync Metrics
    val timeDeviationMs: Float = 0f,
    val bufferLevel: Int = 0,
    val droppedFrames: Int = 0,

    // Network Metrics
    val latencyMs: Int = 0,
    val jitterMs: Float = 0f,
    val packetLoss: Float = 0f
)
