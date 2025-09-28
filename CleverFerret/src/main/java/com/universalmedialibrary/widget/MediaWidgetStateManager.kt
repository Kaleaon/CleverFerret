package com.universalmedialibrary.widget

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.services.media.UniversalMediaPlayerService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Centralized state manager for media widget
 * 
 * Aggregates state from multiple media services and provides
 * a unified state stream for the widget to observe.
 */
@Singleton
class MediaWidgetStateManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val universalMediaPlayerService: UniversalMediaPlayerService,
    private val exoPlayerService: ExoPlayerService
) {
    
    private val _widgetState = MutableStateFlow(MediaWidgetState())
    val widgetState: StateFlow<MediaWidgetState> = _widgetState.asStateFlow()
    
    private var currentMediaItem: MediaItem? = null
    
    init {
        // Combine state from both media services
        observeMediaPlayerServices()
    }
    
    /**
     * Observe state changes from media player services
     */
    private fun observeMediaPlayerServices() {
        // For now, we'll primarily use the universal media player
        // In the future, this can be expanded to handle ExoPlayer integration
        
        // Combine playback state and current media
        combine(
            universalMediaPlayerService.playbackState,
            universalMediaPlayerService.currentMedia
        ) { playbackState, mediaItem ->
            currentMediaItem = mediaItem
            updateWidgetState(playbackState, mediaItem)
        }
    }
    
    /**
     * Update widget state based on media service state
     */
    private fun updateWidgetState(
        playbackState: com.universalmedialibrary.services.media.PlaybackState,
        mediaItem: MediaItem?
    ) {
        if (mediaItem == null) {
            _widgetState.value = MediaWidgetState()
            return
        }
        
        val mediaType = when (mediaItem.mediaType.uppercase()) {
            "BOOK" -> MediaType.BOOK
            "AUDIOBOOK" -> MediaType.AUDIOBOOK
            "MUSIC", "MUSIC_TRACK" -> MediaType.MUSIC
            "MOVIE", "VIDEO" -> MediaType.MOVIE
            "PODCAST" -> MediaType.PODCAST
            else -> MediaType.UNKNOWN
        }
        
        // Load artwork if available
        val artworkBitmap = loadArtwork(mediaItem)
        
        _widgetState.value = MediaWidgetState(
            title = extractTitle(mediaItem),
            artist = extractArtist(mediaItem),
            isPlaying = playbackState.isPlaying,
            hasMedia = true,
            mediaType = mediaType,
            artworkUri = mediaItem.thumbnailPath,
            artworkBitmap = artworkBitmap,
            duration = universalMediaPlayerService.getDuration(),
            position = universalMediaPlayerService.getCurrentPosition(),
            canSkipPrevious = true, // TODO: Implement proper playlist logic
            canSkipNext = true,     // TODO: Implement proper playlist logic
            isLoading = playbackState.isLoading,
            error = playbackState.error
        )
    }
    
    /**
     * Extract title from media item
     */
    private fun extractTitle(mediaItem: MediaItem): String {
        // For now, use filename without extension
        // In the future, this should pull from metadata tables
        return mediaItem.fileName.substringBeforeLast(".")
    }
    
    /**
     * Extract artist/author from media item
     */
    private fun extractArtist(mediaItem: MediaItem): String {
        // Placeholder - should pull from metadata tables
        return when (mediaItem.mediaType.uppercase()) {
            "BOOK", "AUDIOBOOK" -> "Unknown Author"
            "MUSIC", "MUSIC_TRACK" -> "Unknown Artist"
            "MOVIE", "VIDEO" -> "Unknown Director"
            "PODCAST" -> "Unknown Podcast"
            else -> "Unknown"
        }
    }
    
    /**
     * Load artwork bitmap with proper scaling for widget
     */
    private fun loadArtwork(mediaItem: MediaItem): Bitmap? {
        val thumbnailPath = mediaItem.thumbnailPath ?: return null
        
        return try {
            val file = File(thumbnailPath)
            if (!file.exists()) return null
            
            // Pre-scale artwork to widget size for performance
            val options = BitmapFactory.Options().apply {
                inJustDecodeBounds = true
            }
            BitmapFactory.decodeFile(thumbnailPath, options)
            
            // Calculate scaling to fit widget (assuming max 300dp widget)
            val targetSize = (300 * context.resources.displayMetrics.density).toInt()
            options.inSampleSize = calculateInSampleSize(options, targetSize, targetSize)
            options.inJustDecodeBounds = false
            
            BitmapFactory.decodeFile(thumbnailPath, options)
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Calculate appropriate sample size for image scaling
     */
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
            
            while ((halfHeight / inSampleSize) >= reqHeight && 
                   (halfWidth / inSampleSize) >= reqWidth) {
                inSampleSize *= 2
            }
        }
        
        return inSampleSize
    }
    
    /**
     * Handle widget actions
     */
    fun handleAction(action: WidgetAction) {
        when (action) {
            is WidgetAction.PlayPause -> {
                if (_widgetState.value.isPlaying) {
                    universalMediaPlayerService.pause()
                } else {
                    universalMediaPlayerService.play()
                }
            }
            is WidgetAction.SkipNext -> {
                // TODO: Implement skip next logic
            }
            is WidgetAction.SkipPrevious -> {
                // TODO: Implement skip previous logic  
            }
            is WidgetAction.SeekTo -> {
                universalMediaPlayerService.seekTo(action.position)
            }
            is WidgetAction.OpenApp -> {
                // Will be handled by the widget provider
            }
        }
    }
}