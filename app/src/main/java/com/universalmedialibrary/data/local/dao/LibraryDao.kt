package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.model.Library
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object (DAO) for [Library] entities.
 *
 * This interface defines the database interactions for managing libraries,
 * including inserting and retrieving library data.
 */
@Dao
interface LibraryDao {
    /**
     * Inserts a new library into the database or replaces it if it already exists.
     *
     * @param library The [Library] object to insert.
     * @return The row ID of the newly inserted library.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertLibrary(library: Library): Long

    /**
     * Retrieves all libraries from the database, ordered by name in ascending order.
     *
     * @return A [Flow] emitting a list of all [Library] objects.
     */
    @Query("SELECT * FROM libraries ORDER BY name ASC")
    fun getAllLibraries(): Flow<List<Library>>
}
