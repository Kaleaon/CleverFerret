package com.universalmedialibrary.ui.media.viewmodels

import androidx.compose.ui.graphics.Color
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.media.player.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Clean media-centric Reader Screen
 * 
 * Handles reading for:
 * - EPUB, PDF, FB2, MOBI
 * - Comics (CBZ/CBR)
 * - Documents (DOCX, ODT, RTF)
 * 
 * Note: This is a simplified implementation with placeholder data.
 * Full reader service integration will be added when the unified
 * reader service is finalized.
 */
@HiltViewModel
class ReaderViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle
) : ViewModel() {
    
    private val bookId: String = savedStateHandle.get<String>("bookId") ?: savedStateHandle.get<String>("mediaId") ?: ""
    private val mediaType: String = savedStateHandle.get<String>("mediaType") ?: "book"
    
    private val _uiState = MutableStateFlow(ReaderState(
        title = "Sample Book",
        author = "Sample Author",
        currentContent = ReaderContent(text = "This is sample book content.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit."),
        currentPage = 1,
        totalPages = 100,
        chapters = generateSampleChapters(),
        currentChapterIndex = 0
    ))
    val uiState: StateFlow<ReaderState> = _uiState.asStateFlow()
    
    init {
        loadBook()
    }
    
    private fun loadBook() {
        viewModelScope.launch {
            delay(200)
            
            _uiState.update {
                it.copy(
                    title = "Sample ${if (mediaType == "comic") "Comic" else "Book"}",
                    author = "Sample Author",
                    isComic = mediaType == "comic",
                    currentChapter = it.chapters.firstOrNull()
                )
            }
        }
    }
    
    private fun generateSampleChapters(): List<ChapterInfo> {
        return (1..10).map { index ->
            ChapterInfo(
                id = "chapter_$index",
                title = "Chapter $index",
                startPage = (index - 1) * 10 + 1,
                endPage = index * 10,
                progress = 0f
            )
        }
    }
    
    fun goToPage(page: Int) {
        if (page < 1 || page > _uiState.value.totalPages) return
        
        viewModelScope.launch {
            _uiState.update { state ->
                val newChapterIndex = state.chapters.indexOfLast { it.startPage <= page }
                    .coerceAtLeast(0)
                
                state.copy(
                    currentPage = page,
                    currentChapterIndex = newChapterIndex,
                    currentChapter = state.chapters.getOrNull(newChapterIndex),
                    overallProgress = page.toFloat() / state.totalPages,
                    isCurrentPageBookmarked = state.bookmarks.any { it.page == page }
                )
            }
        }
    }
    
    fun goToChapter(chapterIndex: Int) {
        val chapters = _uiState.value.chapters
        if (chapterIndex < 0 || chapterIndex >= chapters.size) return
        
        val chapter = chapters[chapterIndex]
        goToPage(chapter.startPage)
    }
    
    fun nextPage() {
        goToPage(_uiState.value.currentPage + 1)
    }
    
    fun previousPage() {
        goToPage(_uiState.value.currentPage - 1)
    }
    
    fun toggleBookmark() {
        viewModelScope.launch {
            val currentPage = _uiState.value.currentPage
            val isBookmarked = _uiState.value.isCurrentPageBookmarked
            
            _uiState.update { state ->
                val bookmarks = if (isBookmarked) {
                    state.bookmarks.filter { it.page != currentPage }
                } else {
                    state.bookmarks + BookmarkInfo(
                        id = "bookmark_${System.currentTimeMillis()}",
                        page = currentPage,
                        chapter = state.currentChapter?.title ?: "",
                        excerpt = state.currentContent.text.take(100),
                        timestamp = System.currentTimeMillis()
                    )
                }
                
                state.copy(
                    bookmarks = bookmarks,
                    isCurrentPageBookmarked = !isBookmarked
                )
            }
        }
    }
    
    fun toggleTts() {
        _uiState.update { it.copy(isTtsActive = !it.isTtsActive) }
    }
    
    fun updateTheme(theme: ReaderTheme) {
        _uiState.update { it.copy(theme = theme) }
    }
    
    fun updateTypography(typography: ReaderTypography) {
        _uiState.update { it.copy(typography = typography) }
    }
    
    fun selectText(text: String, startIndex: Int, endIndex: Int) {
        // Handle text selection for highlighting, dictionary lookup, etc.
    }
}
