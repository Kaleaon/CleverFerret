package com.universalmedialibrary.services.media

import android.util.Log
import android.content.Context
import android.net.Uri
import com.universalmedialibrary.data.local.entity.MediaItem
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton
import androidx.media3.common.C
import androidx.media3.common.MediaItem as Media3MediaItem
import androidx.media3.common.MediaMetadata as Media3MediaMetadata
import androidx.media3.common.PlaybackException
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.common.AudioAttributes

/**
 * Universal media player service supporting multiple media types using Media3 ExoPlayer.
 *
 * Provides unified playback interface for:
 * - Audio files (MP3, FLAC, OGG, M4A, WAV)
 * - Video files (MP4, MKV, AVI, MOV, WMV)
 */
@Singleton
@androidx.media3.common.util.UnstableApi
class UniversalMediaPlayerService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaSessionManager: MediaSessionManager
) {

    private var exoPlayer: ExoPlayer? = null

    private val _playbackState = MutableStateFlow(PlayerPlaybackState())
    val playbackState: StateFlow<PlayerPlaybackState> = _playbackState.asStateFlow()

    private val _currentMedia = MutableStateFlow<MediaItem?>(null)
    val currentMedia: StateFlow<MediaItem?> = _currentMedia.asStateFlow()

    fun prepareMedia(mediaItem: MediaItem): Boolean {
        return try {
            releaseCurrentPlayer()

            val file = File(mediaItem.filePath)
            if (!file.exists()) {
                updatePlaybackState(error = "File not found: ${mediaItem.filePath}")
                return false
            }

            val player = ensurePlayer()

            val metadataBuilder = Media3MediaMetadata.Builder()
                .setTitle(mediaItem.title)
            mediaItem.author?.let { metadataBuilder.setArtist(it) }

            val exoMediaItem = Media3MediaItem.Builder()
                .setUri(Uri.fromFile(file))
                .setMediaMetadata(metadataBuilder.build())
                .build()

            _currentMedia.value = mediaItem
            updatePlaybackState(isLoading = true, error = null)

            player.setMediaItem(exoMediaItem)
            mediaSessionManager.updateMetadata(
                title = mediaItem.title,
                artist = mediaItem.author,
                duration = 0
            )
            player.prepare()
            true
        } catch (e: Exception) {
            updatePlaybackState(
                isPlaying = false,
                isLoading = false,
                error = "Failed to prepare media: ${e.message}"
            )
            false
        }
    }

    fun play() {
        val player = exoPlayer ?: ensurePlayer()
        try {
            player.playWhenReady = true
            player.play()
            updatePlaybackState(isPlaying = true, error = null)
        } catch (e: Exception) {
            updatePlaybackState(isPlaying = false, error = "Failed to start playback: ${e.message}")
        }
    }

    fun pause() {
        val player = exoPlayer ?: return
        try {
            player.pause()
            updatePlaybackState(isPlaying = false)
        } catch (e: Exception) {
            updatePlaybackState(error = "Failed to pause playback: ${e.message}")
        }
    }

    fun stop() {
        val player = exoPlayer ?: return
        try {
            player.stop()
            updatePlaybackState(isPlaying = false, isLoading = false)
        } catch (e: Exception) {
            updatePlaybackState(error = "Failed to stop playback: ${e.message}")
        }
    }

    fun seekTo(positionMs: Long) {
        val player = exoPlayer ?: return
        try {
            player.seekTo(positionMs.coerceAtLeast(0L))
        } catch (e: Exception) {
            updatePlaybackState(error = "Failed to seek: ${e.message}")
        }
    }

    fun getCurrentPosition(): Long {
        val player = exoPlayer ?: return 0L
        return try {
            player.currentPosition.takeIf { it != C.TIME_UNSET } ?: 0L
        } catch (e: Exception) {
            0L
        }
    }

    fun getDuration(): Long {
        val player = exoPlayer ?: return 0L
        return try {
            player.duration.takeIf { it != C.TIME_UNSET } ?: 0L
        } catch (e: Exception) {
            0L
        }
    }

    fun release() {
        val currentPlayer = exoPlayer
        releaseCurrentPlayer()
        _currentMedia.value = null
        updatePlaybackState(isPlaying = false, isLoading = false, error = null)
        val sessionPlayer = mediaSessionManager.getMediaSession()?.player
        if (currentPlayer != null && sessionPlayer === currentPlayer) {
            mediaSessionManager.releaseSession()
            MediaNotificationService.stop(context)
        }
    }

    private fun ensurePlayer(): ExoPlayer {
        val existing = exoPlayer
        if (existing != null) {
            return existing
        }

        val player = ExoPlayer.Builder(context)
            .build()
            .apply {
                setAudioAttributes(
                    AudioAttributes.Builder()
                        .setContentType(C.AUDIO_CONTENT_TYPE_MUSIC)
                        .setUsage(C.USAGE_MEDIA)
                        .build(),
                    true
                )
                setHandleAudioBecomingNoisy(true)
                addListener(object : Player.Listener {
                    override fun onPlaybackStateChanged(playbackState: Int) {
                        when (playbackState) {
                            Player.STATE_BUFFERING -> updatePlaybackState(isLoading = true)
                            Player.STATE_READY -> {
                                updatePlaybackState(isLoading = false, isPlaying = isPlaying)
                                MediaNotificationService.start(context)
                            }
                            Player.STATE_ENDED -> updatePlaybackState(isPlaying = false, isLoading = false)
                            Player.STATE_IDLE -> updatePlaybackState(isPlaying = false, isLoading = false)
                        }
                    }

                    override fun onIsPlayingChanged(isPlaying: Boolean) {
                        updatePlaybackState(isPlaying = isPlaying)
                    }

                    override fun onPlayerError(error: PlaybackException) {
                        updatePlaybackState(
                            isPlaying = false,
                            isLoading = false,
                            error = error.localizedMessage
                        )
                    }
                })
            }

        exoPlayer = player
        mediaSessionManager.setPlayer(player, MediaNotificationService::class.java)
        return player
    }

    private fun releaseCurrentPlayer() {
        try {
            exoPlayer?.release()
        } catch (e: Exception) {
            // Ignore release errors
            Log.w("UniversalMediaPlayerService", "Error releasing player resources", e)
        } finally {
            exoPlayer = null
        }
    }

    private fun updatePlaybackState(
        isPlaying: Boolean? = null,
        isLoading: Boolean? = null,
        error: String? = _playbackState.value.error
    ) {
        val current = _playbackState.value
        _playbackState.value = current.copy(
            isPlaying = isPlaying ?: current.isPlaying,
            isLoading = isLoading ?: current.isLoading,
            error = error
        )
    }
}

data class PlayerPlaybackState(
    val isPlaying: Boolean = false,
    val isLoading: Boolean = false,
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val canPlay: Boolean get() = !isLoading && !hasError
}
