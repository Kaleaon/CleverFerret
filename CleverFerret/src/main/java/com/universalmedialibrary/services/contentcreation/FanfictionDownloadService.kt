package com.universalmedialibrary.services.contentcreation

import android.content.Context
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Modern fanfiction download service inspired by Calibre's FanFicFare
 * Supports multiple fanfiction sites with proper error handling and progress tracking
 */
@Singleton
class FanfictionDownloadService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val converter = FanfictionToEpubConverterBasic(context)
    
    private val _downloadProgress = MutableStateFlow<DownloadState>(DownloadState.Idle)
    val downloadProgress: StateFlow<DownloadState> = _downloadProgress.asStateFlow()

    /**
     * Download states for UI feedback
     */
    sealed class DownloadState {
        object Idle : DownloadState()
        data class Downloading(
            val url: String,
            val progress: Float = 0f,
            val message: String = ""
        ) : DownloadState()
        data class Success(
            val filePath: String,
            val title: String,
            val author: String,
            val chapters: Int
        ) : DownloadState()
        data class Error(val message: String) : DownloadState()
    }

    /**
     * Supported fanfiction sites (based on Calibre FanFicFare)
     */
    enum class SupportedSite(val displayName: String, val urlPattern: String) {
        ARCHIVE_OF_OUR_OWN("Archive of Our Own", "archiveofourown.org"),
        FANFICTION_NET("FanFiction.Net", "fanfiction.net"),
        WATTPAD("Wattpad", "wattpad.com"),
        ROYAL_ROAD("Royal Road", "royalroad.com"),
        FICTION_PRESS("FictionPress", "fictionpress.com"),
        SCRIBBLEHUB("ScribbleHub", "scribblehub.com");

        fun matches(url: String): Boolean = url.contains(urlPattern, ignoreCase = true)
    }

    /**
     * Check if a URL is from a supported fanfiction site
     */
    fun isSupportedSite(url: String): Boolean {
        return SupportedSite.values().any { it.matches(url) }
    }

    /**
     * Get the site for a given URL
     */
    fun getSiteForUrl(url: String): SupportedSite? {
        return SupportedSite.values().firstOrNull { it.matches(url) }
    }

    /**
     * Download fanfiction from a URL and convert to EPUB
     */
    suspend fun downloadFanfiction(url: String): Result<DownloadResult> = withContext(Dispatchers.IO) {
        try {
            // Update state: Starting
            _downloadProgress.value = DownloadState.Downloading(
                url = url,
                progress = 0.1f,
                message = "Validating URL..."
            )

            // Validate URL
            if (!isSupportedSite(url)) {
                val error = "Unsupported site. Supported: ${SupportedSite.values().joinToString { it.displayName }}"
                _downloadProgress.value = DownloadState.Error(error)
                return@withContext Result.failure(IllegalArgumentException(error))
            }

            val site = getSiteForUrl(url)
            _downloadProgress.value = DownloadState.Downloading(
                url = url,
                progress = 0.2f,
                message = "Downloading from ${site?.displayName}..."
            )

            // Download and convert
            val result = converter.convertFanfictionToEpub(url)

            if (result.success && result.filePath != null) {
                val downloadResult = DownloadResult(
                    success = true,
                    filePath = result.filePath,
                    title = result.title ?: "Unknown Title",
                    author = result.author ?: "Unknown Author",
                    chapters = result.chapters,
                    site = site?.displayName ?: "Unknown"
                )

                _downloadProgress.value = DownloadState.Success(
                    filePath = result.filePath,
                    title = downloadResult.title,
                    author = downloadResult.author,
                    chapters = result.chapters
                )

                Result.success(downloadResult)
            } else {
                val error = result.errorMessage ?: "Unknown error"
                _downloadProgress.value = DownloadState.Error(error)
                Result.failure(Exception(error))
            }
        } catch (e: Exception) {
            Log.e("FanfictionDownload", "Failed to download fanfiction", e)
            val error = "Download failed: ${e.message}"
            _downloadProgress.value = DownloadState.Error(error)
            Result.failure(e)
        }
    }

    /**
     * Reset download state
     */
    fun resetState() {
        _downloadProgress.value = DownloadState.Idle
    }

    /**
     * Result of a successful download
     */
    data class DownloadResult(
        val success: Boolean,
        val filePath: String,
        val title: String,
        val author: String,
        val chapters: Int,
        val site: String
    )

    /**
     * Get list of supported sites for UI display
     */
    fun getSupportedSites(): List<SiteInfo> {
        return SupportedSite.values().map { site ->
            SiteInfo(
                name = site.displayName,
                urlExample = when (site) {
                    SupportedSite.ARCHIVE_OF_OUR_OWN -> "https://archiveofourown.org/works/123456"
                    SupportedSite.FANFICTION_NET -> "https://www.fanfiction.net/s/123456/1/"
                    SupportedSite.WATTPAD -> "https://www.wattpad.com/story/123456"
                    SupportedSite.ROYAL_ROAD -> "https://www.royalroad.com/fiction/12345/"
                    SupportedSite.FICTION_PRESS -> "https://www.fictionpress.com/s/123456/1/"
                    SupportedSite.SCRIBBLEHUB -> "https://www.scribblehub.com/series/12345/"
                }
            )
        }
    }

    data class SiteInfo(
        val name: String,
        val urlExample: String
    )
}
