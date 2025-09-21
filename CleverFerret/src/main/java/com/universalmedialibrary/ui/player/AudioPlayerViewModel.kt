package com.universalmedialibrary.ui.player

import android.content.Context
import android.media.MediaMetadataRetriever
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.PlaybackException
import androidx.media3.common.Player
import androidx.media3.exoplayer.DefaultRenderersFactory
import androidx.media3.exoplayer.ExoPlayer
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject
import java.io.File
import java.io.FileOutputStream

/**
 * The view model for the audio player screen.
 *
 * @param context The application context.
 */
@HiltViewModel
class AudioPlayerViewModel @Inject constructor(
    @ApplicationContext private val context: Context
) : ViewModel() {

    private val _uiState = MutableStateFlow(AudioPlayerUiState())
    /** The UI state for the audio player screen. */
    val uiState: StateFlow<AudioPlayerUiState> = _uiState.asStateFlow()

    private var exoPlayer: ExoPlayer? = null
    private var updatePositionJob: kotlinx.coroutines.Job? = null

    // Internal queue of media items
    private val mediaQueue: MutableList<MediaItem> = mutableListOf()

    // Configurable position update interval (in milliseconds)
    private var positionUpdateIntervalMs: Long = 250L

    private val playerListener = object : Player.Listener {
        override fun onPlaybackStateChanged(playbackState: Int) {
            when (playbackState) {
                Player.STATE_READY -> {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        duration = exoPlayer?.duration ?: 0L
                    )
                    startPositionUpdates()
                }
                Player.STATE_ENDED -> {
                    _uiState.value = _uiState.value.copy(isPlaying = false)
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
            _uiState.value = _uiState.value.copy(
                isLoading = false,
                error = "Playback error: ${error.message}"
            )
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
     * Loads an audio file for playback.
     * @param context The context to use for creating the player.
     * @param filePath The path to the audio file to play.
     */
    fun loadAudio(context: Context, filePath: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)

                // Release any existing player
                releasePlayerInternal()

                // Initialize player with FFmpeg extension preferred for FLAC
                val renderersFactory = DefaultRenderersFactory(context)
                    .setExtensionRendererMode(DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER)
                exoPlayer = ExoPlayer.Builder(context, renderersFactory).build().apply {
                    addListener(playerListener)
                }

                // Build queue with single item
                val uri = Uri.fromFile(File(filePath))
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
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load audio: ${e.message}"
                )
            }
        }
    }

    /**
     * Sets a playlist (queue) from a list of file paths.
     * @param context The context to use for creating the player.
     * @param filePaths The list of file paths to play.
     * @param startIndex The index to start playback from.
     * @param playWhenReady Whether to start playback immediately.
     */
    fun setQueue(context: Context, filePaths: List<String>, startIndex: Int = 0, playWhenReady: Boolean = true) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)
                if (exoPlayer == null) {
                    val renderersFactory = DefaultRenderersFactory(context)
                        .setExtensionRendererMode(DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER)
                    exoPlayer = ExoPlayer.Builder(context, renderersFactory).build().apply {
                        addListener(playerListener)
                    }
                }
                val items = filePaths.map { path -> MediaItem.fromUri(Uri.fromFile(File(path))) }
                mediaQueue.clear()
                mediaQueue.addAll(items)
                exoPlayer?.setMediaItems(items, startIndex, C.TIME_UNSET)
                exoPlayer?.prepare()
                exoPlayer?.playWhenReady = playWhenReady

                // Extract metadata for current item
                val currentPath = filePaths.getOrNull(startIndex)
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
                _uiState.value = _uiState.value.copy(isLoading = false, error = e.message)
            }
        }
    }

    /**
     * Adds a new item to the end of the queue.
     * @param filePath The path to the audio file.
     */
    fun addToQueue(filePath: String) {
        val item = MediaItem.fromUri(Uri.fromFile(File(filePath)))
        mediaQueue.add(item)
        exoPlayer?.addMediaItem(item)
    }

    /**
     * Skips to the next item in the queue.
     */
    fun skipToNext() { exoPlayer?.seekToNext() }
    /**
     * Skips to the previous item in the queue.
     */
    fun skipToPrevious() { exoPlayer?.seekToPrevious() }

    /**
     * Toggles between play and pause.
     */
    fun togglePlayPause() {
        exoPlayer?.let { player ->
            if (player.isPlaying) player.pause() else player.play()
        }
    }

    /**
     * Seeks to a specific position in the current media item.
     * @param positionMs The position in milliseconds.
     */
    fun seekTo(positionMs: Long) { exoPlayer?.seekTo(positionMs) }

    /**
     * Sets the position update interval.
     * @param intervalMs The interval in milliseconds.
     */
    fun setPositionUpdateInterval(intervalMs: Long) {
        positionUpdateIntervalMs = intervalMs.coerceIn(50L, 2000L)
    }

    /**
     * Sets the player volume.
     * @param volume The volume level, from 0.0 to 1.0.
     */
    fun setVolume(volume: Float) {
        exoPlayer?.volume = volume.coerceIn(0f, 1f)
        _uiState.value = _uiState.value.copy(volume = exoPlayer?.volume ?: volume)
    }

    /**
     * Toggles shuffle mode.
     */
    fun toggleShuffle() {
        val enabled = !(exoPlayer?.shuffleModeEnabled ?: false)
        exoPlayer?.shuffleModeEnabled = enabled
        _uiState.value = _uiState.value.copy(isShuffleEnabled = enabled)
    }

    /**
     * Toggles repeat mode between OFF, ALL, and ONE.
     */
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
        viewModelScope.launch {
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
        stopPositionUpdates()
        exoPlayer?.removeListener(playerListener)
        exoPlayer?.release()
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

    private fun extractFileMetadata(context: Context, filePath: String): ExtractedMeta {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(filePath)
            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
                ?: File(filePath).nameWithoutExtension
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
            val picture = retriever.embeddedPicture
            val coverUri = if (picture != null) saveCoverToCache(context, picture) else null
            ExtractedMeta(title, artist, album, coverUri)
        } catch (e: Exception) {
            ExtractedMeta(File(filePath).nameWithoutExtension, null, null, null)
        } finally {
            try { retriever.release() } catch (_: Exception) {}
        }
    }

    private fun saveCoverToCache(context: Context, bytes: ByteArray): String? {
        return try {
            val file = File(context.cacheDir, "cover_${System.currentTimeMillis()}.jpg")
            FileOutputStream(file).use { it.write(bytes) }
            Uri.fromFile(file).toString()
        } catch (e: Exception) {
            null
        }
    }
}

/**
 * The available repeat modes for the player.
 */
enum class RepeatMode { OFF, ONE, ALL }

/**
 * Represents the UI state for the audio player screen.
 *
 * @property isLoading Whether the player is currently loading.
 * @property isLoaded Whether the player has loaded the media.
 * @property isPlaying Whether the player is currently playing.
 * @property title The title of the current track.
 * @property artist The artist of the current track.
 * @property album The album of the current track.
 * @property coverArtUri The URI of the cover art.
 * @property duration The total duration of the current track in milliseconds.
 * @property currentPosition The current playback position in milliseconds.
 * @property isShuffleEnabled Whether shuffle mode is enabled.
 * @property repeatMode The current repeat mode.
 * @property volume The current player volume.
 * @property error An error message, if any.
 */
data class AudioPlayerUiState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val isPlaying: Boolean = false,
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