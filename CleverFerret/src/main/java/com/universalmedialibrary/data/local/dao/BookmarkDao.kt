package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.Bookmark
// import com.universalmedialibrary.data.local.entity.ReadingProgress
// import com.universalmedialibrary.data.local.entity.ReadingSession
import kotlinx.coroutines.flow.Flow

@Dao
interface BookmarkDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertBookmark(bookmark: Bookmark): Long
    
    @Query("SELECT * FROM bookmarks WHERE itemId = :itemId ORDER BY dateCreated DESC")
    suspend fun getBookmarksByMediaItem(itemId: Long): List<Bookmark>
    
    @Query("DELETE FROM bookmarks WHERE bookmarkId = :bookmarkId")
    suspend fun deleteBookmark(bookmarkId: Long)
    
    @Query("DELETE FROM bookmarks WHERE itemId = :itemId")
    suspend fun deleteAllBookmarksForItem(itemId: Long)
    
    // Reading progress and session methods temporarily disabled - entities missing
    /*
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertOrUpdateReadingProgress(progress: ReadingProgress)
    
    @Query("SELECT * FROM reading_progress WHERE mediaItemId = :mediaItemId")
    suspend fun getReadingProgress(mediaItemId: Long): ReadingProgress?
    
    @Query("SELECT * FROM reading_progress ORDER BY lastReadTimestamp DESC")
    fun getAllReadingProgress(): Flow<List<ReadingProgress>>
    
    @Query("SELECT * FROM reading_progress WHERE percentComplete < 100 ORDER BY lastReadTimestamp DESC")
    fun getInProgressReadings(): Flow<List<ReadingProgress>>
    
    @Query("SELECT * FROM reading_progress WHERE percentComplete = 100 ORDER BY lastReadTimestamp DESC")
    suspend fun getFinishedReadings(): List<ReadingProgress>
    
    @Insert
    suspend fun insertReadingSession(session: ReadingSession): Long
    
    @Update
    suspend fun updateReadingSession(session: ReadingSession)
    
    @Query("SELECT * FROM reading_sessions WHERE sessionId = :sessionId")
    suspend fun getReadingSession(sessionId: Long): ReadingSession?
    
    @Query("SELECT * FROM reading_sessions WHERE mediaItemId = :mediaItemId ORDER BY startTime DESC")
    suspend fun getReadingSessionsForItem(mediaItemId: Long): List<ReadingSession>
    
    @Query("SELECT COUNT(DISTINCT mediaItemId) FROM reading_progress WHERE percentComplete = 100")
    suspend fun getTotalBooksRead(): Int
    
    @Query("SELECT SUM(pagesRead) FROM reading_progress")
    suspend fun getTotalPagesRead(): Int
    
    @Query("SELECT SUM(totalReadingTime) FROM reading_progress")
    suspend fun getTotalReadingTime(): Long
    
    @Query("""
        SELECT mediaItemId FROM reading_progress 
        ORDER BY lastReadTimestamp DESC 
        LIMIT :limit
    """)
    suspend fun getRecentlyReadItemIds(limit: Int): List<Long>
    
    @Query("""
        UPDATE reading_progress 
        SET percentComplete = 100, currentPosition = 'finished', lastReadTimestamp = :timestamp
        WHERE mediaItemId = :mediaItemId
    """)
    suspend fun markAsFinished(mediaItemId: Long, timestamp: Long)
    
    @Query("DELETE FROM reading_progress WHERE mediaItemId = :mediaItemId")
    suspend fun deleteReadingProgress(mediaItemId: Long)
    
    @Query("DELETE FROM reading_sessions WHERE mediaItemId = :mediaItemId")
    suspend fun deleteReadingSessionsForItem(mediaItemId: Long)
    */
}