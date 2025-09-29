package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.model.Genre
import com.universalmedialibrary.data.local.model.ItemGenre
import com.universalmedialibrary.data.local.model.ItemPersonRole
import com.universalmedialibrary.data.local.model.MetadataBook
import com.universalmedialibrary.data.local.model.MetadataCommon
import com.universalmedialibrary.data.local.model.MetadataMovie
import com.universalmedialibrary.data.local.model.People
import com.universalmedialibrary.data.local.model.Series

/**
 * Data Access Object (DAO) for metadata-related entities.
 *
 * This interface defines the database interactions for managing various types of metadata,
 * including common metadata, book-specific details, movie-specific details, genres, people, and series.
 */
@Dao
interface MetadataDao {
    /**
     * Inserts common metadata for a media item. If a record with the same primary key
     * already exists, it will be replaced.
     *
     * @param metadataCommon The [MetadataCommon] object to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataCommon(metadataCommon: MetadataCommon)

    /**
     * Inserts book-specific metadata for a media item. If a record with the same primary key
     * already exists, it will be replaced.
     *
     * @param metadataBook The [MetadataBook] object to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataBook(metadataBook: MetadataBook)

    /**
     * Inserts movie-specific metadata for a media item. If a record with the same primary key
     * already exists, it will be replaced.
     *
     * @param metadataMovie The [MetadataMovie] object to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataMovie(metadataMovie: MetadataMovie)

    /**
     * Finds a genre by its name.
     *
     * @param name The name of the genre to find.
     * @return The ID of the genre if found, otherwise null.
     */
    @Query("SELECT genreId FROM genres WHERE name = :name")
    suspend fun findGenreByName(name: String): Long?

    /**
     * Inserts a new genre into the database. If a genre with the same name already exists,
     * the insert is ignored.
     *
     * @param genre The [Genre] object to insert.
     * @return The row ID of the newly inserted genre, or -1 if the genre already exists.
     */
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertGenre(genre: Genre): Long

    /**
     * Associates a genre with a media item by inserting a record into the join table.
     * If the association already exists, it is replaced.
     *
     * @param itemGenre The [ItemGenre] object representing the association.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertItemGenre(itemGenre: ItemGenre)

    /**
     * Finds a person by their name.
     *
     * @param name The name of the person to find.
     * @return The ID of the person if found, otherwise null.
     */
    @Query("SELECT personId FROM people WHERE name = :name")
    suspend fun findPersonByName(name: String): Long?

    /**
     * Inserts a new person into the database. If a person with the same name already exists,
     * the insert is ignored.
     *
     * @param people The [People] object to insert.
     * @return The row ID of the newly inserted person, or -1 if the person already exists.
     */
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertPerson(people: People): Long

    /**
     * Associates a person with a media item and assigns them a role by inserting a record
     * into the join table. If the association already exists, it is replaced.
     *
     * @param itemPersonRole The [ItemPersonRole] object representing the association.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertItemPersonRole(itemPersonRole: ItemPersonRole)

    /**
     * Finds a series by its name.
     *
     * @param name The name of the series to find.
     * @return The ID of the series if found, otherwise null.
     */
    @Query("SELECT seriesId FROM series WHERE name = :name")
    suspend fun findSeriesByName(name: String): Long?

    /**
     * Inserts a new series into the database. If a series with the same name already exists,
     * the insert is ignored.
     *
     * @param series The [Series] object to insert.
     * @return The row ID of the newly inserted series, or -1 if the series already exists.
     */
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertSeries(series: Series): Long

    /**
     * Updates the series ID for a book's metadata record.
     *
     * @param itemId The ID of the media item (book) to update.
     * @param seriesId The ID of the series to associate with the book.
     */
    @Query("UPDATE metadata_book SET seriesId = :seriesId WHERE itemId = :itemId")
    suspend fun updateBookWithSeries(itemId: Long, seriesId: Long)
}
