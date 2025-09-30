package com.universalmedialibrary.services.media

import android.content.Context
import android.graphics.Bitmap
import androidx.media3.common.Player
import com.universalmedialibrary.data.local.entity.MediaItem
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal Media Controller for CleverFerret
 *
 * Provides a unified interface for controlling media playback across
 * all media services while maintaining MediaSession integration.
 *
 * Features:
 * - Unified playback control for all media types
 * - Automatic MediaSession management
 * - Rich notification updates
 * - Cross-service state synchronization
 * - Background playback coordination
 */
@Singleton
class MediaController @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaSessionManager: MediaSessionManager
) {

    private val _controllerState = MutableStateFlow(MediaControllerState())
    val controllerState: StateFlow<MediaControllerState> = _controllerState.asStateFlow()

    private var activeServiceType: MediaServiceType = MediaServiceType.NONE
    private var mediaNotificationService: MediaNotificationService? = null

    /**
     * Start media playback with MediaSession integration
     */
    fun startPlayback(
        player: Player,
        serviceType: MediaServiceType,
        mediaItem: MediaItem? = null,
        title: String = "Unknown",
        artist: String? = null,
        album: String? = null,
        artwork: Bitmap? = null
    ) {
        // Set up MediaSession with the new player
        mediaSessionManager.setPlayer(player, MediaNotificationService::class.java)

        // Update metadata
        mediaSessionManager.updateMetadata(
            title = title,
            artist = artist,
            album = album,
            artwork = artwork,
            duration = player.duration
        )

        // Start notification service
        MediaNotificationService.start(context, player)

        // Update controller state
        activeServiceType = serviceType
        updateControllerState(
            isPlaying = player.isPlaying,
            currentTrack = title,
            currentArtist = artist,
            currentAlbum = album,
            serviceType = serviceType
        )
    }

    /**
     * Update the current track metadata and notification
     */
    fun updateCurrentTrack(
        title: String,
        artist: String? = null,
        album: String? = null,
        artwork: Bitmap? = null,
        duration: Long = 0
    ) {
        // Update MediaSession metadata
        mediaSessionManager.updateMetadata(
            title = title,
            artist = artist,
            album = album,
            artwork = artwork,
            duration = duration
        )

        // Update notification if service is running
        mediaNotificationService?.updateNotification(
            title = title,
            artist = artist,
            album = album,
            artwork = artwork,
            isPlaying = _controllerState.value.isPlaying
        )

        updateControllerState(
            currentTrack = title,
            currentArtist = artist,
            currentAlbum = album
        )
    }

    /**
     * Update playback state
     */
    fun updatePlaybackState(
        isPlaying: Boolean,
        position: Long = 0,
        duration: Long = 0
    ) {
        updateControllerState(
            isPlaying = isPlaying,
            position = position,
            duration = duration
        )

        // Update notification with current playing state
        val state = _controllerState.value
        mediaNotificationService?.updateNotification(
            title = state.currentTrack,
            artist = state.currentArtist,
            album = state.currentAlbum,
            isPlaying = isPlaying
        )
    }

    /**
     * Stop media playback and clean up MediaSession
     */
    fun stopPlayback() {
        MediaNotificationService.stop(context)
        mediaSessionManager.releaseSession()

        activeServiceType = MediaServiceType.NONE
        updateControllerState(
            isPlaying = false,
            serviceType = MediaServiceType.NONE
        )
    }

    /**
     * Check if media is currently being controlled
     */
    fun isActive(): Boolean = mediaSessionManager.isSessionActive()

    /**
     * Get the current active service type
     */
    fun getActiveServiceType(): MediaServiceType = activeServiceType

    private fun updateControllerState(
        isPlaying: Boolean = _controllerState.value.isPlaying,
        currentTrack: String = _controllerState.value.currentTrack,
        currentArtist: String? = _controllerState.value.currentArtist,
        currentAlbum: String? = _controllerState.value.currentAlbum,
        position: Long = _controllerState.value.position,
        duration: Long = _controllerState.value.duration,
        serviceType: MediaServiceType = _controllerState.value.serviceType
    ) {
        _controllerState.value = MediaControllerState(
            isPlaying = isPlaying,
            currentTrack = currentTrack,
            currentArtist = currentArtist,
            currentAlbum = currentAlbum,
            position = position,
            duration = duration,
            serviceType = serviceType
        )
    }
}

/**
 * State data class for MediaController
 */
data class MediaControllerState(
    val isPlaying: Boolean = false,
    val currentTrack: String = "",
    val currentArtist: String? = null,
    val currentAlbum: String? = null,
    val position: Long = 0L,
    val duration: Long = 0L,
    val serviceType: MediaServiceType = MediaServiceType.NONE
)

/**
 * Enum for different media service types
 */
enum class MediaServiceType {
    NONE,
    MUSIC,
    AUDIOBOOK,
    TEXT_TO_SPEECH,
    PODCAST,
    UNIVERSAL_MEDIA
}
