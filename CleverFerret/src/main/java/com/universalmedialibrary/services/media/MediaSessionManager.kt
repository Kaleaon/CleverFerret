package com.universalmedialibrary.services.media

import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.os.Build
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import androidx.media3.common.util.UnstableApi
import androidx.media3.common.C
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.MainActivity

/**
 * Centralized MediaSession manager for CleverFerret
 *
 * Provides unified media session management across all media services:
 * - Music playback with AdvancedMusicPlayerService
 * - Audiobook playback with AudiobookService
 * - Text-to-Speech with TTS services
 * - Universal media with UniversalMediaPlayerService
 *
 * Features:
 * - Single active MediaSession to prevent conflicts
 * - Rich metadata display with artwork
 * - Hardware media button support
 * - Android Auto/TV integration
 * - Lockscreen and notification controls
 */
@Singleton
@UnstableApi
class MediaSessionManager @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private var mediaSession: MediaSession? = null
    private var currentPlayer: Player? = null

    private val _sessionState = MutableStateFlow(MediaSessionState())
    val sessionState: StateFlow<MediaSessionState> = _sessionState.asStateFlow()

    /**
     * Initialize or update the MediaSession with a new player
     */
    fun setPlayer(player: Player, serviceClass: Class<out MediaSessionService>) {
        if (currentPlayer !== player) {
            releaseSession()
            currentPlayer = player
            mediaSession = MediaSession.Builder(context, player)
                .setSessionActivity(createSessionActivityIntent())
                .build()
        } else if (mediaSession == null) {
            currentPlayer = player
            mediaSession = MediaSession.Builder(context, player)
                .setSessionActivity(createSessionActivityIntent())
                .build()
        } else {
            mediaSession?.setSessionActivity(createSessionActivityIntent())
        }

        updateSessionState(isActive = true, serviceClass = serviceClass.simpleName)
    }

    /**
     * Update the current media metadata displayed in notifications
     */
    fun updateMetadata(
        title: String,
        artist: String? = null,
        album: String? = null,
        artwork: Bitmap? = null,
        duration: Long = 0
    ) {
        val metadataBuilder = MediaMetadata.Builder()
            .setTitle(title)
            .setDisplayTitle(title)

        artist?.let {
            metadataBuilder.setArtist(it)
        }

        album?.let {
            metadataBuilder.setAlbumTitle(it)
        }

        artwork?.let {
            // Convert Bitmap to ByteArray for MediaMetadata
            val stream = java.io.ByteArrayOutputStream()
            it.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, stream)
            metadataBuilder.setArtworkData(stream.toByteArray(), MediaMetadata.PICTURE_TYPE_FRONT_COVER)
        }

        // Note: Duration is handled at MediaItem level in Media3, not MediaMetadata
        // When creating MediaItem: MediaItem.Builder().setMediaMetadata(metadata).build()
        // Duration is automatically extracted from the media source by ExoPlayer

        currentPlayer?.let { player ->
            val metadata = metadataBuilder.build()
            if (player.mediaItemCount == 0) {
                val item = MediaItem.Builder()
                    .setMediaMetadata(metadata)
                    .build()
                player.setMediaItem(item)
            } else {
                val index = player.currentMediaItemIndex.takeIf { it != C.INDEX_UNSET }?.coerceIn(0, player.mediaItemCount - 1)
                    ?: 0
                val existingItem = player.getMediaItemAt(index)
                val updatedItem = existingItem.buildUpon()
                    .setMediaMetadata(metadata)
                    .build()
                player.replaceMediaItem(index, updatedItem)
            }
        }

        updateSessionState(
            currentTitle = title,
            currentArtist = artist,
            currentAlbum = album,
            duration = duration
        )
    }

    /**
     * Get the current MediaSession instance
     */
    fun getMediaSession(): MediaSession? = mediaSession

    /**
     * Check if a MediaSession is currently active
     */
    fun isSessionActive(): Boolean = mediaSession != null && currentPlayer != null

    /**
     * Release the current MediaSession
     */
    fun releaseSession() {
        mediaSession?.release()
        mediaSession = null
        currentPlayer = null
        updateSessionState(isActive = false)
    }

    private fun createSessionActivityIntent(): PendingIntent {
        val intent = Intent(context, MainActivity::class.java).apply {
            action = Intent.ACTION_VIEW
            flags = Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val flags = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
        } else {
            PendingIntent.FLAG_UPDATE_CURRENT
        }
        return PendingIntent.getActivity(
            context,
            0,
            intent,
            flags
        )
    }

    private fun updateSessionState(
        isActive: Boolean = _sessionState.value.isActive,
        serviceClass: String = _sessionState.value.activeServiceClass,
        currentTitle: String = _sessionState.value.currentTitle,
        currentArtist: String? = _sessionState.value.currentArtist,
        currentAlbum: String? = _sessionState.value.currentAlbum,
        duration: Long = _sessionState.value.duration
    ) {
        _sessionState.value = MediaSessionState(
            isActive = isActive,
            activeServiceClass = serviceClass,
            currentTitle = currentTitle,
            currentArtist = currentArtist,
            currentAlbum = currentAlbum,
            duration = duration
        )
    }
}

/**
 * State data class for MediaSession status
 */
data class MediaSessionState(
    val isActive: Boolean = false,
    val activeServiceClass: String = "",
    val currentTitle: String = "",
    val currentArtist: String? = null,
    val currentAlbum: String? = null,
    val duration: Long = 0L
)
