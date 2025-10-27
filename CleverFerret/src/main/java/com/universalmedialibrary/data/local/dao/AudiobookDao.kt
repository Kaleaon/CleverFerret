package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.AudiobookEntity
import kotlinx.coroutines.flow.Flow

/**
 * DAO for audiobooks
 */
@Dao
interface AudiobookDao {
    
    @Query("SELECT * FROM audiobooks ORDER BY dateAdded DESC")
    fun getAll(): Flow<List<AudiobookEntity>>
    
    @Query("SELECT * FROM audiobooks WHERE id = :id")
    suspend fun getById(id: String): AudiobookEntity?
    
    @Query("SELECT * FROM audiobooks WHERE author = :author ORDER BY title")
    fun getByAuthor(author: String): Flow<List<AudiobookEntity>>
    
    @Query("SELECT * FROM audiobooks WHERE genre = :genre ORDER BY title")
    fun getByGenre(genre: String): Flow<List<AudiobookEntity>>
    
    @Query("SELECT * FROM audiobooks WHERE isFinished = 0 AND lastPlayedPosition > 0 ORDER BY lastPlayed DESC")
    fun getInProgress(): Flow<List<AudiobookEntity>>
    
    @Query("SELECT * FROM audiobooks WHERE isFinished = 1 ORDER BY lastPlayed DESC")
    fun getFinished(): Flow<List<AudiobookEntity>>
    
    @Query("""
        SELECT * FROM audiobooks 
        WHERE title LIKE '%' || :query || '%' 
           OR author LIKE '%' || :query || '%'
           OR narrator LIKE '%' || :query || '%'
        ORDER BY title
    """)
    fun search(query: String): Flow<List<AudiobookEntity>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(audiobook: AudiobookEntity)
    
    @Update
    suspend fun update(audiobook: AudiobookEntity)
    
    @Delete
    suspend fun delete(audiobook: AudiobookEntity)
    
    @Query("UPDATE audiobooks SET lastPlayedPosition = :position, lastPlayed = :timestamp WHERE id = :id")
    suspend fun updatePosition(id: String, position: Long, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE audiobooks SET isFinished = :finished WHERE id = :id")
    suspend fun updateFinished(id: String, finished: Boolean)
    
    @Query("SELECT COUNT(*) FROM audiobooks")
    suspend fun getCount(): Int
    
    @Query("SELECT COUNT(*) FROM audiobooks WHERE isFinished = 0 AND lastPlayedPosition > 0")
    suspend fun getInProgressCount(): Int
    
    @Query("SELECT DISTINCT author FROM audiobooks WHERE author IS NOT NULL ORDER BY author")
    fun getAllAuthors(): Flow<List<String>>
    
    @Query("SELECT DISTINCT genre FROM audiobooks WHERE genre IS NOT NULL ORDER BY genre")
    fun getAllGenres(): Flow<List<String>>
    
    @Query("SELECT SUM(duration) FROM audiobooks")
    suspend fun getTotalDuration(): Long?
    
    @Query("SELECT SUM(duration) FROM audiobooks WHERE isFinished = 1")
    suspend fun getFinishedDuration(): Long?
}
