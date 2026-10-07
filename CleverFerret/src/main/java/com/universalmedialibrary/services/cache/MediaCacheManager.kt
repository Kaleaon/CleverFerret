package com.universalmedialibrary.services.cache

import android.os.StatFs
import android.util.Log
import com.universalmedialibrary.data.local.dao.MediaCacheDao
import com.universalmedialibrary.data.local.entity.DownloadPriority
import com.universalmedialibrary.data.local.entity.DownloadState
import com.universalmedialibrary.data.local.entity.MediaCacheItem
import com.universalmedialibrary.data.repository.SettingsRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Centralized Ecosystem Media Cache Manager.
 *
 * Manages dedicated local disk storage for cached remote media streams (Plex, Jellyfin, Emby),
 * enforces user storage limits via LRU eviction of unpinned items, guarantees a 500 MB disk safety threshold,
 * and handles offline media playback fallbacks.
 */
@Singleton
class MediaCacheManager @Inject constructor(
    private val mediaCacheDao: MediaCacheDao,
    private val cacheManager: CacheManager,
    private val settingsRepository: SettingsRepository
) {
    companion object {
        private const val TAG = "MediaCacheManager"
        const val MIN_SAFETY_STORAGE_BYTES: Long = 500 * 1024 * 1024L // 500 MB disk safety limit
    }

    /**
     * Get the dedicated media cache directory for storing streamed media files.
     */
    suspend fun getMediaCacheDirectory(): File {
        val baseCacheDir = cacheManager.getCacheDirectory()
        val mediaDir = File(baseCacheDir, "media")
        if (!mediaDir.exists()) {
            mediaDir.mkdirs()
        }
        return mediaDir
    }

    /**
     * Determine a deterministic destination file for a media cache item.
     */
    suspend fun createCacheFileDestination(itemId: Long, fileName: String, extension: String): File {
        val mediaDir = getMediaCacheDirectory()
        val sanitizedName = fileName.replace(Regex("[^a-zA-Z0-9._-]"), "_")
        val ext = if (extension.isBlank()) "" else if (extension.startsWith(".")) extension else ".$extension"
        return File(mediaDir, "media_${itemId}_${sanitizedName}$ext")
    }

    /**
     * Check if available device storage is at or above the 500 MB safety threshold.
     */
    suspend fun isStorageSpaceAvailable(): Boolean {
        return try {
            val mediaDir = getMediaCacheDirectory()
            val stat = StatFs(mediaDir.path)
            stat.availableBytes >= MIN_SAFETY_STORAGE_BYTES
        } catch (e: Throwable) {
            true
        }
    }

    /**
     * Get available storage in bytes for the cache location.
     */
    suspend fun getAvailableStorageBytes(): Long {
        return try {
            val mediaDir = getMediaCacheDirectory()
            val stat = StatFs(mediaDir.path)
            stat.availableBytes
        } catch (e: Throwable) {
            Long.MAX_VALUE
        }
    }

    /**
     * Register or update a media download task.
     */
    suspend fun registerDownloadRequest(
        itemId: Long,
        remoteUri: String,
        downloadUrl: String,
        fileName: String = "media",
        fileExtension: String = "",
        priority: String = DownloadPriority.NORMAL
    ): MediaCacheItem {
        val existing = mediaCacheDao.getCacheItemByItemId(itemId)
        if (existing != null && existing.downloadState == DownloadState.CACHED && File(existing.localPath).exists()) {
            return existing
        }

        val destFile = createCacheFileDestination(itemId, fileName, fileExtension)
        val newItem = MediaCacheItem(
            itemId = itemId,
            remoteUri = remoteUri,
            downloadUrl = downloadUrl,
            localPath = destFile.absolutePath,
            fileSize = existing?.fileSize ?: 0L,
            downloadedBytes = existing?.downloadedBytes ?: 0L,
            downloadState = DownloadState.QUEUED,
            priority = priority,
            isPinned = existing?.isPinned ?: false,
            lastAccessed = System.currentTimeMillis(),
            createdAt = existing?.createdAt ?: System.currentTimeMillis()
        )
        mediaCacheDao.insertCacheItem(newItem)
        return newItem
    }

    /**
     * Toggles pinned status for a media item to prevent automatic cache removal.
     */
    suspend fun pinItem(itemId: Long, isPinned: Boolean) {
        mediaCacheDao.updatePinned(itemId, isPinned)
    }

    /**
     * Updates download progress and state in the database.
     */
    suspend fun updateDownloadProgress(
        itemId: Long,
        downloadedBytes: Long,
        fileSize: Long,
        state: String
    ) {
        mediaCacheDao.updateDownloadProgress(itemId, downloadedBytes, fileSize, state)
    }

    /**
     * Updates state and optional error message.
     */
    suspend fun updateDownloadState(itemId: Long, state: String, errorMessage: String? = null) {
        mediaCacheDao.updateDownloadState(itemId, state, errorMessage)
    }

    /**
     * Mark an item as accessed (e.g. played or viewed) for LRU eviction tracking.
     */
    suspend fun markAccessed(itemId: Long) {
        mediaCacheDao.updateLastAccessed(itemId, System.currentTimeMillis())
    }

    /**
     * Retrieves a locally cached file for playback if cached and valid.
     */
    suspend fun getCachedFile(itemId: Long): File? {
        val item = mediaCacheDao.getCacheItemByItemId(itemId) ?: return null
        if (item.downloadState == DownloadState.CACHED) {
            val file = File(item.localPath)
            if (file.exists() && file.length() > 0) {
                markAccessed(itemId)
                return file
            }
        }
        return null
    }

    /**
     * Retrieves a locally cached file for remote URI if cached and valid.
     */
    suspend fun getCachedFileForUri(remoteUri: String): File? {
        val item = mediaCacheDao.getCacheItemByRemoteUri(remoteUri) ?: return null
        if (item.downloadState == DownloadState.CACHED) {
            val file = File(item.localPath)
            if (file.exists() && file.length() > 0) {
                markAccessed(item.itemId)
                return file
            }
        }
        return null
    }

    /**
     * Observe cache status for a specific item.
     */
    fun observeCacheItem(itemId: Long): Flow<MediaCacheItem?> {
        return mediaCacheDao.observeCacheItemByItemId(itemId)
    }

    /**
     * Observe all media cache items.
     */
    fun observeAllCacheItems(): Flow<List<MediaCacheItem>> {
        return mediaCacheDao.getAllCacheItems()
    }

    /**
     * Purges oldest unpinned media files when media cache exceeds max storage quota.
     */
    suspend fun enforceStorageLimits() {
        try {
            val maxSizeMB = settingsRepository.maxCacheSizeMBFlow.first()
            val maxSizeBytes = maxSizeMB.toLong() * 1024L * 1024L
            val targetSizeBytes = (maxSizeBytes * 8L) / 10L // Target 80% capacity

            var totalCachedBytes = mediaCacheDao.getTotalCachedSizeBytes() ?: 0L

            if (totalCachedBytes <= maxSizeBytes && isStorageSpaceAvailable()) {
                return
            }

            val unpinnedLRU = mediaCacheDao.getUnpinnedCachedItemsLRU()

            for (item in unpinnedLRU) {
                if (totalCachedBytes <= targetSizeBytes && isStorageSpaceAvailable()) {
                    break
                }

                val file = File(item.localPath)
                val fileSize = if (file.exists()) file.length() else item.fileSize
                if (file.exists()) {
                    file.delete()
                }

                totalCachedBytes -= fileSize
                mediaCacheDao.updateDownloadProgress(
                    itemId = item.itemId,
                    downloadedBytes = 0L,
                    fileSize = 0L,
                    downloadState = DownloadState.QUEUED
                )
                Log.d(TAG, "Evicted cached item ${item.itemId} (${item.remoteUri}) from media cache")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error enforcing storage limits", e)
        }
    }

    /**
     * Removes cached file and resets item state.
     */
    suspend fun removeCache(itemId: Long) {
        val item = mediaCacheDao.getCacheItemByItemId(itemId) ?: return
        val file = File(item.localPath)
        if (file.exists()) {
            file.delete()
        }
        mediaCacheDao.deleteCacheItemByItemId(itemId)
    }
}
