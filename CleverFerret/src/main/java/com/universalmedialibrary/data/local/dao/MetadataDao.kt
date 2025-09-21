package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.model.*

/**
 * Data Access Object (DAO) for managing all forms of metadata in the database.
 * This includes common metadata applicable to all media types, type-specific metadata
 * (e.g., for books, movies), and the relationships between media items and
 * entities like genres, people, and series.
 */
@Dao
interface MetadataDao {

    // --- General Metadata Insertion/Update ---

    /**
     * Inserts or replaces common metadata for a media item.
     * @param metadataCommon The [MetadataCommon] object to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataCommon(metadataCommon: MetadataCommon)

    /**
     * Updates an existing common metadata record.
     * @param metadataCommon The [MetadataCommon] object to update.
     */
    @Update
    suspend fun updateMetadata(metadataCommon: MetadataCommon)

    /**
     * Inserts or replaces book-specific metadata.
     * @param metadataBook The [MetadataBook] object to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataBook(metadataBook: MetadataBook)

    /**
     * Inserts or replaces movie-specific metadata.
     * @param metadataMovie The [MetadataMovie] object to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataMovie(metadataMovie: MetadataMovie)

    /**
     * Inserts or replaces music track-specific metadata.
     * @param metadata The [MetadataMusicTrack] object to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMusicTrackMetadata(metadata: MetadataMusicTrack)

    // --- Relationship Management (Genres, People, Series) ---

    /**
     * Finds a genre by its name.
     * @param name The name of the genre to find.
     * @return The ID of the genre, or `null` if not found.
     */
    @Query("SELECT genreId FROM genres WHERE name = :name")
    suspend fun findGenreByName(name: String): Long?

    /**
     * Inserts a new genre, ignoring conflicts if it already exists.
     * @param genre The [Genre] to insert.
     * @return The row ID of the newly inserted or existing genre.
     */
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertGenre(genre: Genre): Long

    /**
     * Creates an association between a media item and a genre.
     * @param itemGenre The [ItemGenre] relationship to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertItemGenre(itemGenre: ItemGenre)

    /**
     * Finds a person (e.g., author, director) by their name.
     * @param name The name of the person to find.
     * @return The ID of the person, or `null` if not found.
     */
    @Query("SELECT personId FROM people WHERE name = :name")
    suspend fun findPersonByName(name: String): Long?

    /**
     * Inserts a new person, ignoring conflicts if they already exist.
     * @param people The [People] object to insert.
     * @return The row ID of the newly inserted or existing person.
     */
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertPerson(people: People): Long

    /**
     * Creates an association between a person and a media item with a specific role.
     * @param itemPersonRole The [ItemPersonRole] relationship to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertItemPersonRole(itemPersonRole: ItemPersonRole)

    /**
     * Finds a series by its name.
     * @param name The name of the series to find.
     * @return The ID of the series, or `null` if not found.
     */
    @Query("SELECT seriesId FROM series WHERE name = :name")
    suspend fun findSeriesByName(name: String): Long?

    /**
     * Inserts a new series, ignoring conflicts if it already exists.
     * @param series The [Series] to insert.
     * @return The row ID of the newly inserted or existing series.
     */
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertSeries(series: Series): Long

    /**
     * Associates a book with a series by updating its series ID.
     * @param itemId The ID of the book.
     * @param seriesId The ID of the series.
     */
    @Query("UPDATE metadata_book SET seriesId = :seriesId WHERE itemId = :itemId")
    suspend fun updateBookWithSeries(itemId: Long, seriesId: Long)

    // --- Metadata Retrieval ---

    /**
     * Retrieves the common metadata for a specific media item.
     * @param itemId The ID of the media item.
     * @return The [MetadataCommon] object, or `null` if not found.
     */
    @Query("SELECT * FROM metadata_common WHERE itemId = :itemId")
    suspend fun getMetadataCommonByItemId(itemId: Long): MetadataCommon?

    /**
     * Retrieves the book-specific metadata for a media item.
     * @param itemId The ID of the media item.
     * @return The [MetadataBook] object, or `null` if not found.
     */
    @Query("SELECT * FROM metadata_book WHERE itemId = :itemId")
    suspend fun getMetadataBookByItemId(itemId: Long): MetadataBook?

    /**
     * Retrieves the movie-specific metadata for a media item.
     * @param itemId The ID of the media item.
     * @return The [MetadataMovie] object, or `null` if not found.
     */
    @Query("SELECT * FROM metadata_movie WHERE itemId = :itemId")
    suspend fun getMetadataMovieByItemId(itemId: Long): MetadataMovie?

    /**
     * Retrieves the names of all authors associated with a specific media item.
     * @param itemId The ID of the media item.
     * @return A list of author names.
     */
    @Query("""
        SELECT p.name FROM people p 
        INNER JOIN item_person_role ipr ON p.personId = ipr.personId 
        WHERE ipr.itemId = :itemId AND ipr.role = 'AUTHOR'
    """)
    suspend fun getAuthorsByItemId(itemId: Long): List<String>

    /**
     * Retrieves the name of the series a specific book belongs to.
     * @param itemId The ID of the book.
     * @return The name of the series, or `null` if the book is not part of a series.
     */
    @Query("""
        SELECT s.name FROM series s 
        INNER JOIN metadata_book mb ON s.seriesId = mb.seriesId 
        WHERE mb.itemId = :itemId
    """)
    suspend fun getSeriesByItemId(itemId: Long): String?

    /**
     * Retrieves the names of all genres associated with a specific media item.
     * @param itemId The ID of the media item.
     * @return A list of genre names.
     */
    @Query("""
        SELECT g.name FROM genres g 
        INNER JOIN item_genre ig ON g.genreId = ig.genreId 
        WHERE ig.itemId = :itemId
    """)
    suspend fun getGenresByItemId(itemId: Long): List<String>

    // --- Metadata Update and Deletion ---

    /**
     * Updates the core fields (title, sort title, summary, rating) of a media item's common metadata.
     * @param itemId The ID of the item to update.
     * @param title The new title.
     * @param sortTitle The new sort title.
     * @param summary The new summary.
     * @param rating The new user rating.
     */
    @Query("UPDATE metadata_common SET title = :title, sortTitle = :sortTitle, summary = :summary, rating = :rating WHERE itemId = :itemId")
    suspend fun updateMetadataCommon(itemId: Long, title: String, sortTitle: String?, summary: String?, rating: Float?)

    /**
     * Updates the core fields (subtitle, publisher, ISBN) of a book's specific metadata.
     * @param itemId The ID of the book to update.
     * @param subtitle The new subtitle.
     * @param publisher The new publisher.
     * @param isbn The new ISBN.
     */
    @Query("UPDATE metadata_book SET subtitle = :subtitle, publisher = :publisher, isbn = :isbn WHERE itemId = :itemId")
    suspend fun updateMetadataBook(itemId: Long, subtitle: String?, publisher: String?, isbn: String?)

    /**
     * Deletes all author associations for a specific media item.
     * @param itemId The ID of the media item whose author links should be removed.
     */
    @Query("DELETE FROM item_person_role WHERE itemId = :itemId AND role = 'AUTHOR'")
    suspend fun deleteAuthorsByItemId(itemId: Long)

    /**
     * Deletes all genre associations for a specific media item.
     * @param itemId The ID of the media item whose genre links should be removed.
     */
    @Query("DELETE FROM item_genre WHERE itemId = :itemId")
    suspend fun deleteGenresByItemId(itemId: Long)

    /**
     * Inserts or replaces common metadata for a media item.
     * @param metadata The [MetadataCommon] object to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCommonMetadata(metadata: MetadataCommon)

    /**
     * Inserts or replaces movie-specific metadata.
     * @param metadata The [MetadataMovie] object to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMovieMetadata(metadata: MetadataMovie)
}
