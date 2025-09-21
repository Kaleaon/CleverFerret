package com.universalmedialibrary.services.audio

import android.app.Service
import android.content.Intent
import android.os.IBinder
import androidx.core.app.NotificationCompat
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

/**
 * A service that keeps the music playback running in the foreground.
 * This service is started when music playback begins and is stopped when playback ends.
 * It displays a notification to the user to indicate that music is playing.
 */
@AndroidEntryPoint
class MusicPlaybackService : Service() {

    @Inject lateinit var manager: AudioPlaybackManager

    /**
     * Called when the service is started.
     * This method starts the service in the foreground, which is required for background playback.
     */
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val notification = NotificationCompat.Builder(this, AudioPlaybackManager.NOTIFICATION_CHANNEL_ID)
            .setSmallIcon(android.R.drawable.ic_media_play)
            .setContentTitle("CleverFerret")
            .setContentText("Playing music")
            .setOngoing(true)
            .build()
        startForeground(AudioPlaybackManager.NOTIFICATION_ID, notification)
        return START_STICKY
    }

    /**
     * This service does not support binding, so this method returns null.
     */
    override fun onBind(intent: Intent?): IBinder? = null
}