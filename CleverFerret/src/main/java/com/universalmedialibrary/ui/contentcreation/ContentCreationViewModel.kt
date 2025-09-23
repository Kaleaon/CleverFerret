package com.universalmedialibrary.ui.contentcreation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.contentcreation.FanfictionToEpubConverter
import com.universalmedialibrary.services.contentcreation.NewsToEpubConverter
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for content creation screen
 */
@HiltViewModel
class ContentCreationViewModel @Inject constructor(
    private val newsConverter: NewsToEpubConverter,
    private val fanfictionConverter: FanfictionToEpubConverter
) : ViewModel() {

    /**
     * Combined result type for both converters
     */
    data class ConversionResult(
        val success: Boolean,
        val filePath: String? = null,
        val title: String? = null,
        val author: String? = null,
        val chapters: Int = 0,
        val errorMessage: String? = null,
        val wasUpdate: Boolean = false,
        val previousChapters: Int = 0,
        val storyId: String? = null
    )

    /**
     * UI State for the content creation screen
     */
    data class ContentCreationUiState(
        val inputUrl: String = "",
        val isConverting: Boolean = false,
        val conversionProgress: String = "",
        val lastResult: ConversionResult? = null
    )

    private val _uiState = MutableStateFlow(ContentCreationUiState())
    val uiState: StateFlow<ContentCreationUiState> = _uiState.asStateFlow()

    /**
     * Update the input URL
     */
    fun updateInputUrl(url: String) {
        _uiState.value = _uiState.value.copy(inputUrl = url)
    }

    /**
     * Convert URL as news article
     */
    fun convertNews() {
        val url = _uiState.value.inputUrl.trim()
        if (url.isEmpty()) return

        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isConverting = true,
                conversionProgress = "Downloading article...",
                lastResult = null
            )

            try {
                _uiState.value = _uiState.value.copy(
                    conversionProgress = "Extracting content..."
                )

                val result = newsConverter.convertNewsToEpub(url)

                _uiState.value = _uiState.value.copy(
                    conversionProgress = if (result.success) "Creating EPUB..." else ""
                )

                // Convert to our unified result type
                val unifiedResult = ConversionResult(
                    success = result.success,
                    filePath = result.filePath,
                    title = result.title,
                    author = result.author,
                    chapters = if (result.success) 1 else 0,
                    errorMessage = result.errorMessage
                )

                _uiState.value = _uiState.value.copy(
                    isConverting = false,
                    conversionProgress = "",
                    lastResult = unifiedResult
                )

            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isConverting = false,
                    conversionProgress = "",
                    lastResult = ConversionResult(
                        success = false,
                        errorMessage = "Conversion failed: ${e.message}"
                    )
                )
            }
        }
    }

    /**
     * Convert URL as fanfiction
     */
    fun convertFanfiction() {
        val url = _uiState.value.inputUrl.trim()
        if (url.isEmpty()) return

        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isConverting = true,
                conversionProgress = "Analyzing fanfiction site...",
                lastResult = null
            )

            try {
                _uiState.value = _uiState.value.copy(
                    conversionProgress = "Checking for existing downloads..."
                )

                val result = fanfictionConverter.convertFanfictionToEpubWithUpdateDetection(url)

                val progressMessage = when {
                    result.wasUpdate -> "Updated story with ${result.chapters - result.previousChapters} new chapters"
                    result.success && !result.wasUpdate && result.storyId != null -> "Story already up-to-date"
                    result.success -> "Creating EPUB with ${result.chapters} chapter(s)..."
                    else -> ""
                }

                _uiState.value = _uiState.value.copy(
                    conversionProgress = progressMessage
                )

                // Convert to our unified result type
                val unifiedResult = ConversionResult(
                    success = result.success,
                    filePath = result.filePath,
                    title = result.title,
                    author = result.author,
                    chapters = result.chapters,
                    errorMessage = result.errorMessage,
                    wasUpdate = result.wasUpdate,
                    previousChapters = result.previousChapters,
                    storyId = result.storyId
                )

                _uiState.value = _uiState.value.copy(
                    isConverting = false,
                    conversionProgress = "",
                    lastResult = unifiedResult
                )

            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isConverting = false,
                    conversionProgress = "",
                    lastResult = ConversionResult(
                        success = false,
                        errorMessage = "Conversion failed: ${e.message}"
                    )
                )
            }
        }
    }

    /**
     * Clear the last conversion result
     */
    fun clearResult() {
        _uiState.value = _uiState.value.copy(lastResult = null)
    }

    /**
     * Reset the form
     */
    fun reset() {
        _uiState.value = ContentCreationUiState()
    }
}