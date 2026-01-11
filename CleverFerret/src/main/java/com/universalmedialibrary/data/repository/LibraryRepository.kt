package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.LibraryScanSettingsDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.LibraryScanSettings
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for library management operations
 * Provides abstraction layer between UI and data access
 */
@Singleton
class LibraryRepository @Inject constructor(
    private val libraryDao: LibraryDao,
    private val libraryScanSettingsDao: LibraryScanSettingsDao
) {

    fun getAllActiveLibraries(): Flow<List<Library>> = libraryDao.getAllActiveLibraries()

    fun getAllLibraries(): Flow<List<Library>> = libraryDao.getAllLibraries()

    suspend fun getLibraryById(libraryId: Long): Library? = libraryDao.getLibraryById(libraryId)

    suspend fun getLibraryByPath(path: String): Library? = libraryDao.getLibraryByPath(path)

    fun getLibrariesByType(type: String): Flow<List<Library>> =
        libraryDao.getLibrariesByTypeFlow(type)

    suspend fun createLibrary(library: Library): Long {
        val libraryId = libraryDao.insertLibrary(library)
        if (libraryId > 0) {
            val defaults = LibraryScanSettings.defaults(libraryId, library.path)
            libraryScanSettingsDao.upsert(defaults)
        }
        return libraryId
    }

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

    /**
     * Get or create the default unified library
     * This is the primary library that contains all media types.
     * Uses @Synchronized to prevent race conditions during concurrent calls.
     */
    @Synchronized
    suspend fun getOrCreateDefaultLibrary(): Library {
        // Try to find an existing default library by name (not by hard-coded ID)
        val existingLibrary = libraryDao.getLibraryByName("My Library")
            ?: libraryDao.getLibraryByName("Universal Media Library")
        
        if (existingLibrary != null) {
            return existingLibrary
        }
        
        // Create the default unified library
        // Note: Uses "ALL" type which is a virtual library type that doesn't require scanning
        val defaultLibrary = Library(
            libraryId = 0,
            name = "My Library",
            type = "ALL", // Unified library supports all media types
            path = "", // Empty path - this is a virtual unified library, not a file-based one
            source = "VIRTUAL", // Mark as virtual to distinguish from file-based libraries
            description = "Your unified media library",
            isActive = true
        )
        
        val id = libraryDao.insertLibrary(defaultLibrary)
        val library = defaultLibrary.copy(libraryId = id)
        
        // Initialize scan settings for consistency with createLibrary()
        val defaults = LibraryScanSettings.defaults(id, library.path)
        libraryScanSettingsDao.upsert(defaults)
        
        return library
    }
    
    /**
     * Get the default library ID, creating it if it doesn't exist
     */
    suspend fun getDefaultLibraryId(): Long {
        return getOrCreateDefaultLibrary().libraryId
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

    suspend fun getScanSettings(libraryId: Long, fallbackPath: String = ""): LibraryScanSettings {
        val existing = libraryScanSettingsDao.getSettings(libraryId)
        if (existing != null) return existing
        val libraryPath = if (fallbackPath.isNotBlank()) {
            fallbackPath
        } else {
            libraryDao.getLibraryById(libraryId)?.path ?: ""
        }
        val defaults = LibraryScanSettings.defaults(libraryId, libraryPath)
        libraryScanSettingsDao.upsert(defaults)
        return defaults
    }

    fun observeScanSettings(libraryId: Long): Flow<LibraryScanSettings?> =
        libraryScanSettingsDao.observeSettings(libraryId)

    suspend fun updateScanSettings(settings: LibraryScanSettings) {
        libraryScanSettingsDao.upsert(
            settings.copy(lastUpdated = System.currentTimeMillis())
        )
    }
}
