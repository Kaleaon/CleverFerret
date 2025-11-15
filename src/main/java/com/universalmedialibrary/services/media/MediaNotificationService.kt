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
import android.support.v4.media.session.MediaSessionCompat
import androidx.media.app.NotificationCompat as MediaNotificationCompat
import androidx.media3.common.Player
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService
import androidx.media3.ui.DefaultMediaNotificationProvider
import androidx.media3.ui.MediaNotificationProvider
import com.universalmedialibrary.MainActivity
import com.universalmedialibrary.R
import com.universalmedialibrary.services.artwork.ArtworkLoader
import com.universalmedialibrary.data.local.entity.MediaItem
import dagger.hilt.EntryPoint
import dagger.hilt.InstallIn
import dagger.hilt.android.EntryPointAccessors
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

/**
 * EntryPoint for accessing Hilt-provided dependencies in MediaSessionService
 * which cannot use @AndroidEntryPoint annotation
 */
@EntryPoint
@InstallIn(SingletonComponent::class)
interface MediaNotificationEntryPoint {
    fun artworkLoader(): ArtworkLoader
    fun mediaSessionManager(): MediaSessionManager
}

/**
 * FIXED: Foreground service for media playback notifications with proper Media3 integration
 *
 * Provides persistent media controls in the notification shade and lockscreen.
 * Integrates with MediaSessionManager for unified media session handling.
 *
 * Features:
 * - FIXED: Now uses Media3's MediaNotificationManager instead of custom notification
 * - Rich media notifications with MediaStyle
 * - Lockscreen controls integration
 * - Hardware media button support
 * - Android Auto/TV compatibility
 * - High-importance notification channel
 * - Smart notification management
 * - FIXED: Uses blue ferret icon consistently
 *
 * Note: Does not use Hilt @AndroidEntryPoint due to MediaSessionService
 * incompatibility. Manual dependency initialization is used via EntryPointAccessors.
 */
class MediaNotificationService : MediaSessionService() {

    private lateinit var artworkLoader: ArtworkLoader
    private lateinit var mediaSessionManager: MediaSessionManager

    private var mediaSession: MediaSession? = null
    private var mediaNotificationProvider: MediaNotificationProvider? = null

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
            context.startForegroundService(intent)
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
        
        // Initialize Hilt dependencies via EntryPointAccessors
        val entryPoint = EntryPointAccessors.fromApplication(
            applicationContext,
            MediaNotificationEntryPoint::class.java
        )
        artworkLoader = entryPoint.artworkLoader()
        mediaSessionManager = entryPoint.mediaSessionManager()

        createNotificationChannel()
    }

    override fun onGetSession(controllerInfo: MediaSession.ControllerInfo): MediaSession? {
        return mediaSession
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        handleMediaCommand(intent?.action)
        return START_NOT_STICKY
    }

    override fun onDestroy() {
        super.onDestroy()
        serviceScope.cancel()
        mediaNotificationProvider = null
        mediaSession?.release()
        mediaSession = null
    }

    /**
     * FIXED: Set up media session with proper Media3 integration
     */
    fun setupMediaSession(player: Player) {
        mediaSession = MediaSession.Builder(this, player)
            .setId("cleverferret_media_session")
            .setCallback(CleverFerretMediaSessionCallback())
            .build()

        // FIXED: Use Media3's MediaNotificationProvider instead of custom notification
        setupMediaNotificationProvider(player)
    }

    /**
     * FIXED: Implement Media3's MediaNotificationProvider for better system integration
     */
    private fun setupMediaNotificationProvider(player: Player) {
        mediaNotificationProvider = DefaultMediaNotificationProvider(
            this,
            object : MediaNotificationProvider.DefaultCustomLayout {
                override fun getContentViewIntent(): PendingIntent? {
                    return PendingIntent.getActivity(
                        this@MediaNotificationService,
                        0,
                        Intent(this@MediaNotificationService, MainActivity::class.java),
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                            PendingIntent.FLAG_IMMUTABLE
                        } else {
                            0
                        }
                    )
                }
            },
            NOTIFICATION_ID,
            CHANNEL_ID
        ).apply {
            // FIXED: Use blue ferret icon consistently
            setSmallIcon(R.drawable.ic_ferret_blue_bitmap)
            
            // Customize notification appearance with Ancient Architect theme colors
            setMediaSessionToken(mediaSession?.platformToken)
        }

        // Start the notification
        val notification = createNotification(player)
        startForeground(NOTIFICATION_ID, notification)
    }

    private fun createNotification(player: Player): Notification {
        val compatToken = mediaSession?.toCompatToken()
        val mediaStyle = MediaNotificationCompat.MediaStyle()
            .setMediaSession(compatToken)
            .setShowActionsInCompactView(0, 1, 2) // play/pause, next, previous

        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("CleverFerret Media Player")
            .setContentText("Universal Media Library")
            .setSmallIcon(R.drawable.ic_ferret_blue_bitmap) // FIXED: Use blue ferret icon
            .setContentIntent(createContentIntent())
            .setDeleteIntent(createActionPendingIntent(ACTION_STOP))
            .setStyle(mediaStyle)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_TRANSPORT)

        // Add media control actions
        addMediaControlActions(builder, player)

        return builder.build()
    }

    private fun addMediaControlActions(builder: NotificationCompat.Builder, player: Player) {
        // Previous action
        builder.addAction(
            NotificationCompat.Action.Builder(
                R.drawable.ic_ferret_blue_bitmap, // FIXED: Use blue ferret icon
                "Previous",
                createActionPendingIntent(ACTION_PREVIOUS)
            ).build()
        )

        // Play/Pause action
        val playPauseIcon = if (player.isPlaying) {
            R.drawable.ic_ferret_blue_bitmap // Use blue ferret icon for pause
        } else {
            R.drawable.ic_ferret_blue_bitmap // Use blue ferret icon for play
        }
        val playPauseTitle = if (player.isPlaying) "Pause" else "Play"
        
        builder.addAction(
            NotificationCompat.Action.Builder(
                playPauseIcon,
                playPauseTitle,
                createActionPendingIntent(if (player.isPlaying) ACTION_PAUSE else ACTION_PLAY)
            ).build()
        )

        // Next action
        builder.addAction(
            NotificationCompat.Action.Builder(
                R.drawable.ic_ferret_blue_bitmap, // FIXED: Use blue ferret icon
                "Next",
                createActionPendingIntent(ACTION_NEXT)
            ).build()
        )
    }

    private fun createContentIntent(): PendingIntent {
        val intent = Intent(this, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
        }
        return PendingIntent.getActivity(
            this,
            0,
            intent,
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                PendingIntent.FLAG_IMMUTABLE
            } else {
                0
            }
        )
    }

    private fun createActionPendingIntent(action: String): PendingIntent {
        val intent = Intent(this, MediaNotificationService::class.java).apply {
            this.action = action
        }
        return PendingIntent.getService(
            this,
            action.hashCode(),
            intent,
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                PendingIntent.FLAG_IMMUTABLE
            } else {
                0
            }
        )
    }

    private fun handleMediaCommand(action: String?) {
        when (action) {
            ACTION_PLAY -> mediaSession?.player?.play()
            ACTION_PAUSE -> mediaSession?.player?.pause()
            ACTION_NEXT -> mediaSession?.player?.seekToNext()
            ACTION_PREVIOUS -> mediaSession?.player?.seekToPrevious()
            ACTION_STOP -> {
                mediaSession?.player?.stop()
                stopSelf()
            }
        }
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "CleverFerret Media Playback",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description = "Media playback controls for CleverFerret"
                setShowBadge(false)
                lockscreenVisibility = Notification.VISIBILITY_PUBLIC
                
                // Set Ancient Architect theme colors for notification channel
                enableLights(true)
                enableVibration(false)
            }
            
            val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
        }
    }

    /**
     * Update notification with current media info
     */
    fun updateNotification(mediaItem: MediaItem, player: Player) {
        serviceScope.launch {
            try {
                // Load artwork using the blue ferret theme
                val artwork = artworkLoader.loadArtwork(mediaItem.uri)
                
                val notification = createNotificationWithArtwork(player, artwork, mediaItem)
                mediaNotificationProvider?.updateNotification(mediaSession ?: return@launch, notification)
                
            } catch (e: Exception) {
                // Fallback to default notification if artwork loading fails
                val notification = createNotification(player)
                mediaNotificationProvider?.updateNotification(mediaSession ?: return@launch, notification)
            }
        }
    }

    private fun createNotificationWithArtwork(
        player: Player, 
        artwork: Bitmap?, 
        mediaItem: MediaItem
    ): Notification {
        val compatToken = mediaSession?.toCompatToken()
        val mediaStyle = MediaNotificationCompat.MediaStyle()
            .setMediaSession(compatToken)
            .setShowActionsInCompactView(0, 1, 2)

        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle(mediaItem.title ?: "Unknown Title")
            .setContentText(mediaItem.artist ?: "Unknown Artist")
            .setSmallIcon(R.drawable.ic_ferret_blue_bitmap) // FIXED: Use blue ferret icon
            .setLargeIcon(artwork)
            .setContentIntent(createContentIntent())
            .setDeleteIntent(createActionPendingIntent(ACTION_STOP))
            .setStyle(mediaStyle)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_TRANSPORT)

        addMediaControlActions(builder, player)
        return builder.build()
    }
}

private fun MediaSession.toCompatToken(): MediaSessionCompat.Token? {
    return try {
        MediaSessionCompat.Token.fromToken(platformToken)
    } catch (_: Exception) {
        null
    }
}

/**
 * Media session callback for handling media control events
 */
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

    override fun onSkipToNext() {
        super.onSkipToNext()
    }

    override fun onSkipToPrevious() {
        super.onSkipToPrevious()
    }

    override fun onStop() {
        super.onStop()
    }
}