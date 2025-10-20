package com.universalmedialibrary.services.media

import android.content.Context
import android.media.MediaPlayer
import android.net.Uri
import com.universalmedialibrary.data.local.entity.MediaItem
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal media player service supporting multiple media types
 *
 * Provides unified playback interface for:
 * - Audio files (MP3, FLAC, OGG, M4A, WAV)
 * - Video files (MP4, MKV, AVI, MOV, WMV)
 *
 * Currently uses MediaPlayer as primary engine
 * TODO: Add ExoPlayer support for better format compatibility and features:
 * Add: implementation "androidx.media3:media3-exoplayer:1.1.1"
 * Benefits: HLS/DASH streaming, subtitles, DRM, better codec support
 */
@Singleton
class UniversalMediaPlayerService @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private var mediaPlayer: MediaPlayer? = null

    private val _playbackState = MutableStateFlow(PlaybackState())
    val playbackState: StateFlow<PlaybackState> = _playbackState.asStateFlow()

    private val _currentMedia = MutableStateFlow<MediaItem?>(null)
    val currentMedia: StateFlow<MediaItem?> = _currentMedia.asStateFlow()

    /**
     * Initialize player with media item
     */
    fun prepareMedia(mediaItem: MediaItem): Boolean {
        try {
            releaseCurrentPlayer()

            val file = File(mediaItem.filePath)
            if (!file.exists()) {
                updatePlaybackState(error = "File not found: ${mediaItem.filePath}")
                return false
            }

            // Initialize MediaPlayer
            if (initializeMediaPlayer(mediaItem)) {
                _currentMedia.value = mediaItem
                return true
            }

            updatePlaybackState(error = "Unable to play media: ${mediaItem.fileName}")
            return false

        } catch (e: Exception) {
            updatePlaybackState(error = "Failed to prepare media: ${e.message}")
            return false
        }
    }

    private fun initializeMediaPlayer(mediaItem: MediaItem): Boolean {
        return try {
            mediaPlayer = MediaPlayer().apply {
                setDataSource(mediaItem.filePath)
                prepare()

                setOnPreparedListener {
                    updatePlaybackState(isPlaying = false, isLoading = false)
                }

                setOnCompletionListener {
                    updatePlaybackState(isPlaying = false)
                }

                setOnErrorListener { _, what, extra ->
                    updatePlaybackState(error = "MediaPlayer error: $what, $extra")
                    true
                }
            }
            true
        } catch (e: Exception) {
            mediaPlayer?.release()
            mediaPlayer = null
            false
        }
    }

    /**
     * Start playback
     */
    fun play() {
        try {
            mediaPlayer?.start()
            updatePlaybackState(isPlaying = true)
        } catch (e: Exception) {
            updatePlaybackState(error = "Failed to start playback: ${e.message}")
        }
    }

    /**
     * Pause playback
     */
    fun pause() {
        try {
            mediaPlayer?.pause()
            updatePlaybackState(isPlaying = false)
        } catch (e: Exception) {
            updatePlaybackState(error = "Failed to pause playback: ${e.message}")
        }
    }

    /**
     * Stop playback
     */
    fun stop() {
        try {
            mediaPlayer?.stop()
            updatePlaybackState(isPlaying = false)
        } catch (e: Exception) {
            updatePlaybackState(error = "Failed to stop playback: ${e.message}")
        }
    }

    /**
     * Seek to position (in milliseconds)
     */
    fun seekTo(positionMs: Long) {
        try {
            mediaPlayer?.seekTo(positionMs.toInt())
        } catch (e: Exception) {
            updatePlaybackState(error = "Failed to seek: ${e.message}")
        }
    }

    /**
     * Get current playback position
     */
    fun getCurrentPosition(): Long {
        return try {
            mediaPlayer?.currentPosition?.toLong() ?: 0L
        } catch (e: Exception) {
            0L
        }
    }

    /**
     * Get media duration
     */
    fun getDuration(): Long {
        return try {
            mediaPlayer?.duration?.toLong() ?: 0L
        } catch (e: Exception) {
            0L
        }
    }

    /**
     * Release all resources
     */
    fun release() {
        releaseCurrentPlayer()
        _currentMedia.value = null
        updatePlaybackState()
    }

    private fun releaseCurrentPlayer() {
        try {
            mediaPlayer?.release()
            mediaPlayer = null
        } catch (e: Exception) {
            // Ignore release errors
        }
    }

    private fun updatePlaybackState(
        isPlaying: Boolean = false,
        isLoading: Boolean = false,
        error: String? = null
    ) {
        _playbackState.value = PlaybackState(
            isPlaying = isPlaying,
            isLoading = isLoading,
            error = error
        )
    }
}

/**
 * Represents the current playback state
 */
data class PlaybackState(
    val isPlaying: Boolean = false,
    val isLoading: Boolean = false,
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val canPlay: Boolean get() = !isLoading && !hasError
}
