package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.entity.Library
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for library management operations
 * Provides abstraction layer between UI and data access
 */
@Singleton
class LibraryRepository @Inject constructor(
    private val libraryDao: LibraryDao
) {
    
    fun getAllActiveLibraries(): Flow<List<Library>> = libraryDao.getAllActiveLibraries()
    
    fun getAllLibraries(): Flow<List<Library>> = libraryDao.getAllLibraries()
    
    suspend fun getLibraryById(libraryId: Long): Library? = libraryDao.getLibraryById(libraryId)
    
    suspend fun getLibraryByPath(path: String): Library? = libraryDao.getLibraryByPath(path)
    
    fun getLibrariesByType(type: String): Flow<List<Library>> = 
        libraryDao.getLibrariesByTypeFlow(type)
    
    suspend fun createLibrary(library: Library): Long = libraryDao.insertLibrary(library)
    
    suspend fun updateLibrary(library: Library) = libraryDao.updateLibrary(library)
    
    suspend fun deleteLibrary(library: Library) = libraryDao.deleteLibrary(library)
    
    suspend fun toggleLibraryActive(libraryId: Long, isActive: Boolean) = 
        libraryDao.setLibraryActive(libraryId, System.currentTimeMillis())
    
    suspend fun updateLastScanned(libraryId: Long, timestamp: Long = System.currentTimeMillis()) = 
        libraryDao.updateLastScanned(libraryId, timestamp)
    
    suspend fun getActiveLibraryCount(): Int = libraryDao.getActiveLibraryCount()
    
    suspend fun getActiveLibraryCountByType(type: String): Int = 
        libraryDao.getActiveLibraryCountByType(type)
        
    suspend fun validateLibraryPath(path: String): Boolean {
        // Basic path validation - could be enhanced with file system checks
        return path.isNotBlank() && getLibraryByPath(path) == null
    }
    
    suspend fun getLibraryStats(): Map<String, Int> {
        val totalLibraries = getActiveLibraryCount()
        val bookLibraries = getActiveLibraryCountByType("BOOK")
        val musicLibraries = getActiveLibraryCountByType("MUSIC")
        val movieLibraries = getActiveLibraryCountByType("MOVIE")
        val otherLibraries = totalLibraries - bookLibraries - musicLibraries - movieLibraries
        
        return mapOf(
            "total" to totalLibraries,
            "books" to bookLibraries,
            "music" to musicLibraries,
            "movies" to movieLibraries,
            "other" to otherLibraries
        )
    }
}
