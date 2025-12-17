package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for comic/manga-related data operations
 * Uses the unified MediaItem entity with mediaType filtering
 */
@Singleton
class ComicRepository @Inject constructor(
    private val mediaItemDao: MediaItemDao
) {
    companion object {
        const val MEDIA_TYPE_COMIC = "COMIC"
        const val MEDIA_TYPE_MANGA = "MANGA"
    }
    
    fun getAllComics(): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_COMIC)
    
    suspend fun getComicById(id: Long): MediaItem? = 
        mediaItemDao.getMediaItemById(id)
    
    fun getRecentlyAddedComics(limit: Int = 10): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_COMIC).map { it.take(limit) }
    
    suspend fun searchComics(query: String): List<MediaItem> = 
        mediaItemDao.searchMediaItems(query, 100)
            .filter { it.mediaType == MEDIA_TYPE_COMIC || it.mediaType == MEDIA_TYPE_MANGA }
    
    suspend fun insertComic(comic: MediaItem) = mediaItemDao.insertMediaItem(comic)
    
    suspend fun updateComic(comic: MediaItem) = mediaItemDao.updateMediaItem(comic)
    
    suspend fun deleteComic(comic: MediaItem) = mediaItemDao.deleteMediaItem(comic)
    
    suspend fun getComicCount(): Int = mediaItemDao.getItemCountByType(MEDIA_TYPE_COMIC)
}
