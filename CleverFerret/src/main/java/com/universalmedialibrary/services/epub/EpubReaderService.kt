package com.universalmedialibrary.services.epub

import android.content.Context
import android.net.Uri
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import com.universalmedialibrary.services.media.DocumentContent
import com.universalmedialibrary.services.media.DocumentPage
import com.universalmedialibrary.services.media.DocumentType
import com.universalmedialibrary.services.media.Chapter
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import java.io.File
import java.io.FileInputStream
import java.util.zip.ZipFile
import java.util.zip.ZipEntry
import javax.inject.Inject
import javax.inject.Singleton

/**
 * EPUB Reader Service using a custom EPUB parser
 *
 * This service handles:
 * - Loading EPUB files from URI or File
 * - Parsing table of contents (TOC) and spine order
 * - Extracting chapter HTML content and metadata
 * - Providing navigation methods for chapters
 * - Converting EPUB content to app's existing DocumentContent structure
 */
@Singleton
class EpubReaderService @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private val _readerState = MutableStateFlow(EpubReaderState())
    val readerState: StateFlow<EpubReaderState> = _readerState.asStateFlow()

    private var currentEpub: EpubBook? = null
    private var currentChapters: List<EpubChapter> = emptyList()

    /**
     * Load an EPUB file from a URI
     */
    suspend fun loadEPUB(uri: Uri): Boolean = withContext(Dispatchers.IO) {
        try {
            updateReaderState(isLoading = true)

            val file = when (uri.scheme) {
                "file" -> File(uri.path ?: "")
                "content" -> {
                    // For content URIs, we need to copy to temp file
                    val tempFile = File(context.cacheDir, "temp_epub_${System.currentTimeMillis()}.epub")
                    context.contentResolver.openInputStream(uri)?.use { input ->
                        tempFile.outputStream().use { output ->
                            input.copyTo(output)
                        }
                    }
                    tempFile
                }
                else -> throw IllegalArgumentException("Unsupported URI scheme: ${uri.scheme}")
            }

            if (!file.exists()) {
                updateReaderState(error = "File not found")
                return@withContext false
            }

            val epub = parseEpubFile(file)
            if (epub != null) {
                currentEpub = epub
                currentChapters = epub.chapters

                updateReaderState(
                    isLoading = false,
                    isLoaded = true,
                    bookTitle = epub.metadata.title,
                    bookAuthor = epub.metadata.authors.joinToString(", "),
                    totalChapters = epub.chapters.size,
                    chapters = epub.chapters,
                    currentChapter = 0
                )
                true
            } else {
                updateReaderState(error = "Failed to parse EPUB file")
                false
            }

        } catch (e: Exception) {
            updateReaderState(error = "Failed to load EPUB: ${e.message}")
            false
        }
    }

    /**
     * Load an EPUB file from a File
     */
    suspend fun loadEPUB(file: File): Boolean = loadEPUB(Uri.fromFile(file))

    /**
     * Parse an EPUB file
     */
    private fun parseEpubFile(file: File): EpubBook? {
        return try {
            ZipFile(file).use { zipFile ->
                // Parse metadata first
                val metadata = parseMetadata(zipFile)

                // Parse manifest and spine
                val contentOpf = findContentOpf(zipFile) ?: return null
                val manifestItems = parseManifest(zipFile, contentOpf)
                val spineItems = parseSpine(zipFile, contentOpf)

                // Parse table of contents
                val tocItems = parseToc(zipFile, manifestItems)

                // Extract chapters
                val chapters = extractChapters(zipFile, spineItems, manifestItems, tocItems)

                EpubBook(
                    metadata = metadata,
                    chapters = chapters
                )
            }
        } catch (e: Exception) {
            null
        }
    }

    /**
     * Find the content.opf file
     */
    private fun findContentOpf(zipFile: ZipFile): ZipEntry? {
        // First look for META-INF/container.xml
        val containerEntry = zipFile.getEntry("META-INF/container.xml")
        if (containerEntry != null) {
            val containerContent = zipFile.getInputStream(containerEntry).bufferedReader().readText()
            val containerDoc = Jsoup.parse(containerContent, "", org.jsoup.parser.Parser.xmlParser())
            val rootfilePath = containerDoc.select("rootfile").attr("full-path")
            if (rootfilePath.isNotEmpty()) {
                return zipFile.getEntry(rootfilePath)
            }
        }

        // Fallback: look for common names
        return zipFile.getEntry("content.opf")
            ?: zipFile.getEntry("OEBPS/content.opf")
            ?: zipFile.getEntry("OPS/content.opf")
    }

    /**
     * Parse metadata from content.opf
     */
    private fun parseMetadata(zipFile: ZipFile): SimpleEpubMetadata {
        val contentOpf = findContentOpf(zipFile)
        if (contentOpf != null) {
            val opfContent = zipFile.getInputStream(contentOpf).bufferedReader().readText()
            val opfDoc = Jsoup.parse(opfContent, "", org.jsoup.parser.Parser.xmlParser())

            val title = opfDoc.select("metadata title").text().ifEmpty { "Unknown Title" }
            val authors = opfDoc.select("metadata creator").map { it.text() }
            val description = opfDoc.select("metadata description").text()
            val language = opfDoc.select("metadata language").text().ifEmpty { "en" }
            val publisher = opfDoc.select("metadata publisher").text()
            val isbn = opfDoc.select("metadata identifier[scheme=ISBN]").text()

            return SimpleEpubMetadata(
                title = title,
                authors = authors,
                description = description,
                language = language,
                publisher = publisher,
                publishDate = "",
                isbn = isbn,
                coverImageData = null
            )
        }

        return SimpleEpubMetadata(
            title = "Unknown Title",
            authors = emptyList(),
            description = "",
            language = "en",
            publisher = "",
            publishDate = "",
            isbn = "",
            coverImageData = null
        )
    }

    /**
     * Parse manifest items from content.opf
     */
    private fun parseManifest(zipFile: ZipFile, contentOpf: ZipEntry): Map<String, ManifestItem> {
        val opfContent = zipFile.getInputStream(contentOpf).bufferedReader().readText()
        val opfDoc = Jsoup.parse(opfContent, "", org.jsoup.parser.Parser.xmlParser())
        val manifest = mutableMapOf<String, ManifestItem>()

        opfDoc.select("manifest item").forEach { item ->
            val id = item.attr("id")
            val href = item.attr("href")
            val mediaType = item.attr("media-type")

            if (id.isNotEmpty() && href.isNotEmpty()) {
                manifest[id] = ManifestItem(id, href, mediaType)
            }
        }

        return manifest
    }

    /**
     * Parse spine order from content.opf
     */
    private fun parseSpine(zipFile: ZipFile, contentOpf: ZipEntry): List<String> {
        val opfContent = zipFile.getInputStream(contentOpf).bufferedReader().readText()
        val opfDoc = Jsoup.parse(opfContent, "", org.jsoup.parser.Parser.xmlParser())

        return opfDoc.select("spine itemref").map { it.attr("idref") }
    }

    /**
     * Parse table of contents
     */
    private fun parseToc(zipFile: ZipFile, manifestItems: Map<String, ManifestItem>): List<SimpleTocItem> {
        // Find TOC file (usually toc.ncx)
        val tocManifest = manifestItems.values.find {
            it.mediaType == "application/x-dtbncx+xml" || it.href.endsWith("toc.ncx")
        }

        if (tocManifest != null) {
            val tocEntry = zipFile.getEntry(tocManifest.href)
            if (tocEntry != null) {
                val tocContent = zipFile.getInputStream(tocEntry).bufferedReader().readText()
                val tocDoc = Jsoup.parse(tocContent, "", org.jsoup.parser.Parser.xmlParser())

                return tocDoc.select("navMap navPoint").map { navPoint ->
                    val title = navPoint.select("navLabel text").text()
                    val src = navPoint.select("content").attr("src")
                    SimpleTocItem(title, src)
                }
            }
        }

        return emptyList()
    }

    /**
     * Extract chapters from EPUB
     */
    private fun extractChapters(
        zipFile: ZipFile,
        spineItems: List<String>,
        manifestItems: Map<String, ManifestItem>,
        tocItems: List<SimpleTocItem>
    ): List<EpubChapter> {
        val chapters = mutableListOf<EpubChapter>()
        val opfDir = findContentOpf(zipFile)?.name?.substringBeforeLast("/") ?: ""

        spineItems.forEachIndexed { index, itemRef ->
            val manifestItem = manifestItems[itemRef]
            if (manifestItem != null) {
                val fullPath = if (opfDir.isNotEmpty()) "$opfDir/${manifestItem.href}" else manifestItem.href
                val entry = zipFile.getEntry(fullPath) ?: zipFile.getEntry(manifestItem.href)

                if (entry != null) {
                    zipFile.getInputStream(entry).use { inputStream ->
                        val content = inputStream.bufferedReader().readText()
                        val title = tocItems.find { it.src.contains(manifestItem.href) }?.title
                            ?: "Chapter ${index + 1}"

                        chapters.add(
                            EpubChapter(
                                index = index,
                                title = title,
                                content = content,
                                resourceId = itemRef
                            )
                        )
                    }
                }
            }
        }

        return chapters
    }


    /**
     * Get the DocumentContent representation for compatibility with UniversalReaderService
     */
    fun getDocumentContent(): DocumentContent? {
        val epub = currentEpub ?: return null

        val pages = currentChapters.mapIndexed { index, chapter ->
            DocumentPage(
                pageNumber = index + 1,
                content = chapter.content,
                title = chapter.title
            )
        }

        return DocumentContent(
            type = DocumentType.EPUB,
            pages = pages,
            title = epub.metadata.title
        )
    }

    /**
     * Navigate to the next chapter
     */
    fun nextChapter(): Boolean {
        val state = _readerState.value
        if (state.currentChapter < state.totalChapters - 1) {
            updateReaderState(currentChapter = state.currentChapter + 1)
            return true
        }
        return false
    }

    /**
     * Navigate to the previous chapter
     */
    fun previousChapter(): Boolean {
        val state = _readerState.value
        if (state.currentChapter > 0) {
            updateReaderState(currentChapter = state.currentChapter - 1)
            return true
        }
        return false
    }

    /**
     * Jump to a specific chapter
     */
    fun jumpToChapter(chapterIndex: Int): Boolean {
        val state = _readerState.value
        if (chapterIndex in 0 until state.totalChapters) {
            updateReaderState(currentChapter = chapterIndex)
            return true
        }
        return false
    }

    /**
     * Get the current chapter content
     */
    fun getCurrentChapterContent(): String? {
        val state = _readerState.value
        return if (state.currentChapter in currentChapters.indices) {
            currentChapters[state.currentChapter].content
        } else null
    }

    /**
     * Get chapter by index
     */
    fun getChapter(index: Int): EpubChapter? {
        return if (index in currentChapters.indices) currentChapters[index] else null
    }

    /**
     * Extract book metadata
     */
    fun getBookMetadata(): SimpleEpubMetadata? = currentEpub?.metadata

    private fun updateReaderState(
        isLoading: Boolean = _readerState.value.isLoading,
        isLoaded: Boolean = _readerState.value.isLoaded,
        bookTitle: String = _readerState.value.bookTitle,
        bookAuthor: String = _readerState.value.bookAuthor,
        totalChapters: Int = _readerState.value.totalChapters,
        currentChapter: Int = _readerState.value.currentChapter,
        chapters: List<EpubChapter> = _readerState.value.chapters,
        error: String? = null
    ) {
        _readerState.value = EpubReaderState(
            isLoading = isLoading,
            isLoaded = isLoaded,
            bookTitle = bookTitle,
            bookAuthor = bookAuthor,
            totalChapters = totalChapters,
            currentChapter = currentChapter,
            chapters = chapters,
            error = error
        )
    }
}

/**
 * Represents an EPUB book
 */
data class EpubBook(
    val metadata: SimpleEpubMetadata,
    val chapters: List<EpubChapter>
)

/**
 * Represents a manifest item
 */
data class ManifestItem(
    val id: String,
    val href: String,
    val mediaType: String
)

/**
 * Represents a table of contents item
 */
data class SimpleTocItem(
    val title: String,
    val src: String
)

/**
 * Represents the current EPUB reader state
 */
data class EpubReaderState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val bookTitle: String = "",
    val bookAuthor: String = "",
    val totalChapters: Int = 0,
    val currentChapter: Int = 0,
    val chapters: List<EpubChapter> = emptyList(),
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val canGoNext: Boolean get() = isLoaded && currentChapter < totalChapters - 1
    val canGoPrevious: Boolean get() = isLoaded && currentChapter > 0
    val progress: Float get() = if (totalChapters > 0) (currentChapter + 1).toFloat() / totalChapters else 0f
}

/**
 * Represents a chapter in an EPUB book
 */
data class EpubChapter(
    val index: Int,
    val title: String,
    val content: String,
    val resourceId: String
)

/**
 * Represents EPUB book metadata
 */
data class SimpleEpubMetadata(
    val title: String,
    val authors: List<String>,
    val description: String,
    val language: String,
    val publisher: String,
    val publishDate: String,
    val isbn: String,
    val coverImageData: ByteArray?
)
