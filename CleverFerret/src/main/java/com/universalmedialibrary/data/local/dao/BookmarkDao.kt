package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow

/**
 * DAO for bookmark and reading progress operations
 */
@Dao
interface BookmarkDao {
    
    // Bookmark operations
    @Query("SELECT * FROM bookmarks WHERE itemId = :itemId AND isActive = 1 ORDER BY dateCreated DESC")
    fun getBookmarksByItem(itemId: Long): Flow<List<Bookmark>>
    
    @Query("SELECT * FROM bookmarks WHERE bookmarkId = :bookmarkId")
    suspend fun getBookmarkById(bookmarkId: Long): Bookmark?
    
    @Query("SELECT * FROM bookmarks WHERE bookmarkType = :type AND isActive = 1 ORDER BY dateCreated DESC")
    fun getBookmarksByType(type: String): Flow<List<Bookmark>>
    
    @Insert
    suspend fun insertBookmark(bookmark: Bookmark): Long
    
    @Update
    suspend fun updateBookmark(bookmark: Bookmark)
    
    @Delete
    suspend fun deleteBookmark(bookmark: Bookmark)
    
    @Query("UPDATE bookmarks SET isActive = :isActive WHERE bookmarkId = :bookmarkId")
    suspend fun setBookmarkActive(bookmarkId: Long, isActive: Boolean)
    
    @Query("UPDATE bookmarks SET lastAccessed = :timestamp WHERE bookmarkId = :bookmarkId")
    suspend fun updateBookmarkAccessed(bookmarkId: Long, timestamp: Long)
    
    // Reading progress operations
    @Query("SELECT * FROM reading_progress WHERE itemId = :itemId")
    suspend fun getReadingProgress(itemId: Long): ReadingProgress?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertReadingProgress(progress: ReadingProgress)
    
    @Update
    suspend fun updateReadingProgress(progress: ReadingProgress)
    
    @Query("UPDATE reading_progress SET currentPosition = :position, currentPage = :page, percentage = :percentage, lastUpdate = :timestamp WHERE itemId = :itemId")
    suspend fun updateReadingPosition(itemId: Long, position: Long, page: Int, percentage: Float, timestamp: Long)
    
    @Query("UPDATE reading_progress SET isCompleted = :isCompleted, completedDate = :date WHERE itemId = :itemId")
    suspend fun markAsCompleted(itemId: Long, isCompleted: Boolean, date: Long?)
    
    @Query("UPDATE reading_progress SET totalReadingTime = totalReadingTime + :duration WHERE itemId = :itemId")
    suspend fun addReadingTime(itemId: Long, duration: Long)
    
    // Reading session operations
    @Query("SELECT * FROM reading_sessions WHERE itemId = :itemId ORDER BY sessionStart DESC")
    fun getReadingSessionsByItem(itemId: Long): Flow<List<ReadingSession>>
    
    @Query("SELECT * FROM reading_sessions WHERE sessionEnd IS NULL ORDER BY sessionStart DESC LIMIT 1")
    suspend fun getActiveSession(): ReadingSession?
    
    @Insert
    suspend fun insertReadingSession(session: ReadingSession): Long
    
    @Update
    suspend fun updateReadingSession(session: ReadingSession)
    
    @Query("UPDATE reading_sessions SET sessionEnd = :endTime, duration = :duration WHERE sessionId = :sessionId")
    suspend fun endReadingSession(sessionId: Long, endTime: Long, duration: Long)
    
    // Statistics queries
    @Query("SELECT SUM(totalReadingTime) FROM reading_progress")
    suspend fun getTotalReadingTime(): Long?
    
    @Query("SELECT COUNT(*) FROM reading_progress WHERE isCompleted = 1")
    suspend fun getCompletedItemsCount(): Int
    
    @Query("SELECT AVG(percentage) FROM reading_progress WHERE percentage > 0")
    suspend fun getAverageReadingProgress(): Float?
    
    @Query("SELECT COUNT(DISTINCT itemId) FROM reading_sessions WHERE sessionStart >= :startTime")
    suspend fun getActiveReadersCount(startTime: Long): Int
    
    @Query("SELECT AVG(duration) FROM reading_sessions WHERE duration > 0")
    suspend fun getAverageSessionDuration(): Long?
    
    // Cleanup operations
    @Query("DELETE FROM bookmarks WHERE isActive = 0 AND dateCreated < :cutoffTime")
    suspend fun cleanupOldBookmarks(cutoffTime: Long): Int
    
    @Query("DELETE FROM reading_sessions WHERE sessionStart < :cutoffTime")
    suspend fun cleanupOldSessions(cutoffTime: Long): Int
}