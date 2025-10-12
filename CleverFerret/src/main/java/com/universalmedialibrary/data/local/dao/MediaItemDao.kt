package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import androidx.room.Delete
import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.flow.Flow

@Dao
interface MediaItemDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaItem(mediaItem: MediaItem): Long

    @Query("SELECT * FROM media_items WHERE libraryId = :libraryId ORDER BY dateAdded DESC")
    fun getMediaItemsForLibrary(libraryId: Long): Flow<List<MediaItem>>

    @Query("SELECT * FROM media_items WHERE itemId = :itemId")
    suspend fun getMediaItemById(itemId: Long): MediaItem?

    @Query("SELECT * FROM media_items WHERE filePath = :filePath")
    suspend fun getMediaItemByFilePath(filePath: String): MediaItem?

    @Query("SELECT * FROM media_items WHERE filePath = :path LIMIT 1")
    suspend fun getItemByPath(path: String): MediaItem?

    @Query("SELECT COUNT(*) FROM media_items WHERE libraryId = :libraryId")
    suspend fun getItemCountForLibrary(libraryId: Long): Int
    
    @Query("SELECT COUNT(*) FROM media_items")
    suspend fun getMediaItemCount(): Int

    // Additional methods needed by MediaRepository
    @Query("SELECT * FROM media_items WHERE libraryId = :libraryId ORDER BY dateAdded DESC")
    fun getMediaItemsByLibrary(libraryId: Long): Flow<List<MediaItem>>

    @Query("SELECT * FROM media_items WHERE filePath = :filePath LIMIT 1")
    suspend fun getMediaItemByPath(filePath: String): MediaItem?

    @Query("SELECT * FROM media_items WHERE mediaType = :mediaType ORDER BY dateAdded DESC")
    fun getMediaItemsByType(mediaType: String): Flow<List<MediaItem>>

    @Update
    suspend fun updateMediaItem(mediaItem: MediaItem)

    @Delete
    suspend fun deleteMediaItem(mediaItem: MediaItem)

    @Query("SELECT * FROM media_items WHERE fileName LIKE '%' || :query || '%' OR filePath LIKE '%' || :query || '%' LIMIT :limit")
    suspend fun searchMediaItems(query: String, limit: Int): List<MediaItem>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaItems(mediaItems: List<MediaItem>)

    @Query("SELECT COUNT(*) FROM media_items WHERE libraryId = :libraryId")
    suspend fun getItemCountByLibrary(libraryId: Long): Int

    @Query("SELECT COUNT(*) FROM media_items WHERE mediaType = :mediaType")
    suspend fun getItemCountByType(mediaType: String): Int

    /**
     * Get book details for a library - returns a flow of MediaItems for books
     * The actual BookDetails combination will be done in the repository/viewmodel layer
     */
    @Query("SELECT * FROM media_items WHERE libraryId = :libraryId AND mediaType = 'BOOK' ORDER BY dateAdded DESC")
    fun getBookDetailsForLibrary(libraryId: Long): Flow<List<MediaItem>>

    /**
     * Get book details by ID
     * Note: This returns MediaItem, not BookDetails. The repository layer
     * should combine MediaItem with metadata to create BookDetails
     */
    @Query("SELECT * FROM media_items WHERE itemId = :bookId AND mediaType = 'BOOK'")
    suspend fun getBookDetailsById(bookId: Long): MediaItem?
}
