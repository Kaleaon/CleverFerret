package com.universalmedialibrary.services.media

import android.content.Context
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.Bookmark
import com.universalmedialibrary.data.repository.MediaRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal reader service for documents and books
 * 
 * Supports reading:
 * - EPUB files with navigation and text extraction
 * - PDF files with page-based reading
 * - TXT files with chapter detection
 * - HTML files with structured content
 * - Comic books (CBZ/CBR) with image viewing
 */
@Singleton
class UniversalReaderService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaRepository: MediaRepository
) {
    
    private val _readerState = MutableStateFlow(ReaderState())
    val readerState: StateFlow<ReaderState> = _readerState.asStateFlow()
    
    private val _currentDocument = MutableStateFlow<MediaItem?>(null)
    val currentDocument: StateFlow<MediaItem?> = _currentDocument.asStateFlow()
    
    private var documentContent: DocumentContent? = null
    
    /**
     * Open a document for reading
     */
    suspend fun openDocument(mediaItem: MediaItem): Boolean = withContext(Dispatchers.IO) {
        try {
            updateReaderState(isLoading = true)
            
            val file = File(mediaItem.filePath)
            if (!file.exists()) {
                updateReaderState(error = "File not found: ${mediaItem.filePath}")
                return@withContext false
            }
            
            val content = when (mediaItem.fileExtension.lowercase()) {
                "epub" -> loadEpubContent(file)
                "pdf" -> loadPdfContent(file)
                "txt" -> loadTextContent(file)
                "html", "htm" -> loadHtmlContent(file)
                "cbz", "cbr" -> loadComicContent(file)
                else -> {
                    updateReaderState(error = "Unsupported file format: ${mediaItem.fileExtension}")
                    return@withContext false
                }
            }
            
            if (content != null) {
                documentContent = content
                _currentDocument.value = mediaItem
                updateReaderState(
                    isLoading = false,
                    currentPage = 1,
                    totalPages = content.pageCount,
                    canNavigate = content.pageCount > 1
                )
                true
            } else {
                updateReaderState(error = "Failed to load document content")
                false
            }
            
        } catch (e: Exception) {
            updateReaderState(error = "Failed to open document: ${e.message}")
            false
        }
    }
    
    private fun loadEpubContent(file: File): DocumentContent? {
        return try {
            ZipFile(file).use { zipFile ->
                val entries = zipFile.entries().toList()
                val htmlEntries = entries.filter { 
                    it.name.endsWith(".html") || it.name.endsWith(".xhtml") 
                }.sortedBy { it.name }
                
                if (htmlEntries.isEmpty()) {
                    return null
                }
                
                val pages = htmlEntries.mapIndexed { index, entry ->
                    val content = zipFile.getInputStream(entry).bufferedReader().readText()
                    DocumentPage(
                        pageNumber = index + 1,
                        content = content,
                        title = "Chapter ${index + 1}"
                    )
                }
                
                DocumentContent(
                    type = DocumentType.EPUB,
                    pages = pages,
                    title = file.nameWithoutExtension
                )
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private fun loadPdfContent(file: File): DocumentContent? {
        // For now, create a placeholder PDF content
        // In a real implementation, you'd use a PDF library like PdfRenderer
        return DocumentContent(
            type = DocumentType.PDF,
            pages = listOf(
                DocumentPage(
                    pageNumber = 1,
                    content = "PDF content loading not fully implemented yet. File: ${file.name}",
                    title = "PDF Document"
                )
            ),
            title = file.nameWithoutExtension
        )
    }
    
    private fun loadTextContent(file: File): DocumentContent? {
        return try {
            val content = file.readText()
            val chapters = detectChapters(content)
            
            val pages = if (chapters.isNotEmpty()) {
                chapters.mapIndexed { index, chapter ->
                    DocumentPage(
                        pageNumber = index + 1,
                        content = chapter.content,
                        title = chapter.title
                    )
                }
            } else {
                // Split content into manageable pages
                val pageSize = 5000 // characters per page
                val pageCount = (content.length / pageSize) + 1
                
                (0 until pageCount).map { pageIndex ->
                    val start = pageIndex * pageSize
                    val end = minOf(start + pageSize, content.length)
                    DocumentPage(
                        pageNumber = pageIndex + 1,
                        content = content.substring(start, end),
                        title = "Page ${pageIndex + 1}"
                    )
                }
            }
            
            DocumentContent(
                type = DocumentType.TEXT,
                pages = pages,
                title = file.nameWithoutExtension
            )
        } catch (e: Exception) {
            null
        }
    }
    
    private fun loadHtmlContent(file: File): DocumentContent? {
        return try {
            val content = file.readText()
            DocumentContent(
                type = DocumentType.HTML,
                pages = listOf(
                    DocumentPage(
                        pageNumber = 1,
                        content = content,
                        title = file.nameWithoutExtension
                    )
                ),
                title = file.nameWithoutExtension
            )
        } catch (e: Exception) {
            null
        }
    }
    
    private fun loadComicContent(file: File): DocumentContent? {
        return try {
            ZipFile(file).use { zipFile ->
                val imageEntries = zipFile.entries().toList()
                    .filter { entry ->
                        val name = entry.name.lowercase()
                        name.endsWith(".jpg") || name.endsWith(".jpeg") || 
                        name.endsWith(".png") || name.endsWith(".gif") ||
                        name.endsWith(".bmp") || name.endsWith(".webp")
                    }
                    .sortedBy { it.name }
                
                val pages = imageEntries.mapIndexed { index, entry ->
                    DocumentPage(
                        pageNumber = index + 1,
                        content = "comic_image:${entry.name}",
                        title = "Page ${index + 1}"
                    )
                }
                
                DocumentContent(
                    type = DocumentType.COMIC,
                    pages = pages,
                    title = file.nameWithoutExtension
                )
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private fun detectChapters(content: String): List<Chapter> {
        val chapters = mutableListOf<Chapter>()
        val lines = content.lines()
        var currentChapter: StringBuilder? = null
        var currentTitle = ""
        
        for (line in lines) {
            val trimmedLine = line.trim()
            
            // Simple chapter detection
            if (trimmedLine.matches(Regex("^(Chapter|CHAPTER)\\s+\\d+.*")) ||
                trimmedLine.matches(Regex("^\\d+\\.\\s+.*")) ||
                (trimmedLine.length < 100 && trimmedLine.isNotEmpty() && 
                 !trimmedLine.contains('.') && trimmedLine == trimmedLine.uppercase())) {
                
                // Save previous chapter
                if (currentChapter != null && currentTitle.isNotEmpty()) {
                    chapters.add(Chapter(currentTitle, currentChapter.toString()))
                }
                
                // Start new chapter
                currentTitle = trimmedLine
                currentChapter = StringBuilder()
            } else if (currentChapter != null) {
                currentChapter.append(line).append("\n")
            } else if (chapters.isEmpty()) {
                // First content before any chapter detected
                if (currentChapter == null) {
                    currentChapter = StringBuilder()
                    currentTitle = "Introduction"
                }
                currentChapter.append(line).append("\n")
            }
        }
        
        // Save last chapter
        if (currentChapter != null && currentTitle.isNotEmpty()) {
            chapters.add(Chapter(currentTitle, currentChapter.toString()))
        }
        
        return chapters
    }
    
    /**
     * Navigate to a specific page
     */
    fun goToPage(pageNumber: Int) {
        val content = documentContent ?: return
        
        if (pageNumber in 1..content.pageCount) {
            updateReaderState(currentPage = pageNumber)
        }
    }
    
    /**
     * Go to next page
     */
    fun nextPage() {
        val currentPage = _readerState.value.currentPage
        val totalPages = _readerState.value.totalPages
        
        if (currentPage < totalPages) {
            goToPage(currentPage + 1)
        }
    }
    
    /**
     * Go to previous page
     */
    fun previousPage() {
        val currentPage = _readerState.value.currentPage
        
        if (currentPage > 1) {
            goToPage(currentPage - 1)
        }
    }
    
    /**
     * Get current page content
     */
    fun getCurrentPageContent(): String? {
        val content = documentContent ?: return null
        val currentPage = _readerState.value.currentPage
        
        return content.pages.find { it.pageNumber == currentPage }?.content
    }
    
    /**
     * Search for text in the document
     */
    fun searchText(query: String): List<SearchResult> {
        val content = documentContent ?: return emptyList()
        val results = mutableListOf<SearchResult>()
        
        content.pages.forEach { page ->
            val matches = findTextMatches(page.content, query)
            matches.forEach { match ->
                results.add(
                    SearchResult(
                        pageNumber = page.pageNumber,
                        position = match.first,
                        context = match.second,
                        pageTitle = page.title
                    )
                )
            }
        }
        
        return results
    }
    
    private fun findTextMatches(content: String, query: String): List<Pair<Int, String>> {
        val results = mutableListOf<Pair<Int, String>>()
        val lowerContent = content.lowercase()
        val lowerQuery = query.lowercase()
        
        var index = lowerContent.indexOf(lowerQuery)
        while (index != -1) {
            val contextStart = maxOf(0, index - 50)
            val contextEnd = minOf(content.length, index + query.length + 50)
            val context = content.substring(contextStart, contextEnd)
            
            results.add(Pair(index, context))
            index = lowerContent.indexOf(lowerQuery, index + 1)
        }
        
        return results
    }
    
    /**
     * Close the current document
     */
    fun closeDocument() {
        documentContent = null
        _currentDocument.value = null
        updateReaderState()
    }
    
    private fun updateReaderState(
        isLoading: Boolean = false,
        currentPage: Int = 1,
        totalPages: Int = 0,
        canNavigate: Boolean = false,
        error: String? = null
    ) {
        _readerState.value = ReaderState(
            isLoading = isLoading,
            currentPage = currentPage,
            totalPages = totalPages,
            canNavigate = canNavigate,
            error = error
        )
    }
}

/**
 * Represents the current reader state
 */
data class ReaderState(
    val isLoading: Boolean = false,
    val currentPage: Int = 1,
    val totalPages: Int = 0,
    val canNavigate: Boolean = false,
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val canGoNext: Boolean get() = canNavigate && currentPage < totalPages
    val canGoPrevious: Boolean get() = canNavigate && currentPage > 1
    val progress: Float get() = if (totalPages > 0) currentPage.toFloat() / totalPages else 0f
}

/**
 * Represents document content
 */
data class DocumentContent(
    val type: DocumentType,
    val pages: List<DocumentPage>,
    val title: String
) {
    val pageCount: Int get() = pages.size
}

/**
 * Represents a single page in a document
 */
data class DocumentPage(
    val pageNumber: Int,
    val content: String,
    val title: String
)

/**
 * Represents a chapter in a text document
 */
data class Chapter(
    val title: String,
    val content: String
)

/**
 * Represents a search result
 */
data class SearchResult(
    val pageNumber: Int,
    val position: Int,
    val context: String,
    val pageTitle: String
)

/**
 * Document types supported by the reader
 */
enum class DocumentType {
    EPUB, PDF, TEXT, HTML, COMIC
}
