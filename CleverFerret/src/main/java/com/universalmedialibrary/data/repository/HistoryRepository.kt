package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.entity.ReadingProgress
import com.universalmedialibrary.data.local.entity.Bookmark
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.firstOrNull
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for managing watch/reading history and progress tracking
 * 
 * Provides unified interface for:
 * - Reading progress tracking (books, comics)
 * - Watch history (videos, TV shows, movies)
 * - Listen history (music, podcasts, audiobooks)
 * - Play count tracking
 * - Bookmarks management
 */
@Singleton
class HistoryRepository @Inject constructor(
    private val progressDao: ReadingProgressDao,
    private val bookmarkDao: BookmarkDao
) {
    
    /**
     * Update reading progress for a media item
     */
    suspend fun updateReadingProgress(
        itemId: Long,
        currentPage: Int,
        totalPages: Int,
        currentPosition: Long = 0L
    ) {
        val existing = progressDao.getProgressByItemId(itemId).firstOrNull()
        
        val progress = if (existing != null) {
            // Clamp values to valid ranges
            val validCurrentPage = currentPage.coerceIn(0, maxOf(totalPages, 0))
            val validTotalPages = maxOf(totalPages, 0)
            val calculatedPercentage = if (validTotalPages > 0) {
                ((validCurrentPage.toFloat() / validTotalPages) * 100f).coerceIn(0f, 100f)
            } else 0f
            
            existing.copy(
                currentPage = validCurrentPage,
                currentPosition = currentPosition,
                percentage = calculatedPercentage,
                lastUpdate = System.currentTimeMillis()
            )
        } else {
            val validCurrentPage = currentPage.coerceIn(0, maxOf(totalPages, 0))
            val validTotalPages = maxOf(totalPages, 0)
            val calculatedPercentage = if (validTotalPages > 0) {
                ((validCurrentPage.toFloat() / validTotalPages) * 100f).coerceIn(0f, 100f)
            } else 0f
            
            ReadingProgress(
                itemId = itemId,
                currentPage = validCurrentPage,
                currentPosition = currentPosition,
                percentage = calculatedPercentage,
                lastUpdate = System.currentTimeMillis(),
                startedDate = System.currentTimeMillis()
            )
        }
        
        progressDao.insertProgress(progress)
    }
    
    /**
     * Get reading progress for an item
     */
    fun getReadingProgress(itemId: Long): Flow<ReadingProgress?> {
        return progressDao.getProgressByItemId(itemId)
    }
    
    /**
     * Check if a book/media is finished
     */
    suspend fun isFinished(itemId: Long): Boolean {
        val progress = progressDao.getProgressByItemId(itemId).firstOrNull()
        return progress?.percentage?.let { it >= 95.0f } ?: false
    }
    
    /**
     * Mark item as finished
     */
    suspend fun markAsFinished(itemId: Long) {
        val existing = progressDao.getProgressByItemId(itemId).firstOrNull()
        if (existing != null) {
            val updated = existing.copy(
                percentage = 100f,
                isCompleted = true,
                completedDate = System.currentTimeMillis(),
                lastUpdate = System.currentTimeMillis()
            )
            progressDao.insertProgress(updated)
        }
    }
    
    /**
     * Get all items with progress
     */
    fun getAllProgress(): Flow<List<ReadingProgress>> {
        return progressDao.getAllProgress()
    }
    
    /**
     * Get recently accessed items
     */
    fun getRecentlyAccessed(limit: Int = 10): Flow<List<ReadingProgress>> {
        return progressDao.getRecentProgress(limit)
    }
    
    /**
     * Get in-progress items (started but not finished)
     */
    fun getInProgressItems(): Flow<List<ReadingProgress>> {
        return progressDao.getInProgressItems()
    }
    
    /**
     * Delete progress for an item
     */
    suspend fun deleteProgress(itemId: Long) {
        progressDao.deleteProgressByItemId(itemId)
    }
    
    /**
     * Record watch progress (for videos)
     */
    suspend fun recordWatchProgress(
        itemId: Long,
        position: Long,
        duration: Long
    ) {
        // Clamp position to valid range
        val validPosition = position.coerceIn(0L, maxOf(duration, 0L))
        val validDuration = maxOf(duration, 0L)
        val percentage = if (validDuration > 0) {
            ((validPosition.toFloat() / validDuration) * 100f).coerceIn(0f, 100f)
        } else 0f
        
        val existing = progressDao.getProgressByItemId(itemId).firstOrNull()
        val progress = if (existing != null) {
            existing.copy(
                currentPosition = validPosition,
                percentage = percentage,
                lastUpdate = System.currentTimeMillis()
            )
        } else {
            ReadingProgress(
                itemId = itemId,
                currentPosition = position,
                percentage = percentage,
                lastUpdate = System.currentTimeMillis(),
                startedDate = System.currentTimeMillis()
            )
        }
        
        progressDao.insertProgress(progress)
    }
    
    /**
     * Check if video/audio has been watched/listened
     */
    suspend fun isWatched(itemId: Long): Boolean {
        return isFinished(itemId)
    }
    
    /**
     * Get current position for media playback
     */
    suspend fun getCurrentPosition(itemId: Long): Long {
        return progressDao.getProgressByItemId(itemId).firstOrNull()?.currentPosition ?: 0L
    }
    
    /**
     * Increment play count (for music/audio)
     */
    suspend fun incrementPlayCount(itemId: Long) {
        // For now, we track this through progress updates
        // A dedicated play count table could be added later
        val existing = progressDao.getProgressByItemId(itemId).firstOrNull()
        if (existing != null) {
            val updated = existing.copy(
                lastUpdate = System.currentTimeMillis()
            )
            progressDao.insertProgress(updated)
        } else {
            val newProgress = ReadingProgress(
                itemId = itemId,
                lastUpdate = System.currentTimeMillis(),
                startedDate = System.currentTimeMillis()
            )
            progressDao.insertProgress(newProgress)
        }
    }
    
    /**
     * Get bookmarks for an item
     */
    suspend fun getBookmarks(itemId: Long): List<Bookmark> {
        return bookmarkDao.getBookmarksByMediaItem(itemId)
    }
    
    /**
     * Add a bookmark
     */
    suspend fun addBookmark(
        itemId: Long,
        title: String,
        position: Long,
        description: String? = null
    ): Long {
        val bookmark = Bookmark(
            itemId = itemId,
            title = title,
            description = description,
            position = position,
            dateCreated = System.currentTimeMillis()
        )
        return bookmarkDao.insertBookmark(bookmark)
    }
    
    /**
     * Delete a bookmark
     */
    suspend fun deleteBookmark(bookmarkId: Long) {
        bookmarkDao.deleteBookmark(bookmarkId)
    }
    
    /**
     * Get all recent activity across all media types
     */
    fun getRecentActivity(limit: Int = 50): Flow<List<ReadingProgress>> {
        return progressDao.getRecentProgress(limit)
    }
    
    /**
     * Get statistics
     */
    suspend fun getStatistics(): HistoryStatistics {
        val allProgress = progressDao.getAllProgress().firstOrNull() ?: emptyList()
        return HistoryStatistics(
            totalItemsStarted = allProgress.size,
            totalItemsFinished = allProgress.count { it.percentage >= 95.0f },
            totalItemsInProgress = allProgress.count { it.percentage in 1.0f..94.9f }
        )
    }
}

/**
 * Statistics about user's reading/watching history
 */
data class HistoryStatistics(
    val totalItemsStarted: Int,
    val totalItemsFinished: Int,
    val totalItemsInProgress: Int
)
