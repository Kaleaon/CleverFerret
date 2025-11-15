package com.universalmedialibrary.services.media

import android.content.Context
import android.content.Intent
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService
import dagger.hilt.EntryPoint
import dagger.hilt.InstallIn
import dagger.hilt.android.EntryPointAccessors
import dagger.hilt.components.SingletonComponent

/**
 * Media Notification Service
 * 
 * TODO: Update to use Media3 1.x notification APIs
 * The notification APIs have changed significantly in Media3 1.x.
 * This service needs to be updated to use the new MediaNotification.Provider interface.
 */
class MediaNotificationService : MediaSessionService() {

    private lateinit var mediaSessionManager: MediaSessionManager
    private var mediaSession: MediaSession? = null

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

        // TODO: Setup notification using Media3 1.x APIs
        // The old MediaNotificationManager API has been replaced
    }

    override fun onGetSession(controllerInfo: MediaSession.ControllerInfo): MediaSession? = mediaSession

    override fun onDestroy() {
        mediaSession = null
        super.onDestroy()
    }
}