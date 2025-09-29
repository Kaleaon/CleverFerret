package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.DownloadedStory
import com.universalmedialibrary.data.local.entity.StoryUpdate
import kotlinx.coroutines.flow.Flow

/**
 * DAO for managing downloaded stories and their updates
 * 
 * Provides functionality for:
 * - Tracking downloaded stories by URL
 * - Detecting updates and managing re-downloads
 * - Maintaining update history
 */
@Dao
interface DownloadedStoryDao {
    
    // Basic CRUD operations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertStory(story: DownloadedStory): Long
    
    @Update
    suspend fun updateStory(story: DownloadedStory)
    
    @Delete
    suspend fun deleteStory(story: DownloadedStory)
    
    // Query operations
    @Query("SELECT * FROM downloaded_stories WHERE id = :storyId")
    suspend fun getStoryById(storyId: String): DownloadedStory?
    
    @Query("SELECT * FROM downloaded_stories WHERE url = :url")
    suspend fun getStoryByUrl(url: String): DownloadedStory?
    
    @Query("SELECT * FROM downloaded_stories WHERE site = :site AND siteStoryId = :siteStoryId")
    suspend fun getStoryBySiteId(site: String, siteStoryId: String): DownloadedStory?
    
    @Query("SELECT * FROM downloaded_stories ORDER BY lastDownloaded DESC")
    fun getAllStories(): Flow<List<DownloadedStory>>
    
    @Query("SELECT * FROM downloaded_stories WHERE hasUpdates = 1 ORDER BY lastUpdated DESC")
    fun getStoriesWithUpdates(): Flow<List<DownloadedStory>>
    
    @Query("SELECT * FROM downloaded_stories WHERE autoUpdateEnabled = 1 AND lastChecked < :cutoffTime ORDER BY lastChecked ASC")
    suspend fun getStoriesNeedingUpdateCheck(cutoffTime: Long): List<DownloadedStory>
    
    @Query("SELECT * FROM downloaded_stories WHERE isCompleted = 0 AND autoUpdateEnabled = 1 ORDER BY lastUpdated DESC")
    suspend fun getIncompleteStories(): List<DownloadedStory>
    
    // Update specific operations
    @Query("UPDATE downloaded_stories SET hasUpdates = :hasUpdates, lastChecked = :timestamp WHERE id = :storyId")
    suspend fun markUpdateStatus(storyId: String, hasUpdates: Boolean, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE downloaded_stories SET lastKnownChapters = :chapters, totalChapters = :chapters, lastUpdated = :timestamp WHERE id = :storyId")
    suspend fun updateChapterCount(storyId: String, chapters: Int, timestamp: Long)
    
    @Query("UPDATE downloaded_stories SET lastError = :error, failureCount = failureCount + 1 WHERE id = :storyId")
    suspend fun recordError(storyId: String, error: String)
    
    @Query("UPDATE downloaded_stories SET lastError = NULL, failureCount = 0 WHERE id = :storyId")
    suspend fun clearError(storyId: String)
    
    // Statistics and management
    @Query("SELECT COUNT(*) FROM downloaded_stories")
    suspend fun getStoryCount(): Int
    
    @Query("SELECT COUNT(*) FROM downloaded_stories WHERE hasUpdates = 1")
    suspend fun getStoriesWithUpdatesCount(): Int
    
    @Query("SELECT COUNT(*) FROM downloaded_stories WHERE isCompleted = 0")
    suspend fun getIncompleteStoriesCount(): Int
    
    @Query("DELETE FROM downloaded_stories WHERE lastDownloaded < :cutoffTime AND isCompleted = 1")
    suspend fun cleanupOldCompletedStories(cutoffTime: Long): Int
}

/**
 * DAO for managing story update history
 */
@Dao
interface StoryUpdateDao {
    
    @Insert
    suspend fun insertUpdate(update: StoryUpdate): Long
    
    @Query("SELECT * FROM story_updates WHERE storyId = :storyId ORDER BY timestamp DESC")
    fun getUpdatesForStory(storyId: String): Flow<List<StoryUpdate>>
    
    @Query("SELECT * FROM story_updates ORDER BY timestamp DESC LIMIT :limit")
    fun getRecentUpdates(limit: Int = 50): Flow<List<StoryUpdate>>
    
    @Query("DELETE FROM story_updates WHERE timestamp < :cutoffTime")
    suspend fun cleanupOldUpdates(cutoffTime: Long): Int
}