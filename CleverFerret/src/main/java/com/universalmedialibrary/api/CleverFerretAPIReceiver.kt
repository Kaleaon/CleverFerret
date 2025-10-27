package com.universalmedialibrary.api

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

/**
 * CleverFerret API Receiver - Handles external commands
 * 
 * Inspired by PowerampAPI's broadcast receiver system
 * Enables external apps to control CleverFerret playback
 * 
 * Supported Commands:
 * - Playback control (play, pause, stop, skip)
 * - Volume control
 * - Queue management
 * - Playback modes (shuffle, repeat)
 * 
 * Usage from external app:
 * ```kotlin
 * val intent = Intent("com.universalmedialibrary.API_COMMAND").apply {
 *     putExtra("cmd", 1) // Toggle play/pause
 *     setPackage("com.universalmedialibrary")
 * }
 * context.sendBroadcast(intent)
 * ```
 */
@AndroidEntryPoint
class CleverFerretAPIReceiver : BroadcastReceiver() {
    
    @Inject
    lateinit var musicService: AdvancedMusicPlayerService
    
    companion object {
        private const val TAG = "CleverFerretAPI"
        private const val ENABLE_LOGGING = true
    }
    
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != CleverFerretBroadcasts.ACTION_API_COMMAND) {
            return
        }
        
        val command = intent.getIntExtra(CleverFerretBroadcasts.EXTRA_COMMAND, -1)
        val source = intent.getStringExtra(CleverFerretBroadcasts.EXTRA_SOURCE) ?: "unknown"
        val pkg = intent.getStringExtra(CleverFerretBroadcasts.EXTRA_PACKAGE) ?: "unknown"
        
        if (ENABLE_LOGGING) {
            Log.d(TAG, "Received command: $command from $source ($pkg)")
        }
        
        try {
            when (command) {
                // Basic playback control
                CleverFerretBroadcasts.CMD_TOGGLE_PLAY_PAUSE -> {
                    musicService.togglePlayPause()
                    logCommand("TOGGLE_PLAY_PAUSE")
                }
                
                CleverFerretBroadcasts.CMD_PLAY -> {
                    musicService.play()
                    logCommand("PLAY")
                }
                
                CleverFerretBroadcasts.CMD_PAUSE -> {
                    musicService.pause()
                    logCommand("PAUSE")
                }
                
                CleverFerretBroadcasts.CMD_STOP -> {
                    musicService.stop()
                    logCommand("STOP")
                }
                
                CleverFerretBroadcasts.CMD_NEXT -> {
                    musicService.skipToNext()
                    logCommand("NEXT")
                }
                
                CleverFerretBroadcasts.CMD_PREVIOUS -> {
                    musicService.skipToPrevious()
                    logCommand("PREVIOUS")
                }
                
                // Seek commands
                CleverFerretBroadcasts.CMD_SEEK -> {
                    val position = intent.getLongExtra(CleverFerretBroadcasts.EXTRA_POSITION, 0)
                    musicService.seekTo(position)
                    logCommand("SEEK to $position ms")
                }
                
                CleverFerretBroadcasts.CMD_SEEK_RELATIVE -> {
                    val delta = intent.getLongExtra(CleverFerretBroadcasts.EXTRA_POSITION, 0)
                    musicService.seekRelative(delta)
                    logCommand("SEEK_RELATIVE by $delta ms")
                }
                
                // Playback modes
                CleverFerretBroadcasts.CMD_TOGGLE_SHUFFLE -> {
                    musicService.toggleShuffle()
                    logCommand("TOGGLE_SHUFFLE")
                }
                
                CleverFerretBroadcasts.CMD_TOGGLE_REPEAT -> {
                    musicService.toggleRepeat()
                    logCommand("TOGGLE_REPEAT")
                }
                
                // Volume control
                CleverFerretBroadcasts.CMD_SET_VOLUME -> {
                    val volume = intent.getFloatExtra(CleverFerretBroadcasts.EXTRA_VOLUME, 1.0f)
                    musicService.setVolume(volume)
                    logCommand("SET_VOLUME to $volume")
                }
                
                CleverFerretBroadcasts.CMD_ADJUST_VOLUME -> {
                    val delta = intent.getFloatExtra(CleverFerretBroadcasts.EXTRA_VOLUME, 0.0f)
                    musicService.adjustVolume(delta)
                    logCommand("ADJUST_VOLUME by $delta")
                }
                
                // Playback speed
                CleverFerretBroadcasts.CMD_SET_SPEED -> {
                    val speed = intent.getFloatExtra(CleverFerretBroadcasts.EXTRA_SPEED, 1.0f)
                    musicService.setPlaybackSpeed(speed)
                    logCommand("SET_SPEED to $speed")
                }
                
                // Queue management
                CleverFerretBroadcasts.CMD_CLEAR_QUEUE -> {
                    musicService.clearQueue()
                    logCommand("CLEAR_QUEUE")
                }
                
                CleverFerretBroadcasts.CMD_SHUFFLE_QUEUE -> {
                    musicService.shuffleQueue()
                    logCommand("SHUFFLE_QUEUE")
                }
                
                else -> {
                    Log.w(TAG, "Unknown command: $command")
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error executing command $command", e)
        }
    }
    
    private fun logCommand(command: String) {
        if (ENABLE_LOGGING) {
            Log.d(TAG, "Executed: $command")
        }
    }
}
