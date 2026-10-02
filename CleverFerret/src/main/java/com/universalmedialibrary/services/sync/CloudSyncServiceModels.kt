package com.universalmedialibrary.services.sync

import kotlinx.serialization.Serializable

/**
 * Cloud Sync Service Models
 */

@Serializable
enum class SyncProvider {
    GOOGLE_DRIVE,
    DROPBOX,
    ONEDRIVE,
    CUSTOM_SERVER,
    LOCAL_NETWORK
}

@Serializable
enum class SyncStatus {
    IDLE,
    SYNCING,
    SYNCED,
    ERROR,
    CONFLICT
}

@Serializable
enum class ConflictResolution {
    LAST_WRITE_WINS,    // Automatic: newest wins
    MANUAL,             // User chooses
    MERGE,              // Attempt to merge changes
    LOCAL_WINS,         // Always prefer local
    REMOTE_WINS         // Always prefer remote
}

@Serializable
data class SyncSettings(
    val enabled: Boolean = false,
    val provider: SyncProvider = SyncProvider.GOOGLE_DRIVE,
    val autoSync: Boolean = true,
    val syncInterval: Long = 30,           // minutes
    val syncOnWifiOnly: Boolean = true,
    val syncReadingPosition: Boolean = true,
    val syncAnnotations: Boolean = true,
    val syncSettings: Boolean = true,
    val syncLibraries: Boolean = false,    // Only metadata, not files
    val syncBookCovers: Boolean = false,
    val conflictResolution: ConflictResolution = ConflictResolution.LAST_WRITE_WINS,
    val encryptData: Boolean = true
)

@Serializable
data class SyncState(
    val status: SyncStatus = SyncStatus.IDLE,
    val lastSyncTime: Long? = null,
    val nextSyncTime: Long? = null,
    val progress: Float = 0f,
    val itemsSynced: Int = 0,
    val totalItems: Int = 0,
    val conflictsCount: Int = 0,
    val errorMessage: String? = null
)

data class CloudSyncConflict(
    val itemId: String,
    val itemType: String,          // "reading_position", "annotation", "setting"
    val localData: Any,
    val remoteData: Any,
    val localTimestamp: Long,
    val remoteTimestamp: Long
)

data class SyncItem(
    val id: String,
    val type: String,
    val data: Map<String, Any>,
    val timestamp: Long,
    val deviceId: String
)

