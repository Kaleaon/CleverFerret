package com.universalmedialibrary.services.media

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.os.Binder
import android.os.Build
import android.os.IBinder
import android.support.v4.media.MediaMetadataCompat
import android.support.v4.media.session.MediaSessionCompat
import android.support.v4.media.session.PlaybackStateCompat
import androidx.core.app.NotificationCompat
import androidx.media.session.MediaButtonReceiver
import com.universalmedialibrary.MainActivity
import com.universalmedialibrary.R
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.audiobook.AudiobookService
import com.universalmedialibrary.services.tts.AndroidTextToSpeechService
import com.universalmedialibrary.services.media.UniversalMediaPlayerService
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.collectLatest
import javax.inject.Inject

/**
 * MediaSessionService provides unified media playback control across all media services
 * 
 * Features:
 * - MediaStyle notifications with lockscreen controls
 * - Hardware media button support
 * - Integration with existing ExoPlayerService and AdvancedMusicPlayerService
 * - Foreground service lifecycle management
 * - Android Auto/TV compatibility through MediaSession
 * - Support for music, audiobooks, TTS, and universal media playback
 */
@AndroidEntryPoint
class MediaSessionService : Service() {

    @Inject
    lateinit var exoPlayerService: ExoPlayerService
    
    @Inject 
    lateinit var musicPlayerService: AdvancedMusicPlayerService
    
    @Inject
    lateinit var audiobookService: AudiobookService
    
    @Inject
    lateinit var ttsService: AndroidTextToSpeechService
    
    @Inject
    lateinit var universalMediaPlayerService: UniversalMediaPlayerService

    private var mediaSession: MediaSessionCompat? = null
    private var notificationManager: NotificationManager? = null
    
    private val serviceScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    private var notificationJob: Job? = null
    
    private val binder = MediaSessionBinder()
    
    // Track which service is currently active
    private var activeMediaService: MediaServiceType = MediaServiceType.NONE
    
    // Current playback state
    private var currentTrackTitle: String = "Unknown Track"
    private var currentArtist: String = "Unknown Artist" 
    private var currentAlbum: String = "Unknown Album"
    private var currentArtwork: Bitmap? = null
    private var isPlaying: Boolean = false
    private var currentPosition: Long = 0L
    private var duration: Long = 0L

    companion object {
        private const val MEDIA_SESSION_TAG = "CleverFerretMediaSession"
        private const val NOTIFICATION_ID = 100
        private const val CHANNEL_ID = "media_playback_channel"
        private const val CHANNEL_NAME = "Media Playback"
        
        // Actions for MediaStyle notification
        const val ACTION_PLAY_PAUSE = "com.universalmedialibrary.ACTION_PLAY_PAUSE"
        const val ACTION_NEXT = "com.universalmedialibrary.ACTION_NEXT"
        const val ACTION_PREVIOUS = "com.universalmedialibrary.ACTION_PREVIOUS"
        const val ACTION_STOP = "com.universalmedialibrary.ACTION_STOP"
    }
    
    inner class MediaSessionBinder : Binder() {
        fun getService(): MediaSessionService = this@MediaSessionService
    }

    override fun onCreate() {
        super.onCreate()
        
        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        createNotificationChannel()
        initializeMediaSession()
        observePlaybackState()
    }

    override fun onBind(intent: Intent?): IBinder = binder

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        // Handle media button intents
        MediaButtonReceiver.handleIntent(mediaSession, intent)
        
        when (intent?.action) {
            ACTION_PLAY_PAUSE -> handlePlayPause()
            ACTION_NEXT -> handleNext()
            ACTION_PREVIOUS -> handlePrevious()
            ACTION_STOP -> handleStop()
        }
        
        return START_STICKY
    }

    private fun initializeMediaSession() {
        mediaSession = MediaSessionCompat(this, MEDIA_SESSION_TAG).apply {
            setFlags(
                MediaSessionCompat.FLAG_HANDLES_MEDIA_BUTTONS or
                MediaSessionCompat.FLAG_HANDLES_TRANSPORT_CONTROLS
            )
            
            setCallback(object : MediaSessionCompat.Callback() {
                override fun onPlay() {
                    handlePlayPause()
                }
                
                override fun onPause() {
                    handlePlayPause()
                }
                
                override fun onSkipToNext() {
                    handleNext()
                }
                
                override fun onSkipToPrevious() {
                    handlePrevious()
                }
                
                override fun onStop() {
                    handleStop()
                }
                
                override fun onSeekTo(pos: Long) {
                    seekTo(pos)
                }
            })
            
            isActive = true
        }
    }

    private fun observePlaybackState() {
        // Observe ExoPlayer state
        notificationJob = serviceScope.launch {
            launch {
                exoPlayerService.playerState.collectLatest { state ->
                    isPlaying = state.isPlaying
                    currentPosition = state.currentPosition
                    duration = state.duration
                    updateMediaSession()
                    updateNotification()
                }
            }
            
            // Observe music player current track
            launch {
                musicPlayerService.currentTrack.collectLatest { track ->
                    track?.let {
                        currentTrackTitle = it.title
                        currentArtist = it.artist ?: "Unknown Artist"
                        currentAlbum = it.album ?: "Unknown Album"
                        currentArtwork = null // TODO: Load artwork from albumArtUrl if available
                        updateMediaSession()
                        updateNotification()
                    }
                }
            }
        }
    }

    private fun updateMediaSession() {
        val playbackState = PlaybackStateCompat.Builder()
            .setActions(
                PlaybackStateCompat.ACTION_PLAY_PAUSE or
                PlaybackStateCompat.ACTION_SKIP_TO_NEXT or
                PlaybackStateCompat.ACTION_SKIP_TO_PREVIOUS or
                PlaybackStateCompat.ACTION_STOP or
                PlaybackStateCompat.ACTION_SEEK_TO
            )
            .setState(
                if (isPlaying) PlaybackStateCompat.STATE_PLAYING else PlaybackStateCompat.STATE_PAUSED,
                currentPosition,
                1.0f
            )
            .build()

        val metadata = MediaMetadataCompat.Builder()
            .putString(MediaMetadataCompat.METADATA_KEY_TITLE, currentTrackTitle)
            .putString(MediaMetadataCompat.METADATA_KEY_ARTIST, currentArtist)
            .putString(MediaMetadataCompat.METADATA_KEY_ALBUM, currentAlbum)
            .putLong(MediaMetadataCompat.METADATA_KEY_DURATION, duration)
            .apply {
                currentArtwork?.let { artwork ->
                    putBitmap(MediaMetadataCompat.METADATA_KEY_ALBUM_ART, artwork)
                }
            }
            .build()

        mediaSession?.apply {
            setPlaybackState(playbackState)
            setMetadata(metadata)
        }
    }

    private fun updateNotification() {
        if (currentTrackTitle != "Unknown Track") {
            val notification = createMediaNotification()
            startForeground(NOTIFICATION_ID, notification)
        }
    }

    private fun createMediaNotification(): Notification {
        val playPauseIcon = if (isPlaying) R.drawable.ic_pause else R.drawable.ic_play
        val playPauseText = if (isPlaying) "Pause" else "Play"
        
        // Create pending intents for media actions
        val playPauseIntent = createActionIntent(ACTION_PLAY_PAUSE)
        val nextIntent = createActionIntent(ACTION_NEXT)
        val previousIntent = createActionIntent(ACTION_PREVIOUS)
        val stopIntent = createActionIntent(ACTION_STOP)
        
        // Create intent to open app when notification is tapped
        val openAppIntent = PendingIntent.getActivity(
            this,
            0,
            Intent(this, MainActivity::class.java),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle(currentTrackTitle)
            .setContentText(currentArtist)
            .setSubText(currentAlbum)
            .setSmallIcon(R.drawable.ic_music_note)
            .setLargeIcon(currentArtwork)
            .setContentIntent(openAppIntent)
            .setDeleteIntent(stopIntent)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setOnlyAlertOnce(true)
            .addAction(R.drawable.ic_skip_previous, "Previous", previousIntent)
            .addAction(playPauseIcon, playPauseText, playPauseIntent)
            .addAction(R.drawable.ic_skip_next, "Next", nextIntent)
            .setStyle(
                androidx.media.app.NotificationCompat.MediaStyle()
                    .setMediaSession(mediaSession?.sessionToken)
                    .setShowActionsInCompactView(0, 1, 2) // Show all three actions
                    .setCancelButtonIntent(stopIntent)
                    .setShowCancelButton(true)
            )
            .build()
    }

    private fun createActionIntent(action: String): PendingIntent {
        val intent = Intent(this, MediaSessionService::class.java).apply {
            this.action = action
        }
        return PendingIntent.getService(
            this,
            action.hashCode(),
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }

    private fun handlePlayPause() {
        when (activeMediaService) {
            MediaServiceType.MUSIC -> musicPlayerService.togglePlayPause()
            MediaServiceType.AUDIOBOOK -> {
                // Add audiobook play/pause logic when available
                // For now, fallback to universal media player
                universalMediaPlayerService.togglePlayPause()
            }
            MediaServiceType.TTS -> {
                if (isPlaying) {
                    ttsService.pause()
                } else {
                    ttsService.resume()
                }
            }
            MediaServiceType.UNIVERSAL -> universalMediaPlayerService.togglePlayPause()
            MediaServiceType.NONE -> {
                // Try to determine active service and delegate
                musicPlayerService.togglePlayPause()
            }
        }
    }

    private fun handleNext() {
        when (activeMediaService) {
            MediaServiceType.MUSIC -> musicPlayerService.skipToNext()
            MediaServiceType.AUDIOBOOK -> {
                // Add audiobook next chapter logic when available
            }
            MediaServiceType.TTS -> {
                // TTS doesn't typically have next/previous
            }
            MediaServiceType.UNIVERSAL -> {
                // Universal player doesn't have next/previous by default
            }
            MediaServiceType.NONE -> musicPlayerService.skipToNext()
        }
    }

    private fun handlePrevious() {
        when (activeMediaService) {
            MediaServiceType.MUSIC -> musicPlayerService.skipToPrevious()
            MediaServiceType.AUDIOBOOK -> {
                // Add audiobook previous chapter logic when available
            }
            MediaServiceType.TTS -> {
                // TTS doesn't typically have next/previous
            }
            MediaServiceType.UNIVERSAL -> {
                // Universal player doesn't have next/previous by default
            }
            MediaServiceType.NONE -> musicPlayerService.skipToPrevious()
        }
    }

    private fun handleStop() {
        when (activeMediaService) {
            MediaServiceType.MUSIC -> musicPlayerService.stop()
            MediaServiceType.AUDIOBOOK -> {
                // Add audiobook stop logic when available
                universalMediaPlayerService.stop()
            }
            MediaServiceType.TTS -> ttsService.stop()
            MediaServiceType.UNIVERSAL -> universalMediaPlayerService.stop()
            MediaServiceType.NONE -> {
                musicPlayerService.stop()
                universalMediaPlayerService.stop()
                ttsService.stop()
            }
        }
        stopForeground(true)
        stopSelf()
    }

    private fun seekTo(position: Long) {
        when (activeMediaService) {
            MediaServiceType.MUSIC -> musicPlayerService.seekTo(position)
            MediaServiceType.AUDIOBOOK -> {
                // Add audiobook seek logic when available
                universalMediaPlayerService.seekTo(position)
            }
            MediaServiceType.TTS -> {
                // TTS doesn't typically support seeking
            }
            MediaServiceType.UNIVERSAL -> universalMediaPlayerService.seekTo(position)
            MediaServiceType.NONE -> musicPlayerService.seekTo(position)
        }
    }
    
    /**
     * Set the active media service type for proper callback routing
     */
    fun setActiveMediaService(serviceType: MediaServiceType) {
        activeMediaService = serviceType
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                CHANNEL_NAME,
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description = "Media playback controls and now playing information"
                enableLights(false)
                enableVibration(false)
                setSound(null, null)
                setShowBadge(false)
            }
            
            notificationManager?.createNotificationChannel(channel)
        }
    }

    override fun onDestroy() {
        notificationJob?.cancel()
        serviceScope.cancel()
        mediaSession?.release()
        mediaSession = null
        super.onDestroy()
    }
}

/**
 * Enum to identify which media service is currently active
 */
enum class MediaServiceType {
    NONE,
    MUSIC,
    AUDIOBOOK, 
    TTS,
    UNIVERSAL
}