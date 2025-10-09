package com.universalmedialibrary.services.artwork

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.media.MediaMetadataRetriever
import android.net.Uri
import android.util.Log
import android.util.LruCache
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.PlexMediaItem
import com.universalmedialibrary.services.cache.CacheManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import nl.siegmann.epublib.epub.EpubReader
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * ArtworkLoader Service
 *
 * Unified artwork loading service supporting multiple media sources:
 * - Local media files (EPUB, MP3, MP4, M4A, FLAC, OGG, etc.)
 * - Plex server artwork URLs
 * - External metadata artwork URLs
 *
 * Features:
 * - Memory cache for loaded artwork (LRU cache)
 * - Disk cache for network-loaded and extracted artwork (configurable location)
 * - Automatic bitmap downscaling for widgets/notifications
 * - Support for both MediaItem and PlexMediaItem
 * - Async loading with coroutines
 * - MediaMetadataRetriever for audio/video embedded artwork
 * - EPUB cover extraction from OPF manifest
 * - Supports internal storage or SD card for cache
 */
@Singleton
class ArtworkLoader @Inject constructor(
    @ApplicationContext private val context: Context,
    private val okHttpClient: OkHttpClient,
    private val cacheManager: CacheManager
) {

    private val TAG = "ArtworkLoader"

    // Memory cache for loaded artwork
    // Cache size: 20% of available memory, in kilobytes
    private val maxMemory = (Runtime.getRuntime().maxMemory() / 1024).toInt()
    private val cacheSize = maxMemory / 5

    private val memoryCache = object : LruCache<String, Bitmap>(cacheSize) {
        override fun sizeOf(key: String, bitmap: Bitmap): Int {
            return bitmap.byteCount / 1024
        }
    }

    /**
     * Load artwork for a MediaItem
     *
     * @param mediaItem The media item to load artwork for
     * @param maxWidth Maximum width for the returned bitmap (0 = no scaling)
     * @param maxHeight Maximum height for the returned bitmap (0 = no scaling)
     * @return Bitmap or null if not available
     */
    suspend fun loadArtwork(
        mediaItem: MediaItem,
        maxWidth: Int = 0,
        maxHeight: Int = 0
    ): Bitmap? = withContext(Dispatchers.IO) {
        try {
            // Try memory cache first
            val cacheKey = getCacheKey(mediaItem.itemId.toString(), maxWidth, maxHeight)
            memoryCache.get(cacheKey)?.let { return@withContext it }

            // Get disk cache directory from cache manager
            val diskCacheDir = cacheManager.getCacheDirectory()
            
            // Try disk cache
            val diskCacheFile = File(diskCacheDir, "${mediaItem.itemId}_${maxWidth}x${maxHeight}.jpg")
            if (diskCacheFile.exists()) {
                val bitmap = if (maxWidth > 0 || maxHeight > 0) {
                    decodeBitmapWithScaling(diskCacheFile.readBytes(), maxWidth, maxHeight)
                } else {
                    BitmapFactory.decodeFile(diskCacheFile.absolutePath)
                }
                bitmap?.let {
                    memoryCache.put(cacheKey, it)
                    return@withContext it
                }
            }

            // Extract from media file based on type
            val bitmap = extractArtworkFromFile(mediaItem.filePath, mediaItem.fileName)
            
            if (bitmap != null) {
                // Scale if needed
                val finalBitmap = if (maxWidth > 0 || maxHeight > 0) {
                    scaleBitmap(bitmap, maxWidth, maxHeight) ?: bitmap
                } else {
                    bitmap
                }
                
                // Cache in memory
                memoryCache.put(cacheKey, finalBitmap)
                
                // Cache to disk
                saveToDiskCache(diskCacheFile, finalBitmap)
                
                // Clean cache if needed
                cacheManager.cleanCacheIfNeeded()
                
                return@withContext finalBitmap
            }

            Log.d(TAG, "No artwork found for local media item: ${mediaItem.fileName}")
            null
        } catch (e: Exception) {
            Log.e(TAG, "Error loading artwork for media item: ${mediaItem.fileName}", e)
            null
        }
    }

    /**
     * Extract artwork from a media file based on its type
     */
    private fun extractArtworkFromFile(filePath: String, fileName: String): Bitmap? {
        val file = File(filePath)
        if (!file.exists()) return null

        val extension = fileName.substringAfterLast('.', "").lowercase()
        
        return when (extension) {
            "epub" -> extractEpubCover(file)
            "mp3", "m4a", "mp4", "flac", "ogg", "opus", "wma", "wav", "aac", "webm", "mkv", "avi" -> {
                extractMediaMetadataArtwork(file)
            }
            "cbz", "zip" -> extractCbzCover(file)
            else -> null
        }
    }

    /**
     * Extract cover from EPUB using epublib
     */
    private fun extractEpubCover(file: File): Bitmap? {
        return try {
            val epubReader = EpubReader()
            val book = epubReader.readEpub(FileInputStream(file))
            
            // Try to get cover image from metadata
            val coverImage = book.coverImage
            if (coverImage != null) {
                val bytes = coverImage.data
                return BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
            }
            
            // Fallback: look for common cover image names in the EPUB
            val resources = book.resources
            val coverNames = listOf("cover.jpg", "cover.png", "cover.jpeg", "Cover.jpg", "Cover.png")
            for (name in coverNames) {
                val resource = resources.getByHref(name)
                if (resource != null) {
                    val bytes = resource.data
                    return BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
                }
            }
            
            null
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting EPUB cover from ${file.name}", e)
            null
        }
    }

    /**
     * Extract embedded artwork using MediaMetadataRetriever
     * Works for MP3, MP4, M4A, FLAC, OGG, and many other formats
     */
    private fun extractMediaMetadataArtwork(file: File): Bitmap? {
        var retriever: MediaMetadataRetriever? = null
        return try {
            retriever = MediaMetadataRetriever()
            retriever.setDataSource(file.absolutePath)
            
            val embeddedPicture = retriever.embeddedPicture
            if (embeddedPicture != null) {
                BitmapFactory.decodeByteArray(embeddedPicture, 0, embeddedPicture.size)
            } else {
                null
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting artwork from ${file.name}", e)
            null
        } finally {
            try {
                retriever?.release()
            } catch (e: Exception) {
                Log.e(TAG, "Error releasing MediaMetadataRetriever", e)
            }
        }
    }

    /**
     * Extract cover from CBZ (comic book archive)
     * Usually the first image in the archive
     */
    private fun extractCbzCover(file: File): Bitmap? {
        return try {
            val zipFile = ZipFile(file)
            val entries = zipFile.entries().toList()
                .filter { it.name.matches(Regex(".*\\.(jpg|jpeg|png|webp)", RegexOption.IGNORE_CASE)) }
                .sortedBy { it.name }
            
            if (entries.isNotEmpty()) {
                val firstImage = entries.first()
                val inputStream = zipFile.getInputStream(firstImage)
                BitmapFactory.decodeStream(inputStream).also {
                    inputStream.close()
                    zipFile.close()
                }
            } else {
                zipFile.close()
                null
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting CBZ cover from ${file.name}", e)
            null
        }
    }

    /**
     * Load artwork for a PlexMediaItem
     *
     * @param plexItem The Plex media item to load artwork for
     * @param plexServerUrl The Plex server base URL
     * @param plexToken Authentication token for the Plex server
     * @param maxWidth Maximum width for the returned bitmap (0 = no scaling)
     * @param maxHeight Maximum height for the returned bitmap (0 = no scaling)
     * @return Bitmap or null if not available
     */
    suspend fun loadPlexArtwork(
        plexItem: PlexMediaItem,
        plexServerUrl: String,
        plexToken: String,
        maxWidth: Int = 0,
        maxHeight: Int = 0
    ): Bitmap? = withContext(Dispatchers.IO) {
        try {
            // Try memory cache first
            val cacheKey = getCacheKey("plex_${plexItem.plexRatingKey}", maxWidth, maxHeight)
            memoryCache.get(cacheKey)?.let { return@withContext it }

            // Get disk cache directory from cache manager
            val diskCacheDir = cacheManager.getCacheDirectory()
            
            // Try disk cache
            val diskCacheFile = File(diskCacheDir, "plex_${plexItem.plexRatingKey}_${maxWidth}x${maxHeight}.jpg")
            if (diskCacheFile.exists()) {
                val bitmap = if (maxWidth > 0 || maxHeight > 0) {
                    decodeBitmapWithScaling(diskCacheFile.readBytes(), maxWidth, maxHeight)
                } else {
                    BitmapFactory.decodeFile(diskCacheFile.absolutePath)
                }
                bitmap?.let {
                    memoryCache.put(cacheKey, it)
                    return@withContext it
                }
            }

            // Build Plex artwork URL using rating key
            val artworkUrl = "$plexServerUrl/library/metadata/${plexItem.plexRatingKey}/thumb?X-Plex-Token=$plexToken"

            // Load from network
            val bitmap = loadFromUrl(artworkUrl, maxWidth, maxHeight)

            // Cache if successful
            bitmap?.let { 
                memoryCache.put(cacheKey, it)
                saveToDiskCache(diskCacheFile, it)
            }

            bitmap
        } catch (e: Exception) {
            Log.e(TAG, "Error loading Plex artwork for: ${plexItem.title}", e)
            null
        }
    }

    /**
     * Load artwork from a URL
     *
     * @param url The URL to load artwork from
     * @param maxWidth Maximum width for the returned bitmap (0 = no scaling)
     * @param maxHeight Maximum height for the returned bitmap (0 = no scaling)
     * @return Bitmap or null if loading fails
     */
    suspend fun loadFromUrl(
        url: String,
        maxWidth: Int = 0,
        maxHeight: Int = 0
    ): Bitmap? = withContext(Dispatchers.IO) {
        try {
            // Try memory cache first
            val cacheKey = getCacheKey(url, maxWidth, maxHeight)
            memoryCache.get(cacheKey)?.let { return@withContext it }

            // Get disk cache directory from cache manager
            val diskCacheDir = cacheManager.getCacheDirectory()
            
            // Create disk cache file based on stable URL hash
            val urlHash = generateStableHash(url)
            val diskCacheFile = File(diskCacheDir, "url_${urlHash}_${maxWidth}x${maxHeight}.jpg")
            
            // Try disk cache
            if (diskCacheFile.exists()) {
                val bitmap = if (maxWidth > 0 || maxHeight > 0) {
                    decodeBitmapWithScaling(diskCacheFile.readBytes(), maxWidth, maxHeight)
                } else {
                    BitmapFactory.decodeFile(diskCacheFile.absolutePath)
                }
                bitmap?.let {
                    memoryCache.put(cacheKey, it)
                    return@withContext it
                }
            }

            // Load from network
            val request = Request.Builder()
                .url(url)
                .build()

            val response = okHttpClient.newCall(request).execute()

            if (!response.isSuccessful) {
                Log.w(TAG, "Failed to load artwork from URL: $url, code: ${response.code}")
                return@withContext null
            }

            val bytes = response.body?.bytes() ?: return@withContext null

            // Decode with scaling if requested
            val bitmap = if (maxWidth > 0 || maxHeight > 0) {
                decodeBitmapWithScaling(bytes, maxWidth, maxHeight)
            } else {
                BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
            }

            // Cache if successful
            bitmap?.let { 
                memoryCache.put(cacheKey, it)
                saveToDiskCache(diskCacheFile, it)
            }

            bitmap
        } catch (e: Exception) {
            Log.e(TAG, "Error loading artwork from URL: $url", e)
            null
        }
    }

    /**
     * Load artwork from a local file path
     *
     * @param filePath The file path to load artwork from
     * @param maxWidth Maximum width for the returned bitmap (0 = no scaling)
     * @param maxHeight Maximum height for the returned bitmap (0 = no scaling)
     * @return Bitmap or null if loading fails
     */
    suspend fun loadFromFile(
        filePath: String,
        maxWidth: Int = 0,
        maxHeight: Int = 0
    ): Bitmap? = withContext(Dispatchers.IO) {
        try {
            // Try cache first
            val cacheKey = getCacheKey(filePath, maxWidth, maxHeight)
            memoryCache.get(cacheKey)?.let { return@withContext it }

            val file = File(filePath)
            if (!file.exists() || !file.canRead()) {
                Log.w(TAG, "Cannot read artwork file: $filePath")
                return@withContext null
            }

            // Decode with scaling if requested
            val bitmap = if (maxWidth > 0 || maxHeight > 0) {
                decodeBitmapWithScaling(file.readBytes(), maxWidth, maxHeight)
            } else {
                BitmapFactory.decodeFile(filePath)
            }

            // Cache if successful
            bitmap?.let { memoryCache.put(cacheKey, it) }

            bitmap
        } catch (e: Exception) {
            Log.e(TAG, "Error loading artwork from file: $filePath", e)
            null
        }
    }

    /**
     * Clear all cached artwork (memory and disk)
     */
    suspend fun clearCache() {
        // Clear memory cache
        memoryCache.evictAll()
        
        // Clear disk cache using cache manager
        try {
            cacheManager.clearAllCache()
            Log.d(TAG, "Artwork cache cleared (memory + disk)")
        } catch (e: Exception) {
            Log.e(TAG, "Error clearing disk cache", e)
        }
    }

    /**
     * Remove specific artwork from cache
     */
    fun removeCachedArtwork(key: String) {
        memoryCache.remove(key)
    }

    /**
     * Get current memory cache size in KB
     */
    fun getCacheSizeKB(): Int {
        return memoryCache.size()
    }

    /**
     * Get disk cache size in MB
     */
    suspend fun getDiskCacheSizeMB(): Long {
        return cacheManager.getCurrentCacheSizeMB()
    }

    /**
     * Clean up old disk cache files (older than 30 days)
     */
    suspend fun cleanOldDiskCache(maxAgeDays: Int = 30) {
        try {
            cacheManager.clearOldCache(maxAgeDays)
        } catch (e: Exception) {
            Log.e(TAG, "Error cleaning old disk cache", e)
        }
    }

    // Private helper methods

    private fun getCacheKey(identifier: String, maxWidth: Int, maxHeight: Int): String {
        return if (maxWidth > 0 || maxHeight > 0) {
            "${identifier}_${maxWidth}x${maxHeight}"
        } else {
            identifier
        }
    }

    /**
     * Save bitmap to disk cache
     */
    private fun saveToDiskCache(file: File, bitmap: Bitmap) {
        try {
            FileOutputStream(file).use { out ->
                bitmap.compress(Bitmap.CompressFormat.JPEG, 90, out)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error saving to disk cache: ${file.name}", e)
        }
    }

    /**
     * Scale a bitmap to fit within max dimensions while maintaining aspect ratio
     */
    private fun scaleBitmap(bitmap: Bitmap, maxWidth: Int, maxHeight: Int): Bitmap? {
        if (maxWidth <= 0 && maxHeight <= 0) return bitmap
        
        val width = bitmap.width
        val height = bitmap.height
        
        val targetMaxWidth = if (maxWidth > 0) maxWidth else width
        val targetMaxHeight = if (maxHeight > 0) maxHeight else height
        
        if (width <= targetMaxWidth && height <= targetMaxHeight) {
            return bitmap // Already fits
        }
        
        val aspectRatio = width.toFloat() / height.toFloat()
        
        val (newWidth, newHeight) = if (aspectRatio > 1) {
            // Landscape
            val w = targetMaxWidth
            val h = (w / aspectRatio).toInt()
            Pair(w, h)
        } else {
            // Portrait or square
            val h = targetMaxHeight
            val w = (h * aspectRatio).toInt()
            Pair(w, h)
        }
        
        return try {
            Bitmap.createScaledBitmap(bitmap, newWidth, newHeight, true)
        } catch (e: Exception) {
            Log.e(TAG, "Error scaling bitmap", e)
            null
        }
    }

    private fun decodeBitmapWithScaling(
        bytes: ByteArray,
        maxWidth: Int,
        maxHeight: Int
    ): Bitmap? {
        try {
            // First decode with inJustDecodeBounds to get dimensions
            val options = BitmapFactory.Options().apply {
                inJustDecodeBounds = true
            }
            BitmapFactory.decodeByteArray(bytes, 0, bytes.size, options)

            // Calculate inSampleSize
            options.inSampleSize = calculateInSampleSize(
                options.outWidth,
                options.outHeight,
                maxWidth,
                maxHeight
            )

            // Decode with inSampleSize
            options.inJustDecodeBounds = false
            return BitmapFactory.decodeByteArray(bytes, 0, bytes.size, options)
        } catch (e: Exception) {
            Log.e(TAG, "Error decoding bitmap with scaling", e)
            return null
        }
    }

    private fun calculateInSampleSize(
        width: Int,
        height: Int,
        reqWidth: Int,
        reqHeight: Int
    ): Int {
        var inSampleSize = 1

        if (height > reqHeight || width > reqWidth) {
            val halfHeight = height / 2
            val halfWidth = width / 2

            // Calculate the largest inSampleSize value that is a power of 2 and keeps both
            // height and width larger than the requested height and width
            while ((halfHeight / inSampleSize) >= reqHeight &&
                (halfWidth / inSampleSize) >= reqWidth
            ) {
                inSampleSize *= 2
            }
        }

        return inSampleSize
    }

    /**
     * Generate a stable hash for cache keys
     * Uses SHA-256 for stability across processes and low collision risk
     */
    private fun generateStableHash(input: String): String {
        return try {
            val digest = java.security.MessageDigest.getInstance("SHA-256")
            val hashBytes = digest.digest(input.toByteArray())
            hashBytes.joinToString("") { "%02x".format(it) }.substring(0, 16)
        } catch (e: Exception) {
            // Fallback to simple hash if SHA-256 unavailable
            input.hashCode().toString()
        }
    }
}

/**
 * Result wrapper for artwork loading operations
 */
sealed class ArtworkResult {
    data class Success(val bitmap: Bitmap) : ArtworkResult()
    data class Error(val message: String, val exception: Throwable? = null) : ArtworkResult()
    object NotAvailable : ArtworkResult()
    object Loading : ArtworkResult()
}
