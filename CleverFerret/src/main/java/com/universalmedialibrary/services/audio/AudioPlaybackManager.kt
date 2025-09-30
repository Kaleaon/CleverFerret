package com.universalmedialibrary.services.audio

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
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
import androidx.media3.ui.PlayerNotificationManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
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
                addListener(object : Player.Listener {
                    override fun onPlaybackStateChanged(playbackState: Int) {
                        when (playbackState) {
                            Player.STATE_READY -> updateState(isLoading = false, duration = duration)
                            Player.STATE_BUFFERING -> updateState(isLoading = true)
                            Player.STATE_ENDED -> updateState(isPlaying = false)
                        }
                    }
                    override fun onIsPlayingChanged(isPlaying: Boolean) { updateState(isPlaying = isPlaying) }
                    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
                        mediaItem?.let {
                            val meta = it.mediaMetadata
                            updateState(
                                title = meta.title?.toString(),
                                artist = meta.artist?.toString(),
                                album = meta.albumTitle?.toString()
                            )
                        }
                        updateState(duration = duration)
                    }
                    override fun onRepeatModeChanged(repeatMode: Int) {
                        updateState(repeatMode = when (repeatMode) {
                            Player.REPEAT_MODE_ONE -> RepeatMode.ONE
                            Player.REPEAT_MODE_ALL -> RepeatMode.ALL
                            else -> RepeatMode.OFF
                        })
                    }
                    override fun onShuffleModeEnabledChanged(shuffleModeEnabled: Boolean) {
                        updateState(isShuffleEnabled = shuffleModeEnabled)
                    }
                })
            }
    }

    val mediaSession: MediaSession by lazy {
        MediaSession.Builder(context, exoPlayer).build()
    }

    private var playerNotificationManager: PlayerNotificationManager? = null

    init {
        ensureChannel()
        setupNotification()
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
                return null
            }
        }).setChannelImportance(NotificationManager.IMPORTANCE_LOW)
            .build().apply {
                setUseNextAction(true)
                setUsePreviousAction(true)
                setUseFastForwardAction(false)
                setUseRewindAction(false)
                setSmallIcon(android.R.drawable.ic_media_play)
                setMediaSessionToken(mediaSession.sessionCompatToken)
                setPlayer(exoPlayer)
            }
    }

    private fun ensureChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val nm = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            val channel = NotificationChannel(
                NOTIFICATION_CHANNEL_ID,
                "Music Playback",
                NotificationManager.IMPORTANCE_LOW
            )
            nm.createNotificationChannel(channel)
        }
    }

    fun loadSingle(uri: Uri, metadata: MediaMetadata? = null, playWhenReady: Boolean = true) {
        val item = (metadata?.let { MediaItem.Builder().setUri(uri).setMediaMetadata(it).build() }
            ?: MediaItem.fromUri(uri))
        queue.clear()
        queue.add(item)
        exoPlayer.setMediaItem(item)
        exoPlayer.prepare()
        exoPlayer.playWhenReady = playWhenReady
        publishQueue()
    }

    fun setQueue(uris: List<Uri>, startIndex: Int = 0, playWhenReady: Boolean = true) {
        val items = uris.map { MediaItem.fromUri(it) }
        queue.clear(); queue.addAll(items)
        exoPlayer.setMediaItems(items, startIndex, C.TIME_UNSET)
        exoPlayer.prepare(); exoPlayer.playWhenReady = playWhenReady
        publishQueue()
    }

    fun addToQueue(uri: Uri) { val item = MediaItem.fromUri(uri); queue.add(item); exoPlayer.addMediaItem(item); publishQueue() }
    fun removeFromQueue(index: Int) { if (index in queue.indices) { queue.removeAt(index); exoPlayer.removeMediaItem(index); publishQueue() } }
    fun moveQueueItem(from: Int, to: Int) { if (from in queue.indices && to in queue.indices) { val item = queue.removeAt(from); queue.add(to, item); exoPlayer.moveMediaItem(from, to); publishQueue() } }

    fun togglePlayPause() { if (exoPlayer.isPlaying) exoPlayer.pause() else exoPlayer.play() }
    fun seekTo(positionMs: Long) { exoPlayer.seekTo(positionMs) }
    fun skipToNext() { exoPlayer.seekToNext() }
    fun skipToPrevious() { exoPlayer.seekToPrevious() }

    fun toggleShuffle() {
        val enabled = !exoPlayer.shuffleModeEnabled
        exoPlayer.shuffleModeEnabled = enabled
        updateState(isShuffleEnabled = enabled)
    }

    fun toggleRepeat() {
        val next = when (_state.value.repeatMode) {
            RepeatMode.OFF -> RepeatMode.ALL
            RepeatMode.ALL -> RepeatMode.ONE
            RepeatMode.ONE -> RepeatMode.OFF
        }
        exoPlayer.repeatMode = when (next) {
            RepeatMode.OFF -> Player.REPEAT_MODE_OFF
            RepeatMode.ONE -> Player.REPEAT_MODE_ONE
            RepeatMode.ALL -> Player.REPEAT_MODE_ALL
        }
        updateState(repeatMode = next)
    }

    fun setVolume(volume: Float) { exoPlayer.volume = volume.coerceIn(0f, 1f); updateState(volume = exoPlayer.volume) }

    private fun publishQueue() { _state.value = _state.value.copy(queue = queue.map { it.mediaMetadata.title?.toString() ?: it.localConfiguration?.uri?.lastPathSegment ?: "Track" }) }

    private fun updateState(
        isLoading: Boolean? = null,
        isPlaying: Boolean? = null,
        duration: Long? = null,
        title: String? = null,
        artist: String? = null,
        album: String? = null,
        isShuffleEnabled: Boolean? = null,
        repeatMode: RepeatMode? = null,
        volume: Float? = null
    ) {
        val s = _state.value
        _state.value = s.copy(
            isLoading = isLoading ?: s.isLoading,
            isPlaying = isPlaying ?: s.isPlaying,
            duration = duration ?: s.duration,
            title = title ?: s.title,
            artist = artist ?: s.artist,
            album = album ?: s.album,
            isShuffleEnabled = isShuffleEnabled ?: s.isShuffleEnabled,
            repeatMode = repeatMode ?: s.repeatMode,
            volume = volume ?: s.volume
        )
    }
}

enum class RepeatMode { OFF, ONE, ALL }

data class AudioState(
    val isLoading: Boolean = false,
    val isPlaying: Boolean = false,
    val title: String? = null,
    val artist: String? = null,
    val album: String? = null,
    val duration: Long = 0L,
    val currentPosition: Long = 0L,
    val isShuffleEnabled: Boolean = false,
    val repeatMode: RepeatMode = RepeatMode.OFF,
    val volume: Float = 0.8f,
    val queue: List<String> = emptyList()
)
