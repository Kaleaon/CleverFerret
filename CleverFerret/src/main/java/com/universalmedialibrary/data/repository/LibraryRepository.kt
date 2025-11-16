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
