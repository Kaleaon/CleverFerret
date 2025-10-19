package com.universalmedialibrary.ui.reader

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.ebook.MobiReaderEngine
import com.universalmedialibrary.services.reader.core.BookSource
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.io.File
import javax.inject.Inject

/**
 * ViewModel for MOBI/AZW Reader
 */
@HiltViewModel
class MobiReaderViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mobiEngine: MobiReaderEngine
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(MobiReaderUiState())
    val uiState: StateFlow<MobiReaderUiState> = _uiState.asStateFlow()
    
    fun loadBook(filePath: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            
            try {
                val file = File(filePath)
                val result = mobiEngine.open(
                    context,
                    BookSource.File(android.net.Uri.fromFile(file))
                )
                
                if (result.isSuccess) {
                    val chapters = mobiEngine.getAllChapters()
                    val metadata = mobiEngine.getMetadata()
                    val currentHtml = mobiEngine.getCurrentChapterHtml()
                    
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        isLoaded = true,
                        title = metadata?.title,
                        author = metadata?.author,
                        chapters = chapters,
                        currentChapterIndex = 0,
                        currentChapterHtml = currentHtml
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = result.exceptionOrNull()?.message ?: "Failed to load MOBI file"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message ?: "Unknown error"
                )
            }
        }
    }
    
    fun nextChapter() {
        viewModelScope.launch {
            if (mobiEngine.next()) {
                _uiState.value = _uiState.value.copy(
                    currentChapterIndex = _uiState.value.currentChapterIndex + 1,
                    currentChapterHtml = mobiEngine.getCurrentChapterHtml()
                )
            }
        }
    }
    
    fun previousChapter() {
        viewModelScope.launch {
            if (mobiEngine.previous()) {
                _uiState.value = _uiState.value.copy(
                    currentChapterIndex = _uiState.value.currentChapterIndex - 1,
                    currentChapterHtml = mobiEngine.getCurrentChapterHtml()
                )
            }
        }
    }
    
    fun goToChapter(index: Int) {
        viewModelScope.launch {
            val locator = com.universalmedialibrary.services.reader.core.Locator(
                href = "chapter_$index",
                locations = mapOf("chapterIndex" to index)
            )
            
            if (mobiEngine.goTo(locator).isSuccess) {
                _uiState.value = _uiState.value.copy(
                    currentChapterIndex = index,
                    currentChapterHtml = mobiEngine.getCurrentChapterHtml()
                )
            }
        }
    }
    
    fun addBookmark() {
        // Note: Integrate with BookmarkRepository
        viewModelScope.launch {
            // Save current position as bookmark
        }
    }
    
    fun toggleSettings() {
        _uiState.value = _uiState.value.copy(
            showSettings = !_uiState.value.showSettings
        )
    }
    
    fun setFontSize(size: Int) {
        _uiState.value = _uiState.value.copy(fontSize = size)
    }
    
    fun setTheme(theme: ReadingTheme) {
        _uiState.value = _uiState.value.copy(theme = theme)
    }
    
    override fun onCleared() {
        super.onCleared()
        viewModelScope.launch {
            mobiEngine.close()
        }
    }
}

data class MobiReaderUiState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val error: String? = null,
    val title: String? = null,
    val author: String? = null,
    val chapters: List<com.universalmedialibrary.services.ebook.MobiReaderEngine.MobiChapter> = emptyList(),
    val currentChapterIndex: Int = 0,
    val currentChapterHtml: String? = null,
    val fontSize: Int = 100,
    val theme: ReadingTheme = ReadingTheme.DAY,
    val showSettings: Boolean = false
)
