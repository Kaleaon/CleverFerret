package com.universalmedialibrary.ui.reader

import android.content.Context
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.reader.components.Bookmark
import com.universalmedialibrary.ui.reader.components.SearchResult
import com.universalmedialibrary.ui.reader.components.TableOfContentsItem
import com.universalmedialibrary.ui.viewer.MediaViewerManager
import com.universalmedialibrary.ui.viewer.common.ViewerSettings
import dagger.hilt.android.lifecycle.HiltViewModel
import com.universalmedialibrary.data.repository.ReadingProgressRepository
import com.universalmedialibrary.data.local.dao.MediaItemDao
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.withContext
import java.io.BufferedReader
import java.io.InputStreamReader
import java.util.*
import javax.inject.Inject

@HiltViewModel
class AdvancedDocumentReaderViewModel @Inject constructor(
    private val mediaViewerManager: MediaViewerManager,
    private val mediaItemDao: MediaItemDao,
    private val readingProgressRepository: ReadingProgressRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(AdvancedDocumentReaderUiState())
    val uiState: StateFlow<AdvancedDocumentReaderUiState> = _uiState.asStateFlow()

    private var documentContent: String = ""
    private var documentPages: List<String> = emptyList()
    private var sessionStartTime: Long = 0L
    private var readingStartTime: Long = 0L
    private var wordsRead: Int = 0

    private var currentItemId: Long? = null
    private var progressJob: Job? = null
    private var lastSavedPercent: Float = -1f

    fun loadDocument(context: Context, documentUri: Uri) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(
                    isLoading = true,
                    error = null
                )

                val mediaInfo = mediaViewerManager.analyzeMedia(context, documentUri)

                // Resolve MediaItem for progress tracking (best-effort by path)
                currentItemId = try {
                    mediaItemDao.getMediaItemByFilePath(documentUri.toString())?.itemId
                        ?: mediaItemDao.getItemByPath(documentUri.toString())?.itemId
                } catch (_: Exception) { null }

                when (mediaInfo.documentFormat) {
                    MediaViewerManager.DocumentFormat.PDF -> {
                        loadPDFDocument(context, documentUri)
                    }
                    MediaViewerManager.DocumentFormat.EPUB -> {
                        loadEPUBDocument(context, documentUri)
                    }
                    MediaViewerManager.DocumentFormat.TXT -> {
                        loadTextDocument(context, documentUri)
                    }
                    MediaViewerManager.DocumentFormat.HTML -> {
                        loadHTMLDocument(context, documentUri)
                    }
                    else -> {
                        // Fallback to text loading
                        loadTextDocument(context, documentUri)
                    }
                }

                // Initialize reading session
                sessionStartTime = System.currentTimeMillis()
                readingStartTime = sessionStartTime
                startReadingTimer()

            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load document: ${e.message}"
                )
            }
        }
    }

    private suspend fun loadPDFDocument(context: Context, documentUri: Uri) {
        withContext(Dispatchers.IO) {
            try {
                // For PDF documents, we'll rely on the PDFView component
                // but we still need to set up the basic state
                val fileName = documentUri.lastPathSegment ?: "Unknown Document"

                _uiState.value = _uiState.value.copy(
                    isLoaded = true,
                    isLoading = false,
                    title = fileName,
                    documentType = MediaViewerManager.DocumentFormat.PDF,
                    totalPages = 1, // Will be updated by PDFView
                    currentPage = 1
                )
            } catch (e: Exception) {
                throw e
            }
        }
    }

    private suspend fun loadEPUBDocument(context: Context, documentUri: Uri) {
        withContext(Dispatchers.IO) {
            try {
                // For EPUB, we would typically parse the EPUB structure
                // For now, we'll treat it as HTML content
                val inputStream = context.contentResolver.openInputStream(documentUri)
                val content = inputStream?.bufferedReader()?.use { it.readText() } ?: ""

                documentContent = content
                documentPages = paginateContent(content)

                val fileName = documentUri.lastPathSegment ?: "Unknown EPUB"
                val tableOfContents = extractTableOfContents(content)

                _uiState.value = _uiState.value.copy(
                    isLoaded = true,
                    isLoading = false,
                    title = fileName,
                    content = if (documentPages.isNotEmpty()) documentPages[0] else content,
                    documentType = MediaViewerManager.DocumentFormat.EPUB,
                    totalPages = documentPages.size.coerceAtLeast(1),
                    currentPage = 1,
                    tableOfContents = tableOfContents
                )
            } catch (e: Exception) {
                throw e
            }
        }
    }

    private suspend fun loadTextDocument(context: Context, documentUri: Uri) {
        withContext(Dispatchers.IO) {
            try {
                val inputStream = context.contentResolver.openInputStream(documentUri)
                val content = inputStream?.bufferedReader()?.use { it.readText() } ?: ""

                documentContent = content
                documentPages = paginateContent(content)

                val fileName = documentUri.lastPathSegment ?: "Unknown Document"
                val tableOfContents = extractTableOfContents(content)

                _uiState.value = _uiState.value.copy(
                    isLoaded = true,
                    isLoading = false,
                    title = fileName,
                    content = if (documentPages.isNotEmpty()) documentPages[0] else content,
                    documentType = MediaViewerManager.DocumentFormat.TXT,
                    totalPages = documentPages.size.coerceAtLeast(1),
                    currentPage = 1,
                    tableOfContents = tableOfContents
                )
            } catch (e: Exception) {
                throw e
            }
        }
    }

    private suspend fun loadHTMLDocument(context: Context, documentUri: Uri) {
        withContext(Dispatchers.IO) {
            try {
                val inputStream = context.contentResolver.openInputStream(documentUri)
                val content = inputStream?.bufferedReader()?.use { it.readText() } ?: ""

                // Strip HTML tags for reading
                val plainText = content.replace(Regex("<[^>]*>"), "")
                    .replace("&nbsp;", " ")
                    .replace("&", "&")
                    .replace("<", "<")
                    .replace(">", ">")
                    .trim()

                documentContent = plainText
                documentPages = paginateContent(plainText)

                val fileName = documentUri.lastPathSegment ?: "Unknown HTML"
                val tableOfContents = extractTableOfContents(plainText)

                _uiState.value = _uiState.value.copy(
                    isLoaded = true,
                    isLoading = false,
                    title = fileName,
                    content = if (documentPages.isNotEmpty()) documentPages[0] else plainText,
                    documentType = MediaViewerManager.DocumentFormat.HTML,
                    totalPages = documentPages.size.coerceAtLeast(1),
                    currentPage = 1,
                    tableOfContents = tableOfContents
                )
            } catch (e: Exception) {
                throw e
            }
        }
    }

    private fun paginateContent(content: String, wordsPerPage: Int = 300): List<String> {
        val words = content.split("\\s+".toRegex())
        val pages = mutableListOf<String>()

        for (i in words.indices step wordsPerPage) {
            val endIndex = (i + wordsPerPage).coerceAtMost(words.size)
            val page = words.subList(i, endIndex).joinToString(" ")
            pages.add(page)
        }

        return pages
    }

    private fun extractTableOfContents(content: String): List<TableOfContentsItem> {
        val chapters = mutableListOf<TableOfContentsItem>()
        val lines = content.split("\n")

        // Simple heuristic: look for lines that might be chapter titles
        // (lines that are shorter than average and might start with numbers or "Chapter")
        val averageLineLength = lines.map { it.length }.average()

        lines.forEachIndexed { index, line ->
            val trimmedLine = line.trim()
            if (trimmedLine.isNotEmpty() &&
                (trimmedLine.length < averageLineLength * 0.7) &&
                (trimmedLine.matches(Regex("^(Chapter|CHAPTER).*")) ||
                 trimmedLine.matches(Regex("^\\d+\\..*")) ||
                 trimmedLine.matches(Regex("^[A-Z][A-Z\\s]{10,}$")))) {

                val pageNumber = (index * documentPages.size / lines.size).coerceAtLeast(1)

                chapters.add(
                    TableOfContentsItem(
                        id = UUID.randomUUID().toString(),
                        title = trimmedLine.take(50),
                        page = pageNumber,
                        level = 0
                    )
                )
            }
        }

        return chapters
    }

    fun setCurrentPage(page: Int) {
        val clampedPage = page.coerceIn(1, _uiState.value.totalPages)

        if (clampedPage != _uiState.value.currentPage) {
            updateWordsRead(clampedPage)

            val content = if (documentPages.isNotEmpty() && clampedPage <= documentPages.size) {
                documentPages[clampedPage - 1]
            } else {
                documentContent
            }

            val progress = clampedPage.toFloat() / _uiState.value.totalPages.toFloat()

            _uiState.value = _uiState.value.copy(
                currentPage = clampedPage,
                content = content,
                readingProgress = progress,
                currentChapter = findCurrentChapter(clampedPage)
            )

            // Debounced progress persistence (≥1% change or after 500ms)
            val itemId = currentItemId
            if (itemId != null && _uiState.value.totalPages > 0) {
                val percent = (clampedPage.toFloat() / _uiState.value.totalPages.toFloat()) * 100f
                if (lastSavedPercent < 0f || kotlin.math.abs(percent - lastSavedPercent) >= 1f) {
                    progressJob?.cancel()
                    progressJob = viewModelScope.launch {
                        delay(500)
                        try {
                            readingProgressRepository.updateProgress(
                                itemId = itemId,
                                currentPage = clampedPage,
                                percentage = percent
                            )
                            lastSavedPercent = percent
                        } catch (_: Exception) { /* ignore persistence errors for now */ }
                    }
                }
            }

            // Auto-bookmark if enabled
            if (_uiState.value.settings.autoBookmarks) {
                addAutoBookmark(clampedPage)
            }
        }
    }

    fun nextPage() {
        val nextPage = _uiState.value.currentPage + 1
        if (nextPage <= _uiState.value.totalPages) {
            setCurrentPage(nextPage)
        }
    }

    fun previousPage() {
        val prevPage = _uiState.value.currentPage - 1
        if (prevPage >= 1) {
            setCurrentPage(prevPage)
        }
    }

    fun searchInDocument(query: String) {
        if (query.isEmpty()) {
            _uiState.value = _uiState.value.copy(
                searchQuery = "",
                searchResults = emptyList(),
                currentSearchIndex = -1
            )
            return
        }

        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val results = mutableListOf<SearchResult>()
                val searchRegex = Regex(query, RegexOption.IGNORE_CASE)

                documentPages.forEachIndexed { pageIndex, pageContent ->
                    val matches = searchRegex.findAll(pageContent)
                    matches.forEach { match ->
                        val contextStart = (match.range.first - 50).coerceAtLeast(0)
                        val contextEnd = (match.range.last + 50).coerceAtMost(pageContent.length)
                        val context = pageContent.substring(contextStart, contextEnd)

                        results.add(
                            SearchResult(
                                page = pageIndex + 1,
                                position = match.range.first,
                                text = match.value,
                                context = "...$context..."
                            )
                        )
                    }
                }

                _uiState.value = _uiState.value.copy(
                    searchQuery = query,
                    searchResults = results,
                    currentSearchIndex = if (results.isNotEmpty()) 0 else -1
                )
            }
        }
    }

    fun navigateToSearchResult(index: Int) {
        val results = _uiState.value.searchResults
        if (index in results.indices) {
            val result = results[index]
            setCurrentPage(result.page)
            _uiState.value = _uiState.value.copy(currentSearchIndex = index)
        }
    }

    fun addBookmark(title: String, note: String = "") {
        val bookmark = Bookmark(
            id = UUID.randomUUID().toString(),
            title = title,
            page = _uiState.value.currentPage,
            position = _uiState.value.readingProgress,
            createdAt = System.currentTimeMillis(),
            note = note
        )

        val updatedBookmarks = _uiState.value.bookmarks + bookmark
        _uiState.value = _uiState.value.copy(bookmarks = updatedBookmarks)
    }

    private fun addAutoBookmark(page: Int) {
        // Add auto-bookmark every 10 pages
        if (page % 10 == 0) {
            val autoBookmark = Bookmark(
                id = UUID.randomUUID().toString(),
                title = "Auto-bookmark - Page $page",
                page = page,
                position = page.toFloat() / _uiState.value.totalPages,
                createdAt = System.currentTimeMillis(),
                note = "Automatically created bookmark"
            )

            val updatedBookmarks = _uiState.value.bookmarks + autoBookmark
            _uiState.value = _uiState.value.copy(bookmarks = updatedBookmarks)
        }
    }

    fun deleteBookmark(bookmark: Bookmark) {
        val updatedBookmarks = _uiState.value.bookmarks.filterNot { it.id == bookmark.id }
        _uiState.value = _uiState.value.copy(bookmarks = updatedBookmarks)
    }

    fun navigateToBookmark(bookmark: Bookmark) {
        setCurrentPage(bookmark.page)
    }

    fun navigateToChapter(chapter: TableOfContentsItem) {
        setCurrentPage(chapter.page)
    }

    fun updateSettings(settings: ViewerSettings) {
        _uiState.value = _uiState.value.copy(settings = settings)

        // Re-paginate content if reading mode changed
        if (documentContent.isNotEmpty()) {
            documentPages = paginateContent(documentContent)
            val newTotalPages = documentPages.size.coerceAtLeast(1)
            val newCurrentPage = (_uiState.value.currentPage * newTotalPages / _uiState.value.totalPages)
                .coerceIn(1, newTotalPages)

            _uiState.value = _uiState.value.copy(
                totalPages = newTotalPages,
                currentPage = newCurrentPage,
                content = if (documentPages.isNotEmpty() && newCurrentPage <= documentPages.size) {
                    documentPages[newCurrentPage - 1]
                } else {
                    documentContent
                }
            )
        }
    }

    private fun startReadingTimer() {
        viewModelScope.launch {
            while (_uiState.value.isLoaded) {
                kotlinx.coroutines.delay(60000) // Update every minute
                updateReadingStats()
            }
        }
    }

    private fun updateReadingStats() {
        val currentTime = System.currentTimeMillis()
        val sessionDuration = currentTime - sessionStartTime
        val readingDuration = currentTime - readingStartTime

        val wordsPerMinute = if (readingDuration > 0) {
            (wordsRead * 60000f) / readingDuration
        } else {
            0f
        }

        val stats = ReadingStats(
            totalPages = documentPages.size,
            currentPage = _uiState.value.currentPage,
            readingProgress = if (documentPages.isNotEmpty()) _uiState.value.currentPage.toFloat() / documentPages.size else 0f,
            timeSpentReading = sessionDuration,
            averageReadingSpeed = if (sessionDuration > 0) (_uiState.value.currentPage * 3600000f) / sessionDuration else 0f,
            sessionStartTime = sessionStartTime,
            totalReadingTime = sessionDuration,
            wordsRead = wordsRead,
            averageWordsPerMinute = wordsPerMinute
        )

        _uiState.value = _uiState.value.copy(readingStats = stats)
    }

    private fun updateWordsRead(newPage: Int) {
        if (newPage > _uiState.value.currentPage) {
            // Moving forward - count words read
            val pagesRead = newPage - _uiState.value.currentPage
            wordsRead += pagesRead * 250 // Estimate 250 words per page
        }
    }

    private fun findCurrentChapter(page: Int): String? {
        return _uiState.value.tableOfContents
            .filter { it.page <= page }
            .maxByOrNull { it.page }
            ?.title
    }
}

data class AdvancedDocumentReaderUiState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val error: String? = null,
    val title: String = "",
    val content: String = "",
    val documentType: MediaViewerManager.DocumentFormat = MediaViewerManager.DocumentFormat.TXT,

    // Page navigation
    val currentPage: Int = 1,
    val totalPages: Int = 1,
    val readingProgress: Float = 0f,

    // Table of contents and chapters
    val tableOfContents: List<TableOfContentsItem> = emptyList(),
    val currentChapter: String? = null,

    // Search functionality
    val searchQuery: String = "",
    val searchResults: List<SearchResult> = emptyList(),
    val currentSearchIndex: Int = -1,

    // Bookmarks
    val bookmarks: List<Bookmark> = emptyList(),

    // Reading statistics
    val readingStats: ReadingStats = ReadingStats(
        totalPages = 0,
        currentPage = 0,
        readingProgress = 0f,
        timeSpentReading = 0
    ),

    // Settings
    val settings: ViewerSettings = ViewerSettings()
)
