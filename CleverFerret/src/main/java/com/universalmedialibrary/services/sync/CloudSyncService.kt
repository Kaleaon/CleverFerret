package com.universalmedialibrary.services.sync

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.Bookmark
import com.universalmedialibrary.data.local.entity.ReadingProgress
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Cloud Sync Service
 * 
 * Syncs user data across devices:
 * - Reading progress (EPUB, PDF, CBZ, CBR)
 * - Bookmarks
 * - Highlights & notes
 * - Playback history
 * - App settings
 * 
 * Supported backends:
 * - Google Drive
 * - Dropbox
 * - Self-hosted (WebDAV)
 * - Local file export/import
 * 
 * This is the foundation - actual cloud providers will be added based on user preference.
 */
@Singleton
class CloudSyncService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val readingProgressDao: ReadingProgressDao,
    private val bookmarkDao: BookmarkDao
) {
    private val TAG = "CloudSyncService"
    
    private val _syncState = MutableStateFlow<SyncState>(SyncState.Idle)
    val syncState: StateFlow<SyncState> = _syncState.asStateFlow()
    
    private val json = Json {
        prettyPrint = true
        ignoreUnknownKeys = true
    }
    
    /**
     * Export all data to JSON file
     */
    suspend fun exportToFile(outputFile: File): Result<File> = withContext(Dispatchers.IO) {
        try {
            _syncState.value = SyncState.Syncing("Exporting data...")
            
            // Gather all data
            val progress = readingProgressDao.getRecentlyRead(1000).first()
            // Note: BookmarkDao doesn't have getAllBookmarks, we'll need to enhance it later
            // For now, export bookmarks per item would require media item IDs
            val bookmarks = emptyList<Bookmark>()
            
            val progressList = mutableListOf<SyncProgress>()
            for (p in progress) {
                progressList.add(p.toSyncProgress())
            }
            
            val bookmarksList = mutableListOf<SyncBookmark>()
            for (b in bookmarks) {
                bookmarksList.add(b.toSyncBookmark())
            }
            
            val exportData = SyncData(
                version = SYNC_VERSION,
                exportDate = System.currentTimeMillis(),
                readingProgress = progressList,
                bookmarks = bookmarksList
            )
            
            // Write to file
            val jsonString = json.encodeToString(exportData)
            outputFile.writeText(jsonString)
            
            val progressCount = progressList.size
            val bookmarksCount = bookmarksList.size
            _syncState.value = SyncState.Success("Exported $progressCount progress items, $bookmarksCount bookmarks")
            Log.d(TAG, "Export successful: ${outputFile.absolutePath}")
            
            Result.success(outputFile)
            
        } catch (e: Exception) {
            _syncState.value = SyncState.Error("Export failed: ${e.message}")
            Log.e(TAG, "Export failed", e)
            Result.failure(e)
        }
    }
    
    /**
     * Import data from JSON file
     */
    suspend fun importFromFile(inputFile: File): Result<ImportResult> = withContext(Dispatchers.IO) {
        try {
            _syncState.value = SyncState.Syncing("Importing data...")
            
            val jsonString = inputFile.readText()
            val importData = json.decodeFromString<SyncData>(jsonString)
            
            // Validate version
            if (importData.version > SYNC_VERSION) {
                throw IllegalArgumentException("Data from newer version, please update app")
            }
            
            var progressImported = 0
            var bookmarksImported = 0
            
            // Import reading progress
            importData.readingProgress.forEach { syncProgress ->
                val existing = readingProgressDao.getProgress(syncProgress.itemId).first()
                
                // Only import if newer
                if (existing == null || syncProgress.lastUpdate > existing.lastUpdate) {
                    readingProgressDao.upsert(syncProgress.toReadingProgress())
                    progressImported++
                }
            }
            
            // Import bookmarks
            for (syncBookmark in importData.bookmarks) {
                try {
                    bookmarkDao.insertBookmark(syncBookmark.toBookmark())
                    bookmarksImported++
                } catch (e: Exception) {
                    // Skip duplicates or errors
                }
            }
            
            val progressTotal = importData.readingProgress.size
            val bookmarksTotal = importData.bookmarks.size
            
            val result = ImportResult(
                progressImported = progressImported,
                bookmarksImported = bookmarksImported,
                totalProgress = progressTotal,
                totalBookmarks = bookmarksTotal
            )
            
            _syncState.value = SyncState.Success("Imported $progressImported progress, $bookmarksImported bookmarks")
            Log.d(TAG, "Import successful: $result")
            
            Result.success(result)
            
        } catch (e: Exception) {
            _syncState.value = SyncState.Error("Import failed: ${e.message}")
            Log.e(TAG, "Import failed", e)
            Result.failure(e)
        }
    }
    
    /**
     * Sync with cloud provider
     * Note: This is the framework. Actual provider implementations (Google Drive, Dropbox)
     * will be added based on user preference and API key configuration.
     */
    suspend fun syncWithCloud(provider: CloudProvider): Result<SyncResult> = withContext(Dispatchers.IO) {
        _syncState.value = SyncState.Syncing("Syncing with ${provider.name}...")
        
        when (provider) {
            CloudProvider.GOOGLE_DRIVE -> {
                // TODO: Implement Google Drive sync
                _syncState.value = SyncState.Error("Google Drive sync not yet implemented")
                Result.failure(UnsupportedOperationException("Google Drive sync coming in v1.1"))
            }
            CloudProvider.DROPBOX -> {
                // TODO: Implement Dropbox sync
                _syncState.value = SyncState.Error("Dropbox sync not yet implemented")
                Result.failure(UnsupportedOperationException("Dropbox sync coming in v1.1"))
            }
            CloudProvider.WEBDAV -> {
                // TODO: Implement WebDAV sync
                _syncState.value = SyncState.Error("WebDAV sync not yet implemented")
                Result.failure(UnsupportedOperationException("WebDAV sync coming in v1.1"))
            }
            CloudProvider.LOCAL_FILE -> {
                // Export to local file for manual sync
                val exportFile = File(context.getExternalFilesDir(null), "cleverferret_sync_${System.currentTimeMillis()}.json")
                val exportResult = exportToFile(exportFile)
                if (exportResult.isSuccess) {
                    Result.success(SyncResult(progressSynced = 0, bookmarksSynced = 0, conflicts = 0))
                } else {
                    Result.failure(exportResult.exceptionOrNull() ?: Exception("Export failed"))
                }
            }
        }
    }
    
    /**
     * Auto-sync if enabled
     */
    suspend fun autoSync() {
        // Check if auto-sync is enabled in settings
        // If yes, sync with configured provider
        Log.d(TAG, "Auto-sync triggered")
        // Note: Implement when settings repository is ready
    }
    
    // Extension functions for data conversion
    private fun ReadingProgress.toSyncProgress() = SyncProgress(
        itemId = itemId,
        currentPosition = currentPosition,
        currentPage = currentPage,
        currentChapter = currentChapter,
        percentage = percentage,
        lastUpdate = lastUpdate,
        isCompleted = isCompleted
    )
    
    private fun SyncProgress.toReadingProgress() = ReadingProgress(
        itemId = itemId,
        currentPosition = currentPosition,
        currentPage = currentPage,
        currentChapter = currentChapter,
        percentage = percentage,
        lastUpdate = lastUpdate,
        isCompleted = isCompleted
    )
    
    private fun Bookmark.toSyncBookmark(): SyncBookmark {
        val chapterNum = this.chapter?.toIntOrNull() ?: 0
        val bookmarkTitle = this.title ?: ""
        val bookmarkDesc = this.description
        
        return SyncBookmark(
            bookmarkId = this.bookmarkId,
            itemId = this.itemId,
            title = bookmarkTitle,
            position = this.position,
            chapterIndex = chapterNum,
            timestamp = this.dateCreated,
            notes = bookmarkDesc
        )
    }
    
    private fun SyncBookmark.toBookmark() = Bookmark(
        bookmarkId = 0, // Let database assign new ID
        itemId = itemId,
        title = title,
        description = notes,
        page = 0,
        chapter = if (chapterIndex > 0) chapterIndex.toString() else null,
        percentage = 0f,
        position = position,
        contextBefore = null,
        contextAfter = null,
        screenCapture = null,
        bookmarkType = "sync",
        isActive = true,
        dateCreated = timestamp,
        lastAccessed = timestamp
    )
    
    companion object {
        private const val SYNC_VERSION = 1
    }
}

/**
 * Sync state
 */
sealed class SyncState {
    object Idle : SyncState()
    data class Syncing(val message: String) : SyncState()
    data class Success(val message: String) : SyncState()
    data class Error(val message: String) : SyncState()
}

/**
 * Cloud providers
 */
enum class CloudProvider {
    GOOGLE_DRIVE,
    DROPBOX,
    WEBDAV,
    LOCAL_FILE
}

/**
 * Sync data structure
 */
@Serializable
data class SyncData(
    val version: Int,
    val exportDate: Long,
    val readingProgress: List<SyncProgress>,
    val bookmarks: List<SyncBookmark>
)

@Serializable
data class SyncProgress(
    val itemId: Long,
    val currentPosition: Long,
    val currentPage: Int,
    val currentChapter: Int,
    val percentage: Float,
    val lastUpdate: Long,
    val isCompleted: Boolean
)

@Serializable
data class SyncBookmark(
    val bookmarkId: Long,
    val itemId: Long,
    val title: String,
    val position: Long,
    val chapterIndex: Int,
    val timestamp: Long,
    val notes: String?
)

data class ImportResult(
    val progressImported: Int,
    val bookmarksImported: Int,
    val totalProgress: Int,
    val totalBookmarks: Int
)

data class SyncResult(
    val progressSynced: Int,
    val bookmarksSynced: Int,
    val conflicts: Int
)
