package com.universalmedialibrary.services.epub

import android.content.Context
import android.net.Uri
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.io.File
import java.io.FileOutputStream
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for reading and parsing EPUB files
 * Provides chapter navigation and content extraction
 */
@Singleton
class EPUBReaderService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val _readerState = MutableStateFlow(EPUBReaderState())
    val readerState: StateFlow<EPUBReaderState> = _readerState.asStateFlow()

    data class EPUBReaderState(
        val isLoaded: Boolean = false,
        val currentChapter: Int = 0,
        val totalChapters: Int = 0,
        val bookTitle: String = "",
        val bookAuthor: String = "",
        val chapters: List<Chapter> = emptyList(),
        val currentContent: String = "",
        val error: String? = null
    )

    data class Chapter(
        val index: Int,
        val title: String,
        val href: String,
        val content: String = ""
    )

    data class EPUBMetadata(
        val title: String,
        val author: String,
        val publisher: String? = null,
        val publicationDate: String? = null,
        val identifier: String? = null,
        val language: String? = null,
        val description: String? = null,
        val coverImagePath: String? = null
    )

    /**
     * Load and parse an EPUB file
     */
    suspend fun loadEPUB(uri: Uri): Boolean = withContext(Dispatchers.IO) {
        try {
            _readerState.value = _readerState.value.copy(
                isLoaded = false,
                error = null
            )

            // Copy EPUB to temp file for processing
            val tempFile = File(context.cacheDir, "temp_epub_${System.currentTimeMillis()}.epub")
            context.contentResolver.openInputStream(uri)?.use { input ->
                FileOutputStream(tempFile).use { output ->
                    input.copyTo(output)
                }
            }

            val zipFile = ZipFile(tempFile)

            // Parse container.xml to find content.opf
            val containerEntry = zipFile.getEntry("META-INF/container.xml")
            val containerXml = zipFile.getInputStream(containerEntry).bufferedReader().readText()
            val opfPath = parseContainerXml(containerXml)

            // Parse content.opf for metadata and spine
            val opfEntry = zipFile.getEntry(opfPath)
            val opfXml = zipFile.getInputStream(opfEntry).bufferedReader().readText()
            val metadata = parseOPF(opfXml)
            val spine = parseSpine(opfXml)
            val manifest = parseManifest(opfXml)

            // Build chapters from spine
            val chapters = mutableListOf<Chapter>()
            val baseDir = opfPath.substringBeforeLast("/")

            spine.forEachIndexed { index, itemRef ->
                val href = manifest[itemRef] ?: return@forEachIndexed
                val fullPath = if (baseDir.isNotEmpty()) "$baseDir/$href" else href

                val entry = zipFile.getEntry(fullPath)
                if (entry != null) {
                    val content = zipFile.getInputStream(entry).bufferedReader().readText()
                    val cleanContent = parseHTMLContent(content)
                    val title = extractChapterTitle(content) ?: "Chapter ${index + 1}"

                    chapters.add(Chapter(
                        index = index,
                        title = title,
                        href = href,
                        content = cleanContent
                    ))
                }
            }

            zipFile.close()
            tempFile.delete()

            _readerState.value = EPUBReaderState(
                isLoaded = true,
                currentChapter = 0,
                totalChapters = chapters.size,
                bookTitle = metadata.title,
                bookAuthor = metadata.author,
                chapters = chapters,
                currentContent = chapters.firstOrNull()?.content ?: "",
                error = null
            )

            true
        } catch (e: Exception) {
            _readerState.value = _readerState.value.copy(
                isLoaded = false,
                error = "Failed to load EPUB: ${e.message}"
            )
            false
        }
    }

    /**
     * Navigate to a specific chapter
     */
    fun goToChapter(chapterIndex: Int) {
        val state = _readerState.value
        if (chapterIndex in 0 until state.chapters.size) {
            _readerState.value = state.copy(
                currentChapter = chapterIndex,
                currentContent = state.chapters[chapterIndex].content
            )
        }
    }

    /**
     * Go to next chapter
     */
    fun nextChapter() {
        val state = _readerState.value
        if (state.currentChapter < state.totalChapters - 1) {
            goToChapter(state.currentChapter + 1)
        }
    }

    /**
     * Go to previous chapter
     */
    fun previousChapter() {
        val state = _readerState.value
        if (state.currentChapter > 0) {
            goToChapter(state.currentChapter - 1)
        }
    }

    /**
     * Parse container.xml to find OPF file path
     */
    private fun parseContainerXml(xml: String): String {
        val doc = Jsoup.parse(xml, "", org.jsoup.parser.Parser.xmlParser())
        val rootfile = doc.select("rootfile").first()
        return rootfile?.attr("full-path") ?: "content.opf"
    }

    /**
     * Parse OPF file for metadata
     */
    private fun parseOPF(xml: String): EPUBMetadata {
        val doc = Jsoup.parse(xml, "", org.jsoup.parser.Parser.xmlParser())
        val metadata = doc.select("metadata").first()

        return EPUBMetadata(
            title = metadata?.select("dc|title, title")?.text() ?: "Unknown Title",
            author = metadata?.select("dc|creator, creator")?.text() ?: "Unknown Author",
            publisher = metadata?.select("dc|publisher, publisher")?.text(),
            publicationDate = metadata?.select("dc|date, date")?.text(),
            identifier = metadata?.select("dc|identifier, identifier")?.text(),
            language = metadata?.select("dc|language, language")?.text(),
            description = metadata?.select("dc|description, description")?.text()
        )
    }

    /**
     * Parse spine to get reading order
     */
    private fun parseSpine(xml: String): List<String> {
        val doc = Jsoup.parse(xml, "", org.jsoup.parser.Parser.xmlParser())
        val spine = doc.select("spine").first()

        return spine?.select("itemref")?.map {
            it.attr("idref")
        } ?: emptyList()
    }

    /**
     * Parse manifest to get item references
     */
    private fun parseManifest(xml: String): Map<String, String> {
        val doc = Jsoup.parse(xml, "", org.jsoup.parser.Parser.xmlParser())
        val manifest = doc.select("manifest").first()

        val items = mutableMapOf<String, String>()
        manifest?.select("item")?.forEach { item ->
            val id = item.attr("id")
            val href = item.attr("href")
            if (id.isNotEmpty() && href.isNotEmpty()) {
                items[id] = href
            }
        }

        return items
    }

    /**
     * Parse HTML content and extract text
     */
    private fun parseHTMLContent(html: String): String {
        val doc = Jsoup.parse(html)

        // Remove script and style elements
        doc.select("script, style").remove()

        // Get text content
        val body = doc.body()
        if (body != null) {
            // Preserve paragraphs and line breaks
            body.select("br").append("\\n")
            body.select("p").prepend("\\n\\n")
            return body.text().replace("\\n", "\n")
        }

        return doc.text()
    }

    /**
     * Extract chapter title from HTML
     */
    private fun extractChapterTitle(html: String): String? {
        val doc = Jsoup.parse(html)

        // Try to find title in order of preference
        doc.select("h1").firstOrNull()?.text()?.let { return it }
        doc.select("h2").firstOrNull()?.text()?.let { return it }
        doc.select("h3").firstOrNull()?.text()?.let { return it }
        doc.select("title").firstOrNull()?.text()?.let { return it }

        return null
    }

    /**
     * Search within the EPUB
     */
    suspend fun searchInBook(query: String): List<SearchResult> = withContext(Dispatchers.IO) {
        val results = mutableListOf<SearchResult>()
        val state = _readerState.value

        if (!state.isLoaded) return@withContext results

        state.chapters.forEach { chapter ->
            val content = chapter.content.lowercase()
            val searchQuery = query.lowercase()

            var index = content.indexOf(searchQuery)
            while (index >= 0) {
                // Get context around the match
                val start = maxOf(0, index - 50)
                val end = minOf(content.length, index + query.length + 50)
                val context = "..." + content.substring(start, end) + "..."

                results.add(SearchResult(
                    chapterIndex = chapter.index,
                    chapterTitle = chapter.title,
                    context = context,
                    position = index
                ))

                index = content.indexOf(searchQuery, index + 1)
            }
        }

        results
    }

    data class SearchResult(
        val chapterIndex: Int,
        val chapterTitle: String,
        val context: String,
        val position: Int
    )

    /**
     * Get table of contents
     */
    fun getTableOfContents(): List<Chapter> {
        return _readerState.value.chapters
    }

    /**
     * Clear loaded book
     */
    fun clearBook() {
        _readerState.value = EPUBReaderState()
    }
}
