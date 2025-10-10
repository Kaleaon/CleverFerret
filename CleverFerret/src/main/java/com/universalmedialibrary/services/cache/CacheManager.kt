package com.universalmedialibrary.services.cache

import android.content.Context
import android.os.Environment
import android.os.StatFs
import com.universalmedialibrary.data.repository.CacheLocation
import com.universalmedialibrary.data.repository.SettingsRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.first
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Cache Manager
 *
 * Centralized cache management for artwork, media files, and temporary data.
 * Supports both internal storage and SD card locations.
 *
 * Features:
 * - Dynamic cache location (internal vs SD card)
 * - Cache size limits and cleanup
 * - Available space checking
 * - Cache migration when changing locations
 */
@Singleton
class CacheManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val settingsRepository: SettingsRepository
) {

    /**
     * Get the current cache directory based on settings
     */
    suspend fun getCacheDirectory(): File {
        val location = settingsRepository.cacheLocationFlow.first()
        return getCacheDirectoryForLocation(location)
    }

    /**
     * Get cache directory for specific location
     */
    fun getCacheDirectoryForLocation(location: CacheLocation): File {
        return when (location) {
            CacheLocation.INTERNAL -> {
                File(context.cacheDir, "artwork").apply {
                    if (!exists()) mkdirs()
                }
            }
            CacheLocation.EXTERNAL -> {
                getExternalCacheDirectory()
            }
        }
    }

    /**
     * Get external cache directory (SD card)
     */
    private fun getExternalCacheDirectory(): File {
        // Try to get external cache directory
        val externalCacheDir = context.externalCacheDir
        
        if (externalCacheDir != null && isExternalStorageWritable()) {
            return File(externalCacheDir, "artwork").apply {
                if (!exists()) mkdirs()
            }
        }
        
        // Fallback to internal if external is not available
        return File(context.cacheDir, "artwork").apply {
            if (!exists()) mkdirs()
        }
    }

    /**
     * Check if external storage is writable
     */
    fun isExternalStorageWritable(): Boolean {
        val state = Environment.getExternalStorageState()
        return Environment.MEDIA_MOUNTED == state
    }

    /**
     * Check if external storage is available (writable or readable)
     */
    fun isExternalStorageAvailable(): Boolean {
        val state = Environment.getExternalStorageState()
        return Environment.MEDIA_MOUNTED == state || Environment.MEDIA_MOUNTED_READ_ONLY == state
    }

    /**
     * Get available space in the cache location (in MB)
     */
    suspend fun getAvailableSpaceMB(): Long {
        val cacheDir = getCacheDirectory()
        val stat = StatFs(cacheDir.path)
        val availableBytes = stat.availableBytes
        return availableBytes / (1024 * 1024)
    }

    /**
     * Get current cache size (in MB)
     */
    suspend fun getCurrentCacheSizeMB(): Long {
        val cacheDir = getCacheDirectory()
        return calculateDirectorySize(cacheDir) / (1024 * 1024)
    }

    /**
     * Check if cache exceeds maximum size
     */
    suspend fun isCacheOverLimit(): Boolean {
        val currentSize = getCurrentCacheSizeMB()
        val maxSize = settingsRepository.maxCacheSizeMBFlow.first()
        return currentSize > maxSize
    }

    /**
     * Clean cache if over limit
     */
    suspend fun cleanCacheIfNeeded() {
        if (!isCacheOverLimit()) return
        
        val cacheDir = getCacheDirectory()
        val maxSizeMB = settingsRepository.maxCacheSizeMBFlow.first()
        val targetSizeBytes = (maxSizeMB.toLong() * 1024L * 1024L * 8L) / 10L // Clean to 80% of max
        
        // Get all files recursively sorted by last modified (oldest first)
        val files = getAllFilesRecursively(cacheDir).sortedBy { it.lastModified() }
        
        var currentSize = calculateDirectorySize(cacheDir)
        
        for (file in files) {
            if (currentSize <= targetSizeBytes) break
            
            val fileSize = if (file.isDirectory) calculateDirectorySize(file) else file.length()
            if (file.deleteRecursively()) {
                currentSize -= fileSize
            }
        }
    }

    /**
     * Migrate cache from one location to another
     */
    suspend fun migrateCacheLocation(newLocation: CacheLocation) {
        val currentLocation = settingsRepository.cacheLocationFlow.first()
        if (currentLocation == newLocation) return
        
        val sourceDir = getCacheDirectoryForLocation(currentLocation)
        val targetDir = getCacheDirectoryForLocation(newLocation)
        
        if (!sourceDir.exists()) {
            settingsRepository.setCacheLocation(newLocation)
            return
        }
        
        // Copy files to new location
        sourceDir.listFiles()?.forEach { file ->
            try {
                val targetFile = File(targetDir, file.name)
                file.copyTo(targetFile, overwrite = true)
            } catch (e: Exception) {
                // Log error but continue migration
            }
        }
        
        // Update settings
        settingsRepository.setCacheLocation(newLocation)
        
        // Clean old location
        sourceDir.listFiles()?.forEach { it.delete() }
    }

    /**
     * Clear all cache
     */
    suspend fun clearAllCache() {
        val cacheDir = getCacheDirectory()
        cacheDir.listFiles()?.forEach { it.delete() }
    }

    /**
     * Clear cache older than specified days
     */
    suspend fun clearOldCache(maxAgeDays: Int) {
        val cacheDir = getCacheDirectory()
        val maxAgeMillis = maxAgeDays * 24L * 60L * 60L * 1000L
        val now = System.currentTimeMillis()
        
        cacheDir.listFiles()?.forEach { file ->
            if (now - file.lastModified() > maxAgeMillis) {
                file.delete()
            }
        }
    }

    /**
     * Get cache statistics
     */
    suspend fun getCacheStats(): CacheStats {
        val currentSize = getCurrentCacheSizeMB()
        val maxSize = settingsRepository.maxCacheSizeMBFlow.first()
        val availableSpace = getAvailableSpaceMB()
        val location = settingsRepository.cacheLocationFlow.first()
        val cacheDir = getCacheDirectory()
        val fileCount = cacheDir.listFiles()?.size ?: 0
        
        return CacheStats(
            currentSizeMB = currentSize,
            maxSizeMB = maxSize.toLong(),
            availableSpaceMB = availableSpace,
            fileCount = fileCount,
            location = location,
            isExternalAvailable = isExternalStorageAvailable()
        )
    }

    /**
     * Calculate total size of a directory
     */
    private fun calculateDirectorySize(directory: File): Long {
        var size = 0L
        directory.listFiles()?.forEach { file ->
            size += if (file.isDirectory) {
                calculateDirectorySize(file)
            } else {
                file.length()
            }
        }
        return size
    }

    /**
     * Get all files recursively from a directory
     */
    private fun getAllFilesRecursively(directory: File): List<File> {
        val files = mutableListOf<File>()
        directory.listFiles()?.forEach { file ->
            if (file.isDirectory) {
                files.addAll(getAllFilesRecursively(file))
            } else {
                files.add(file)
            }
        }
        return files
    }
}

/**
 * Cache statistics data class
 */
data class CacheStats(
    val currentSizeMB: Long,
    val maxSizeMB: Long,
    val availableSpaceMB: Long,
    val fileCount: Int,
    val location: CacheLocation,
    val isExternalAvailable: Boolean
)
