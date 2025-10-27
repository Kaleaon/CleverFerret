package com.universalmedialibrary.services.organization

import com.universalmedialibrary.data.local.dao.BookDao
import com.universalmedialibrary.data.local.entity.BookEntity
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing book series
 */
@Singleton
class SeriesManagementService @Inject constructor(
    private val bookDao: BookDao
) {
    
    /**
     * Get all books in a series, sorted by series index
     */
    suspend fun getBooksInSeries(seriesName: String): List<BookEntity> = 
        withContext(Dispatchers.IO) {
            // This would need a proper DAO query
            // For now, return empty list as placeholder
            emptyList()
        }
    
    /**
     * Reorder books in a series
     */
    suspend fun reorderSeries(
        seriesName: String,
        newOrder: List<Pair<String, Float>> // bookId to new index
    ): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            newOrder.forEach { (bookId, newIndex) ->
                val book = bookDao.getBook(bookId.toLong())
                book?.let {
                    val updated = it.copy(
                        seriesIndex = newIndex
                    )
                    bookDao.updateBook(updated)
                }
            }
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Auto-detect series from titles
     * e.g., "Harry Potter and the...", "The Lord of the Rings: ..."
     */
    suspend fun autoDetectSeries(books: List<BookEntity>): List<SeriesSuggestion> = 
        withContext(Dispatchers.Default) {
            val suggestions = mutableListOf<SeriesSuggestion>()
            
            // Group books by common title prefixes
            val titleGroups = books.groupBy { book ->
                extractSeriesPrefix(book.title)
            }.filter { it.key != null && it.value.size > 1 }
            
            titleGroups.forEach { (prefix, booksInSeries) ->
                if (prefix != null) {
                    val sortedBooks = booksInSeries.sortedBy { it.title }
                    suggestions.add(
                        SeriesSuggestion(
                            seriesName = prefix,
                            books = sortedBooks,
                            confidence = calculateSeriesConfidence(sortedBooks)
                        )
                    )
                }
            }
            
            suggestions.sortedByDescending { it.confidence }
        }
    
    /**
     * Extract potential series prefix from title
     */
    private fun extractSeriesPrefix(title: String): String? {
        // Match patterns like:
        // "Harry Potter and the..."
        // "The Lord of the Rings:"
        // "Foundation #1"
        
        val patterns = listOf(
            Regex("^(.+?)(?:\\s+and\\s+the|:\\s+|\\s+#\\d+|\\s+\\d+$)"),
            Regex("^(The\\s+.+?)(?:\\s+Book\\s+\\d+|\\s+-\\s+Part\\s+\\d+)"),
            Regex("^(.+?)(?:\\s+Volume\\s+\\d+|\\s+Vol\\.\\s+\\d+)")
        )
        
        patterns.forEach { pattern ->
            pattern.find(title)?.groupValues?.get(1)?.let { prefix ->
                if (prefix.length > 3) return prefix.trim()
            }
        }
        
        return null
    }
    
    /**
     * Calculate confidence that books form a series
     */
    private fun calculateSeriesConfidence(books: List<BookEntity>): Float {
        var score = 0f
        
        // Same author increases confidence
        val sameAuthor = books.map { it.author }.distinct().size == 1
        if (sameAuthor) score += 0.4f
        
        // Sequential numbering in titles
        val hasNumbering = books.count { title ->
            title.title.contains(Regex("\\d+|#\\d+|Book \\d+|Vol\\.? \\d+"))
        } > books.size * 0.5
        if (hasNumbering) score += 0.3f
        
        // Similar file sizes
        val avgSize = books.map { it.fileSize }.average()
        val similarSizes = books.count { 
            val ratio = it.fileSize / avgSize
            ratio in 0.7..1.3
        } > books.size * 0.7
        if (similarSizes) score += 0.2f
        
        // Close publication dates
        val dates = books.mapNotNull { it.publishDate }
        if (dates.size > 1) {
            // Add points if dates are sequential
            score += 0.1f
        }
        
        return score.coerceIn(0f, 1f)
    }
    
    /**
     * Merge books into a series
     */
    suspend fun createSeries(
        seriesName: String,
        books: List<BookEntity>
    ): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            books.forEachIndexed { index, book ->
                val updated = book.copy(
                    series = seriesName,
                    seriesIndex = (index + 1).toFloat()
                )
                bookDao.updateBook(updated)
            }
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}

/**
 * Suggestion for books that might form a series
 */
data class SeriesSuggestion(
    val seriesName: String,
    val books: List<BookEntity>,
    val confidence: Float // 0.0 to 1.0
)
