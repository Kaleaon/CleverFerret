package com.universalmedialibrary.services.podcast

import android.app.DownloadManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.Uri
import android.os.Build
import android.os.Environment
import androidx.core.content.ContextCompat
import com.universalmedialibrary.data.local.dao.PodcastEpisodeDao
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Podcast Download Manager using Android DownloadManager
 * Handles episode downloads with progress tracking
 */
@Singleton
class PodcastDownloadManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val episodeDao: PodcastEpisodeDao
) {
    private val downloadManager = context.getSystemService(Context.DOWNLOAD_SERVICE) as DownloadManager
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)

    // Map of download ID to episode ID
    private val activeDownloads = mutableMapOf<Long, Long>()

    private val _downloadProgress = MutableStateFlow<Map<Long, DownloadStatus>>(emptyMap())
    val downloadProgress: StateFlow<Map<Long, DownloadStatus>> = _downloadProgress.asStateFlow()

    private val downloadCompleteReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            val downloadId = intent.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1)
            if (downloadId != -1L) {
                handleDownloadComplete(downloadId)
            }
        }
    }

    init {
        // Register receiver for download completion using ContextCompat for all API levels
        androidx.core.content.ContextCompat.registerReceiver(
            context,
            downloadCompleteReceiver,
            IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE),
            androidx.core.content.ContextCompat.RECEIVER_NOT_EXPORTED
        )
    }

    /**
     * Download a podcast episode
     */
    fun downloadEpisode(
        episodeId: Long,
        audioUrl: String,
        episodeTitle: String,
        podcastTitle: String
    ): Long {
        // Create download directory
        val downloadDir = File(
            context.getExternalFilesDir(Environment.DIRECTORY_PODCASTS),
            sanitizeFileName(podcastTitle)
        )
        downloadDir.mkdirs()

        // Generate filename
        val fileName = "${sanitizeFileName(episodeTitle)}.${getFileExtension(audioUrl)}"

        // Create download request
        val request = DownloadManager.Request(Uri.parse(audioUrl))
            .setTitle(episodeTitle)
            .setDescription("Downloading from $podcastTitle")
            .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE)
            .setDestinationInExternalFilesDir(
                context,
                Environment.DIRECTORY_PODCASTS,
                "${sanitizeFileName(podcastTitle)}/$fileName"
            )
            .setAllowedOverMetered(false) // WiFi only by default
            .setAllowedOverRoaming(false)

        // Enqueue download
        val downloadId = downloadManager.enqueue(request)

        // Track download
        activeDownloads[downloadId] = episodeId
        _downloadProgress.value = _downloadProgress.value + (episodeId to DownloadStatus.Downloading(0f))

        // Start progress monitoring
        monitorDownload(downloadId, episodeId)

        return downloadId
    }

    /**
     * Cancel a download
     */
    fun cancelDownload(episodeId: Long) {
        val downloadId = activeDownloads.entries.find { it.value == episodeId }?.key
        if (downloadId != null) {
            downloadManager.remove(downloadId)
            activeDownloads.remove(downloadId)
            _downloadProgress.value = _downloadProgress.value - episodeId
        }
    }

    /**
     * Get download status
     */
    fun getDownloadStatus(episodeId: Long): DownloadStatus {
        return _downloadProgress.value[episodeId] ?: DownloadStatus.NotDownloaded
    }

    private fun monitorDownload(downloadId: Long, episodeId: Long) {
        scope.launch {
            var isComplete = false

            while (!isComplete && activeDownloads.containsKey(downloadId)) {
                val query = DownloadManager.Query().setFilterById(downloadId)
                val cursor = downloadManager.query(query)

                if (cursor.moveToFirst()) {
                    val statusIndex = cursor.getColumnIndex(DownloadManager.COLUMN_STATUS)
                    val bytesDownloadedIndex = cursor.getColumnIndex(DownloadManager.COLUMN_BYTES_DOWNLOADED_SO_FAR)
                    val bytesTotalIndex = cursor.getColumnIndex(DownloadManager.COLUMN_TOTAL_SIZE_BYTES)

                    val status = cursor.getInt(statusIndex)
                    val bytesDownloaded = cursor.getLong(bytesDownloadedIndex)
                    val bytesTotal = cursor.getLong(bytesTotalIndex)

                    val progress = if (bytesTotal > 0) {
                        bytesDownloaded.toFloat() / bytesTotal.toFloat()
                    } else {
                        0f
                    }

                    when (status) {
                        DownloadManager.STATUS_RUNNING -> {
                            _downloadProgress.value = _downloadProgress.value +
                                (episodeId to DownloadStatus.Downloading(progress))
                        }
                        DownloadManager.STATUS_SUCCESSFUL -> {
                            isComplete = true
                            _downloadProgress.value = _downloadProgress.value +
                                (episodeId to DownloadStatus.Completed)
                        }
                        DownloadManager.STATUS_FAILED -> {
                            isComplete = true
                            _downloadProgress.value = _downloadProgress.value +
                                (episodeId to DownloadStatus.Failed)
                            activeDownloads.remove(downloadId)
                        }
                    }
                }

                cursor.close()

                if (!isComplete) {
                    kotlinx.coroutines.delay(1000) // Update every second
                }
            }
        }
    }

    private fun handleDownloadComplete(downloadId: Long) {
        val episodeId = activeDownloads[downloadId] ?: return

        scope.launch {
            // Get local file path
            val query = DownloadManager.Query().setFilterById(downloadId)
            val cursor = downloadManager.query(query)

            if (cursor.moveToFirst()) {
                val uriIndex = cursor.getColumnIndex(DownloadManager.COLUMN_LOCAL_URI)
                val localUri = cursor.getString(uriIndex)

                // Update episode in database
                episodeDao.updateDownloadStatus(
                    id = episodeId,
                    downloaded = true,
                    filePath = localUri,
                    timestamp = System.currentTimeMillis()
                )
            }

            cursor.close()
            activeDownloads.remove(downloadId)
        }
    }

    private fun sanitizeFileName(name: String): String {
        return name.replace(Regex("[^a-zA-Z0-9.-]"), "_").take(100)
    }

    private fun getFileExtension(url: String): String {
        return try {
            val uri = Uri.parse(url)
            val path = uri.path ?: ""
            val lastDot = path.lastIndexOf('.')
            if (lastDot > 0 && lastDot < path.length - 1) {
                path.substring(lastDot + 1).lowercase()
            } else {
                "mp3"
            }
        } catch (e: Exception) {
            "mp3"
        }
    }

    fun onDestroy() {
        try {
            context.unregisterReceiver(downloadCompleteReceiver)
        } catch (e: Exception) {
            // Already unregistered
        }
    }
}

sealed class DownloadStatus {
    object NotDownloaded : DownloadStatus()
    data class Downloading(val progress: Float) : DownloadStatus()
    object Completed : DownloadStatus()
    object Failed : DownloadStatus()
    object Paused : DownloadStatus()
}
