package com.universalmedialibrary.services.metadata

import android.graphics.Bitmap
import android.util.Log
import wseemann.media.FFmpegMediaMetadataRetriever
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal metadata extractor using FFmpeg
 * 
 * Supports all media types: audio, video, images, and can extract metadata from ebooks
 * with embedded media. Significantly faster than Android's MediaMetadataRetriever
 * and supports many more formats.
 */
@Singleton
class FFmpegMetadataExtractor @Inject constructor() {
    
    private val TAG = "FFmpegMetadataExtractor"
    
    /**
     * Extract comprehensive metadata from any media file
     * 
     * @param filePath Path to the media file
     * @return UniversalMetadata object with all available metadata
     */
    fun extractMetadata(filePath: String): UniversalMetadata {
        val retriever = FFmpegMediaMetadataRetriever()
        
        try {
            retriever.setDataSource(filePath)
            
            return UniversalMetadata(
                // Basic Info
                title = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_TITLE),
                artist = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_ARTIST),
                album = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_ALBUM),
                albumArtist = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_ALBUM_ARTIST),
                
                // Extended Info
                composer = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_COMPOSER),
                genre = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_GENRE),
                year = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_DATE)?.toIntOrNull(),
                date = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_DATE),
                
                // Track Info
                trackNumber = parseTrackNumber(retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_TRACK)),
                discNumber = parseDiscNumber(retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_DISC)),
                
                // Audio/Video Properties
                duration = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull(),
                bitrate = retriever.extractMetadata("bitrate")?.toIntOrNull(),
                sampleRate = retriever.extractMetadata("sample_rate")?.toIntOrNull(),
                channels = retriever.extractMetadata("channels")?.toIntOrNull(),
                
                // Video specific
                width = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_VIDEO_WIDTH)?.toIntOrNull(),
                height = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT)?.toIntOrNull(),
                frameRate = retriever.extractMetadata("framerate")?.toFloatOrNull(),
                videoCodec = retriever.extractMetadata("video_codec"),
                audioCodec = retriever.extractMetadata("audio_codec"),
                
                // Additional metadata
                comment = retriever.extractMetadata("comment"),
                copyright = retriever.extractMetadata("copyright"),
                publisher = retriever.extractMetadata("publisher"),
                language = retriever.extractMetadata("language"),
                
                // Technical info
                mimeType = retriever.extractMetadata("mimetype"),
                fileFormat = retriever.extractMetadata("format_name"),
                
                // ReplayGain - Extract from custom metadata
                replayGainTrack = parseReplayGain(retriever.extractMetadata("replaygain_track_gain")),
                replayGainAlbum = parseReplayGain(retriever.extractMetadata("replaygain_album_gain")),
                
                // Media type detection
                hasVideo = retriever.extractMetadata("has_video") == "yes",
                hasAudio = retriever.extractMetadata("has_audio") == "yes",
                
                // Extraction success
                extractionSuccess = true,
                filePath = filePath
            )
        } catch (e: Exception) {
            Log.e(TAG, "Failed to extract metadata from $filePath", e)
            return UniversalMetadata(
                title = filePath.substringAfterLast('/').substringBeforeLast('.'),
                extractionSuccess = false,
                extractionError = e.message,
                filePath = filePath
            )
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                Log.w(TAG, "Failed to release retriever", e)
            }
        }
    }
    
    /**
     * Extract thumbnail/poster image from media file
     * 
     * @param filePath Path to the media file
     * @param timeUs Time position for video thumbnail (in microseconds), ignored for audio
     * @return Bitmap of the thumbnail/album art, or null if not available
     */
    fun extractThumbnail(filePath: String, timeUs: Long = -1): Bitmap? {
        val retriever = FFmpegMediaMetadataRetriever()
        
        try {
            retriever.setDataSource(filePath)
            
            return if (timeUs >= 0) {
                // Extract frame at specific time (for videos)
                retriever.getFrameAtTime(timeUs, FFmpegMediaMetadataRetriever.OPTION_CLOSEST_SYNC)
            } else {
                // Extract embedded art (for audio/images)
                retriever.embeddedPicture?.let { bytes ->
                    android.graphics.BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to extract thumbnail from $filePath", e)
            return null
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                Log.w(TAG, "Failed to release retriever", e)
            }
        }
    }
    
    /**
     * Extract multiple frames from a video for preview
     * 
     * @param filePath Path to the video file
     * @param count Number of frames to extract
     * @return List of Bitmap frames
     */
    fun extractVideoFrames(filePath: String, count: Int = 5): List<Bitmap> {
        val retriever = FFmpegMediaMetadataRetriever()
        val frames = mutableListOf<Bitmap>()
        
        try {
            retriever.setDataSource(filePath)
            
            val duration = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull() ?: return emptyList()
            val interval = duration * 1000 / (count + 1) // Convert to microseconds
            
            for (i in 1..count) {
                val timeUs = interval * i
                retriever.getFrameAtTime(timeUs, FFmpegMediaMetadataRetriever.OPTION_CLOSEST)?.let {
                    frames.add(it)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to extract video frames from $filePath", e)
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                Log.w(TAG, "Failed to release retriever", e)
            }
        }
        
        return frames
    }
    
    /**
     * Check if a file is a supported media file
     * 
     * @param filePath Path to check
     * @return true if file can be processed by FFmpeg
     */
    fun isSupported(filePath: String): Boolean {
        val retriever = FFmpegMediaMetadataRetriever()
        
        return try {
            retriever.setDataSource(filePath)
            retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_DURATION) != null
        } catch (e: Exception) {
            false
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                // Ignore
            }
        }
    }
    
    // Helper methods
    
    private fun parseTrackNumber(track: String?): Int? {
        if (track.isNullOrBlank()) return null
        
        return try {
            // Handle formats like "3", "3/12", "03"
            track.split("/", "-").firstOrNull()?.trim()?.toIntOrNull()
        } catch (e: Exception) {
            null
        }
    }
    
    private fun parseDiscNumber(disc: String?): Int? {
        if (disc.isNullOrBlank()) return null
        
        return try {
            // Handle formats like "1", "1/2", "01"
            disc.split("/", "-").firstOrNull()?.trim()?.toIntOrNull()
        } catch (e: Exception) {
            null
        }
    }
    
    private fun parseReplayGain(gain: String?): Float? {
        if (gain.isNullOrBlank()) return null
        
        return try {
            // Remove "dB" suffix and parse
            gain.replace("dB", "", ignoreCase = true)
                .replace("db", "", ignoreCase = true)
                .trim()
                .toFloatOrNull()
        } catch (e: Exception) {
            null
        }
    }
}

/**
 * Universal metadata container for all media types
 */
data class UniversalMetadata(
    // Basic Information
    val title: String?,
    val artist: String? = null,
    val album: String? = null,
    val albumArtist: String? = null,
    
    // Extended Information
    val composer: String? = null,
    val genre: String? = null,
    val year: Int? = null,
    val date: String? = null,
    
    // Track/Disc Information
    val trackNumber: Int? = null,
    val discNumber: Int? = null,
    
    // Audio/Video Properties
    val duration: Long? = null, // milliseconds
    val bitrate: Int? = null,
    val sampleRate: Int? = null,
    val channels: Int? = null,
    
    // Video Properties
    val width: Int? = null,
    val height: Int? = null,
    val frameRate: Float? = null,
    val videoCodec: String? = null,
    val audioCodec: String? = null,
    
    // Additional Metadata
    val comment: String? = null,
    val copyright: String? = null,
    val publisher: String? = null,
    val language: String? = null,
    
    // Technical Information
    val mimeType: String? = null,
    val fileFormat: String? = null,
    
    // ReplayGain
    val replayGainTrack: Float? = null,
    val replayGainAlbum: Float? = null,
    
    // Media Type
    val hasVideo: Boolean = false,
    val hasAudio: Boolean = false,
    
    // Extraction Status
    val extractionSuccess: Boolean = false,
    val extractionError: String? = null,
    val filePath: String
) {
    /**
     * Determine media type from metadata
     */
    val mediaType: MediaType
        get() = when {
            hasVideo && hasAudio -> MediaType.VIDEO
            hasVideo -> MediaType.VIDEO
            hasAudio -> MediaType.AUDIO
            else -> MediaType.UNKNOWN
        }
    
    /**
     * Human-readable resolution string for videos
     */
    val resolution: String?
        get() = if (width != null && height != null) {
            when {
                height >= 2160 -> "4K ($width×$height)"
                height >= 1080 -> "1080p ($width×$height)"
                height >= 720 -> "720p ($width×$height)"
                height >= 480 -> "480p ($width×$height)"
                else -> "$width×$height"
            }
        } else null
    
    /**
     * Human-readable bitrate string
     */
    val bitrateString: String?
        get() = bitrate?.let {
            val kbps = it / 1000
            when {
                kbps >= 1000 -> "${kbps / 1000}.${(kbps % 1000) / 100} Mbps"
                else -> "$kbps kbps"
            }
        }
}

/**
 * Media type enum
 */
enum class MediaType {
    AUDIO,
    VIDEO,
    UNKNOWN
}
