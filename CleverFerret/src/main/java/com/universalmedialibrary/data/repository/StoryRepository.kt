package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.DownloadedStoryDao
import com.universalmedialibrary.data.local.dao.StoryUpdateDao
import com.universalmedialibrary.data.local.entity.DownloadedStory
import com.universalmedialibrary.data.local.entity.StoryUpdate
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for managing fanfiction/web fiction stories
 */
@Singleton
class StoryRepository @Inject constructor(
    private val storyDao: DownloadedStoryDao,
    private val updateDao: StoryUpdateDao
) {

    // Story CRUD operations
    suspend fun insertStory(story: DownloadedStory): Long {
        return storyDao.insertStory(story)
    }

    suspend fun updateStory(story: DownloadedStory) {
        storyDao.updateStory(story)
    }

    suspend fun deleteStory(story: DownloadedStory) {
        storyDao.deleteStory(story)
    }

    // Query operations
    suspend fun getStoryById(storyId: String): DownloadedStory? {
        return storyDao.getStoryById(storyId)
    }

    suspend fun getStoryByUrl(url: String): DownloadedStory? {
        return storyDao.getStoryByUrl(url)
    }

    suspend fun getStoryBySiteId(site: String, siteStoryId: String): DownloadedStory? {
        return storyDao.getStoryBySiteId(site, siteStoryId)
    }

    fun getAllStories(): Flow<List<DownloadedStory>> {
        return storyDao.getAllStories()
    }

    fun getStoriesWithUpdates(): Flow<List<DownloadedStory>> {
        return storyDao.getStoriesWithUpdates()
    }

    suspend fun getStoriesNeedingUpdateCheck(cutoffTime: Long): List<DownloadedStory> {
        return storyDao.getStoriesNeedingUpdateCheck(cutoffTime)
    }

    suspend fun getIncompleteStories(): List<DownloadedStory> {
        return storyDao.getIncompleteStories()
    }

    // Update operations
    suspend fun markUpdateStatus(storyId: String, hasUpdates: Boolean, timestamp: Long = System.currentTimeMillis()) {
        storyDao.markUpdateStatus(storyId, hasUpdates, timestamp)
    }

    suspend fun updateChapterCount(storyId: String, chapters: Int, timestamp: Long) {
        storyDao.updateChapterCount(storyId, chapters, timestamp)
    }

    suspend fun recordError(storyId: String, error: String) {
        storyDao.recordError(storyId, error)
    }

    suspend fun clearError(storyId: String) {
        storyDao.clearError(storyId)
    }

    // Statistics
    suspend fun getStoryCount(): Int {
        return storyDao.getStoryCount()
    }

    suspend fun getStoriesWithUpdatesCount(): Int {
        return storyDao.getStoriesWithUpdatesCount()
    }

    suspend fun getIncompleteStoriesCount(): Int {
        return storyDao.getIncompleteStoriesCount()
    }

    suspend fun cleanupOldCompletedStories(cutoffTime: Long): Int {
        return storyDao.cleanupOldCompletedStories(cutoffTime)
    }

    // Update history operations
    suspend fun insertUpdate(update: StoryUpdate): Long {
        return updateDao.insertUpdate(update)
    }

    fun getUpdatesForStory(storyId: String): Flow<List<StoryUpdate>> {
        return updateDao.getUpdatesForStory(storyId)
    }

    fun getRecentUpdates(limit: Int = 50): Flow<List<StoryUpdate>> {
        return updateDao.getRecentUpdates(limit)
    }

    suspend fun cleanupOldUpdates(cutoffTime: Long): Int {
        return updateDao.cleanupOldUpdates(cutoffTime)
    }
}
