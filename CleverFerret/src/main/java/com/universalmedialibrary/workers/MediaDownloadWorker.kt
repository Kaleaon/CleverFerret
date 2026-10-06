package com.universalmedialibrary.workers

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.hilt.work.HiltWorker
import androidx.work.CoroutineWorker
import androidx.work.ForegroundInfo
import androidx.work.WorkerParameters
import androidx.work.workDataOf
import com.universalmedialibrary.R
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.DownloadState
import com.universalmedialibrary.services.cache.MediaCacheManager
import dagger.assisted.Assisted
import dagger.assisted.AssistedInject
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.io.FileOutputStream
import java.io.IOException

/**
 * Background worker that handles streaming and downloading media files into the media cache.
 */
@HiltWorker
class MediaDownloadWorker @AssistedInject constructor(
    @Assisted appContext: Context,
    @Assisted params: WorkerParameters,
    private val mediaCacheManager: MediaCacheManager,
    private val mediaItemDao: MediaItemDao,
    private val okHttpClient: OkHttpClient
) : CoroutineWorker(appContext, params) {

    companion object {
        private const val TAG = "MediaDownloadWorker"
        const val KEY_ITEM_ID = "item_id"
        const val KEY_REMOTE_URI = "remote_uri"
        const val KEY_DOWNLOAD_URL = "download_url"
        const val KEY_LOCAL_PATH = "local_path"
        const val CHANNEL_ID = "media_download_channel"
        const val NOTIFICATION_ID = 905
    }

    override suspend fun doWork(): Result {
        val itemId = inputData.getLong(KEY_ITEM_ID, -1L)
        val remoteUri = inputData.getString(KEY_REMOTE_URI) ?: ""
        val downloadUrl = inputData.getString(KEY_DOWNLOAD_URL) ?: ""
        val localPath = inputData.getString(KEY_LOCAL_PATH) ?: ""

        if (itemId == -1L || downloadUrl.isBlank() || localPath.isBlank()) {
            Log.e(TAG, "Invalid work inputs for download item $itemId")
            return Result.failure()
        }

        // 500 MB Safety Limit Check
        if (!mediaCacheManager.isStorageSpaceAvailable()) {
            val errorMsg = "Download cancelled: Available storage is below 500 MB safety limit"
            Log.w(TAG, errorMsg)
            mediaCacheManager.updateDownloadState(itemId, DownloadState.FAILED, errorMsg)
            return Result.failure(workDataOf("error" to errorMsg))
        }

        mediaCacheManager.updateDownloadState(itemId, DownloadState.DOWNLOADING)

        val targetFile = File(localPath)
        targetFile.parentFile?.mkdirs()
        val tempFile = File("${localPath}.tmp")

        return try {
            val request = Request.Builder()
                .url(downloadUrl)
                .build()

            val response = okHttpClient.newCall(request).execute()
            if (!response.isSuccessful) {
                val errorMsg = "HTTP error during download: ${response.code}"
                Log.e(TAG, errorMsg)
                mediaCacheManager.updateDownloadState(itemId, DownloadState.FAILED, errorMsg)
                return Result.failure(workDataOf("error" to errorMsg))
            }

            val body = response.body ?: throw IOException("Empty response body from $downloadUrl")
            val contentLength = body.contentLength()

            body.byteStream().use { input ->
                FileOutputStream(tempFile).use { output ->
                    val buffer = ByteArray(8192)
                    var bytesRead: Int
                    var totalRead = 0L

                    while (input.read(buffer).also { bytesRead = it } != -1) {
                        output.write(buffer, 0, bytesRead)
                        totalRead += bytesRead

                        // Check disk allocation limit dynamically during stream write
                        if (!mediaCacheManager.isStorageSpaceAvailable()) {
                            tempFile.delete()
                            val errorMsg = "Download aborted: Disk space dropped below 500 MB safety limit"
                            mediaCacheManager.updateDownloadState(itemId, DownloadState.FAILED, errorMsg)
                            return Result.failure(workDataOf("error" to errorMsg))
                        }

                        mediaCacheManager.updateDownloadProgress(
                            itemId = itemId,
                            downloadedBytes = totalRead,
                            fileSize = if (contentLength > 0) contentLength else totalRead,
                            state = DownloadState.DOWNLOADING
                        )
                    }
                }
            }

            if (tempFile.exists()) {
                if (targetFile.exists()) {
                    targetFile.delete()
                }
                tempFile.renameTo(targetFile)
            }

            val finalLength = targetFile.length()
            mediaCacheManager.updateDownloadProgress(
                itemId = itemId,
                downloadedBytes = finalLength,
                fileSize = finalLength,
                state = DownloadState.CACHED
            )

            // Transition MediaItem to available status
            mediaItemDao.updateAvailableStatus(itemId, true)

            // Trigger LRU cache eviction check
            mediaCacheManager.enforceStorageLimits()

            Log.i(TAG, "Successfully downloaded item $itemId to ${targetFile.absolutePath}")
            Result.success(workDataOf("localPath" to targetFile.absolutePath))
        } catch (e: Exception) {
            Log.e(TAG, "Error downloading media item $itemId", e)
            if (tempFile.exists()) {
                tempFile.delete()
            }
            mediaCacheManager.updateDownloadState(itemId, DownloadState.FAILED, e.message)
            Result.failure(workDataOf("error" to (e.message ?: "Unknown download error")))
        }
    }
}
