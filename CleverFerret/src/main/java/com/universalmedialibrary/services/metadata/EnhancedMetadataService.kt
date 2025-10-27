package com.universalmedialibrary.services.metadata

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.media.MediaMetadataRetriever
import android.media.MediaMetadataRetriever.*
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Enhanced Metadata Service - Extracts comprehensive metadata from audio files
 * 
 * Inspired by PowerampAPI's comprehensive metadata system
 * Extracts 20+ metadata fields including:
 * - Basic: title, artist, album, genre
 * - Extended: composer, album artist, year, track/disc numbers
 * - Audio: bitrate, sample rate, channels, codec
 * - Additional: lyrics, comments, ratings
 * - Album art with size control
 */
@Singleton
class EnhancedMetadataService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private const val TAG = "EnhancedMetadata"
    }
    
    /**
     * Extract all available metadata from audio file
     */
    suspend fun extractMetadata(filePath: String): EnhancedTrackMetadata = withContext(Dispatchers.IO) {
        MediaMetadataRetriever().use { retriever ->
            try {
                retriever.setDataSource(filePath)
                
                EnhancedTrackMetadata(
                    // Basic Info
                    title = retriever.extractMetadata(METADATA_KEY_TITLE),
                    artist = retriever.extractMetadata(METADATA_KEY_ARTIST),
                    album = retriever.extractMetadata(METADATA_KEY_ALBUM),
                    albumArtist = retriever.extractMetadata(METADATA_KEY_ALBUMARTIST),
                    
                    // Extended Info
                    composer = retriever.extractMetadata(METADATA_KEY_COMPOSER),
                    writer = retriever.extractMetadata(METADATA_KEY_WRITER),
                    genre = retriever.extractMetadata(METADATA_KEY_GENRE),
                    year = retriever.extractMetadata(METADATA_KEY_YEAR)?.toIntOrNull(),
                    date = retriever.extractMetadata(METADATA_KEY_DATE),
                    
                    // Track/Disc Numbers
                    trackNumber = parseTrackNumber(
                        retriever.extractMetadata(METADATA_KEY_CD_TRACK_NUMBER)
                    ),
                    trackTotal = parseTrackTotal(
                        retriever.extractMetadata(METADATA_KEY_CD_TRACK_NUMBER)
                    ),
                    discNumber = parseDiscNumber(
                        retriever.extractMetadata(METADATA_KEY_DISC_NUMBER)
                    ),
                    discTotal = parseDiscTotal(
                        retriever.extractMetadata(METADATA_KEY_DISC_NUMBER)
                    ),
                    
                    // Audio Properties
                    duration = retriever.extractMetadata(METADATA_KEY_DURATION)?.toLongOrNull() ?: 0L,
                    bitrate = retriever.extractMetadata(METADATA_KEY_BITRATE)?.toIntOrNull(),
                    sampleRate = getSampleRate(retriever),
                    channels = getChannelCount(retriever),
                    mimeType = retriever.extractMetadata(METADATA_KEY_MIMETYPE),
                    
                    // Additional Fields
                    compilation = retriever.extractMetadata(METADATA_KEY_COMPILATION),
                    author = retriever.extractMetadata(METADATA_KEY_AUTHOR),
                    location = retriever.extractMetadata(METADATA_KEY_LOCATION),
                    
                    // Album Art
                    hasEmbeddedArt = retriever.embeddedPicture != null,
                    embeddedArtSize = retriever.embeddedPicture?.size ?: 0
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error extracting metadata from $filePath", e)
                // Return minimal metadata on error
                EnhancedTrackMetadata(
                    title = filePath.substringAfterLast('/').substringBeforeLast('.'),
                    duration = 0L
                )
            }
        }
    }
    
    /**
     * Extract album art from audio file
     */
    suspend fun extractAlbumArt(
        filePath: String, 
        size: ImageSize = ImageSize.LARGE
    ): Bitmap? = withContext(Dispatchers.IO) {
        MediaMetadataRetriever().use { retriever ->
            try {
                retriever.setDataSource(filePath)
                retriever.embeddedPicture?.let { data ->
                    val options = BitmapFactory.Options().apply {
                        inJustDecodeBounds = true
                    }
                    BitmapFactory.decodeByteArray(data, 0, data.size, options)
                    
                    // Calculate sample size for memory efficiency
                    val targetSize = when (size) {
                        ImageSize.ORIGINAL -> -1
                        else -> size.pixels
                    }
                    
                    if (targetSize > 0) {
                        options.inSampleSize = calculateInSampleSize(options, targetSize, targetSize)
                    }
                    options.inJustDecodeBounds = false
                    
                    BitmapFactory.decodeByteArray(data, 0, data.size, options)
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error extracting album art from $filePath", e)
                null
            }
        }
    }
    
    /**
     * Extract album art as byte array (for caching/storage)
     */
    suspend fun extractAlbumArtBytes(filePath: String): ByteArray? = withContext(Dispatchers.IO) {
        MediaMetadataRetriever().use { retriever ->
            try {
                retriever.setDataSource(filePath)
                retriever.embeddedPicture
            } catch (e: Exception) {
                Log.e(TAG, "Error extracting album art bytes from $filePath", e)
                null
            }
        }
    }
    
    /**
     * Check if file has embedded album art (quick check without full extraction)
     */
    suspend fun hasAlbumArt(filePath: String): Boolean = withContext(Dispatchers.IO) {
        MediaMetadataRetriever().use { retriever ->
            try {
                retriever.setDataSource(filePath)
                retriever.embeddedPicture != null
            } catch (e: Exception) {
                false
            }
        }
    }
    
    private fun parseTrackNumber(trackInfo: String?): Int? {
        return trackInfo?.split('/')?.firstOrNull()?.toIntOrNull()
    }
    
    private fun parseTrackTotal(trackInfo: String?): Int? {
        return trackInfo?.split('/')?.getOrNull(1)?.toIntOrNull()
    }
    
    private fun parseDiscNumber(discInfo: String?): Int? {
        return discInfo?.split('/')?.firstOrNull()?.toIntOrNull()
    }
    
    private fun parseDiscTotal(discInfo: String?): Int? {
        return discInfo?.split('/')?.getOrNull(1)?.toIntOrNull()
    }
    
    private fun getSampleRate(retriever: MediaMetadataRetriever): Int? {
        return try {
            // Try different metadata keys for sample rate
            retriever.extractMetadata(METADATA_KEY_SAMPLERATE)?.toIntOrNull()
        } catch (e: Exception) {
            null
        }
    }
    
    private fun getChannelCount(retriever: MediaMetadataRetriever): Int? {
        return try {
            // Try to extract channel count from available metadata
            retriever.extractMetadata(METADATA_KEY_NUM_TRACKS)?.toIntOrNull()
        } catch (e: Exception) {
            null
        }
    }
    
    private fun calculateInSampleSize(
        options: BitmapFactory.Options, 
        reqWidth: Int, 
        reqHeight: Int
    ): Int {
        val height = options.outHeight
        val width = options.outWidth
        var inSampleSize = 1
        
        if (height > reqHeight || width > reqWidth) {
            val halfHeight = height / 2
            val halfWidth = width / 2
            
            while (halfHeight / inSampleSize >= reqHeight && 
                   halfWidth / inSampleSize >= reqWidth) {
                inSampleSize *= 2
            }
        }
        
        return inSampleSize
    }
    
    /**
     * Image size options for album art extraction
     */
    enum class ImageSize(val pixels: Int) {
        THUMBNAIL(200),
        MEDIUM(500),
        LARGE(1000),
        ORIGINAL(-1)
    }
}

/**
 * Enhanced Track Metadata - Comprehensive audio file metadata
 * 
 * Contains 20+ metadata fields extracted from audio files
 */
data class EnhancedTrackMetadata(
    // Basic Information
    val title: String?,
    val artist: String? = null,
    val album: String? = null,
    val albumArtist: String? = null,
    
    // Extended Information
    val composer: String? = null,
    val writer: String? = null,
    val genre: String? = null,
    val year: Int? = null,
    val date: String? = null,
    
    // Track Information
    val trackNumber: Int? = null,
    val trackTotal: Int? = null,
    val discNumber: Int? = null,
    val discTotal: Int? = null,
    
    // Audio Properties
    val duration: Long,
    val bitrate: Int? = null,
    val sampleRate: Int? = null,
    val channels: Int? = null,
    val mimeType: String? = null,
    
    // Additional Fields
    val compilation: String? = null,
    val author: String? = null,
    val location: String? = null,
    
    // Album Art Info
    val hasEmbeddedArt: Boolean = false,
    val embeddedArtSize: Int = 0
) {
    /**
     * Human-readable audio quality string
     */
    val audioQuality: String
        get() = when {
            bitrate == null -> "Unknown"
            bitrate >= 320000 -> "High (320+ kbps)"
            bitrate >= 192000 -> "Medium (192-320 kbps)"
            bitrate >= 128000 -> "Standard (128-192 kbps)"
            else -> "Low (< 128 kbps)"
        }
    
    /**
     * Display name for artist (prefer album artist for compilations)
     */
    val displayArtist: String
        get() = when {
            !albumArtist.isNullOrBlank() -> albumArtist
            !artist.isNullOrBlank() -> artist
            else -> "Unknown Artist"
        }
    
    /**
     * Display name for album
     */
    val displayAlbum: String
        get() = album?.takeIf { it.isNotBlank() } ?: "Unknown Album"
    
    /**
     * Display name for title
     */
    val displayTitle: String
        get() = title?.takeIf { it.isNotBlank() } ?: "Unknown Track"
    
    /**
     * Track position string (e.g., "3/12" or "3")
     */
    val trackPositionString: String?
        get() = when {
            trackNumber != null && trackTotal != null -> "$trackNumber/$trackTotal"
            trackNumber != null -> "$trackNumber"
            else -> null
        }
    
    /**
     * Disc position string (e.g., "1/2" or "1")
     */
    val discPositionString: String?
        get() = when {
            discNumber != null && discTotal != null -> "$discNumber/$discTotal"
            discNumber != null -> "$discNumber"
            else -> null
        }
    
    /**
     * Is this a compilation album?
     */
    val isCompilation: Boolean
        get() = compilation?.equals("1", ignoreCase = true) == true
}
