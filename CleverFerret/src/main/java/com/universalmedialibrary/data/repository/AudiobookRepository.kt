package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for audiobook-related data operations
 * Uses the unified MediaItem entity with mediaType filtering
 */
@Singleton
class AudiobookRepository @Inject constructor(
    private val mediaItemDao: MediaItemDao
) {
    companion object {
        const val MEDIA_TYPE_AUDIOBOOK = "AUDIOBOOK"
    }
    
    fun getAllAudiobooks(): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_AUDIOBOOK)
    
    suspend fun getAudiobookById(id: Long): MediaItem? = 
        mediaItemDao.getMediaItemById(id)
    
    fun getRecentlyAddedAudiobooks(limit: Int = 10): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_AUDIOBOOK).map { it.take(limit) }
    
    suspend fun searchAudiobooks(query: String): List<MediaItem> = 
        mediaItemDao.searchMediaItems(query, 100)
            .filter { it.mediaType == MEDIA_TYPE_AUDIOBOOK }
    
    suspend fun insertAudiobook(audiobook: MediaItem) = mediaItemDao.insertMediaItem(audiobook)
    
    suspend fun updateAudiobook(audiobook: MediaItem) = mediaItemDao.updateMediaItem(audiobook)
    
    suspend fun deleteAudiobook(audiobook: MediaItem) = mediaItemDao.deleteMediaItem(audiobook)
    
    suspend fun getAudiobookCount(): Int = mediaItemDao.getItemCountByType(MEDIA_TYPE_AUDIOBOOK)
    
    fun getInProgressAudiobooks(): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_AUDIOBOOK).map { items ->
            items.filter { it.lastPlayed > 0 }
        }
}
