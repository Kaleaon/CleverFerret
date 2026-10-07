package com.universalmedialibrary.services.cache

import android.content.Context
import androidx.work.Constraints
import androidx.work.Data
import androidx.work.ExistingWorkPolicy
import androidx.work.NetworkType
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import com.universalmedialibrary.data.local.entity.DownloadPriority
import com.universalmedialibrary.workers.MediaDownloadWorker
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Schedules background media download jobs with network (unmetered Wi-Fi) and battery constraints.
 */
@Singleton
class MediaDownloadScheduler @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaCacheManager: MediaCacheManager
) {
    /**
     * Enqueues a background media download task with WorkManager.
     */
    suspend fun scheduleDownload(
        itemId: Long,
        remoteUri: String,
        downloadUrl: String,
        fileName: String = "media",
        fileExtension: String = "",
        priority: String = DownloadPriority.NORMAL,
        requiresWifi: Boolean = true
    ) {
        val cacheItem = mediaCacheManager.registerDownloadRequest(
            itemId = itemId,
            remoteUri = remoteUri,
            downloadUrl = downloadUrl,
            fileName = fileName,
            fileExtension = fileExtension,
            priority = priority
        )

        val constraintsBuilder = Constraints.Builder()
            .setRequiresStorageNotLow(true)

        if (requiresWifi) {
            constraintsBuilder.setRequiredNetworkType(NetworkType.UNMETERED)
        } else {
            constraintsBuilder.setRequiredNetworkType(NetworkType.CONNECTED)
        }

        val inputData = Data.Builder()
            .putLong(MediaDownloadWorker.KEY_ITEM_ID, cacheItem.itemId)
            .putString(MediaDownloadWorker.KEY_REMOTE_URI, cacheItem.remoteUri)
            .putString(MediaDownloadWorker.KEY_DOWNLOAD_URL, cacheItem.downloadUrl)
            .putString(MediaDownloadWorker.KEY_LOCAL_PATH, cacheItem.localPath)
            .build()

        val workName = "media_download_${itemId}"
        val workRequest = OneTimeWorkRequestBuilder<MediaDownloadWorker>()
            .setConstraints(constraintsBuilder.build())
            .setInputData(inputData)
            .build()

        WorkManager.getInstance(context).enqueueUniqueWork(
            workName,
            ExistingWorkPolicy.REPLACE,
            workRequest
        )
    }

    /**
     * Cancels an enqueued or active media download task.
     */
    suspend fun cancelDownload(itemId: Long) {
        val workName = "media_download_${itemId}"
        WorkManager.getInstance(context).cancelUniqueWork(workName)
        mediaCacheManager.removeCache(itemId)
    }
}
