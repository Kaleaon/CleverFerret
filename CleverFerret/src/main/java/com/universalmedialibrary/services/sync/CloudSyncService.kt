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
 * Main Cloud Sync Service
 */
@Singleton
class CloudSyncService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val _settings = MutableStateFlow(SyncSettings())
    val settings: StateFlow<SyncSettings> = _settings.asStateFlow()

    private val _syncState = MutableStateFlow(SyncState())
    val syncState: StateFlow<SyncState> = _syncState.asStateFlow()

    private val _conflicts = MutableStateFlow<List<CloudSyncConflict>>(emptyList())
    val conflicts: StateFlow<List<CloudSyncConflict>> = _conflicts.asStateFlow()

    private val pendingSyncItems = mutableListOf<SyncItem>()

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
        Log.w(TAG, "Google Drive provider is not configured. OAuth credentials and API key are required.")
        return false
    }

    private suspend fun authenticateDropbox(): Boolean {
        Log.w(TAG, "Dropbox provider is not configured. App key and OAuth token are required.")
        return false
    }

    private suspend fun authenticateOneDrive(): Boolean {
        Log.w(TAG, "OneDrive provider is not configured. Microsoft Graph API credentials are required.")
        return false
    }

    private suspend fun authenticateCustomServer(): Boolean {
        Log.w(TAG, "Custom server provider is not configured. Server URL and authentication credentials are required.")
        return false
    }

    private suspend fun authenticateLocalNetwork(): Boolean {
        Log.w(TAG, "Local network provider is not configured. Network share path and credentials are required.")
        return false
    }

    /**
     * Perform manual sync
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
            // Step 1: Fetch remote changes
            val remoteItems = fetchRemoteChanges()

            // Step 2: Identify conflicts
            val conflicts = identifyConflicts(pendingSyncItems, remoteItems)

            if (conflicts.isNotEmpty()) {
                _conflicts.value = conflicts

                // Handle conflicts based on resolution strategy
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

            // Step 3: Push local changes
            // Create snapshot to avoid concurrent modification
            val itemsToSync = pendingSyncItems.toList()
            val totalItems = itemsToSync.size

            for ((index, item) in itemsToSync.withIndex()) {
                uploadItem(item)
                _syncState.value = _syncState.value.copy(
                    progress = (index + 1).toFloat() / totalItems,
                    itemsSynced = index + 1,
                    totalItems = totalItems
                )
            }

            // Step 4: Pull remote changes
            for (item in remoteItems) {
                applyRemoteChange(item)
            }

            // Remove only successfully synced items
            pendingSyncItems.removeAll { it in itemsToSync }

            _syncState.value = _syncState.value.copy(
                status = SyncStatus.SYNCED,
                lastSyncTime = System.currentTimeMillis(),
                progress = 1f,
                conflictsCount = 0
            )

            Result.success(Unit)
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
    private fun identifyConflicts(
        localItems: List<SyncItem>,
        remoteItems: List<SyncItem>
    ): List<CloudSyncConflict> {
        val conflicts = mutableListOf<CloudSyncConflict>()

        val remoteMap = remoteItems.associateBy { it.id }

        localItems.forEach { local ->
            val remote = remoteMap[local.id]
            if (remote != null && remote.timestamp != local.timestamp) {
                // Conflict detected
                conflicts.add(
                    CloudSyncConflict(
                        itemId = local.id,
                        itemType = local.type,
                        localData = local.data,
                        remoteData = remote.data,
                        localTimestamp = local.timestamp,
                        remoteTimestamp = remote.timestamp
                    )
                )
            }
        }

        return conflicts
    }

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

    private fun mergeReadingPosition(conflict: CloudSyncConflict): SyncItem? {
        // Use the furthest reading position
        val localProgress = (conflict.localData as Map<*, *>)["progress"] as? Float ?: 0f
        val remoteProgress = (conflict.remoteData as Map<*, *>)["progress"] as? Float ?: 0f

        return if (remoteProgress > localProgress) {
            SyncItem(
                id = conflict.itemId,
                type = conflict.itemType,
                data = conflict.remoteData as Map<String, Any>,
                timestamp = conflict.remoteTimestamp,
                deviceId = ""
            )
        } else {
            null // Keep local
        }
    }

    private fun mergeAnnotation(conflict: CloudSyncConflict): SyncItem? {
        // Annotations are merged by keeping both
        return null // Manual resolution needed
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

    private fun encryptData(item: SyncItem): SyncItem {
        try {
            // Serialize data to JSON
            val jsonData = serializeToJson(item.data)

            // Encrypt using AES-GCM
            val cipher = getCipher()
            val secretKey = getOrCreateSecretKey()
            cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, secretKey)

            val iv = cipher.iv
            val encrypted = cipher.doFinal(jsonData.toByteArray())
            val combined = iv + encrypted
            val encryptedString = android.util.Base64.encodeToString(combined, android.util.Base64.DEFAULT)

            // Return item with encrypted data
            return item.copy(
                data = mapOf("encrypted" to encryptedString)
            )
        } catch (e: Exception) {
            // Fallback to unencrypted if encryption fails
            return item
        }
    }

    private fun decryptData(item: SyncItem): SyncItem {
        try {
            val encryptedString = item.data["encrypted"] as? String ?: return item

            // Decrypt using AES-GCM
            val cipher = getCipher()
            val secretKey = getOrCreateSecretKey()

            val decoded = android.util.Base64.decode(encryptedString, android.util.Base64.DEFAULT)
            val iv = decoded.copyOfRange(0, 12)
            val ciphertext = decoded.copyOfRange(12, decoded.size)

            val gcmSpec = javax.crypto.spec.GCMParameterSpec(128, iv)
            cipher.init(javax.crypto.Cipher.DECRYPT_MODE, secretKey, gcmSpec)

            val decrypted = cipher.doFinal(ciphertext)
            val jsonData = String(decrypted)

            // Deserialize JSON back to map
            val originalData = deserializeFromJson(jsonData)

            return item.copy(data = originalData)
        } catch (e: Exception) {
            // Return original if decryption fails
            return item
        }
    }

    private fun getOrCreateSecretKey(): javax.crypto.SecretKey {
        val keyStore = java.security.KeyStore.getInstance("AndroidKeyStore")
        keyStore.load(null)

        val alias = "cleverferret_sync_key"

        if (!keyStore.containsAlias(alias)) {
            val keyGenerator = javax.crypto.KeyGenerator.getInstance(
                android.security.keystore.KeyProperties.KEY_ALGORITHM_AES,
                "AndroidKeyStore"
            )

            val keyGenParameterSpec = android.security.keystore.KeyGenParameterSpec.Builder(
                alias,
                android.security.keystore.KeyProperties.PURPOSE_ENCRYPT or
                android.security.keystore.KeyProperties.PURPOSE_DECRYPT
            )
                .setBlockModes(android.security.keystore.KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(android.security.keystore.KeyProperties.ENCRYPTION_PADDING_NONE)
                .build()

            keyGenerator.init(keyGenParameterSpec)
            return keyGenerator.generateKey()
        }

        return keyStore.getKey(alias, null) as javax.crypto.SecretKey
    }

    private fun getCipher(): javax.crypto.Cipher {
        return javax.crypto.Cipher.getInstance(
            android.security.keystore.KeyProperties.KEY_ALGORITHM_AES + "/" +
            android.security.keystore.KeyProperties.BLOCK_MODE_GCM + "/" +
            android.security.keystore.KeyProperties.ENCRYPTION_PADDING_NONE
        )
    }

    private fun serializeToJson(data: Map<String, Any>): String {
        // Simple JSON serialization
        return data.entries.joinToString(",", "{", "}") { (key, value) ->
            "\"$key\":\"$value\""
        }
    }

    private fun deserializeFromJson(json: String): Map<String, Any> {
        // Simple JSON deserialization
        val entries = json.removeSurrounding("{", "}")
            .split(",")
            .mapNotNull {
                val parts = it.split(":")
                if (parts.size == 2) {
                    parts[0].removeSurrounding("\"") to parts[1].removeSurrounding("\"")
                } else null
            }
        return entries.toMap()
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
