package com.universalmedialibrary.services.epub

import android.content.Context
import android.net.Uri
import com.universalmedialibrary.services.media.DocumentContent
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.io.File
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Canonical EPUB reader service.
 */
@Singleton
class EpubReaderService @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private val _readerState = MutableStateFlow(EpubReaderState())
    val readerState: StateFlow<EpubReaderState> = _readerState.asStateFlow()

    private var currentEpub: EpubBook? = null
    private var currentChapters: List<EpubChapter> = emptyList()

    suspend fun loadEPUB(uri: Uri): Boolean = withContext(Dispatchers.IO) {
        try {
            updateReaderState(isLoading = true, error = null)

            val file = when (uri.scheme) {
                "file" -> File(uri.path ?: "")
                "content" -> {
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
                updateReaderState(isLoading = false, error = "File not found")
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
                    currentChapter = 0,
                    currentContent = epub.chapters.firstOrNull()?.content.orEmpty(),
                    error = null
                )
                true
            } else {
                updateReaderState(isLoading = false, error = "Failed to parse EPUB file")
                false
            }

        } catch (e: Exception) {
            updateReaderState(isLoading = false, error = "Failed to load EPUB: ${e.message}")
            false
        }
    }

    suspend fun loadEPUB(file: File): Boolean = loadEPUB(Uri.fromFile(file))

    private fun parseEpubFile(file: File): EpubBook? {
        return try {
            ZipFile(file).use { zipFile ->
                val contentOpf = findContentOpf(zipFile) ?: return null
                val opfContent = zipFile.getInputStream(contentOpf).bufferedReader(Charsets.UTF_8).readText()

                val metadata = EpubPackageParser.parseMetadata(opfContent)
                val manifestItems = EpubPackageParser.parseManifest(opfContent)
                val spineItems = EpubPackageParser.parseSpine(opfContent)
                val tocItems = parseToc(zipFile, manifestItems)
                val chapters = extractChapters(zipFile, contentOpf, spineItems, manifestItems, tocItems)

                EpubBook(metadata = metadata, chapters = chapters)
            }
        } catch (_: Exception) {
            null
        }
    }

    private fun findContentOpf(zipFile: ZipFile): ZipEntry? {
        val containerEntry = zipFile.getEntry("META-INF/container.xml")
        if (containerEntry != null) {
            val containerContent = zipFile.getInputStream(containerEntry).bufferedReader(Charsets.UTF_8).readText()
            val containerDoc = Jsoup.parse(containerContent, "", org.jsoup.parser.Parser.xmlParser())
            val rootfilePath = containerDoc.select("rootfile").attr("full-path")
            if (rootfilePath.isNotEmpty()) {
                return zipFile.getEntry(rootfilePath)
            }
        }

        return zipFile.getEntry("content.opf")
            ?: zipFile.getEntry("OEBPS/content.opf")
            ?: zipFile.getEntry("OPS/content.opf")
    }

    private fun parseToc(zipFile: ZipFile, manifestItems: Map<String, ManifestItem>): List<SimpleTocItem> {
        val tocManifest = manifestItems.values.find {
            it.mediaType == "application/x-dtbncx+xml" || it.href.endsWith("toc.ncx")
        }

        if (tocManifest != null) {
            val tocEntry = zipFile.getEntry(tocManifest.href)
            if (tocEntry != null) {
                val tocContent = zipFile.getInputStream(tocEntry).bufferedReader(Charsets.UTF_8).readText()
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

    private fun extractChapters(
        zipFile: ZipFile,
        contentOpf: ZipEntry,
        spineItems: List<String>,
        manifestItems: Map<String, ManifestItem>,
        tocItems: List<SimpleTocItem>
    ): List<EpubChapter> {
        val chapters = mutableListOf<EpubChapter>()
        val opfDir = contentOpf.name.substringBeforeLast("/").takeIf { it != contentOpf.name }.orEmpty()

        spineItems.forEachIndexed { index, itemRef ->
            val manifestItem = manifestItems[itemRef] ?: return@forEachIndexed
            val fullPath = if (opfDir.isNotEmpty()) "$opfDir/${manifestItem.href}" else manifestItem.href
            val entry = zipFile.getEntry(fullPath) ?: zipFile.getEntry(manifestItem.href)

            if (entry != null) {
                zipFile.getInputStream(entry).use { inputStream ->
                    val content = inputStream.bufferedReader(Charsets.UTF_8).readText()
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

        return chapters
    }

    fun getDocumentContent(): DocumentContent? =
        if (_readerState.value.isLoaded) _readerState.value.toDocumentContent() else null

    fun nextChapter(): Boolean {
        val state = _readerState.value
        val next = EpubChapterNavigator.nextIndex(state) ?: return false
        return jumpToChapter(next)
    }

    fun previousChapter(): Boolean {
        val state = _readerState.value
        val previous = EpubChapterNavigator.previousIndex(state) ?: return false
        return jumpToChapter(previous)
    }

    fun jumpToChapter(chapterIndex: Int): Boolean {
        val state = _readerState.value
        val valid = EpubChapterNavigator.validIndex(state, chapterIndex) ?: return false
        val chapter = currentChapters.getOrNull(valid)

        updateReaderState(
            currentChapter = valid,
            currentContent = chapter?.content.orEmpty()
        )
        return true
    }

    fun goToChapter(chapterIndex: Int): Boolean = jumpToChapter(chapterIndex)

    fun getCurrentChapterContent(): String? {
        val state = _readerState.value
        return currentChapters.getOrNull(state.currentChapter)?.content
    }

    fun getChapter(index: Int): EpubChapter? = currentChapters.getOrNull(index)

    fun getBookMetadata(): SimpleEpubMetadata? = currentEpub?.metadata

    suspend fun searchInBook(query: String): List<EpubSearchResult> = withContext(Dispatchers.IO) {
        val state = _readerState.value
        if (!state.isLoaded || query.isBlank()) return@withContext emptyList()

        val searchQuery = query.lowercase()
        val results = mutableListOf<EpubSearchResult>()

        state.chapters.forEach { chapter ->
            val text = Jsoup.parse(chapter.content).text().lowercase()
            var index = text.indexOf(searchQuery)

            while (index >= 0) {
                val start = maxOf(0, index - 50)
                val end = minOf(text.length, index + searchQuery.length + 50)
                val context = "...${text.substring(start, end)}..."

                results.add(
                    EpubSearchResult(
                        chapterIndex = chapter.index,
                        chapterTitle = chapter.title,
                        context = context,
                        position = index
                    )
                )

                index = text.indexOf(searchQuery, index + 1)
            }
        }

        results
    }

    private fun updateReaderState(
        isLoading: Boolean = _readerState.value.isLoading,
        isLoaded: Boolean = _readerState.value.isLoaded,
        bookTitle: String = _readerState.value.bookTitle,
        bookAuthor: String = _readerState.value.bookAuthor,
        totalChapters: Int = _readerState.value.totalChapters,
        currentChapter: Int = _readerState.value.currentChapter,
        chapters: List<EpubChapter> = _readerState.value.chapters,
        currentContent: String = _readerState.value.currentContent,
        error: String? = _readerState.value.error
    ) {
        _readerState.value = EpubReaderState(
            isLoading = isLoading,
            isLoaded = isLoaded,
            bookTitle = bookTitle,
            bookAuthor = bookAuthor,
            totalChapters = totalChapters,
            currentChapter = currentChapter,
            chapters = chapters,
            currentContent = currentContent,
            error = error
        )
    }
}
