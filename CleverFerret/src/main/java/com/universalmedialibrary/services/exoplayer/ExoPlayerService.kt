package com.universalmedialibrary.services.exoplayer

import android.content.Context
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.services.media.MediaController
import com.universalmedialibrary.services.media.MediaServiceType
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * ExoPlayer service for advanced media playback
 * 
 * Provides superior audio and video playback capabilities compared to
 * the basic Android MediaPlayer, with support for:
 * - Multiple audio/video formats
 * - Adaptive streaming
 * - Better performance and reliability
 * - Advanced playback controls
 */
@Singleton
class ExoPlayerService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaController: MediaController
) {
    
    private var exoPlayer: ExoPlayer? = null
    
    private val _playerState = MutableStateFlow(ExoPlayerState())
    val playerState: StateFlow<ExoPlayerState> = _playerState.asStateFlow()
    
    /**
     * Initialize ExoPlayer
     */
    fun initialize() {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            return
        }
        
        if (exoPlayer == null) {
            exoPlayer = ExoPlayer.Builder(context).build().apply {
                addListener(object : Player.Listener {
                    override fun onPlaybackStateChanged(playbackState: Int) {
                        val isPlaying = playbackState == Player.STATE_READY && playWhenReady
                        updatePlayerState(
                            isPlaying = isPlaying,
                            isBuffering = playbackState == Player.STATE_BUFFERING,
                            hasEnded = playbackState == Player.STATE_ENDED
                        )
                        
                        // Update MediaController state
                        mediaController.updatePlaybackState(
                            isPlaying = isPlaying,
                            position = currentPosition,
                            duration = duration.takeIf { it != androidx.media3.common.C.TIME_UNSET } ?: 0
                        )
                    }
                    
                    override fun onPlayerError(error: androidx.media3.common.PlaybackException) {
                        updatePlayerState(error = error.message)
                    }
                    
                    override fun onPositionDiscontinuity(
                        oldPosition: Player.PositionInfo,
                        newPosition: Player.PositionInfo,
                        reason: Int
                    ) {
                        updatePlayerState(
                            currentPosition = newPosition.positionMs,
                            duration = duration.takeIf { it != androidx.media3.common.C.TIME_UNSET } ?: 0
                        )
                    }
                })
            }
        }
    }
    
    /**
     * Load and prepare media for playback with MediaSession integration
     */
    fun loadMediaWithSession(
        mediaPath: String,
        title: String = "Unknown",
        artist: String? = null,
        album: String? = null,
        artwork: android.graphics.Bitmap? = null,
        serviceType: MediaServiceType = MediaServiceType.UNIVERSAL_MEDIA
    ) {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlayerState(error = "ExoPlayer is disabled")
            return
        }
        
        initialize()
        
        val mediaItem = MediaItem.fromUri(mediaPath)
        exoPlayer?.apply {
            setMediaItem(mediaItem)
            prepare()
            
            // Start MediaSession with metadata
            mediaController.startPlayback(
                player = this,
                serviceType = serviceType,
                title = title,
                artist = artist,
                album = album,
                artwork = artwork
            )
        }
    }
    
    /**
     * Load and prepare media for playback
     */
    fun loadMedia(mediaPath: String) {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlayerState(error = "ExoPlayer is disabled")
            return
        }
        
        initialize()
        
        val mediaItem = MediaItem.fromUri(mediaPath)
        exoPlayer?.apply {
            setMediaItem(mediaItem)
            prepare()
        }
    }
    
    /**
     * Prepare a single media item for playback
     */
    fun prepareMedia(mediaItem: MediaItem): Boolean {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlayerState(error = "ExoPlayer is disabled")
            return false
        }
        
        initialize()
        
        return try {
            exoPlayer?.apply {
                setMediaItem(mediaItem)
                prepare()
            }
            true
        } catch (e: Exception) {
            updatePlayerState(error = "Failed to prepare media: ${e.message}")
            false
        }
    }
    
    /**
     * Prepare a playlist for playback
     */
    fun preparePlaylist(mediaItems: List<MediaItem>, startIndex: Int = 0): Boolean {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlayerState(error = "ExoPlayer is disabled")
            return false
        }
        
        initialize()
        
        return try {
            exoPlayer?.apply {
                setMediaItems(mediaItems, startIndex, 0)
                prepare()
            }
            true
        } catch (e: Exception) {
            updatePlayerState(error = "Failed to prepare playlist: ${e.message}")
            false
        }
    }
    
    /**
     * Seek to specific media item in playlist
     */
    fun seekToMediaItem(mediaItemIndex: Int) {
        exoPlayer?.seekTo(mediaItemIndex, 0)
    }
    
    /**
     * Get current position in milliseconds
     */
    fun getCurrentPosition(): Long {
        return exoPlayer?.currentPosition ?: 0
    }
    
    /**
     * Get duration in milliseconds
     */
    fun getDuration(): Long {
        return exoPlayer?.duration?.takeIf { it != androidx.media3.common.C.TIME_UNSET } ?: 0
    }
    
    /**
     * Enable/disable skip silence
     */
    fun setSkipSilence(enabled: Boolean) {
        exoPlayer?.skipSilenceEnabled = enabled
    }
    
    /**
     * Start playback
     */
    fun play() {
        exoPlayer?.play()
    }
    
    /**
     * Pause playback
     */
    fun pause() {
        exoPlayer?.pause()
    }
    
    /**
     * Stop playback
     */
    fun stop() {
        exoPlayer?.stop()
        updatePlayerState(
            isPlaying = false,
            currentPosition = 0,
            duration = 0
        )
        
        // Stop MediaSession
        mediaController.stopPlayback()
    }
    
    /**
     * Seek to specific position
     */
    fun seekTo(positionMs: Long) {
        exoPlayer?.seekTo(positionMs)
    }
    
    /**
     * Set playback speed
     */
    fun setPlaybackSpeed(speed: Float) {
        exoPlayer?.setPlaybackSpeed(speed)
        updatePlayerState(playbackSpeed = speed)
    }
    
    /**
     * Set volume (0.0 to 1.0)
     */
    fun setVolume(volume: Float) {
        exoPlayer?.volume = volume.coerceIn(0f, 1f)
        updatePlayerState(volume = volume.coerceIn(0f, 1f))
    }
    
    /**
     * Get the ExoPlayer instance for advanced use cases
     */
    fun getPlayer(): ExoPlayer? = exoPlayer
    
    /**
     * Check if ExoPlayer is available
     */
    fun isAvailable(): Boolean = FeatureFlags.ENABLE_EXOPLAYER
    
    /**
     * Release resources
     */
    fun release() {
        exoPlayer?.release()
        exoPlayer = null
        _playerState.value = ExoPlayerState()
    }
    
    private fun updatePlayerState(
        isPlaying: Boolean = _playerState.value.isPlaying,
        isBuffering: Boolean = _playerState.value.isBuffering,
        hasEnded: Boolean = _playerState.value.hasEnded,
        currentPosition: Long = _playerState.value.currentPosition,
        duration: Long = _playerState.value.duration,
        playbackSpeed: Float = _playerState.value.playbackSpeed,
        volume: Float = _playerState.value.volume,
        error: String? = null
    ) {
        _playerState.value = ExoPlayerState(
            isPlaying = isPlaying,
            isBuffering = isBuffering,
            hasEnded = hasEnded,
            currentPosition = currentPosition,
            duration = duration,
            playbackSpeed = playbackSpeed,
            volume = volume,
            error = error
        )
    }
}

/**
 * State of the ExoPlayer
 */
data class ExoPlayerState(
    val isPlaying: Boolean = false,
    val isBuffering: Boolean = false,
    val hasEnded: Boolean = false,
    val currentPosition: Long = 0,
    val duration: Long = 0,
    val playbackSpeed: Float = 1.0f,
    val volume: Float = 1.0f,
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val progress: Float get() = if (duration > 0) currentPosition.toFloat() / duration else 0f
}