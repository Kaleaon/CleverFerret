package com.universalmedialibrary.ui.reader

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.repository.ReadingProgressRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.io.File
import java.util.zip.ZipFile
import javax.inject.Inject

/**
 * ViewModel for the e-reader screen
 * Supports: TXT, MD, HTML files and basic EPUB parsing
 */
@HiltViewModel
class EReaderViewModel @Inject constructor(
    private val readingProgressRepository: ReadingProgressRepository,
    private val mediaItemDao: MediaItemDao
) : ViewModel() {

    private val _uiState = MutableStateFlow(EReaderUiState())
    val uiState: StateFlow<EReaderUiState> = _uiState.asStateFlow()

    private var chapters: List<String> = emptyList()
    private var chapterTitles: List<String> = emptyList()
    private var currentChapterIndex = 0
    private var currentItemId: Long? = null

    /**
     * Load a book file for reading
     */
    fun loadBook(context: Context, filePath: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)

            try {
                val file = File(filePath)
                if (!file.exists()) {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = "File not found: $filePath"
                    )
                    return@launch
                }

                when (file.extension.lowercase()) {
                    "txt", "md" -> loadTextFile(file)
                    "html", "htm" -> loadHtmlFile(file)
                    "epub" -> loadEpubFile(file)
                    "pdf" -> loadPdfInfo(file)
                    else -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            error = "Unsupported file format: ${file.extension}\n\nSupported: TXT, MD, HTML, EPUB, PDF"
                        )
                    }
                }

                currentItemId = try {
                    mediaItemDao.getMediaItemByFilePath(filePath)?.itemId
                        ?: mediaItemDao.getItemByPath(filePath)?.itemId
                } catch (_: Exception) {
                    null
                }

            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load book: ${e.message}"
                )
            }
        }
    }

    private suspend fun loadTextFile(file: File) = withContext(Dispatchers.IO) {
        val content = file.readText()

        // Split into chapters using lookahead so chapter headings are preserved.
        // Matches: Chapter, Ch., Part, Section, Book (case-insensitive)
        // Supports Arabic numerals, Roman numerals (I-XXXIX style), or named chapters (no number).
        val chapterPattern = Regex(
            """(?=\n\s*(?:(?:Chapter|Ch\.|Section|Part|Book)\s+(?:\d+|[IVXLCDM]+)(?:[:\s.\-]|$)|(?:Chapter|Ch\.|Section|Part|Book)\s+[A-Z][A-Za-z\s]+$))""",
            setOf(RegexOption.IGNORE_CASE, RegexOption.MULTILINE)
        )

        chapters = content.split(chapterPattern)
            .filter { it.isNotBlank() }
        chapterTitles = chapters.mapIndexed { index, chapter ->
            chapter.lineSequence().firstOrNull { it.isNotBlank() }?.trim()?.take(64)
                ?: "Chapter ${index + 1}"
        }

        if (chapters.isEmpty()) {
            chapters = listOf(content)
        }

        currentChapterIndex = 0

        _uiState.value = _uiState.value.copy(
            isLoading = false,
            isLoaded = true,
            bookTitle = file.nameWithoutExtension,
            totalChapters = chapters.size,
            currentChapterIndex = 0,
            currentChapterContent = chapters[0],
            chapterTitles = chapterTitles
        )
    }

    private suspend fun loadHtmlFile(file: File) = withContext(Dispatchers.IO) {
        val content = file.readText()
        val strippedContent = stripHtmlWithJsoup(content)

        chapters = listOf(strippedContent)
        chapterTitles = listOf(file.nameWithoutExtension)
        currentChapterIndex = 0

        _uiState.value = _uiState.value.copy(
            isLoading = false,
            isLoaded = true,
            bookTitle = file.nameWithoutExtension,
            totalChapters = 1,
            currentChapterIndex = 0,
            currentChapterContent = strippedContent,
            chapterTitles = chapterTitles
        )
    }

    /**
     * Properly strip HTML using Jsoup: removes script/style elements,
     * decodes all HTML entities (including numeric like &#123; and &#x7B;),
     * and preserves meaningful whitespace.
     */
    private fun stripHtmlWithJsoup(html: String): String {
        val doc = Jsoup.parse(html)
        // Remove script and style elements entirely
        doc.select("script, style").remove()
        // Jsoup's text() decodes all HTML entities and extracts clean text
        // Use wholeText() to preserve paragraph/block-level whitespace structure
        val body = doc.body() ?: return doc.text()
        // Insert newlines for block-level elements so paragraphs are separated
        body.select("br").append("\\n")
        body.select("p, div, h1, h2, h3, h4, h5, h6, li, tr, blockquote").forEach { el ->
            el.prepend("\\n")
            el.append("\\n")
        }
        return body.text()
            .replace("\\n", "\n")
            .replace(Regex("\n{3,}"), "\n\n")
            .trim()
    }

    private suspend fun loadEpubFile(file: File) = withContext(Dispatchers.IO) {
        try {
            val zipFile = ZipFile(file)
            val entries = zipFile.entries().toList()
            val entryMap = entries.associateBy { it.name }

            // --- Determine spine order from OPF ---
            val orderedContentPaths = resolveSpineOrder(zipFile, entryMap)

            // If spine resolution succeeded, use that order; otherwise fall back
            // to all HTML/XHTML files sorted by name.
            val contentEntries = if (orderedContentPaths.isNotEmpty()) {
                orderedContentPaths.mapNotNull { entryMap[it] }
            } else {
                entries.filter {
                    it.name.endsWith(".html") || it.name.endsWith(".xhtml") || it.name.endsWith(".htm")
                }.sortedBy { it.name }
            }

            chapters = contentEntries.mapNotNull { entry ->
                try {
                    zipFile.getInputStream(entry).use { inputStream ->
                        // EPUB spec requires UTF-8 encoding
                        val html = inputStream.bufferedReader(Charsets.UTF_8).use { it.readText() }
                        val doc = Jsoup.parse(html)

                        // Try to extract a chapter title from headings
                        val heading = doc.select("h1, h2, h3").firstOrNull()?.text()?.trim()

                        // Strip using Jsoup (same logic as stripHtmlWithJsoup)
                        val text = stripHtmlWithJsoup(html)

                        // Prepend a heading line if we found one and it is not
                        // already the first line of the extracted text.
                        if (!heading.isNullOrBlank() && !text.startsWith(heading)) {
                            "$heading\n\n$text"
                        } else {
                            text
                        }
                    }
                } catch (_: Exception) {
                    null
                }
            }.filter { it.isNotBlank() }
            chapterTitles = contentEntries.mapIndexed { index, entry ->
                entry.name.substringAfterLast("/").substringBeforeLast(".").ifBlank { "Chapter ${index + 1}" }
            }.take(chapters.size)

            zipFile.close()

            if (chapters.isEmpty()) {
                val entryCount = entries.size
                val htmlCount = entries.count {
                    it.name.endsWith(".html") || it.name.endsWith(".xhtml") || it.name.endsWith(".htm")
                }
                chapters = listOf(
                    """
                    Unable to extract readable text from this EPUB.

                    File: ${file.name}
                    Size: ${file.length() / 1024} KB
                    Total entries in archive: $entryCount
                    HTML/XHTML entries found: $htmlCount

                    Possible reasons:
                    • The EPUB may use DRM protection that prevents text extraction.
                    • Content may be stored in an unsupported format (e.g., images only).
                    • The archive structure may be non-standard or corrupted.

                    Try opening this file with a dedicated EPUB reader application.
                    """.trimIndent()
                )
            }

            currentChapterIndex = 0

            _uiState.value = _uiState.value.copy(
                isLoading = false,
                isLoaded = true,
                bookTitle = file.nameWithoutExtension,
                totalChapters = chapters.size,
                currentChapterIndex = 0,
                currentChapterContent = chapters[0],
                chapterTitles = chapterTitles
            )
        } catch (e: Exception) {
            _uiState.value = _uiState.value.copy(
                isLoading = false,
                error = "Failed to parse EPUB: ${e.message}"
            )
        }
    }

    /**
     * Parse META-INF/container.xml to find the OPF file, then parse the OPF
     * spine + manifest to return content file paths in reading order.
     */
    private fun resolveSpineOrder(
        zipFile: ZipFile,
        entryMap: Map<String, java.util.zip.ZipEntry>
    ): List<String> {
        try {
            // 1. Parse container.xml to find the .opf path
            val containerEntry = entryMap["META-INF/container.xml"] ?: return emptyList()
            val containerDoc = zipFile.getInputStream(containerEntry).use { stream ->
                Jsoup.parse(stream.bufferedReader(Charsets.UTF_8).use { it.readText() }, "", org.jsoup.parser.Parser.xmlParser())
            }
            val opfPath = containerDoc.select("rootfile[full-path]")
                .firstOrNull()?.attr("full-path") ?: return emptyList()

            // Determine the directory prefix for relative paths in the OPF
            val opfDir = if (opfPath.contains("/")) opfPath.substringBeforeLast("/") + "/" else ""

            // 2. Parse the OPF file
            val opfEntry = entryMap[opfPath] ?: return emptyList()
            val opfDoc = zipFile.getInputStream(opfEntry).use { stream ->
                Jsoup.parse(stream.bufferedReader(Charsets.UTF_8).use { it.readText() }, "", org.jsoup.parser.Parser.xmlParser())
            }

            // 3. Build manifest id -> href map
            val manifest = mutableMapOf<String, String>()
            opfDoc.select("manifest item").forEach { item ->
                val id = item.attr("id")
                val href = item.attr("href")
                if (id.isNotBlank() && href.isNotBlank()) {
                    manifest[id] = href
                }
            }

            // 4. Read spine order
            return opfDoc.select("spine itemref").mapNotNull { itemref ->
                val idref = itemref.attr("idref")
                val href = manifest[idref] ?: return@mapNotNull null
                // Resolve relative path against OPF directory
                opfDir + href
            }
        } catch (_: Exception) {
            return emptyList()
        }
    }

    private suspend fun loadPdfInfo(file: File) = withContext(Dispatchers.IO) {
        // PDF parsing requires external libraries - show info message
        val content = """
            PDF Reader
            
            File: ${file.name}
            Size: ${file.length() / 1024} KB
            
            PDF reading requires additional libraries for proper rendering.
            For now, this is a placeholder showing file information.
            
            To read PDF files, consider:
            • Using a dedicated PDF reader app
            • Converting the PDF to EPUB or TXT format
            • Waiting for enhanced PDF support in future updates
        """.trimIndent()
        
        chapters = listOf(content)
        chapterTitles = listOf("PDF Info")
        currentChapterIndex = 0
        
        _uiState.value = _uiState.value.copy(
            isLoading = false,
            isLoaded = true,
            bookTitle = file.nameWithoutExtension,
            totalChapters = 1,
            currentChapterIndex = 0,
            currentChapterContent = content,
            chapterTitles = chapterTitles
        )
    }

    /**
     * Navigate to the next chapter
     */
    fun nextChapter() {
        if (currentChapterIndex < chapters.size - 1) {
            currentChapterIndex++
            _uiState.value = _uiState.value.copy(
                currentChapterIndex = currentChapterIndex,
                currentChapterContent = chapters[currentChapterIndex]
            )
            persistProgress()
        }
    }

    /**
     * Navigate to the previous chapter
     */
    fun previousChapter() {
        if (currentChapterIndex > 0) {
            currentChapterIndex--
            _uiState.value = _uiState.value.copy(
                currentChapterIndex = currentChapterIndex,
                currentChapterContent = chapters[currentChapterIndex]
            )
            persistProgress()
        }
    }

    /**
     * Jump to a specific chapter
     */
    fun jumpToChapter(index: Int) {
        if (index in chapters.indices) {
            currentChapterIndex = index
            _uiState.value = _uiState.value.copy(
                currentChapterIndex = currentChapterIndex,
                currentChapterContent = chapters[currentChapterIndex]
            )
            persistProgress()
        }
    }

    fun setTheme(themeMode: ReaderThemeMode) {
        _uiState.value = _uiState.value.copy(themeMode = themeMode)
    }

    fun adjustFontSize(deltaSp: Int) {
        _uiState.value = _uiState.value.copy(fontSizeSp = (_uiState.value.fontSizeSp + deltaSp).coerceIn(12, 32))
    }

    private fun persistProgress() {
        val itemId = currentItemId ?: return
        val state = _uiState.value
        viewModelScope.launch {
            readingProgressRepository.updateProgress(
                itemId = itemId,
                currentPage = state.currentChapterIndex + 1,
                percentage = if (state.totalChapters > 0) ((state.currentChapterIndex + 1).toFloat() / state.totalChapters) * 100f else 0f,
                currentChapter = state.currentChapterIndex + 1,
                currentPosition = state.currentChapterIndex.toLong()
            )
        }
    }

    /**
     * Previous page (for pagination) - currently same as previous chapter
     */
    fun previousPage() {
        previousChapter()
    }

    /**
     * Next page (for pagination) - currently same as next chapter
     */
    fun nextPage() {
        nextChapter()
    }
}

/**
 * UI state for the e-reader
 */
data class EReaderUiState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val bookTitle: String = "",
    val totalChapters: Int = 0,
    val currentChapterIndex: Int = 0,
    val currentChapterContent: String = "",
    val chapterTitles: List<String> = emptyList(),
    val fontSizeSp: Int = 18,
    val themeMode: ReaderThemeMode = ReaderThemeMode.SYSTEM,
    val error: String? = null
)

enum class ReaderThemeMode {
    SYSTEM, LIGHT, DARK, SEPIA
}
