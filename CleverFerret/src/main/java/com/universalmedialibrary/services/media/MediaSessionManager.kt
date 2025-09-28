package com.universalmedialibrary.services.media

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.IBinder
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * MediaSessionManager coordinates all media playback services with MediaSession notifications
 * 
 * Provides a single entry point for:
 * - Starting/stopping media session service
 * - Coordinating between music, audiobook, TTS, and universal media services
 * - Managing foreground service lifecycle
 */
@Singleton
class MediaSessionManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private var mediaSessionService: MediaSessionService? = null
    private var isBound = false
    
    private val _isMediaSessionActive = MutableStateFlow(false)
    val isMediaSessionActive: StateFlow<Boolean> = _isMediaSessionActive.asStateFlow()
    
    private val serviceConnection = object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName?, service: IBinder?) {
            val binder = service as MediaSessionService.MediaSessionBinder
            mediaSessionService = binder.getService()
            isBound = true
            _isMediaSessionActive.value = true
        }
        
        override fun onServiceDisconnected(name: ComponentName?) {
            mediaSessionService = null
            isBound = false
            _isMediaSessionActive.value = false
        }
    }
    
    /**
     * Start the MediaSession service for playback controls
     * Call this when any media playback begins
     */
    fun startMediaSession() {
        if (!isBound) {
            val intent = Intent(context, MediaSessionService::class.java)
            
            // Start the service as foreground service
            context.startForegroundService(intent)
            
            // Bind to the service for direct communication
            context.bindService(intent, serviceConnection, Context.BIND_AUTO_CREATE)
        }
    }
    
    /**
     * Stop the MediaSession service
     * Call this when all media playback stops
     */
    fun stopMediaSession() {
        if (isBound) {
            context.unbindService(serviceConnection)
            isBound = false
            _isMediaSessionActive.value = false
        }
        
        // Stop the foreground service
        val intent = Intent(context, MediaSessionService::class.java)
        context.stopService(intent)
    }
    
    /**
     * Check if media session is currently active
     */
    fun isActive(): Boolean = isBound && mediaSessionService != null
    
    /**
     * Get the bound MediaSessionService for direct access if needed
     */
    fun getService(): MediaSessionService? = mediaSessionService
}