package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.model.BookDetails
import com.universalmedialibrary.data.local.model.MediaItem
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object (DAO) for managing media items in the database.
 * This interface defines the methods for interacting with the `media_items` table,
 * providing functionality to insert, query, and update media item records.
 */
@Dao
interface MediaItemDao {

    /**
     * Inserts a new media item into the database. If a conflict occurs, the existing item is replaced.
     *
     * @param mediaItem The [MediaItem] object to insert or replace.
     * @return The row ID of the newly inserted item.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaItem(mediaItem: MediaItem): Long

    /**
     * Retrieves all media items belonging to a specific library, ordered by the date they were added.
     *
     * @param libraryId The unique identifier of the library.
     * @return A [Flow] that emits a list of [MediaItem]s, automatically updating on changes.
     */
    @Query("SELECT * FROM media_items WHERE libraryId = :libraryId ORDER BY dateAdded DESC")
    fun getMediaItemsForLibrary(libraryId: Long): Flow<List<MediaItem>>

    /**
     * Retrieves a specific media item from the database by its unique ID.
     *
     * @param itemId The unique identifier of the media item.
     * @return The corresponding [MediaItem], or `null` if not found.
     */
    @Query("SELECT * FROM media_items WHERE itemId = :itemId")
    suspend fun getMediaItemById(itemId: Long): MediaItem?

    /**
     * Retrieves a specific media item from the database by its file path.
     *
     * @param filePath The absolute file path of the media item.
     * @return The corresponding [MediaItem], or `null` if not found.
     */
    @Query("SELECT * FROM media_items WHERE filePath = :filePath")
    suspend fun getMediaItemByFilePath(filePath: String): MediaItem?

    /**
     * Retrieves detailed information about all books in a specific library.
     * This query joins media items with their common metadata and author information
     * to provide a comprehensive [BookDetails] object for each book.
     *
     * @param libraryId The unique identifier of the library.
     * @return A [Flow] that emits a list of [BookDetails], automatically updating on changes.
     */
    @Query(
        """
        SELECT
            mi.itemId as media_itemId,
            mi.libraryId as media_libraryId,
            mi.filePath as media_filePath,
            mi.dateAdded as media_dateAdded,
            mi.lastScanned as media_lastScanned,
            mi.fileHash as media_fileHash,
            mi.lastAccessed as media_lastAccessed,
            mi.playCount as media_playCount,
            mc.itemId as meta_itemId,
            mc.title as meta_title,
            mc.sortTitle as meta_sortTitle,
            mc.year as meta_year,
            mc.releaseDate as meta_releaseDate,
            mc.rating as meta_rating,
            mc.summary as meta_summary,
            mc.coverImagePath as meta_coverImagePath,
            mc.isFavorite as meta_isFavorite,
            mc.isDownloaded as meta_isDownloaded,
            p.name as authorName
        FROM media_items mi
        JOIN metadata_common mc ON mi.itemId = mc.itemId
        LEFT JOIN item_person_role ipr ON mi.itemId = ipr.itemId AND ipr.role = 'AUTHOR'
        LEFT JOIN people p ON ipr.personId = p.personId
        WHERE mi.libraryId = :libraryId
    """
    )
    fun getBookDetailsForLibrary(libraryId: Long): Flow<List<BookDetails>>

    /**
     * Retrieves detailed information for a single book by its unique ID.
     *
     * @param itemId The unique identifier of the book.
     * @return A [BookDetails] object containing comprehensive information, or `null` if not found.
     */
    @Query(
        """
        SELECT
            mi.itemId as media_itemId,
            mi.libraryId as media_libraryId,
            mi.filePath as media_filePath,
            mi.dateAdded as media_dateAdded,
            mi.lastScanned as media_lastScanned,
            mi.fileHash as media_fileHash,
            mi.lastAccessed as media_lastAccessed,
            mi.playCount as media_playCount,
            mc.itemId as meta_itemId,
            mc.title as meta_title,
            mc.sortTitle as meta_sortTitle,
            mc.year as meta_year,
            mc.releaseDate as meta_releaseDate,
            mc.rating as meta_rating,
            mc.summary as meta_summary,
            mc.coverImagePath as meta_coverImagePath,
            mc.isFavorite as meta_isFavorite,
            mc.isDownloaded as meta_isDownloaded,
            p.name as authorName
        FROM media_items mi
        JOIN metadata_common mc ON mi.itemId = mc.itemId
        LEFT JOIN item_person_role ipr ON mi.itemId = ipr.itemId AND ipr.role = 'AUTHOR'
        LEFT JOIN people p ON ipr.personId = p.personId
        WHERE mi.itemId = :itemId
        LIMIT 1
    """
    )
    suspend fun getBookDetailsById(itemId: Long): BookDetails?

    /**
     * Retrieves a media item from the database by its file path.
     *
     * @param path The absolute file path to search for.
     * @return The corresponding [MediaItem], or `null` if not found.
     */
    @Query("SELECT * FROM media_items WHERE filePath = :path LIMIT 1")
    suspend fun getItemByPath(path: String): MediaItem?

    /**
     * Updates the last accessed timestamp of a media item and increments its play count by one.
     *
     * @param itemId The unique identifier of the item to update.
     * @param date The new last accessed date as a Long timestamp.
     */
    @Query("UPDATE media_items SET lastAccessed = :date, playCount = playCount + 1 WHERE itemId = :itemId")
    suspend fun updateLastAccessed(itemId: Long, date: Long)

    /**
     * Gets the total number of media items in a specific library.
     *
     * @param libraryId The unique identifier of the library.
     * @return The total number of items as an [Int].
     */
    @Query("SELECT COUNT(*) FROM media_items WHERE libraryId = :libraryId")
    suspend fun getItemCountForLibrary(libraryId: Long): Int
}