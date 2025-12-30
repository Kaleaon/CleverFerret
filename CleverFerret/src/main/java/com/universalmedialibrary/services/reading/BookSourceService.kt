package com.universalmedialibrary.services.reading

import com.universalmedialibrary.data.local.dao.BookSourceDao
import com.universalmedialibrary.data.local.entity.BookChapter
import com.universalmedialibrary.data.local.entity.BookSource
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.withContext
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing custom book sources similar to Legado's implementation.
 *
 * NOTE: Network rule execution is not fully implemented yet; this service focuses on
 * persistence, enablement, and import/export of source definitions. Search/content
 * fetching logic can be layered on top using the stored rules.
 */
@Singleton
class BookSourceService @Inject constructor(
    private val bookSourceDao: BookSourceDao
) {

    private val json = Json {
        ignoreUnknownKeys = true
        isLenient = true
    }

    fun getAllBookSources(): Flow<List<BookSource>> = bookSourceDao.getAllBookSources()

    fun getEnabledBookSources(): Flow<List<BookSource>> = bookSourceDao.getEnabledBookSources()

    suspend fun getBookSourceById(sourceId: Long): BookSource? =
        bookSourceDao.getBookSourceById(sourceId)

    suspend fun addBookSource(bookSource: BookSource): Long =
        bookSourceDao.insertBookSource(bookSource)

    suspend fun addBookSources(bookSources: List<BookSource>) =
        bookSourceDao.insertBookSources(bookSources)

    suspend fun updateBookSource(bookSource: BookSource) =
        bookSourceDao.updateBookSource(bookSource)

    suspend fun deleteBookSource(bookSource: BookSource) =
        bookSourceDao.deleteBookSource(bookSource)

    suspend fun toggleBookSource(sourceId: Long, enabled: Boolean) =
        bookSourceDao.setBookSourceEnabled(sourceId, enabled)

    /**
     * Search books using enabled book sources with rule execution and scraping logic.
     */
    suspend fun searchBooks(query: String): List<SearchResult> = withContext(Dispatchers.IO) {
        val enabledSources = getEnabledBookSources().firstOrNull() ?: emptyList()
        val results = mutableListOf<SearchResult>()
        
        for (source in enabledSources) {
            try {
                val searchResults = executeSearchRule(source, query)
                results.addAll(searchResults)
            } catch (e: Exception) {
                e.printStackTrace()
                // Continue with other sources on error
            }
        }
        
        results
    }

    /**
     * Fetch book details using rules and web scraping.
     */
    suspend fun getBookInfo(sourceId: Long, bookUrl: String): BookInfo? = withContext(Dispatchers.IO) {
        try {
            val source = getBookSourceById(sourceId) ?: return@withContext null
            executeBookInfoRule(source, bookUrl)
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    /**
     * Fetch table of contents using rules and web scraping.
     */
    suspend fun getBookChapters(sourceId: Long, bookUrl: String): List<BookChapter> = withContext(Dispatchers.IO) {
        try {
            val source = getBookSourceById(sourceId) ?: return@withContext emptyList()
            executeChapterListRule(source, bookUrl)
        } catch (e: Exception) {
            e.printStackTrace()
            emptyList()
        }
    }

    /**
     * Fetch chapter content using rules and web scraping.
     */
    suspend fun getChapterContent(sourceId: Long, chapterUrl: String): String? = withContext(Dispatchers.IO) {
        try {
            val source = getBookSourceById(sourceId) ?: return@withContext null
            executeChapterContentRule(source, chapterUrl)
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    suspend fun importBookSources(jsonString: String): Result<Int> = runCatching {
        val sources = json.decodeFromString<List<BookSource>>(jsonString)
        bookSourceDao.insertBookSources(sources)
        sources.size
    }

    suspend fun exportBookSources(sourceIds: List<Long>? = null): String {
        val sources: List<BookSource> = if (sourceIds != null) {
            sourceIds.mapNotNull { bookSourceDao.getBookSourceById(it) }
        } else {
            bookSourceDao.getAllBookSources().firstOrNull() ?: emptyList()
        }
        return json.encodeToString(sources)
    }
}

data class SearchResult(
    val sourceName: String,
    val bookName: String,
    val author: String?,
    val coverUrl: String?,
    val bookUrl: String,
    val intro: String?,
    val kind: String?
)

data class BookInfo(
    val name: String,
    val author: String?,
    val intro: String?,
    val coverUrl: String?,
    val kind: String?,
    val lastChapter: String?,
    val wordCount: String?,
    val tocUrl: String?
)

// Rule execution implementations

/**
 * Execute search rule for a book source
 */
private suspend fun executeSearchRule(source: BookSource, query: String): List<SearchResult> {
    return try {
        // Build search URL with query parameter
        val searchUrl = source.searchUrl.replace("{query}", query.trim().replace(" ", "+"))
        val doc = Jsoup.connect(searchUrl)
            .userAgent("Mozilla/5.0")
            .timeout(10000)
            .get()
        
        // Extract search results using CSS selectors
        val results = mutableListOf<SearchResult>()
        val bookElements = doc.select(source.bookListSelector)
        
        for (element in bookElements) {
            val titleElement = element.selectFirst(source.bookTitleSelector)
            val authorElement = element.selectFirst(source.bookAuthorSelector)
            val coverElement = element.selectFirst(source.bookCoverSelector)
            val linkElement = element.selectFirst(source.bookUrlSelector)
            
            val title = titleElement?.text()?.trim() ?: continue
            val author = authorElement?.text()?.trim()
            val coverUrl = coverElement?.attr("src") ?: coverElement?.attr("data-src")
            val bookUrl = linkElement?.attr("href") ?: continue
            
            // Make URL absolute if relative
            val absoluteBookUrl = if (bookUrl.startsWith("http")) {
                bookUrl
            } else {
                "${source.baseUrl}$bookUrl"
            }
            
            val absoluteCoverUrl = if (!coverUrl.isNullOrEmpty()) {
                if (coverUrl.startsWith("http")) coverUrl else "${source.baseUrl}$coverUrl"
            } else null
            
            results.add(SearchResult(
                sourceName = source.name,
                bookName = title,
                author = author,
                coverUrl = absoluteCoverUrl,
                bookUrl = absoluteBookUrl,
                intro = null, // Can be extracted later if needed
                kind = null
            ))
        }
        
        results
    } catch (e: Exception) {
        e.printStackTrace()
        emptyList()
    }
}

/**
 * Execute book info rule for detailed book information
 */
private suspend fun executeBookInfoRule(source: BookSource, bookUrl: String): BookInfo? {
    return try {
        val doc = Jsoup.connect(bookUrl)
            .userAgent("Mozilla/5.0")
            .timeout(10000)
            .get()
        
        val name = doc.selectFirst(source.bookTitleSelector)?.text()?.trim()
        val author = doc.selectFirst(source.bookAuthorSelector)?.text()?.trim()
        val intro = doc.selectFirst(source.bookIntroSelector)?.text()?.trim()
        val coverUrl = doc.selectFirst(source.bookCoverSelector)?.attr("src")
        val lastChapter = doc.selectFirst(source.lastChapterSelector)?.text()?.trim()
        val wordCount = doc.selectFirst(source.wordCountSelector)?.text()?.trim()
        
        BookInfo(
            name = name ?: "",
            author = author,
            intro = intro,
            coverUrl = coverUrl,
            kind = null, // Can be extracted if needed
            lastChapter = lastChapter,
            wordCount = wordCount,
            tocUrl = bookUrl // Usually same as book URL for chapter list
        )
    } catch (e: Exception) {
        e.printStackTrace()
        null
    }
}

/**
 * Execute chapter list rule to get table of contents
 */
private suspend fun executeChapterListRule(source: BookSource, bookUrl: String): List<BookChapter> {
    return try {
        val doc = Jsoup.connect(bookUrl)
            .userAgent("Mozilla/5.0")
            .timeout(10000)
            .get()
        
        val chapters = mutableListOf<BookChapter>()
        val chapterElements = doc.select(source.chapterListSelector)
        
        for ((index, element) in chapterElements.withIndex()) {
            val titleElement = element.selectFirst(source.chapterTitleSelector)
            val linkElement = element.selectFirst(source.chapterUrlSelector)
            
            val title = titleElement?.text()?.trim() ?: continue
            val chapterUrl = linkElement?.attr("href") ?: continue
            
            // Make URL absolute if relative
            val absoluteChapterUrl = if (chapterUrl.startsWith("http")) {
                chapterUrl
            } else {
                "${source.baseUrl}$chapterUrl"
            }
            
            chapters.add(BookChapter(
                sourceId = source.sourceId,
                bookUrl = bookUrl,
                chapterUrl = absoluteChapterUrl,
                title = title,
                index = index,
                isVip = false, // Default value
                updateTime = System.currentTimeMillis(),
                isLoaded = false
            ))
        }
        
        chapters
    } catch (e: Exception) {
        e.printStackTrace()
        emptyList()
    }
}

/**
 * Execute chapter content rule to get chapter text
 */
private suspend fun executeChapterContentRule(source: BookSource, chapterUrl: String): String? {
    return try {
        val doc = Jsoup.connect(chapterUrl)
            .userAgent("Mozilla/5.0")
            .timeout(10000)
            .get()
        
        // Remove unwanted elements
        source.removeTags?.split(",")?.forEach { tag ->
            doc.select(tag.trim()).remove()
        }
        
        // Extract content
        val contentElement = doc.selectFirst(source.contentSelector)
        contentElement?.html()?.trim()
    } catch (e: Exception) {
        e.printStackTrace()
        null
    }
}
