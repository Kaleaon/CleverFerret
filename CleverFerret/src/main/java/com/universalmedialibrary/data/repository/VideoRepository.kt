package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for video-related data operations (movies, TV shows)
 * Uses the unified MediaItem entity with mediaType filtering
 */
@Singleton
class VideoRepository @Inject constructor(
    private val mediaItemDao: MediaItemDao
) {
    companion object {
        const val MEDIA_TYPE_MOVIE = "MOVIE"
        const val MEDIA_TYPE_TV_SHOW = "TV_SHOW"
        const val MEDIA_TYPE_VIDEO = "VIDEO"
    }
    
    fun getAllVideos(): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_VIDEO)
    
    suspend fun getVideoById(id: Long): MediaItem? = 
        mediaItemDao.getMediaItemById(id)
    
    fun getRecentlyAddedVideos(limit: Int = 10): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_VIDEO).map { it.take(limit) }
    
    fun getMovies(): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_MOVIE)
    
    fun getTvShows(): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_TV_SHOW)
    
    suspend fun searchVideos(query: String): List<MediaItem> = 
        mediaItemDao.searchMediaItems(query, 100)
            .filter { it.mediaType in listOf(MEDIA_TYPE_VIDEO, MEDIA_TYPE_MOVIE, MEDIA_TYPE_TV_SHOW) }
    
    suspend fun insertVideo(video: MediaItem) = mediaItemDao.insertMediaItem(video)
    
    suspend fun updateVideo(video: MediaItem) = mediaItemDao.updateMediaItem(video)
    
    suspend fun deleteVideo(video: MediaItem) = mediaItemDao.deleteMediaItem(video)
    
    suspend fun getVideoCount(): Int = 
        mediaItemDao.getItemCountByType(MEDIA_TYPE_VIDEO) +
        mediaItemDao.getItemCountByType(MEDIA_TYPE_MOVIE) +
        mediaItemDao.getItemCountByType(MEDIA_TYPE_TV_SHOW)
    
    fun getInProgressVideos(): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_VIDEO).map { items ->
            items.filter { it.lastPlayed > 0 }
        }
}
