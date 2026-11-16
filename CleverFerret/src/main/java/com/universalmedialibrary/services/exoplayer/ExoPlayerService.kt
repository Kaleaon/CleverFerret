package com.universalmedialibrary.services.exoplayer

import android.content.Context
import android.os.Handler
import android.os.Looper
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.exoplayer.trackselection.DefaultTrackSelector
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.source.DefaultMediaSourceFactory
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
 * - Progressive disk caching via ExoPlayerCacheFactory
 * - Better performance and reliability
 * - Advanced playback controls
 */
@Singleton
@androidx.annotation.OptIn(androidx.media3.common.util.UnstableApi::class)
class ExoPlayerService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaController: MediaController,
    private val exoPlayerCacheFactory: ExoPlayerCacheFactory
) {

    private var exoPlayer: ExoPlayer? = null
    private val trackSelector = DefaultTrackSelector(context)
    private val mainHandler = Handler(Looper.getMainLooper())

    internal var currentMediaUri: String? = null
    internal var reconnectAttempts = 0
    internal var lastPlaybackPosition: Long = 0L
    internal var reconnectRunnable: Runnable? = null
    internal var isReconnecting: Boolean = false

    private val _playerState = MutableStateFlow(ExoPlayerState())
    val playerState: StateFlow<ExoPlayerState> = _playerState.asStateFlow()

    companion object {
        const val MAX_RECONNECT_ATTEMPTS = 3
        const val INITIAL_RECONNECT_DELAY_MS = 1000L

        fun getReconnectDelayMs(attempt: Int): Long {
            if (attempt <= 0) return 0L
            val exponent = (attempt - 1).coerceAtMost(30)
            return INITIAL_RECONNECT_DELAY_MS * (1L shl exponent)
        }

        fun isNetworkUri(uriString: String?): Boolean {
            if (uriString.isNullOrBlank()) return false
            val lower = uriString.lowercase()
            return lower.startsWith("http://") || lower.startsWith("https://") ||
                   lower.startsWith("rtsp://") || lower.startsWith("rtmp://")
        }

        fun isTransientNetworkError(error: androidx.media3.common.PlaybackException, isStream: Boolean): Boolean {
            if (!isStream) return false
            return when (error.errorCode) {
                androidx.media3.common.PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_FAILED,
                androidx.media3.common.PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_TIMEOUT,
                androidx.media3.common.PlaybackException.ERROR_CODE_IO_BAD_HTTP_STATUS -> true
                androidx.media3.common.PlaybackException.ERROR_CODE_IO_UNSPECIFIED -> {
                    val cause = error.cause
                    cause is java.io.IOException && cause !is java.io.FileNotFoundException
                }
                else -> false
            }
        }
    }

    fun isNetworkStream(): Boolean {
        val uriString = exoPlayer?.currentMediaItem?.localConfiguration?.uri?.toString() ?: currentMediaUri
        return isNetworkUri(uriString)
    }

    fun cancelScheduledReconnect() {
        reconnectRunnable?.let {
            mainHandler.removeCallbacks(it)
            reconnectRunnable = null
        }
        isReconnecting = false
    }

    internal fun handlePlayerError(error: androidx.media3.common.PlaybackException) {
        val isStream = isNetworkStream()
        if (isTransientNetworkError(error, isStream) && reconnectAttempts < MAX_RECONNECT_ATTEMPTS) {
            reconnectAttempts++
            val retryDelay = getReconnectDelayMs(reconnectAttempts)

            val currentPos = exoPlayer?.currentPosition ?: 0L
            if (currentPos > 0) {
                lastPlaybackPosition = currentPos
            }

            cancelScheduledReconnect()
            isReconnecting = true

            updatePlayerState(
                isBuffering = true,
                isPlaying = false,
                isReconnecting = true,
                error = null
            )

            val runnable = Runnable {
                runOnMainThread {
                    if (!isReconnecting) return@runOnMainThread
                    exoPlayer?.let { player ->
                        player.seekTo(lastPlaybackPosition)
                        player.prepare()
                        player.play()
                    }
                }
            }
            reconnectRunnable = runnable
            mainHandler.postDelayed(runnable, retryDelay)
        } else {
            cancelScheduledReconnect()
            reconnectAttempts = 0
            isReconnecting = false
            updatePlayerState(
                isBuffering = false,
                isPlaying = false,
                isReconnecting = false,
                error = error.message ?: "Playback error: ${error.errorCode}"
            )
        }
    }

    /**
     * Initialize ExoPlayer
     * Ensures execution on main thread
     */
    fun initialize() {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            return
        }

        runOnMainThread {
            if (exoPlayer == null) {
                val mediaSourceFactory = DefaultMediaSourceFactory(context)
                    .setDataSourceFactory(exoPlayerCacheFactory.createCacheDataSourceFactory())

                exoPlayer = ExoPlayer.Builder(context)
                    .setMediaSourceFactory(mediaSourceFactory)
                    .setTrackSelector(trackSelector)
                    .setHandleAudioBecomingNoisy(true)
                    .build().apply {
                    addListener(object : Player.Listener {
                        override fun onPlaybackStateChanged(playbackState: Int) {
                            if (playbackState == Player.STATE_READY) {
                                cancelScheduledReconnect()
                                reconnectAttempts = 0
                            }
                            val isPlaying = playbackState == Player.STATE_READY && playWhenReady
                            updatePlayerState(
                                isPlaying = isPlaying,
                                isBuffering = playbackState == Player.STATE_BUFFERING || isReconnecting,
                                hasEnded = playbackState == Player.STATE_ENDED,
                                isReconnecting = isReconnecting
                            )

                            // Update MediaController state
                            mediaController.updatePlaybackState(
                                isPlaying = isPlaying,
                                position = currentPosition,
                                duration = duration.takeIf { it != androidx.media3.common.C.TIME_UNSET } ?: 0
                            )
                        }

                        override fun onPlayerError(error: androidx.media3.common.PlaybackException) {
                            handlePlayerError(error)
                        }

                        override fun onPositionDiscontinuity(
                            oldPosition: Player.PositionInfo,
                            newPosition: Player.PositionInfo,
                            reason: Int
                        ) {
                            if (newPosition.positionMs > 0) {
                                lastPlaybackPosition = newPosition.positionMs
                            }
                            updatePlayerState(
                                currentPosition = newPosition.positionMs,
                                duration = duration.takeIf { it != androidx.media3.common.C.TIME_UNSET } ?: 0
                            )
                        }
                    })
                }
            }
        }
    }

    /**
     * Load and prepare media for playback with MediaSession integration
     * Ensures execution on main thread
     */
    fun loadMediaWithSession(
        mediaPath: String,
        title: String = "Unknown",
        artist: String? = null,
        album: String? = null,
        artwork: android.graphics.Bitmap? = null,
        serviceType: MediaServiceType = MediaServiceType.UNIVERSAL_MEDIA,
        headers: Map<String, String> = emptyMap()
    ) {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlayerState(error = "ExoPlayer is disabled")
            return
        }

        cancelScheduledReconnect()
        reconnectAttempts = 0
        lastPlaybackPosition = 0L
        currentMediaUri = mediaPath

        initialize()

        runOnMainThread {
            val mediaItem = MediaItem.fromUri(mediaPath)
            exoPlayer?.apply {
                if (headers.isNotEmpty()) {
                    val mediaSourceFactory = DefaultMediaSourceFactory(context)
                        .setDataSourceFactory(exoPlayerCacheFactory.createCacheDataSourceFactory(headers))
                    setMediaSource(mediaSourceFactory.createMediaSource(mediaItem))
                } else {
                    setMediaItem(mediaItem)
                }
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
    }

    /**
     * Load and prepare media for playback
     * Ensures execution on main thread
     */
    fun loadMedia(mediaPath: String, headers: Map<String, String> = emptyMap()) {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlayerState(error = "ExoPlayer is disabled")
            return
        }

        cancelScheduledReconnect()
        reconnectAttempts = 0
        lastPlaybackPosition = 0L
        currentMediaUri = mediaPath

        initialize()

        runOnMainThread {
            val mediaItem = MediaItem.fromUri(mediaPath)
            exoPlayer?.apply {
                if (headers.isNotEmpty()) {
                    val mediaSourceFactory = DefaultMediaSourceFactory(context)
                        .setDataSourceFactory(exoPlayerCacheFactory.createCacheDataSourceFactory(headers))
                    setMediaSource(mediaSourceFactory.createMediaSource(mediaItem))
                } else {
                    setMediaItem(mediaItem)
                }
                prepare()
            }
        }
    }

    /**
     * Prepare a single media item for playback
     * Ensures execution on main thread
     */
    fun prepareMedia(mediaItem: MediaItem, headers: Map<String, String> = emptyMap()): Boolean {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlayerState(error = "ExoPlayer is disabled")
            return false
        }

        cancelScheduledReconnect()
        reconnectAttempts = 0
        lastPlaybackPosition = 0L
        currentMediaUri = mediaItem.localConfiguration?.uri?.toString()

        initialize()

        var result = false
        runOnMainThread {
            try {
                exoPlayer?.apply {
                    if (headers.isNotEmpty()) {
                        val mediaSourceFactory = DefaultMediaSourceFactory(context)
                            .setDataSourceFactory(exoPlayerCacheFactory.createCacheDataSourceFactory(headers))
                        setMediaSource(mediaSourceFactory.createMediaSource(mediaItem))
                    } else {
                        setMediaItem(mediaItem)
                    }
                    prepare()
                }
                result = true
            } catch (e: Exception) {
                updatePlayerState(error = "Failed to prepare media: ${e.message}")
                result = false
            }
        }
        return result
    }

    /**
     * Prepare a playlist for playback
     * Ensures execution on main thread
     */
    fun preparePlaylist(mediaItems: List<MediaItem>, startIndex: Int = 0): Boolean {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlayerState(error = "ExoPlayer is disabled")
            return false
        }

        cancelScheduledReconnect()
        reconnectAttempts = 0
        lastPlaybackPosition = 0L
        currentMediaUri = mediaItems.getOrNull(startIndex)?.localConfiguration?.uri?.toString()

        initialize()

        var result = false
        runOnMainThread {
            try {
                exoPlayer?.apply {
                    setMediaItems(mediaItems, startIndex, 0)
                    prepare()
                }
                result = true
            } catch (e: Exception) {
                updatePlayerState(error = "Failed to prepare playlist: ${e.message}")
                result = false
            }
        }
        return result
    }

    /**
     * Select preferred subtitle language. Pass null to disable subtitles.
     */
    fun selectSubtitleLanguage(language: String?) {
        if (!FeatureFlags.ENABLE_EXOPLAYER) return
        runOnMainThread {
            val paramsBuilder = trackSelector.buildUponParameters()
            if (language.isNullOrBlank()) {
                paramsBuilder.setRendererDisabled(C.TRACK_TYPE_TEXT, true)
                paramsBuilder.setPreferredTextLanguage(null)
            } else {
                paramsBuilder.setRendererDisabled(C.TRACK_TYPE_TEXT, false)
                paramsBuilder.setPreferredTextLanguage(language)
            }
            trackSelector.setParameters(paramsBuilder)
        }
    }

    /**
     * Select preferred audio language.
     */
    fun selectAudioLanguage(language: String?) {
        if (!FeatureFlags.ENABLE_EXOPLAYER) return
        runOnMainThread {
            val paramsBuilder = trackSelector.buildUponParameters()
            if (language.isNullOrBlank()) {
                paramsBuilder.setPreferredAudioLanguage(null)
            } else {
                paramsBuilder.setPreferredAudioLanguage(language)
            }
            trackSelector.setParameters(paramsBuilder)
        }
    }

    /**
     * Set maximum video quality by vertical resolution (e.g., 720, 1080).
     * Pass null to clear constraints (Auto).
     */
    fun setMaxVideoResolution(maxHeight: Int?) {
        if (!FeatureFlags.ENABLE_EXOPLAYER) return
        runOnMainThread {
            val paramsBuilder = trackSelector.buildUponParameters()
            if (maxHeight == null) {
                paramsBuilder.clearVideoSizeConstraints()
            } else {
                paramsBuilder.setMaxVideoSize(Int.MAX_VALUE, maxHeight)
            }
            trackSelector.setParameters(paramsBuilder)
        }
    }

    /**
     * Seek to specific media item in playlist
     * Ensures execution on main thread
     */
    fun seekToMediaItem(mediaItemIndex: Int) {
        runOnMainThread {
            exoPlayer?.seekTo(mediaItemIndex, 0)
        }
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
     * Ensures execution on main thread
     */
    fun setSkipSilence(enabled: Boolean) {
        runOnMainThread {
            exoPlayer?.skipSilenceEnabled = enabled
        }
    }

    /**
     * Start playback
     * Ensures execution on main thread
     */
    fun play() {
        runOnMainThread {
            exoPlayer?.play()
        }
    }

    /**
     * Pause playback
     * Ensures execution on main thread
     */
    fun pause() {
        cancelScheduledReconnect()
        runOnMainThread {
            exoPlayer?.pause()
        }
    }

    /**
     * Stop playback
     * Ensures execution on main thread
     */
    fun stop() {
        cancelScheduledReconnect()
        reconnectAttempts = 0
        runOnMainThread {
            exoPlayer?.stop()
            updatePlayerState(
                isPlaying = false,
                isBuffering = false,
                isReconnecting = false,
                currentPosition = 0,
                duration = 0
            )

            // Stop MediaSession
            mediaController.stopPlayback()
        }
    }

    /**
     * Seek to specific position
     * Ensures execution on main thread
     */
    fun seekTo(positionMs: Long) {
        lastPlaybackPosition = positionMs
        runOnMainThread {
            exoPlayer?.seekTo(positionMs)
        }
    }

    /**
     * Set playback speed
     * Ensures execution on main thread
     */
    fun setPlaybackSpeed(speed: Float) {
        runOnMainThread {
            exoPlayer?.setPlaybackSpeed(speed)
            updatePlayerState(playbackSpeed = speed)
        }
    }

    /**
     * Set volume (0.0 to 1.0)
     * Ensures execution on main thread
     */
    fun setVolume(volume: Float) {
        runOnMainThread {
            exoPlayer?.volume = volume.coerceIn(0f, 1f)
            updatePlayerState(volume = volume.coerceIn(0f, 1f))
        }
    }

    /**
     * Get current volume (0.0 to 1.0)
     */
    fun getVolume(): Float {
        return exoPlayer?.volume ?: 1.0f
    }

    /**
     * Get audio session ID for audio effects
     */
    fun getAudioSessionId(): Int {
        return exoPlayer?.audioSessionId ?: 0
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
     * Ensures execution on main thread
     */
    fun release() {
        cancelScheduledReconnect()
        reconnectAttempts = 0
        runOnMainThread {
            exoPlayer?.release()
            exoPlayer = null
            _playerState.value = ExoPlayerState()
        }
    }

    /**
     * Helper function to ensure code runs on main thread
     * This is required for all ExoPlayer operations
     */
    private fun runOnMainThread(block: () -> Unit) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            // Already on main thread, execute directly
            block()
        } else {
            // Post to main thread
            mainHandler.post(block)
        }
    }

    private fun updatePlayerState(
        isPlaying: Boolean = _playerState.value.isPlaying,
        isBuffering: Boolean = _playerState.value.isBuffering,
        isReconnecting: Boolean = _playerState.value.isReconnecting,
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
            isReconnecting = isReconnecting,
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
    val isReconnecting: Boolean = false,
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
