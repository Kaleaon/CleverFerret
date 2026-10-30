package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Entity representing an outbound remote sync mutation queue record.
 * Used to store pending playback progress or rating updates when offline
 * or when remote API requests fail.
 */
@Entity(tableName = "remote_sync_mutations")
data class RemoteSyncMutation(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val serverType: String, // "PLEX", "JELLYFIN", "EMBY"
    val serverId: Long,
    val targetItemId: String,
    val mutationType: String, // "PROGRESS", "RATING"
    val payloadJson: String,
    val retryCount: Int = 0,
    val status: String = "PENDING", // "PENDING", "IN_PROGRESS", "FAILED", "COMPLETED"
    val createdAt: Long = System.currentTimeMillis(),
    val lastAttemptAt: Long? = null
)
