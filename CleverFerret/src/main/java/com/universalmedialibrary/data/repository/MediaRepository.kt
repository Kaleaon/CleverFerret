package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for media item and metadata operations
 */
@Singleton
class MediaRepository @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {

    // Media Item operations
    fun getMediaItemsByLibrary(libraryId: Long): Flow<List<MediaItem>> =
        mediaItemDao.getMediaItemsByLibrary(libraryId)

    suspend fun getMediaItemById(itemId: Long): MediaItem? =
        mediaItemDao.getMediaItemById(itemId)

    suspend fun getMediaItemByPath(filePath: String): MediaItem? =
        mediaItemDao.getMediaItemByPath(filePath)

    fun getMediaItemsByType(mediaType: String): Flow<List<MediaItem>> =
        mediaItemDao.getMediaItemsByType(mediaType)

    fun getFavoriteMediaItems(): Flow<List<MediaItem>> =
        mediaItemDao.getFavoriteMediaItems()

    suspend fun createMediaItem(mediaItem: MediaItem): Long =
        mediaItemDao.insertMediaItem(mediaItem)

    suspend fun updateMediaItem(mediaItem: MediaItem) =
        mediaItemDao.updateMediaItem(mediaItem)

    suspend fun deleteMediaItem(mediaItem: MediaItem) =
        mediaItemDao.deleteMediaItem(mediaItem)

    suspend fun searchMediaItems(query: String, limit: Int = 50): List<MediaItem> =
        mediaItemDao.searchMediaItems(query, limit)

    // Metadata operations
    suspend fun getCommonMetadata(itemId: Long): MetadataCommon? =
        metadataDao.getCommonMetadata(itemId)

    suspend fun saveCommonMetadata(metadata: MetadataCommon) =
        metadataDao.insertCommonMetadata(metadata)

    suspend fun updateCommonMetadata(metadata: MetadataCommon) =
        metadataDao.updateCommonMetadata(metadata.itemId, metadata.title, metadata.summary)

    suspend fun searchByTitle(query: String, limit: Int = 50): List<MetadataCommon> =
        metadataDao.searchByTitle(query)

    suspend fun setFavorite(itemId: Long, isFavorite: Boolean) {
        mediaItemDao.setFavorite(itemId, isFavorite)
        metadataDao.setFavorite(itemId, isFavorite)
    }

    suspend fun toggleFavorite(itemId: Long): Boolean {
        val current = mediaItemDao.getMediaItemById(itemId)?.isFavorite ?: false
        val newState = !current
        setFavorite(itemId, newState)
        return newState
    }

    suspend fun createMediaItems(mediaItems: List<MediaItem>): List<Long> {
        mediaItemDao.insertMediaItems(mediaItems)
        return mediaItems.map { it.itemId } // Return the IDs
    }

    suspend fun getMediaItemWithMetadata(itemId: Long): Pair<MediaItem?, MetadataCommon?> {
        val mediaItem = getMediaItemById(itemId)
        val metadata = getCommonMetadata(itemId)
        return Pair(mediaItem, metadata)
    }

    suspend fun getItemCountByLibrary(libraryId: Long): Int =
        mediaItemDao.getItemCountByLibrary(libraryId)

    suspend fun getItemCountByType(mediaType: String): Int =
        mediaItemDao.getItemCountByType(mediaType)
    
    /**
     * PERFORMANCE OPTIMIZATION: Batch fetch metadata for multiple items at once
     * to avoid N+1 query problems.
     * 
     * @param itemIds List of item IDs to fetch metadata for
     * @return Map of itemId to MetadataCommon
     */
    suspend fun getCommonMetadataBatch(itemIds: List<Long>): Map<Long, MetadataCommon> {
        if (itemIds.isEmpty()) return emptyMap()
        return metadataDao.getMetadataCommonBatch(itemIds).associateBy { it.itemId }
    }
}
