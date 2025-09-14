package com.universalmedialibrary.ui.player

import android.content.Context
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.ui.PlayerView
import com.universalmedialibrary.services.video.ComprehensiveVideoService
import com.universalmedialibrary.services.video.VideoMetadata
import com.universalmedialibrary.services.video.VideoPlayerType
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
// VLC imports handled via reflection
// import org.videolan.libvlc.MediaPlayer
// import org.videolan.libvlc.util.VLCVideoLayout
import javax.inject.Inject

@HiltViewModel
class UniversalVideoPlayerViewModel @Inject constructor(
    private val videoService: ComprehensiveVideoService
) : ViewModel() {

    private val _playerState = MutableStateFlow(UniversalPlayerState())
    val playerState: StateFlow<UniversalPlayerState> = _playerState.asStateFlow()

    private var exoPlayer: ExoPlayer? = null
    private var vlcPlayer: Any? = null // MediaPlayer? = null
    private var currentUri: Uri? = null

    fun initializePlayer(context: Context, uri: Uri) {
        viewModelScope.launch {
            try {
                _playerState.value = _playerState.value.copy(isLoading = true, error = null)
                currentUri = uri

                // Initialize VLC if not already done
                if (!videoService.initializeVLC()) {
                    _playerState.value = _playerState.value.copy(
                        error = "Failed to initialize VLC player"
                    )
                    return@launch
                }

                // Determine best player for this format
                val recommendedPlayer = videoService.getRecommendedPlayer(uri)
                
                // Get video metadata
                val metadata = videoService.getVideoMetadata(uri)
                
                // Initialize the recommended player
                when (recommendedPlayer) {
                    VideoPlayerType.EXOPLAYER -> initializeExoPlayer(context, uri)
                    VideoPlayerType.VLC -> initializeVLCPlayer(context, uri)
                    VideoPlayerType.SYSTEM_PLAYER -> initializeSystemPlayer(uri)
                }

                _playerState.value = _playerState.value.copy(
                    isLoading = false,
                    playerType = recommendedPlayer,
                    videoMetadata = metadata,
                    duration = metadata?.duration ?: 0L
                )

            } catch (e: Exception) {
                _playerState.value = _playerState.value.copy(
                    isLoading = false,
                    error = "Failed to initialize player: ${e.message}"
                )
            }
        }
    }

    private fun initializeExoPlayer(context: Context, uri: Uri) {
        try {
            exoPlayer?.release()
            exoPlayer = ExoPlayer.Builder(context).build().apply {
                val mediaItem = MediaItem.fromUri(uri)
                setMediaItem(mediaItem)
                prepare()
                
                addListener(object : Player.Listener {
                    override fun onPlaybackStateChanged(playbackState: Int) {
                        updatePlayerState()
                    }
                    
                    override fun onIsPlayingChanged(isPlaying: Boolean) {
                        _playerState.value = _playerState.value.copy(isPlaying = isPlaying)
                    }
                })
            }

            val playerView = PlayerView(context).apply {
                player = exoPlayer
                useController = false // We'll use custom controls
            }

            _playerState.value = _playerState.value.copy(
                exoPlayerView = playerView
            )

        } catch (e: Exception) {
            _playerState.value = _playerState.value.copy(
                error = "ExoPlayer initialization failed: ${e.message}"
            )
        }
    }

    private fun initializeVLCPlayer(context: Context, uri: Uri) {
        try {
            vlcPlayer = videoService.createVLCPlayer(uri)?.apply {
                setEventListener { event ->
                    when (event.type) {
                        MediaPlayer.Event.Playing -> {
                            _playerState.value = _playerState.value.copy(isPlaying = true)
                        }
                        MediaPlayer.Event.Paused -> {
                            _playerState.value = _playerState.value.copy(isPlaying = false)
                        }
                        MediaPlayer.Event.Stopped -> {
                            _playerState.value = _playerState.value.copy(isPlaying = false)
                        }
                        MediaPlayer.Event.EncounteredError -> {
                            _playerState.value = _playerState.value.copy(
                                error = "VLC playback error"
                            )
                        }
                    }
                }
            }

            val vlcVideoLayout = VLCVideoLayout(context).apply {
                vlcPlayer?.attachViews(this, null, false, false)
            }

            _playerState.value = _playerState.value.copy(
                vlcVideoLayout = vlcVideoLayout
            )

        } catch (e: Exception) {
            _playerState.value = _playerState.value.copy(
                error = "VLC player initialization failed: ${e.message}"
            )
        }
    }

    private fun initializeSystemPlayer(uri: Uri) {
        // Placeholder for system player initialization
        _playerState.value = _playerState.value.copy(
            error = "System player not yet implemented"
        )
    }

    fun togglePlayPause() {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> {
                exoPlayer?.let { player ->
                    if (player.isPlaying) {
                        player.pause()
                    } else {
                        player.play()
                    }
                }
            }
            VideoPlayerType.VLC -> {
                vlcPlayer?.let { player ->
                    if (player.isPlaying) {
                        player.pause()
                    } else {
                        player.play()
                    }
                }
            }
            VideoPlayerType.SYSTEM_PLAYER -> {
                // System player toggle
            }
        }
    }

    fun seekTo(positionMs: Long) {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> {
                exoPlayer?.seekTo(positionMs)
            }
            VideoPlayerType.VLC -> {
                vlcPlayer?.time = positionMs
            }
            VideoPlayerType.SYSTEM_PLAYER -> {
                // System player seek
            }
        }
    }

    fun setVolume(volume: Float) {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> {
                exoPlayer?.volume = volume
            }
            VideoPlayerType.VLC -> {
                vlcPlayer?.setVolume((volume * 100).toInt())
            }
            VideoPlayerType.SYSTEM_PLAYER -> {
                // System player volume
            }
        }
        _playerState.value = _playerState.value.copy(volume = volume)
    }

    fun setPlaybackSpeed(speed: Float) {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> {
                exoPlayer?.setPlaybackSpeed(speed)
            }
            VideoPlayerType.VLC -> {
                vlcPlayer?.rate = speed
            }
            VideoPlayerType.SYSTEM_PLAYER -> {
                // System player speed
            }
        }
        _playerState.value = _playerState.value.copy(playbackSpeed = speed)
    }

    fun toggleSubtitles() {
        // Implementation depends on player type
        val newState = !_playerState.value.subtitlesEnabled
        _playerState.value = _playerState.value.copy(subtitlesEnabled = newState)
    }

    fun changeAudioTrack(trackIndex: Int) {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> {
                // ExoPlayer audio track selection
            }
            VideoPlayerType.VLC -> {
                vlcPlayer?.setAudioTrack(trackIndex)
            }
            VideoPlayerType.SYSTEM_PLAYER -> {
                // System player audio track
            }
        }
    }

    fun toggleFullscreen() {
        val newState = !_playerState.value.isFullscreen
        _playerState.value = _playerState.value.copy(isFullscreen = newState)
    }

    fun switchPlayer(newPlayerType: VideoPlayerType) {
        currentUri?.let { uri ->
            viewModelScope.launch {
                // Save current position
                val currentPosition = getCurrentPosition()
                
                // Release current player
                releaseCurrentPlayer()
                
                // Initialize new player
                when (newPlayerType) {
                    VideoPlayerType.EXOPLAYER -> initializeExoPlayer(
                        _playerState.value.exoPlayerView?.context ?: return@launch, uri
                    )
                    VideoPlayerType.VLC -> initializeVLCPlayer(
                        _playerState.value.vlcVideoLayout?.context ?: return@launch, uri
                    )
                    VideoPlayerType.SYSTEM_PLAYER -> initializeSystemPlayer(uri)
                }
                
                _playerState.value = _playerState.value.copy(playerType = newPlayerType)
                
                // Restore position
                seekTo(currentPosition)
            }
        }
    }

    fun retryPlayback() {
        currentUri?.let { uri ->
            val context = _playerState.value.exoPlayerView?.context 
                ?: _playerState.value.vlcVideoLayout?.context 
                ?: return
            initializePlayer(context, uri)
        }
    }

    fun switchToAlternativePlayer() {
        val alternativePlayer = when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> VideoPlayerType.VLC
            VideoPlayerType.VLC -> VideoPlayerType.EXOPLAYER
            VideoPlayerType.SYSTEM_PLAYER -> VideoPlayerType.EXOPLAYER
        }
        switchPlayer(alternativePlayer)
    }

    private fun getCurrentPosition(): Long {
        return when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> exoPlayer?.currentPosition ?: 0L
            VideoPlayerType.VLC -> vlcPlayer?.time ?: 0L
            VideoPlayerType.SYSTEM_PLAYER -> 0L
        }
    }

    private fun updatePlayerState() {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> {
                exoPlayer?.let { player ->
                    val currentPosition = player.currentPosition
                    val duration = player.duration.takeIf { it > 0 } ?: 1L
                    val progress = (currentPosition.toFloat() / duration).coerceIn(0f, 1f)
                    
                    _playerState.value = _playerState.value.copy(
                        currentPosition = currentPosition,
                        duration = duration,
                        progress = progress,
                        isPlaying = player.isPlaying
                    )
                }
            }
            VideoPlayerType.VLC -> {
                vlcPlayer?.let { player ->
                    val currentPosition = player.time
                    val duration = player.length.takeIf { it > 0 } ?: 1L
                    val progress = (currentPosition.toFloat() / duration).coerceIn(0f, 1f)
                    
                    _playerState.value = _playerState.value.copy(
                        currentPosition = currentPosition,
                        duration = duration,
                        progress = progress,
                        isPlaying = player.isPlaying
                    )
                }
            }
            VideoPlayerType.SYSTEM_PLAYER -> {
                // System player state updates
            }
        }
    }

    private fun releaseCurrentPlayer() {
        exoPlayer?.release()
        vlcPlayer?.release()
        exoPlayer = null
        vlcPlayer = null
    }

    fun releasePlayer() {
        releaseCurrentPlayer()
        _playerState.value = UniversalPlayerState()
    }

    override fun onCleared() {
        super.onCleared()
        releasePlayer()
        videoService.release()
    }
}

// Data class for player state
data class UniversalPlayerState(
    val playerType: VideoPlayerType = VideoPlayerType.EXOPLAYER,
    val isLoading: Boolean = false,
    val isPlaying: Boolean = false,
    val isFullscreen: Boolean = false,
    val currentPosition: Long = 0L,
    val duration: Long = 0L,
    val progress: Float = 0f,
    val volume: Float = 1f,
    val playbackSpeed: Float = 1f,
    val subtitlesEnabled: Boolean = false,
    val videoMetadata: VideoMetadata? = null,
    val error: String? = null,
    val exoPlayerView: PlayerView? = null,
    val vlcVideoLayout: VLCVideoLayout? = null
)