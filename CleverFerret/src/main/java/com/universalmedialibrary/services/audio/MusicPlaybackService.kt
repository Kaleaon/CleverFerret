package com.universalmedialibrary.services.audio

import android.app.Notification
import android.app.Service
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Binder
import android.os.IBinder
import androidx.core.app.NotificationCompat
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import com.universalmedialibrary.R
import com.universalmedialibrary.services.media.MediaNotificationService

@AndroidEntryPoint
class MusicPlaybackService : Service() {

    @Inject lateinit var playbackManager: AudioPlaybackManager

    private val serviceJob = SupervisorJob()
    private val serviceScope = CoroutineScope(Dispatchers.Main.immediate + serviceJob)
    private val binder = MusicPlaybackBinder()
    private var placeholderNotificationActive = false

    inner class MusicPlaybackBinder : Binder() {
        fun manager(): AudioPlaybackManager = playbackManager
    }

    override fun onCreate() {
        super.onCreate()
        startForeground(PLACEHOLDER_NOTIFICATION_ID, buildForegroundNotification(this))
        placeholderNotificationActive = true
        MediaNotificationService.start(applicationContext)
        observePlaybackState()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_PLAY_URI -> handlePlayAction(intent)
            ACTION_PAUSE -> playbackManager.exoPlayer.pause()
            ACTION_RESUME -> playbackManager.exoPlayer.play()
            ACTION_TOGGLE -> playbackManager.togglePlayPause()
            ACTION_STOP -> stopPlayback()
        }
        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder = binder

    override fun onDestroy() {
        serviceScope.cancel()
        if (placeholderNotificationActive) {
            stopForeground(STOP_FOREGROUND_REMOVE)
            placeholderNotificationActive = false
        }
        super.onDestroy()
    }

    private fun observePlaybackState() {
        serviceScope.launch {
            playbackManager.state.collectLatest { state ->
                if (placeholderNotificationActive && !state.isLoading) {
                    stopForeground(STOP_FOREGROUND_REMOVE)
                    placeholderNotificationActive = false
                }
                if (!state.isPlaying && playbackManager.exoPlayer.playbackState == Player.STATE_IDLE) {
                    stopPlayback()
                }
            }
        }
    }

    private fun handlePlayAction(intent: Intent) {
        val uriString = intent.getStringExtra(EXTRA_URI) ?: return
        val uri = runCatching { Uri.parse(uriString) }.getOrNull() ?: return
        val metadataBuilder = MediaMetadata.Builder()
        intent.getStringExtra(EXTRA_TITLE)?.let { metadataBuilder.setTitle(it) }
        intent.getStringExtra(EXTRA_ARTIST)?.let { metadataBuilder.setArtist(it) }
        intent.getStringExtra(EXTRA_ALBUM)?.let { metadataBuilder.setAlbumTitle(it) }

        val metadata = metadataBuilder.build().takeIf { it.title != null || it.artist != null || it.albumTitle != null }
        playbackManager.loadSingle(uri, metadata)
    }

    private fun stopPlayback() {
        playbackManager.exoPlayer.stop()
        MediaNotificationService.stop(applicationContext)
        if (placeholderNotificationActive) {
            stopForeground(STOP_FOREGROUND_REMOVE)
            placeholderNotificationActive = false
        }
        stopSelf()
    }

    private fun buildForegroundNotification(context: Context): Notification {
        val title = playbackManager.state.value.title ?: context.getString(R.string.app_name)
        val content = playbackManager.state.value.artist ?: context.getString(R.string.media_notification_unknown_artist)
        return NotificationCompat.Builder(context, AudioPlaybackManager.NOTIFICATION_CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_media_notification)
            .setContentTitle(title)
            .setContentText(content)
            .setOngoing(true)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .build()
    }

    companion object {
        const val ACTION_PLAY_URI = "com.universalmedialibrary.action.PLAY_URI"
        const val ACTION_PAUSE = "com.universalmedialibrary.action.PAUSE"
        const val ACTION_RESUME = "com.universalmedialibrary.action.RESUME"
        const val ACTION_TOGGLE = "com.universalmedialibrary.action.TOGGLE"
        const val ACTION_STOP = "com.universalmedialibrary.action.STOP"

        const val EXTRA_URI = "extra_uri"
        const val EXTRA_TITLE = "extra_title"
        const val EXTRA_ARTIST = "extra_artist"
        const val EXTRA_ALBUM = "extra_album"

        private const val PLACEHOLDER_NOTIFICATION_ID = 2001
    }
}
