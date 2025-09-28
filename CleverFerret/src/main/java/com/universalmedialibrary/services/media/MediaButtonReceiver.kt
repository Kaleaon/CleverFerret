package com.universalmedialibrary.services.media

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.view.KeyEvent
import androidx.media3.session.MediaSessionService
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

/**
 * BroadcastReceiver for handling hardware media button events
 * 
 * Handles media buttons from:
 * - Bluetooth headsets and speakers
 * - Wired headphones with inline controls
 * - Android Auto steering wheel controls
 * - Physical volume/media keys on devices
 * - External keyboards and remote controls
 * 
 * Routes all media button events through the MediaSessionManager
 * to ensure consistent behavior across all media services.
 */
@AndroidEntryPoint
class MediaButtonReceiver : BroadcastReceiver() {
    
    @Inject
    lateinit var mediaSessionManager: MediaSessionManager
    
    companion object {
        // Intent action for media button events
        const val ACTION_MEDIA_BUTTON = "android.intent.action.MEDIA_BUTTON"
    }
    
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != Intent.ACTION_MEDIA_BUTTON) {
            return
        }
        
        val keyEvent = intent.getParcelableExtra<KeyEvent>(Intent.EXTRA_KEY_EVENT)
        if (keyEvent?.action != KeyEvent.ACTION_DOWN) {
            return
        }
        
        // Only handle if we have an active media session
        if (!mediaSessionManager.isSessionActive()) {
            return
        }
        
        val mediaSession = mediaSessionManager.getMediaSession() ?: return
        val player = mediaSession.player
        
        when (keyEvent.keyCode) {
            KeyEvent.KEYCODE_MEDIA_PLAY -> {
                player.play()
            }
            KeyEvent.KEYCODE_MEDIA_PAUSE -> {
                player.pause()
            }
            KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE -> {
                if (player.isPlaying) {
                    player.pause()
                } else {
                    player.play()
                }
            }
            KeyEvent.KEYCODE_MEDIA_STOP -> {
                player.stop()
                // Stop the notification service
                MediaNotificationService.stop(context)
            }
            KeyEvent.KEYCODE_MEDIA_NEXT -> {
                player.seekToNext()
            }
            KeyEvent.KEYCODE_MEDIA_PREVIOUS -> {
                player.seekToPrevious()
            }
            KeyEvent.KEYCODE_MEDIA_FAST_FORWARD -> {
                // Seek forward 30 seconds
                val currentPosition = player.currentPosition
                val duration = player.duration
                val newPosition = (currentPosition + 30000).coerceAtMost(duration)
                player.seekTo(newPosition)
            }
            KeyEvent.KEYCODE_MEDIA_REWIND -> {
                // Seek backward 30 seconds
                val currentPosition = player.currentPosition
                val newPosition = (currentPosition - 30000).coerceAtLeast(0)
                player.seekTo(newPosition)
            }
            else -> {
                // Handle volume keys if configured for media control
                when (keyEvent.keyCode) {
                    KeyEvent.KEYCODE_VOLUME_UP -> {
                        // Could implement volume control here
                        // For now, let system handle it
                    }
                    KeyEvent.KEYCODE_VOLUME_DOWN -> {
                        // Could implement volume control here
                        // For now, let system handle it
                    }
                }
            }
        }
    }
}