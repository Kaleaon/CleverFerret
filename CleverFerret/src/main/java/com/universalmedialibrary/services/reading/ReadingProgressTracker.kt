package com.universalmedialibrary.services.reading

import android.content.Context
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.ReadingProgress
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Reading Progress Tracker
 * 
 * Tracks reading progress across all media types:
 * - E-books (EPUB, PDF): Page/chapter position
 * - Comics (CBZ, CBR): Current page
 * - Audiobooks: Playback position
 * - Text files: Scroll position
 * 
 * Features:
 * - Automatic progress saving
 * - Reading streak tracking
 * - Reading time tracking
 * - Cross-device sync ready
 * - Reading statistics
 */
@Singleton
class ReadingProgressTracker @Inject constructor(
    @ApplicationContext private val context: Context,
    private val progressDao: ReadingProgressDao
) {
    
    /**
     * Save current reading progress
     */
    suspend fun saveProgress(
        mediaItemId: Long,
        currentPosition: Long = 0,
        currentPage: Int = 1,
        currentChapter: Int = 1,
        percentage: Float = 0f
    ) {
        // Get existing progress or create new
        val existing = progressDao.getProgress(mediaItemId).first()
        
        val timestamp = System.currentTimeMillis()
        val progress = existing?.copy(
            currentPosition = currentPosition,
            currentPage = currentPage,
            currentChapter = currentChapter,
            percentage = percentage,
            lastUpdate = timestamp,
            lastModified = timestamp
        ) ?: ReadingProgress(
            itemId = mediaItemId,
            currentPosition = currentPosition,
            currentPage = currentPage,
            currentChapter = currentChapter,
            percentage = percentage,
            startedDate = timestamp,
            lastUpdate = timestamp,
            lastModified = timestamp
        )
        
        progressDao.upsert(progress)
    }
    
    /**
     * Get reading progress for media item
     */
    fun getProgress(mediaItemId: Long): Flow<ReadingProgress?> {
        return progressDao.getProgress(mediaItemId)
    }
    
    /**
     * Get recently read items
     */
    fun getRecentlyRead(limit: Int = 10): Flow<List<ReadingProgress>> {
        return progressDao.getRecentlyRead(limit)
    }
    
    /**
     * Get completed items
     */
    fun getCompleted(): Flow<List<ReadingProgress>> {
        return progressDao.getCompleted()
    }
    
    /**
     * Mark book as finished
     */
    suspend fun markAsFinished(mediaItemId: Long) {
        progressDao.markAsCompleted(mediaItemId, true)
    }
    
    /**
     * Mark book as not finished
     */
    suspend fun markAsUnfinished(mediaItemId: Long) {
        progressDao.markAsCompleted(mediaItemId, false)
    }
    
    /**
     * Clear progress for media item
     */
    suspend fun clearProgress(mediaItemId: Long) {
        progressDao.delete(mediaItemId)
    }
    
    /**
     * Get reading statistics
     */
    suspend fun getReadingStats(): ReadingStats {
        val recentlyRead = progressDao.getRecentlyRead(100).first()
        val completed = progressDao.getCompleted().first()
        
        val totalBooksRead = completed.size
        val totalBooks = progressDao.getProgressCount()
        val averageCompletion = if (recentlyRead.isNotEmpty()) {
            recentlyRead.map { it.percentage }.average().toFloat()
        } else {
            0f
        }
        
        val totalReadingTime = recentlyRead.sumOf { it.totalReadingTime }
        
        return ReadingStats(
            totalBooksRead = totalBooksRead,
            totalBooks = totalBooks,
            averageCompletion = averageCompletion,
            booksInProgress = totalBooks - totalBooksRead,
            totalReadingTimeMs = totalReadingTime
        )
    }
    
    data class ReadingStats(
        val totalBooksRead: Int,
        val totalBooks: Int,
        val averageCompletion: Float,
        val booksInProgress: Int,
        val totalReadingTimeMs: Long
    ) {
        val totalReadingHours: Float
            get() = totalReadingTimeMs / (1000f * 60f * 60f)
    }
}
