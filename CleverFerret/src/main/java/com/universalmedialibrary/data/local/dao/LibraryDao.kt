package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.model.Library
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object (DAO) for managing libraries in the database.
 * This interface defines the methods for creating, reading, updating, and deleting
 * libraries, which serve as the top-level organizational units for media items.
 */
@Dao
interface LibraryDao {

    /**
     * Inserts a new library into the database. If a conflict occurs, the existing library is replaced.
     *
     * @param library The [Library] object to insert or replace.
     * @return The row ID of the newly inserted library.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertLibrary(library: Library): Long

    /**
     * Retrieves all libraries from the database, ordered alphabetically by name.
     *
     * @return A [Flow] that emits a list of all [Library] objects, automatically updating on changes.
     */
    @Query("SELECT * FROM libraries ORDER BY name ASC")
    fun getAllLibraries(): Flow<List<Library>>

    /**
     * Retrieves a specific library from the database by its unique ID.
     *
     * @param libraryId The unique identifier of the library to retrieve.
     * @return The corresponding [Library] object, or `null` if not found.
     */
    @Query("SELECT * FROM libraries WHERE libraryId = :libraryId")
    suspend fun getLibraryById(libraryId: Long): Library?

    /**
     * Retrieves all libraries of a specific media type (e.g., "BOOK", "MOVIE").
     *
     * @param type The string representation of the media type.
     * @return A list of [Library] objects that match the specified type.
     */
    @Query("SELECT * FROM libraries WHERE type = :type")
    suspend fun getLibrariesByType(type: String): List<Library>

    /**
     * Deletes a library from the database using its unique ID.
     *
     * @param libraryId The unique identifier of the library to delete.
     */
    @Query("DELETE FROM libraries WHERE libraryId = :libraryId")
    suspend fun deleteLibrary(libraryId: Long)

    /**
     * Updates the last modified timestamp of a specific library.
     *
     * @param libraryId The unique identifier of the library to update.
     * @param date The new last modified date as a Long timestamp.
     */
    @Query("UPDATE libraries SET dateModified = :date WHERE libraryId = :libraryId")
    suspend fun updateLibraryModifiedDate(libraryId: Long, date: Long)
}
