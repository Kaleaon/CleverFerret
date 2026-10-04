package com.universalmedialibrary.services.sync

import kotlinx.serialization.Serializable

/**
 * Unified Cloud Provider options.
 */
@Serializable
enum class SyncProvider {
    GOOGLE_DRIVE,
    DROPBOX,
    ONEDRIVE,
    CUSTOM_SERVER,
    LOCAL_NETWORK
}

/**
 * High-level sync status enum.
 */
@Serializable
enum class SyncStatus {
    IDLE,
    SYNCING,
    SYNCED,
    ERROR,
    CONFLICT
}

/**
 * Unified Conflict Resolution Strategy across background and foreground sync.
 */
@Serializable
enum class ConflictResolutionStrategy {
    USE_LOCAL,    // Always prefer local version
    USE_REMOTE,   // Always prefer remote version
    USE_NEWER,    // Last write wins (newest timestamp wins)
    MERGE,        // Attempt intelligent merge of local and remote fields
    ASK_USER      // Manual resolution required
}

// Backwards compatibility aliases for conflict resolution strategies
typealias EnhancedConflictResolution = ConflictResolutionStrategy
typealias ConflictResolution = ConflictResolutionStrategy

/**
 * Settings for cloud synchronization.
 */
@Serializable
data class SyncSettings(
    val enabled: Boolean = false,
    val provider: SyncProvider = SyncProvider.GOOGLE_DRIVE,
    val autoSync: Boolean = true,
    val syncInterval: Long = 30, // minutes
    val syncOnWifiOnly: Boolean = true,
    val syncReadingPosition: Boolean = true,
    val syncAnnotations: Boolean = true,
    val syncSettings: Boolean = true,
    val syncLibraries: Boolean = false,
    val syncBookCovers: Boolean = false,
    val conflictResolution: ConflictResolutionStrategy = ConflictResolutionStrategy.USE_NEWER,
    val encryptData: Boolean = true
)

/**
 * Synchronization options for a specific sync execution pass.
 */
data class SyncOptions(
    val lastSyncTime: Long = 0,
    val conflictResolution: ConflictResolutionStrategy = ConflictResolutionStrategy.USE_NEWER,
    val selectiveSync: Boolean = true,
    val maxBandwidth: Long = 0,
    val syncMediaFiles: Boolean = false,
    val syncOnlyOnWifi: Boolean = true
)

/**
 * Unified sync state flow model observed by UI and background tasks.
 */
data class SyncState(
    val isLoading: Boolean = false,
    val status: String = "",
    val error: String? = null,
    val syncStatus: SyncStatus = SyncStatus.IDLE,
    val lastSyncTime: Long = 0,
    val nextSyncTime: Long? = null,
    val progress: Float = 0f,
    val itemsSynced: Int = 0,
    val totalItems: Int = 0,
    val conflictsCount: Int = 0,
    val errorMessage: String? = null
)

// Backwards compatibility alias for sync state
typealias EnhancedSyncState = SyncState

/**
 * Detailed conflict tracking model.
 */
data class SyncConflict(
    val itemId: String,
    val itemType: String, // "MEDIA_ITEM", "READING_PROGRESS", "BOOKMARK", "settings", etc.
    val localData: Any,
    val remoteData: Any,
    val localTimestamp: Long,
    val remoteTimestamp: Long,
    val conflictType: ConflictType = ConflictType.OTHER,
    val resolution: ConflictResolutionStrategy? = null
)

// Backwards compatibility aliases for conflicts
typealias EnhancedSyncConflict = SyncConflict
typealias CloudSyncConflict = SyncConflict

/**
 * Conflict type classification.
 */
enum class ConflictType {
    MODIFY_MODIFY,
    DELETE_MODIFY,
    MODIFY_DELETE,
    OTHER
}

/**
 * Result summary of a completed sync execution.
 */
data class SyncResult(
    val success: Boolean,
    val itemsSynced: Int = 0,
    val uploadedCount: Int = itemsSynced,
    val downloadedCount: Int = 0,
    val conflictCount: Int = 0,
    val conflictsDetected: Int = 0,
    val conflictsResolved: Int = 0,
    val conflicts: List<SyncConflict> = emptyList(),
    val error: String? = null,
    val timestamp: Long = System.currentTimeMillis()
)

/**
 * Individual sync item model.
 */
data class SyncItem(
    val id: String,
    val type: String,
    val data: Map<String, Any>,
    val timestamp: Long,
    val deviceId: String
)

/**
 * Change operation type.
 */
@Serializable
enum class ChangeOperation {
    CREATE,
    MODIFY,
    DELETE
}

/**
 * In-memory sync change tracking model.
 */
data class SyncChange(
    val itemId: String,
    val itemType: String,
    val operation: ChangeOperation,
    val timestamp: Long,
    val data: Any? = null,
    val checksum: String? = null
)

/**
 * Serializable record for persisting change journal records to storage.
 */
@Serializable
data class SyncChangeRecord(
    val itemId: String,
    val itemType: String,
    val operation: ChangeOperation,
    val timestamp: Long,
    val dataJson: String? = null,
    val checksum: String? = null
)
