package com.universalmedialibrary.services.reader

import android.content.Context
import com.universalmedialibrary.data.local.dao.AnnotationDao
import com.universalmedialibrary.data.local.dao.SearchIndexDao
import com.universalmedialibrary.data.local.dao.ReadingStatisticsDao
import com.universalmedialibrary.data.local.entity.TextAnnotation
import com.universalmedialibrary.data.local.entity.SearchIndex
import com.universalmedialibrary.data.local.entity.ReadingStatistics
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing annotations, highlights, and search functionality
 */
@Singleton
class AnnotationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val annotationDao: AnnotationDao,
    private val searchIndexDao: SearchIndexDao,
    private val readingStatisticsDao: ReadingStatisticsDao
) {

    /**
     * Create a new highlight
     */
    suspend fun createHighlight(
        itemId: Long,
        chapterIndex: Int,
        chapterTitle: String?,
        startOffset: Int,
        endOffset: Int,
        selectedText: String,
        highlightColor: String = "#FFFF00",
        contextBefore: String? = null,
        contextAfter: String? = null
    ): Long = withContext(Dispatchers.IO) {
        val annotation = TextAnnotation(
            itemId = itemId,
            chapterIndex = chapterIndex,
            chapterTitle = chapterTitle,
            startOffset = startOffset,
            endOffset = endOffset,
            selectedText = selectedText,
            highlightColor = highlightColor,
            annotationType = "HIGHLIGHT",
            contextBefore = contextBefore,
            contextAfter = contextAfter
        )
        annotationDao.insertAnnotation(annotation)
    }

    /**
     * Create a new note annotation
     */
    suspend fun createNote(
        itemId: Long,
        chapterIndex: Int,
        chapterTitle: String?,
        startOffset: Int,
        endOffset: Int,
        selectedText: String,
        noteText: String,
        highlightColor: String = "#FFE4B5",
        contextBefore: String? = null,
        contextAfter: String? = null
    ): Long = withContext(Dispatchers.IO) {
        val annotation = TextAnnotation(
            itemId = itemId,
            chapterIndex = chapterIndex,
            chapterTitle = chapterTitle,
            startOffset = startOffset,
            endOffset = endOffset,
            selectedText = selectedText,
            highlightColor = highlightColor,
            annotationType = "NOTE",
            noteText = noteText,
            contextBefore = contextBefore,
            contextAfter = contextAfter
        )
        annotationDao.insertAnnotation(annotation)
    }

    /**
     * Update an existing annotation
     */
    suspend fun updateAnnotation(annotation: TextAnnotation) = withContext(Dispatchers.IO) {
        val updatedAnnotation = annotation.copy(dateModified = System.currentTimeMillis())
        annotationDao.updateAnnotation(updatedAnnotation)
    }

    /**
     * Delete an annotation
     */
    suspend fun deleteAnnotation(annotationId: Long) = withContext(Dispatchers.IO) {
        annotationDao.deleteAnnotation(annotationId)
    }

    /**
     * Get all annotations for a book
     */
    fun getAnnotationsForBook(itemId: Long): Flow<List<TextAnnotation>> {
        return annotationDao.getAnnotationsForBook(itemId)
    }

    /**
     * Get all annotations for a specific chapter
     */
    fun getAnnotationsForChapter(itemId: Long, chapterIndex: Int): Flow<List<Annotation>> {
        return annotationDao.getAnnotationsForChapter(itemId, chapterIndex)
    }

    /**
     * Get all annotations with notes
     */
    fun getAnnotationsWithNotes(): Flow<List<TextAnnotation>> {
        return annotationDao.getAnnotationsWithNotes()
    }

    /**
     * Search within a specific book  
     */
    suspend fun searchInBook(itemId: Long, query: String): List<SearchResult> = withContext(Dispatchers.IO) {
        val results = searchIndexDao.searchInBook(itemId, query.lowercase())
        results.map { indexEntry ->
            SearchResult(
                itemId = indexEntry.itemId,
                chapterIndex = indexEntry.chapterIndex,
                chapterTitle = indexEntry.chapterTitle,
                startOffset = indexEntry.startOffset,
                endOffset = indexEntry.endOffset,
                matchedText = indexEntry.originalText,
                query = query
            )
        }
    }

    /**
     * Search across all books
     */
    suspend fun searchAcrossBooks(query: String): List<SearchResult> = withContext(Dispatchers.IO) {
        val results = searchIndexDao.searchAcrossBooks(query.lowercase())
        results.map { indexEntry ->
            SearchResult(
                itemId = indexEntry.itemId,
                chapterIndex = indexEntry.chapterIndex,
                chapterTitle = indexEntry.chapterTitle,
                startOffset = indexEntry.startOffset,
                endOffset = indexEntry.endOffset,
                matchedText = indexEntry.originalText,
                query = query
            )
        }
    }

    /**
     * Index a chapter for full-text search
     */
    suspend fun indexChapterForSearch(
        itemId: Long,
        chapterIndex: Int,
        chapterTitle: String?,
        content: String
    ) = withContext(Dispatchers.IO) {
        // Clear existing index for this chapter
        searchIndexDao.deleteSearchIndexForBook(itemId)
        
        // Process content into searchable chunks
        val words = content.split(Regex("\\s+"))
        val searchIndexes = mutableListOf<SearchIndex>()
        
        // Create overlapping text chunks for better search results
        val chunkSize = 50 // words per chunk
        val overlap = 10   // overlapping words
        
        for (i in words.indices step (chunkSize - overlap)) {
            val endIndex = minOf(i + chunkSize, words.size)
            val chunk = words.subList(i, endIndex)
            val chunkText = chunk.joinToString(" ")
            
            searchIndexes.add(
                SearchIndex(
                    itemId = itemId,
                    chapterIndex = chapterIndex,
                    chapterTitle = chapterTitle,
                    searchText = chunkText.lowercase(),
                    originalText = chunkText,
                    startOffset = i,
                    endOffset = endIndex
                )
            )
        }
        
        searchIndexDao.insertSearchIndexes(searchIndexes)
    }

    /**
     * Record reading statistics
     */
    suspend fun recordReadingSession(
        itemId: Long,
        readingTimeMinutes: Int,
        pagesRead: Int = 0,
        chaptersCompleted: Int = 0,
        wordsRead: Int = 0,
        startProgress: Float,
        endProgress: Float
    ) = withContext(Dispatchers.IO) {
        val today = System.currentTimeMillis() / (24 * 60 * 60 * 1000) * (24 * 60 * 60 * 1000)
        val existing = readingStatisticsDao.getStatisticsForBookAndDate(itemId, today)
        
        if (existing != null) {
            // Update existing statistics
            val updated = existing.copy(
                readingTimeMinutes = existing.readingTimeMinutes + readingTimeMinutes,
                pagesRead = existing.pagesRead + pagesRead,
                chaptersCompleted = existing.chaptersCompleted + chaptersCompleted,
                wordsRead = existing.wordsRead + wordsRead,
                endProgress = endProgress,
                sessionCount = existing.sessionCount + 1,
                lastUpdated = System.currentTimeMillis()
            )
            readingStatisticsDao.updateStatistics(updated)
        } else {
            // Create new statistics entry
            val statistics = ReadingStatistics(
                itemId = itemId,
                date = today,
                readingTimeMinutes = readingTimeMinutes,
                pagesRead = pagesRead,
                chaptersCompleted = chaptersCompleted,
                wordsRead = wordsRead,
                startProgress = startProgress,
                endProgress = endProgress
            )
            readingStatisticsDao.insertStatistics(statistics)
        }
    }

    /**
     * Get reading statistics for a book
     */
    fun getReadingStatisticsForBook(itemId: Long): Flow<List<ReadingStatistics>> {
        return readingStatisticsDao.getStatisticsForBook(itemId)
    }

    /**
     * Get total reading time for a book
     */
    suspend fun getTotalReadingTimeForBook(itemId: Long): Int = withContext(Dispatchers.IO) {
        readingStatisticsDao.getTotalReadingTimeForBook(itemId) ?: 0
    }
}

/**
 * Data class for search results
 */
data class SearchResult(
    val itemId: Long,
    val chapterIndex: Int,
    val chapterTitle: String?,
    val startOffset: Int,
    val endOffset: Int,
    val matchedText: String,
    val query: String
) {
    /**
     * Get highlighted text with query matches
     */
    fun getHighlightedText(): String {
        return matchedText.replace(
            query,
            "<mark>$query</mark>",
            ignoreCase = true
        )
    }
}

/**
 * Highlight colors
 */
object HighlightColors {
    const val YELLOW = "#FFFF00"
    const val GREEN = "#90EE90"
    const val BLUE = "#ADD8E6" 
    const val PINK = "#FFB6C1"
    const val ORANGE = "#FFA500"
    const val PURPLE = "#DDA0DD"
}