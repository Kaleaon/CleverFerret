package com.universalmedialibrary.ui.player

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ModernVideoPlayerViewModel @Inject constructor(
    @ApplicationContext private val context: Context
) : ViewModel() {

    private val _uiState = MutableStateFlow(VideoPlayerUiState())
    val uiState: StateFlow<VideoPlayerUiState> = _uiState.asStateFlow()

    private var exoPlayer: ExoPlayer? = null

    fun loadVideo(videoPath: String) {
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
        _uiState.value = _uiState.value.copy(
            subtitlesEnabled = !_uiState.value.subtitlesEnabled
        )
        // TODO: Toggle subtitle track
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
        // TODO: Handle fullscreen
    }

    fun changeQuality() {
        // TODO: Implement quality selection
    }

    override fun onCleared() {
        super.onCleared()
        exoPlayer?.release()
        exoPlayer = null
    }
}

data class VideoPlayerUiState(
    val player: ExoPlayer? = null,
    val videoTitle: String = "",
    val videoQuality: String = "1080p",
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
