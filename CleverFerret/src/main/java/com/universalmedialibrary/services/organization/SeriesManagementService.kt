package com.universalmedialibrary.services.organization

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.Series
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing book series
 */
@Singleton
class SeriesManagementService @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {
    
    /**
     * Get all books in a series, sorted by series index
     */
    suspend fun getBooksInSeries(seriesName: String): List<MediaItem> = 
        withContext(Dispatchers.IO) {
            mediaItemDao.getBooksBySeries(seriesName)
        }
    
    /**
     * Reorder books in a series
     */
    suspend fun reorderSeries(
        seriesName: String,
        newOrder: List<Pair<Long, Float>> // itemId to new index
    ): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            newOrder.forEach { (itemId, newIndex) ->
                // Update the series index in metadata_book
                val bookMetadata = metadataDao.getMetadataBookByItemId(itemId)
                if (bookMetadata != null) {
                    metadataDao.insertMetadataBook(
                        bookMetadata.copy(seriesIndex = newIndex)
                    )
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
    suspend fun autoDetectSeries(books: List<MediaItem>): List<SeriesSuggestion> = 
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
    private fun calculateSeriesConfidence(books: List<MediaItem>): Float {
        var score = 0f
        
        // Sequential numbering in titles
        val hasNumbering = books.count { item ->
            item.title.contains(Regex("\\d+|#\\d+|Book \\d+|Vol\\.? \\d+"))
        } > books.size * 0.5
        if (hasNumbering) score += 0.5f
        
        // Similar file sizes
        val avgSize = books.map { it.size }.average()
        val similarSizes = books.count { 
            val ratio = it.size / avgSize
            ratio in 0.7..1.3
        } > books.size * 0.7
        if (similarSizes) score += 0.3f
        
        // Same media type
        val sameType = books.map { it.type }.distinct().size == 1
        if (sameType) score += 0.2f
        
        return score.coerceIn(0f, 1f)
    }
    
    /**
     * Merge books into a series
     */
    suspend fun createSeries(
        seriesName: String,
        books: List<MediaItem>
    ): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            // Find or create the series
            var seriesId = metadataDao.findSeriesByName(seriesName)
            if (seriesId == null) {
                val newSeries = Series(
                    name = seriesName,
                    sortName = seriesName,
                    mediaType = "BOOK",
                    totalItems = books.size,
                    autoDetected = true
                )
                seriesId = metadataDao.insertSeries(newSeries)
            }
            
            // Update each book with the series
            books.forEachIndexed { index, book ->
                metadataDao.updateBookWithSeries(book.itemId, seriesId)
                
                // Also update the series index
                val bookMetadata = metadataDao.getMetadataBookByItemId(book.itemId)
                if (bookMetadata != null) {
                    metadataDao.insertMetadataBook(
                        bookMetadata.copy(
                            series = seriesId.toString(),
                            seriesIndex = (index + 1).toFloat()
                        )
                    )
                }
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
    val books: List<MediaItem>,
    val confidence: Float // 0.0 to 1.0
)
