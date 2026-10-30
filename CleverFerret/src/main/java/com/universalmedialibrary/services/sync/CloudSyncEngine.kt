package com.universalmedialibrary.services.sync

import android.content.Context
import android.database.sqlite.SQLiteConstraintException
import android.util.Log
import androidx.room.withTransaction
import androidx.work.*
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.entity.Bookmark
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.ReadingProgress
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
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import java.security.MessageDigest
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified Room-backed Cloud Sync Engine.
 * Single source of truth for cloud sync across background workers and foreground UI.
 */
@Singleton
class CloudSyncEngine @Inject constructor(
    @ApplicationContext private val context: Context,
    private val database: AppDatabase
) {
    private val mediaItemDao = database.mediaItemDao()
    private val readingProgressDao = database.readingProgressDao()
    private val bookmarkDao = database.bookmarkDao()

    private val _settings = MutableStateFlow(SyncSettings())
    val settings: StateFlow<SyncSettings> = _settings.asStateFlow()

    private val _syncState = MutableStateFlow(SyncState())
    val syncState: StateFlow<SyncState> = _syncState.asStateFlow()

    private val _conflicts = MutableStateFlow<List<SyncConflict>>(emptyList())
    val conflicts: StateFlow<List<SyncConflict>> = _conflicts.asStateFlow()

    private val json = Json {
        prettyPrint = true
        ignoreUnknownKeys = true
    }

    private val pendingSyncItems = mutableListOf<SyncItem>()

    /**
     * Initialize engine with settings and schedule periodic sync if enabled.
     */
    suspend fun initialize(settings: SyncSettings) = withContext(Dispatchers.IO) {
        _settings.value = settings
        if (settings.enabled && settings.autoSync) {
            schedulePeriodicSync()
        }
    }

    /**
     * Primary sync routine executed on Dispatchers.IO.
     * Combines Room DAO changes, journal storage, legacy outgoing JSON migrations,
     * conflict detection/resolution, and transactional database updates.
     */
    suspend fun sync(options: SyncOptions = SyncOptions()): SyncResult = withContext(Dispatchers.IO) {
        updateState(
            isLoading = true,
            status = "Starting sync...",
            syncStatus = SyncStatus.SYNCING,
            error = null,
            errorMessage = null
        )

        return@withContext try {
            // Step 0: Migrate any legacy file-based outgoing JSON files into Room DB
            migrateLegacyOutgoingFiles()

            val detectedConflicts = mutableListOf<SyncConflict>()
            var itemsSynced = 0
            var conflictsResolved = 0

            // Step 1: Collect local changes from Room DAOs
            updateState(status = "Collecting local changes...")
            val localChanges = getLocalChanges(options.lastSyncTime)

            // Step 2: Fetch remote changes
            updateState(status = "Fetching remote changes...")
            val remoteChanges = getRemoteChanges(options.lastSyncTime)

            // Step 3: Detect conflicts between local and remote changes
            updateState(status = "Detecting conflicts...")
            val conflictPairs = detectConflicts(localChanges, remoteChanges)

            // Step 4: Resolve conflicts according to strategy
            for (conflict in conflictPairs) {
                updateState(status = "Resolving conflict: ${conflict.itemId}")
                val resolvedStrategy = resolveConflict(conflict, options.conflictResolution)
                detectedConflicts.add(conflict.copy(resolution = resolvedStrategy))
                conflictsResolved++
            }

            if (detectedConflicts.any { it.resolution == ConflictResolutionStrategy.ASK_USER }) {
                _conflicts.value = detectedConflicts
            }

            // Step 5: Apply non-conflicting remote changes locally inside a Room database transaction
            updateState(status = "Applying remote changes locally...")
            database.withTransaction {
                for (change in remoteChanges) {
                    if (!conflictPairs.any { it.itemId == change.itemId }) {
                        applyRemoteChange(change)
                        itemsSynced++
                    }
                }
            }

            // Step 6: Upload local changes to remote change journal
            updateState(status = "Uploading local changes...")
            for (change in localChanges) {
                if (!conflictPairs.any { it.itemId == change.itemId }) {
                    uploadLocalChange(change)
                    itemsSynced++
                }
            }

            // Step 7: Save sync timestamp & update state
            val syncTime = System.currentTimeMillis()
            saveSyncTimestamp(syncTime)

            val totalItemsProcessed = localChanges.size + remoteChanges.size
            updateState(
                isLoading = false,
                status = "Sync complete",
                syncStatus = SyncStatus.SYNCED,
                lastSyncTime = syncTime,
                progress = 1.0f,
                itemsSynced = itemsSynced,
                totalItems = totalItemsProcessed,
                conflictsCount = _conflicts.value.size
            )

            SyncResult(
                success = true,
                itemsSynced = itemsSynced,
                conflictsDetected = conflictPairs.size,
                conflictsResolved = conflictsResolved,
                conflicts = detectedConflicts,
                timestamp = syncTime
            )
        } catch (e: Exception) {
            Log.e(TAG, "Sync failed: ${e.message}", e)
            updateState(
                isLoading = false,
                status = "Sync failed: ${e.message}",
                syncStatus = SyncStatus.ERROR,
                error = e.message,
                errorMessage = e.message
            )

            SyncResult(
                success = false,
                error = e.message,
                timestamp = System.currentTimeMillis()
            )
        }
    }

    /**
     * Backward-compatible helper method returning Result<Unit>.
     */
    suspend fun syncNow(): Result<Unit> {
        val result = sync()
        return if (result.success) {
            Result.success(Unit)
        } else {
            Result.failure(Exception(result.error ?: "Sync failed"))
        }
    }

    /**
     * Queue an item for sync.
     */
    suspend fun queueForSync(item: SyncItem) = withContext(Dispatchers.IO) {
        pendingSyncItems.add(item)
        if (_settings.value.enabled && _settings.value.autoSync &&
            _syncState.value.syncStatus != SyncStatus.SYNCING) {
            syncNow()
        }
    }

    /**
     * Sync reading position specifically.
     */
    suspend fun syncReadingPosition(bookId: Long, position: Int, progress: Float) = withContext(Dispatchers.IO) {
        if (!_settings.value.syncReadingPosition) return@withContext
        val readingProgress = ReadingProgress(
            itemId = bookId,
            currentPosition = position.toLong(),
            percentage = progress,
            lastUpdate = System.currentTimeMillis()
        )
        try {
            database.withTransaction {
                readingProgressDao.insertProgress(readingProgress)
            }
        } catch (e: Exception) {
            Log.w(TAG, "Failed to save local reading position for item $bookId: ${e.message}")
        }
        val item = SyncItem(
            id = "reading_position_$bookId",
            type = "reading_position",
            data = mapOf("bookId" to bookId, "position" to position, "progress" to progress),
            timestamp = System.currentTimeMillis(),
            deviceId = getDeviceId()
        )
        queueForSync(item)
    }

    /**
     * Sync annotation specifically.
     */
    suspend fun syncAnnotation(annotationId: Long, bookId: Long, annotationData: Map<String, Any>) = withContext(Dispatchers.IO) {
        if (!_settings.value.syncAnnotations) return@withContext
        val item = SyncItem(
            id = "annotation_$annotationId",
            type = "annotation",
            data = annotationData + mapOf("annotationId" to annotationId, "bookId" to bookId),
            timestamp = System.currentTimeMillis(),
            deviceId = getDeviceId()
        )
        queueForSync(item)
    }

    /**
     * Sync app settings specifically.
     */
    suspend fun syncAppSettings(settingsData: Map<String, Any>) = withContext(Dispatchers.IO) {
        if (!_settings.value.syncSettings) return@withContext
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
     * Safely migrate legacy file-based sync outgoing JSON files into Room DB.
     */
    suspend fun migrateLegacyOutgoingFiles() = withContext(Dispatchers.IO) {
        val syncDir = File(context.filesDir, "sync_data")
        val outgoingDir = File(syncDir, "outgoing")
        if (!outgoingDir.exists() || !outgoingDir.isDirectory) return@withContext

        val legacyFiles = outgoingDir.listFiles { _, name -> name.endsWith(".json") } ?: return@withContext
        if (legacyFiles.isEmpty()) return@withContext

        Log.i(TAG, "Migrating ${legacyFiles.size} legacy outgoing file-based sync items into Room DB...")
        database.withTransaction {
            for (file in legacyFiles) {
                try {
                    val text = file.readText()
                    if (text.isNotBlank()) {
                        val jsonObj = org.json.JSONObject(text)
                        val type = jsonObj.optString("type")
                        val dataObj = jsonObj.optJSONObject("data")
                        if (dataObj != null) {
                            when (type) {
                                "reading_position", "READING_PROGRESS" -> {
                                    val bookId = dataObj.optLong("bookId", dataObj.optLong("itemId", 0L))
                                    if (bookId != 0L) {
                                        val pos = dataObj.optLong("position", dataObj.optLong("currentPosition", 0L))
                                        val prog = dataObj.optDouble("progress", dataObj.optDouble("percentage", 0.0)).toFloat()
                                        readingProgressDao.insertProgress(
                                            ReadingProgress(
                                                itemId = bookId,
                                                currentPosition = pos,
                                                percentage = prog,
                                                lastUpdate = System.currentTimeMillis()
                                            )
                                        )
                                    }
                                }
                                "bookmark", "BOOKMARK" -> {
                                    val bookId = dataObj.optLong("bookId", dataObj.optLong("itemId", 0L))
                                    if (bookId != 0L) {
                                        bookmarkDao.insertBookmark(
                                            Bookmark(
                                                itemId = bookId,
                                                title = dataObj.optString("title", "Migrated Bookmark"),
                                                position = dataObj.optLong("position", 0L),
                                                dateCreated = jsonObj.optLong("timestamp", System.currentTimeMillis())
                                            )
                                        )
                                    }
                                }
                            }
                        }
                    }
                    file.delete()
                } catch (e: Exception) {
                    Log.w(TAG, "Failed to migrate legacy sync file ${file.name}: ${e.message}")
                    file.delete()
                }
            }
        }
    }

    private fun detectConflicts(
        localChanges: List<SyncChange>,
        remoteChanges: List<SyncChange>
    ): List<SyncConflict> {
        val conflicts = mutableListOf<SyncConflict>()
        val localMap = localChanges.associateBy { it.itemId }
        val remoteMap = remoteChanges.associateBy { it.itemId }

        for ((itemId, localChange) in localMap) {
            val remoteChange = remoteMap[itemId]
            if (remoteChange != null && localChange.timestamp != remoteChange.timestamp) {
                conflicts.add(
                    SyncConflict(
                        itemId = itemId,
                        itemType = localChange.itemType,
                        localData = localChange,
                        remoteData = remoteChange,
                        localTimestamp = localChange.timestamp,
                        remoteTimestamp = remoteChange.timestamp,
                        conflictType = detectConflictType(localChange, remoteChange)
                    )
                )
            }
        }
        return conflicts
    }

    private suspend fun resolveConflict(
        conflict: SyncConflict,
        strategy: ConflictResolutionStrategy
    ): ConflictResolutionStrategy {
        return when (strategy) {
            ConflictResolutionStrategy.USE_LOCAL -> ConflictResolutionStrategy.USE_LOCAL
            ConflictResolutionStrategy.USE_REMOTE -> ConflictResolutionStrategy.USE_REMOTE
            ConflictResolutionStrategy.USE_NEWER -> {
                if (conflict.localTimestamp > conflict.remoteTimestamp) {
                    ConflictResolutionStrategy.USE_LOCAL
                } else {
                    ConflictResolutionStrategy.USE_REMOTE
                }
            }
            ConflictResolutionStrategy.MERGE -> {
                tryMerge(conflict)
                ConflictResolutionStrategy.MERGE
            }
            ConflictResolutionStrategy.ASK_USER -> ConflictResolutionStrategy.ASK_USER
        }
    }

    private suspend fun tryMerge(conflict: SyncConflict) {
        when (conflict.itemType) {
            "READING_PROGRESS" -> mergeReadingProgress(conflict)
            "BOOKMARK" -> mergeBookmarks(conflict)
            "MEDIA_ITEM" -> mergeMediaItem(conflict)
        }
    }

    private suspend fun mergeReadingProgress(conflict: SyncConflict) {
        val localProgress = (conflict.localData as? SyncChange)?.data as? ReadingProgress
        val remoteProgress = (conflict.remoteData as? SyncChange)?.data as? ReadingProgress

        if (localProgress != null && remoteProgress != null) {
            val merged = if (localProgress.currentPage > remoteProgress.currentPage) {
                localProgress
            } else {
                remoteProgress
            }
            try {
                readingProgressDao.insertProgress(merged)
            } catch (e: SQLiteConstraintException) {
                Log.w(TAG, "Foreign key missing for merged progress ${merged.itemId}")
            }
        }
    }

    private suspend fun mergeBookmarks(conflict: SyncConflict) {
        val localChange = conflict.localData as? SyncChange
        val remoteChange = conflict.remoteData as? SyncChange

        val localBookmarks = when (val data = localChange?.data) {
            is Bookmark -> listOf(data)
            is List<*> -> data.filterIsInstance<Bookmark>()
            else -> emptyList()
        }
        val remoteBookmarks = when (val data = remoteChange?.data) {
            is Bookmark -> listOf(data)
            is List<*> -> data.filterIsInstance<Bookmark>()
            else -> emptyList()
        }

        val mergedMap = mutableMapOf<Long, Bookmark>()
        for (b in localBookmarks) {
            mergedMap[b.bookmarkId] = b
        }
        for (b in remoteBookmarks) {
            val existing = mergedMap[b.bookmarkId]
            if (existing == null || b.dateCreated > existing.dateCreated) {
                mergedMap[b.bookmarkId] = b
            }
        }

        for (bookmark in mergedMap.values) {
            try {
                bookmarkDao.insertBookmark(bookmark)
            } catch (e: SQLiteConstraintException) {
                Log.w(TAG, "Foreign key missing for merged bookmark ${bookmark.bookmarkId}")
            }
        }
    }

    private suspend fun mergeMediaItem(conflict: SyncConflict) {
        val localItem = (conflict.localData as? SyncChange)?.data as? MediaItem
        val remoteItem = (conflict.remoteData as? SyncChange)?.data as? MediaItem

        if (localItem != null && remoteItem != null) {
            val newer = if (localItem.lastModified >= remoteItem.lastModified) localItem else remoteItem
            val older = if (localItem.lastModified >= remoteItem.lastModified) remoteItem else localItem

            val merged = newer.copy(
                fileHash = newer.fileHash ?: older.fileHash,
                mimeType = newer.mimeType ?: older.mimeType,
                thumbnailPath = newer.thumbnailPath ?: older.thumbnailPath,
                hasMetadata = newer.hasMetadata || older.hasMetadata,
                hasThumbnail = newer.hasThumbnail || older.hasThumbnail,
                isFavorite = newer.isFavorite || older.isFavorite,
                playCount = maxOf(newer.playCount, older.playCount),
                lastPlayed = maxOf(newer.lastPlayed, older.lastPlayed),
                lastModified = maxOf(newer.lastModified, older.lastModified)
            )

            try {
                mediaItemDao.insertMediaItem(merged)
            } catch (e: SQLiteConstraintException) {
                Log.w(TAG, "Failed to save merged media item ${merged.itemId}")
            }
        }
    }

    private fun detectConflictType(local: SyncChange, remote: SyncChange): ConflictType {
        return when {
            local.operation == ChangeOperation.DELETE && remote.operation == ChangeOperation.MODIFY ->
                ConflictType.DELETE_MODIFY
            local.operation == ChangeOperation.MODIFY && remote.operation == ChangeOperation.DELETE ->
                ConflictType.MODIFY_DELETE
            local.operation == ChangeOperation.MODIFY && remote.operation == ChangeOperation.MODIFY ->
                ConflictType.MODIFY_MODIFY
            else -> ConflictType.OTHER
        }
    }

    private suspend fun getLocalChanges(since: Long): List<SyncChange> {
        val changes = mutableListOf<SyncChange>()
        try {
            val modifiedItems = mediaItemDao.getMediaItemsModifiedSince(since)
            for (item in modifiedItems) {
                changes.add(
                    SyncChange(
                        itemId = item.itemId.toString(),
                        itemType = "MEDIA_ITEM",
                        operation = if (item.lastModified > since) ChangeOperation.MODIFY else ChangeOperation.CREATE,
                        timestamp = item.lastModified,
                        data = item,
                        checksum = generateChecksum(item)
                    )
                )
            }

            val allProgress = readingProgressDao.getAllProgressSnapshot()
            val progressChanges = allProgress.filter { it.lastModified > since }
            for (progress in progressChanges) {
                changes.add(
                    SyncChange(
                        itemId = progress.itemId.toString(),
                        itemType = "READING_PROGRESS",
                        operation = ChangeOperation.MODIFY,
                        timestamp = progress.lastModified,
                        data = progress,
                        checksum = generateChecksum(progress)
                    )
                )
            }

            val allBookmarks = bookmarkDao.getAllBookmarks()
            val bookmarkChanges = allBookmarks.filter { it.dateCreated > since }
            for (bookmark in bookmarkChanges) {
                changes.add(
                    SyncChange(
                        itemId = bookmark.itemId.toString(),
                        itemType = "BOOKMARK",
                        operation = ChangeOperation.MODIFY,
                        timestamp = bookmark.dateCreated,
                        data = bookmark,
                        checksum = generateChecksum(bookmark)
                    )
                )
            }
        } catch (e: Exception) {
            updateState(error = "Failed to get local changes: ${e.message}")
        }
        return changes.sortedBy { it.timestamp }
    }

    private suspend fun getRemoteChanges(since: Long): List<SyncChange> {
        val changes = mutableListOf<SyncChange>()
        try {
            val syncDir = File(context.filesDir, "sync_data")
            val syncJournalFile = File(syncDir, "sync_journal.json")

            if (!syncJournalFile.exists()) {
                return emptyList()
            }

            val content = syncJournalFile.readText()
            if (content.isBlank()) return emptyList()

            val records = json.decodeFromString<List<SyncChangeRecord>>(content)
            for (record in records) {
                if (record.timestamp > since) {
                    val data: Any? = try {
                        when (record.itemType) {
                            "MEDIA_ITEM" -> record.dataJson?.let { json.decodeFromString<MediaItem>(it) }
                            "READING_PROGRESS" -> record.dataJson?.let { json.decodeFromString<ReadingProgress>(it) }
                            "BOOKMARK" -> record.dataJson?.let { json.decodeFromString<Bookmark>(it) }
                            else -> null
                        }
                    } catch (e: Exception) {
                        null
                    }

                    changes.add(
                        SyncChange(
                            itemId = record.itemId,
                            itemType = record.itemType,
                            operation = record.operation,
                            timestamp = record.timestamp,
                            data = data,
                            checksum = record.checksum
                        )
                    )
                }
            }
        } catch (e: Exception) {
            updateState(error = "Failed to fetch remote changes: ${e.message}")
        }
        return changes.sortedBy { it.timestamp }
    }

    private suspend fun applyRemoteChange(change: SyncChange) {
        try {
            when (change.itemType) {
                "MEDIA_ITEM" -> {
                    val mediaItem = change.data as? MediaItem
                    if (mediaItem != null) {
                        when (change.operation) {
                            ChangeOperation.CREATE, ChangeOperation.MODIFY -> mediaItemDao.insertMediaItem(mediaItem)
                            ChangeOperation.DELETE -> mediaItemDao.deleteMediaItem(mediaItem)
                        }
                    }
                }
                "READING_PROGRESS" -> {
                    val progress = change.data as? ReadingProgress
                    if (progress != null) {
                        when (change.operation) {
                            ChangeOperation.CREATE, ChangeOperation.MODIFY -> {
                                try {
                                    readingProgressDao.insertProgress(progress)
                                } catch (e: SQLiteConstraintException) {
                                    Log.w(TAG, "Skipping progress entry due to missing parent MediaItem: ${progress.itemId}")
                                }
                            }
                            ChangeOperation.DELETE -> readingProgressDao.deleteProgressByItemId(progress.itemId)
                        }
                    }
                }
                "BOOKMARK" -> {
                    val bookmark = change.data as? Bookmark
                    if (bookmark != null) {
                        when (change.operation) {
                            ChangeOperation.CREATE, ChangeOperation.MODIFY -> {
                                try {
                                    bookmarkDao.insertBookmark(bookmark)
                                } catch (e: SQLiteConstraintException) {
                                    Log.w(TAG, "Skipping bookmark entry due to missing parent MediaItem: ${bookmark.itemId}")
                                }
                            }
                            ChangeOperation.DELETE -> bookmarkDao.deleteBookmark(bookmark.bookmarkId)
                        }
                    }
                }
            }
        } catch (e: Exception) {
            updateState(error = "Failed to apply remote change: ${e.message}")
        }
    }

    private suspend fun uploadLocalChange(change: SyncChange) {
        try {
            val dataJson: String? = when (val data = change.data) {
                is MediaItem -> json.encodeToString(data)
                is ReadingProgress -> json.encodeToString(data)
                is Bookmark -> json.encodeToString(data)
                else -> null
            }

            val record = SyncChangeRecord(
                itemId = change.itemId,
                itemType = change.itemType,
                operation = change.operation,
                timestamp = change.timestamp,
                dataJson = dataJson,
                checksum = change.checksum
            )

            val syncDir = File(context.filesDir, "sync_data")
            if (!syncDir.exists()) {
                syncDir.mkdirs()
            }
            val syncJournalFile = File(syncDir, "sync_journal.json")

            val existingRecords: MutableList<SyncChangeRecord> = if (syncJournalFile.exists()) {
                val content = syncJournalFile.readText()
                if (content.isBlank()) {
                    mutableListOf()
                } else {
                    try {
                        json.decodeFromString<List<SyncChangeRecord>>(content).toMutableList()
                    } catch (e: Exception) {
                        mutableListOf()
                    }
                }
            } else {
                mutableListOf()
            }

            existingRecords.add(record)
            syncJournalFile.writeText(json.encodeToString(existingRecords))
        } catch (e: Exception) {
            updateState(error = "Failed to upload local change: ${e.message}")
        }
    }

    private fun saveSyncTimestamp(timestamp: Long) {
        try {
            val syncPrefs = context.getSharedPreferences("sync_state", Context.MODE_PRIVATE)
            syncPrefs.edit()
                .putLong("last_sync_timestamp", timestamp)
                .putLong("last_remote_sync", timestamp)
                .apply()
        } catch (e: Exception) {
            updateState(error = "Failed to save sync timestamp: ${e.message}")
        }
    }

    private fun schedulePeriodicSync() {
        WorkScheduler.scheduleFeedCatalogSync(
            context = context,
            intervalMinutes = _settings.value.syncInterval,
            wifiOnly = _settings.value.syncOnWifiOnly
        )
    }

    fun cancelScheduledSync() {
        WorkScheduler.cancelFeedCatalogSync(context)
    }

    fun updateSettings(newSettings: SyncSettings) {
        _settings.value = newSettings
        if (newSettings.enabled && newSettings.autoSync) {
            schedulePeriodicSync()
        } else {
            cancelScheduledSync()
        }
    }

    fun resolveConflict(conflictId: String, useLocal: Boolean) {
        val conflict = _conflicts.value.find { it.itemId == conflictId }
        if (conflict != null) {
            _conflicts.value = _conflicts.value.filter { it.itemId != conflictId }
            updateState(conflictsCount = _conflicts.value.size)
        }
    }

    private fun getDeviceId(): String {
        val prefs = context.getSharedPreferences("cloud_sync_prefs", Context.MODE_PRIVATE)
        val deviceId = prefs.getString("device_id", null)
        if (deviceId != null) return deviceId

        val newDeviceId = "device_${java.util.UUID.randomUUID()}"
        prefs.edit().putString("device_id", newDeviceId).apply()
        return newDeviceId
    }

    private fun updateState(
        isLoading: Boolean? = null,
        status: String? = null,
        error: String? = null,
        syncStatus: SyncStatus? = null,
        lastSyncTime: Long? = null,
        progress: Float? = null,
        itemsSynced: Int? = null,
        totalItems: Int? = null,
        conflictsCount: Int? = null,
        errorMessage: String? = null
    ) {
        _syncState.value = _syncState.value.copy(
            isLoading = isLoading ?: _syncState.value.isLoading,
            status = status ?: _syncState.value.status,
            error = error ?: _syncState.value.error,
            syncStatus = syncStatus ?: _syncState.value.syncStatus,
            lastSyncTime = lastSyncTime ?: _syncState.value.lastSyncTime,
            progress = progress ?: _syncState.value.progress,
            itemsSynced = itemsSynced ?: _syncState.value.itemsSynced,
            totalItems = totalItems ?: _syncState.value.totalItems,
            conflictsCount = conflictsCount ?: _syncState.value.conflictsCount,
            errorMessage = errorMessage ?: _syncState.value.errorMessage
        )
    }

    private fun generateChecksum(data: Any): String {
        val dataString = when (data) {
            is MediaItem -> json.encodeToString(data)
            is ReadingProgress -> json.encodeToString(data)
            is Bookmark -> json.encodeToString(data)
            else -> data.toString()
        }
        val digest = MessageDigest.getInstance("SHA-256")
        val hashBytes = digest.digest(dataString.toByteArray(Charsets.UTF_8))
        return hashBytes.joinToString("") { "%02x".format(it) }
    }

    companion object {
        private const val TAG = "CloudSyncEngine"
    }
}
