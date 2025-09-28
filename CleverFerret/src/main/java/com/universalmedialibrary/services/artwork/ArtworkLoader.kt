package com.universalmedialibrary.services.artwork

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Paint
import com.universalmedialibrary.data.models.UnifiedMediaItem
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import java.security.MessageDigest
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Shared artwork pipeline serving notifications, widgets, and Now Playing
 * 
 * This service provides a unified interface for loading, caching, and scaling images
 * across all media types with consistent handling for UI components.
 */
@Singleton
class ArtworkLoader @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val cacheDir = File(context.cacheDir, "artwork")
    private val memoryCache = LinkedHashMap<String, CachedArtwork>(50, 0.75f, true)
    private val maxMemoryCacheSize = 50
    
    init {
        if (!cacheDir.exists()) {
            cacheDir.mkdirs()
        }
    }
    
    /**
     * Load artwork for a media item with specified size and quality
     */
    suspend fun loadArtwork(
        mediaItem: UnifiedMediaItem,
        size: ArtworkSize = ArtworkSize.MEDIUM,
        quality: ArtworkQuality = ArtworkQuality.HIGH
    ): ArtworkResult = withContext(Dispatchers.IO) {
        val cacheKey = generateCacheKey(mediaItem.itemId, size, quality)
        
        // Check memory cache first
        memoryCache[cacheKey]?.let { cached ->
            if (cached.isValid()) {
                return@withContext ArtworkResult.Success(cached.bitmap)
            } else {
                memoryCache.remove(cacheKey)
            }
        }
        
        // Check disk cache
        val diskCacheFile = File(cacheDir, "$cacheKey.jpg")
        if (diskCacheFile.exists()) {
            try {
                val bitmap = BitmapFactory.decodeFile(diskCacheFile.absolutePath)
                if (bitmap != null) {
                    val cached = CachedArtwork(bitmap, System.currentTimeMillis())
                    cacheToMemory(cacheKey, cached)
                    return@withContext ArtworkResult.Success(bitmap)
                }
            } catch (e: Exception) {
                // Disk cache corrupted, continue to load from source
                diskCacheFile.delete()
            }
        }
        
        // Load from source
        loadFromSource(mediaItem, size, quality, cacheKey)
    }
    
    /**
     * Load artwork specifically sized for notifications
     */
    suspend fun loadNotificationArtwork(mediaItem: UnifiedMediaItem): ArtworkResult {
        return loadArtwork(mediaItem, ArtworkSize.NOTIFICATION, ArtworkQuality.MEDIUM)
    }
    
    /**
     * Load artwork specifically sized for widgets
     */
    suspend fun loadWidgetArtwork(mediaItem: UnifiedMediaItem): ArtworkResult {
        return loadArtwork(mediaItem, ArtworkSize.WIDGET, ArtworkQuality.MEDIUM)
    }
    
    /**
     * Load artwork for Now Playing screen
     */
    suspend fun loadNowPlayingArtwork(mediaItem: UnifiedMediaItem): ArtworkResult {
        return loadArtwork(mediaItem, ArtworkSize.LARGE, ArtworkQuality.HIGH)
    }
    
    /**
     * Generate a placeholder artwork for items without cover art
     */
    suspend fun generatePlaceholderArtwork(
        mediaItem: UnifiedMediaItem,
        size: ArtworkSize = ArtworkSize.MEDIUM
    ): ArtworkResult = withContext(Dispatchers.Default) {
        val dimensions = size.getDimensions()
        val bitmap = Bitmap.createBitmap(dimensions.width, dimensions.height, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        
        // Generate color based on media type and title
        val color = generatePlaceholderColor(mediaItem)
        val paint = Paint().apply {
            this.color = color
            isAntiAlias = true
        }
        
        // Draw background
        canvas.drawRect(0f, 0f, dimensions.width.toFloat(), dimensions.height.toFloat(), paint)
        
        // Draw initial or icon
        val textPaint = Paint().apply {
            this.color = if (isColorDark(color)) android.graphics.Color.WHITE else android.graphics.Color.BLACK
            textSize = dimensions.width * 0.3f
            isAntiAlias = true
            textAlign = Paint.Align.CENTER
        }
        
        val initial = mediaItem.title.firstOrNull()?.uppercaseChar()?.toString() ?: "?"
        val textY = dimensions.height / 2f + textPaint.textSize / 3f
        canvas.drawText(initial, dimensions.width / 2f, textY, textPaint)
        
        ArtworkResult.Success(bitmap)
    }
    
    /**
     * Clear all cached artwork
     */
    suspend fun clearCache() = withContext(Dispatchers.IO) {
        memoryCache.clear()
        cacheDir.deleteRecursively()
        cacheDir.mkdirs()
    }
    
    /**
     * Clear cached artwork for a specific item
     */
    suspend fun clearItemCache(itemId: Long) = withContext(Dispatchers.IO) {
        // Remove from memory cache
        memoryCache.entries.removeAll { it.key.startsWith("item_${itemId}_") }
        
        // Remove from disk cache
        cacheDir.listFiles()?.filter { it.name.startsWith("item_${itemId}_") }?.forEach { it.delete() }
    }
    
    private suspend fun loadFromSource(
        mediaItem: UnifiedMediaItem,
        size: ArtworkSize,
        quality: ArtworkQuality,
        cacheKey: String
    ): ArtworkResult = withContext(Dispatchers.IO) {
        val sourcePath = mediaItem.coverImagePath ?: mediaItem.thumbnailPath
        
        if (sourcePath != null && File(sourcePath).exists()) {
            try {
                val bitmap = loadAndScaleBitmap(sourcePath, size, quality)
                if (bitmap != null) {
                    // Cache to disk
                    saveToDiskCache(bitmap, cacheKey)
                    
                    // Cache to memory
                    val cached = CachedArtwork(bitmap, System.currentTimeMillis())
                    cacheToMemory(cacheKey, cached)
                    
                    return@withContext ArtworkResult.Success(bitmap)
                }
            } catch (e: Exception) {
                // Fall through to placeholder
            }
        }
        
        // Generate placeholder if no source or loading failed
        generatePlaceholderArtwork(mediaItem, size)
    }
    
    private fun loadAndScaleBitmap(path: String, size: ArtworkSize, quality: ArtworkQuality): Bitmap? {
        val dimensions = size.getDimensions()
        
        // First decode to get dimensions
        val options = BitmapFactory.Options().apply {
            inJustDecodeBounds = true
        }
        BitmapFactory.decodeFile(path, options)
        
        // Calculate sample size
        options.inSampleSize = calculateInSampleSize(options, dimensions.width, dimensions.height)
        options.inJustDecodeBounds = false
        options.inPreferredConfig = quality.getBitmapConfig()
        
        val bitmap = BitmapFactory.decodeFile(path, options) ?: return null
        
        // Scale to exact dimensions if needed
        return if (bitmap.width != dimensions.width || bitmap.height != dimensions.height) {
            val scaledBitmap = Bitmap.createScaledBitmap(bitmap, dimensions.width, dimensions.height, true)
            if (scaledBitmap != bitmap) {
                bitmap.recycle()
            }
            scaledBitmap
        } else {
            bitmap
        }
    }
    
    private fun calculateInSampleSize(options: BitmapFactory.Options, reqWidth: Int, reqHeight: Int): Int {
        val height = options.outHeight
        val width = options.outWidth
        var inSampleSize = 1
        
        if (height > reqHeight || width > reqWidth) {
            val halfHeight = height / 2
            val halfWidth = width / 2
            
            while (halfHeight / inSampleSize >= reqHeight && halfWidth / inSampleSize >= reqWidth) {
                inSampleSize *= 2
            }
        }
        
        return inSampleSize
    }
    
    private fun generateCacheKey(itemId: Long, size: ArtworkSize, quality: ArtworkQuality): String {
        val input = "item_${itemId}_${size.name}_${quality.name}"
        val digest = MessageDigest.getInstance("MD5")
        val hash = digest.digest(input.toByteArray())
        return hash.joinToString("") { "%02x".format(it) }
    }
    
    private fun saveToDiskCache(bitmap: Bitmap, cacheKey: String) {
        try {
            val file = File(cacheDir, "$cacheKey.jpg")
            FileOutputStream(file).use { out ->
                bitmap.compress(Bitmap.CompressFormat.JPEG, 90, out)
            }
        } catch (e: Exception) {
            // Ignore disk cache errors
        }
    }
    
    private fun cacheToMemory(key: String, artwork: CachedArtwork) {
        if (memoryCache.size >= maxMemoryCacheSize) {
            val eldest = memoryCache.entries.iterator().next()
            memoryCache.remove(eldest.key)
        }
        memoryCache[key] = artwork
    }
    
    private fun generatePlaceholderColor(mediaItem: UnifiedMediaItem): Int {
        val hash = mediaItem.title.hashCode()
        val colors = listOf(
            0xFF6B73FF.toInt(), // Blue
            0xFF9C88FF.toInt(), // Purple
            0xFFFF6584.toInt(), // Pink
            0xFFFF8A65.toInt(), // Orange
            0xFF4DB6AC.toInt(), // Teal
            0xFF81C784.toInt(), // Green
            0xFFFFB74D.toInt(), // Amber
            0xFFF06292.toInt(), // Pink Light
            0xFF7986CB.toInt(), // Indigo
            0xFF64B5F6.toInt()  // Light Blue
        )
        return colors[Math.abs(hash) % colors.size]
    }
    
    private fun isColorDark(color: Int): Boolean {
        val darkness = 1 - (0.299 * android.graphics.Color.red(color) + 
                           0.587 * android.graphics.Color.green(color) + 
                           0.114 * android.graphics.Color.blue(color)) / 255
        return darkness >= 0.5
    }
}

/**
 * Cached artwork with timestamp for expiration
 */
private data class CachedArtwork(
    val bitmap: Bitmap,
    val timestamp: Long
) {
    fun isValid(): Boolean {
        return System.currentTimeMillis() - timestamp < CACHE_EXPIRY_MS && !bitmap.isRecycled
    }
    
    companion object {
        private const val CACHE_EXPIRY_MS = 24 * 60 * 60 * 1000L // 24 hours
    }
}

/**
 * Artwork loading result
 */
sealed class ArtworkResult {
    data class Success(val bitmap: Bitmap) : ArtworkResult()
    data class Error(val exception: Throwable) : ArtworkResult()
}

/**
 * Artwork size presets for different use cases
 */
enum class ArtworkSize(private val width: Int, private val height: Int) {
    SMALL(128, 128),
    MEDIUM(256, 256),
    LARGE(512, 512),
    NOTIFICATION(96, 96),
    WIDGET(128, 128),
    THUMBNAIL(64, 64);
    
    fun getDimensions(): Dimensions = Dimensions(width, height)
    
    data class Dimensions(val width: Int, val height: Int)
}

/**
 * Artwork quality settings
 */
enum class ArtworkQuality {
    LOW, MEDIUM, HIGH;
    
    fun getBitmapConfig(): Bitmap.Config = when (this) {
        LOW -> Bitmap.Config.RGB_565
        MEDIUM, HIGH -> Bitmap.Config.ARGB_8888
    }
}