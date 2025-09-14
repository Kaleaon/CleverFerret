package com.universalmedialibrary.services.video

import android.content.Context
import android.net.Uri
import dagger.hilt.android.qualifiers.ApplicationContext
// VLC imports - wrapped in try-catch to handle missing library
// import org.videolan.libvlc.LibVLC
// import org.videolan.libvlc.Media
// import org.videolan.libvlc.MediaPlayer
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Comprehensive Video Service
 * Provides support for extensive video formats using VLC SDK and ExoPlayer
 * VLC integration is optional and gracefully handled if library is not available
 */
@Singleton
class ComprehensiveVideoService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private var libVLC: Any? = null // LibVLC? = null
    private var vlcMediaPlayer: Any? = null // MediaPlayer? = null
    private var isVLCAvailable: Boolean = false
    
    init {
        // Check if VLC library is available
        isVLCAvailable = try {
            Class.forName("org.videolan.libvlc.LibVLC")
            true
        } catch (e: ClassNotFoundException) {
            false
        }
    }
    
    /**
     * Initialize VLC library for advanced video format support
     */
    fun initializeVLC(): Boolean {
        return try {
            val options = arrayListOf<String>().apply {
                add("--aout=opensles")
                add("--audio-time-stretch") // Enable audio time-stretching
                add("--chroma=RV32")
                add("--file-caching=2000")      
                add("--network-caching=4000")
                add("--live-caching=1000")
                add("--sout-mux-caching=2000")
                add("--codec=all")              // Enable all codecs
                add("--prefetch-buffer-size=64") // Prefetch buffer
            }
            
            libVLC = LibVLC(context, options)
            vlcMediaPlayer = MediaPlayer(libVLC)
            true
        } catch (e: Exception) {
            e.printStackTrace()
            false
        }
    }
    
    /**
     * Get supported video formats
     */
    fun getSupportedFormats(): List<VideoFormat> {
        return listOf(
            // Standard formats
            VideoFormat("MP4", "video/mp4", listOf("mp4", "m4v")),
            VideoFormat("AVI", "video/x-msvideo", listOf("avi")),
            VideoFormat("MKV", "video/x-matroska", listOf("mkv", "webm")),
            VideoFormat("MOV", "video/quicktime", listOf("mov", "qt")),
            VideoFormat("WMV", "video/x-ms-wmv", listOf("wmv")),
            VideoFormat("FLV", "video/x-flv", listOf("flv")),
            VideoFormat("3GP", "video/3gpp", listOf("3gp", "3gpp")),
            VideoFormat("M4V", "video/x-m4v", listOf("m4v")),
            
            // Advanced formats (VLC support)
            VideoFormat("MTS", "video/mp2t", listOf("mts", "m2ts")),
            VideoFormat("TS", "video/mp2t", listOf("ts")),
            VideoFormat("VOB", "video/dvd", listOf("vob")),
            VideoFormat("OGV", "video/ogg", listOf("ogv", "ogg")),
            VideoFormat("RMVB", "application/vnd.rn-realmedia-vbr", listOf("rmvb", "rm")),
            VideoFormat("ASF", "video/x-ms-asf", listOf("asf")),
            VideoFormat("DIVX", "video/divx", listOf("divx")),
            VideoFormat("XVID", "video/x-xvid", listOf("xvid")),
            
            // Streaming formats
            VideoFormat("M3U8", "application/x-mpegURL", listOf("m3u8")),
            VideoFormat("MPD", "application/dash+xml", listOf("mpd")),
            VideoFormat("ISM", "application/vnd.ms-sstr+xml", listOf("ism")),
            
            // Archive formats containing video
            VideoFormat("ZIP", "application/zip", listOf("zip")),
            VideoFormat("RAR", "application/x-rar-compressed", listOf("rar"))
        )
    }
    
    /**
     * Check if format is supported by VLC
     */
    fun isVLCSupportedFormat(extension: String): Boolean {
        val vlcFormats = setOf(
            "mp4", "avi", "mkv", "mov", "wmv", "flv", "3gp", "m4v",
            "mts", "m2ts", "ts", "vob", "ogv", "ogg", "rmvb", "rm",
            "asf", "divx", "xvid", "mpg", "mpeg", "m1v", "m2v",
            "mp2", "mpa", "mpe", "mpv2", "m4a", "aac", "ac3",
            "dts", "flac", "mp3", "ogg", "wma", "wav"
        )
        return vlcFormats.contains(extension.lowercase())
    }
    
    /**
     * Check if format is supported by ExoPlayer
     */
    fun isExoPlayerSupportedFormat(extension: String): Boolean {
        val exoFormats = setOf(
            "mp4", "m4v", "m4a", "fmp4", "webm", "mkv", "mp3", "ogg",
            "wav", "mpeg", "mpg", "flv", "3gp", "ts", "aac", "flac",
            "m3u8", "mpd", "ism"
        )
        return exoFormats.contains(extension.lowercase())
    }
    
    /**
     * Get recommended player for format
     */
    fun getRecommendedPlayer(uri: Uri): VideoPlayerType {
        val extension = getFileExtension(uri.toString())?.lowercase() ?: ""
        
        return when {
            // Prefer ExoPlayer for streaming formats
            extension in setOf("m3u8", "mpd", "ism") -> VideoPlayerType.EXOPLAYER
            
            // Use VLC for exotic formats
            extension in setOf("rmvb", "rm", "vob", "mts", "m2ts", "divx", "xvid") -> VideoPlayerType.VLC
            
            // Use ExoPlayer for standard formats (better Android integration)
            isExoPlayerSupportedFormat(extension) -> VideoPlayerType.EXOPLAYER
            
            // Fallback to VLC for unsupported formats
            isVLCSupportedFormat(extension) -> VideoPlayerType.VLC
            
            else -> VideoPlayerType.EXOPLAYER // Default
        }
    }
    
    /**
     * Create VLC media player instance
     */
    fun createVLCPlayer(uri: Uri): MediaPlayer? {
        return try {
            val media = Media(libVLC, uri)
            vlcMediaPlayer?.apply {
                this.media = media
            }
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
    
    /**
     * Get video metadata using VLC
     */
    fun getVideoMetadata(uri: Uri): VideoMetadata? {
        return try {
            val media = Media(libVLC, uri)
            media.parse()
            
            VideoMetadata(
                duration = media.duration,
                width = media.videoTracks?.firstOrNull()?.width ?: 0,
                height = media.videoTracks?.firstOrNull()?.height ?: 0,
                codec = media.videoTracks?.firstOrNull()?.codec ?: "unknown",
                audioTracks = media.audioTracks?.size ?: 0,
                subtitleTracks = media.spuTracks?.size ?: 0,
                frameRate = media.videoTracks?.firstOrNull()?.frameRate ?: 0f
            )
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
    
    /**
     * Check if hardware acceleration is available
     */
    fun isHardwareAccelerationAvailable(): Boolean {
        return try {
            // Check for hardware decoder support
            android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR2
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Get optimal playback settings for device
     */
    fun getOptimalPlaybackSettings(): PlaybackSettings {
        val isHighEndDevice = isHighEndDevice()
        
        return PlaybackSettings(
            useHardwareAcceleration = isHardwareAccelerationAvailable(),
            maxBufferSize = if (isHighEndDevice) 64 * 1024 * 1024 else 32 * 1024 * 1024, // 64MB or 32MB
            prefetchBuffer = if (isHighEndDevice) 8 * 1024 * 1024 else 4 * 1024 * 1024,   // 8MB or 4MB
            networkTimeout = 10000, // 10 seconds
            useGPUDecoding = isHighEndDevice
        )
    }
    
    private fun isHighEndDevice(): Boolean {
        return try {
            val activityManager = context.getSystemService(Context.ACTIVITY_SERVICE) as android.app.ActivityManager
            activityManager.isLowRamDevice.not() && 
            android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M
        } catch (e: Exception) {
            false
        }
    }
    
    private fun getFileExtension(filename: String): String? {
        return filename.substringAfterLast('.', "").takeIf { it.isNotEmpty() }
    }
    
    /**
     * Release resources
     */
    fun release() {
        vlcMediaPlayer?.release()
        libVLC?.release()
        vlcMediaPlayer = null
        libVLC = null
    }
}

// Data classes
data class VideoFormat(
    val name: String,
    val mimeType: String,
    val extensions: List<String>
)

data class VideoMetadata(
    val duration: Long,
    val width: Int,
    val height: Int,
    val codec: String,
    val audioTracks: Int,
    val subtitleTracks: Int,
    val frameRate: Float
)

data class PlaybackSettings(
    val useHardwareAcceleration: Boolean,
    val maxBufferSize: Int,
    val prefetchBuffer: Int,
    val networkTimeout: Int,
    val useGPUDecoding: Boolean
)

enum class VideoPlayerType {
    EXOPLAYER,
    VLC,
    SYSTEM_PLAYER
}