package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.MediaFileDao
import com.universalmedialibrary.data.local.MediaFileEntity
import com.universalmedialibrary.services.media.MediaFile
import com.universalmedialibrary.services.media.MediaScannerService
import com.universalmedialibrary.services.media.MediaType
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Media Library Repository - ACTUAL WORKING IMPLEMENTATION
 * 
 * Manages the media library by coordinating between file scanning and database storage.
 * This actually maintains a real database of media files found on the device.
 */
@Singleton
class MediaLibraryRepository @Inject constructor(
    private val mediaFileDao: MediaFileDao,
    private val mediaScannerService: MediaScannerService
) {
    
    /**
     * Scan device and update database with found media files
     */
    suspend fun scanAndUpdateLibrary(): ScanResult = withContext(Dispatchers.IO) {
        try {
            // Scan device for media files
            val scannedFiles = mediaScannerService.scanForMediaFiles()
            
            // Convert to database entities
            val entities = scannedFiles.map { it.toEntity() }
            
            // Insert/update in database
            mediaFileDao.insertFiles(entities)
            
            // Clean up files that no longer exist
            cleanupMissingFiles()
            
            ScanResult(
                success = true,
                filesFound = scannedFiles.size,
                message = "Found ${scannedFiles.size} media files"
            )
            
        } catch (e: Exception) {
            ScanResult(
                success = false,
                filesFound = 0,
                message = "Scan failed: ${e.message}"
            )
        }
    }
    
    /**
     * Get all media files from database
     */
    fun getAllFiles(): Flow<List<MediaFile>> {
        return mediaFileDao.getAllFiles().map { entities ->
            entities.map { it.toMediaFile() }
        }
    }
    
    /**
     * Get files by media type
     */
    fun getFilesByType(mediaType: MediaType): Flow<List<MediaFile>> {
        return mediaFileDao.getFilesByType(mediaType.name).map { entities ->
            entities.map { it.toMediaFile() }
        }
    }
    
    /**
     * Search media files
     */
    fun searchFiles(query: String): Flow<List<MediaFile>> {
        return mediaFileDao.searchFiles(query).map { entities ->
            entities.map { it.toMediaFile() }
        }
    }
    
    /**
     * Search files by type
     */
    fun searchFilesByType(mediaType: MediaType, query: String): Flow<List<MediaFile>> {
        return mediaFileDao.searchFilesByType(mediaType.name, query).map { entities ->
            entities.map { it.toMediaFile() }
        }
    }
    
    /**
     * Get recently added files
     */
    fun getRecentlyAdded(limit: Int = 20): Flow<List<MediaFile>> {
        return mediaFileDao.getRecentlyAdded(limit).map { entities ->
            entities.map { it.toMediaFile() }
        }
    }
    
    /**
     * Get recently played files
     */
    fun getRecentlyPlayed(limit: Int = 20): Flow<List<MediaFile>> {
        return mediaFileDao.getRecentlyPlayed(limit).map { entities ->
            entities.map { it.toMediaFile() }
        }
    }
    
    /**
     * Get favorite files
     */
    fun getFavoriteFiles(): Flow<List<MediaFile>> {
        return mediaFileDao.getFavoriteFiles().map { entities ->
            entities.map { it.toMediaFile() }
        }
    }
    
    /**
     * Toggle favorite status
     */
    suspend fun toggleFavorite(filePath: String) = withContext(Dispatchers.IO) {
        val file = mediaFileDao.getFileByPath(filePath)
        if (file != null) {
            mediaFileDao.updateFavoriteStatus(filePath, !file.isFavorite)
        }
    }
    
    /**
     * Record that a file was played
     */
    suspend fun recordPlayback(filePath: String) = withContext(Dispatchers.IO) {
        mediaFileDao.incrementPlayCount(filePath)
    }
    
    /**
     * Get library statistics
     */
    suspend fun getLibraryStats(): LibraryStats = withContext(Dispatchers.IO) {
        LibraryStats(
            totalFiles = mediaFileDao.getTotalFileCount(),
            audioFiles = mediaFileDao.getFileCountByType(MediaType.AUDIO.name),
            videoFiles = mediaFileDao.getFileCountByType(MediaType.VIDEO.name),
            documentFiles = mediaFileDao.getFileCountByType(MediaType.DOCUMENT.name),
            imageFiles = mediaFileDao.getFileCountByType(MediaType.IMAGE.name),
            favoriteFiles = mediaFileDao.getFavoriteCount()
        )
    }
    
    /**
     * Get all artists (for music organization)
     */
    fun getAllArtists(): Flow<List<String>> {
        return mediaFileDao.getAllArtists()
    }
    
    /**
     * Get all albums (for music organization)
     */
    fun getAllAlbums(): Flow<List<String>> {
        return mediaFileDao.getAllAlbums()
    }
    
    /**
     * Get all genres (for music organization)
     */
    fun getAllGenres(): Flow<List<String>> {
        return mediaFileDao.getAllGenres()
    }
    
    /**
     * Get files by artist
     */
    fun getFilesByArtist(artist: String): Flow<List<MediaFile>> {
        return mediaFileDao.getFilesByArtist(artist).map { entities ->
            entities.map { it.toMediaFile() }
        }
    }
    
    /**
     * Get files by album
     */
    fun getFilesByAlbum(album: String): Flow<List<MediaFile>> {
        return mediaFileDao.getFilesByAlbum(album).map { entities ->
            entities.map { it.toMediaFile() }
        }
    }
    
    /**
     * Get files by genre
     */
    fun getFilesByGenre(genre: String): Flow<List<MediaFile>> {
        return mediaFileDao.getFilesByGenre(genre).map { entities ->
            entities.map { it.toMediaFile() }
        }
    }
    
    /**
     * Clean up files that no longer exist on disk
     */
    private suspend fun cleanupMissingFiles() {
        val allPaths = mediaFileDao.getAllFilePaths()
        val missingPaths = allPaths.filter { path ->
            !File(path).exists()
        }
        
        missingPaths.forEach { path ->
            mediaFileDao.deleteFileByPath(path)
        }
    }
    
    /**
     * Quick scan using MediaStore (faster for audio/video)
     */
    suspend fun quickScanMediaStore(): ScanResult = withContext(Dispatchers.IO) {
        try {
            val mediaStoreFiles = mediaScannerService.getMediaStoreFiles()
            val entities = mediaStoreFiles.map { it.toEntity() }
            
            mediaFileDao.insertFiles(entities)
            
            ScanResult(
                success = true,
                filesFound = mediaStoreFiles.size,
                message = "Quick scan found ${mediaStoreFiles.size} media files"
            )
            
        } catch (e: Exception) {
            ScanResult(
                success = false,
                filesFound = 0,
                message = "Quick scan failed: ${e.message}"
            )
        }
    }
    
    /**
     * Clear entire library (for testing/reset)
     */
    suspend fun clearLibrary() = withContext(Dispatchers.IO) {
        mediaFileDao.deleteAllFiles()
    }
}

/**
 * Extension functions to convert between data models
 */
private fun MediaFile.toEntity(): MediaFileEntity {
    return MediaFileEntity(
        path = path,
        name = name,
        extension = extension,
        size = size,
        lastModified = lastModified,
        mediaType = mediaType.name,
        title = metadata.title,
        artist = metadata.artist,
        album = metadata.album,
        duration = metadata.duration,
        year = metadata.year,
        genre = metadata.genre,
        resolution = metadata.resolution,
        fileType = metadata.fileType
    )
}

private fun MediaFileEntity.toMediaFile(): MediaFile {
    return MediaFile(
        path = path,
        name = name,
        extension = extension,
        size = size,
        lastModified = lastModified,
        mediaType = MediaType.valueOf(mediaType),
        metadata = com.universalmedialibrary.services.media.MediaMetadata(
            title = title,
            artist = artist,
            album = album,
            duration = duration,
            year = year,
            genre = genre,
            resolution = resolution,
            fileType = fileType
        )
    )
}

/**
 * Data classes for repository operations
 */
data class ScanResult(
    val success: Boolean,
    val filesFound: Int,
    val message: String
)

data class LibraryStats(
    val totalFiles: Int,
    val audioFiles: Int,
    val videoFiles: Int,
    val documentFiles: Int,
    val imageFiles: Int,
    val favoriteFiles: Int
)