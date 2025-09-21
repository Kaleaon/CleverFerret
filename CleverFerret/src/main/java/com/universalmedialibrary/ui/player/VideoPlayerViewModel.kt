package com.universalmedialibrary.ui.player

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.common.MediaItem
import androidx.media3.common.PlaybackException
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject
import java.io.File

/**
 * The view model for the video player screen.
 */
@HiltViewModel
class VideoPlayerViewModel @Inject constructor() : ViewModel() {

    private val _uiState = MutableStateFlow(VideoPlayerUiState())
    /** The UI state for the video player screen. */
    val uiState: StateFlow<VideoPlayerUiState> = _uiState.asStateFlow()

    private var exoPlayer: ExoPlayer? = null

    private val playerListener = object : Player.Listener {
        override fun onPlaybackStateChanged(playbackState: Int) {
            when (playbackState) {
                Player.STATE_READY -> {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        duration = exoPlayer?.duration ?: 0L
                    )
                }
                Player.STATE_BUFFERING -> {
                    _uiState.value = _uiState.value.copy(isLoading = true)
                }
                Player.STATE_ENDED -> {
                    _uiState.value = _uiState.value.copy(isPlaying = false)
                }
            }
        }

        override fun onIsPlayingChanged(isPlaying: Boolean) {
            _uiState.value = _uiState.value.copy(isPlaying = isPlaying)
        }

        override fun onPlayerError(error: PlaybackException) {
            _uiState.value = _uiState.value.copy(
                isLoading = false,
                error = "Video playback error: ${error.message}"
            )
        }
    }

    /**
     * Loads a video file for playback.
     * @param context The context to use for creating the player.
     * @param filePath The path to the video file to play.
     */
    fun loadVideo(context: Context, filePath: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)
                
                // Release any existing player
                exoPlayer?.release()
                
                // Create new ExoPlayer
                val renderersFactory = androidx.media3.exoplayer.DefaultRenderersFactory(context)
                .setExtensionRendererMode(androidx.media3.exoplayer.DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER)
            exoPlayer = ExoPlayer.Builder(context, renderersFactory).build().apply {
                    addListener(playerListener)
                }
                
                // Extract basic metadata from file
                val file = File(filePath)
                val fileName = file.nameWithoutExtension
                
                // Create MediaItem
                val mediaItem = MediaItem.fromUri(file.toURI().toString())
                
                exoPlayer?.apply {
                    setMediaItem(mediaItem)
                    prepare()
                    playWhenReady = true // Auto-start video
                }
                
                _uiState.value = _uiState.value.copy(
                    title = fileName,
                    isLoaded = true
                )
                
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load video: ${e.message}"
                )
            }
        }
    }

    /**
     * Gets the ExoPlayer instance for use in PlayerView.
     * @return The ExoPlayer instance, or null if it has not been initialized.
     */
    fun getExoPlayer(): ExoPlayer? = exoPlayer

    /**
     * Toggles between play and pause.
     */
    fun togglePlayPause() {
        exoPlayer?.let { player ->
            if (player.isPlaying) {
                player.pause()
            } else {
                player.play()
            }
        }
    }

    /**
     * Seeks to a specific position in the current media item.
     * @param positionMs The position in milliseconds.
     */
    fun seekTo(positionMs: Long) {
        exoPlayer?.seekTo(positionMs)
    }

    override fun onCleared() {
        super.onCleared()
        exoPlayer?.release()
    }
}

/**
 * Represents the UI state for the video player screen.
 *
 * @property isLoading Whether the player is currently loading.
 * @property isLoaded Whether the player has loaded the media.
 * @property isPlaying Whether the player is currently playing.
 * @property title The title of the video.
 * @property duration The total duration of the video in milliseconds.
 * @property currentPosition The current playback position in milliseconds.
 * @property error An error message, if any.
 */
data class VideoPlayerUiState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val isPlaying: Boolean = false,
    val title: String = "Unknown Video",
    val duration: Long = 0L,
    val currentPosition: Long = 0L,
    val error: String? = null
)