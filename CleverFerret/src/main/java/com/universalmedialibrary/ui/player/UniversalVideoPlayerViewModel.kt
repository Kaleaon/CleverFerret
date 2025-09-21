package com.universalmedialibrary.ui.player

import android.content.Context
import android.net.Uri
import android.view.View
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
import javax.inject.Inject

/**
 * The view model for the universal video player screen.
 *
 * @param videoService The service for comprehensive video support.
 */
@HiltViewModel
class UniversalVideoPlayerViewModel @Inject constructor(
    private val videoService: ComprehensiveVideoService
) : ViewModel() {

    private val _playerState = MutableStateFlow(UniversalPlayerState())
    /** The UI state for the universal video player screen. */
    val playerState: StateFlow<UniversalPlayerState> = _playerState.asStateFlow()

    private var exoPlayer: ExoPlayer? = null
    private var vlcPlayer: Any? = null
    private var currentUri: Uri? = null

    /**
     * Initializes the player with the appropriate engine for the given URI.
     * @param context The context to use for creating the player.
     * @param uri The URI of the video to play.
     */
    fun initializePlayer(context: Context, uri: Uri) {
        viewModelScope.launch {
            try {
                _playerState.value = _playerState.value.copy(isLoading = true, error = null)
                currentUri = uri

                // Determine best player for this format
                val recommended = videoService.getRecommendedPlayer(uri)

                // Try to init VLC only if recommended
                val useVLC = if (recommended == VideoPlayerType.VLC) videoService.initializeVLC() else false

                val chosenPlayer = when {
                    recommended == VideoPlayerType.EXOPLAYER -> {
                        initializeExoPlayer(context, uri)
                        VideoPlayerType.EXOPLAYER
                    }
                    recommended == VideoPlayerType.VLC && useVLC -> {
                        initializeVLCPlayer(context, uri)
                        VideoPlayerType.VLC
                    }
                    else -> {
                        // Fallback to ExoPlayer
                        initializeExoPlayer(context, uri)
                        VideoPlayerType.EXOPLAYER
                    }
                }

                val metadata = videoService.getVideoMetadata(uri)

                _playerState.value = _playerState.value.copy(
                    isLoading = false,
                    playerType = chosenPlayer,
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
            val renderersFactory = androidx.media3.exoplayer.DefaultRenderersFactory(context)
                .setExtensionRendererMode(androidx.media3.exoplayer.DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER)
            exoPlayer = ExoPlayer.Builder(context, renderersFactory).build().apply {
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
            vlcPlayer = videoService.createVLCPlayer(uri)
            if (vlcPlayer == null) {
                _playerState.value = _playerState.value.copy(error = "VLC not available")
                return
            }

            // Create VLCVideoLayout via reflection
            val layoutClass = Class.forName("org.videolan.libvlc.util.VLCVideoLayout")
            val layout = layoutClass.getConstructor(Context::class.java).newInstance(context)
            
            // Attach views: player.attachViews(layout, null, false, false)
            safeInvoke(vlcPlayer, "attachViews", arrayOf(layoutClass, Any::class.java, Boolean::class.javaPrimitiveType, Boolean::class.javaPrimitiveType), layout, null, false, false)

            // Autoplay
            safeInvoke(vlcPlayer, "play")

            _playerState.value = _playerState.value.copy(
                vlcVideoLayout = layout
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

    /**
     * Toggles between play and pause.
     */
    fun togglePlayPause() {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> {
                exoPlayer?.let { player ->
                    if (player.isPlaying) player.pause() else player.play()
                }
            }
            VideoPlayerType.VLC -> {
                val isPlaying = safeInvoke(vlcPlayer, "isPlaying") as? Boolean ?: false
                if (isPlaying) safeInvoke(vlcPlayer, "pause") else safeInvoke(vlcPlayer, "play")
            }
            VideoPlayerType.SYSTEM_PLAYER -> {
                // System player toggle
            }
        }
    }

    /**
     * Seeks to a specific position in the current media item.
     * @param positionMs The position in milliseconds.
     */
    fun seekTo(positionMs: Long) {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> exoPlayer?.seekTo(positionMs)
            VideoPlayerType.VLC -> safeInvoke(vlcPlayer, "setTime", arrayOf(Long::class.javaPrimitiveType), positionMs)
            VideoPlayerType.SYSTEM_PLAYER -> { }
        }
    }

    /**
     * Sets the player volume.
     * @param volume The volume level, from 0.0 to 1.0.
     */
    fun setVolume(volume: Float) {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> exoPlayer?.volume = volume
            VideoPlayerType.VLC -> safeInvoke(vlcPlayer, "setVolume", arrayOf(Int::class.javaPrimitiveType), (volume * 100).toInt())
            VideoPlayerType.SYSTEM_PLAYER -> { }
        }
        _playerState.value = _playerState.value.copy(volume = volume)
    }

    /**
     * Sets the playback speed.
     * @param speed The new playback speed.
     */
    fun setPlaybackSpeed(speed: Float) {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> exoPlayer?.setPlaybackSpeed(speed)
            VideoPlayerType.VLC -> safeInvoke(vlcPlayer, "setRate", arrayOf(Float::class.javaPrimitiveType), speed)
            VideoPlayerType.SYSTEM_PLAYER -> { }
        }
        _playerState.value = _playerState.value.copy(playbackSpeed = speed)
    }

    /**
     * Toggles subtitles on or off.
     */
    fun toggleSubtitles() {
        // Implementation depends on player type
        val newState = !_playerState.value.subtitlesEnabled
        _playerState.value = _playerState.value.copy(subtitlesEnabled = newState)
    }

    /**
     * Changes the audio track.
     * @param trackIndex The index of the audio track to select.
     */
    fun changeAudioTrack(trackIndex: Int) {
        when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> {
                // ExoPlayer audio track selection (not implemented here)
            }
            VideoPlayerType.VLC -> safeInvoke(vlcPlayer, "setAudioTrack", arrayOf(Int::class.javaPrimitiveType), trackIndex)
            VideoPlayerType.SYSTEM_PLAYER -> { }
        }
    }

    /**
     * Toggles fullscreen mode.
     */
    fun toggleFullscreen() {
        val newState = !_playerState.value.isFullscreen
        _playerState.value = _playerState.value.copy(isFullscreen = newState)
    }

    /**
     * Switches the player engine.
     * @param newPlayerType The new player type to use.
     */
    fun switchPlayer(newPlayerType: VideoPlayerType) {
        currentUri?.let { uri ->
            viewModelScope.launch {
                val currentPosition = getCurrentPosition()
                releaseCurrentPlayer()
                when (newPlayerType) {
                    VideoPlayerType.EXOPLAYER -> initializeExoPlayer(
                        _playerState.value.exoPlayerView?.context ?: return@launch, uri
                    )
                    VideoPlayerType.VLC -> initializeVLCPlayer(
                        (_playerState.value.vlcVideoLayout as? View)?.context ?: _playerState.value.exoPlayerView?.context ?: return@launch,
                        uri
                    )
                    VideoPlayerType.SYSTEM_PLAYER -> initializeSystemPlayer(uri)
                }
                _playerState.value = _playerState.value.copy(playerType = newPlayerType)
                seekTo(currentPosition)
            }
        }
    }

    /**
     * Retries playback after an error.
     */
    fun retryPlayback() {
        currentUri?.let { uri ->
            val context = _playerState.value.exoPlayerView?.context
                ?: (_playerState.value.vlcVideoLayout as? View)?.context
                ?: return
            initializePlayer(context, uri)
        }
    }

    private fun getCurrentPosition(): Long {
        return when (_playerState.value.playerType) {
            VideoPlayerType.EXOPLAYER -> exoPlayer?.currentPosition ?: 0L
            VideoPlayerType.VLC -> (safeInvoke(vlcPlayer, "getTime") as? Long) ?: 0L
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
                val currentPosition = (safeInvoke(vlcPlayer, "getTime") as? Long) ?: 0L
                val duration = (safeInvoke(vlcPlayer, "getLength") as? Long) ?: 1L
                val isPlaying = (safeInvoke(vlcPlayer, "isPlaying") as? Boolean) ?: false
                val progress = (currentPosition.toFloat() / duration).coerceIn(0f, 1f)
                _playerState.value = _playerState.value.copy(
                    currentPosition = currentPosition,
                    duration = duration,
                    progress = progress,
                    isPlaying = isPlaying
                )
            }
            VideoPlayerType.SYSTEM_PLAYER -> { }
        }
    }

    private fun releaseCurrentPlayer() {
        exoPlayer?.release()
        runCatching { safeInvoke(vlcPlayer, "release") }
        exoPlayer = null
        vlcPlayer = null
    }

    /**
     * Releases the player resources.
     */
    fun releasePlayer() {
        releaseCurrentPlayer()
        _playerState.value = UniversalPlayerState()
    }

    override fun onCleared() {
        super.onCleared()
        releasePlayer()
        videoService.release()
    }

    private fun safeInvoke(target: Any?, method: String, paramTypes: Array<Class<*>> = emptyArray(), vararg args: Any?): Any? {
        return try {
            if (target == null) return null
            val m = target.javaClass.getMethod(method, *paramTypes)
            m.invoke(target, *args)
        } catch (e: Exception) {
            null
        }
    }
}

/**
 * Represents the UI state for the universal video player screen.
 *
 * @property playerType The type of player currently in use.
 * @property isLoading Whether the player is currently loading.
 * @property isPlaying Whether the player is currently playing.
 * @property isFullscreen Whether the player is in fullscreen mode.
 * @property currentPosition The current playback position in milliseconds.
 * @property duration The total duration of the video in milliseconds.
 * @property progress The current playback progress, from 0.0 to 1.0.
 * @property volume The current volume.
 * @property playbackSpeed The current playback speed.
 * @property subtitlesEnabled Whether subtitles are currently enabled.
 * @property videoMetadata The metadata for the current video.
 * @property error An error message, if any.
 * @property exoPlayerView The ExoPlayer view, if applicable.
 * @property vlcVideoLayout The VLC video layout, if applicable.
 */
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
    val vlcVideoLayout: Any? = null
)