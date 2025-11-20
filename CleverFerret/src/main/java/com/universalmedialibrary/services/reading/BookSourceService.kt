package com.universalmedialibrary.services.reading

import com.universalmedialibrary.data.local.dao.BookSourceDao
import com.universalmedialibrary.data.local.entity.BookChapter
import com.universalmedialibrary.data.local.entity.BookSource
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
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
     * Placeholder for future implementation of network-backed source search.
     */
    suspend fun searchBooks(query: String): List<SearchResult> {
        // TODO: Implement rule execution and scraping logic.
        return emptyList()
    }

    /**
     * Placeholder for fetching book details using rules.
     */
    suspend fun getBookInfo(sourceId: Long, bookUrl: String): BookInfo? {
        // TODO: Implement rule execution to fetch book info.
        return null
    }

    /**
     * Placeholder for fetching table of contents using rules.
     */
    suspend fun getBookChapters(sourceId: Long, bookUrl: String): List<BookChapter> {
        // TODO: Implement rule execution to fetch chapters.
        return emptyList()
    }

    /**
     * Placeholder for fetching chapter content using rules.
     */
    suspend fun getChapterContent(sourceId: Long, chapterUrl: String): String? {
        // TODO: Implement rule execution to fetch chapter content.
        return null
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
