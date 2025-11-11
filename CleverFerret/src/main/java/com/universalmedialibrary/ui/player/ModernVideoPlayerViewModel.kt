package com.universalmedialibrary.ui.player

import android.content.Context
import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.ExoPlayer
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
@OptIn(UnstableApi::class)
class ModernVideoPlayerViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val chromecastManager: com.universalmedialibrary.services.cast.ChromecastManager
) : ViewModel() {
    
    private val TAG = "ModernVideoPlayerViewModel"

    private val _uiState = MutableStateFlow(ModernVideoPlayerUiState())
    val uiState: StateFlow<ModernVideoPlayerUiState> = _uiState.asStateFlow()
    
    val castState = chromecastManager.castState

    private var exoPlayer: ExoPlayer? = null
    private var currentVideoUri: String? = null

    fun loadVideo(videoPath: String) {
        currentVideoUri = videoPath
        viewModelScope.launch {
            try {
                exoPlayer = ExoPlayer.Builder(context).build().apply {
                    val mediaItem = MediaItem.fromUri(videoPath)
                    setMediaItem(mediaItem)
                    prepare()
                    
                    addListener(object : Player.Listener {
                        override fun onEvents(player: Player, events: Player.Events) {
                            val durationMs = player.duration.takeIf { it > 0 && it != C.TIME_UNSET } 
                                ?: _uiState.value.duration
                            val positionMs = player.currentPosition.coerceAtLeast(0)
                            val progress = if (durationMs > 0) positionMs.toFloat() / durationMs else 0f
                            
                            _uiState.value = _uiState.value.copy(
                                duration = durationMs,
                                currentPosition = positionMs,
                                progress = progress
                            )
                        }

                        override fun onIsPlayingChanged(isPlaying: Boolean) {
                            _uiState.value = _uiState.value.copy(isPlaying = isPlaying)
                        }

                        override fun onPlaybackStateChanged(playbackState: Int) {
                            when (playbackState) {
                                Player.STATE_IDLE -> { /* No action needed */ }
                                Player.STATE_READY -> {
                                    _uiState.value = _uiState.value.copy(
                                        duration = duration,
                                        isLoading = false
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
                    })
                }

                _uiState.value = _uiState.value.copy(
                    player = exoPlayer,
                    videoTitle = videoPath.substringAfterLast("/").substringBeforeLast(".")
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = e.message)
            }
        }
    }

    fun togglePlayPause() {
        exoPlayer?.let {
            if (it.isPlaying) {
                it.pause()
            } else {
                it.play()
            }
        }
    }

    fun previous() {
        exoPlayer?.seekToPrevious()
    }

    fun next() {
        exoPlayer?.seekToNext()
    }

    fun seekTo(progress: Float) {
        exoPlayer?.let {
            val duration = it.duration
            if (duration > 0 && duration != C.TIME_UNSET) {
                val position = (duration * progress).toLong().coerceIn(0L, duration)
                it.seekTo(position)
                _uiState.value = _uiState.value.copy(
                    currentPosition = position,
                    progress = progress
                )
            }
        }
    }

    fun rewind10() {
        exoPlayer?.let {
            val newPosition = (it.currentPosition - 10000).coerceAtLeast(0)
            it.seekTo(newPosition)
        }
    }

    fun forward10() {
        exoPlayer?.let {
            val newPosition = (it.currentPosition + 10000).coerceAtMost(it.duration)
            it.seekTo(newPosition)
        }
    }

    fun toggleSubtitles() {
        val newState = !_uiState.value.subtitlesEnabled
        _uiState.value = _uiState.value.copy(
            subtitlesEnabled = newState
        )
        
        // Toggle subtitle/text tracks in ExoPlayer
        exoPlayer?.let { player ->
            val trackSelector = player.trackSelector
            if (trackSelector is androidx.media3.exoplayer.trackselection.DefaultTrackSelector) {
                val params = trackSelector.parameters.buildUpon()
                    .setRendererDisabled(C.TRACK_TYPE_TEXT, !newState)
                    .build()
                trackSelector.setParameters(params)
            }
        }
    }

    fun setPlaybackSpeed(speed: Float) {
        exoPlayer?.setPlaybackSpeed(speed)
        _uiState.value = _uiState.value.copy(playbackSpeed = speed)
    }

    fun changePlaybackSpeed() {
        val speeds = listOf(0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 2.0f)
        val currentIndex = speeds.indexOf(_uiState.value.playbackSpeed)
        val nextSpeed = speeds[(currentIndex + 1) % speeds.size]
        setPlaybackSpeed(nextSpeed)
    }

    fun toggleFullscreen() {
        _uiState.value = _uiState.value.copy(
            isFullscreen = !_uiState.value.isFullscreen
        )
        // Fullscreen is handled by the UI layer - this just tracks state
        // The UI will react to this state change and enter/exit fullscreen mode
    }

    fun changeQuality() {
        // Quality selection in ExoPlayer requires adaptive streaming setup
        // For local files, quality is determined by the source file
        // For streaming, we'd need to configure track selection parameters
        exoPlayer?.let { player ->
            val trackSelector = player.trackSelector
            if (trackSelector is androidx.media3.exoplayer.trackselection.DefaultTrackSelector) {
                // Cycle through quality presets
                val currentQuality = _uiState.value.videoQuality
                val nextQuality = when (currentQuality) {
                    "Auto" -> "1080p"
                    "1080p" -> "720p"
                    "720p" -> "480p"
                    "480p" -> "Auto"
                    else -> "Auto"
                }
                _uiState.value = _uiState.value.copy(videoQuality = nextQuality)
                
                // Set max video resolution based on selection
                val params = trackSelector.parameters.buildUpon()
                when (nextQuality) {
                    "1080p" -> params.setMaxVideoSize(1920, 1080)
                    "720p" -> params.setMaxVideoSize(1280, 720)
                    "480p" -> params.setMaxVideoSize(854, 480)
                    else -> params.clearVideoSizeConstraints()
                }
                trackSelector.setParameters(params.build())
            }
        }
    }

    fun startVideoCasting() {
        currentVideoUri?.let { uri ->
            val title = _uiState.value.videoTitle
            // Cast functionality to be enhanced in v1.1.0
            Log.d(TAG, "Casting $title to Chromecast")
        }
    }
    
    fun stopVideoCasting() {
        chromecastManager.stopCasting()
    }

    override fun onCleared() {
        super.onCleared()
        exoPlayer?.release()
        exoPlayer = null
    }
}

data class ModernVideoPlayerUiState(
    val player: ExoPlayer? = null,
    val videoTitle: String = "",
    val videoQuality: String = "Auto",
    val isPlaying: Boolean = false,
    val isLoading: Boolean = false,
    val currentPosition: Long = 0L,
    val duration: Long = 0L,
    val progress: Float = 0f,
    val playbackSpeed: Float = 1.0f,
    val subtitlesEnabled: Boolean = false,
    val isFullscreen: Boolean = false,
    val error: String? = null
)
