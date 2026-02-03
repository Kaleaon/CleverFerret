package com.universalmedialibrary.services.reading

import com.universalmedialibrary.data.local.dao.BookSourceDao
import com.universalmedialibrary.data.local.entity.BookChapter
import com.universalmedialibrary.data.local.entity.BookSource
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive
import okhttp3.FormBody
import okhttp3.OkHttpClient
import okhttp3.Request
import org.jsoup.Jsoup
import java.net.URL
import java.net.URLEncoder
import java.nio.charset.Charset
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
    private val bookSourceDao: BookSourceDao,
    private val httpClient: OkHttpClient
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
     * Search enabled sources using rule-based extraction.
     */
    suspend fun searchBooks(query: String): List<SearchResult> {
        val sources = bookSourceDao.getEnabledBookSources().firstOrNull().orEmpty()
        if (sources.isEmpty()) return emptyList()

        val results = mutableListOf<SearchResult>()
        val encodedQuery = URLEncoder.encode(query, Charsets.UTF_8.name())

        sources.forEach { source ->
            val rule = parseSearchRule(source.searchRule)
            val searchUrl = buildSearchUrl(rule?.url ?: source.searchUrl, encodedQuery) ?: return@forEach
            val response = fetchContent(
                url = searchUrl,
                method = rule?.method ?: "GET",
                headers = parseHeaders(source.header),
                charset = rule?.charset
            ) ?: return@forEach

            val document = Jsoup.parse(response, searchUrl)
            val listSelector = rule?.bookList ?: return@forEach

            document.select(listSelector).forEach { element ->
                val bookName = extractText(element, rule.name)
                val author = extractText(element, rule.author)
                val coverUrl = extractUrl(element, rule.coverUrl, source.sourceUrl)
                val bookUrl = extractUrl(element, rule.bookUrl, source.sourceUrl)
                val intro = extractText(element, rule.intro)
                val kind = extractText(element, rule.kind)

                if (bookName.isNotBlank() && !bookUrl.isNullOrBlank()) {
                    results.add(
                        SearchResult(
                            sourceName = source.sourceName,
                            bookName = bookName,
                            author = author,
                            coverUrl = coverUrl,
                            bookUrl = bookUrl,
                            intro = intro,
                            kind = kind
                        )
                    )
                }
            }
        }

        return results
    }

    /**
     * Fetch book details using the configured rules.
     */
    suspend fun getBookInfo(sourceId: Long, bookUrl: String): BookInfo? {
        val source = bookSourceDao.getBookSourceById(sourceId) ?: return null
        val rule = parseBookInfoRule(source.bookInfoRule) ?: return null
        val response = fetchContent(
            url = bookUrl,
            method = "GET",
            headers = parseHeaders(source.header)
        ) ?: return null

        val document = Jsoup.parse(response, bookUrl)

        return BookInfo(
            name = extractText(document, rule.name),
            author = extractText(document, rule.author),
            intro = extractText(document, rule.intro),
            coverUrl = extractUrl(document, rule.coverUrl, source.sourceUrl),
            kind = extractText(document, rule.kind),
            lastChapter = extractText(document, rule.lastChapter),
            wordCount = extractText(document, rule.wordCount),
            tocUrl = extractUrl(document, rule.tocUrl, source.sourceUrl)
        )
    }

    /**
     * Fetch table of contents using the configured rules.
     */
    suspend fun getBookChapters(sourceId: Long, bookUrl: String): List<BookChapter> {
        val source = bookSourceDao.getBookSourceById(sourceId) ?: return emptyList()
        val rule = parseTocRule(source.tocRule) ?: return emptyList()
        val response = fetchContent(
            url = bookUrl,
            method = "GET",
            headers = parseHeaders(source.header)
        ) ?: return emptyList()

        val document = Jsoup.parse(response, bookUrl)
        val chapters = mutableListOf<BookChapter>()

        document.select(rule.chapterList).forEachIndexed { index, element ->
            val chapterName = extractText(element, rule.chapterName).ifBlank { "Chapter ${index + 1}" }
            val chapterUrl = extractUrl(element, rule.chapterUrl, source.sourceUrl)

            chapters.add(
                BookChapter(
                    bookId = 0,
                    chapterIndex = index,
                    chapterName = chapterName,
                    chapterUrl = chapterUrl
                )
            )
        }

        return chapters
    }

    /**
     * Fetch chapter content using the configured rules.
     */
    suspend fun getChapterContent(sourceId: Long, chapterUrl: String): String? {
        val source = bookSourceDao.getBookSourceById(sourceId) ?: return null
        val rule = parseContentRule(source.contentRule) ?: return null
        val response = fetchContent(
            url = chapterUrl,
            method = "GET",
            headers = parseHeaders(source.header)
        ) ?: return null

        val document = Jsoup.parse(response, chapterUrl)
        val contentElement = document.selectFirst(rule.content)
        var content = contentElement?.html() ?: return null

        rule.replaceRegex?.let { replace ->
            val parts = replace.split("=>", limit = 2)
            if (parts.size == 2) {
                content = content.replace(parts[0].toRegex(), parts[1])
            }
        }

        return content
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

    private fun buildSearchUrl(template: String?, encodedQuery: String): String? {
        if (template.isNullOrBlank()) return null
        return template
            .replace("{{key}}", encodedQuery)
            .replace("{{keyword}}", encodedQuery)
            .replace("{key}", encodedQuery)
            .replace("{keyword}", encodedQuery)
            .replace("%s", encodedQuery)
    }

    private fun parseHeaders(header: String?): Map<String, String> {
        if (header.isNullOrBlank()) return emptyMap()
        val result = mutableMapOf<String, String>()

        val trimmed = header.trim()
        if (trimmed.startsWith("{") && trimmed.endsWith("}")) {
            runCatching {
                val obj = json.parseToJsonElement(trimmed).jsonObject
                obj.forEach { (key, value) ->
                    result[key] = value.jsonPrimitive.content
                }
            }
            return result
        }

        trimmed.lines().forEach { line ->
            val parts = line.split(":", limit = 2)
            if (parts.size == 2) {
                result[parts[0].trim()] = parts[1].trim()
            }
        }
        return result
    }

    private fun fetchContent(
        url: String,
        method: String,
        headers: Map<String, String>,
        charset: String? = null
    ): String? {
        val requestBuilder = Request.Builder().url(url)
        headers.forEach { (key, value) -> requestBuilder.addHeader(key, value) }

        val resolvedMethod = method.uppercase()
        if (resolvedMethod == "POST") {
            requestBuilder.post(FormBody.Builder().build())
        } else {
            requestBuilder.get()
        }

        httpClient.newCall(requestBuilder.build()).execute().use { response ->
            if (!response.isSuccessful) return null
            val body = response.body ?: return null
            val bytes = body.bytes()
            val effectiveCharset = charset?.let { runCatching { Charset.forName(it) }.getOrNull() } ?: Charsets.UTF_8
            return bytes.toString(effectiveCharset)
        }
    }

    private fun extractText(element: org.jsoup.nodes.Element, selector: String?): String {
        if (selector.isNullOrBlank()) return ""
        val trimmed = selector.trim()
        if (trimmed == "text" || trimmed == "self") {
            return element.text().trim()
        }
        val target = element.selectFirst(trimmed) ?: return ""
        return target.text().trim()
    }

    private fun extractText(document: org.jsoup.nodes.Document, selector: String?): String {
        if (selector.isNullOrBlank()) return ""
        val target = document.selectFirst(selector.trim()) ?: return ""
        return target.text().trim()
    }

    private fun extractUrl(
        element: org.jsoup.nodes.Element,
        selector: String?,
        baseUrl: String?
    ): String? {
        if (selector.isNullOrBlank()) return null
        val trimmed = selector.trim()
        val (css, attr) = splitSelector(trimmed)
        val target = if (css.isNullOrBlank()) element else element.selectFirst(css)
        val raw = if (attr != null) target?.attr(attr) else target?.text()
        val url = raw?.trim().orEmpty()
        if (url.isBlank()) return null
        return resolveUrl(baseUrl, url)
    }

    private fun extractUrl(
        document: org.jsoup.nodes.Document,
        selector: String?,
        baseUrl: String?
    ): String? {
        if (selector.isNullOrBlank()) return null
        val trimmed = selector.trim()
        val (css, attr) = splitSelector(trimmed)
        val target = if (css.isNullOrBlank()) document else document.selectFirst(css)
        val raw = if (attr != null) target?.attr(attr) else target?.text()
        val url = raw?.trim().orEmpty()
        if (url.isBlank()) return null
        return resolveUrl(baseUrl, url)
    }

    private fun splitSelector(selector: String): Pair<String?, String?> {
        return if (selector.contains("@")) {
            val parts = selector.split("@", limit = 2)
            parts[0].takeIf { it.isNotBlank() } to parts[1].takeIf { it.isNotBlank() }
        } else {
            selector to null
        }
    }

    private fun resolveUrl(baseUrl: String?, candidate: String): String {
        if (candidate.startsWith("http://") || candidate.startsWith("https://")) {
            return candidate
        }
        return try {
            if (!baseUrl.isNullOrBlank()) {
                URL(URL(baseUrl), candidate).toString()
            } else {
                candidate
            }
        } catch (_: Exception) {
            candidate
        }
    }

    private fun parseSearchRule(ruleJson: String?): ParsedSearchRule? =
        parseRule(ruleJson)?.toSearchRule()

    private fun parseBookInfoRule(ruleJson: String?): ParsedBookInfoRule? =
        parseRule(ruleJson)?.toBookInfoRule()

    private fun parseTocRule(ruleJson: String?): ParsedTocRule? =
        parseRule(ruleJson)?.toTocRule()

    private fun parseContentRule(ruleJson: String?): ParsedContentRule? =
        parseRule(ruleJson)?.toContentRule()

    private fun parseRule(ruleJson: String?): RulePayload? {
        if (ruleJson.isNullOrBlank()) return null
        val jsonElement = runCatching { json.parseToJsonElement(ruleJson) }.getOrNull() ?: return null
        val obj = jsonElement.jsonObject
        return RulePayload(obj)
    }
}

private data class RulePayload(val data: JsonObject) {
    private fun read(key: String): String? = data[key]?.jsonPrimitive?.contentOrNull

    fun toSearchRule(): ParsedSearchRule? {
        val bookList = read("bookList") ?: return null
        return ParsedSearchRule(
            url = read("url"),
            method = read("method") ?: "GET",
            charset = read("charset"),
            bookList = bookList,
            name = read("name") ?: "",
            author = read("author"),
            coverUrl = read("coverUrl"),
            intro = read("intro"),
            bookUrl = read("bookUrl"),
            kind = read("kind")
        )
    }

    fun toBookInfoRule(): ParsedBookInfoRule? {
        val name = read("name") ?: return null
        return ParsedBookInfoRule(
            name = name,
            author = read("author"),
            intro = read("intro"),
            coverUrl = read("coverUrl"),
            kind = read("kind"),
            lastChapter = read("lastChapter"),
            tocUrl = read("tocUrl"),
            wordCount = read("wordCount")
        )
    }

    fun toTocRule(): ParsedTocRule? {
        val chapterList = read("chapterList") ?: return null
        val chapterName = read("chapterName") ?: return null
        val chapterUrl = read("chapterUrl") ?: return null
        return ParsedTocRule(
            chapterList = chapterList,
            chapterName = chapterName,
            chapterUrl = chapterUrl
        )
    }

    fun toContentRule(): ParsedContentRule? {
        val content = read("content") ?: return null
        return ParsedContentRule(
            content = content,
            replaceRegex = read("replaceRegex")
        )
    }
}

private data class ParsedSearchRule(
    val url: String?,
    val method: String,
    val charset: String?,
    val bookList: String,
    val name: String,
    val author: String?,
    val coverUrl: String?,
    val intro: String?,
    val bookUrl: String?,
    val kind: String?
)

private data class ParsedBookInfoRule(
    val name: String,
    val author: String?,
    val intro: String?,
    val coverUrl: String?,
    val kind: String?,
    val lastChapter: String?,
    val tocUrl: String?,
    val wordCount: String?
)

private data class ParsedTocRule(
    val chapterList: String,
    val chapterName: String,
    val chapterUrl: String
)

private data class ParsedContentRule(
    val content: String,
    val replaceRegex: String?
)

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
