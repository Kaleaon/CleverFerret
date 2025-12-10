package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.services.reader.UnifiedReaderService
import com.universalmedialibrary.services.tts.TtsProviderManager
import com.universalmedialibrary.ui.plex.player.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Plex-style Reader Screen
 * 
 * Handles reading for:
 * - EPUB, PDF, FB2, MOBI
 * - Comics (CBZ/CBR)
 * - Documents (DOCX, ODT, RTF)
 */
@HiltViewModel
class PlexReaderViewModel @Inject constructor(
    private val savedStateHandle: SavedStateHandle,
    private val readerService: UnifiedReaderService,
    private val bookRepository: BookRepository,
    private val readingProgressRepository: ReadingProgressRepository,
    private val bookmarkRepository: BookmarkRepository,
    private val annotationRepository: AnnotationRepository,
    private val ttsManager: TtsProviderManager,
    private val settingsRepository: SettingsRepository
) : ViewModel() {
    
    private val bookId: String = savedStateHandle.get<String>("bookId") ?: ""
    private val mediaType: String = savedStateHandle.get<String>("mediaType") ?: "book"
    
    private val _uiState = MutableStateFlow(ReaderState(
        title = "",
        author = null,
        currentContent = ReaderContent(),
        currentPage = 1,
        totalPages = 1,
        chapters = emptyList(),
        currentChapterIndex = 0
    ))
    val uiState: StateFlow<ReaderState> = _uiState.asStateFlow()
    
    init {
        loadBook()
        loadReaderSettings()
    }
    
    private fun loadBook() {
        viewModelScope.launch {
            val book = bookRepository.getBook(bookId.toLongOrNull() ?: 0L)
            if (book != null) {
                // Open book with reader service
                readerService.openBook(book.filePath)
                
                // Get book metadata
                val chapters = readerService.getTableOfContents().map { toc ->
                    ChapterInfo(
                        id = toc.id,
                        title = toc.title,
                        startPage = toc.startPage,
                        endPage = toc.endPage,
                        progress = 0f
                    )
                }
                
                // Get reading progress
                val progress = readingProgressRepository.getProgress(bookId.toLong())
                val startPage = progress?.currentPage ?: 1
                val startChapter = progress?.currentChapter ?: 0
                
                // Load bookmarks
                val bookmarks = bookmarkRepository.getBookmarks(bookId.toLong()).first()
                
                _uiState.update {
                    it.copy(
                        title = book.title,
                        author = book.author,
                        currentPage = startPage,
                        totalPages = book.pageCount ?: 100,
                        chapters = chapters,
                        currentChapterIndex = startChapter,
                        currentChapter = chapters.getOrNull(startChapter),
                        bookmarks = bookmarks.map { bm ->
                            BookmarkInfo(
                                id = bm.id.toString(),
                                page = bm.page,
                                chapter = bm.chapterTitle ?: "",
                                excerpt = bm.excerpt ?: "",
                                timestamp = bm.createdAt
                            )
                        },
                        isCurrentPageBookmarked = bookmarks.any { bm -> bm.page == startPage },
                        isComic = mediaType == "comic"
                    )
                }
                
                // Load content for current page
                loadPageContent(startPage)
            }
        }
    }
    
    private fun loadReaderSettings() {
        viewModelScope.launch {
            settingsRepository.getReaderSettings().collect { settings ->
                _uiState.update {
                    it.copy(
                        theme = ReaderTheme(
                            name = settings.themeName,
                            backgroundColor = parseColor(settings.backgroundColor),
                            textColor = parseColor(settings.textColor)
                        ),
                        typography = ReaderTypography(
                            fontSize = settings.fontSize,
                            lineHeight = settings.lineHeight,
                            marginHorizontal = settings.marginHorizontal,
                            marginVertical = settings.marginVertical,
                            textAlign = TextAlignment.valueOf(settings.textAlign.uppercase())
                        )
                    )
                }
            }
        }
    }
    
    fun goToPage(page: Int) {
        if (page < 1 || page > _uiState.value.totalPages) return
        
        viewModelScope.launch {
            _uiState.update { it.copy(currentPage = page) }
            loadPageContent(page)
            updateProgress(page)
            
            // Update chapter index if needed
            val chapters = _uiState.value.chapters
            val newChapterIndex = chapters.indexOfLast { it.startPage <= page }
            if (newChapterIndex >= 0 && newChapterIndex != _uiState.value.currentChapterIndex) {
                _uiState.update {
                    it.copy(
                        currentChapterIndex = newChapterIndex,
                        currentChapter = chapters[newChapterIndex]
                    )
                }
            }
            
            updateBookmarkStatus(page)
        }
    }
    
    fun goToChapter(chapterIndex: Int) {
        val chapters = _uiState.value.chapters
        if (chapterIndex < 0 || chapterIndex >= chapters.size) return
        
        val chapter = chapters[chapterIndex]
        goToPage(chapter.startPage)
    }
    
    fun toggleBookmark() {
        viewModelScope.launch {
            val currentPage = _uiState.value.currentPage
            val isBookmarked = _uiState.value.isCurrentPageBookmarked
            
            if (isBookmarked) {
                bookmarkRepository.removeBookmark(bookId.toLong(), currentPage)
            } else {
                bookmarkRepository.addBookmark(
                    bookId = bookId.toLong(),
                    page = currentPage,
                    chapterTitle = _uiState.value.currentChapter?.title,
                    excerpt = _uiState.value.currentContent.text.take(100)
                )
            }
            
            _uiState.update { it.copy(isCurrentPageBookmarked = !isBookmarked) }
            
            // Reload bookmarks
            val bookmarks = bookmarkRepository.getBookmarks(bookId.toLong()).first()
            _uiState.update {
                it.copy(
                    bookmarks = bookmarks.map { bm ->
                        BookmarkInfo(
                            id = bm.id.toString(),
                            page = bm.page,
                            chapter = bm.chapterTitle ?: "",
                            excerpt = bm.excerpt ?: "",
                            timestamp = bm.createdAt
                        )
                    }
                )
            }
        }
    }
    
    fun toggleTts() {
        viewModelScope.launch {
            val isTtsActive = _uiState.value.isTtsActive
            
            if (isTtsActive) {
                ttsManager.stop()
            } else {
                ttsManager.speak(_uiState.value.currentContent.text)
            }
            
            _uiState.update { it.copy(isTtsActive = !isTtsActive) }
        }
    }
    
    fun updateTheme(theme: ReaderTheme) {
        viewModelScope.launch {
            _uiState.update { it.copy(theme = theme) }
            settingsRepository.updateReaderTheme(theme.name, theme.backgroundColor.toString(), theme.textColor.toString())
        }
    }
    
    fun updateTypography(typography: ReaderTypography) {
        viewModelScope.launch {
            _uiState.update { it.copy(typography = typography) }
            settingsRepository.updateReaderTypography(
                fontSize = typography.fontSize,
                lineHeight = typography.lineHeight,
                marginHorizontal = typography.marginHorizontal,
                marginVertical = typography.marginVertical,
                textAlign = typography.textAlign.name
            )
        }
    }
    
    fun selectText(text: String, startIndex: Int, endIndex: Int) {
        // Handle text selection for highlighting, dictionary lookup, etc.
        viewModelScope.launch {
            // Could trigger dictionary lookup, highlight creation, etc.
        }
    }
    
    private suspend fun loadPageContent(page: Int) {
        val content = readerService.getPageContent(page)
        _uiState.update {
            it.copy(
                currentContent = ReaderContent(
                    text = content.text,
                    imageUrl = content.imageUrl,
                    htmlContent = content.html
                ),
                chapterProgress = calculateChapterProgress(page),
                overallProgress = page.toFloat() / it.totalPages
            )
        }
    }
    
    private fun calculateChapterProgress(page: Int): Float {
        val chapter = _uiState.value.currentChapter ?: return 0f
        val chapterPages = chapter.endPage - chapter.startPage
        if (chapterPages <= 0) return 0f
        return (page - chapter.startPage).toFloat() / chapterPages
    }
    
    private suspend fun updateProgress(page: Int) {
        readingProgressRepository.updateProgress(
            bookId = bookId.toLong(),
            currentPage = page,
            currentChapter = _uiState.value.currentChapterIndex,
            progress = page.toFloat() / _uiState.value.totalPages
        )
    }
    
    private suspend fun updateBookmarkStatus(page: Int) {
        val bookmarks = bookmarkRepository.getBookmarks(bookId.toLong()).first()
        _uiState.update {
            it.copy(isCurrentPageBookmarked = bookmarks.any { bm -> bm.page == page })
        }
    }
    
    private fun parseColor(colorString: String): androidx.compose.ui.graphics.Color {
        return try {
            androidx.compose.ui.graphics.Color(android.graphics.Color.parseColor(colorString))
        } catch (e: Exception) {
            androidx.compose.ui.graphics.Color.Black
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        // Save final progress and close reader
        viewModelScope.launch {
            updateProgress(_uiState.value.currentPage)
            readerService.closeBook()
            ttsManager.stop()
        }
    }
}
