package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.FanfictionDao
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for web fiction-related data operations (fanfiction, web serials)
 * Uses the FanfictionStoryEntity
 */
@Singleton
class WebFictionRepository @Inject constructor(
    private val fanfictionDao: FanfictionDao
) {
    fun getAllWebFiction(): Flow<List<FanfictionStoryEntity>> = 
        fanfictionDao.getAllStories()
    
    suspend fun getWebFictionById(id: String): FanfictionStoryEntity? = 
        fanfictionDao.getStoryById(id)
    
    fun getRecentlyAddedWebFiction(limit: Int = 10): Flow<List<FanfictionStoryEntity>> = 
        fanfictionDao.getAllStories().map { it.take(limit) }
    
    fun searchWebFiction(query: String): Flow<List<FanfictionStoryEntity>> = 
        fanfictionDao.searchStories(query)
    
    suspend fun insertWebFiction(story: FanfictionStoryEntity) = 
        fanfictionDao.insertStory(story)
    
    suspend fun updateWebFiction(story: FanfictionStoryEntity) = 
        fanfictionDao.updateStory(story)
    
    suspend fun deleteWebFiction(story: FanfictionStoryEntity) = 
        fanfictionDao.deleteStory(story)
    
    suspend fun getWebFictionCount(): Int = fanfictionDao.getStoryCount()
    
    suspend fun getInProgressWebFiction(): List<FanfictionStoryEntity> = 
        fanfictionDao.getInProgressStories()
}
