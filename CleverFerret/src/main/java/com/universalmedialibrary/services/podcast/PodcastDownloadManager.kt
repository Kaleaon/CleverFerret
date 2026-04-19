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
import kotlinx.coroutines.cancel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.launch
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import java.io.File
import com.universalmedialibrary.utils.FileNameSanitizer
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Podcast Download Manager using Android DownloadManager
 * Handles episode downloads with progress tracking
 */
@Singleton
class PodcastDownloadManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val episodeDao: PodcastEpisodeDao,
    private val fileNameSanitizer: FileNameSanitizer
) {
    private data class QueuedDownload(
        val episodeId: Long,
        val audioUrl: String,
        val episodeTitle: String,
        val podcastTitle: String,
        val attempt: Int = 0
    )

    private val downloadManager = context.getSystemService(Context.DOWNLOAD_SERVICE) as DownloadManager
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val queueMutex = Mutex()
    private val pendingDownloads = ArrayDeque<QueuedDownload>()
    private val retryCounts = mutableMapOf<Long, Int>()

    // Map of download ID to episode ID
    private val activeDownloads = mutableMapOf<Long, Long>()
    private val activeEpisodes = mutableSetOf<Long>()
    private val downloadRequestMap = mutableMapOf<Long, QueuedDownload>()

    private val _downloadProgress = MutableStateFlow<Map<Long, DownloadStatus>>(emptyMap())
    val downloadProgress: StateFlow<Map<Long, DownloadStatus>> = _downloadProgress.asStateFlow()

    private val maxConcurrentDownloads = 2
    private val maxRetriesPerEpisode = 2
    private val maxDownloadedEpisodesToKeep = 250

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
        scope.launch {
            reconcileDownloadedEpisodesOnStartup()
        }
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
        val queuedDownload = QueuedDownload(
            episodeId = episodeId,
            audioUrl = audioUrl,
            episodeTitle = episodeTitle,
            podcastTitle = podcastTitle
        )
        scope.launch {
            queueMutex.withLock {
                val alreadyQueued = pendingDownloads.any { it.episodeId == episodeId }
                if (activeEpisodes.contains(episodeId) || alreadyQueued) {
                    return@withLock
                }
                pendingDownloads.addLast(queuedDownload)
                _downloadProgress.value = _downloadProgress.value +
                    (episodeId to DownloadStatus.Queued(pendingDownloads.size))
            }
            processQueue()
        }
        return -1L
    }

    private suspend fun processQueue() {
        queueMutex.withLock {
            while (activeDownloads.size < maxConcurrentDownloads && pendingDownloads.isNotEmpty()) {
                val next = pendingDownloads.removeFirst()
                startDownload(next)
            }
        }
    }

    private fun startDownload(download: QueuedDownload): Long {
        // Create download directory
        val downloadDir = File(
            context.getExternalFilesDir(Environment.DIRECTORY_PODCASTS),
            sanitizeFileName(download.podcastTitle)
        )
        downloadDir.mkdirs()

        // Generate filename
        val fileName = "${sanitizeFileName(download.episodeTitle)}.${getFileExtension(download.audioUrl)}"

        // Create download request
        val request = DownloadManager.Request(Uri.parse(download.audioUrl))
            .setTitle(download.episodeTitle)
            .setDescription("Downloading from ${download.podcastTitle}")
            .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE)
            .setDestinationInExternalFilesDir(
                context,
                Environment.DIRECTORY_PODCASTS,
                "${sanitizeFileName(download.podcastTitle)}/$fileName"
            )
            .setAllowedOverMetered(false) // WiFi only by default
            .setAllowedOverRoaming(false)

        // Enqueue download
        val downloadId = downloadManager.enqueue(request)

        // Track download
        activeDownloads[downloadId] = download.episodeId
        activeEpisodes.add(download.episodeId)
        downloadRequestMap[downloadId] = download
        _downloadProgress.value = _downloadProgress.value + (download.episodeId to DownloadStatus.Downloading(0f))

        // Start progress monitoring
        monitorDownload(downloadId, download.episodeId)

        return downloadId
    }

    /**
     * Cancel a download
     */
    fun cancelDownload(episodeId: Long) {
        val iterator = pendingDownloads.iterator()
        while (iterator.hasNext()) {
            if (iterator.next().episodeId == episodeId) {
                iterator.remove()
            }
        }
        activeDownloads.entries.find { it.value == episodeId }?.key?.let { downloadId ->
            downloadManager.remove(downloadId)
            activeDownloads.remove(downloadId)
            activeEpisodes.remove(episodeId)
            downloadRequestMap.remove(downloadId)
            _downloadProgress.value = _downloadProgress.value - episodeId
        }
    }

    fun retryDownload(
        episodeId: Long,
        audioUrl: String,
        episodeTitle: String,
        podcastTitle: String
    ) {
        cancelDownload(episodeId)
        retryCounts.remove(episodeId)
        downloadEpisode(
            episodeId = episodeId,
            audioUrl = audioUrl,
            episodeTitle = episodeTitle,
            podcastTitle = podcastTitle
        )
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
                
                try {
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
                                retryCounts.remove(episodeId)
                            }
                            DownloadManager.STATUS_FAILED -> {
                                isComplete = true
                                scheduleRetryOrFail(downloadId, episodeId)
                            }
                        }
                    }
                } finally {
                    cursor.close()
                }

                if (!isComplete) {
                    kotlinx.coroutines.delay(1000) // Update every second
                }
            }
            queueMutex.withLock {
                activeDownloads.remove(downloadId)
                activeEpisodes.remove(episodeId)
                downloadRequestMap.remove(downloadId)
            }
            processQueue()
        }
    }

    private suspend fun scheduleRetryOrFail(downloadId: Long, episodeId: Long) {
        val download = queueMutex.withLock {
            downloadRequestMap[downloadId]
        }
        if (download == null) {
            _downloadProgress.value = _downloadProgress.value +
                (episodeId to DownloadStatus.Failed("Download failed"))
            return
        }

        val nextAttempt = (retryCounts[episodeId] ?: 0) + 1
        if (nextAttempt <= maxRetriesPerEpisode) {
            retryCounts[episodeId] = nextAttempt
            queueMutex.withLock {
                pendingDownloads.addFirst(download.copy(attempt = nextAttempt))
                _downloadProgress.value = _downloadProgress.value +
                    (episodeId to DownloadStatus.Retrying(nextAttempt, maxRetriesPerEpisode))
            }
        } else {
            retryCounts.remove(episodeId)
            _downloadProgress.value = _downloadProgress.value +
                (episodeId to DownloadStatus.Failed("Download failed after $maxRetriesPerEpisode retries"))
        }
    }

    private fun handleDownloadComplete(downloadId: Long) {
        val episodeId = activeDownloads[downloadId] ?: return

        scope.launch {
            // Get local file path
            val query = DownloadManager.Query().setFilterById(downloadId)
            val cursor = downloadManager.query(query)

            try {
                if (cursor.moveToFirst()) {
                    val uriIndex = cursor.getColumnIndex(DownloadManager.COLUMN_LOCAL_URI)
                    val localUri = cursor.getString(uriIndex)

                    persistEpisodeCompletion(episodeId, localUri)
                    cleanupStorageIfNeeded()
                }
            } finally {
                cursor.close()
                activeDownloads.remove(downloadId)
                activeEpisodes.remove(episodeId)
                downloadRequestMap.remove(downloadId)
            }
        }
    }

    internal suspend fun persistEpisodeCompletion(episodeId: Long, localUri: String?) {
        val resolvedFilePath = resolveLocalFilePath(localUri)
        if (resolvedFilePath.isNullOrBlank()) {
            _downloadProgress.value = _downloadProgress.value +
                (episodeId to DownloadStatus.Failed("Download completed but file path was unavailable"))
            return
        }
        episodeDao.markDownloadCompletedAtomically(
            episodeId = episodeId,
            filePath = resolvedFilePath,
            timestamp = System.currentTimeMillis()
        )
    }

    internal suspend fun reconcileDownloadedEpisodesOnStartup() {
        episodeDao.getDownloadedEpisodesOnce().forEach { episode ->
            val localPath = resolveLocalFilePath(episode.localFilePath)
            val fileExists = !localPath.isNullOrBlank() && File(localPath).exists()
            if (!fileExists) {
                episodeDao.clearDownloadedState(episode.id)
            }
        }
    }

    private fun resolveLocalFilePath(localPathOrUri: String?): String? {
        if (localPathOrUri.isNullOrBlank()) return null
        return if (localPathOrUri.startsWith("file://")) {
            Uri.parse(localPathOrUri).path
        } else {
            localPathOrUri
        }
    }

    private suspend fun cleanupStorageIfNeeded() {
        val episodes = episodeDao.getDownloadedEpisodes().firstOrNull().orEmpty()
        if (episodes.size <= maxDownloadedEpisodesToKeep) return

        val staleEpisodes = episodes
            .sortedBy { it.downloadedAt ?: 0L }
            .take(episodes.size - maxDownloadedEpisodesToKeep)

        staleEpisodes.forEach { episode ->
            val localPath = episode.localFilePath ?: return@forEach
            runCatching {
                val file = if (localPath.startsWith("file://")) {
                    File(Uri.parse(localPath).path.orEmpty())
                } else {
                    File(localPath)
                }
                if (file.exists()) {
                    file.delete()
                }
            }
            episodeDao.updateDownloadStatus(
                id = episode.id,
                downloaded = false,
                filePath = null,
                timestamp = null
            )
        }
    }

    private fun sanitizeFileName(name: String): String {
        return fileNameSanitizer.sanitizeFileName(name)
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
        // Cancel coroutine scope to prevent memory leaks
        scope.cancel()
    }
}

sealed class DownloadStatus {
    object NotDownloaded : DownloadStatus()
    data class Queued(val position: Int) : DownloadStatus()
    data class Downloading(val progress: Float) : DownloadStatus()
    data class Retrying(val attempt: Int, val maxRetries: Int) : DownloadStatus()
    object Completed : DownloadStatus()
    data class Failed(val reason: String) : DownloadStatus()
    object Paused : DownloadStatus()
}
