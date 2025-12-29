package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.BookRepository
import com.universalmedialibrary.data.repository.ComicRepository
import com.universalmedialibrary.data.repository.ReadingProgressRepository
import com.universalmedialibrary.data.repository.BookmarkRepository
import com.universalmedialibrary.data.repository.WebFictionRepository
import com.universalmedialibrary.ui.media.player.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Media-centric Reader Screen
 * 
 * Handles reading for:
 * - EPUB, PDF, FB2, MOBI (books)
 * - Comics (CBZ/CBR)
 * - Documents (DOCX, ODT, RTF)
 * - Web Fiction
 * 
 * Properly integrated with actual repositories.
 */
@HiltViewModel
class ReaderViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle,
    private val bookRepository: BookRepository,
    private val comicRepository: ComicRepository,
    private val readingProgressRepository: ReadingProgressRepository,
    private val bookmarkRepository: BookmarkRepository,
    private val webFictionRepository: WebFictionRepository
) : ViewModel() {
    
    private val mediaId: String = savedStateHandle.get<String>("mediaId") ?: ""
    private val mediaType: String = savedStateHandle.get<String>("mediaType") ?: "book"
    
    private val _uiState = MutableStateFlow(ReaderState(
        title = "Loading...",
        author = null,
        currentContent = ReaderContent(text = "Loading content..."),
        currentPage = 1,
        totalPages = 1,
        chapters = emptyList(),
        currentChapterIndex = 0
    ))
    val uiState: StateFlow<ReaderState> = _uiState.asStateFlow()
    
    init {
        loadContent()
    }
    
    private fun loadContent() {
        viewModelScope.launch {
            try {
                val itemId = mediaId.toLongOrNull() ?: return@launch
                
                when (mediaType) {
                    "book" -> loadBook(itemId)
                    "comic" -> loadComic(itemId)
                    "webfiction", "fanfiction" -> loadWebFiction(mediaId)
                    "document" -> loadDocument(itemId)
                    else -> loadBook(itemId)
                }
                
                // Load reading progress
                loadProgress(itemId)
                
                // Load bookmarks
                loadBookmarks(itemId)
                
            } catch (e: Exception) {
                _uiState.update {
                    it.copy(
                        title = "Error loading content",
                        currentContent = ReaderContent(text = "Unable to load: ${e.message}")
                    )
                }
            }
        }
    }
    
    private suspend fun loadBook(itemId: Long) {
        val books = bookRepository.getAllBooks().first()
        val book = books.find { it.itemId == itemId }
        
        if (book != null) {
            _uiState.update {
                it.copy(
                    title = book.title,
                    author = book.creator,
                    isComic = false,
                    totalPages = book.pageCount ?: 100,
                    currentContent = ReaderContent(
                        text = "Content loaded from: ${book.filePath}",
                        htmlContent = null
                    ),
                    chapters = generateChaptersFromPageCount(book.pageCount ?: 100)
                )
            }
        }
    }
    
    private suspend fun loadComic(itemId: Long) {
        val comics = comicRepository.getAllComics().first()
        val comic = comics.find { it.itemId == itemId }
        
        if (comic != null) {
            _uiState.update {
                it.copy(
                    title = comic.title,
                    author = comic.creator,
                    isComic = true,
                    totalPages = comic.pageCount ?: 50,
                    currentContent = ReaderContent(
                        text = "",
                        imageUrls = listOf() // Would load actual comic pages
                    ),
                    chapters = generateChaptersFromPageCount(comic.pageCount ?: 50)
                )
            }
        }
    }
    
    private suspend fun loadWebFiction(storyId: String) {
        val stories = webFictionRepository.getAllWebFiction().first()
        val story = stories.find { it.id == storyId }
        
        if (story != null) {
            _uiState.update {
                it.copy(
                    title = story.title,
                    author = story.author,
                    isComic = false,
                    totalPages = story.chapterCount,
                    currentContent = ReaderContent(text = "Loading chapter content..."),
                    chapters = (1..story.chapterCount).map { index ->
                        ChapterInfo(
                            id = "chapter_$index",
                            title = "Chapter $index",
                            startPage = index,
                            endPage = index,
                            progress = 0f
                        )
                    }
                )
            }
        }
    }
    
    private suspend fun loadDocument(itemId: Long) {
        // Load from generic media repository
        loadBook(itemId) // Fallback to book loading for now
    }
    
    private suspend fun loadProgress(itemId: Long) {
        try {
            val progress = readingProgressRepository.getProgress(itemId).first()
            if (progress != null) {
                _uiState.update {
                    it.copy(
                        currentPage = progress.currentPage ?: 1,
                        overallProgress = progress.percentage / 100f // Convert from percentage
                    )
                }
            }
        } catch (e: Exception) {
            // Ignore progress loading errors
        }
    }
    
    private suspend fun loadBookmarks(itemId: Long) {
        try {
            val bookmarks = bookmarkRepository.getBookmarksForItem(itemId)
            val bookmarkInfos = bookmarks.map { bookmark ->
                BookmarkInfo(
                    id = bookmark.bookmarkId.toString(),
                    page = bookmark.pageNumber ?: 0,
                    chapter = "",
                    excerpt = bookmark.note ?: "",
                    timestamp = bookmark.createdAt
                )
            }
            _uiState.update {
                it.copy(
                    bookmarks = bookmarkInfos,
                    isCurrentPageBookmarked = bookmarkInfos.any { b -> b.page == it.currentPage }
                )
            }
        } catch (e: Exception) {
            // Ignore bookmark loading errors
        }
    }
    
    private fun generateChaptersFromPageCount(pageCount: Int): List<ChapterInfo> {
        val chapterCount = (pageCount / 20).coerceAtLeast(1).coerceAtMost(50)
        val pagesPerChapter = pageCount / chapterCount
        
        return (1..chapterCount).map { index ->
            ChapterInfo(
                id = "chapter_$index",
                title = "Chapter $index",
                startPage = (index - 1) * pagesPerChapter + 1,
                endPage = if (index == chapterCount) pageCount else index * pagesPerChapter,
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
            
            // Save progress
            saveProgress()
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
            val itemId = mediaId.toLongOrNull() ?: return@launch
            
            if (isBookmarked) {
                // Remove bookmark
                val bookmark = _uiState.value.bookmarks.find { it.page == currentPage }
                bookmark?.let {
                    bookmarkRepository.deleteBookmark(it.id.toLongOrNull() ?: 0L)
                }
            } else {
                // Add bookmark
                val newBookmark = com.universalmedialibrary.data.local.entity.Bookmark(
                    mediaItemId = itemId,
                    pageNumber = currentPage,
                    note = "Bookmarked page $currentPage",
                    createdAt = System.currentTimeMillis()
                )
                bookmarkRepository.insertBookmark(newBookmark)
            }
            
            _uiState.update { state ->
                val newBookmarks = if (isBookmarked) {
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
                    bookmarks = newBookmarks,
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
    
    private fun saveProgress() {
        viewModelScope.launch {
            try {
                val itemId = mediaId.toLongOrNull() ?: return@launch
                val state = _uiState.value
                
                readingProgressRepository.updateProgress(
                    itemId = itemId,
                    currentPage = state.currentPage,
                    percentage = state.overallProgress * 100f, // Convert to percentage
                    currentChapter = state.currentChapterIndex + 1
                )
            } catch (e: Exception) {
                // Ignore progress saving errors
            }
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        // Save final progress when leaving
        viewModelScope.launch {
            saveProgress()
        }
    }
}
