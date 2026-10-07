package com.universalmedialibrary.services.media

import android.content.Context
import android.net.Uri
import com.universalmedialibrary.data.local.dao.EmbyServerDao
import com.universalmedialibrary.data.local.dao.JellyfinServerDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.PlexServerDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.cache.CacheManager
import com.universalmedialibrary.services.network.NetworkMonitor
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import java.net.HttpURLConnection
import java.net.URL
import javax.inject.Inject
import javax.inject.Singleton

sealed class ResolvedContent {
    data class LocalFile(val file: File, val mimeType: String? = null) : ResolvedContent()
    data class StreamUrl(val url: String, val headers: Map<String, String> = emptyMap(), val mimeType: String? = null) : ResolvedContent()
    data class OfflineUnbuffered(val virtualUri: String, val message: String) : ResolvedContent()
    data class Error(val message: String) : ResolvedContent()
}

interface MediaContentResolver {
    suspend fun resolve(mediaItem: MediaItem): ResolvedContent
    suspend fun resolvePath(filePath: String): ResolvedContent
    suspend fun isLocallyAvailable(mediaItem: MediaItem): Boolean
    suspend fun isLocallyAvailable(filePath: String): Boolean
    fun isVirtualUri(path: String): Boolean
    suspend fun downloadToTempFile(mediaItem: MediaItem, streamUrl: String): File?
}

@Singleton
class MediaContentResolverImpl @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaItemDao: MediaItemDao,
    private val jellyfinServerDao: JellyfinServerDao,
    private val embyServerDao: EmbyServerDao,
    private val plexServerDao: PlexServerDao,
    private val cacheManager: CacheManager,
    private val networkMonitor: NetworkMonitor
) : MediaContentResolver {

    override fun isVirtualUri(path: String): Boolean {
        return path.startsWith("jellyfin://") ||
                path.startsWith("emby://") ||
                path.startsWith("plex://")
    }

    override suspend fun isLocallyAvailable(mediaItem: MediaItem): Boolean {
        return resolve(mediaItem) is ResolvedContent.LocalFile
    }

    override suspend fun isLocallyAvailable(filePath: String): Boolean {
        return resolvePath(filePath) is ResolvedContent.LocalFile
    }

    override suspend fun resolve(mediaItem: MediaItem): ResolvedContent = withContext(Dispatchers.IO) {
        // 1. Check if localCachePath is set and file exists
        mediaItem.localCachePath?.let { cachePath ->
            val cacheFile = File(cachePath)
            if (cacheFile.exists() && cacheFile.length() > 0) {
                return@withContext ResolvedContent.LocalFile(cacheFile, mediaItem.mimeType)
            }
        }

        // 2. Resolve by path
        resolvePathInternal(mediaItem.filePath, mediaItem)
    }

    override suspend fun resolvePath(filePath: String): ResolvedContent = withContext(Dispatchers.IO) {
        val mediaItem = mediaItemDao.getItemByPathOrCachePath(filePath)
        if (mediaItem != null) {
            resolve(mediaItem)
        } else {
            resolvePathInternal(filePath, null)
        }
    }

    private suspend fun resolvePathInternal(path: String, mediaItem: MediaItem?): ResolvedContent {
        // Check if path is virtual scheme
        if (isVirtualUri(path)) {
            // Check if file is buffered locally in CacheManager
            val bufferedFile = getBufferedFileForUri(path)
            if (bufferedFile != null && bufferedFile.exists() && bufferedFile.length() > 0) {
                if (mediaItem != null && mediaItem.localCachePath != bufferedFile.absolutePath) {
                    mediaItemDao.updateDownloadInfo(
                        itemId = mediaItem.itemId,
                        cachePath = bufferedFile.absolutePath,
                        status = "COMPLETED",
                        progress = 1.0f
                    )
                }
                return ResolvedContent.LocalFile(bufferedFile, mediaItem?.mimeType)
            }

            // Remote virtual item is unbuffered. Check network connectivity.
            if (!networkMonitor.isOnline()) {
                val name = mediaItem?.fileName ?: path.substringAfterLast('/')
                return ResolvedContent.OfflineUnbuffered(
                    virtualUri = path,
                    message = "Item '$name' is not cached locally and the device is offline. Connect to an unmetered network to buffer or stream this item."
                )
            }

            // Online: Resolve stream URL from remote server configuration
            val streamUrl = buildStreamUrlForVirtualUri(path)
                ?: return ResolvedContent.Error("Unable to resolve server configuration or credentials for virtual URI '$path'")

            return ResolvedContent.StreamUrl(streamUrl, mimeType = mediaItem?.mimeType)
        }

        // Standard HTTP / HTTPS URL
        if (path.startsWith("http://") || path.startsWith("https://")) {
            return ResolvedContent.StreamUrl(path, mimeType = mediaItem?.mimeType)
        }

        // Local filesystem path
        val localFile = File(path)
        if (localFile.exists()) {
            return ResolvedContent.LocalFile(localFile, mediaItem?.mimeType)
        }

        return ResolvedContent.Error("File not found at path: $path")
    }

    private suspend fun getBufferedFileForUri(virtualUri: String): File? {
        val cacheDir = cacheManager.getCacheDirectory()
        val bufferDir = File(cacheDir, "buffered").apply { if (!exists()) mkdirs() }
        val uriHash = virtualUri.hashCode().toString()

        // Check if any file starting with uriHash exists in buffered directory
        val matches = bufferDir.listFiles { _, name -> name.startsWith("buffer_$uriHash") }
        return matches?.firstOrNull()
    }

    private suspend fun buildStreamUrlForVirtualUri(virtualUri: String): String? {
        val uri = Uri.parse(virtualUri)
        val scheme = uri.scheme ?: return null
        val host = uri.host ?: return null
        val pathSegments = uri.pathSegments ?: emptyList()

        return when (scheme) {
            "jellyfin" -> {
                val serverId = host.toLongOrNull() ?: return null
                val itemId = pathSegments.firstOrNull() ?: return null
                val server = jellyfinServerDao.getById(serverId) ?: return null
                "${server.url}/Items/$itemId/Download?api_key=${server.apiKey}"
            }
            "emby" -> {
                val serverId = host.toLongOrNull() ?: return null
                val itemId = pathSegments.firstOrNull() ?: return null
                val server = embyServerDao.getById(serverId) ?: return null
                "${server.url}/Items/$itemId/Download?api_key=${server.apiKey}"
            }
            "plex" -> {
                val machineId = host
                val ratingKey = pathSegments.firstOrNull() ?: return null
                val server = plexServerDao.getServerByMachineId(machineId)
                    ?: plexServerDao.getFirstActiveServer()
                    ?: return null
                "${server.url}/library/parts/$ratingKey/file?X-Plex-Token=${server.token}"
            }
            else -> null
        }
    }

    override suspend fun downloadToTempFile(mediaItem: MediaItem, streamUrl: String): File? = withContext(Dispatchers.IO) {
        try {
            val cacheDir = cacheManager.getCacheDirectory()
            val tempDir = File(cacheDir, "temp_stream").apply { if (!exists()) mkdirs() }
            val ext = if (mediaItem.fileExtension.isNotBlank()) mediaItem.fileExtension else "tmp"
            val tempFile = File(tempDir, "stream_${mediaItem.itemId}_${System.currentTimeMillis()}.$ext")

            val url = URL(streamUrl)
            val connection = url.openConnection() as HttpURLConnection
            connection.connectTimeout = 15000
            connection.readTimeout = 30000
            connection.requestMethod = "GET"
            connection.connect()

            if (connection.responseCode in 200..299) {
                connection.inputStream.use { input ->
                    FileOutputStream(tempFile).use { output ->
                        input.copyTo(output)
                    }
                }
                tempFile
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
}
