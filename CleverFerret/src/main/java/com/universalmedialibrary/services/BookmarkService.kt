package com.universalmedialibrary.services

import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.Bookmark as BookmarkEntity
import com.universalmedialibrary.data.local.entity.ReadingProgress as ProgressEntity
import com.universalmedialibrary.data.local.entity.ReadingSession as SessionEntity
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing bookmarks and reading progress
 */
@Singleton
class BookmarkService @Inject constructor(
    private val bookmarkDao: BookmarkDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {
    
    data class Bookmark(
        val id: Long = 0,
        val mediaItemId: Long,
        val position: String, // JSON string containing position data
        val timestamp: Long = System.currentTimeMillis(),
        val note: String? = null,
        val type: BookmarkType = BookmarkType.MANUAL
    )
    
    enum class BookmarkType {
        MANUAL,        // User-created bookmark
        AUTO_SAVE,     // Automatic progress save
        CHAPTER_START, // Beginning of a chapter
        ANNOTATION     // Associated with an annotation
    }
    
    data class ReadingProgress(
        val mediaItemId: Long,
        val currentPosition: String, // JSON with chapter, page, percentage, etc.
        val totalPages: Int = 0,
        val pagesRead: Int = 0,
        val percentComplete: Float = 0f,
        val lastReadTimestamp: Long = System.currentTimeMillis(),
        val totalReadingTime: Long = 0, // in milliseconds
        val readingSessions: Int = 0
    )
    
    data class ReadingSession(
        val id: Long = 0,
        val mediaItemId: Long,
        val startTime: Long,
        val endTime: Long? = null,
        val pagesRead: Int = 0,
        val startPosition: String,
        val endPosition: String? = null
    )
    
    data class ReadingStats(
        val totalBooksRead: Int = 0,
        val totalPagesRead: Int = 0,
        val totalReadingTime: Long = 0, // in milliseconds
        val averageReadingSpeed: Float = 0f, // pages per hour
        val currentStreak: Int = 0, // days
        val longestStreak: Int = 0, // days
        val favoriteGenres: List<String> = emptyList(),
        val monthlyStats: Map<String, MonthlyStats> = emptyMap()
    )
    
    data class MonthlyStats(
        val month: String, // "2024-01"
        val booksRead: Int,
        val pagesRead: Int,
        val readingTime: Long,
        val uniqueReadingDays: Int
    )
    
    /**
     * Save a bookmark
     */
    suspend fun saveBookmark(bookmark: Bookmark): Long {
        val entity = BookmarkEntity(
            mediaItemId = bookmark.mediaItemId,
            position = bookmark.position,
            timestamp = bookmark.timestamp,
            note = bookmark.note,
            type = bookmark.type.name
        )
        return bookmarkDao.insertBookmark(entity)
    }
    
    /**
     * Get all bookmarks for a media item
     */
    suspend fun getBookmarks(mediaItemId: Long): List<Bookmark> {
        return bookmarkDao.getBookmarksByMediaItem(mediaItemId).map { entity ->
            Bookmark(
                id = entity.bookmarkId,
                mediaItemId = entity.mediaItemId,
                position = entity.position,
                timestamp = entity.timestamp,
                note = entity.note,
                type = BookmarkType.valueOf(entity.type)
            )
        }
    }
    
    /**
     * Delete a bookmark
     */
    suspend fun deleteBookmark(bookmarkId: Long) {
        bookmarkDao.deleteBookmark(bookmarkId)
    }
    
    /**
     * Update reading progress
     */
    suspend fun updateReadingProgress(progress: ReadingProgress) {
        val entity = ProgressEntity(
            mediaItemId = progress.mediaItemId,
            currentPosition = progress.currentPosition,
            totalPages = progress.totalPages,
            pagesRead = progress.pagesRead,
            percentComplete = progress.percentComplete,
            lastReadTimestamp = progress.lastReadTimestamp,
            totalReadingTime = progress.totalReadingTime,
            readingSessions = progress.readingSessions
        )
        bookmarkDao.insertOrUpdateReadingProgress(entity)
        
        // Update last accessed time in media item
        mediaItemDao.updateLastAccessed(progress.mediaItemId, java.util.Date())
    }
    
    /**
     * Get reading progress for a media item
     */
    suspend fun getReadingProgress(mediaItemId: Long): ReadingProgress? {
        return bookmarkDao.getReadingProgress(mediaItemId)?.let { entity ->
            ReadingProgress(
                mediaItemId = entity.mediaItemId,
                currentPosition = entity.currentPosition,
                totalPages = entity.totalPages,
                pagesRead = entity.pagesRead,
                percentComplete = entity.percentComplete,
                lastReadTimestamp = entity.lastReadTimestamp,
                totalReadingTime = entity.totalReadingTime,
                readingSessions = entity.readingSessions
            )
        }
    }
    
    /**
     * Get reading progress for all media items
     */
    fun getAllReadingProgress(): Flow<List<ReadingProgress>> {
        return bookmarkDao.getAllReadingProgress().map { entities ->
            entities.map { entity ->
                ReadingProgress(
                    mediaItemId = entity.mediaItemId,
                    currentPosition = entity.currentPosition,
                    totalPages = entity.totalPages,
                    pagesRead = entity.pagesRead,
                    percentComplete = entity.percentComplete,
                    lastReadTimestamp = entity.lastReadTimestamp,
                    totalReadingTime = entity.totalReadingTime,
                    readingSessions = entity.readingSessions
                )
            }
        }
    }
    
    /**
     * Start a reading session
     */
    suspend fun startReadingSession(
        mediaItemId: Long,
        startPosition: String
    ): Long {
        val session = SessionEntity(
            mediaItemId = mediaItemId,
            startTime = System.currentTimeMillis(),
            startPosition = startPosition
        )
        return bookmarkDao.insertReadingSession(session)
    }
    
    /**
     * End a reading session
     */
    suspend fun endReadingSession(
        sessionId: Long,
        endPosition: String,
        pagesRead: Int
    ) {
        val session = bookmarkDao.getReadingSession(sessionId)
        session?.let {
            val updatedSession = it.copy(
                endTime = System.currentTimeMillis(),
                endPosition = endPosition,
                pagesRead = pagesRead
            )
            bookmarkDao.updateReadingSession(updatedSession)
            
            // Update reading progress
            val progress = bookmarkDao.getReadingProgress(it.mediaItemId)
            if (progress != null) {
                val updatedProgress = progress.copy(
                    totalReadingTime = progress.totalReadingTime + 
                        (updatedSession.endTime!! - it.startTime),
                    readingSessions = progress.readingSessions + 1,
                    pagesRead = progress.pagesRead + pagesRead
                )
                bookmarkDao.insertOrUpdateReadingProgress(updatedProgress)
            }
        }
    }
    
    /**
     * Get reading statistics
     */
    suspend fun getReadingStats(): ReadingStats {
        val totalBooksRead = bookmarkDao.getTotalBooksRead()
        val totalPagesRead = bookmarkDao.getTotalPagesRead() ?: 0
        val totalReadingTime = bookmarkDao.getTotalReadingTime() ?: 0L
        
        val averageReadingSpeed = if (totalReadingTime > 0) {
            (totalPagesRead.toFloat() / (totalReadingTime / 3600000f)) // pages per hour
        } else 0f
        
        return ReadingStats(
            totalBooksRead = totalBooksRead,
            totalPagesRead = totalPagesRead,
            totalReadingTime = totalReadingTime,
            averageReadingSpeed = averageReadingSpeed
        )
    }
    
    /**
     * Get reading stats for a specific time period
     */
    suspend fun getReadingStatsForPeriod(
        startDate: Long,
        endDate: Long
    ): ReadingStats {
        // Filter reading sessions within the date range
        val finishedBooks = bookmarkDao.getFinishedReadings().filter { 
            it.lastReadTimestamp in startDate..endDate 
        }
        
        return ReadingStats(
            totalBooksRead = finishedBooks.size,
            totalPagesRead = finishedBooks.sumOf { it.pagesRead },
            totalReadingTime = finishedBooks.sumOf { it.totalReadingTime }
        )
    }
    
    /**
     * Export reading history
     */
    suspend fun exportReadingHistory(): String {
        val allProgress = bookmarkDao.getFinishedReadings()
        val csv = StringBuilder()
        csv.append("Media ID,Position,Pages Read,Percent Complete,Last Read,Total Time (min)\n")
        
        allProgress.forEach { progress ->
            csv.append("${progress.mediaItemId},")
            csv.append("${progress.currentPosition},")
            csv.append("${progress.pagesRead},")
            csv.append("${progress.percentComplete},")
            csv.append("${progress.lastReadTimestamp},")
            csv.append("${progress.totalReadingTime / 60000}\n")
        }
        
        return csv.toString()
    }
    
    /**
     * Import reading history
     */
    suspend fun importReadingHistory(data: String): Boolean {
        return try {
            val lines = data.lines()
            if (lines.isEmpty()) return false
            
            // Skip header
            lines.drop(1).forEach { line ->
                val parts = line.split(",")
                if (parts.size >= 6) {
                    val progress = ProgressEntity(
                        mediaItemId = parts[0].toLong(),
                        currentPosition = parts[1],
                        pagesRead = parts[2].toInt(),
                        percentComplete = parts[3].toFloat(),
                        lastReadTimestamp = parts[4].toLong(),
                        totalReadingTime = parts[5].toLong() * 60000
                    )
                    bookmarkDao.insertOrUpdateReadingProgress(progress)
                }
            }
            true
        } catch (e: Exception) {
            e.printStackTrace()
            false
        }
    }
    
    /**
     * Get recently read items
     */
    suspend fun getRecentlyRead(limit: Int = 10): List<Long> {
        return bookmarkDao.getRecentlyReadItemIds(limit)
    }
    
    /**
     * Mark item as finished
     */
    suspend fun markAsFinished(mediaItemId: Long) {
        bookmarkDao.markAsFinished(mediaItemId, System.currentTimeMillis())
    }
    
    /**
     * Get reading recommendations based on history
     */
    suspend fun getRecommendations(): List<Long> {
        // Get recently read items
        val recentlyRead = bookmarkDao.getRecentlyReadItemIds(20)
        
        // In a real implementation, analyze genres, authors, and reading patterns
        // For now, return empty list
        return emptyList()
    }
}