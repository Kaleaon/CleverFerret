package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.model.Library
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
    
    @Query("DELETE FROM libraries WHERE libraryId = :libraryId")
    suspend fun deleteLibrary(libraryId: Long)
    
    @Query("UPDATE libraries SET dateModified = :date WHERE libraryId = :libraryId")
    suspend fun updateLibraryModifiedDate(libraryId: Long, date: java.util.Date)
}
