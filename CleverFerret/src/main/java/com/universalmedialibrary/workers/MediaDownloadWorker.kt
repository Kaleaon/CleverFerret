package com.universalmedialibrary.workers

import android.content.Context
import android.util.Log
import androidx.hilt.work.HiltWorker
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import androidx.work.workDataOf
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.DownloadState
import com.universalmedialibrary.services.cache.MediaCacheManager
import com.universalmedialibrary.services.plex.PlexUrlUtils
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
        private const val PREAMBLE_SAMPLE_SIZE = 512L

        internal fun isXmlOrHtmlContentType(contentType: String): Boolean {
            val lower = contentType.lowercase()
            val xmlHtmlTypes = listOf("text/xml", "application/xml", "text/html", "application/xhtml+xml")
            return xmlHtmlTypes.any { lower.contains(it) }
        }

        private fun readFilePrefix(file: File): ByteArray {
            val bytesToRead = file.length().coerceAtMost(PREAMBLE_SAMPLE_SIZE).toInt()
            val buffer = ByteArray(bytesToRead)
            file.inputStream().use { input ->
                input.read(buffer, 0, bytesToRead)
            }
            return buffer
        }

        internal fun isNonMediaPayload(file: File): Boolean {
            if (!file.exists() || file.length() == 0L) return false
            return try {
                val buffer = readFilePrefix(file)
                val preamble = String(buffer, java.nio.charset.StandardCharsets.UTF_8).trimStart().lowercase()
                val nonMediaPrefixes = listOf("<?xml", "<!doctype", "<html", "<mediacontainer", "<rss", "<error")
                nonMediaPrefixes.any { preamble.startsWith(it) }
            } catch (_: java.io.IOException) {
                false
            }
        }
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

            okHttpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    val errorMsg = "HTTP error during download: ${response.code}"
                    Log.e(TAG, errorMsg)
                    mediaCacheManager.updateDownloadState(itemId, DownloadState.FAILED, errorMsg)
                    return Result.failure(workDataOf("error" to errorMsg))
                }

                val contentType = response.header("Content-Type")?.lowercase() ?: ""
                if (isXmlOrHtmlContentType(contentType)) {
                    val errorMsg = "Download rejected: non-media Content-Type ($contentType)"
                    Log.e(TAG, errorMsg)
                    mediaCacheManager.updateDownloadState(itemId, DownloadState.FAILED, errorMsg)
                    return Result.failure(workDataOf("error" to errorMsg))
                }

                val sanitizedUrl = PlexUrlUtils.sanitizeUrl(downloadUrl)
                val body = response.body ?: throw IOException("Empty response body from $sanitizedUrl")
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
            }

            if (tempFile.exists()) {
                if (isNonMediaPayload(tempFile)) {
                    tempFile.delete()
                    val errorMsg = "Download rejected: payload contains non-media XML/HTML signature"
                    Log.e(TAG, errorMsg)
                    mediaCacheManager.updateDownloadState(itemId, DownloadState.FAILED, errorMsg)
                    return Result.failure(workDataOf("error" to errorMsg))
                }

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
            val sanitizedMsg = PlexUrlUtils.sanitizeUrl(e.message ?: "Unknown download error")
            Log.e(TAG, "Error downloading media item $itemId: $sanitizedMsg", Exception(sanitizedMsg))
            if (tempFile.exists()) {
                tempFile.delete()
            }
            mediaCacheManager.updateDownloadState(itemId, DownloadState.FAILED, sanitizedMsg)
            Result.failure(workDataOf("error" to sanitizedMsg))
        }
    }
}
