package com.universalmedialibrary.services.audio

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import androidx.core.app.NotificationCompat
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import androidx.media3.exoplayer.DefaultRenderersFactory
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService
import androidx.media3.ui.PlayerNotificationManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
@androidx.media3.common.util.UnstableApi
class AudioPlaybackManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        const val NOTIFICATION_CHANNEL_ID = "cf_music_playback"
        const val NOTIFICATION_ID = 1001
    }

    private val _state = MutableStateFlow(AudioState())
    val state: StateFlow<AudioState> = _state.asStateFlow()

    private val queue: MutableList<MediaItem> = mutableListOf()

    val exoPlayer: ExoPlayer by lazy {
        val renderersFactory = DefaultRenderersFactory(context)
            .setExtensionRendererMode(DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER)
        ExoPlayer.Builder(context, renderersFactory)
            .setHandleAudioBecomingNoisy(true)
            .build().apply {
                setAudioAttributes(
                    androidx.media3.common.AudioAttributes.Builder()
                        .setContentType(C.AUDIO_CONTENT_TYPE_MUSIC)
                        .setUsage(C.USAGE_MEDIA)
                        .build(),
                    true
                )
                addListener(PlayerEventListener(_state, queue))
            }
    }

    private var mediaSession: MediaSession? = null
    private var playerNotificationManager: PlayerNotificationManager? = null

    init {
        setupMediaSession()
        setupNotification()
        ensureChannel()
    }

    private fun setupMediaSession() {
        // FIXED: Migrated to Media3's MediaSessionService
        mediaSession = MediaSession.Builder(context, exoPlayer)
            .setId("cleverferret_audio_session")
            .setCallback(CleverFerretMediaSessionCallback())
            .build()
    }

    private fun setupNotification() {
        playerNotificationManager = PlayerNotificationManager.Builder(
            context,
            NOTIFICATION_ID,
            NOTIFICATION_CHANNEL_ID
        ).setMediaDescriptionAdapter(object : PlayerNotificationManager.MediaDescriptionAdapter {
            override fun getCurrentContentTitle(player: Player): CharSequence {
                return state.value.title ?: "Unknown Track"
            }
            override fun createCurrentContentIntent(player: Player) = null
            override fun getCurrentContentText(player: Player): CharSequence? {
                return state.value.artist
            }
            override fun getCurrentLargeIcon(player: Player, callback: PlayerNotificationManager.BitmapCallback): android.graphics.Bitmap? {
                // FIXED: Use blue ferret icon for notification
                return try {
                    BitmapFactory.decodeResource(context.resources, 
                        com.universalmedialibrary.R.drawable.ic_ferret_blue_bitmap)
                } catch (e: Exception) {
                    null
                }
            }
        }).setChannelImportance(NotificationManager.IMPORTANCE_LOW)
            .build().apply {
                setUseNextAction(true)
                setUsePreviousAction(true)
                setUseFastForwardAction(false)
                setUseRewindAction(false)
                // FIXED: Use blue ferret icon for notification
                setSmallIcon(com.universalmedialibrary.R.drawable.ic_ferret_blue_bitmap)
                setPlayer(exoPlayer)
            }
    }

    private fun ensureChannel() {
        val nm = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val channel = NotificationChannel(
            NOTIFICATION_CHANNEL_ID,
            "CleverFerret Music Playback",
            NotificationManager.IMPORTANCE_LOW
        ).apply {
            description = "Music playback controls and information"
            setShowBadge(false)
            lockscreenVisibility = Notification.VISIBILITY_PUBLIC
        }
        nm.createNotificationChannel(channel)
    }

    fun playMedia(uri: Uri, title: String? = null, artist: String? = null) {
        val mediaItem = MediaItem.Builder()
            .setUri(uri)
            .setMediaMetadata(
                MediaMetadata.Builder()
                    .setTitle(title ?: "Unknown Track")
                    .setArtist(artist ?: "Unknown Artist")
                    .setAlbumTitle("CleverFerret Media")
                    .build()
            )
            .build()

        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.prepare()
        exoPlayer.play()

        // FIXED: Use blue ferret icon throughout
        updateState(title, artist)
    }

    fun playMediaItem(mediaItem: MediaItem) {
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.prepare()
        exoPlayer.play()

        val title = mediaItem.mediaMetadata.title?.toString()
        val artist = mediaItem.mediaMetadata.artist?.toString()
        updateState(title, artist)
    }

    fun addToQueue(uri: Uri, title: String? = null, artist: String? = null) {
        val mediaItem = MediaItem.Builder()
            .setUri(uri)
            .setMediaMetadata(
                MediaMetadata.Builder()
                    .setTitle(title ?: "Unknown Track")
                    .setArtist(artist ?: "Unknown Artist")
                    .setAlbumTitle("CleverFerret Media")
                    .build()
            )
            .build()

        queue.add(mediaItem)
        exoPlayer.addMediaItem(mediaItem)
        exoPlayer.prepare()
    }

    fun playNext() {
        if (exoPlayer.hasNextMediaItem()) {
            exoPlayer.seekToNextMediaItem()
        } else if (queue.isNotEmpty()) {
            val nextItem = queue.first()
            playMediaItem(nextItem)
            queue.removeAt(0)
        }
    }

    fun playPrevious() {
        if (exoPlayer.hasPreviousMediaItem()) {
            exoPlayer.seekToPreviousMediaItem()
        }
    }

    fun pause() {
        exoPlayer.pause()
    }

    fun resume() {
        exoPlayer.play()
    }

    fun seekTo(position: Long) {
        exoPlayer.seekTo(position)
    }

    fun stop() {
        exoPlayer.stop()
        playerNotificationManager?.setPlayer(null)
        mediaSession?.release()
    }

    private fun updateState(title: String?, artist: String?) {
        _state.value = _state.value.copy(
            title = title,
            artist = artist,
            isPlaying = exoPlayer.isPlaying,
            currentPosition = exoPlayer.currentPosition,
            duration = exoPlayer.duration
        )
    }

    fun getMediaSessionToken(): MediaSession.Token? = mediaSession?.sessionToken

    fun release() {
        exoPlayer.release()
        playerNotificationManager?.setPlayer(null)
        mediaSession?.release()
    }
}

data class AudioState(
    val title: String? = null,
    val artist: String? = null,
    val isPlaying: Boolean = false,
    val currentPosition: Long = 0L,
    val duration: Long = 0L
)

class PlayerEventListener(
    private val state: MutableStateFlow<AudioState>,
    private val queue: MutableList<MediaItem>
) : Player.Listener {

    override fun onIsPlayingChanged(isPlaying: Boolean) {
        super.onIsPlayingChanged(isPlaying)
        state.value = state.value.copy(isPlaying = isPlaying)
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        super.onMediaItemTransition(mediaItem, reason)
        mediaItem?.let {
            state.value = state.value.copy(
                title = it.mediaMetadata.title?.toString(),
                artist = it.mediaMetadata.artist?.toString()
            )
        }
    }

    override fun onPlaybackStateChanged(playbackState: Int) {
        super.onPlaybackStateChanged(playbackState)
        state.value = state.value.copy(
            isPlaying = playbackState == Player.STATE_READY
        )
    }
}

class CleverFerretMediaSessionCallback : MediaSession.Callback {
    override fun onPlay() {
        super.onPlay()
    }

    override fun onPause() {
        super.onPause()
    }

    override fun onSeekTo(position: Long) {
        super.onSeekTo(position)
    }
}