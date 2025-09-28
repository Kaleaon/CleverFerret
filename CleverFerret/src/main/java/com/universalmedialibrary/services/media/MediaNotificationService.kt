package com.universalmedialibrary.services.media

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.os.Build
import androidx.core.app.NotificationCompat
import androidx.media.app.NotificationCompat as MediaNotificationCompat
import androidx.media3.common.Player
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService
import com.universalmedialibrary.MainActivity
import com.universalmedialibrary.R
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

/**
 * Foreground service for media playback notifications
 * 
 * Provides persistent media controls in the notification shade and lockscreen.
 * Integrates with MediaSessionManager for unified media session handling.
 * 
 * Features:
 * - Rich media notifications with MediaStyle
 * - Lockscreen controls integration
 * - Hardware media button support
 * - Android Auto/TV compatibility
 * - High-importance notification channel
 * - Smart notification management
 */
@AndroidEntryPoint
class MediaNotificationService : MediaSessionService() {
    
    @Inject
    lateinit var mediaSessionManager: MediaSessionManager
    
    private var mediaSession: MediaSession? = null
    
    companion object {
        const val NOTIFICATION_ID = 1001
        const val CHANNEL_ID = "media_playback_channel"
        
        // Intent actions for media controls
        const val ACTION_PLAY = "com.universalmedialibrary.ACTION_PLAY"
        const val ACTION_PAUSE = "com.universalmedialibrary.ACTION_PAUSE"
        const val ACTION_NEXT = "com.universalmedialibrary.ACTION_NEXT"
        const val ACTION_PREVIOUS = "com.universalmedialibrary.ACTION_PREVIOUS"
        const val ACTION_STOP = "com.universalmedialibrary.ACTION_STOP"
        
        /**
         * Start the media notification service
         */
        fun start(context: Context, player: Player) {
            val intent = Intent(context, MediaNotificationService::class.java)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                context.startForegroundService(intent)
            } else {
                context.startService(intent)
            }
        }
        
        /**
         * Stop the media notification service
         */
        fun stop(context: Context) {
            val intent = Intent(context, MediaNotificationService::class.java)
            context.stopService(intent)
        }
    }
    
    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
        
        // Get MediaSession from manager or create if needed
        mediaSession = mediaSessionManager.getMediaSession()
        
        // Start as foreground service with initial notification
        val notification = createMediaNotification(
            title = getString(R.string.media_notification_title),
            artist = getString(R.string.media_notification_unknown_artist),
            isPlaying = false
        )
        startForeground(NOTIFICATION_ID, notification)
    }
    
    override fun onGetSession(controllerInfo: androidx.media3.session.MediaSession.ControllerInfo): MediaSession? {
        return mediaSession
    }
    
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        super.onStartCommand(intent, flags, startId)
        
        // Handle media control actions
        when (intent?.action) {
            ACTION_PLAY -> mediaSession?.player?.play()
            ACTION_PAUSE -> mediaSession?.player?.pause()
            ACTION_NEXT -> mediaSession?.player?.seekToNext()
            ACTION_PREVIOUS -> mediaSession?.player?.seekToPrevious()
            ACTION_STOP -> {
                mediaSession?.player?.stop()
                stopForeground(true)
                stopSelf()
            }
        }
        
        return START_NOT_STICKY
    }
    
    override fun onDestroy() {
        mediaSession?.release()
        mediaSession = null
        super.onDestroy()
    }
    
    /**
     * Update the media notification with current track information
     */
    fun updateNotification(
        title: String,
        artist: String? = null,
        album: String? = null,
        artwork: Bitmap? = null,
        isPlaying: Boolean = false
    ) {
        val notification = createMediaNotification(
            title = title,
            artist = artist ?: getString(R.string.media_notification_unknown_artist),
            album = album,
            artwork = artwork,
            isPlaying = isPlaying
        )
        
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.notify(NOTIFICATION_ID, notification)
    }
    
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                getString(R.string.notification_channel_media_playback),
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description = getString(R.string.notification_channel_media_playback_description)
                setShowBadge(false)
                enableLights(false)
                enableVibration(false)
                setSound(null, null)
            }
            
            val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
        }
    }
    
    private fun createMediaNotification(
        title: String,
        artist: String,
        album: String? = null,
        artwork: Bitmap? = null,
        isPlaying: Boolean = false
    ): Notification {
        
        // Create pending intent for opening the app
        val contentIntent = PendingIntent.getActivity(
            this,
            0,
            Intent(this, MainActivity::class.java),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        
        // Create media control actions
        val playPauseAction = if (isPlaying) {
            NotificationCompat.Action.Builder(
                R.drawable.ic_pause,
                getString(R.string.media_pause),
                createActionPendingIntent(ACTION_PAUSE)
            ).build()
        } else {
            NotificationCompat.Action.Builder(
                R.drawable.ic_play,
                getString(R.string.media_play),
                createActionPendingIntent(ACTION_PLAY)
            ).build()
        }
        
        val previousAction = NotificationCompat.Action.Builder(
            R.drawable.ic_skip_previous,
            getString(R.string.media_skip_previous),
            createActionPendingIntent(ACTION_PREVIOUS)
        ).build()
        
        val nextAction = NotificationCompat.Action.Builder(
            R.drawable.ic_skip_next,
            getString(R.string.media_skip_next),
            createActionPendingIntent(ACTION_NEXT)
        ).build()
        
        val stopAction = NotificationCompat.Action.Builder(
            R.drawable.ic_pause, // Using pause icon for stop
            getString(R.string.media_stop),
            createActionPendingIntent(ACTION_STOP)
        ).build()
        
        // Build the notification with MediaStyle
        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle(title)
            .setContentText(artist)
            .setSubText(album)
            .setLargeIcon(artwork)
            .setSmallIcon(R.drawable.ic_media_notification)
            .setContentIntent(contentIntent)
            .setDeleteIntent(createActionPendingIntent(ACTION_STOP))
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setOngoing(isPlaying)
            .setOnlyAlertOnce(true)
            .addAction(previousAction)
            .addAction(playPauseAction)
            .addAction(nextAction)
            .addAction(stopAction)
        
        // Add MediaStyle with show actions in compact view
        val mediaStyle = MediaNotificationCompat.MediaStyle()
            .setShowActionsInCompactView(0, 1, 2) // Previous, Play/Pause, Next
            .setShowCancelButton(true)
            .setCancelButtonIntent(createActionPendingIntent(ACTION_STOP))
        
        // Set MediaSession token if available
        mediaSession?.let { session ->
            mediaStyle.setMediaSession(session.sessionCompatToken)
        }
        
        builder.setStyle(mediaStyle)
        
        return builder.build()
    }
    
    private fun createActionPendingIntent(action: String): PendingIntent {
        val intent = Intent(this, MediaNotificationService::class.java).apply {
            this.action = action
        }
        return PendingIntent.getService(
            this,
            action.hashCode(),
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }
}