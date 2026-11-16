package com.universalmedialibrary.ui.player

import android.util.Log
import android.content.Context
import android.media.MediaMetadataRetriever
import android.net.Uri
import android.os.Handler
import android.os.Looper
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.PlaybackException
import androidx.media3.common.Player
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.DefaultRenderersFactory
import androidx.media3.exoplayer.ExoPlayer
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import javax.inject.Inject
import java.io.File
import java.io.FileOutputStream
import com.universalmedialibrary.utils.ErrorLogger

/**
 * ViewModel for the audio player with metadata extraction and playlist support
 */
@HiltViewModel
@OptIn(UnstableApi::class)
class AudioPlayerViewModel @Inject constructor() : ViewModel() {

    private val _uiState = MutableStateFlow(AudioPlayerUiState())
    val uiState: StateFlow<AudioPlayerUiState> = _uiState.asStateFlow()

    companion object {
        const val MAX_RECONNECT_ATTEMPTS = 3
        const val INITIAL_RECONNECT_DELAY_MS = 1000L

        fun getReconnectDelayMs(attempt: Int): Long {
            if (attempt <= 0) return 0L
            val exponent = (attempt - 1).coerceAtMost(30)
            return INITIAL_RECONNECT_DELAY_MS * (1L shl exponent)
        }

        fun isNetworkUri(uri: Uri?): Boolean {
            if (uri == null) return false
            val scheme = uri.scheme?.lowercase() ?: return false
            return scheme == "http" || scheme == "https" || scheme == "rtsp" || scheme == "rtmp"
        }

        fun isTransientNetworkError(error: PlaybackException?, isStream: Boolean): Boolean {
            if (error == null || !isStream) return false
            return when (error.errorCode) {
                PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_FAILED,
                PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_TIMEOUT,
                PlaybackException.ERROR_CODE_IO_BAD_HTTP_STATUS -> true
                PlaybackException.ERROR_CODE_IO_UNSPECIFIED -> {
                    val cause = error.cause
                    cause is java.io.IOException && cause !is java.io.FileNotFoundException
                }
                else -> false
            }
        }
    }

    private var exoPlayer: ExoPlayer? = null
    private var updatePositionJob: kotlinx.coroutines.Job? = null

    // Internal queue of media items
    private val mediaQueue: MutableList<MediaItem> = mutableListOf()

    // Configurable position update interval (in milliseconds)
    private var positionUpdateIntervalMs: Long = 250L

    internal var currentMediaUri: Uri? = null
    internal var reconnectAttempts = 0
    internal var lastPlaybackPosition: Long = 0L
    internal var reconnectJob: kotlinx.coroutines.Job? = null
    internal var isReconnecting: Boolean = false
    private var lastHandledError: PlaybackException? = null

    fun isCurrentMediaStream(): Boolean {
        val uri = exoPlayer?.currentMediaItem?.localConfiguration?.uri ?: currentMediaUri
        return isNetworkUri(uri)
    }

    fun cancelScheduledReconnect() {
        reconnectJob?.cancel()
        reconnectJob = null
        isReconnecting = false
    }

    internal fun handlePlayerError(error: PlaybackException) {
        if (lastHandledError === error) return
        lastHandledError = error

        val isStream = isCurrentMediaStream()
        if (isTransientNetworkError(error, isStream) && reconnectAttempts < MAX_RECONNECT_ATTEMPTS) {
            reconnectAttempts++
            val retryDelay = getReconnectDelayMs(reconnectAttempts)

            val currentPos = exoPlayer?.currentPosition ?: 0L
            if (currentPos > 0) {
                lastPlaybackPosition = currentPos
            }

            cancelScheduledReconnect()
            isReconnecting = true

            // Maintain buffering state during active retries
            _uiState.value = _uiState.value.copy(
                isLoading = true,
                isPlaying = false,
                isReconnecting = true,
                error = null
            )

            reconnectJob = viewModelScope.launch {
                kotlinx.coroutines.delay(retryDelay)
                if (!isReconnecting) return@launch
                exoPlayer?.let { player ->
                    player.seekTo(lastPlaybackPosition)
                    player.prepare()
                    player.play()
                }
            }
        } else {
            cancelScheduledReconnect()
            reconnectAttempts = 0
            isReconnecting = false
            ErrorLogger.logExoPlayerError("Audio playback error", error)
            _uiState.value = _uiState.value.copy(
                isLoading = false,
                isPlaying = false,
                isReconnecting = false,
                error = "Playback error: ${error.message}"
            )
        }
    }

    private val exceptionHandler = ErrorLogger.createCoroutineExceptionHandler("AudioPlayerViewModel") {
        _uiState.value = _uiState.value.copy(
            isLoading = false,
            error = "Unexpected error: ${it.message}"
        )
    }

    internal val playerListener = object : Player.Listener {
        override fun onPlaybackStateChanged(playbackState: Int) {
            when (playbackState) {
                Player.STATE_IDLE -> { /* No action needed */ }
                Player.STATE_READY -> {
                    cancelScheduledReconnect()
                    reconnectAttempts = 0
                    lastHandledError = null
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        isReconnecting = false,
                        duration = exoPlayer?.duration ?: 0L
                    )
                    startPositionUpdates()
                }
                Player.STATE_ENDED -> {
                    cancelScheduledReconnect()
                    _uiState.value = _uiState.value.copy(isPlaying = false, isReconnecting = false)
                    stopPositionUpdates()
                }
                Player.STATE_BUFFERING -> {
                    _uiState.value = _uiState.value.copy(isLoading = true)
                }
            }
        }

        override fun onIsPlayingChanged(isPlaying: Boolean) {
            _uiState.value = _uiState.value.copy(isPlaying = isPlaying)
            if (isPlaying) startPositionUpdates() else stopPositionUpdates()
        }

        override fun onPlayerError(error: PlaybackException) {
            handlePlayerError(error)
        }

        override fun onPlayerErrorChanged(error: PlaybackException?) {
            error?.let {
                handlePlayerError(it)
            }
        }

        override fun onMediaMetadataChanged(mediaMetadata: androidx.media3.common.MediaMetadata) {
            // Update UI from ExoPlayer metadata when available
            val title = mediaMetadata.title?.toString()
            val artist = mediaMetadata.artist?.toString()
            val album = mediaMetadata.albumTitle?.toString()
            _uiState.value = _uiState.value.copy(
                title = title ?: _uiState.value.title,
                artist = artist ?: _uiState.value.artist,
                album = album ?: _uiState.value.album
            )
        }

        override fun onRepeatModeChanged(repeatMode: Int) {
            _uiState.value = _uiState.value.copy(
                repeatMode = when (repeatMode) {
                    Player.REPEAT_MODE_ONE -> RepeatMode.ONE
                    Player.REPEAT_MODE_ALL -> RepeatMode.ALL
                    else -> RepeatMode.OFF
                }
            )
        }

        override fun onShuffleModeEnabledChanged(shuffleModeEnabled: Boolean) {
            _uiState.value = _uiState.value.copy(isShuffleEnabled = shuffleModeEnabled)
        }
    }

    /**
     * Start playback for a single local audio file
     */
    fun loadAudio(context: Context, filePath: String) {
        viewModelScope.launch(exceptionHandler) {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)

                // Release any existing player
                releasePlayerInternal()

                val uri = if (filePath.startsWith("http://") || filePath.startsWith("https://") || filePath.startsWith("rtsp://")) {
                    Uri.parse(filePath)
                } else {
                    Uri.fromFile(File(filePath))
                }
                currentMediaUri = uri
                cancelScheduledReconnect()
                reconnectAttempts = 0
                lastPlaybackPosition = 0L

                // Initialize player with FFmpeg extension preferred for FLAC
                val renderersFactory = DefaultRenderersFactory(context)
                    .setExtensionRendererMode(DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER)
                exoPlayer = ExoPlayer.Builder(context, renderersFactory).build().apply {
                    addListener(playerListener)
                }

                // Build queue with single item
                val mediaItem = MediaItem.fromUri(uri)
                mediaQueue.clear()
                mediaQueue.add(mediaItem)
                exoPlayer?.setMediaItem(mediaItem)
                exoPlayer?.prepare()

                // Extract metadata (title, artist, album, cover)
                val meta = extractFileMetadata(context, filePath)
                _uiState.value = _uiState.value.copy(
                    title = meta.title,
                    artist = meta.artist,
                    album = meta.album,
                    coverArtUri = meta.coverArtUri,
                    isLoaded = true
                )

            } catch (e: Exception) {
                ErrorLogger.logError("AudioPlayerViewModel", "Failed to load audio", e)
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load audio: ${e.message}"
                )
            }
        }
    }

    /**
     * Set a playlist (queue) from file paths
     */
    fun setQueue(context: Context, filePaths: List<String>, startIndex: Int = 0, playWhenReady: Boolean = true) {
        viewModelScope.launch(exceptionHandler) {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)
                cancelScheduledReconnect()
                reconnectAttempts = 0
                lastPlaybackPosition = 0L
                val currentPath = filePaths.getOrNull(startIndex)
                if (currentPath != null) {
                    currentMediaUri = if (currentPath.startsWith("http://") || currentPath.startsWith("https://") || currentPath.startsWith("rtsp://")) {
                        Uri.parse(currentPath)
                    } else {
                        Uri.fromFile(File(currentPath))
                    }
                }
                if (exoPlayer == null) {
                    val renderersFactory = DefaultRenderersFactory(context)
                        .setExtensionRendererMode(DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER)
                    exoPlayer = ExoPlayer.Builder(context, renderersFactory).build().apply {
                        addListener(playerListener)
                    }
                }
                val items = filePaths.map { path ->
                    val uri = if (path.startsWith("http://") || path.startsWith("https://") || path.startsWith("rtsp://")) {
                        Uri.parse(path)
                    } else {
                        Uri.fromFile(File(path))
                    }
                    MediaItem.fromUri(uri)
                }
                mediaQueue.clear()
                mediaQueue.addAll(items)
                exoPlayer?.setMediaItems(items, startIndex, C.TIME_UNSET)
                exoPlayer?.prepare()
                exoPlayer?.playWhenReady = playWhenReady

                // Extract metadata for current item
                if (currentPath != null) {
                    val meta = extractFileMetadata(context, currentPath)
                    _uiState.value = _uiState.value.copy(
                        title = meta.title,
                        artist = meta.artist,
                        album = meta.album,
                        coverArtUri = meta.coverArtUri,
                        isLoaded = true
                    )
                }
            } catch (e: Exception) {
                ErrorLogger.logError("AudioPlayerViewModel", "Error setting queue", e)
                _uiState.value = _uiState.value.copy(isLoading = false, error = e.message)
            }
        }
    }

    fun addToQueue(filePath: String) {
        val uri = if (filePath.startsWith("http://") || filePath.startsWith("https://") || filePath.startsWith("rtsp://")) {
            Uri.parse(filePath)
        } else {
            Uri.fromFile(File(filePath))
        }
        val item = MediaItem.fromUri(uri)
        mediaQueue.add(item)
        exoPlayer?.addMediaItem(item)
    }

    fun skipToNext() { exoPlayer?.seekToNext() }
    fun skipToPrevious() { exoPlayer?.seekToPrevious() }

    fun togglePlayPause() {
        cancelScheduledReconnect()
        exoPlayer?.let { player ->
            if (player.isPlaying) player.pause() else player.play()
        }
    }

    fun seekTo(positionMs: Long) {
        lastPlaybackPosition = positionMs
        exoPlayer?.seekTo(positionMs)
    }

    fun setPositionUpdateInterval(intervalMs: Long) {
        positionUpdateIntervalMs = intervalMs.coerceIn(50L, 2000L)
    }

    fun setVolume(volume: Float) {
        exoPlayer?.volume = volume.coerceIn(0f, 1f)
        _uiState.value = _uiState.value.copy(volume = exoPlayer?.volume ?: volume)
    }

    fun toggleShuffle() {
        val enabled = !(exoPlayer?.shuffleModeEnabled ?: false)
        exoPlayer?.shuffleModeEnabled = enabled
        _uiState.value = _uiState.value.copy(isShuffleEnabled = enabled)
    }

    fun toggleRepeat() {
        val current = _uiState.value.repeatMode
        val next = when (current) {
            RepeatMode.OFF -> RepeatMode.ALL
            RepeatMode.ALL -> RepeatMode.ONE
            RepeatMode.ONE -> RepeatMode.OFF
        }
        exoPlayer?.repeatMode = when (next) {
            RepeatMode.OFF -> Player.REPEAT_MODE_OFF
            RepeatMode.ONE -> Player.REPEAT_MODE_ONE
            RepeatMode.ALL -> Player.REPEAT_MODE_ALL
        }
        _uiState.value = _uiState.value.copy(repeatMode = next)
    }

    private fun startPositionUpdates() {
        viewModelScope.launch(exceptionHandler) {
            while (exoPlayer != null && (exoPlayer?.isPlaying == true)) {
                _uiState.value = _uiState.value.copy(
                    currentPosition = exoPlayer?.currentPosition ?: 0L,
                    duration = exoPlayer?.duration ?: _uiState.value.duration
                )
                kotlinx.coroutines.delay(positionUpdateIntervalMs)
            }
        }
    }

    private fun stopPositionUpdates() {
        updatePositionJob?.cancel()
        updatePositionJob = null
    }

    private fun releasePlayerInternal() {
        cancelScheduledReconnect()
        reconnectAttempts = 0
        lastPlaybackPosition = 0L
        currentMediaUri = null
        stopPositionUpdates()
        exoPlayer?.removeListener(playerListener)
        // Ensure ExoPlayer is released on the main thread
        Handler(Looper.getMainLooper()).post {
            exoPlayer?.release()
        }
        exoPlayer = null
        mediaQueue.clear()
    }

    override fun onCleared() {
        super.onCleared()
        releasePlayerInternal()
    }

    // Simple metadata holder
    private data class ExtractedMeta(
        val title: String,
        val artist: String?,
        val album: String?,
        val coverArtUri: String?
    )

    private suspend fun extractFileMetadata(context: Context, filePath: String): ExtractedMeta = withContext(Dispatchers.IO) {
        val retriever = MediaMetadataRetriever()
        try {
            retriever.setDataSource(filePath)
            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
                ?: File(filePath).nameWithoutExtension
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
            val picture = retriever.embeddedPicture
            val coverUri = if (picture != null) saveCoverToCache(context, picture) else null
            ExtractedMeta(title, artist, album, coverUri)
        } catch (e: Exception) {
            ErrorLogger.logWarning("AudioPlayerViewModel", "Failed to extract metadata for $filePath", e)
            ExtractedMeta(File(filePath).nameWithoutExtension, null, null, null)
        } finally {
            try { retriever.release() } catch (e: Exception) { Log.w("AudioPlayerViewModel", "Error releasing MediaMetadataRetriever", e) }
        }
    }

    private suspend fun saveCoverToCache(context: Context, bytes: ByteArray): String? = withContext(Dispatchers.IO) {
        try {
            val file = File(context.cacheDir, "cover_${System.currentTimeMillis()}.jpg")
            FileOutputStream(file).use { it.write(bytes) }
            Uri.fromFile(file).toString()
        } catch (e: Exception) {
            ErrorLogger.logWarning("AudioPlayerViewModel", "Failed to save cover to cache", e)
            null
        }
    }
}

// Repeat mode for UI
enum class RepeatMode { OFF, ONE, ALL }

data class AudioPlayerUiState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val isPlaying: Boolean = false,
    val isReconnecting: Boolean = false,
    val title: String = "Unknown Track",
    val artist: String? = null,
    val album: String? = null,
    val coverArtUri: String? = null,
    val duration: Long = 0L,
    val currentPosition: Long = 0L,
    val isShuffleEnabled: Boolean = false,
    val repeatMode: RepeatMode = RepeatMode.OFF,
    val volume: Float = 0.8f,
    val error: String? = null
)
