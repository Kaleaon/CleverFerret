package com.universalmedialibrary.ui.reader

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.epub.EpubReaderService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import java.io.File
import javax.inject.Inject

@HiltViewModel
class EPUBReaderViewModel @Inject constructor(
    private val epubReaderService: EpubReaderService
) : ViewModel() {

    private val _uiState = MutableStateFlow(EpubReaderUiState())
    val uiState: StateFlow<EpubReaderUiState> = _uiState.asStateFlow()

    init {
        viewModelScope.launch {
            epubReaderService.readerState.collectLatest { state ->
                _uiState.update { current ->
                    current.copy(
                        bookTitle = state.bookTitle,
                        bookAuthor = state.bookAuthor,
                        isLoaded = state.isLoaded,
                        currentChapter = state.currentChapter,
                        totalChapters = state.totalChapters,
                        error = state.error,
                        chapters = state.chapters.map { it.title },
                        currentContent = state.currentContent.ifBlank { current.currentContent }
                    )
                }
            }
        }
    }

    fun loadBook(bookUri: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(error = null, isLoaded = false) }
            val uri = parseUri(bookUri)
            val success = epubReaderService.loadEPUB(uri)
            if (!success) {
                _uiState.update {
                    it.copy(error = "Failed to load EPUB content.")
                }
            }
        }
    }

    fun nextChapter() {
        if (epubReaderService.nextChapter()) {
            updateContent()
        }
    }

    fun previousChapter() {
        if (epubReaderService.previousChapter()) {
            updateContent()
        }
    }

    fun jumpToChapter(index: Int) {
        if (epubReaderService.jumpToChapter(index)) {
            updateContent()
        }
    }

    private fun updateContent() {
        val content = epubReaderService.readerState.value.currentContent
        _uiState.update { it.copy(currentContent = content) }
    }

    private fun parseUri(bookUri: String): Uri {
        val decoded = Uri.decode(bookUri)
        val uri = Uri.parse(decoded)
        return if (uri.scheme.isNullOrBlank()) {
            Uri.fromFile(File(decoded))
        } else {
            uri
        }
    }
}
