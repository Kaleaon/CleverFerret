package com.universalmedialibrary.services.notification

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.os.Build
import android.support.v4.media.session.MediaSessionCompat
import androidx.core.app.NotificationCompat
import androidx.media.session.MediaButtonReceiver
import com.universalmedialibrary.R
import com.universalmedialibrary.MainActivity
import com.universalmedialibrary.data.MediaType
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal Media Notification Manager
 * Handles lock screen and notification drawer controls for all media types
 */
@Singleton
class UniversalMediaNotificationManager @Inject constructor(
    private val context: Context
) {
    companion object {
        const val CHANNEL_ID_MUSIC = "music_playback"
        const val CHANNEL_ID_AUDIOBOOK = "audiobook_playback"
        const val CHANNEL_ID_PODCAST = "podcast_playback"
        const val CHANNEL_ID_RADIO = "radio_playback"
        const val CHANNEL_ID_TTS = "tts_playback"
        const val CHANNEL_ID_VIDEO = "video_playback"
        
        const val NOTIFICATION_ID_MUSIC = 1001
        const val NOTIFICATION_ID_AUDIOBOOK = 1002
        const val NOTIFICATION_ID_PODCAST = 1003
        const val NOTIFICATION_ID_RADIO = 1004
        const val NOTIFICATION_ID_TTS = 1005
        const val NOTIFICATION_ID_VIDEO = 1006
        
        // Actions
        const val ACTION_PLAY = "com.universalmedialibrary.action.PLAY"
        const val ACTION_PAUSE = "com.universalmedialibrary.action.PAUSE"
        const val ACTION_NEXT = "com.universalmedialibrary.action.NEXT"
        const val ACTION_PREV = "com.universalmedialibrary.action.PREV"
        const val ACTION_REWIND = "com.universalmedialibrary.action.REWIND"
        const val ACTION_FORWARD = "com.universalmedialibrary.action.FORWARD"
        const val ACTION_STOP = "com.universalmedialibrary.action.STOP"
        const val ACTION_SPEED = "com.universalmedialibrary.action.SPEED"
    }

    private val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

    init {
        createNotificationChannels()
    }

    private fun createNotificationChannels() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channels = listOf(
                NotificationChannel(
                    CHANNEL_ID_MUSIC,
                    "Music Playback",
                    NotificationManager.IMPORTANCE_LOW
                ).apply {
                    description = "Music player controls"
                    setShowBadge(false)
                    lockscreenVisibility = Notification.VISIBILITY_PUBLIC
                },
                NotificationChannel(
                    CHANNEL_ID_AUDIOBOOK,
                    "Audiobook Playback",
                    NotificationManager.IMPORTANCE_LOW
                ).apply {
                    description = "Audiobook player controls"
                    setShowBadge(false)
                    lockscreenVisibility = Notification.VISIBILITY_PUBLIC
                },
                NotificationChannel(
                    CHANNEL_ID_PODCAST,
                    "Podcast Playback",
                    NotificationManager.IMPORTANCE_LOW
                ).apply {
                    description = "Podcast player controls"
                    setShowBadge(false)
                    lockscreenVisibility = Notification.VISIBILITY_PUBLIC
                },
                NotificationChannel(
                    CHANNEL_ID_RADIO,
                    "Radio Playback",
                    NotificationManager.IMPORTANCE_LOW
                ).apply {
                    description = "Radio player controls"
                    setShowBadge(false)
                    lockscreenVisibility = Notification.VISIBILITY_PUBLIC
                },
                NotificationChannel(
                    CHANNEL_ID_TTS,
                    "Text-to-Speech",
                    NotificationManager.IMPORTANCE_LOW
                ).apply {
                    description = "Text-to-Speech controls"
                    setShowBadge(false)
                    lockscreenVisibility = Notification.VISIBILITY_PUBLIC
                },
                NotificationChannel(
                    CHANNEL_ID_VIDEO,
                    "Video Playback",
                    NotificationManager.IMPORTANCE_LOW
                ).apply {
                    description = "Video player controls"
                    setShowBadge(false)
                    lockscreenVisibility = Notification.VISIBILITY_PUBLIC
                }
            )
            channels.forEach { notificationManager.createNotificationChannel(it) }
        }
    }

    fun buildMusicNotification(
        mediaSession: MediaSessionCompat,
        title: String,
        artist: String,
        album: String? = null,
        albumArt: Bitmap? = null,
        isPlaying: Boolean
    ): Notification {
        return buildMediaNotification(
            channelId = CHANNEL_ID_MUSIC,
            mediaSession = mediaSession,
            title = title,
            subtitle = artist,
            description = album,
            artwork = albumArt,
            isPlaying = isPlaying,
            showNext = true,
            showPrev = true,
            showRewind = false,
            showForward = false,
            contentIntent = createContentIntent(MediaType.MUSIC)
        )
    }

    fun buildAudiobookNotification(
        mediaSession: MediaSessionCompat,
        bookTitle: String,
        author: String,
        chapter: String,
        coverArt: Bitmap? = null,
        isPlaying: Boolean,
        playbackSpeed: Float = 1.0f
    ): Notification {
        return buildMediaNotification(
            channelId = CHANNEL_ID_AUDIOBOOK,
            mediaSession = mediaSession,
            title = bookTitle,
            subtitle = author,
            description = "Chapter: $chapter • ${playbackSpeed}x",
            artwork = coverArt,
            isPlaying = isPlaying,
            showNext = false,
            showPrev = false,
            showRewind = true,
            showForward = true,
            contentIntent = createContentIntent(MediaType.AUDIOBOOK)
        )
    }

    fun buildPodcastNotification(
        mediaSession: MediaSessionCompat,
        podcastTitle: String,
        episodeTitle: String,
        duration: String,
        coverArt: Bitmap? = null,
        isPlaying: Boolean,
        playbackSpeed: Float = 1.0f
    ): Notification {
        return buildMediaNotification(
            channelId = CHANNEL_ID_PODCAST,
            mediaSession = mediaSession,
            title = episodeTitle,
            subtitle = podcastTitle,
            description = "$duration • ${playbackSpeed}x",
            artwork = coverArt,
            isPlaying = isPlaying,
            showNext = false,
            showPrev = false,
            showRewind = true,
            showForward = true,
            contentIntent = createContentIntent(MediaType.PODCAST)
        )
    }

    fun buildRadioNotification(
        mediaSession: MediaSessionCompat,
        stationName: String,
        genre: String,
        nowPlaying: String?,
        stationLogo: Bitmap? = null,
        isPlaying: Boolean
    ): Notification {
        return buildMediaNotification(
            channelId = CHANNEL_ID_RADIO,
            mediaSession = mediaSession,
            title = stationName,
            subtitle = genre,
            description = nowPlaying ?: "Live Streaming",
            artwork = stationLogo,
            isPlaying = isPlaying,
            showNext = true,
            showPrev = true,
            showRewind = false,
            showForward = false,
            contentIntent = createContentIntent(MediaType.RADIO)
        )
    }

    fun buildTTSNotification(
        mediaSession: MediaSessionCompat,
        bookTitle: String,
        sentenceInfo: String,
        isPlaying: Boolean,
        ttsSpeed: Float = 1.0f
    ): Notification {
        return buildMediaNotification(
            channelId = CHANNEL_ID_TTS,
            mediaSession = mediaSession,
            title = bookTitle,
            subtitle = "Text-to-Speech",
            description = "$sentenceInfo • ${ttsSpeed}x",
            artwork = null,
            isPlaying = isPlaying,
            showNext = true,
            showPrev = true,
            showRewind = false,
            showForward = false,
            contentIntent = createContentIntent(MediaType.BOOK)
        )
    }

    fun buildVideoNotification(
        mediaSession: MediaSessionCompat,
        videoTitle: String,
        duration: String,
        thumbnail: Bitmap? = null,
        isPlaying: Boolean
    ): Notification {
        return buildMediaNotification(
            channelId = CHANNEL_ID_VIDEO,
            mediaSession = mediaSession,
            title = videoTitle,
            subtitle = "Video",
            description = duration,
            artwork = thumbnail,
            isPlaying = isPlaying,
            showNext = false,
            showPrev = false,
            showRewind = true,
            showForward = true,
            contentIntent = createContentIntent(MediaType.MOVIE)
        )
    }

    private fun buildMediaNotification(
        channelId: String,
        mediaSession: MediaSessionCompat,
        title: String,
        subtitle: String,
        description: String?,
        artwork: Bitmap?,
        isPlaying: Boolean,
        showNext: Boolean,
        showPrev: Boolean,
        showRewind: Boolean,
        showForward: Boolean,
        contentIntent: PendingIntent
    ): Notification {
        val builder = NotificationCompat.Builder(context, channelId)
            .setContentTitle(title)
            .setContentText(subtitle)
            .setSubText(description)
            .setLargeIcon(artwork)
            .setSmallIcon(R.drawable.ic_media_notification)
            .setContentIntent(contentIntent)
            .setDeleteIntent(MediaButtonReceiver.buildMediaButtonPendingIntent(
                context, 
                android.support.v4.media.session.PlaybackStateCompat.ACTION_STOP
            ))
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setOnlyAlertOnce(true)
            .setShowWhen(false)
            
        // Add media style with session
        val mediaStyle = androidx.media.app.NotificationCompat.MediaStyle()
            .setMediaSession(mediaSession.sessionToken)
            .setShowActionsInCompactView(
                *buildCompactViewActions(showPrev, showRewind)
            )
            .setShowCancelButton(true)
            .setCancelButtonIntent(MediaButtonReceiver.buildMediaButtonPendingIntent(
                context,
                android.support.v4.media.session.PlaybackStateCompat.ACTION_STOP
            ))

        builder.setStyle(mediaStyle)

        // Add action buttons
        if (showPrev) {
            builder.addAction(
                R.drawable.ic_skip_previous,
                "Previous",
                createActionIntent(ACTION_PREV)
            )
        }
        
        if (showRewind) {
            builder.addAction(
                android.R.drawable.ic_media_rew,
                "Rewind",
                createActionIntent(ACTION_REWIND)
            )
        }

        // Play/Pause button (always shown)
        builder.addAction(
            if (isPlaying) R.drawable.ic_pause else R.drawable.ic_play,
            if (isPlaying) "Pause" else "Play",
            if (isPlaying) createActionIntent(ACTION_PAUSE) else createActionIntent(ACTION_PLAY)
        )

        if (showForward) {
            builder.addAction(
                android.R.drawable.ic_media_ff,
                "Forward",
                createActionIntent(ACTION_FORWARD)
            )
        }

        if (showNext) {
            builder.addAction(
                R.drawable.ic_skip_next,
                "Next",
                createActionIntent(ACTION_NEXT)
            )
        }

        // Stop button
        builder.addAction(
            android.R.drawable.ic_menu_close_clear_cancel,
            "Stop",
            createActionIntent(ACTION_STOP)
        )

        return builder.build()
    }

    private fun buildCompactViewActions(showPrev: Boolean, showRewind: Boolean): IntArray {
        return when {
            showPrev -> intArrayOf(0, 1, 2) // Prev, Play/Pause, Next
            showRewind -> intArrayOf(0, 1, 2) // Rewind, Play/Pause, Forward
            else -> intArrayOf(0) // Just Play/Pause
        }
    }

    private fun createContentIntent(mediaType: MediaType): PendingIntent {
        val intent = Intent(context, MainActivity::class.java).apply {
            action = "OPEN_${mediaType.name}_PLAYER"
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        return PendingIntent.getActivity(
            context,
            mediaType.hashCode(), // Unique request code per media type
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }

    private fun createActionIntent(action: String): PendingIntent {
        val intent = Intent(action).apply {
            setPackage(context.packageName)
        }
        return PendingIntent.getBroadcast(
            context,
            action.hashCode(), // Unique request code per action
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }

    fun showNotification(notificationId: Int, notification: Notification) {
        notificationManager.notify(notificationId, notification)
    }

    fun cancelNotification(notificationId: Int) {
        notificationManager.cancel(notificationId)
    }

    fun cancelAllNotifications() {
        notificationManager.cancelAll()
    }
}
