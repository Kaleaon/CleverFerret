package com.universalmedialibrary.ui.media.viewmodels

import android.content.Context
import android.net.Uri
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
import com.universalmedialibrary.services.reader.UnifiedReaderService
import com.universalmedialibrary.services.reader.ReaderType
import com.universalmedialibrary.services.reader.ComicReaderEngine
import com.universalmedialibrary.services.reader.core.BookSource
import com.universalmedialibrary.services.webfiction.WebFictionService
import com.universalmedialibrary.services.epub.EpubChapter
import com.universalmedialibrary.services.epub.EpubReaderService
import com.universalmedialibrary.ui.media.player.*
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import java.io.File
import org.jsoup.Jsoup
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
    @ApplicationContext private val context: Context,
    private val bookRepository: BookRepository,
    private val comicRepository: ComicRepository,
    private val readingProgressRepository: ReadingProgressRepository,
    private val bookmarkRepository: BookmarkRepository,
    private val webFictionRepository: WebFictionRepository,
    private val unifiedReaderService: UnifiedReaderService,
    private val epubReaderService: EpubReaderService,
    private val comicReaderEngine: ComicReaderEngine,
    private val webFictionService: WebFictionService
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

    private var chapterContents: List<ReaderContent> = emptyList()
    private var textPages: List<ReaderContent> = emptyList()
    
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
            // First update UI with metadata
            _uiState.update {
                it.copy(
                    title = book.title,
                    author = book.creator,
                    isComic = false,
                    totalPages = 1 // Will be updated when content is loaded
                )
            }
            
            // Load actual content from the file using UnifiedReaderService
            try {
                chapterContents = emptyList()
                textPages = emptyList()
                val readerType = unifiedReaderService.openPublication(book.filePath)
                
                when (readerType) {
                    is ReaderType.Epub -> {
                        // Extract TOC and content from EPUB
                        val epubLoaded = epubReaderService.loadEPUB(File(book.filePath))
                        if (!epubLoaded) {
                            _uiState.update {
                                it.copy(
                                    currentContent = ReaderContent(text = "Failed to load EPUB content."),
                                    chapters = emptyList()
                                )
                            }
                            return
                        }
                        val epubState = epubReaderService.readerState.value
                        val fallbackToc = readerType.service.extractToc(book.filePath)
                        val chapterList = epubState.chapters.ifEmpty {
                            fallbackToc.mapIndexed { index, item ->
                                EpubChapter(
                                    index = index,
                                    title = item.title,
                                    content = "",
                                    resourceId = "toc_$index"
                                )
                            }
                        }

                        chapterContents = chapterList.map { chapter ->
                            val html = chapter.content
                            val text = if (html.isNotBlank()) Jsoup.parse(html).text().trim() else chapter.title
                            ReaderContent(text = text, htmlContent = html.ifBlank { null })
                        }

                        val chapters = chapterList.mapIndexed { index, item ->
                            ChapterInfo(
                                id = "chapter_$index",
                                title = item.title,
                                startPage = index + 1,
                                endPage = index + 1,
                                progress = 0f
                            )
                        }.ifEmpty { generateChaptersFromPageCount(10) }

                        val initialContent = chapterContents.firstOrNull()
                            ?: ReaderContent(text = epubState.currentContent.ifBlank { "No EPUB content found." })

                        _uiState.update {
                            it.copy(
                                totalPages = chapters.size.coerceAtLeast(1),
                                currentContent = initialContent,
                                chapters = chapters,
                                degradedParseWarning = null
                            )
                        }
                    }
                    is ReaderType.Pdf -> {
                        val pageCount = readerType.metadata.numberOfPages
                        _uiState.update {
                            it.copy(
                                totalPages = pageCount.coerceAtLeast(1),
                                currentContent = ReaderContent(
                                    text = "PDF loaded: ${readerType.metadata.title}",
                                    htmlContent = null
                                ),
                                chapters = generateChaptersFromPageCount(pageCount),
                                degradedParseWarning = null
                            )
                        }
                    }
                    is ReaderType.Text -> {
                        val content = readerType.content
                        val isHtml = content.contains("<html", ignoreCase = true) || content.contains("<body", ignoreCase = true)
                        textPages = if (isHtml) {
                            listOf(
                                ReaderContent(
                                    text = Jsoup.parse(content).text().trim(),
                                    htmlContent = content
                                )
                            )
                        } else {
                            paginateText(content).map { page -> ReaderContent(text = page) }
                        }
                        val estimatedPages = if (readerType.progressUnitCount > 0) {
                            readerType.progressUnitCount
                        } else {
                            textPages.size
                        }.coerceAtLeast(1)
                        val chapterList = if (readerType.chapterTitles.isNotEmpty()) {
                            readerType.chapterTitles.mapIndexed { index, title ->
                                ChapterInfo(
                                    id = "chapter_$index",
                                    title = title.ifBlank { "Chapter ${index + 1}" },
                                    startPage = (index + 1).coerceAtMost(estimatedPages),
                                    endPage = (index + 1).coerceAtMost(estimatedPages),
                                    progress = 0f
                                )
                            }
                        } else {
                            generateChaptersFromPageCount(estimatedPages)
                        }
                        _uiState.update {
                            it.copy(
                                totalPages = estimatedPages,
                                currentContent = textPages.firstOrNull() ?: ReaderContent(text = content),
                                chapters = chapterList,
                                degradedParseWarning = readerType.warnings.firstOrNull {
                                    it.isNotBlank() && readerType.parserConfidence < 0.75f
                                }
                            )
                        }
                    }
                    is ReaderType.Error -> {
                        _uiState.update {
                            it.copy(
                                currentContent = ReaderContent(text = "Error loading book: ${readerType.message}"),
                                chapters = emptyList()
                            )
                        }
                    }
                    else -> {
                        // Fallback for other reader types
                        _uiState.update {
                            it.copy(
                                totalPages = 10, // Default fallback
                                currentContent = ReaderContent(text = "Content loaded from: ${book.filePath}"),
                                chapters = generateChaptersFromPageCount(10)
                            )
                        }
                    }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error loading book content", e)
                _uiState.update {
                    it.copy(
                        totalPages = 10,
                        currentContent = ReaderContent(text = "Error loading content: ${e.message}"),
                        chapters = generateChaptersFromPageCount(10)
                    )
                }
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
            // First update UI with metadata
            _uiState.update {
                it.copy(
                    title = comic.title,
                    author = comic.creator,
                    isComic = true
                )
            }
            
            // Load actual pages from the comic archive using ComicReaderEngine
            try {
                val file = File(comic.filePath)
                if (!file.exists()) {
                    _uiState.update {
                        it.copy(
                            currentContent = ReaderContent(text = "Comic file not found: ${comic.filePath}"),
                            totalPages = 0,
                            chapters = emptyList()
                        )
                    }
                    return
                }
                
                // Open the comic archive
                val bookSource = BookSource.File(Uri.fromFile(file))
                val result = comicReaderEngine.open(context, bookSource)
                
                result.fold(
                    onSuccess = {
                        // Get all pages from the archive
                        val pages = comicReaderEngine.getAllPages()
                        val pageCount = pages.size
                        
                        // Create list of page paths/entries for the UI
                        // The imageUrls list contains the entry names within the archive
                        val imageUrls = pages.map { page -> 
                            "${comic.filePath}#${page.entryName}" 
                        }
                        
                        _uiState.update {
                            it.copy(
                                totalPages = pageCount.coerceAtLeast(1),
                                currentContent = ReaderContent(
                                    text = "",
                                    imageUrls = imageUrls
                                ),
                                chapters = generateChaptersFromPageCount(pageCount)
                            )
                        }
                    },
                    onFailure = { error ->
                        Log.e(TAG, "Error opening comic archive", error)
                        _uiState.update {
                            it.copy(
                                currentContent = ReaderContent(text = "Error loading comic: ${error.message}"),
                                totalPages = 0,
                                chapters = emptyList()
                            )
                        }
                    }
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error loading comic content", e)
                _uiState.update {
                    it.copy(
                        currentContent = ReaderContent(text = "Error loading comic: ${e.message}"),
                        totalPages = 0,
                        chapters = emptyList()
                    )
                }
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
            // First update UI with metadata
            _uiState.update {
                it.copy(
                    title = story.title,
                    author = story.author,
                    isComic = false,
                    totalPages = story.chapterCount,
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
            
            // Try to load content from cached EPUB first, then from source
            try {
                val content = loadWebFictionContent(story)
                _uiState.update {
                    it.copy(
                        currentContent = ReaderContent(
                            text = content.text,
                            htmlContent = content.htmlContent
                        )
                    )
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error loading web fiction content", e)
                _uiState.update {
                    it.copy(
                        currentContent = ReaderContent(text = "Error loading content: ${e.message}")
                    )
                }
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
    
    /**
     * Loads web fiction content from cached EPUB or fetches from source
     */
    private suspend fun loadWebFictionContent(
        story: com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
    ): ReaderContent {
        // First try to load from cached EPUB if available
        val epubPath = story.epubPath
        if (!epubPath.isNullOrEmpty()) {
            val epubFile = File(epubPath)
            if (epubFile.exists()) {
                try {
                    val readerType = unifiedReaderService.openPublication(epubPath)
                    if (readerType is ReaderType.Text) {
                        return ReaderContent(
                            text = readerType.content,
                            htmlContent = if (readerType.content.contains("<")) readerType.content else null
                        )
                    } else if (readerType is ReaderType.Epub) {
                        return ReaderContent(
                            text = "EPUB loaded from cache",
                            htmlContent = null
                        )
                    }
                } catch (e: Exception) {
                    Log.w(TAG, "Failed to load cached EPUB, will fetch from source", e)
                }
            }
        }
        
        // Fetch chapter content from the source URL
        try {
            // Create a WebFictionStory model for the service
            val webFictionStory = com.universalmedialibrary.services.webfiction.WebFictionStory(
                id = story.id,
                url = story.sourceUrl,
                title = story.title,
                author = story.author,
                description = story.summary,
                status = parseStoryStatus(story.status),
                genre = null,
                fandom = story.fandoms.firstOrNull(),
                language = story.language,
                wordCount = story.wordCount.toLong(),
                chapterCount = story.chapterCount,
                lastUpdated = story.updateDate,
                rating = story.rating,
                tags = story.tags,
                site = story.sourceSite,
                totalChapters = story.chapterCount
            )
            
            // Download chapters from source
            val chapters = webFictionService.downloadAllChapters(webFictionStory)
            
            if (chapters.isNotEmpty()) {
                // Return the first chapter's content
                val firstChapter = chapters.first()
                val isHtml = firstChapter.content.contains("<")
                return ReaderContent(
                    text = if (isHtml) "" else firstChapter.content,
                    htmlContent = if (isHtml) firstChapter.content else null
                )
            } else {
                return ReaderContent(text = "No chapters available. Check your internet connection or the story source.")
            }
        } catch (e: com.universalmedialibrary.services.ContentPinRequiredException) {
            return ReaderContent(text = "PIN required to access this content. Please verify your identity.")
        } catch (e: com.universalmedialibrary.services.DownloadBlockedException) {
            return ReaderContent(text = "Access blocked: ${e.message}")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to fetch chapters from source", e)
            return ReaderContent(text = "Unable to load chapter content. Please check your internet connection.")
        }
    }
    
    private fun parseStoryStatus(status: String): com.universalmedialibrary.services.webfiction.StoryStatus {
        return when (status.uppercase()) {
            "COMPLETE", "COMPLETED" -> com.universalmedialibrary.services.webfiction.StoryStatus.COMPLETED
            "IN_PROGRESS", "ONGOING" -> com.universalmedialibrary.services.webfiction.StoryStatus.ONGOING
            "HIATUS" -> com.universalmedialibrary.services.webfiction.StoryStatus.HIATUS
            "CANCELLED", "ABANDONED" -> com.universalmedialibrary.services.webfiction.StoryStatus.CANCELLED
            else -> com.universalmedialibrary.services.webfiction.StoryStatus.UNKNOWN
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
            Log.w(TAG, "Failed to load progress for item $itemId", e)
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
            Log.w(TAG, "Failed to load bookmarks for item $itemId", e)
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

                val updatedContent = when {
                    chapterContents.isNotEmpty() -> chapterContents.getOrNull(page - 1) ?: state.currentContent
                    textPages.isNotEmpty() -> textPages.getOrNull(page - 1) ?: state.currentContent
                    else -> state.currentContent
                }
                
                state.copy(
                    currentPage = page,
                    currentChapterIndex = newChapterIndex,
                    currentChapter = state.chapters.getOrNull(newChapterIndex),
                    currentContent = updatedContent,
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

    private fun paginateText(content: String, wordsPerPage: Int = 300): List<String> {
        val words = content.split("\\s+".toRegex()).filter { it.isNotBlank() }
        if (words.isEmpty()) return listOf("")
        val pages = mutableListOf<String>()
        for (i in words.indices step wordsPerPage) {
            val endIndex = (i + wordsPerPage).coerceAtMost(words.size)
            pages.add(words.subList(i, endIndex).joinToString(" "))
        }
        return pages
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
            Log.w(TAG, "Failed to save progress", e)
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        // Progress is saved on every page change in goToPage(), so no additional
        // save is needed here. Removing GlobalScope to avoid lifecycle-unsafe
        // operations that could outlive app components.
    }
}
