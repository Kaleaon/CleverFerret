package com.universalmedialibrary.services.media

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Build
import androidx.media3.common.Player
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService
import androidx.media3.ui.PlayerNotificationManager
import com.universalmedialibrary.R
import dagger.hilt.EntryPoint
import dagger.hilt.InstallIn
import dagger.hilt.android.EntryPointAccessors
import dagger.hilt.components.SingletonComponent

/**
 * Media Notification Service
 *
 * Provides a foreground notification that mirrors the currently active MediaSession.
 */
class MediaNotificationService : MediaSessionService() {

    private lateinit var mediaSessionManager: MediaSessionManager
    private var mediaSession: MediaSession? = null
    private var playerNotificationManager: PlayerNotificationManager? = null

    companion object {
        const val NOTIFICATION_ID = 1001
        const val CHANNEL_ID = "media_playback_channel"

        fun start(context: Context) {
            val intent = Intent(context, MediaNotificationService::class.java)
            context.startForegroundService(intent)
        }

        fun stop(context: Context) {
            val intent = Intent(context, MediaNotificationService::class.java)
            context.stopService(intent)
        }
    }

    @EntryPoint
    @InstallIn(SingletonComponent::class)
    interface MediaNotificationEntryPoint {
        fun mediaSessionManager(): MediaSessionManager
    }

    private val notificationListener = object : PlayerNotificationManager.NotificationListener {
        override fun onNotificationPosted(
            notificationId: Int,
            notification: Notification,
            ongoing: Boolean
        ) {
            if (ongoing) {
                startForeground(notificationId, notification)
            } else {
                stopForeground(STOP_FOREGROUND_DETACH)
                (getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager)
                    .notify(notificationId, notification)
            }
        }

        override fun onNotificationCancelled(notificationId: Int, dismissedByUser: Boolean) {
            stopForeground(STOP_FOREGROUND_REMOVE)
            stopSelf()
        }
    }

    override fun onCreate() {
        super.onCreate()

        val entryPoint = EntryPointAccessors.fromApplication(
            applicationContext,
            MediaNotificationEntryPoint::class.java
        )
        mediaSessionManager = entryPoint.mediaSessionManager()
        refreshMediaSession()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        refreshMediaSession()
        return super.onStartCommand(intent, flags, startId)
    }

    override fun onGetSession(controllerInfo: MediaSession.ControllerInfo): MediaSession? = mediaSession

    override fun onDestroy() {
        playerNotificationManager?.setPlayer(null)
        playerNotificationManager = null
        mediaSession = null
        super.onDestroy()
    }

    private fun refreshMediaSession() {
        val session = mediaSessionManager.getMediaSession()
        if (session == null) {
            stopForeground(STOP_FOREGROUND_REMOVE)
            stopSelf()
            return
        }

        if (mediaSession !== session) {
            mediaSession = session
            playerNotificationManager?.setPlayer(null)
            playerNotificationManager = null
        }

        startOrUpdateNotification(session)
    }

    private fun startOrUpdateNotification(session: MediaSession) {
        val player = session.player ?: return
        ensureNotificationChannel()

        if (playerNotificationManager == null) {
            playerNotificationManager = PlayerNotificationManager.Builder(
                this,
                NOTIFICATION_ID,
                CHANNEL_ID
            )
                .setMediaDescriptionAdapter(MediaDescriptionAdapter())
                .setNotificationListener(notificationListener)
                .build().apply {
                    session.sessionCompatToken?.let { setMediaSessionToken(it) }
                    setUseNextAction(true)
                    setUsePreviousAction(true)
                    setUseFastForwardAction(true)
                    setUseRewindAction(true)
                    setSmallIcon(R.drawable.ic_media_notification)
                }
        }

        playerNotificationManager?.setPlayer(player)
    }

    private fun ensureNotificationChannel() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val notificationManager = getSystemService(NotificationManager::class.java)
        val existing = notificationManager.getNotificationChannel(CHANNEL_ID)
        if (existing == null) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                getString(R.string.notification_channel_media_playback),
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = getString(R.string.notification_channel_media_playback_description)
                setShowBadge(false)
                lockscreenVisibility = Notification.VISIBILITY_PUBLIC
            }
            notificationManager.createNotificationChannel(channel)
        }
    }

    private inner class MediaDescriptionAdapter : PlayerNotificationManager.MediaDescriptionAdapter {
        override fun getCurrentContentTitle(player: Player): CharSequence {
            return player.mediaMetadata.title ?: getString(R.string.media_notification_title)
        }

        override fun createCurrentContentIntent(player: Player) = mediaSession?.sessionActivity

        override fun getCurrentContentText(player: Player): CharSequence? {
            return player.mediaMetadata.artist
                ?: player.mediaMetadata.albumTitle
                ?: getString(R.string.media_notification_unknown_artist)
        }

        override fun getCurrentLargeIcon(
            player: Player,
            callback: PlayerNotificationManager.BitmapCallback
        ): Bitmap? {
            val artworkData = player.mediaMetadata.artworkData ?: return null
            return try {
                BitmapFactory.decodeByteArray(artworkData, 0, artworkData.size)
            } catch (_: Exception) {
                null
            }
        }
    }
}