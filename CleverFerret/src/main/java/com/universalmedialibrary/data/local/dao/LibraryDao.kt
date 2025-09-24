package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.Library
import kotlinx.coroutines.flow.Flow

/**
 * DAO for Library operations
 */
@Dao
interface LibraryDao {
    
    @Query("SELECT * FROM libraries WHERE isActive = 1 ORDER BY name ASC")
    fun getAllActiveLibraries(): Flow<List<Library>>
    
    @Query("SELECT * FROM libraries ORDER BY name ASC")
    fun getAllLibraries(): Flow<List<Library>>
    
    @Query("SELECT * FROM libraries WHERE libraryId = :libraryId")
    suspend fun getLibraryById(libraryId: Long): Library?
    
    @Query("SELECT * FROM libraries WHERE path = :path")
    suspend fun getLibraryByPath(path: String): Library?
    
    @Query("SELECT * FROM libraries WHERE type = :type AND isActive = 1")
    fun getLibrariesByType(type: String): Flow<List<Library>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertLibrary(library: Library): Long
    
    @Update
    suspend fun updateLibrary(library: Library)
    
    @Delete
    suspend fun deleteLibrary(library: Library)
    
    @Query("UPDATE libraries SET isActive = :isActive WHERE libraryId = :libraryId")
    suspend fun setLibraryActive(libraryId: Long, isActive: Boolean)
    
    @Query("UPDATE libraries SET lastScanned = :timestamp WHERE libraryId = :libraryId")
    suspend fun updateLastScanned(libraryId: Long, timestamp: Long)
    
    @Query("SELECT COUNT(*) FROM libraries WHERE isActive = 1")
    suspend fun getActiveLibraryCount(): Int
    
    @Query("SELECT COUNT(*) FROM libraries WHERE type = :type AND isActive = 1")
    suspend fun getActiveLibraryCountByType(type: String): Int
}