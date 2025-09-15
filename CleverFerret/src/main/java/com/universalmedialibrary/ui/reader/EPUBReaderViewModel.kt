package com.universalmedialibrary.ui.reader

import android.content.Context
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.BookmarkService
import com.universalmedialibrary.services.epub.EPUBReaderService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for EPUB Reader
 */
@HiltViewModel
class EPUBReaderViewModel @Inject constructor(
    private val epubReaderService: EPUBReaderService,
    private val bookmarkService: BookmarkService
) : ViewModel() {
    
    private val _readerState = MutableStateFlow(ReaderState())
    val readerState: StateFlow<ReaderState> = _readerState.asStateFlow()
    
    private val _uiSettings = MutableStateFlow(ReaderSettings())
    val uiSettings: StateFlow<ReaderSettings> = _uiSettings.asStateFlow()
    
    private val _searchResults = MutableStateFlow<List<EPUBReaderService.SearchResult>>(emptyList())
    val searchResults: StateFlow<List<EPUBReaderService.SearchResult>> = _searchResults.asStateFlow()
    
    private var currentMediaItemId: Long? = null
    
    data class ReaderState(
        val isLoaded: Boolean = false,
        val currentChapter: Int = 0,
        val totalChapters: Int = 0,
        val bookTitle: String = "",
        val bookAuthor: String = "",
        val chapters: List<EPUBReaderService.Chapter> = emptyList(),
        val currentContent: String = "",
        val error: String? = null,
        val isBookmarked: Boolean = false,
        val readingProgress: Float = 0f
    )
    
    /**
     * Load EPUB file
     */
    fun loadEPUB(context: Context, uri: Uri) {
        viewModelScope.launch {
            try {
                _readerState.value = _readerState.value.copy(error = null)
                
                val success = epubReaderService.loadEPUB(uri)
                if (success) {
                    // Subscribe to reader state changes
                    epubReaderService.readerState.collect { epubState ->
                        _readerState.value = ReaderState(
                            isLoaded = epubState.isLoaded,
                            currentChapter = epubState.currentChapter,
                            totalChapters = epubState.totalChapters,
                            bookTitle = epubState.bookTitle,
                            bookAuthor = epubState.bookAuthor,
                            chapters = epubState.chapters,
                            currentContent = formatChapterContent(epubState.currentContent),
                            error = epubState.error,
                            isBookmarked = checkIfBookmarked(),
                            readingProgress = calculateProgress(epubState.currentChapter, epubState.totalChapters)
                        )
                        
                        // Save reading progress
                        saveReadingProgress()
                    }
                } else {
                    _readerState.value = _readerState.value.copy(
                        error = "Failed to load EPUB file"
                    )
                }
            } catch (e: Exception) {
                _readerState.value = _readerState.value.copy(
                    error = "Error loading EPUB: ${e.message}"
                )
            }
        }
    }
    
    /**
     * Navigate to specific chapter
     */
    fun goToChapter(chapterIndex: Int) {
        epubReaderService.goToChapter(chapterIndex)
        saveReadingProgress()
    }
    
    /**
     * Go to next chapter
     */
    fun nextChapter() {
        epubReaderService.nextChapter()
        saveReadingProgress()
    }
    
    /**
     * Go to previous chapter
     */
    fun previousChapter() {
        epubReaderService.previousChapter()
        saveReadingProgress()
    }
    
    /**
     * Search within the book
     */
    suspend fun searchInBook(query: String) {
        viewModelScope.launch {
            val results = epubReaderService.searchInBook(query)
            _searchResults.value = results
        }
    }
    
    /**
     * Toggle bookmark for current position
     */
    fun toggleBookmark() {
        viewModelScope.launch {
            currentMediaItemId?.let { itemId ->
                val state = _readerState.value
                if (state.isBookmarked) {
                    // Remove bookmark
                    val bookmarks = bookmarkService.getBookmarks(itemId)
                    bookmarks.find { 
                        it.position.contains("chapter:${state.currentChapter}") 
                    }?.let {
                        bookmarkService.deleteBookmark(it.id)
                    }
                } else {
                    // Add bookmark
                    bookmarkService.saveBookmark(
                        BookmarkService.Bookmark(
                            mediaItemId = itemId,
                            position = """{"chapter":${state.currentChapter},"title":"${state.chapters.getOrNull(state.currentChapter)?.title}"}""",
                            note = "Chapter ${state.currentChapter + 1}: ${state.chapters.getOrNull(state.currentChapter)?.title}",
                            type = BookmarkService.BookmarkType.MANUAL
                        )
                    )
                }
                _readerState.value = state.copy(isBookmarked = !state.isBookmarked)
            }
        }
    }
    
    /**
     * Update reader settings
     */
    fun updateSettings(settings: ReaderSettings) {
        _uiSettings.value = settings
        // Save settings to preferences
        saveSettings(settings)
    }
    
    /**
     * Set media item ID for tracking
     */
    fun setMediaItemId(itemId: Long) {
        currentMediaItemId = itemId
        loadReadingProgress(itemId)
    }
    
    private fun formatChapterContent(content: String): String {
        // Convert plain text to HTML if needed
        return if (content.startsWith("<") && content.contains("</")) {
            // Already HTML
            content
        } else {
            // Convert plain text to HTML paragraphs
            content.split("\n\n")
                .filter { it.isNotBlank() }
                .joinToString("") { "<p>$it</p>" }
        }
    }
    
    private fun calculateProgress(currentChapter: Int, totalChapters: Int): Float {
        return if (totalChapters > 0) {
            (currentChapter + 1).toFloat() / totalChapters
        } else {
            0f
        }
    }
    
    private fun checkIfBookmarked(): Boolean {
        // Check if current position is bookmarked
        return false // Implementation pending
    }
    
    private fun saveReadingProgress() {
        viewModelScope.launch {
            currentMediaItemId?.let { itemId ->
                val state = _readerState.value
                bookmarkService.updateReadingProgress(
                    BookmarkService.ReadingProgress(
                        mediaItemId = itemId,
                        currentPosition = """{"chapter":${state.currentChapter},"total":${state.totalChapters}}""",
                        percentComplete = state.readingProgress * 100,
                        pagesRead = state.currentChapter + 1,
                        totalPages = state.totalChapters
                    )
                )
            }
        }
    }
    
    private fun loadReadingProgress(itemId: Long) {
        viewModelScope.launch {
            val progress = bookmarkService.getReadingProgress(itemId)
            progress?.let {
                // Parse position and restore
                try {
                    val position = it.currentPosition
                    if (position.contains("chapter")) {
                        val chapter = position.substringAfter("chapter\":").substringBefore(",").toInt()
                        goToChapter(chapter)
                    }
                } catch (e: Exception) {
                    // Ignore parsing errors
                }
            }
        }
    }
    
    private fun saveSettings(settings: ReaderSettings) {
        // Save to SharedPreferences or DataStore
        // Implementation can be added later
    }
    
    override fun onCleared() {
        super.onCleared()
        epubReaderService.clearBook()
    }
}