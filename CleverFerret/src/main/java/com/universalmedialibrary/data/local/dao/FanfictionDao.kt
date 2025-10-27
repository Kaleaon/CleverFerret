package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import kotlinx.coroutines.flow.Flow

/**
 * DAO for fanfiction stories
 */
@Dao
interface FanfictionDao {
    
    @Query("SELECT * FROM fanfiction_stories ORDER BY dateAdded DESC")
    fun getAllStories(): Flow<List<FanfictionStoryEntity>>
    
    @Query("SELECT * FROM fanfiction_stories WHERE id = :id")
    suspend fun getStoryById(id: String): FanfictionStoryEntity?
    
    @Query("SELECT * FROM fanfiction_stories WHERE sourceSite = :site ORDER BY dateAdded DESC")
    fun getStoriesBySite(site: String): Flow<List<FanfictionStoryEntity>>
    
    @Query("SELECT * FROM fanfiction_stories WHERE status = 'IN_PROGRESS' ORDER BY updateDate DESC")
    suspend fun getInProgressStories(): List<FanfictionStoryEntity>
    
    @Query("SELECT * FROM fanfiction_stories WHERE status = 'COMPLETE' ORDER BY dateAdded DESC")
    fun getCompleteStories(): Flow<List<FanfictionStoryEntity>>
    
    @Query("""
        SELECT * FROM fanfiction_stories 
        WHERE title LIKE '%' || :query || '%' 
           OR author LIKE '%' || :query || '%'
           OR summary LIKE '%' || :query || '%'
        ORDER BY dateAdded DESC
    """)
    fun searchStories(query: String): Flow<List<FanfictionStoryEntity>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertStory(story: FanfictionStoryEntity)
    
    @Update
    suspend fun updateStory(story: FanfictionStoryEntity)
    
    @Delete
    suspend fun deleteStory(story: FanfictionStoryEntity)
    
    @Query("DELETE FROM fanfiction_stories WHERE id = :id")
    suspend fun deleteStoryById(id: String)
    
    @Query("UPDATE fanfiction_stories SET lastCheckedDate = :timestamp WHERE id = :id")
    suspend fun updateLastChecked(id: String, timestamp: Long)
    
    @Query("SELECT COUNT(*) FROM fanfiction_stories")
    suspend fun getStoryCount(): Int
    
    @Query("SELECT COUNT(*) FROM fanfiction_stories WHERE status = 'IN_PROGRESS'")
    suspend fun getInProgressCount(): Int
    
    @Query("SELECT DISTINCT sourceSite FROM fanfiction_stories ORDER BY sourceSite")
    fun getAllSites(): Flow<List<String>>
    
    /**
     * Get all tags from all stories
     * Note: Tags are stored as JSON strings and parsed client-side
     * to avoid dependency on SQLite JSON1 extension
     */
    @Query("SELECT tags FROM fanfiction_stories WHERE tags IS NOT NULL AND tags != ''")
    suspend fun getAllTagsRaw(): List<String>
}
