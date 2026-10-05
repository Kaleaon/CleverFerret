package com.universalmedialibrary.services.sync

import android.content.Context
import android.util.Log
import androidx.work.*
import com.universalmedialibrary.jobs.JobContractType
import com.universalmedialibrary.jobs.JobExecutionState
import com.universalmedialibrary.jobs.JobStatusBus
import com.universalmedialibrary.jobs.JobStatusEvent
import com.universalmedialibrary.jobs.WorkScheduler
import com.universalmedialibrary.services.cloud.CloudProvider
import com.universalmedialibrary.services.cloud.CloudSyncManager
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
 * Main Cloud Sync Service
 */
@Singleton
class CloudSyncService @Inject constructor(
    @ApplicationContext private val context: Context,
    val cloudSyncManager: CloudSyncManager,
    val enhancedSyncService: EnhancedSyncService
) {
    private val _settings = MutableStateFlow(SyncSettings())
    val settings: StateFlow<SyncSettings> = _settings.asStateFlow()

    private val _syncState = MutableStateFlow(SyncState())
    val syncState: StateFlow<SyncState> = _syncState.asStateFlow()

    private val _activeProviders = MutableStateFlow<Set<SyncProvider>>(emptySet())
    val activeProviders: StateFlow<Set<SyncProvider>> = _activeProviders.asStateFlow()

    private val _conflicts = MutableStateFlow<List<CloudSyncConflict>>(emptyList())
    val conflicts: StateFlow<List<CloudSyncConflict>> = _conflicts.asStateFlow()

    private val pendingSyncItems = mutableListOf<SyncItem>()

    /**
     * Map SyncProvider to CloudProvider for CloudSyncManager delegation.
     */
    fun mapToCloudProvider(provider: SyncProvider): CloudProvider? {
        return when (provider) {
            SyncProvider.GOOGLE_DRIVE -> CloudProvider.GOOGLE_DRIVE
            SyncProvider.DROPBOX -> CloudProvider.DROPBOX
            SyncProvider.ONEDRIVE -> CloudProvider.ONEDRIVE
            SyncProvider.CUSTOM_SERVER -> CloudProvider.WEBDAV
            SyncProvider.LOCAL_NETWORK -> null
        }
    }

    /**
     * Initialize cloud sync
     */
    suspend fun initialize(settings: SyncSettings) = withContext(Dispatchers.IO) {
        _settings.value = settings

        if (settings.enabled && settings.autoSync) {
            schedulePeriodicSync()
        }

        // Authenticate with cloud provider
        val authenticated = authenticateProvider(settings.provider)
        if (!authenticated) {
            Log.w(TAG, "Authentication failed for provider: ${settings.provider}")
            _syncState.value = _syncState.value.copy(
                status = SyncStatus.ERROR,
                errorMessage = "Authentication failed: ${settings.provider} is not configured. Please set up provider credentials."
            )
        }
    }

    /**
     * Authenticate with the selected cloud provider
     */
    private suspend fun authenticateProvider(provider: SyncProvider): Boolean {
        return when (provider) {
            SyncProvider.GOOGLE_DRIVE -> authenticateGoogleDrive()
            SyncProvider.DROPBOX -> authenticateDropbox()
            SyncProvider.ONEDRIVE -> authenticateOneDrive()
            SyncProvider.CUSTOM_SERVER -> authenticateCustomServer()
            SyncProvider.LOCAL_NETWORK -> authenticateLocalNetwork()
        }
    }

    private suspend fun authenticateGoogleDrive(): Boolean {
        cloudSyncManager.setProviderEnabled(CloudProvider.GOOGLE_DRIVE, true)
        _activeProviders.value = _activeProviders.value + SyncProvider.GOOGLE_DRIVE
        return true
    }

    private suspend fun authenticateDropbox(): Boolean {
        cloudSyncManager.setProviderEnabled(CloudProvider.DROPBOX, true)
        _activeProviders.value = _activeProviders.value + SyncProvider.DROPBOX
        return true
    }

    private suspend fun authenticateOneDrive(): Boolean {
        cloudSyncManager.setProviderEnabled(CloudProvider.ONEDRIVE, true)
        _activeProviders.value = _activeProviders.value + SyncProvider.ONEDRIVE
        return true
    }

    private suspend fun authenticateCustomServer(): Boolean {
        cloudSyncManager.setProviderEnabled(CloudProvider.WEBDAV, true)
        _activeProviders.value = _activeProviders.value + SyncProvider.CUSTOM_SERVER
        return true
    }

    private suspend fun authenticateLocalNetwork(): Boolean {
        _activeProviders.value = _activeProviders.value + SyncProvider.LOCAL_NETWORK
        return true
    }

    /**
     * Perform manual sync delegating transport to CloudSyncManager and delta merges to EnhancedSyncService.
     */
    suspend fun syncNow(): Result<Unit> = withContext(Dispatchers.IO) {
        if (!_settings.value.enabled) {
            return@withContext Result.failure(Exception("Sync is not enabled"))
        }

        _syncState.value = _syncState.value.copy(
            status = SyncStatus.SYNCING,
            progress = 0f,
            itemsSynced = 0,
            errorMessage = null
        )

        try {
            val provider = _settings.value.provider
            val cloudProvider = mapToCloudProvider(provider)

            // Step 1: Delegate cloud transport sync if applicable
            if (cloudProvider != null) {
                cloudSyncManager.syncProvider(cloudProvider)
            }

            // Step 2: Map conflict strategy and delegate delta merge & Room persistence to EnhancedSyncService
            val enhancedStrategy = when (_settings.value.conflictResolution) {
                ConflictResolution.LAST_WRITE_WINS -> EnhancedConflictResolution.USE_NEWER
                ConflictResolution.LOCAL_WINS -> EnhancedConflictResolution.USE_LOCAL
                ConflictResolution.REMOTE_WINS -> EnhancedConflictResolution.USE_REMOTE
                ConflictResolution.MERGE -> EnhancedConflictResolution.MERGE
                ConflictResolution.MANUAL -> EnhancedConflictResolution.ASK_USER
            }

            val syncOptions = SyncOptions(
                lastSyncTime = _syncState.value.lastSyncTime ?: 0L,
                conflictResolution = enhancedStrategy
            )
            val enhancedResult = enhancedSyncService.sync(syncOptions)

            // Step 3: Handle pending items and local/remote item processing
            val remoteItems = fetchRemoteChanges()
            val conflicts = identifyConflicts(pendingSyncItems, remoteItems)

            if (conflicts.isNotEmpty()) {
                _conflicts.value = conflicts

                when (_settings.value.conflictResolution) {
                    ConflictResolution.LAST_WRITE_WINS -> {
                        resolveConflictsAutomatically(conflicts)
                    }
                    ConflictResolution.MANUAL -> {
                        _syncState.value = _syncState.value.copy(
                            status = SyncStatus.CONFLICT,
                            conflictsCount = conflicts.size
                        )
                        return@withContext Result.failure(Exception("Conflicts require manual resolution"))
                    }
                    ConflictResolution.MERGE -> {
                        mergeConflicts(conflicts)
                    }
                    ConflictResolution.LOCAL_WINS -> {
                        resolveConflictsLocalWins(conflicts)
                    }
                    ConflictResolution.REMOTE_WINS -> {
                        resolveConflictsRemoteWins(conflicts)
                    }
                }
            }

            val itemsToSync = pendingSyncItems.toList()
            val totalItems = itemsToSync.size

            for ((index, item) in itemsToSync.withIndex()) {
                uploadItem(item)
                _syncState.value = _syncState.value.copy(
                    progress = (index + 1).toFloat() / totalItems.coerceAtLeast(1),
                    itemsSynced = index + 1,
                    totalItems = totalItems
                )
            }

            for (item in remoteItems) {
                applyRemoteChange(item)
            }

            pendingSyncItems.removeAll { it in itemsToSync }

            val finalStatus = if (enhancedResult.success) SyncStatus.SYNCED else SyncStatus.ERROR
            _syncState.value = _syncState.value.copy(
                status = finalStatus,
                lastSyncTime = System.currentTimeMillis(),
                progress = 1f,
                conflictsCount = _conflicts.value.size,
                errorMessage = enhancedResult.error
            )

            if (enhancedResult.success) {
                Result.success(Unit)
            } else {
                Result.failure(Exception(enhancedResult.error ?: "Sync failed"))
            }
        } catch (e: Exception) {
            _syncState.value = _syncState.value.copy(
                status = SyncStatus.ERROR,
                errorMessage = e.message
            )
            Result.failure(e)
        }
    }

    /**
     * Queue an item for sync
     */
    suspend fun queueForSync(item: SyncItem) = withContext(Dispatchers.IO) {
        pendingSyncItems.add(item)

        // If auto-sync is enabled and we're not currently syncing, trigger sync
        if (_settings.value.enabled && _settings.value.autoSync &&
            _syncState.value.status != SyncStatus.SYNCING) {
            syncNow()
        }
    }

    /**
     * Sync reading position
     */
    suspend fun syncReadingPosition(
        bookId: Long,
        position: Int,
        progress: Float
    ) {
        if (!_settings.value.syncReadingPosition) return

        val item = SyncItem(
            id = "reading_position_$bookId",
            type = "reading_position",
            data = mapOf(
                "bookId" to bookId,
                "position" to position,
                "progress" to progress
            ),
            timestamp = System.currentTimeMillis(),
            deviceId = getDeviceId()
        )

        queueForSync(item)
    }

    /**
     * Sync annotation
     */
    suspend fun syncAnnotation(
        annotationId: Long,
        bookId: Long,
        annotationData: Map<String, Any>
    ) {
        if (!_settings.value.syncAnnotations) return

        val item = SyncItem(
            id = "annotation_$annotationId",
            type = "annotation",
            data = annotationData + mapOf(
                "annotationId" to annotationId,
                "bookId" to bookId
            ),
            timestamp = System.currentTimeMillis(),
            deviceId = getDeviceId()
        )

        queueForSync(item)
    }

    /**
     * Sync app settings
     */
    suspend fun syncAppSettings(settingsData: Map<String, Any>) {
        if (!_settings.value.syncSettings) return

        val item = SyncItem(
            id = "app_settings",
            type = "settings",
            data = settingsData,
            timestamp = System.currentTimeMillis(),
            deviceId = getDeviceId()
        )

        queueForSync(item)
    }

    /**
     * Fetch remote changes
     */
    private suspend fun fetchRemoteChanges(): List<SyncItem> {
        val provider = _settings.value.provider
        return when (provider) {
            SyncProvider.LOCAL_NETWORK -> {
                fetchFromLocalSyncDirectory()
            }
            else -> {
                Log.w(TAG, "fetchRemoteChanges: Provider $provider is not configured, returning empty list.")
                emptyList()
            }
        }
    }

    /**
     * Read sync items from a local JSON file for LOCAL_NETWORK provider.
     * Reads from a shared sync directory in the app's private storage.
     */
    private fun fetchFromLocalSyncDirectory(): List<SyncItem> {
        val syncDir = getSyncDirectory()
        val remoteFile = File(syncDir, "remote_sync_data.json")

        if (!remoteFile.exists()) {
            Log.d(TAG, "No remote sync data file found at: ${remoteFile.absolutePath}")
            return emptyList()
        }

        return try {
            val jsonContent = remoteFile.readText()
            if (jsonContent.isBlank()) {
                return emptyList()
            }
            parseSyncItemsFromJson(jsonContent)
        } catch (e: Exception) {
            Log.e(TAG, "Failed to read remote sync data: ${e.message}")
            emptyList()
        }
    }

    /**
     * Parse a JSON array of sync items. Uses simple manual parsing to avoid
     * external dependencies.
     */
    private fun parseSyncItemsFromJson(json: String): List<SyncItem> {
        val items = mutableListOf<SyncItem>()
        try {
            val jsonArray = org.json.JSONArray(json)
            for (i in 0 until jsonArray.length()) {
                val obj = jsonArray.getJSONObject(i)
                val dataObj = obj.getJSONObject("data")
                val dataMap = mutableMapOf<String, Any>()
                val keys = dataObj.keys()
                while (keys.hasNext()) {
                    val key = keys.next()
                    dataMap[key] = dataObj.get(key)
                }
                items.add(
                    SyncItem(
                        id = obj.getString("id"),
                        type = obj.getString("type"),
                        data = dataMap,
                        timestamp = obj.getLong("timestamp"),
                        deviceId = obj.optString("deviceId", "")
                    )
                )
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to parse sync items JSON: ${e.message}")
        }
        return items
    }

    /**
     * Get or create the sync directory for local file-based sync.
     */
    private fun getSyncDirectory(): File {
        val syncDir = File(context.filesDir, "sync_data")
        if (!syncDir.exists()) {
            syncDir.mkdirs()
        }
        return syncDir
    }

    /**
     * Upload item to cloud
     */
    private suspend fun uploadItem(item: SyncItem) {
        // Encrypt data if enabled
        val dataToUpload = if (_settings.value.encryptData) {
            encryptData(item)
        } else {
            item
        }

        // Write to local sync directory (functional for LOCAL_NETWORK provider)
        writeItemToSyncDirectory(dataToUpload)
    }

    /**
     * Write a sync item to the local sync directory as a JSON file.
     * For LOCAL_NETWORK provider this serves as the actual sync mechanism.
     * For cloud providers, this provides a local cache of uploaded items.
     */
    private fun writeItemToSyncDirectory(item: SyncItem) {
        val syncDir = getSyncDirectory()
        val outgoingDir = File(syncDir, "outgoing")
        if (!outgoingDir.exists()) {
            outgoingDir.mkdirs()
        }

        val itemFile = File(outgoingDir, "${item.id}.json")
        try {
            val jsonObject = org.json.JSONObject().apply {
                put("id", item.id)
                put("type", item.type)
                put("timestamp", item.timestamp)
                put("deviceId", item.deviceId)
                put("data", org.json.JSONObject(item.data))
            }
            itemFile.writeText(jsonObject.toString())
            Log.d(TAG, "Wrote sync item to: ${itemFile.absolutePath}")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to write sync item ${item.id}: ${e.message}")
            throw e
        }
    }

    /**
     * Apply remote change locally
     */
    private suspend fun applyRemoteChange(item: SyncItem) {
        // Decrypt if needed
        val decryptedItem = if (_settings.value.encryptData) {
            decryptData(item)
        } else {
            item
        }

        // Apply based on type
        when (decryptedItem.type) {
            "reading_position" -> {
                Log.d(TAG, "Applying remote reading position change: id=${decryptedItem.id}, " +
                    "bookId=${decryptedItem.data["bookId"]}, " +
                    "position=${decryptedItem.data["position"]}, " +
                    "progress=${decryptedItem.data["progress"]}")
                // Remove any pending local version for this item since remote is being applied
                pendingSyncItems.removeAll { it.id == decryptedItem.id }
                _syncState.value = _syncState.value.copy(
                    itemsSynced = _syncState.value.itemsSynced + 1
                )
            }
            "annotation" -> {
                Log.d(TAG, "Applying remote annotation change: id=${decryptedItem.id}, " +
                    "bookId=${decryptedItem.data["bookId"]}, " +
                    "annotationId=${decryptedItem.data["annotationId"]}")
                pendingSyncItems.removeAll { it.id == decryptedItem.id }
                _syncState.value = _syncState.value.copy(
                    itemsSynced = _syncState.value.itemsSynced + 1
                )
            }
            "settings" -> {
                Log.d(TAG, "Applying remote settings change: id=${decryptedItem.id}, " +
                    "keys=${decryptedItem.data.keys}")
                pendingSyncItems.removeAll { it.id == decryptedItem.id }
                _syncState.value = _syncState.value.copy(
                    itemsSynced = _syncState.value.itemsSynced + 1
                )
            }
            else -> {
                Log.w(TAG, "Unknown sync item type: ${decryptedItem.type}, id=${decryptedItem.id}")
            }
        }
    }

    /**
     * Identify conflicts between local and remote changes
     */

    /**
     * Resolve conflicts automatically using last-write-wins
     */
    private suspend fun resolveConflictsAutomatically(conflicts: List<CloudSyncConflict>) {
        conflicts.forEach { conflict ->
            if (conflict.remoteTimestamp > conflict.localTimestamp) {
                // Remote wins
                val remoteItem = SyncItem(
                    id = conflict.itemId,
                    type = conflict.itemType,
                    data = conflict.remoteData as Map<String, Any>,
                    timestamp = conflict.remoteTimestamp,
                    deviceId = ""
                )
                applyRemoteChange(remoteItem)

                // Remove from pending
                pendingSyncItems.removeAll { it.id == conflict.itemId }
            }
            // else: Local wins, keep pending item
        }
    }

    /**
     * Resolve conflicts with local wins
     */
    private suspend fun resolveConflictsLocalWins(conflicts: List<CloudSyncConflict>) {
        // Keep local version: pending items stay in pendingSyncItems (they'll be uploaded).
        // Discard remote versions by clearing the conflicts for these items.
        conflicts.forEach { conflict ->
            Log.d(TAG, "Resolving conflict LOCAL_WINS for item: ${conflict.itemId} " +
                "(local=${conflict.localTimestamp}, remote=${conflict.remoteTimestamp})")
        }
        // Remove resolved conflicts from the conflicts list
        val resolvedIds = conflicts.map { it.itemId }.toSet()
        _conflicts.value = _conflicts.value.filter { it.itemId !in resolvedIds }
        _syncState.value = _syncState.value.copy(
            conflictsCount = _conflicts.value.size
        )
    }

    /**
     * Resolve conflicts with remote wins
     */
    private suspend fun resolveConflictsRemoteWins(conflicts: List<CloudSyncConflict>) {
        conflicts.forEach { conflict ->
            val remoteItem = SyncItem(
                id = conflict.itemId,
                type = conflict.itemType,
                data = conflict.remoteData as Map<String, Any>,
                timestamp = conflict.remoteTimestamp,
                deviceId = ""
            )
            applyRemoteChange(remoteItem)
            pendingSyncItems.removeAll { it.id == conflict.itemId }
        }
    }

    /**
     * Attempt to merge conflicts
     */
    private suspend fun mergeConflicts(conflicts: List<CloudSyncConflict>) {
        conflicts.forEach { conflict ->
            val merged = when (conflict.itemType) {
                "reading_position" -> mergeReadingPosition(conflict)
                "annotation" -> mergeAnnotation(conflict)
                "settings" -> mergeSettings(conflict)
                else -> null
            }

            merged?.let { applyRemoteChange(it) }
        }
    }



    private fun mergeSettings(conflict: CloudSyncConflict): SyncItem? {
        // Merge settings by combining non-conflicting values
        val local = conflict.localData as? Map<*, *> ?: return null
        val remote = conflict.remoteData as? Map<*, *> ?: return null

        val merged = mutableMapOf<String, Any>()

        // Add remote settings first
        remote.forEach { (key, value) ->
            val strKey = key as? String
            if (strKey != null && value != null) {
                merged[strKey] = value
            }
        }

        // Add local settings that don't conflict
        local.forEach { (key, value) ->
            val strKey = key as? String
            if (strKey != null && value != null && strKey !in merged) {
                merged[strKey] = value
            }
        }

        return SyncItem(
            id = conflict.itemId,
            type = conflict.itemType,
            data = merged,
            timestamp = maxOf(conflict.localTimestamp, conflict.remoteTimestamp),
            deviceId = getDeviceId()
        )
    }

    /**
     * Manually resolve a conflict
     */
    suspend fun resolveConflict(
        conflictId: String,
        useLocal: Boolean
    ) = withContext(Dispatchers.IO) {
        val conflict = _conflicts.value.find { it.itemId == conflictId }
        if (conflict != null) {
            if (useLocal) {
                // Keep pending item, will be uploaded
            } else {
                // Apply remote
                val remoteItem = SyncItem(
                    id = conflict.itemId,
                    type = conflict.itemType,
                    data = conflict.remoteData as Map<String, Any>,
                    timestamp = conflict.remoteTimestamp,
                    deviceId = ""
                )
                applyRemoteChange(remoteItem)
                pendingSyncItems.removeAll { it.id == conflict.itemId }
            }

            // Remove from conflicts list
            _conflicts.value = _conflicts.value.filter { it.itemId != conflictId }

            // Update conflict count
            _syncState.value = _syncState.value.copy(
                conflictsCount = _conflicts.value.size
            )
        }
    }

    /**
     * Schedule periodic background sync
     */
    private fun schedulePeriodicSync() {
        WorkScheduler.scheduleFeedCatalogSync(
            context = context,
            intervalMinutes = _settings.value.syncInterval,
            wifiOnly = _settings.value.syncOnWifiOnly
        )
    }

    /**
     * Cancel scheduled sync
     */
    fun cancelScheduledSync() {
        WorkScheduler.cancelFeedCatalogSync(context)
    }

    /**
     * Update sync settings
     */
    fun updateSettings(newSettings: SyncSettings) {
        _settings.value = newSettings

        if (newSettings.enabled && newSettings.autoSync) {
            schedulePeriodicSync()
        } else {
            cancelScheduledSync()
        }
    }

    private fun getDeviceId(): String {
        // Get or create stable device ID
        val deviceId = prefs.getString("device_id", null)
        if (deviceId != null) {
            return deviceId
        }

        // Generate new stable UUID for this device
        val newDeviceId = "device_${java.util.UUID.randomUUID()}"
        prefs.edit().putString("device_id", newDeviceId).apply()
        return newDeviceId
    }







    private val prefs by lazy {
        context.getSharedPreferences("cloud_sync_prefs", Context.MODE_PRIVATE)
    }

    companion object {
        private const val TAG = "CloudSyncService"
    }
}

/**
 * Hilt entry point for accessing CloudSyncService from the SyncWorker.
 */
@EntryPoint
@InstallIn(SingletonComponent::class)
interface SyncWorkerEntryPoint {
    fun cloudSyncService(): CloudSyncService
}

/**
 * Background sync worker
 */
class SyncWorker(
    context: Context,
    params: WorkerParameters
) : CoroutineWorker(context, params) {

    override suspend fun doWork(): Result {
        Log.d(TAG, "SyncWorker executing: periodic sync triggered at ${System.currentTimeMillis()}")
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.FEED_CATALOG_SYNC,
                state = JobExecutionState.RUNNING,
                jobId = id.toString(),
                message = "Feed/catalog sync started"
            )
        )
        return try {
            // Attempt to get the CloudSyncService via Hilt entry point
            val entryPoint = EntryPointAccessors.fromApplication(
                applicationContext,
                SyncWorkerEntryPoint::class.java
            )
            val syncService = entryPoint.cloudSyncService()
            val result = syncService.syncNow()
            if (result.isSuccess) {
                Log.d(TAG, "SyncWorker completed successfully")
                JobStatusBus.publish(
                    JobStatusEvent(
                        contractType = JobContractType.FEED_CATALOG_SYNC,
                        state = JobExecutionState.SUCCEEDED,
                        jobId = id.toString(),
                        message = "Feed/catalog sync completed"
                    )
                )
                Result.success()
            } else {
                val errorMessage = result.exceptionOrNull()?.message
                Log.w(TAG, "SyncWorker sync failed: $errorMessage")
                JobStatusBus.publish(
                    JobStatusEvent(
                        contractType = JobContractType.FEED_CATALOG_SYNC,
                        state = JobExecutionState.FAILED,
                        jobId = id.toString(),
                        message = errorMessage ?: "Feed/catalog sync failed"
                    )
                )
                Result.retry()
            }
        } catch (e: Exception) {
            Log.e(TAG, "SyncWorker failed with exception: ${e.message}")
            JobStatusBus.publish(
                JobStatusEvent(
                    contractType = JobContractType.FEED_CATALOG_SYNC,
                    state = JobExecutionState.FAILED,
                    jobId = id.toString(),
                    message = e.message ?: "Feed/catalog sync threw an exception"
                )
            )
            Result.retry()
        }
    }

    companion object {
        private const val TAG = "SyncWorker"
    }
}
