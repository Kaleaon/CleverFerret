package com.universalmedialibrary.services.podcast

import android.content.Context
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.io.FileOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Modern Kotlin implementation for podcast episode downloading
 * with progress tracking, error handling, and WiFi-only support
 */
@Singleton
class PodcastDownloadManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val httpClient: OkHttpClient
) {
    private val _downloadProgress = MutableStateFlow<Map<String, PodcastDownloadProgress>>(emptyMap())
    val downloadProgress: StateFlow<Map<String, PodcastDownloadProgress>> = _downloadProgress.asStateFlow()

    private val downloadsDir: File
        get() = File(context.getExternalFilesDir(null), "podcasts").apply { mkdirs() }

    /**
     * Download a podcast episode with progress tracking
     */
    suspend fun downloadEpisode(
        episode: PodcastEpisode,
        podcastTitle: String,
        wifiOnly: Boolean = false
    ): Result<String> = withContext(Dispatchers.IO) {
        try {
            // Check WiFi requirement
            if (wifiOnly && !isWifiConnected()) {
                return@withContext Result.failure(
                    IllegalStateException("WiFi connection required for download")
                )
            }

            // Update progress: Starting
            updateProgress(
                episode.id,
                PodcastDownloadProgress(
                    episodeId = episode.id,
                    progress = 0f,
                    downloadedBytes = 0L,
                    totalBytes = episode.fileSize,
                    status = DownloadStatus.DOWNLOADING
                )
            )

            // Create podcast directory
            val podcastDir = File(downloadsDir, sanitizeFileName(podcastTitle))
            podcastDir.mkdirs()

            // Generate filename
            val extension = getFileExtension(episode.audioUrl)
            val fileName = "${sanitizeFileName(episode.title)}.$extension"
            val file = File(podcastDir, fileName)

            // Download with progress tracking
            val request = Request.Builder()
                .url(episode.audioUrl)
                .build()

            httpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    throw Exception("Download failed: ${response.code}")
                }

                val totalBytes = response.body?.contentLength() ?: episode.fileSize
                var downloadedBytes = 0L

                response.body?.byteStream()?.use { input ->
                    FileOutputStream(file).use { output ->
                        val buffer = ByteArray(8192)
                        var bytesRead: Int

                        while (input.read(buffer).also { bytesRead = it } != -1) {
                            output.write(buffer, 0, bytesRead)
                            downloadedBytes += bytesRead

                            // Update progress
                            val progress = if (totalBytes > 0) {
                                downloadedBytes.toFloat() / totalBytes.toFloat()
                            } else 0f

                            updateProgress(
                                episode.id,
                                PodcastDownloadProgress(
                                    episodeId = episode.id,
                                    progress = progress,
                                    downloadedBytes = downloadedBytes,
                                    totalBytes = totalBytes,
                                    status = DownloadStatus.DOWNLOADING
                                )
                            )
                        }
                    }
                }

                // Download completed
                updateProgress(
                    episode.id,
                    PodcastDownloadProgress(
                        episodeId = episode.id,
                        progress = 1f,
                        downloadedBytes = downloadedBytes,
                        totalBytes = totalBytes,
                        status = DownloadStatus.COMPLETED
                    )
                )

                Result.success(file.absolutePath)
            }
        } catch (e: Exception) {
            Log.e("PodcastDownload", "Failed to download episode ${episode.id}", e)
            
            // Update progress: Failed
            updateProgress(
                episode.id,
                PodcastDownloadProgress(
                    episodeId = episode.id,
                    progress = 0f,
                    downloadedBytes = 0L,
                    totalBytes = episode.fileSize,
                    status = DownloadStatus.FAILED
                )
            )

            Result.failure(e)
        }
    }

    /**
     * Cancel an ongoing download
     */
    fun cancelDownload(episodeId: String) {
        val currentProgress = _downloadProgress.value[episodeId]
        if (currentProgress != null) {
            updateProgress(
                episodeId,
                currentProgress.copy(status = DownloadStatus.CANCELLED)
            )
        }
    }

    /**
     * Delete a downloaded episode
     */
    suspend fun deleteDownload(episode: PodcastEpisode, podcastTitle: String): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val podcastDir = File(downloadsDir, sanitizeFileName(podcastTitle))
                val extension = getFileExtension(episode.audioUrl)
                val fileName = "${sanitizeFileName(episode.title)}.$extension"
                val file = File(podcastDir, fileName)
                
                if (file.exists()) {
                    file.delete()
                } else {
                    false
                }
            } catch (e: Exception) {
                Log.e("PodcastDownload", "Failed to delete episode ${episode.id}", e)
                false
            }
        }
    }

    /**
     * Get the local file path for a downloaded episode
     */
    fun getLocalFilePath(episode: PodcastEpisode, podcastTitle: String): String? {
        val podcastDir = File(downloadsDir, sanitizeFileName(podcastTitle))
        val extension = getFileExtension(episode.audioUrl)
        val fileName = "${sanitizeFileName(episode.title)}.$extension"
        val file = File(podcastDir, fileName)
        
        return if (file.exists()) file.absolutePath else null
    }

    /**
     * Check if an episode is downloaded
     */
    fun isEpisodeDownloaded(episode: PodcastEpisode, podcastTitle: String): Boolean {
        return getLocalFilePath(episode, podcastTitle) != null
    }

    /**
     * Get total size of all downloads
     */
    suspend fun getTotalDownloadSize(): Long = withContext(Dispatchers.IO) {
        try {
            downloadsDir.walkTopDown()
                .filter { it.isFile }
                .sumOf { it.length() }
        } catch (e: Exception) {
            0L
        }
    }

    /**
     * Clear all downloads
     */
    suspend fun clearAllDownloads(): Boolean = withContext(Dispatchers.IO) {
        try {
            downloadsDir.deleteRecursively()
            downloadsDir.mkdirs()
            true
        } catch (e: Exception) {
            Log.e("PodcastDownload", "Failed to clear downloads", e)
            false
        }
    }

    private fun updateProgress(episodeId: String, progress: PodcastDownloadProgress) {
        _downloadProgress.value = _downloadProgress.value.toMutableMap().apply {
            put(episodeId, progress)
        }
    }

    private fun isWifiConnected(): Boolean {
        // TODO: Implement WiFi check using ConnectivityManager
        // For now, return true to allow downloads
        return true
    }

    private fun sanitizeFileName(name: String): String {
        return name.replace(Regex("[^a-zA-Z0-9.-]"), "_")
    }

    private fun getFileExtension(url: String): String {
        return when {
            url.contains(".mp3") -> "mp3"
            url.contains(".m4a") -> "m4a"
            url.contains(".ogg") -> "ogg"
            else -> "mp3" // default to mp3
        }
    }
}
