package com.universalmedialibrary.services.media

import android.app.Notification
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import androidx.core.app.NotificationManagerCompat
import androidx.media3.session.MediaNotificationManager
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService
import androidx.media3.ui.DefaultMediaNotificationProvider
import com.universalmedialibrary.R
import dagger.hilt.EntryPoint
import dagger.hilt.InstallIn
import dagger.hilt.android.EntryPointAccessors
import dagger.hilt.components.SingletonComponent

class MediaNotificationService : MediaSessionService() {

    private lateinit var mediaSessionManager: MediaSessionManager
    private var mediaSession: MediaSession? = null
    private var mediaNotificationManager: MediaNotificationManager? = null

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

    override fun onCreate() {
        super.onCreate()

        val entryPoint = EntryPointAccessors.fromApplication(
            applicationContext,
            MediaNotificationEntryPoint::class.java
        )
        mediaSessionManager = entryPoint.mediaSessionManager()
        mediaSession = mediaSessionManager.getMediaSession()

        val session = mediaSession ?: run {
            stopSelf()
            return
        }

        setupNotificationManager(session)
    }

    override fun onGetSession(controllerInfo: MediaSession.ControllerInfo): MediaSession? = mediaSession

    override fun onDestroy() {
        mediaNotificationManager?.setMediaSession(null)
        mediaNotificationManager = null
        mediaSession = null
        super.onDestroy()
    }

    private fun setupNotificationManager(session: MediaSession) {
        val provider = DefaultMediaNotificationProvider(this).apply {
            setSmallIcon(R.drawable.ic_media_notification)
        }

        mediaNotificationManager = MediaNotificationManager.Builder(
            this,
            NOTIFICATION_ID,
            provider
        )
            .setChannelId(CHANNEL_ID)
            .setChannelNameResourceId(R.string.notification_channel_media_playback)
            .setChannelDescriptionResourceId(R.string.notification_channel_media_playback_description)
            .setChannelImportance(NotificationManager.IMPORTANCE_LOW)
            .setNotificationListener(notificationListener)
            .build().apply {
                setMediaSession(session)
            }
    }

    private val notificationListener = object : MediaNotificationManager.NotificationListener {
        override fun onNotificationCancelled(notificationId: Int, dismissedByUser: Boolean) {
            stopForeground(STOP_FOREGROUND_REMOVE)
            stopSelf()
        }

        override fun onNotificationPosted(notificationId: Int, notification: Notification, ongoing: Boolean) {
            if (ongoing) {
                startForeground(notificationId, notification)
            } else {
                NotificationManagerCompat.from(this@MediaNotificationService).notify(notificationId, notification)
                stopForeground(false)
            }
        }
    }
}