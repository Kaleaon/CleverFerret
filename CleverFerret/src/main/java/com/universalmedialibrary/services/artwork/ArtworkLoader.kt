package com.universalmedialibrary.services.artwork

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.util.Log
import android.util.LruCache
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.PlexMediaItem
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * ArtworkLoader Service
 * 
 * Unified artwork loading service supporting multiple media sources:
 * - Local media files (EPUB, MP3, MP4, etc.)
 * - Plex server artwork URLs
 * - External metadata artwork URLs
 * 
 * Features:
 * - Memory cache for loaded artwork
 * - Automatic bitmap downscaling for widgets/notifications
 * - Support for both MediaItem and PlexMediaItem
 * - Async loading with coroutines
 * 
 * Current TODOs:
 * TODO: Add disk cache for network-loaded artwork (see docs/unified-model/overview.md)
 * TODO: Add configurable cache size via settings/preferences
 * TODO: Add artwork extraction from media files:
 *       - EPUB: Extract cover from OPF manifest or common paths
 *       - MP3: Extract APIC frame from ID3v2 tags
 *       - MP4: Extract 'covr' atom from metadata
 *       - PDF: Extract first page or embedded thumbnail
 * TODO: Add context-aware scaling presets (notification, widget, now playing)
 * TODO: Add background preloader for upcoming queue items
 * TODO: Add artwork provider interface for external metadata APIs
 * TODO: Add artwork URL validation and retry logic
 * TODO: Add support for animated artwork (GIF, WebP)
 * TODO: Add support for vector artwork (SVG)
 */
@Singleton
class ArtworkLoader @Inject constructor(
    @ApplicationContext private val context: Context,
    private val okHttpClient: OkHttpClient
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
            // Try cache first
            val cacheKey = getCacheKey(mediaItem.itemId.toString(), maxWidth, maxHeight)
            memoryCache.get(cacheKey)?.let { return@withContext it }
            
            // TODO: Load from media file metadata (EPUB, MP3 ID3, etc.)
            // For now, return null to indicate no artwork available
            
            Log.d(TAG, "No artwork found for local media item: ${mediaItem.fileName}")
            null
        } catch (e: Exception) {
            Log.e(TAG, "Error loading artwork for media item: ${mediaItem.fileName}", e)
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
            // Try cache first
            val cacheKey = getCacheKey("plex_${plexItem.plexRatingKey}", maxWidth, maxHeight)
            memoryCache.get(cacheKey)?.let { return@withContext it }
            
            // Build Plex artwork URL using rating key
            // TODO: Implement proper thumb URL fetching from Plex API
            val artworkUrl = "$plexServerUrl/library/metadata/${plexItem.plexRatingKey}/thumb?X-Plex-Token=$plexToken"
            
            // Load from network
            val bitmap = loadFromUrl(artworkUrl, maxWidth, maxHeight)
            
            // Cache if successful
            bitmap?.let { memoryCache.put(cacheKey, it) }
            
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
            // Try cache first
            val cacheKey = getCacheKey(url, maxWidth, maxHeight)
            memoryCache.get(cacheKey)?.let { return@withContext it }
            
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
            bitmap?.let { memoryCache.put(cacheKey, it) }
            
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
     * Clear all cached artwork
     */
    fun clearCache() {
        memoryCache.evictAll()
        Log.d(TAG, "Artwork cache cleared")
    }
    
    /**
     * Remove specific artwork from cache
     */
    fun removeCachedArtwork(key: String) {
        memoryCache.remove(key)
    }
    
    /**
     * Get current cache size in KB
     */
    fun getCacheSizeKB(): Int {
        return memoryCache.size()
    }
    
    // Private helper methods
    
    private fun getCacheKey(identifier: String, maxWidth: Int, maxHeight: Int): String {
        return if (maxWidth > 0 || maxHeight > 0) {
            "${identifier}_${maxWidth}x${maxHeight}"
        } else {
            identifier
        }
    }
    
    private fun buildPlexArtworkUrl(
        serverUrl: String,
        thumbPath: String,
        token: String
    ): String {
        val cleanServerUrl = serverUrl.trimEnd('/')
        val cleanThumbPath = thumbPath.trimStart('/')
        return "$cleanServerUrl/$cleanThumbPath?X-Plex-Token=$token"
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
