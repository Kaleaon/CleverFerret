package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.model.BookDetails
import com.universalmedialibrary.data.local.model.MediaItem
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object (DAO) for [MediaItem] entities.
 *
 * This interface defines the database interactions for managing media items,
 * including inserting, retrieving, and deleting them. It also provides
 * queries to fetch detailed information by joining multiple tables.
 */
@Dao
interface MediaItemDao {
    /**
     * Inserts a new media item into the database or replaces it if it already exists.
     *
     * @param mediaItem The [MediaItem] object to insert.
     * @return The row ID of the newly inserted media item.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaItem(mediaItem: MediaItem): Long

    /**
     * Retrieves all media items for a specific library, ordered by the date they were added.
     *
     * @param libraryId The ID of the library whose media items are to be retrieved.
     * @return A [Flow] emitting a list of [MediaItem] objects.
     */
    @Query("SELECT * FROM media_items WHERE libraryId = :libraryId ORDER BY dateAdded DESC")
    fun getMediaItemsForLibrary(libraryId: Long): Flow<List<MediaItem>>

    /**
     * Retrieves a single media item by its unique ID.
     *
     * @param itemId The ID of the media item to retrieve.
     * @return The [MediaItem] object if found, otherwise null.
     */
    @Query("SELECT * FROM media_items WHERE itemId = :itemId")
    suspend fun getMediaItemById(itemId: Long): MediaItem?

    /**
     * Retrieves detailed information for all books in a specific library.
     *
     * This query joins the `media_items`, `metadata_common`, and `people` tables to construct
     * a list of [BookDetails] objects, which include the core media item data, common metadata,
     * and the author's name.
     *
     * @param libraryId The ID of the library to retrieve book details from.
     * @return A [Flow] emitting a list of [BookDetails] objects.
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
            mc.itemId as meta_itemId,
            mc.title as meta_title,
            mc.sortTitle as meta_sortTitle,
            mc.year as meta_year,
            mc.releaseDate as meta_releaseDate,
            mc.rating as meta_rating,
            mc.summary as meta_summary,
            mc.coverImagePath as meta_coverImagePath,
            p.name as authorName
        FROM media_items mi
        JOIN metadata_common mc ON mi.itemId = mc.itemId
        LEFT JOIN item_person_role ipr ON mi.itemId = ipr.itemId AND ipr.role = 'AUTHOR'
        LEFT JOIN people p ON ipr.personId = p.personId
        WHERE mi.libraryId = :libraryId
    """,
    )
    fun getBookDetailsForLibrary(libraryId: Long): Flow<List<BookDetails>>

    /**
     * Deletes a media item from the database by its ID.
     *
     * @param itemId The ID of the media item to delete.
     */
    @Query("DELETE FROM media_items WHERE itemId = :itemId")
    suspend fun deleteMediaItemById(itemId: Long)

    /**
     * Deletes a media item and its associated metadata in a single transaction.
     *
     * This method is annotated with `@Transaction` to ensure that the deletion is atomic.
     * Room's foreign key constraints with `onDelete = CASCADE` will handle the automatic
     * deletion of related metadata entries.
     *
     * @param itemId The ID of the media item to delete.
     */
    @androidx.room.Transaction
    suspend fun deleteMediaItem(itemId: Long) {
        // Simply delete the media item; related metadata will be deleted automatically.
        deleteMediaItemById(itemId)
    }
}
