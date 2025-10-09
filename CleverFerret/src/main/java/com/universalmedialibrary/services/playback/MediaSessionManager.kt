package com.universalmedialibrary.services.playback

import android.content.Context
import android.graphics.Bitmap
import android.os.Bundle
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import androidx.media3.session.MediaSession
import androidx.media3.session.SessionCommand
import androidx.media3.session.SessionResult
import com.google.common.util.concurrent.Futures
import com.google.common.util.concurrent.ListenableFuture
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * MediaSession Manager for Android integration
 *
 * Full MediaSession implementation using Media3 for system integration.
 * Provides lockscreen controls, notification playback, and Android Auto/TV support.
 */
@Singleton
class MediaSessionManager @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private var mediaSession: MediaSession? = null
    private var currentPlayer: Player? = null
    private var playbackCallback: PlaybackCallback? = null

    private val _sessionState = MutableStateFlow(SessionState())
    val sessionState: StateFlow<SessionState> = _sessionState.asStateFlow()

    /**
     * Initialize MediaSession with a player and callback
     */
    fun initialize(player: Player, callback: PlaybackCallback) {
        this.playbackCallback = callback
        this.currentPlayer = player

        // Release existing session if any
        mediaSession?.release()

        // Create new MediaSession with custom callback
        mediaSession = MediaSession.Builder(context, player)
            .setCallback(object : MediaSession.Callback {
                override fun onConnect(
                    session: MediaSession,
                    controller: MediaSession.ControllerInfo
                ): MediaSession.ConnectionResult {
                    val sessionCommands = MediaSession.ConnectionResult.DEFAULT_SESSION_COMMANDS.buildUpon()
                        .add(SessionCommand(COMMAND_SET_REPEAT_MODE, Bundle.EMPTY))
                        .add(SessionCommand(COMMAND_SET_SHUFFLE_MODE, Bundle.EMPTY))
                        .build()

                    return MediaSession.ConnectionResult.AcceptedResultBuilder(session)
                        .setAvailableSessionCommands(sessionCommands)
                        .build()
                }

                override fun onCustomCommand(
                    session: MediaSession,
                    controller: MediaSession.ControllerInfo,
                    customCommand: SessionCommand,
                    args: Bundle
                ): ListenableFuture<SessionResult> {
                    when (customCommand.customAction) {
                        COMMAND_SET_REPEAT_MODE -> {
                            val modeOrdinal = args.getInt(ARG_REPEAT_MODE, 0)
                            val repeatMode = RepeatMode.values().getOrNull(modeOrdinal) ?: RepeatMode.NONE
                            callback.onSetRepeatMode(repeatMode)
                        }
                        COMMAND_SET_SHUFFLE_MODE -> {
                            val shuffleEnabled = args.getBoolean(ARG_SHUFFLE_ENABLED, false)
                            callback.onSetShuffleMode(shuffleEnabled)
                        }
                    }
                    return Futures.immediateFuture(SessionResult(SessionResult.RESULT_SUCCESS))
                }

                override fun onPlaybackResumption(
                    mediaSession: MediaSession,
                    controller: MediaSession.ControllerInfo
                ): ListenableFuture<MediaSession.MediaItemsWithStartPosition> {
                    // Allow resumption from notification
                    callback.onPlay()
                    return super.onPlaybackResumption(mediaSession, controller)
                }
            })
            .build()

        updateSessionState(isActive = true)
    }

    /**
     * Update playback state in MediaSession
     */
    fun updatePlaybackState(
        isPlaying: Boolean,
        position: Long,
        speed: Float = 1.0f,
        error: String? = null
    ) {
        currentPlayer?.let { player ->
            // Media3 Player manages its own playback state
            // We just need to ensure our state is synchronized
            updateSessionState(
                isPlaying = isPlaying,
                currentPosition = position,
                playbackSpeed = speed,
                error = error
            )
        }
    }

    /**
     * Update media metadata in MediaSession
     */
    fun updateMetadata(
        title: String,
        artist: String? = null,
        album: String? = null,
        artworkBitmap: Bitmap? = null,
        duration: Long = 0
    ) {
        currentPlayer?.let { player ->
            val metadataBuilder = MediaMetadata.Builder()
                .setTitle(title)
                .setDisplayTitle(title)

            artist?.let { metadataBuilder.setArtist(it) }
            album?.let { metadataBuilder.setAlbumTitle(it) }
            
            artworkBitmap?.let { bitmap ->
                // Convert Bitmap to ByteArray for MediaMetadata
                val stream = java.io.ByteArrayOutputStream()
                bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
                metadataBuilder.setArtworkData(stream.toByteArray(), MediaMetadata.PICTURE_TYPE_FRONT_COVER)
            }

            val mediaMetadata = metadataBuilder.build()
            
            // Update player's media metadata
            val currentMediaItem = player.currentMediaItem
            if (currentMediaItem != null) {
                val updatedMediaItem = currentMediaItem.buildUpon()
                    .setMediaMetadata(mediaMetadata)
                    .build()
                player.setMediaItem(updatedMediaItem)
            }

            updateSessionState(
                currentTitle = title,
                currentArtist = artist,
                currentAlbum = album,
                duration = duration
            )
        }
    }

    /**
     * Update repeat mode in MediaSession
     */
    fun setRepeatMode(repeatMode: RepeatMode) {
        currentPlayer?.let { player ->
            val playerRepeatMode = when (repeatMode) {
                RepeatMode.NONE -> Player.REPEAT_MODE_OFF
                RepeatMode.ONE -> Player.REPEAT_MODE_ONE
                RepeatMode.ALL -> Player.REPEAT_MODE_ALL
                RepeatMode.SHUFFLE -> {
                    player.shuffleModeEnabled = true
                    Player.REPEAT_MODE_ALL
                }
            }
            
            if (repeatMode != RepeatMode.SHUFFLE) {
                player.shuffleModeEnabled = false
            }
            
            player.repeatMode = playerRepeatMode
            updateSessionState(repeatMode = repeatMode)
        }
    }

    /**
     * Update shuffle mode in MediaSession
     */
    fun setShuffleMode(shuffleEnabled: Boolean) {
        currentPlayer?.let { player ->
            player.shuffleModeEnabled = shuffleEnabled
            updateSessionState(shuffleEnabled = shuffleEnabled)
        }
    }

    /**
     * Get MediaSession token for service binding
     */
    fun getSessionToken(): MediaSession.Token? = mediaSession?.token

    /**
     * Get the MediaSession instance
     */
    fun getMediaSession(): MediaSession? = mediaSession

    /**
     * Check if MediaSession is active
     */
    fun isActive(): Boolean = mediaSession != null && currentPlayer != null

    /**
     * Release resources
     */
    fun release() {
        mediaSession?.release()
        mediaSession = null
        currentPlayer = null
        playbackCallback = null
        updateSessionState(isActive = false)
    }

    private fun updateSessionState(
        isActive: Boolean = _sessionState.value.isActive,
        isPlaying: Boolean = _sessionState.value.isPlaying,
        currentPosition: Long = _sessionState.value.currentPosition,
        playbackSpeed: Float = _sessionState.value.playbackSpeed,
        currentTitle: String = _sessionState.value.currentTitle,
        currentArtist: String? = _sessionState.value.currentArtist,
        currentAlbum: String? = _sessionState.value.currentAlbum,
        duration: Long = _sessionState.value.duration,
        repeatMode: RepeatMode = _sessionState.value.repeatMode,
        shuffleEnabled: Boolean = _sessionState.value.shuffleEnabled,
        error: String? = null
    ) {
        _sessionState.value = SessionState(
            isActive = isActive,
            isPlaying = isPlaying,
            currentPosition = currentPosition,
            playbackSpeed = playbackSpeed,
            currentTitle = currentTitle,
            currentArtist = currentArtist,
            currentAlbum = currentAlbum,
            duration = duration,
            repeatMode = repeatMode,
            shuffleEnabled = shuffleEnabled,
            error = error
        )
    }

    /**
     * Callback interface for MediaSession events
     */
    interface PlaybackCallback {
        fun onPlay()
        fun onPause()
        fun onStop()
        fun onSkipToNext()
        fun onSkipToPrevious()
        fun onSeekTo(position: Long)
        fun onSetRepeatMode(repeatMode: RepeatMode)
        fun onSetShuffleMode(shuffleEnabled: Boolean)
    }

    companion object {
        private const val COMMAND_SET_REPEAT_MODE = "SET_REPEAT_MODE"
        private const val COMMAND_SET_SHUFFLE_MODE = "SET_SHUFFLE_MODE"
        private const val ARG_REPEAT_MODE = "repeat_mode"
        private const val ARG_SHUFFLE_ENABLED = "shuffle_enabled"
    }
}

/**
 * MediaSession state data class
 */
data class SessionState(
    val isActive: Boolean = false,
    val isPlaying: Boolean = false,
    val currentPosition: Long = 0L,
    val playbackSpeed: Float = 1.0f,
    val currentTitle: String = "",
    val currentArtist: String? = null,
    val currentAlbum: String? = null,
    val duration: Long = 0L,
    val repeatMode: RepeatMode = RepeatMode.NONE,
    val shuffleEnabled: Boolean = false,
    val error: String? = null
)
