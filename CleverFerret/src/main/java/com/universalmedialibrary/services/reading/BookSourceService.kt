package com.universalmedialibrary.services.reading

import android.util.Log
import com.universalmedialibrary.data.local.dao.BookSourceDao
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
import org.jsoup.nodes.Element
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

private const val TAG = "BookSourceService"

/**
 * Service for managing custom book sources similar to Legado's implementation.
 *
 * Supports rule-based web scraping for:
 * - Searching books across multiple sources
 * - Fetching book information and metadata
 * - Retrieving table of contents
 * - Extracting chapter content
 */
@Singleton
class BookSourceService @Inject constructor(
    private val bookSourceDao: BookSourceDao
) {

    private val json = Json {
        ignoreUnknownKeys = true
        isLenient = true
    }
    
    private val defaultUserAgent = "Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36"

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
     * Search books across all enabled sources using their search rules.
     */
    suspend fun searchBooks(query: String): List<SearchResult> = withContext(Dispatchers.IO) {
        val results = mutableListOf<SearchResult>()
        val enabledSources = bookSourceDao.getEnabledBookSources().firstOrNull() ?: return@withContext emptyList()
        
        for (source in enabledSources) {
            try {
                val sourceResults = searchBooksInSource(source, query)
                results.addAll(sourceResults)
            } catch (e: Exception) {
                Log.e(TAG, "Error searching source ${source.sourceName}: ${e.message}")
            }
        }
        
        results
    }
    
    /**
     * Search books in a specific source
     */
    private suspend fun searchBooksInSource(source: BookSource, query: String): List<SearchResult> {
        val sourceSearchUrl = source.searchUrl ?: return emptyList()
        if (sourceSearchUrl.isBlank()) return emptyList()
        
        val searchUrl = sourceSearchUrl
            .replace("{{key}}", URLEncoder.encode(query, "UTF-8"))
            .replace("{{page}}", "1")
        
        val doc = fetchDocument(searchUrl, source)
        val searchRule = source.searchRule ?: return emptyList()
        
        if (searchRule.isBlank()) return emptyList()
        
        // Parse search rule (simplified Legado-style rule parsing)
        val ruleConfig = parseRules(searchRule)
        val bookList = ruleConfig["bookList"]?.let { doc.select(it) } ?: return emptyList()
        
        return bookList.mapNotNull { element ->
            try {
                SearchResult(
                    sourceName = source.sourceName,
                    bookName = extractText(element, ruleConfig["name"]) ?: "Unknown",
                    author = extractText(element, ruleConfig["author"]),
                    coverUrl = extractAttr(element, ruleConfig["coverUrl"], "src") 
                        ?: extractAttr(element, ruleConfig["coverUrl"], "data-src"),
                    bookUrl = extractAttr(element, ruleConfig["bookUrl"], "href") 
                        ?: extractText(element, ruleConfig["bookUrl"]) ?: "",
                    intro = extractText(element, ruleConfig["intro"]),
                    kind = extractText(element, ruleConfig["kind"])
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error parsing search result: ${e.message}")
                null
            }
        }
    }

    /**
     * Fetch book details using source rules.
     */
    suspend fun getBookInfo(sourceId: Long, bookUrl: String): BookInfo? = withContext(Dispatchers.IO) {
        val source = bookSourceDao.getBookSourceById(sourceId) ?: return@withContext null
        
        try {
            val doc = fetchDocument(bookUrl, source)
            val infoRule = source.bookInfoRule ?: return@withContext null
            
            if (infoRule.isBlank()) return@withContext null
            
            val ruleConfig = parseRules(infoRule)
            
            BookInfo(
                name = extractText(doc, ruleConfig["name"]) ?: "Unknown",
                author = extractText(doc, ruleConfig["author"]),
                intro = extractText(doc, ruleConfig["intro"]),
                coverUrl = extractAttr(doc, ruleConfig["coverUrl"], "src")
                    ?: extractAttr(doc, ruleConfig["coverUrl"], "data-src"),
                kind = extractText(doc, ruleConfig["kind"]),
                lastChapter = extractText(doc, ruleConfig["lastChapter"]),
                wordCount = extractText(doc, ruleConfig["wordCount"]),
                tocUrl = extractAttr(doc, ruleConfig["tocUrl"], "href") ?: bookUrl
            )
        } catch (e: Exception) {
            Log.e(TAG, "Error fetching book info: ${e.message}")
            null
        }
    }

    /**
     * Fetch table of contents using source rules.
     * Note: Returns a list of BookChapterInfo since BookChapter entity requires bookId.
     */
    suspend fun getBookChapters(sourceId: Long, bookUrl: String): List<BookChapterInfo> = withContext(Dispatchers.IO) {
        val source = bookSourceDao.getBookSourceById(sourceId) ?: return@withContext emptyList()
        
        try {
            val doc = fetchDocument(bookUrl, source)
            val tocRule = source.tocRule ?: return@withContext emptyList()
            
            if (tocRule.isBlank()) return@withContext emptyList()
            
            val ruleConfig = parseRules(tocRule)
            val chapterList = ruleConfig["chapterList"]?.let { doc.select(it) } ?: return@withContext emptyList()
            
            chapterList.mapIndexedNotNull { index, element ->
                try {
                    val title = extractText(element, ruleConfig["chapterName"]) ?: "Chapter ${index + 1}"
                    val url = extractAttr(element, ruleConfig["chapterUrl"], "href") ?: return@mapIndexedNotNull null
                    
                    BookChapterInfo(
                        chapterIndex = index,
                        chapterName = title,
                        chapterUrl = resolveUrl(bookUrl, url)
                    )
                } catch (e: Exception) {
                    null
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error fetching chapters: ${e.message}")
            emptyList()
        }
    }

    /**
     * Fetch chapter content using source rules.
     */
    suspend fun getChapterContent(sourceId: Long, chapterUrl: String): String? = withContext(Dispatchers.IO) {
        val source = bookSourceDao.getBookSourceById(sourceId) ?: return@withContext null
        
        try {
            val doc = fetchDocument(chapterUrl, source)
            val contentRuleStr = source.contentRule ?: return@withContext null
            
            if (contentRuleStr.isBlank()) return@withContext null
            
            val ruleConfig = parseRules(contentRuleStr)
            val contentSelector = ruleConfig["content"] ?: return@withContext null
            
            val contentElement = doc.selectFirst(contentSelector)
            
            // Clean up content
            contentElement?.let { element ->
                // Remove unwanted elements
                ruleConfig["replaceRegex"]?.let { regex ->
                    element.html().replace(Regex(regex), "")
                } ?: element.html()
                    .replace(Regex("<script[^>]*>.*?</script>", RegexOption.DOT_MATCHES_ALL), "")
                    .replace(Regex("<style[^>]*>.*?</style>", RegexOption.DOT_MATCHES_ALL), "")
                    .replace(Regex("<!--.*?-->", RegexOption.DOT_MATCHES_ALL), "")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error fetching chapter content: ${e.message}")
            null
        }
    }
    
    // ==================== Helper Functions ====================
    
    private fun fetchDocument(url: String, source: BookSource): Document {
        return Jsoup.connect(url)
            .userAgent(source.header?.takeIf { it.isNotBlank() } ?: defaultUserAgent)
            .timeout(15000)
            .get()
    }
    
    /**
     * Parse rule string into a map of rule configurations
     * Format: "bookList@.book-item\nname@.title\nauthor@.author"
     */
    private fun parseRules(ruleString: String): Map<String, String> {
        return ruleString.split("\n")
            .filter { it.contains("@") }
            .associate { line ->
                val parts = line.split("@", limit = 2)
                parts[0].trim() to parts.getOrElse(1) { "" }.trim()
            }
    }
    
    private fun extractText(element: Element, selector: String?): String? {
        if (selector.isNullOrBlank()) return null
        return element.selectFirst(selector)?.text()?.trim()
    }
    
    private fun extractText(doc: Document, selector: String?): String? {
        if (selector.isNullOrBlank()) return null
        return doc.selectFirst(selector)?.text()?.trim()
    }
    
    private fun extractAttr(element: Element, selector: String?, attr: String): String? {
        if (selector.isNullOrBlank()) return null
        return element.selectFirst(selector)?.attr(attr)?.trim()?.takeIf { it.isNotBlank() }
    }
    
    private fun extractAttr(doc: Document, selector: String?, attr: String): String? {
        if (selector.isNullOrBlank()) return null
        return doc.selectFirst(selector)?.attr(attr)?.trim()?.takeIf { it.isNotBlank() }
    }
    
    private fun resolveUrl(baseUrl: String, relativeUrl: String): String {
        return when {
            relativeUrl.startsWith("http") -> relativeUrl
            relativeUrl.startsWith("//") -> "https:$relativeUrl"
            relativeUrl.startsWith("/") -> {
                val baseUri = java.net.URI(baseUrl)
                "${baseUri.scheme}://${baseUri.host}$relativeUrl"
            }
            else -> {
                val base = baseUrl.substringBeforeLast("/")
                "$base/$relativeUrl"
            }
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

/**
 * Chapter info from web scraping - separate from BookChapter entity
 */
data class BookChapterInfo(
    val chapterIndex: Int,
    val chapterName: String,
    val chapterUrl: String
)
