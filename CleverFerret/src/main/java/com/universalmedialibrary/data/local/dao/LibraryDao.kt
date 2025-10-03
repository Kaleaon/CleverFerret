package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import androidx.room.Delete
import com.universalmedialibrary.data.local.entity.Library
import kotlinx.coroutines.flow.Flow

@Dao
interface LibraryDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertLibrary(library: Library): Long

    @Query("SELECT * FROM libraries ORDER BY name ASC")
    fun getAllLibraries(): Flow<List<Library>>

    @Query("SELECT * FROM libraries WHERE libraryId = :libraryId")
    suspend fun getLibraryById(libraryId: Long): Library?

    @Query("SELECT * FROM libraries WHERE type = :type")
    suspend fun getLibrariesByType(type: String): List<Library>

    @Query("SELECT * FROM libraries WHERE type = :type")
    fun getLibrariesByTypeFlow(type: String): Flow<List<Library>>

    @Query("DELETE FROM libraries WHERE libraryId = :libraryId")
    suspend fun deleteLibraryById(libraryId: Long)

    @Update
    suspend fun updateLibrary(library: Library)

    @Delete
    suspend fun deleteLibrary(library: Library)

    @Query("UPDATE libraries SET dateModified = :date WHERE libraryId = :libraryId")
    suspend fun updateLibraryModifiedDate(libraryId: Long, date: Long)

    // Additional methods needed by LibraryRepository
    @Query("SELECT * FROM libraries ORDER BY name ASC")
    fun getAllActiveLibraries(): Flow<List<Library>>

    @Query("SELECT * FROM libraries WHERE path = :path LIMIT 1")
    suspend fun getLibraryByPath(path: String): Library?


    @Query("SELECT * FROM libraries WHERE name = :name LIMIT 1")
    suspend fun getLibraryByName(name: String): Library?


    @Query("UPDATE libraries SET dateModified = :timestamp WHERE libraryId = :libraryId")
    suspend fun updateLastScanned(libraryId: Long, timestamp: Long)

    @Query("SELECT COUNT(*) FROM libraries")
    suspend fun getActiveLibraryCount(): Int

    @Query("SELECT COUNT(*) FROM libraries WHERE type = :type")
    suspend fun getActiveLibraryCountByType(type: String): Int

    // Additional method for LibraryRepository
    @Query("UPDATE libraries SET dateModified = :timestamp WHERE libraryId = :libraryId")
    suspend fun setLibraryActive(libraryId: Long, timestamp: Long)
}
