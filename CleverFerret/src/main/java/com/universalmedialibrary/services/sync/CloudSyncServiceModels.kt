package com.universalmedialibrary.services.sync

import android.content.Context
import android.util.Log
import androidx.work.*
import com.universalmedialibrary.jobs.JobContractType
import com.universalmedialibrary.jobs.JobExecutionState
import com.universalmedialibrary.jobs.JobStatusBus
import com.universalmedialibrary.jobs.JobStatusEvent
import com.universalmedialibrary.jobs.WorkScheduler
import dagger.hilt.EntryPoint
import dagger.hilt.InstallIn
import dagger.hilt.android.EntryPointAccessors
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton
import java.io.File

/**
 * Cloud Sync Service
 * Features:
 * - Reading position sync across devices
 * - Annotations and highlights sync
 * - Settings synchronization
 * - Conflict resolution (last-write-wins, manual, merge)
 * - Selective sync (choose what to sync)
 * - Auto-sync and manual sync
 * - Sync status tracking
 * - Delta sync for efficiency
 */

enum class SyncProvider {
    GOOGLE_DRIVE,
    DROPBOX,
    ONEDRIVE,
    CUSTOM_SERVER,
    LOCAL_NETWORK
}
enum class SyncStatus {
    IDLE,
    SYNCING,
    SYNCED,
    ERROR,
    CONFLICT
}
enum class ConflictResolution {
    LAST_WRITE_WINS,    // Automatic: newest wins
    MANUAL,             // User chooses
    MERGE,              // Attempt to merge changes
    LOCAL_WINS,         // Always prefer local
    REMOTE_WINS         // Always prefer remote
}
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
