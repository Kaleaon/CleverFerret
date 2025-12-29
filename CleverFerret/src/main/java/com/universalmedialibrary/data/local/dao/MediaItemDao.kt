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

    @Query("UPDATE media_items SET isFavorite = :isFavorite WHERE itemId = :itemId")
    suspend fun setFavorite(itemId: Long, isFavorite: Boolean)

    @Delete
    suspend fun deleteMediaItem(mediaItem: MediaItem)

    @Query("SELECT * FROM media_items WHERE fileName LIKE '%' || :query || '%' OR filePath LIKE '%' || :query || '%' LIMIT :limit")
    suspend fun searchMediaItems(query: String, limit: Int): List<MediaItem>
    
    /**
     * Advanced search with multiple filters for Universal Search Engine
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        LEFT JOIN metadata_common mc ON mi.itemId = mc.itemId
        WHERE (mi.fileName LIKE :query OR mc.title LIKE :query OR mc.summary LIKE :query)
        AND (:mediaTypes IS NULL OR mi.mediaType IN (:mediaTypes))
        AND (:minRating IS NULL OR mc.rating >= :minRating OR mc.userRating >= :minRating)
        AND (:maxRating IS NULL OR mc.rating <= :maxRating OR mc.userRating <= :maxRating)
        AND (:isFavorite IS NULL OR mi.isFavorite = :isFavorite)
        ORDER BY mi.dateAdded DESC
        LIMIT :limit
    """)
    suspend fun searchMediaItems(
        query: String,
        mediaTypes: List<String>?,
        minRating: Float?,
        maxRating: Float?,
        isFavorite: Boolean?,
        limit: Int
    ): List<MediaItem>
    
    /**
     * Get all media items as a Flow for reactive updates
     */
    @Query("SELECT * FROM media_items ORDER BY dateAdded DESC")
    fun getAllMediaItemsFlow(): Flow<List<MediaItem>>
    
    /**
     * Get media items with tags
     */
    @Query("""
        SELECT DISTINCT mi.* FROM media_items mi
        INNER JOIN item_tags it ON mi.itemId = it.itemId
        WHERE it.tagId IN (:tagIds)
        ORDER BY mi.dateAdded DESC
        LIMIT :limit
    """)
    suspend fun getMediaItemsWithTags(tagIds: List<Long>, limit: Int): List<MediaItem>
    
    /**
     * Get media items by multiple media types
     */
    @Query("SELECT * FROM media_items WHERE mediaType IN (:mediaTypes) ORDER BY dateAdded DESC LIMIT :limit")
    suspend fun getMediaItemsByTypes(mediaTypes: List<String>, limit: Int): List<MediaItem>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaItems(mediaItems: List<MediaItem>)

    @Query("SELECT COUNT(*) FROM media_items WHERE libraryId = :libraryId")
    suspend fun getItemCountByLibrary(libraryId: Long): Int

      @Query("SELECT * FROM media_items WHERE libraryId = :libraryId AND fileName = :fileName AND fileSize = :fileSize LIMIT 1")
      suspend fun findDuplicateByNameAndSize(libraryId: Long, fileName: String, fileSize: Long): MediaItem?

      @Query("SELECT * FROM media_items WHERE libraryId = :libraryId AND fileHash = :fileHash LIMIT 1")
      suspend fun findDuplicateByHash(libraryId: Long, fileHash: String): MediaItem?

    @Query("SELECT * FROM media_items WHERE isFavorite = 1 ORDER BY dateAdded DESC")
    fun getFavoriteMediaItems(): Flow<List<MediaItem>>

    @Query("SELECT COUNT(*) FROM media_items WHERE mediaType = :mediaType")
    suspend fun getItemCountByType(mediaType: String): Int

    @Query(
        """
        SELECT mediaType, COUNT(*) AS count
        FROM media_items
        WHERE libraryId = :libraryId
        GROUP BY mediaType
        """
    )
    suspend fun getItemCountsByTypeForLibrary(libraryId: Long): List<MediaTypeCount>

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

    /**
     * Get all media items for backup
     */
    @Query("SELECT * FROM media_items ORDER BY dateAdded DESC")
    suspend fun getAllMediaItems(): List<MediaItem>
    
    /**
     * Get books by series name
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN metadata_book mb ON mi.itemId = mb.itemId
        INNER JOIN series s ON mb.series = s.seriesId
        WHERE s.name = :seriesName
        ORDER BY mb.seriesIndex ASC
    """)
    suspend fun getBooksBySeries(seriesName: String): List<MediaItem>
    
    /**
     * Get all books that have series information
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN metadata_book mb ON mi.itemId = mb.itemId
        WHERE mb.series IS NOT NULL
        ORDER BY mi.dateAdded DESC
    """)
    suspend fun getBooksWithSeries(): List<MediaItem>
    
    /**
     * Get media items by genre
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN item_genre ig ON mi.itemId = ig.itemId
        INNER JOIN genre g ON ig.genreId = g.genreId
        WHERE g.name = :genreName AND mi.mediaType = :mediaType
        ORDER BY mi.dateAdded DESC
    """)
    fun getMediaItemsByGenre(genreName: String, mediaType: String): Flow<List<MediaItem>>
    
    /**
     * Get media items by multiple genres (any match)
     */
    @Query("""
        SELECT DISTINCT mi.* FROM media_items mi
        INNER JOIN item_genre ig ON mi.itemId = ig.itemId
        INNER JOIN genre g ON ig.genreId = g.genreId
        WHERE g.name IN (:genreNames) AND mi.mediaType = :mediaType
        ORDER BY mi.dateAdded DESC
    """)
    fun getMediaItemsByGenres(genreNames: List<String>, mediaType: String): Flow<List<MediaItem>>
    
    /**
     * Get media items by author name (for books and audiobooks)
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN metadata_book mb ON mi.itemId = mb.itemId
        INNER JOIN item_person_role ipr ON mi.itemId = ipr.itemId
        INNER JOIN people p ON ipr.personId = p.personId
        WHERE p.name = :authorName AND ipr.role = 'AUTHOR'
        ORDER BY mi.dateAdded DESC
    """)
    fun getMediaItemsByAuthor(authorName: String): Flow<List<MediaItem>>
    
    /**
     * Get media items by director (for movies and TV shows)
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN item_person_role ipr ON mi.itemId = ipr.itemId
        INNER JOIN people p ON ipr.personId = p.personId
        WHERE p.name = :directorName AND ipr.role = 'DIRECTOR' AND mi.mediaType IN ('MOVIE', 'TV_SHOW')
        ORDER BY mi.dateAdded DESC
    """)
    fun getMediaItemsByDirector(directorName: String): Flow<List<MediaItem>>
    
    // ==================== AI Library Browser Support ====================
    
    /**
     * Get items by type with pagination
     */
    @Query("SELECT * FROM media_items WHERE mediaType = :mediaType ORDER BY dateAdded DESC LIMIT :limit OFFSET :offset")
    suspend fun getByType(mediaType: String, limit: Int, offset: Int): List<MediaItem>
    
    /**
     * Get count by type
     */
    @Query("SELECT COUNT(*) FROM media_items WHERE mediaType = :mediaType")
    suspend fun getCountByType(mediaType: String): Int
    
    /**
     * Search by type and query
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        LEFT JOIN metadata_common mc ON mi.itemId = mc.itemId
        WHERE mi.mediaType = :mediaType 
        AND (mi.fileName LIKE :query OR mc.title LIKE :query)
        ORDER BY mi.dateAdded DESC
        LIMIT :limit OFFSET :offset
    """)
    suspend fun searchByTypeAndQuery(mediaType: String, query: String, limit: Int, offset: Int): List<MediaItem>
    
    /**
     * Search by query only
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        LEFT JOIN metadata_common mc ON mi.itemId = mc.itemId
        WHERE mi.fileName LIKE :query OR mc.title LIKE :query
        ORDER BY mi.dateAdded DESC
        LIMIT :limit OFFSET :offset
    """)
    suspend fun searchByQuery(query: String, limit: Int, offset: Int): List<MediaItem>
    
    /**
     * Get recent items with pagination
     */
    @Query("SELECT * FROM media_items ORDER BY dateAdded DESC LIMIT :limit OFFSET :offset")
    suspend fun getRecentItems(limit: Int, offset: Int): List<MediaItem>
    
    /**
     * Get items by author/artist name
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN item_person_role ipr ON mi.itemId = ipr.itemId
        INNER JOIN people p ON ipr.personId = p.personId
        WHERE p.name = :author AND ipr.role IN ('AUTHOR', 'ARTIST')
        ORDER BY mi.dateAdded DESC
        LIMIT :limit OFFSET :offset
    """)
    suspend fun getByAuthor(author: String, limit: Int, offset: Int): List<MediaItem>
    
    /**
     * Get items by genre
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN item_genre ig ON mi.itemId = ig.itemId
        INNER JOIN genre g ON ig.genreId = g.genreId
        WHERE g.name = :genre
        ORDER BY mi.dateAdded DESC
        LIMIT :limit OFFSET :offset
    """)
    suspend fun getByGenre(genre: String, limit: Int, offset: Int): List<MediaItem>
    
    /**
     * Get highly rated items
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN metadata_common mc ON mi.itemId = mc.itemId
        WHERE (:mediaType IS NULL OR mi.mediaType = :mediaType)
        AND mc.rating IS NOT NULL AND mc.rating > 0
        ORDER BY mc.rating DESC
        LIMIT :limit OFFSET :offset
    """)
    suspend fun getHighlyRated(mediaType: String?, limit: Int, offset: Int): List<MediaItem>
    
    /**
     * Get items by series ID
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN metadata_book mb ON mi.itemId = mb.itemId
        WHERE mb.series = :seriesId
        ORDER BY mb.seriesIndex ASC
        LIMIT :limit OFFSET :offset
    """)
    suspend fun getBySeries(seriesId: Long, limit: Int, offset: Int): List<MediaItem>
}

data class MediaTypeCount(
    val mediaType: String,
    val count: Int
)
