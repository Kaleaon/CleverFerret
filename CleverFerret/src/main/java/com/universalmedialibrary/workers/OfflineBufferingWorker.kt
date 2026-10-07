package com.universalmedialibrary.workers

import android.content.Context
import android.net.Uri
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.jobs.JobContractType
import com.universalmedialibrary.jobs.JobExecutionState
import com.universalmedialibrary.jobs.JobStatusBus
import com.universalmedialibrary.jobs.JobStatusEvent
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.services.cache.CacheManager
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import java.net.HttpURLConnection
import java.net.URL

/**
 * Background WorkManager worker responsible for offline buffering of remote media items
 * (e.g., Jellyfin, Emby, Plex virtual URIs).
 */
class OfflineBufferingWorker(
    appContext: Context,
    params: WorkerParameters
) : CoroutineWorker(appContext, params) {

    companion object {
        const val KEY_ITEM_ID = "ITEM_ID"
        const val TAG_OFFLINE_BUFFERING = "offline_buffering"
    }

    override suspend fun doWork(): Result = withContext(Dispatchers.IO) {
        val itemId = inputData.getLong(KEY_ITEM_ID, -1L)
        if (itemId == -1L) {
            return@withContext Result.failure()
        }

        val db = AppDatabase.getDatabase(applicationContext)
        val mediaItemDao = db.mediaItemDao()
        val mediaItem = mediaItemDao.getMediaItemById(itemId) ?: return@withContext Result.failure()

        // Check if already cached
        mediaItem.localCachePath?.let { cachePath ->
            val existing = File(cachePath)
            if (existing.exists() && existing.length() > 0) {
                mediaItemDao.updateDownloadInfo(
                    itemId = itemId,
                    cachePath = existing.absolutePath,
                    status = "COMPLETED",
                    progress = 1.0f
                )
                JobStatusBus.publish(
                    JobStatusEvent(
                        contractType = JobContractType.OFFLINE_MEDIA_BUFFERING,
                        state = JobExecutionState.SUCCEEDED,
                        jobId = id.toString(),
                        message = "Media item already buffered: ${mediaItem.fileName}"
                    )
                )
                return@withContext Result.success()
            }
        }

        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.OFFLINE_MEDIA_BUFFERING,
                state = JobExecutionState.RUNNING,
                jobId = id.toString(),
                message = "Buffering ${mediaItem.fileName}..."
            )
        )

        mediaItemDao.updateDownloadStatus(itemId, "DOWNLOADING", 0.0f)

        // Resolve stream URL
        val streamUrl = buildStreamUrl(db, mediaItem.filePath)
        if (streamUrl == null) {
            mediaItemDao.updateDownloadStatus(itemId, "FAILED", 0.0f)
            JobStatusBus.publish(
                JobStatusEvent(
                    contractType = JobContractType.OFFLINE_MEDIA_BUFFERING,
                    state = JobExecutionState.FAILED,
                    jobId = id.toString(),
                    message = "Failed to resolve stream URL for ${mediaItem.fileName}"
                )
            )
            return@withContext Result.failure()
        }

        // Prepare target cache file
        val settingsRepository = SettingsRepository(applicationContext)
        val cacheManager = CacheManager(applicationContext, settingsRepository)
        val cacheDir = cacheManager.getCacheDirectory()
        val bufferDir = File(cacheDir, "buffered").apply { if (!exists()) mkdirs() }
        val uriHash = mediaItem.filePath.hashCode().toString()
        val ext = if (mediaItem.fileExtension.isNotBlank()) mediaItem.fileExtension else "tmp"
        val targetFile = File(bufferDir, "buffer_${uriHash}_${mediaItem.itemId}.$ext")

        try {
            val url = URL(streamUrl)
            val connection = url.openConnection() as HttpURLConnection
            connection.connectTimeout = 15000
            connection.readTimeout = 30000
            connection.requestMethod = "GET"
            connection.connect()

            if (connection.responseCode !in 200..299) {
                mediaItemDao.updateDownloadStatus(itemId, "FAILED", 0.0f)
                return@withContext Result.failure()
            }

            val totalBytes = connection.contentLengthLong
            connection.inputStream.use { input ->
                FileOutputStream(targetFile).use { output ->
                    val buffer = ByteArray(8192)
                    var bytesRead: Int
                    var totalRead = 0L

                    while (input.read(buffer).also { bytesRead = it } != -1) {
                        if (isStopped) {
                            targetFile.delete()
                            mediaItemDao.updateDownloadStatus(itemId, "CANCELLED", 0.0f)
                            return@withContext Result.failure()
                        }
                        output.write(buffer, 0, bytesRead)
                        totalRead += bytesRead

                        if (totalBytes > 0) {
                            val progress = (totalRead.toFloat() / totalBytes.toFloat()).coerceIn(0f, 1f)
                            mediaItemDao.updateDownloadStatus(itemId, "DOWNLOADING", progress)
                            JobStatusBus.publish(
                                JobStatusEvent(
                                    contractType = JobContractType.OFFLINE_MEDIA_BUFFERING,
                                    state = JobExecutionState.PROGRESS,
                                    jobId = id.toString(),
                                    progress = (progress * 100).toInt(),
                                    total = 100,
                                    message = "Buffering ${mediaItem.fileName} (${(progress * 100).toInt()}%)"
                                )
                            )
                        }
                    }
                }
            }

            mediaItemDao.updateDownloadInfo(
                itemId = itemId,
                cachePath = targetFile.absolutePath,
                status = "COMPLETED",
                progress = 1.0f
            )

            JobStatusBus.publish(
                JobStatusEvent(
                    contractType = JobContractType.OFFLINE_MEDIA_BUFFERING,
                    state = JobExecutionState.SUCCEEDED,
                    jobId = id.toString(),
                    message = "Successfully buffered ${mediaItem.fileName}"
                )
            )

            Result.success()
        } catch (e: Exception) {
            if (targetFile.exists()) {
                targetFile.delete()
            }
            mediaItemDao.updateDownloadStatus(itemId, "FAILED", 0.0f)
            JobStatusBus.publish(
                JobStatusEvent(
                    contractType = JobContractType.OFFLINE_MEDIA_BUFFERING,
                    state = JobExecutionState.FAILED,
                    jobId = id.toString(),
                    message = "Buffering error for ${mediaItem.fileName}: ${e.message}"
                )
            )
            Result.failure()
        }
    }

    private suspend fun buildStreamUrl(db: AppDatabase, filePath: String): String? {
        val uri = Uri.parse(filePath)
        val scheme = uri.scheme ?: return null
        val host = uri.host ?: return null
        val pathSegments = uri.pathSegments ?: emptyList()

        return when (scheme) {
            "jellyfin" -> {
                val serverId = host.toLongOrNull() ?: return null
                val itemId = pathSegments.firstOrNull() ?: return null
                val server = db.jellyfinServerDao().getById(serverId) ?: return null
                "${server.url}/Items/$itemId/Download?api_key=${server.apiKey}"
            }
            "emby" -> {
                val serverId = host.toLongOrNull() ?: return null
                val itemId = pathSegments.firstOrNull() ?: return null
                val server = db.embyServerDao().getById(serverId) ?: return null
                "${server.url}/Items/$itemId/Download?api_key=${server.apiKey}"
            }
            "plex" -> {
                val machineId = host
                val ratingKey = pathSegments.firstOrNull() ?: return null
                val server = db.plexServerDao().getServerByMachineId(machineId)
                    ?: db.plexServerDao().getFirstActiveServer()
                    ?: return null
                "${server.url}/library/parts/$ratingKey/file?X-Plex-Token=${server.token}"
            }
            "http", "https" -> filePath
            else -> null
        }
    }
}
