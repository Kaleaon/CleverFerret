package com.universalmedialibrary.services.reading

import com.universalmedialibrary.data.local.dao.BookSourceDao
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing custom book sources
 * Inspired by Legado's flexible source system
 */
@Singleton
class BookSourceService @Inject constructor(
    private val bookSourceDao: BookSourceDao
) {
    
    private val json = Json { 
        ignoreUnknownKeys = true
        isLenient = true
    }
    
    fun getAllBookSources(): Flow<List<BookSource>> {
        return bookSourceDao.getAllBookSources()
    }
    
    fun getEnabledBookSources(): Flow<List<BookSource>> {
        return bookSourceDao.getEnabledBookSources()
    }
    
    suspend fun getBookSourceById(sourceId: Long): BookSource? {
        return bookSourceDao.getBookSourceById(sourceId)
    }
    
    suspend fun addBookSource(bookSource: BookSource): Long {
        return bookSourceDao.insertBookSource(bookSource)
    }
    
    suspend fun updateBookSource(bookSource: BookSource) {
        bookSourceDao.updateBookSource(bookSource)
    }
    
    suspend fun deleteBookSource(bookSource: BookSource) {
        bookSourceDao.deleteBookSource(bookSource)
    }
    
    suspend fun toggleBookSource(sourceId: Long, enabled: Boolean) {
        bookSourceDao.setBookSourceEnabled(sourceId, enabled)
    }
    
    /**
     * Search for books across all enabled sources
     */
    suspend fun searchBooks(query: String): List<SearchResult> {
        val results = mutableListOf<SearchResult>()
        val sources = bookSourceDao.getEnabledSourceCount()
        
        // TODO: Implement actual search logic using source rules
        // This would involve:
        // 1. Parsing search rules from each source
        // 2. Making HTTP requests to source URLs
        // 3. Extracting results using XPath/Regex rules
        // 4. Aggregating results from all sources
        
        return results
    }
    
    /**
     * Get book details from a specific source
     */
    suspend fun getBookInfo(sourceId: Long, bookUrl: String): BookInfo? {
        val source = bookSourceDao.getBookSourceById(sourceId) ?: return null
        
        // TODO: Implement book info extraction
        // 1. Parse book info rules
        // 2. Fetch book page
        // 3. Extract metadata using rules
        
        return null
    }
    
    /**
     * Get table of contents for a book
     */
    suspend fun getBookChapters(sourceId: Long, bookUrl: String): List<BookChapter> {
        val source = bookSourceDao.getBookSourceById(sourceId) ?: return emptyList()
        
        // TODO: Implement TOC extraction
        // 1. Parse TOC rules
        // 2. Fetch TOC page
        // 3. Extract chapter list using rules
        
        return emptyList()
    }
    
    /**
     * Get chapter content
     */
    suspend fun getChapterContent(sourceId: Long, chapterUrl: String): String? {
        val source = bookSourceDao.getBookSourceById(sourceId) ?: return null
        
        // TODO: Implement content extraction
        // 1. Parse content rules
        // 2. Fetch chapter page
        // 3. Extract and clean content
        // 4. Apply text processing rules
        
        return null
    }
    
    /**
     * Import book sources from JSON
     */
    suspend fun importBookSources(jsonString: String): Result<Int> {
        return try {
            val sources = json.decodeFromString<List<BookSource>>(jsonString)
            bookSourceDao.insertBookSources(sources)
            Result.success(sources.size)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Export book sources to JSON
     */
    suspend fun exportBookSources(sourceIds: List<Long>? = null): String {
        val sources = if (sourceIds != null) {
            sourceIds.mapNotNull { bookSourceDao.getBookSourceById(it) }
        } else {
            // Get all sources - need to collect from Flow
            emptyList() // TODO: Implement proper collection
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