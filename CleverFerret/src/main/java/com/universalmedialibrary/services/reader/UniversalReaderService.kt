package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.pdf.PdfRenderer
import android.net.Uri
import android.os.ParcelFileDescriptor
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.services.epub.EPUBReaderService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.io.File
import java.io.FileInputStream
import java.util.zip.ZipFile
import javax.inject.Inject
import com.universalmedialibrary.services.ai.GeminiTTSService
import com.universalmedialibrary.services.ai.GeminiTTSOptions
import com.universalmedialibrary.services.ai.GeminiTTSResult

/**
 * Universal Reader Service
 * 
 * Comprehensive reading service that handles all text-based media types:
 * - EPUB (via EPUBReaderService)
 * - PDF (via PdfRenderer)
 * - Plain text files
 * - HTML documents
 * - Comic books (CBZ, CBR)
 * - Magazines (PDF, EPUB)
 * - Academic papers (PDF)
 * - Web fiction (HTML, TXT)
 * 
 * Features:
 * - Format detection and appropriate reader selection
 * - Text extraction and rendering
 * - Bookmark and progress tracking
 * - Search within documents
 * - Text-to-speech integration
 * - Customizable reading settings
 */
@Singleton
class UniversalReaderService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val epubReaderService: EPUBReaderService,
    private val geminiTTSService: GeminiTTSService
) {
    
    private val _readerState = MutableStateFlow(UniversalReaderState())
    val readerState: StateFlow<UniversalReaderState> = _readerState.asStateFlow()
    
    private var pdfRenderer: PdfRenderer? = null
    private var pdfParcelFileDescriptor: ParcelFileDescriptor? = null
    
    /**
     * Load document based on its type
     */
    suspend fun loadDocument(uri: Uri, mediaType: MediaType): Boolean = withContext(Dispatchers.IO) {
        try {
            _readerState.value = _readerState.value.copy(
                isLoading = true,
                error = null
            )
            
            val success = when (mediaType) {
                MediaType.BOOK -> {
                    val extension = getFileExtension(uri.toString())?.lowercase()
                    when (extension) {
                        "epub" -> loadEPUB(uri)
                        "pdf" -> loadPDF(uri)
                        "txt" -> loadTextFile(uri)
                        "html", "htm" -> loadHTMLFile(uri)
                        else -> loadAsText(uri) // Fallback
                    }
                }
                MediaType.COMIC -> loadComicBook(uri)
                MediaType.MAGAZINE -> loadMagazine(uri)
                MediaType.ACADEMIC_PAPER -> loadPDF(uri) // Most academic papers are PDFs
                MediaType.DOCUMENT -> loadDocument(uri)
                MediaType.WEB_FICTION -> loadWebFiction(uri)
                else -> false
            }
            
            _readerState.value = _readerState.value.copy(
                isLoading = false,
                isLoaded = success
            )
            
            success
            
        } catch (e: Exception) {
            _readerState.value = _readerState.value.copy(
                isLoading = false,
                error = "Failed to load document: ${e.message}"
            )
            false
        }
    }
    
    /**
     * Load EPUB file
     */
    private suspend fun loadEPUB(uri: Uri): Boolean {
        return try {
            val success = epubReaderService.loadEPUB(uri)
            if (success) {
                val epubState = epubReaderService.readerState.value
                _readerState.value = _readerState.value.copy(
                    documentType = DocumentType.EPUB,
                    title = epubState.bookTitle,
                    author = epubState.bookAuthor,
                    totalPages = epubState.totalChapters,
                    currentPage = epubState.currentChapter,
                    content = epubState.currentContent,
                    chapters = epubState.chapters.map { 
                        Chapter(it.index, it.title, it.content) 
                    }
                )
            }
            success
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Load PDF file
     */
    private suspend fun loadPDF(uri: Uri): Boolean = withContext(Dispatchers.IO) {
        return@withContext try {
            // Copy PDF to temp file for PdfRenderer
            val tempFile = File(context.cacheDir, "temp_pdf_${System.currentTimeMillis()}.pdf")
            context.contentResolver.openInputStream(uri)?.use { input ->
                tempFile.outputStream().use { output ->
                    input.copyTo(output)
                }
            }
            
            pdfParcelFileDescriptor = ParcelFileDescriptor.open(tempFile, ParcelFileDescriptor.MODE_READ_ONLY)
            pdfRenderer = PdfRenderer(pdfParcelFileDescriptor!!)
            
            val pageCount = pdfRenderer?.pageCount ?: 0
            val firstPageContent = if (pageCount > 0) {
                renderPDFPageAsText(0)
            } else {
                "Empty PDF"
            }
            
            _readerState.value = _readerState.value.copy(
                documentType = DocumentType.PDF,
                title = uri.lastPathSegment ?: "PDF Document",
                totalPages = pageCount,
                currentPage = 0,
                content = firstPageContent,
                canExtractText = true
            )
            
            true
            
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Load plain text file
     */
    private suspend fun loadTextFile(uri: Uri): Boolean = withContext(Dispatchers.IO) {
        return@withContext try {
            val content = context.contentResolver.openInputStream(uri)?.use { input ->
                input.bufferedReader().readText()
            } ?: ""
            
            val lines = content.lines()
            val chapters = splitTextIntoChapters(content)
            
            _readerState.value = _readerState.value.copy(
                documentType = DocumentType.TEXT,
                title = uri.lastPathSegment ?: "Text Document",
                content = content,
                totalPages = chapters.size,
                currentPage = 0,
                chapters = chapters
            )
            
            true
            
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Load HTML file
     */
    private suspend fun loadHTMLFile(uri: Uri): Boolean = withContext(Dispatchers.IO) {
        return@withContext try {
            val htmlContent = context.contentResolver.openInputStream(uri)?.use { input ->
                input.bufferedReader().readText()
            } ?: ""
            
            val doc = Jsoup.parse(htmlContent)
            doc.select("script, style").remove() // Remove scripts and styles
            
            val title = doc.title().takeIf { it.isNotEmpty() } ?: uri.lastPathSegment ?: "HTML Document"
            val textContent = doc.body()?.text() ?: doc.text()
            
            val chapters = splitTextIntoChapters(textContent)
            
            _readerState.value = _readerState.value.copy(
                documentType = DocumentType.HTML,
                title = title,
                content = textContent,
                totalPages = chapters.size,
                currentPage = 0,
                chapters = chapters
            )
            
            true
            
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Load comic book (CBZ/CBR)
     */
    private suspend fun loadComicBook(uri: Uri): Boolean = withContext(Dispatchers.IO) {
        return@withContext try {
            val tempFile = File(context.cacheDir, "temp_comic_${System.currentTimeMillis()}.zip")
            context.contentResolver.openInputStream(uri)?.use { input ->
                tempFile.outputStream().use { output ->
                    input.copyTo(output)
                }
            }
            
            val zipFile = ZipFile(tempFile)
            val imageEntries = zipFile.entries().asSequence()
                .filter { entry ->
                    val name = entry.name.lowercase()
                    name.endsWith(".jpg") || name.endsWith(".jpeg") || 
                    name.endsWith(".png") || name.endsWith(".gif") ||
                    name.endsWith(".webp")
                }
                .sortedBy { it.name }
                .toList()
            
            val pages = imageEntries.mapIndexed { index, entry ->
                ComicPage(
                    pageNumber = index,
                    imagePath = entry.name,
                    imageData = null // Will be loaded on demand
                )
            }
            
            _readerState.value = _readerState.value.copy(
                documentType = DocumentType.COMIC,
                title = uri.lastPathSegment ?: "Comic Book",
                totalPages = pages.size,
                currentPage = 0,
                comicPages = pages
            )
            
            zipFile.close()
            tempFile.delete()
            
            true
            
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Load magazine (could be PDF, EPUB, or other format)
     */
    private suspend fun loadMagazine(uri: Uri): Boolean {
        val extension = getFileExtension(uri.toString())?.lowercase()
        return when (extension) {
            "pdf" -> loadPDF(uri)
            "epub" -> loadEPUB(uri)
            else -> loadAsText(uri)
        }
    }
    
    /**
     * Load generic document
     */
    private suspend fun loadDocument(uri: Uri): Boolean {
        val extension = getFileExtension(uri.toString())?.lowercase()
        return when (extension) {
            "pdf" -> loadPDF(uri)
            "txt" -> loadTextFile(uri)
            "html", "htm" -> loadHTMLFile(uri)
            "epub" -> loadEPUB(uri)
            else -> loadAsText(uri)
        }
    }
    
    /**
     * Load web fiction (usually HTML or TXT)
     */
    private suspend fun loadWebFiction(uri: Uri): Boolean {
        val extension = getFileExtension(uri.toString())?.lowercase()
        return when (extension) {
            "html", "htm" -> loadHTMLFile(uri)
            "txt" -> loadTextFile(uri)
            "epub" -> loadEPUB(uri)
            else -> loadAsText(uri)
        }
    }
    
    /**
     * Fallback method to load any file as text
     */
    private suspend fun loadAsText(uri: Uri): Boolean = withContext(Dispatchers.IO) {
        return@withContext try {
            val content = context.contentResolver.openInputStream(uri)?.use { input ->
                input.bufferedReader().readText()
            } ?: ""
            
            val chapters = splitTextIntoChapters(content)
            
            _readerState.value = _readerState.value.copy(
                documentType = DocumentType.TEXT,
                title = uri.lastPathSegment ?: "Document",
                content = content,
                totalPages = chapters.size,
                currentPage = 0,
                chapters = chapters
            )
            
            true
            
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Navigation methods
     */
    fun goToPage(pageNumber: Int) {
        val state = _readerState.value
        if (pageNumber in 0 until state.totalPages) {
            when (state.documentType) {
                DocumentType.EPUB -> {
                    epubReaderService.goToChapter(pageNumber)
                    val epubState = epubReaderService.readerState.value
                    _readerState.value = state.copy(
                        currentPage = pageNumber,
                        content = epubState.currentContent
                    )
                }
                DocumentType.PDF -> {
                    val content = renderPDFPageAsText(pageNumber)
                    _readerState.value = state.copy(
                        currentPage = pageNumber,
                        content = content
                    )
                }
                DocumentType.TEXT, DocumentType.HTML -> {
                    val chapter = state.chapters.getOrNull(pageNumber)
                    if (chapter != null) {
                        _readerState.value = state.copy(
                            currentPage = pageNumber,
                            content = chapter.content
                        )
                    }
                }
                DocumentType.COMIC -> {
                    _readerState.value = state.copy(
                        currentPage = pageNumber
                    )
                }
            }
        }
    }
    
    fun nextPage() {
        val state = _readerState.value
        if (state.currentPage < state.totalPages - 1) {
            goToPage(state.currentPage + 1)
        }
    }
    
    fun previousPage() {
        val state = _readerState.value
        if (state.currentPage > 0) {
            goToPage(state.currentPage - 1)
        }
    }
    
    /**
     * Search within document
     */
    suspend fun searchInDocument(query: String): List<SearchResult> = withContext(Dispatchers.IO) {
        val state = _readerState.value
        val results = mutableListOf<SearchResult>()
        
        when (state.documentType) {
            DocumentType.EPUB -> {
                return@withContext epubReaderService.searchInBook(query).map { epubResult ->
                    SearchResult(
                        pageNumber = epubResult.chapterIndex,
                        pageTitle = epubResult.chapterTitle,
                        context = epubResult.context,
                        position = epubResult.position
                    )
                }
            }
            DocumentType.PDF -> {
                // Search in all PDF pages
                for (i in 0 until state.totalPages) {
                    val pageContent = renderPDFPageAsText(i)
                    val matches = findTextMatches(pageContent, query)
                    matches.forEach { match ->
                        results.add(SearchResult(
                            pageNumber = i,
                            pageTitle = "Page ${i + 1}",
                            context = match.context,
                            position = match.position
                        ))
                    }
                }
            }
            DocumentType.TEXT, DocumentType.HTML -> {
                state.chapters.forEachIndexed { index, chapter ->
                    val matches = findTextMatches(chapter.content, query)
                    matches.forEach { match ->
                        results.add(SearchResult(
                            pageNumber = index,
                            pageTitle = chapter.title,
                            context = match.context,
                            position = match.position
                        ))
                    }
                }
            }
            DocumentType.COMIC -> {
                // Comics typically don't have searchable text
            }
        }
        
        results
    }
    
    /**
     * Get current reading progress as percentage
     */
    fun getReadingProgress(): Float {
        val state = _readerState.value
        return if (state.totalPages > 0) {
            (state.currentPage + 1f) / state.totalPages
        } else {
            0f
        }
    }
    
    /**
     * Utility methods
     */
    private fun getFileExtension(filename: String): String? {
        return filename.substringAfterLast('.', "").takeIf { it.isNotEmpty() }
    }
    
    private fun splitTextIntoChapters(text: String): List<Chapter> {
        val chapters = mutableListOf<Chapter>()
        
        // Try to split by chapter markers
        val chapterMarkers = listOf(
            "Chapter ", "CHAPTER ", "Ch. ", "CH. ",
            "Part ", "PART ", "Section ", "SECTION "
        )
        
        var bestSplit: List<String>? = null
        var bestMarker = ""
        
        for (marker in chapterMarkers) {
            val split = text.split(marker)
            if (split.size > 1 && split.size < 50) { // Reasonable number of chapters
                bestSplit = split
                bestMarker = marker
                break
            }
        }
        
        if (bestSplit != null && bestSplit.size > 1) {
            bestSplit.forEachIndexed { index, chapterText ->
                if (chapterText.isNotBlank()) {
                    val title = if (index == 0) "Introduction" else "$bestMarker${index}"
                    chapters.add(Chapter(
                        index = chapters.size,
                        title = title,
                        content = chapterText.trim()
                    ))
                }
            }
        } else {
            // Split by paragraphs or fixed length
            val paragraphs = text.split("\n\n").filter { it.isNotBlank() }
            if (paragraphs.size > 10) {
                // Group paragraphs into chapters
                val chaptersSize = paragraphs.size / 10
                for (i in paragraphs.indices step chaptersSize) {
                    val chapterParagraphs = paragraphs.drop(i).take(chaptersSize)
                    chapters.add(Chapter(
                        index = chapters.size,
                        title = "Section ${chapters.size + 1}",
                        content = chapterParagraphs.joinToString("\n\n")
                    ))
                }
            } else {
                // Single chapter
                chapters.add(Chapter(
                    index = 0,
                    title = "Full Text",
                    content = text
                ))
            }
        }
        
        return chapters
    }
    
    private fun renderPDFPageAsText(pageNumber: Int): String {
        return try {
            val renderer = pdfRenderer ?: return "PDF not loaded"
            if (pageNumber >= renderer.pageCount) return "Page not found"
            
            val page = renderer.openPage(pageNumber)
            
            // For now, return a placeholder. In a real implementation,
            // you would use a PDF text extraction library like PDFBox Android
            val content = "PDF Page ${pageNumber + 1}\n\n[PDF text extraction would go here]\n\nThis page contains PDF content that requires a text extraction library to display properly."
            
            page.close()
            content
            
        } catch (e: Exception) {
            "Error rendering PDF page: ${e.message}"
        }
    }
    
    private fun findTextMatches(text: String, query: String): List<TextMatch> {
        val matches = mutableListOf<TextMatch>()
        val textLower = text.lowercase()
        val queryLower = query.lowercase()
        
        var index = textLower.indexOf(queryLower)
        while (index >= 0) {
            val start = maxOf(0, index - 50)
            val end = minOf(text.length, index + query.length + 50)
            val context = "..." + text.substring(start, end) + "..."
            
            matches.add(TextMatch(
                context = context,
                position = index
            ))
            
            index = textLower.indexOf(queryLower, index + 1)
        }
        
        return matches
    }
    
    /**
     * Release resources
     */
    fun release() {
        pdfRenderer?.close()
        pdfParcelFileDescriptor?.close()
        pdfRenderer = null
        pdfParcelFileDescriptor = null
        
        epubReaderService.clearBook()
        
        _readerState.value = UniversalReaderState()
    }
}

/**
 * Gemini AI Text-to-Speech Integration
 */

/**
 * Generate speech for current page/chapter using Gemini TTS
 */
suspend fun generateSpeechForCurrentPage(
    apiKey: String,
    options: GeminiTTSOptions = GeminiTTSOptions()
): GeminiTTSResult = withContext(Dispatchers.IO) {
    val state = _readerState.value
    
    return@withContext when {
        state.content.isBlank() -> {
            GeminiTTSResult(success = false, error = "No content to read")
        }
        
        state.documentType == DocumentType.EPUB -> {
            val currentChapter = state.chapters.getOrNull(state.currentPage)
            if (currentChapter != null) {
                geminiTTSService.generateBookChapterSpeech(
                    chapterText = currentChapter.content,
                    chapterTitle = currentChapter.title,
                    bookTitle = state.title,
                    apiKey = apiKey,
                    options = options
                )
            } else {
                GeminiTTSResult(success = false, error = "Chapter not found")
            }
        }
        
        else -> {
            // For PDF, text, HTML, etc.
            val content = if (state.content.length > 8000) {
                // Limit to first 8000 characters for reasonable TTS length
                state.content.take(8000) + "..."
            } else {
                state.content
            }
            
            geminiTTSService.generateSpeech(
                text = content,
                apiKey = apiKey,
                options = options.copy(
                    style = when (state.documentType) {
                        DocumentType.PDF -> com.universalmedialibrary.services.ai.GeminiTTSStyle.EDUCATIONAL
                        DocumentType.HTML -> com.universalmedialibrary.services.ai.GeminiTTSStyle.CONVERSATIONAL
                        else -> com.universalmedialibrary.services.ai.GeminiTTSStyle.NARRATIVE
                    }
                )
            )
        }
    }
}

/**
 * Generate speech for entire book/document (for audiobook creation)
 */
suspend fun generateSpeechForEntireDocument(
    apiKey: String,
    options: GeminiTTSOptions = GeminiTTSOptions(),
    onProgress: (Int, Int) -> Unit = { _, _ -> }
): List<GeminiTTSResult> = withContext(Dispatchers.IO) {
    val state = _readerState.value
    val results = mutableListOf<GeminiTTSResult>()
    
    when (state.documentType) {
        DocumentType.EPUB -> {
            state.chapters.forEachIndexed { index, chapter ->
                onProgress(index + 1, state.chapters.size)
                
                val result = geminiTTSService.generateBookChapterSpeech(
                    chapterText = chapter.content,
                    chapterTitle = chapter.title,
                    bookTitle = state.title,
                    apiKey = apiKey,
                    options = options
                )
                results.add(result)
            }
        }
        
        else -> {
            // Split content into chunks for very long documents
            val content = state.content
            val chunks = splitContentForTTS(content, 8000)
            
            chunks.forEachIndexed { index, chunk ->
                onProgress(index + 1, chunks.size)
                
                val result = geminiTTSService.generateSpeech(
                    text = chunk,
                    apiKey = apiKey,
                    options = options
                )
                results.add(result)
            }
        }
    }
    
    results
}

/**
 * Play generated audio using the TTS service
 */
suspend fun playCurrentPageAudio(audioFile: java.io.File): Boolean {
    return geminiTTSService.playAudio(audioFile)
}

/**
 * Stop any currently playing TTS audio
 */
fun stopTTSPlayback() {
    geminiTTSService.stopCurrentPlayback()
}

/**
 * Get current TTS state
 */
fun getTTSState() = geminiTTSService.ttsState

/**
 * Read current page aloud with optimized settings
 */
suspend fun readCurrentPageAloud(
    apiKey: String,
    autoPlay: Boolean = true
): GeminiTTSResult = withContext(Dispatchers.IO) {
    val state = _readerState.value
    
    // Optimize TTS options for reading
    val readingOptions = GeminiTTSOptions(
        style = when (state.documentType) {
            DocumentType.EPUB -> com.universalmedialibrary.services.ai.GeminiTTSStyle.NARRATIVE
            DocumentType.PDF -> com.universalmedialibrary.services.ai.GeminiTTSStyle.EDUCATIONAL
            DocumentType.HTML -> com.universalmedialibrary.services.ai.GeminiTTSStyle.CONVERSATIONAL
            else -> com.universalmedialibrary.services.ai.GeminiTTSStyle.CALM
        },
        pace = com.universalmedialibrary.services.ai.GeminiTTSPace.NORMAL,
        enhanceAccessibility = true,
        enableMultiSpeaker = state.content.contains("\"") // Enable if dialogue detected
    )
    
    val result = generateSpeechForCurrentPage(apiKey, readingOptions)
    
    // Auto-play if requested and generation was successful
    if (autoPlay && result.success && result.audioFile != null) {
        playCurrentPageAudio(result.audioFile)
    }
    
    result
}

/**
 * Utility method to split content for TTS
 */
private fun splitContentForTTS(content: String, maxChunkSize: Int): List<String> {
    if (content.length <= maxChunkSize) return listOf(content)
    
    val chunks = mutableListOf<String>()
    var currentIndex = 0
    
    while (currentIndex < content.length) {
        val endIndex = minOf(currentIndex + maxChunkSize, content.length)
        
        // Try to split at sentence boundary
        var splitIndex = endIndex
        if (endIndex < content.length) {
            val lastPeriod = content.lastIndexOf('.', endIndex)
            val lastExclamation = content.lastIndexOf('!', endIndex)
            val lastQuestion = content.lastIndexOf('?', endIndex)
            
            val sentenceEnd = maxOf(lastPeriod, lastExclamation, lastQuestion)
            if (sentenceEnd > currentIndex + maxChunkSize / 2) {
                splitIndex = sentenceEnd + 1
            }
        }
        
        chunks.add(content.substring(currentIndex, splitIndex).trim())
        currentIndex = splitIndex
    }
    
    return chunks
}

/**
 * Data classes
 */
data class UniversalReaderState(
    val isLoaded: Boolean = false,
    val isLoading: Boolean = false,
    val documentType: DocumentType = DocumentType.UNKNOWN,
    val title: String = "",
    val author: String = "",
    val totalPages: Int = 0,
    val currentPage: Int = 0,
    val content: String = "",
    val chapters: List<Chapter> = emptyList(),
    val comicPages: List<ComicPage> = emptyList(),
    val canExtractText: Boolean = false,
    val error: String? = null
)

data class Chapter(
    val index: Int,
    val title: String,
    val content: String
)

data class ComicPage(
    val pageNumber: Int,
    val imagePath: String,
    val imageData: Bitmap?
)

data class SearchResult(
    val pageNumber: Int,
    val pageTitle: String,
    val context: String,
    val position: Int
)

data class TextMatch(
    val context: String,
    val position: Int
)

enum class DocumentType {
    EPUB,
    PDF,
    TEXT,
    HTML,
    COMIC,
    UNKNOWN
}