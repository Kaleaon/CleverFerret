package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.flow.Flow

/**
 * DAO for MediaItem operations
 */
@Dao
interface MediaItemDao {
    
    @Query("SELECT * FROM media_items WHERE libraryId = :libraryId AND isAvailable = 1 ORDER BY fileName ASC")
    fun getMediaItemsByLibrary(libraryId: Long): Flow<List<MediaItem>>
    
    @Query("SELECT * FROM media_items WHERE itemId = :itemId")
    suspend fun getMediaItemById(itemId: Long): MediaItem?
    
    @Query("SELECT * FROM media_items WHERE filePath = :filePath")
    suspend fun getMediaItemByPath(filePath: String): MediaItem?
    
    @Query("SELECT * FROM media_items WHERE mediaType = :mediaType AND isAvailable = 1")
    fun getMediaItemsByType(mediaType: String): Flow<List<MediaItem>>
    
    @Query("SELECT * FROM media_items WHERE fileHash = :hash AND isAvailable = 1")
    suspend fun getMediaItemsByHash(hash: String): List<MediaItem>
    
    @Query("SELECT * FROM media_items WHERE hasMetadata = 0 AND isAvailable = 1 LIMIT :limit")
    suspend fun getItemsWithoutMetadata(limit: Int = 50): List<MediaItem>
    
    @Query("SELECT * FROM media_items WHERE hasThumbnail = 0 AND isAvailable = 1 LIMIT :limit")
    suspend fun getItemsWithoutThumbnails(limit: Int = 50): List<MediaItem>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaItem(mediaItem: MediaItem): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaItems(mediaItems: List<MediaItem>): List<Long>
    
    @Update
    suspend fun updateMediaItem(mediaItem: MediaItem)
    
    @Delete
    suspend fun deleteMediaItem(mediaItem: MediaItem)
    
    @Query("UPDATE media_items SET isAvailable = :isAvailable WHERE itemId = :itemId")
    suspend fun setItemAvailable(itemId: Long, isAvailable: Boolean)
    
    @Query("UPDATE media_items SET hasMetadata = :hasMetadata WHERE itemId = :itemId")
    suspend fun setHasMetadata(itemId: Long, hasMetadata: Boolean)
    
    @Query("UPDATE media_items SET hasThumbnail = :hasThumbnail, thumbnailPath = :thumbnailPath WHERE itemId = :itemId")
    suspend fun setThumbnail(itemId: Long, hasThumbnail: Boolean, thumbnailPath: String?)
    
    @Query("UPDATE media_items SET lastScanned = :timestamp WHERE itemId = :itemId")
    suspend fun updateLastScanned(itemId: Long, timestamp: Long)
    
    @Query("SELECT COUNT(*) FROM media_items WHERE libraryId = :libraryId AND isAvailable = 1")
    suspend fun getItemCountByLibrary(libraryId: Long): Int
    
    @Query("SELECT COUNT(*) FROM media_items WHERE mediaType = :mediaType AND isAvailable = 1")
    suspend fun getItemCountByType(mediaType: String): Int
    
    @Query("DELETE FROM media_items WHERE isAvailable = 0 AND lastScanned < :cutoffTime")
    suspend fun cleanupUnavailableItems(cutoffTime: Long): Int
    
    // Search functionality
    @Query("""
        SELECT * FROM media_items 
        WHERE (fileName LIKE '%' || :query || '%' OR filePath LIKE '%' || :query || '%') 
        AND isAvailable = 1 
        ORDER BY fileName ASC
        LIMIT :limit
    """)
    suspend fun searchMediaItems(query: String, limit: Int = 50): List<MediaItem>
}