package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.MediaCacheItem
import kotlinx.coroutines.flow.Flow

@Dao
interface MediaCacheDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCacheItem(item: MediaCacheItem)

    @Update
    suspend fun updateCacheItem(item: MediaCacheItem)

    @Query("SELECT * FROM media_cache_items WHERE itemId = :itemId")
    suspend fun getCacheItemByItemId(itemId: Long): MediaCacheItem?

    @Query("SELECT * FROM media_cache_items WHERE remoteUri = :remoteUri")
    suspend fun getCacheItemByRemoteUri(remoteUri: String): MediaCacheItem?

    @Query("SELECT * FROM media_cache_items WHERE itemId = :itemId")
    fun observeCacheItemByItemId(itemId: Long): Flow<MediaCacheItem?>

    @Query("SELECT * FROM media_cache_items ORDER BY createdAt DESC")
    fun getAllCacheItems(): Flow<List<MediaCacheItem>>

    @Query("SELECT * FROM media_cache_items WHERE downloadState = :downloadState")
    suspend fun getCacheItemsByState(downloadState: String): List<MediaCacheItem>

    @Query("UPDATE media_cache_items SET downloadedBytes = :downloadedBytes, fileSize = :fileSize, downloadState = :downloadState WHERE itemId = :itemId")
    suspend fun updateDownloadProgress(itemId: Long, downloadedBytes: Long, fileSize: Long, downloadState: String)

    @Query("UPDATE media_cache_items SET downloadState = :downloadState, errorMessage = :errorMessage WHERE itemId = :itemId")
    suspend fun updateDownloadState(itemId: Long, downloadState: String, errorMessage: String? = null)

    @Query("UPDATE media_cache_items SET isPinned = :isPinned WHERE itemId = :itemId")
    suspend fun updatePinned(itemId: Long, isPinned: Boolean)

    @Query("UPDATE media_cache_items SET lastAccessed = :lastAccessed WHERE itemId = :itemId")
    suspend fun updateLastAccessed(itemId: Long, lastAccessed: Long = System.currentTimeMillis())

    @Query("SELECT * FROM media_cache_items WHERE downloadState = 'CACHED' AND isPinned = 0 ORDER BY lastAccessed ASC")
    suspend fun getUnpinnedCachedItemsLRU(): List<MediaCacheItem>

    @Query("SELECT SUM(fileSize) FROM media_cache_items WHERE downloadState = 'CACHED'")
    suspend fun getTotalCachedSizeBytes(): Long?

    @Delete
    suspend fun deleteCacheItem(item: MediaCacheItem)

    @Query("DELETE FROM media_cache_items WHERE itemId = :itemId")
    suspend fun deleteCacheItemByItemId(itemId: Long)
}
