package com.universalmedialibrary.ui.media.viewmodels

import android.util.Log
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.BookRepository
import com.universalmedialibrary.data.repository.ComicRepository
import com.universalmedialibrary.data.repository.ReadingProgressRepository
import com.universalmedialibrary.data.repository.BookmarkRepository
import com.universalmedialibrary.data.repository.WebFictionRepository
import com.universalmedialibrary.data.local.entity.Bookmark
import com.universalmedialibrary.ui.media.player.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import javax.inject.Inject

private const val TAG = "ReaderViewModel"

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
                when (mediaType) {
                    "book" -> {
                        val itemId = mediaId.toLongOrNull()
                        if (itemId == null) {
                            _uiState.update { it.copy(title = "Invalid book ID", currentContent = ReaderContent(text = "Unable to parse book ID")) }
                            return@launch
                        }
                        loadBook(itemId)
                        loadProgress(itemId)
                        loadBookmarks(itemId)
                    }
                    "comic" -> {
                        val itemId = mediaId.toLongOrNull()
                        if (itemId == null) {
                            _uiState.update { it.copy(title = "Invalid comic ID", currentContent = ReaderContent(text = "Unable to parse comic ID")) }
                            return@launch
                        }
                        loadComic(itemId)
                        loadProgress(itemId)
                        loadBookmarks(itemId)
                    }
                    "webfiction", "fanfiction" -> {
                        loadWebFiction(mediaId)
                        // Web fiction uses string IDs, bookmarks need special handling
                    }
                    "document" -> {
                        val itemId = mediaId.toLongOrNull()
                        if (itemId == null) {
                            _uiState.update { it.copy(title = "Invalid document ID", currentContent = ReaderContent(text = "Unable to parse document ID")) }
                            return@launch
                        }
                        loadDocument(itemId)
                        loadProgress(itemId)
                        loadBookmarks(itemId)
                    }
                    else -> {
                        val itemId = mediaId.toLongOrNull()
                        if (itemId == null) {
                            _uiState.update { it.copy(title = "Invalid ID", currentContent = ReaderContent(text = "Unable to parse ID")) }
                            return@launch
                        }
                        loadBook(itemId)
                        loadProgress(itemId)
                        loadBookmarks(itemId)
                    }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error loading content", e)
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
        // Use direct ID lookup instead of loading all books
        val book = bookRepository.getBookById(itemId)
        
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
        } else {
            _uiState.update {
                it.copy(
                    title = "Book not found",
                    currentContent = ReaderContent(text = "The requested book could not be found in your library.")
                )
            }
        }
    }
    
    private suspend fun loadComic(itemId: Long) {
        // Use direct ID lookup instead of loading all comics
        val comic = comicRepository.getComicById(itemId)
        
        if (comic != null) {
            _uiState.update {
                it.copy(
                    title = comic.title,
                    author = comic.creator,
                    isComic = true,
                    totalPages = comic.pageCount ?: 50,
                    currentContent = ReaderContent(
                        text = "",
                        imageUrls = listOf() // TODO: Load actual comic pages from archive
                    ),
                    chapters = generateChaptersFromPageCount(comic.pageCount ?: 50)
                )
            }
        } else {
            _uiState.update {
                it.copy(
                    title = "Comic not found",
                    currentContent = ReaderContent(text = "The requested comic could not be found in your library.")
                )
            }
        }
    }
    
    private suspend fun loadWebFiction(storyId: String) {
        // Use direct ID lookup instead of loading all stories
        val story = webFictionRepository.getWebFictionById(storyId)
        
        if (story != null) {
            _uiState.update {
                it.copy(
                    title = story.title,
                    author = story.author,
                    isComic = false,
                    totalPages = story.chapterCount,
                    currentContent = ReaderContent(text = "Loading chapter content..."), // TODO: Load actual chapter content
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
        } else {
            _uiState.update {
                it.copy(
                    title = "Story not found",
                    currentContent = ReaderContent(text = "The requested web fiction could not be found.")
                )
            }
        }
    }
    
    private suspend fun loadDocument(itemId: Long) {
        // Load from book repository as documents use similar storage
        loadBook(itemId)
    }
    
    private suspend fun loadProgress(itemId: Long) {
        try {
            val progress = readingProgressRepository.getProgress(itemId).first()
            if (progress != null) {
                _uiState.update {
                    it.copy(
                        currentPage = progress.currentPage,
                        overallProgress = progress.percentage / 100f // Convert from percentage
                    )
                }
            }
        } catch (e: Exception) {
            Log.d(TAG, "Failed to load progress for item $itemId", e)
        }
    }
    
    private suspend fun loadBookmarks(itemId: Long) {
        try {
            val bookmarks = bookmarkRepository.getBookmarksForItem(itemId)
            val bookmarkInfos = bookmarks.map { bookmark ->
                BookmarkInfo(
                    id = bookmark.bookmarkId.toString(),
                    page = bookmark.page ?: 0,
                    chapter = bookmark.chapter ?: "",
                    excerpt = bookmark.description ?: "",
                    timestamp = bookmark.dateCreated
                )
            }
            _uiState.update {
                it.copy(
                    bookmarks = bookmarkInfos,
                    isCurrentPageBookmarked = bookmarkInfos.any { b -> b.page == it.currentPage }
                )
            }
        } catch (e: Exception) {
            Log.d(TAG, "Failed to load bookmarks for item $itemId", e)
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
            saveProgressInternal()
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
            val itemId = mediaId.toLongOrNull()
            
            // Skip bookmark operations for non-numeric IDs (web fiction)
            if (itemId == null) {
                Log.d(TAG, "Skipping bookmark toggle for non-numeric mediaId: $mediaId")
                return@launch
            }
            
            try {
                if (isBookmarked) {
                    // Remove bookmark - find it safely
                    val bookmark = _uiState.value.bookmarks.find { it.page == currentPage }
                    if (bookmark != null) {
                        val bookmarkId = bookmark.id.toLongOrNull()
                        if (bookmarkId != null) {
                            bookmarkRepository.deleteBookmark(bookmarkId)
                        } else {
                            Log.w(TAG, "Invalid bookmark ID: ${bookmark.id}, cannot delete")
                            return@launch
                        }
                    }
                    // Update UI state for deletion
                    _uiState.update { state ->
                        state.copy(
                            bookmarks = state.bookmarks.filter { it.page != currentPage },
                            isCurrentPageBookmarked = false
                        )
                    }
                } else {
                    // Add bookmark with correct Bookmark entity parameters
                    val newBookmark = Bookmark(
                        itemId = itemId,
                        page = currentPage,
                        chapter = _uiState.value.currentChapter?.title,
                        description = "Bookmarked page $currentPage",
                        dateCreated = System.currentTimeMillis()
                    )
                    bookmarkRepository.insertBookmark(newBookmark)
                    
                    // Reload bookmarks to get the actual database-assigned ID
                    // This ensures the UI has the correct ID for future deletion
                    loadBookmarks(itemId)
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error toggling bookmark", e)
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
    
    private suspend fun saveProgressInternal() {
        try {
            val itemId = mediaId.toLongOrNull() ?: return
            val state = _uiState.value
            
            // Compute percentage directly from currentPage/totalPages to avoid stale overallProgress
            val percentage = (state.currentPage.toFloat() / state.totalPages.coerceAtLeast(1)) * 100f
            
            readingProgressRepository.updateProgress(
                itemId = itemId,
                currentPage = state.currentPage,
                percentage = percentage,
                currentChapter = state.currentChapterIndex + 1
            )
        } catch (e: Exception) {
            Log.d(TAG, "Failed to save progress", e)
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        // Progress is saved on every page change in goToPage(), so no additional
        // save is needed here. Removing GlobalScope to avoid lifecycle-unsafe
        // operations that could outlive app components.
    }
}
