package com.universalmedialibrary.services.reader

import com.universalmedialibrary.data.local.dao.AnnotationDao
import com.universalmedialibrary.data.local.dao.EnhancedAnnotationDao
import com.universalmedialibrary.data.local.dao.SearchIndexDao
import com.universalmedialibrary.data.local.dao.ReadingStatisticsDao
import com.universalmedialibrary.data.local.entity.TextAnnotation
import com.universalmedialibrary.data.local.entity.SearchIndex
import com.universalmedialibrary.data.local.entity.ReadingStatistics
import com.universalmedialibrary.data.local.entity.AnnotationColor
import com.universalmedialibrary.data.local.entity.AnnotationStyle
import com.universalmedialibrary.data.local.entity.EnhancedAnnotation
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
    private val annotationDao: AnnotationDao,
    private val enhancedAnnotationDao: EnhancedAnnotationDao,
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
        val annotationId = annotationDao.insertAnnotation(annotation)
        enhancedAnnotationDao.saveEnhancedAnnotation(
            annotationId = annotationId,
            annotation = annotation,
            selectedText = selectedText,
            noteText = null,
            highlightColor = highlightColor
        )
        annotationId
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
        val annotationId = annotationDao.insertAnnotation(annotation)
        enhancedAnnotationDao.saveEnhancedAnnotation(
            annotationId = annotationId,
            annotation = annotation,
            selectedText = selectedText,
            noteText = noteText,
            highlightColor = highlightColor
        )
        annotationId
    }

    /**
     * Update an existing annotation
     */
    suspend fun updateAnnotation(annotation: TextAnnotation) = withContext(Dispatchers.IO) {
        val updatedAnnotation = annotation.copy(dateModified = System.currentTimeMillis())
        annotationDao.updateAnnotation(updatedAnnotation)

        enhancedAnnotationDao.getAnnotationById(annotation.annotationId)?.let { existing ->
            val updatedEnhanced = existing.copy(
                text = updatedAnnotation.selectedText,
                note = updatedAnnotation.noteText,
                quote = updatedAnnotation.selectedText,
                chapterId = updatedAnnotation.chapterIndex.toLong(),
                chapterName = updatedAnnotation.chapterTitle,
                position = 0f,
                colorTag = mapColor(updatedAnnotation.highlightColor),
                stylePreset = mapStyle(updatedAnnotation.annotationType),
                modifiedAt = updatedAnnotation.dateModified
            )
            enhancedAnnotationDao.updateAnnotation(updatedEnhanced)
        }
    }

    /**
     * Delete an annotation
     */
    suspend fun deleteAnnotation(annotationId: Long) = withContext(Dispatchers.IO) {
        annotationDao.deleteAnnotation(annotationId)
        enhancedAnnotationDao.deleteAnnotationById(annotationId)
    }

    /**
     * Get all annotations for a book
     */
    fun getAnnotationsForBook(itemId: Long): Flow<List<TextAnnotation>> {
        return annotationDao.getAnnotationsForBook(itemId)
    }

    fun getEnhancedAnnotationsForBook(itemId: Long): Flow<List<EnhancedAnnotation>> =
        enhancedAnnotationDao.getAnnotationsByItemId(itemId)

    /**
     * Get all annotations for a specific chapter
     */
    fun getAnnotationsForChapter(itemId: Long, chapterIndex: Int): Flow<List<TextAnnotation>> {
        return annotationDao.getAnnotationsForChapter(itemId, chapterIndex)
    }

    fun getEnhancedAnnotationsByChapter(itemId: Long, chapterId: Long): Flow<List<EnhancedAnnotation>> =
        enhancedAnnotationDao.getAnnotationsByChapter(itemId, chapterId)

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

private suspend fun EnhancedAnnotationDao.saveEnhancedAnnotation(
    annotationId: Long,
    annotation: TextAnnotation,
    selectedText: String,
    noteText: String?,
    highlightColor: String
) {
    val enhanced = EnhancedAnnotation(
        annotationId = annotationId,
        itemId = annotation.itemId,
        text = selectedText,
        note = noteText,
        quote = selectedText,
        chapterId = annotation.chapterIndex.toLong(),
        chapterName = annotation.chapterTitle,
        pageNumber = null,
        position = annotation.startOffset.toFloat(),
        colorTag = mapColor(highlightColor),
        stylePreset = mapStyle(annotation.annotationType),
        createdAt = annotation.dateCreated,
        modifiedAt = annotation.dateModified,
        tags = emptyList()
    )
    this.insertAnnotation(enhanced)
}

private fun mapColor(hex: String): AnnotationColor = when (hex.uppercase()) {
    "#FFFF00" -> AnnotationColor.YELLOW
    "#90EE90" -> AnnotationColor.GREEN
    "#ADD8E6" -> AnnotationColor.BLUE
    "#FF0000", "#FF6B6B" -> AnnotationColor.RED
    "#DDA0DD" -> AnnotationColor.PURPLE
    "#FFA500" -> AnnotationColor.ORANGE
    "#FFB6C1" -> AnnotationColor.PINK
    "#808080", "#A0A0A0" -> AnnotationColor.GRAY
    else -> AnnotationColor.YELLOW
}

private fun mapStyle(annotationType: String): AnnotationStyle = when (annotationType.uppercase()) {
    "NOTE" -> AnnotationStyle.NOTE
    "UNDERLINE" -> AnnotationStyle.UNDERLINE
    "STRIKETHROUGH" -> AnnotationStyle.STRIKETHROUGH
    "BOOKMARK" -> AnnotationStyle.BOOKMARK
    else -> AnnotationStyle.HIGHLIGHT
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
