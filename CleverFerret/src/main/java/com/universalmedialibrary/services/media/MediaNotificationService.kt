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
import com.universalmedialibrary.services.artwork.ArtworkLoader
import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import javax.inject.Inject
import dagger.hilt.android.AndroidEntryPoint

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
    lateinit var artworkLoader: ArtworkLoader

    private var mediaSession: MediaSession? = null

    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

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

        // TODO: Get MediaSession from proper source
        // mediaSession = mediaSessionManager.getMediaSession()

        // Start as foreground service with initial notification
        val notification = createMediaNotification(
            title = getString(resources.getIdentifier("media_notification_title", "string", packageName)),
            artist = getString(resources.getIdentifier("media_notification_unknown_artist", "string", packageName)),
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
        serviceScope.cancel()
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
            artist = artist ?: getString(resources.getIdentifier("media_notification_unknown_artist", "string", packageName)),
            album = album,
            artwork = artwork,
            isPlaying = isPlaying
        )

        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.notify(NOTIFICATION_ID, notification)
    }


    /**
     * Update notification with artwork loading from MediaItem
     *
     * TODO: This is a scaffolding method that will load artwork via ArtworkLoader
     * and update the notification. Currently not fully wired up.
     */
    fun updateNotificationWithArtwork(
        mediaItem: MediaItem,
        title: String,
        artist: String? = null,
        album: String? = null,
        isPlaying: Boolean = false
    ) {
        serviceScope.launch {
            // Load artwork with notification-appropriate size (512x512)
            val artwork = artworkLoader.loadArtwork(
                mediaItem = mediaItem,
                maxWidth = 512,
                maxHeight = 512
            )

            // Update notification with loaded artwork
            updateNotification(
                title = title,
                artist = artist,
                album = album,
                artwork = artwork,
                isPlaying = isPlaying
            )
        }
    }


    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                getString(resources.getIdentifier("notification_channel_media_playback", "string", packageName)),
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description = getString(resources.getIdentifier("notification_channel_media_playback_description", "string", packageName))
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
                resources.getIdentifier("ic_pause", "drawable", packageName),
                getString(resources.getIdentifier("media_pause", "string", packageName)),
                createActionPendingIntent(ACTION_PAUSE)
            ).build()
        } else {
            NotificationCompat.Action.Builder(
                resources.getIdentifier("ic_play", "drawable", packageName),
                getString(resources.getIdentifier("media_play", "string", packageName)),
                createActionPendingIntent(ACTION_PLAY)
            ).build()
        }

        val previousAction = NotificationCompat.Action.Builder(
            resources.getIdentifier("ic_skip_previous", "drawable", packageName),
            getString(resources.getIdentifier("media_skip_previous", "string", packageName)),
            createActionPendingIntent(ACTION_PREVIOUS)
        ).build()

        val nextAction = NotificationCompat.Action.Builder(
            resources.getIdentifier("ic_skip_next", "drawable", packageName),
            getString(resources.getIdentifier("media_skip_next", "string", packageName)),
            createActionPendingIntent(ACTION_NEXT)
        ).build()

        val stopAction = NotificationCompat.Action.Builder(
            resources.getIdentifier("ic_pause", "drawable", packageName), // Using pause icon for stop
            getString(resources.getIdentifier("media_stop", "string", packageName)),
            createActionPendingIntent(ACTION_STOP)
        ).build()

        // Build the notification with MediaStyle
        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle(title)
            .setContentText(artist)
            .setSubText(album)
            .setLargeIcon(artwork)
            .setSmallIcon(resources.getIdentifier("ic_media_notification", "drawable", packageName))
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
        // Note: Media3's MediaSession doesn't expose sessionCompatToken directly
        // The notification will still work without it, but media controls may be limited
        // TODO: Investigate proper Media3 notification integration with MediaNotificationManager

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
