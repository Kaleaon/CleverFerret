package com.universalmedialibrary.ui.webfiction

import android.content.Context
import android.content.Intent
import androidx.core.content.FileProvider
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.contentcreation.FanfictionToEPUBConverter
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.io.File
import javax.inject.Inject

@HiltViewModel
class FanfictionDownloaderViewModel @Inject constructor(
    private val fanfictionConverter: FanfictionToEPUBConverter,
    @ApplicationContext private val context: Context
) : ViewModel() {

    private val _uiState = MutableStateFlow(FanfictionDownloaderUiState())
    val uiState: StateFlow<FanfictionDownloaderUiState> = _uiState.asStateFlow()

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

                val result = fanfictionConverter.convertStoryToEPUBWithDetails(
                    storyUrl = url,
                    outputFileName = null
                )

                if (result != null) {
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
     * Refresh library - placeholder for future implementation
     */
    fun refreshLibrary() {
        // TODO: Implement library refresh
    }

    /**
     * Delete story - placeholder for future implementation
     */
    fun deleteStory(storyId: String) {
        // TODO: Implement story deletion
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

data class DownloadedStory(
    val id: String,
    val title: String,
    val author: String,
    val filePath: String,
    val downloadDate: Long
)
