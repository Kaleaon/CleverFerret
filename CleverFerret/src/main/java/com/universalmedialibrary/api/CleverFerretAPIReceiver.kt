package com.universalmedialibrary.api

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import com.universalmedialibrary.BuildConfig
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

/**
 * CleverFerret API Receiver - Handles external commands
 * 
 * Inspired by PowerampAPI's broadcast receiver system
 * Enables internal control of CleverFerret playback through broadcasts
 * 
 * Supported Commands:
 * - Playback control (play, pause, stop, skip)
 * - Volume control
 * - Queue management
 * - Playback modes (shuffle, repeat)
 * 
 * Usage (internal only):
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
    lateinit var mediaCommandAPI: MediaCommandAPI
    
    companion object {
        private const val TAG = "CleverFerretAPI"
    }
    
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != CleverFerretBroadcasts.ACTION_API_COMMAND) {
            return
        }
        
        // Use goAsync() to prevent ANR for potentially long-running operations
        val pendingResult = goAsync()
        val command = intent.getIntExtra(CleverFerretBroadcasts.EXTRA_COMMAND, -1)
        
        if (BuildConfig.DEBUG) {
            val source = intent.getStringExtra(CleverFerretBroadcasts.EXTRA_SOURCE) ?: "unknown"
            val pkg = intent.getStringExtra(CleverFerretBroadcasts.EXTRA_PACKAGE) ?: "unknown"
            Log.d(TAG, "Received command: $command from $source ($pkg)")
        }
        
        try {
            when (command) {
                // Basic playback control
                CleverFerretBroadcasts.CMD_TOGGLE_PLAY_PAUSE -> {
                    mediaCommandAPI.togglePlayPause()
                    logCommand("TOGGLE_PLAY_PAUSE")
                }
                
                CleverFerretBroadcasts.CMD_PLAY -> {
                    mediaCommandAPI.play()
                    logCommand("PLAY")
                }
                
                CleverFerretBroadcasts.CMD_PAUSE -> {
                    mediaCommandAPI.pause()
                    logCommand("PAUSE")
                }
                
                CleverFerretBroadcasts.CMD_STOP -> {
                    mediaCommandAPI.stop()
                    logCommand("STOP")
                }
                
                CleverFerretBroadcasts.CMD_NEXT -> {
                    mediaCommandAPI.skipNext()
                    logCommand("NEXT")
                }
                
                CleverFerretBroadcasts.CMD_PREVIOUS -> {
                    mediaCommandAPI.skipPrevious()
                    logCommand("PREVIOUS")
                }
                
                // Seek commands
                CleverFerretBroadcasts.CMD_SEEK -> {
                    val position = intent.getLongExtra(CleverFerretBroadcasts.EXTRA_POSITION, 0)
                    mediaCommandAPI.seekTo(position)
                    logCommand("SEEK to $position ms")
                }
                
                CleverFerretBroadcasts.CMD_SEEK_RELATIVE -> {
                    val delta = intent.getLongExtra(CleverFerretBroadcasts.EXTRA_POSITION, 0)
                    mediaCommandAPI.seekRelative(delta)
                    logCommand("SEEK_RELATIVE by $delta ms")
                }
                
                // Playback modes
                CleverFerretBroadcasts.CMD_TOGGLE_SHUFFLE -> {
                    mediaCommandAPI.toggleShuffle()
                    logCommand("TOGGLE_SHUFFLE")
                }
                
                CleverFerretBroadcasts.CMD_TOGGLE_REPEAT -> {
                    mediaCommandAPI.toggleRepeat()
                    logCommand("TOGGLE_REPEAT")
                }
                
                // Volume control
                CleverFerretBroadcasts.CMD_SET_VOLUME -> {
                    val volume = intent.getFloatExtra(CleverFerretBroadcasts.EXTRA_VOLUME, 1.0f)
                    mediaCommandAPI.setVolume(volume)
                    logCommand("SET_VOLUME to $volume")
                }
                
                CleverFerretBroadcasts.CMD_ADJUST_VOLUME -> {
                    val delta = intent.getFloatExtra(CleverFerretBroadcasts.EXTRA_VOLUME, 0.0f)
                    mediaCommandAPI.adjustVolume(delta)
                    logCommand("ADJUST_VOLUME by $delta")
                }
                
                // Playback speed
                CleverFerretBroadcasts.CMD_SET_SPEED -> {
                    val speed = intent.getFloatExtra(CleverFerretBroadcasts.EXTRA_SPEED, 1.0f)
                    mediaCommandAPI.setPlaybackSpeed(speed)
                    logCommand("SET_SPEED to $speed")
                }
                
                // Queue management
                CleverFerretBroadcasts.CMD_CLEAR_QUEUE -> {
                    mediaCommandAPI.clearQueue()
                    logCommand("CLEAR_QUEUE")
                }
                
                CleverFerretBroadcasts.CMD_SHUFFLE_QUEUE -> {
                    mediaCommandAPI.shuffleQueue()
                    logCommand("SHUFFLE_QUEUE")
                }
                
                else -> {
                    if (BuildConfig.DEBUG) {
                        Log.w(TAG, "Unknown command: $command")
                    }
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error executing command $command", e)
        } finally {
            // Finish the async operation
            pendingResult.finish()
        }
    }
    
    private fun logCommand(command: String) {
        if (BuildConfig.DEBUG) {
            Log.d(TAG, "Executed: $command")
        }
    }
}
