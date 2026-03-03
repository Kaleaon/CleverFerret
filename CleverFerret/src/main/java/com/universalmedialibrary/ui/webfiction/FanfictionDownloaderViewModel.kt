package com.universalmedialibrary.ui.webfiction

import android.content.Context
import android.content.Intent
import androidx.core.content.FileProvider
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.DownloadedStoryDao
import com.universalmedialibrary.data.local.entity.DownloadedStory
import com.universalmedialibrary.services.contentcreation.FanfictionEpubConversionService
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import java.io.File
import java.util.UUID
import javax.inject.Inject
import com.universalmedialibrary.core.logging.AppLogger

@HiltViewModel
class FanfictionDownloaderViewModel @Inject constructor(
    private val fanfictionConverter: FanfictionEpubConversionService,
    private val downloadedStoryDao: DownloadedStoryDao,
    @ApplicationContext private val context: Context
) : ViewModel() {

    private val _uiState = MutableStateFlow(FanfictionDownloaderUiState())
    val uiState: StateFlow<FanfictionDownloaderUiState> = _uiState.asStateFlow()

    init {
        refreshLibrary()
    }

    fun updateUrl(url: String) {
        _uiState.value = _uiState.value.copy(
            url = url,
            error = null
        )
    }

    fun downloadFanfiction() {
        val url = _uiState.value.url.trim()
        
        if (url.isBlank()) {
            _uiState.value = _uiState.value.copy(
                error = "Please enter a valid URL"
            )
            return
        }

        if (!url.startsWith("http://") && !url.startsWith("https://")) {
            _uiState.value = _uiState.value.copy(
                error = "URL must start with http:// or https://"
            )
            return
        }

        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isLoading = true,
                error = null,
                result = null,
                progressMessage = "Connecting to site..."
            )

            try {
                // Update progress
                _uiState.value = _uiState.value.copy(
                    progressMessage = "Fetching story metadata..."
                )

                val result = fanfictionConverter.convertStoryToEpubWithDetails(
                    storyUrl = url,
                    outputFileName = null
                )

                if (result != null) {
                    // Save to database
                    val storyId = UUID.randomUUID().toString()
                    val downloadedStory = DownloadedStory(
                        id = storyId,
                        url = url,
                        title = result.story.title,
                        author = result.story.author,
                        site = FanfictionEpubConversionService.FanfictionSite.fromUrl(url)?.name ?: "UNKNOWN",
                        siteStoryId = extractStoryId(url) ?: storyId,
                        totalChapters = result.story.chapters.size,
                        lastKnownChapters = result.story.chapters.size,
                        lastUpdated = System.currentTimeMillis(),
                        lastChecked = System.currentTimeMillis(),
                        lastDownloaded = System.currentTimeMillis(),
                        epubFilePath = result.file.absolutePath,
                        fileSize = result.file.length(),
                        isCompleted = result.story.metadata.status?.equals("Complete", ignoreCase = true) == true,
                        description = result.story.summary,
                        tags = result.story.metadata.characters + listOfNotNull(result.story.metadata.genre),
                        rating = result.story.metadata.rating,
                        language = result.story.metadata.language,
                        fandom = result.story.metadata.fandom
                    )
                    
                    downloadedStoryDao.insertStory(downloadedStory)

                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = null,
                        result = DownloadResult(
                            title = result.story.title,
                            author = result.story.author,
                            chapters = result.story.chapters.size,
                            filePath = result.file.absolutePath
                        ),
                        progressMessage = null
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = "Failed to download story. Please check the URL and try again.",
                        progressMessage = null
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Error: ${e.message ?: "Unknown error occurred"}",
                    progressMessage = null
                )
            }
        }
    }

    private fun extractStoryId(url: String): String? {
        val pattern = "/s/(\\d+)".toRegex()
        return pattern.find(url)?.groupValues?.getOrNull(1)
    }

    fun openEpub() {
        val filePath = _uiState.value.result?.filePath ?: return
        
        try {
            val file = File(filePath)
            if (!file.exists()) {
                _uiState.value = _uiState.value.copy(
                    error = "File not found: $filePath"
                )
                return
            }

            val uri = FileProvider.getUriForFile(
                context,
                "${context.packageName}.fileprovider",
                file
            )

            val intent = Intent(Intent.ACTION_VIEW).apply {
                setDataAndType(uri, "application/epub+zip")
                addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }

            context.startActivity(Intent.createChooser(intent, "Open with").apply {
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            })
        } catch (e: Exception) {
            _uiState.value = _uiState.value.copy(
                error = "Failed to open EPUB: ${e.message}"
            )
        }
    }

    fun shareEpub() {
        val filePath = _uiState.value.result?.filePath ?: return
        
        try {
            val file = File(filePath)
            if (!file.exists()) {
                _uiState.value = _uiState.value.copy(
                    error = "File not found: $filePath"
                )
                return
            }

            val uri = FileProvider.getUriForFile(
                context,
                "${context.packageName}.fileprovider",
                file
            )

            val intent = Intent(Intent.ACTION_SEND).apply {
                type = "application/epub+zip"
                putExtra(Intent.EXTRA_STREAM, uri)
                putExtra(Intent.EXTRA_SUBJECT, _uiState.value.result?.title ?: "Fanfiction EPUB")
                putExtra(Intent.EXTRA_TEXT, "Sharing: ${_uiState.value.result?.title}")
                addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }

            context.startActivity(Intent.createChooser(intent, "Share EPUB via").apply {
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            })
        } catch (e: Exception) {
            _uiState.value = _uiState.value.copy(
                error = "Failed to share EPUB: ${e.message}"
            )
        }
    }

    private fun extractTitle(file: File): String {
        // Try to extract title from filename
        val fileName = file.nameWithoutExtension
        return fileName.replace("_", " ").replace("-", " ")
            .split(" ")
            .take(5) // Take first 5 words as title
            .joinToString(" ")
            .ifBlank { "Fanfiction Story" }
    }

    private fun extractChapterCount(file: File): Int {
        // This is a placeholder - ideally we'd track this during conversion
        return 1
    }

    /**
     * Download from URL - wrapper for existing functionality
     */
    fun downloadFromUrl(url: String) {
        updateUrl(url)
        downloadFanfiction()
    }

    /**
     * Refresh library by observing database
     */
    fun refreshLibrary() {
        viewModelScope.launch {
            downloadedStoryDao.getAllStories().collectLatest { stories ->
                _uiState.value = _uiState.value.copy(
                    downloadedStories = stories
                )
            }
        }
    }

    /**
     * Delete story from database and file system
     */
    fun deleteStory(storyId: String) {
        viewModelScope.launch {
            val story = downloadedStoryDao.getStoryById(storyId)
            if (story != null) {
                // Delete file
                try {
                    val file = File(story.epubFilePath)
                    if (file.exists()) {
                        file.delete()
                    }
                } catch (e: Exception) {
                    // Log error but continue to delete from DB
                    AppLogger.error("FanfictionDownloaderViewModel", "Unhandled exception", e)
                }
                
                // Delete from DB
                downloadedStoryDao.deleteStory(story)
            }
        }
    }

    /**
     * Clear download result and error state
     */
    fun clearResult() {
        _uiState.value = _uiState.value.copy(
            result = null,
            error = null,
            progressMessage = null
        )
    }
}

data class FanfictionDownloaderUiState(
    val url: String = "",
    val isLoading: Boolean = false,
    val error: String? = null,
    val result: DownloadResult? = null,
    val progressMessage: String? = null,
    val downloadedStories: List<DownloadedStory> = emptyList()
)

data class DownloadResult(
    val title: String,
    val author: String,
    val chapters: Int,
    val filePath: String
)
