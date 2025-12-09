package com.universalmedialibrary.services.opds

import android.content.Context
import android.os.Environment
import android.util.Log
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.OPDSCatalogDao
import com.universalmedialibrary.data.local.entity.DownloadStatus
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.OPDSDownload
import com.universalmedialibrary.utils.FileNameSanitizer
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.io.FileOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * OPDS Download Service
 * 
 * Handles downloading publications from OPDS catalogs.
 * Supports EPUB, PDF, and other common ebook formats.
 */
@Singleton
class OPDSDownloadService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val catalogDao: OPDSCatalogDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val httpClient: OkHttpClient,
    private val fileNameSanitizer: FileNameSanitizer
) {
    private val TAG = "OPDSDownloadService"
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    
    private val _activeDownloads = MutableStateFlow<Map<Long, DownloadProgress>>(emptyMap())
    val activeDownloads: StateFlow<Map<Long, DownloadProgress>> = _activeDownloads.asStateFlow()
    
    data class DownloadProgress(
        val downloadId: Long,
        val title: String,
        val progress: Float,
        val status: DownloadStatus
    )
    
    /**
     * Queue a publication for download
     * 
     * @param catalogId The catalog ID where this publication was found
     * @param entry The OPDS entry containing publication metadata and download links
     * @return The download ID, or null if no valid download link was found
     */
    suspend fun queueDownload(catalogId: Long, entry: OPDSEntry): Long? = withContext(Dispatchers.IO) {
        // Find the best acquisition link (prefer EPUB, then PDF)
        val downloadLink = findBestDownloadLink(entry.acquisitionLinks)
        if (downloadLink == null) {
            Log.w(TAG, "No suitable download link found for: ${entry.title}")
            return@withContext null
        }
        
        // Determine file extension and MIME type
        val (extension, mimeType) = determineFileType(downloadLink.href)
        
        // Create download record
        val download = OPDSDownload(
            catalogId = catalogId,
            title = entry.title,
            authors = entry.authors.joinToString(", "),
            downloadUrl = downloadLink.href,
            status = DownloadStatus.PENDING,
            mimeType = mimeType,
            coverUrl = entry.coverUrl,
            language = entry.language,
            description = entry.summary,
            publishedDate = entry.published
        )
        
        val downloadId = catalogDao.insertDownload(download)
        
        // Start the download
        startDownload(downloadId, entry.title, downloadLink.href, extension)
        
        return@withContext downloadId
    }
    
    /**
     * Start downloading a publication
     */
    private fun startDownload(downloadId: Long, title: String, url: String, extension: String) {
        scope.launch {
            try {
                // Update status to downloading
                catalogDao.updateDownloadProgress(downloadId, DownloadStatus.DOWNLOADING, 0, 0)
                updateActiveDownload(downloadId, title, 0f, DownloadStatus.DOWNLOADING)
                
                // Create output directory
                val downloadDir = File(context.getExternalFilesDir(Environment.DIRECTORY_DOCUMENTS), "opds_books")
                if (!downloadDir.exists()) {
                    downloadDir.mkdirs()
                }
                
                // Create safe filename
                val safeTitle = fileNameSanitizer.sanitizeFileName(title)
                val fileName = "${safeTitle}_${System.currentTimeMillis()}.$extension"
                val outputFile = File(downloadDir, fileName)
                
                // Download the file
                val request = Request.Builder()
                    .url(url)
                    .header("User-Agent", "CleverFerret/1.0 (OPDS Client)")
                    .build()
                
                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        throw Exception("HTTP ${response.code}: ${response.message}")
                    }
                    
                    val body = response.body ?: throw Exception("Empty response body")
                    val contentLength = body.contentLength()
                    
                    // Update file size
                    if (contentLength > 0) {
                        val download = catalogDao.getDownloadById(downloadId)
                        if (download != null) {
                            catalogDao.updateDownload(download.copy(fileSize = contentLength))
                        }
                    }
                    
                    // Write to file with progress tracking
                    FileOutputStream(outputFile).use { output ->
                        val buffer = ByteArray(8192)
                        var bytesRead: Int
                        var totalBytesRead = 0L
                        val inputStream = body.byteStream()
                        
                        while (inputStream.read(buffer).also { bytesRead = it } != -1) {
                            output.write(buffer, 0, bytesRead)
                            totalBytesRead += bytesRead
                            
                            // Calculate progress
                            val progress = if (contentLength > 0) {
                                (totalBytesRead.toFloat() / contentLength.toFloat() * 100).toInt()
                            } else {
                                -1 // Indeterminate
                            }
                            
                            // Update progress every ~100KB
                            if (totalBytesRead % (100 * 1024) < 8192) {
                                catalogDao.updateDownloadProgress(
                                    downloadId, 
                                    DownloadStatus.DOWNLOADING, 
                                    progress.coerceIn(0, 99), 
                                    totalBytesRead
                                )
                                updateActiveDownload(downloadId, title, progress / 100f, DownloadStatus.DOWNLOADING)
                            }
                        }
                    }
                }
                
                // Mark download complete
                catalogDao.markDownloadComplete(downloadId, outputFile.absolutePath)
                updateActiveDownload(downloadId, title, 1f, DownloadStatus.COMPLETED)
                
                // Import to library
                importToLibrary(outputFile, title, catalogDao.getDownloadById(downloadId))
                
                // Remove from active downloads after a delay
                scope.launch {
                    kotlinx.coroutines.delay(2000)
                    removeActiveDownload(downloadId)
                }
                
                Log.i(TAG, "Download complete: $title -> ${outputFile.absolutePath}")
                
            } catch (e: Exception) {
                Log.e(TAG, "Download failed for $title", e)
                catalogDao.markDownloadFailed(downloadId, e.message ?: "Unknown error")
                updateActiveDownload(downloadId, title, 0f, DownloadStatus.FAILED)
                
                // Remove from active downloads after showing error
                scope.launch {
                    kotlinx.coroutines.delay(5000)
                    removeActiveDownload(downloadId)
                }
            }
        }
    }
    
    /**
     * Import a downloaded file to the media library
     */
    private suspend fun importToLibrary(file: File, title: String, download: OPDSDownload?) {
        try {
            // Check if already exists
            val existingItem = mediaItemDao.getMediaItemByPath(file.absolutePath)
            if (existingItem != null) {
                Log.d(TAG, "File already in library: ${file.absolutePath}")
                return
            }
            
            // Determine media type from file extension
            val mediaType = when (file.extension.lowercase()) {
                "epub", "mobi", "azw", "azw3", "fb2" -> "BOOK"
                "pdf" -> "DOCUMENT"
                "cbz", "cbr", "cb7" -> "COMIC"
                else -> "BOOK"
            }
            
            // Create media item
            val mediaItem = MediaItem(
                libraryId = 1L, // Default library
                fileName = file.name,
                filePath = file.absolutePath,
                fileExtension = file.extension,
                mediaType = mediaType,
                fileSize = file.length(),
                dateAdded = System.currentTimeMillis(),
                lastModified = file.lastModified(),
                mimeType = download?.mimeType ?: getMimeType(file.extension)
            )
            
            val itemId = mediaItemDao.insertMediaItem(mediaItem)
            Log.i(TAG, "Imported to library: $title (ID: $itemId)")
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to import to library: $title", e)
        }
    }
    
    /**
     * Find the best download link from available acquisition links
     * Preference: EPUB > PDF > MOBI > Other
     */
    private fun findBestDownloadLink(links: List<OPDSLink>): OPDSLink? {
        if (links.isEmpty()) return null
        
        // Priority order for formats
        val formatPriority = listOf("epub", "pdf", "mobi", "azw", "fb2", "cbz")
        
        for (format in formatPriority) {
            val link = links.find { it.href.lowercase().contains(".$format") }
            if (link != null) return link
        }
        
        // Return any acquisition link if no preferred format found
        return links.firstOrNull { link ->
            link.rel.any { it.contains("acquisition") } ||
            link.href.matches(Regex(".*\\.(epub|pdf|mobi|azw|fb2|cbz|cbr)$", RegexOption.IGNORE_CASE))
        } ?: links.firstOrNull()
    }
    
    /**
     * Determine file type from URL
     */
    private fun determineFileType(url: String): Pair<String, String> {
        val lowercaseUrl = url.lowercase()
        return when {
            lowercaseUrl.contains(".epub") -> "epub" to "application/epub+zip"
            lowercaseUrl.contains(".pdf") -> "pdf" to "application/pdf"
            lowercaseUrl.contains(".mobi") -> "mobi" to "application/x-mobipocket-ebook"
            lowercaseUrl.contains(".azw") -> "azw" to "application/vnd.amazon.ebook"
            lowercaseUrl.contains(".fb2") -> "fb2" to "application/x-fictionbook+xml"
            lowercaseUrl.contains(".cbz") -> "cbz" to "application/x-cbz"
            lowercaseUrl.contains(".cbr") -> "cbr" to "application/x-cbr"
            else -> "epub" to "application/epub+zip" // Default to EPUB
        }
    }
    
    /**
     * Get MIME type for file extension
     */
    private fun getMimeType(extension: String): String {
        return when (extension.lowercase()) {
            "epub" -> "application/epub+zip"
            "pdf" -> "application/pdf"
            "mobi" -> "application/x-mobipocket-ebook"
            "azw", "azw3" -> "application/vnd.amazon.ebook"
            "fb2" -> "application/x-fictionbook+xml"
            "cbz" -> "application/x-cbz"
            "cbr" -> "application/x-cbr"
            else -> "application/octet-stream"
        }
    }
    
    private fun updateActiveDownload(downloadId: Long, title: String, progress: Float, status: DownloadStatus) {
        _activeDownloads.value = _activeDownloads.value + (downloadId to DownloadProgress(downloadId, title, progress, status))
    }
    
    private fun removeActiveDownload(downloadId: Long) {
        _activeDownloads.value = _activeDownloads.value - downloadId
    }
    
    /**
     * Get all active and pending downloads
     */
    fun getActiveDownloadsFlow(): Flow<List<OPDSDownload>> {
        return catalogDao.getActiveDownloads()
    }
    
    /**
     * Get completed downloads
     */
    fun getCompletedDownloadsFlow(): Flow<List<OPDSDownload>> {
        return catalogDao.getCompletedDownloads()
    }
    
    /**
     * Cancel a download
     */
    suspend fun cancelDownload(downloadId: Long) {
        catalogDao.markDownloadCancelled(downloadId)
        removeActiveDownload(downloadId)
    }
    
    /**
     * Retry a failed download
     */
    suspend fun retryDownload(downloadId: Long) {
        val download = catalogDao.getDownloadById(downloadId) ?: return
        if (download.status != DownloadStatus.FAILED) return
        
        val (extension, _) = determineFileType(download.downloadUrl)
        startDownload(downloadId, download.title, download.downloadUrl, extension)
    }
    
    /**
     * Clear completed downloads
     */
    suspend fun clearCompletedDownloads() {
        catalogDao.deleteOldCompletedDownloads(Long.MAX_VALUE)
    }
    
    /**
     * Clear failed downloads
     */
    suspend fun clearFailedDownloads() {
        catalogDao.clearFailedDownloads()
    }
    
    /**
     * Cleanup resources
     */
    fun onDestroy() {
        scope.cancel()
    }
}
