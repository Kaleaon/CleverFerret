package com.universalmedialibrary.api

import android.content.Context
import android.content.Intent
import android.util.Log
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.services.music.PlaylistMode
import com.universalmedialibrary.services.music.TrackInfo
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Broadcast Manager - Sends status updates to external apps
 * 
 * Inspired by PowerampAPI's broadcast system
 * Enables widgets, automation apps, and external monitoring
 * 
 * Thread-safe and efficient - designed for frequent updates
 */
@Singleton
class BroadcastManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private const val TAG = "BroadcastManager"
    }
    
    /**
     * Send playback status changed broadcast
     * 
     * Called when play/pause/stop state changes
     */
    fun sendStatusChanged(
        isPlaying: Boolean,
        isPaused: Boolean,
        shuffle: PlaylistMode,
        repeat: PlaylistMode,
        volume: Float,
        position: Long = 0L,
        duration: Long = 0L
    ) {
        val state = when {
            isPlaying -> CleverFerretBroadcasts.STATE_PLAYING
            isPaused -> CleverFerretBroadcasts.STATE_PAUSED
            else -> CleverFerretBroadcasts.STATE_STOPPED
        }
        
        val intent = Intent(CleverFerretBroadcasts.ACTION_STATUS_CHANGED).apply {
            putExtra(CleverFerretBroadcasts.EXTRA_STATE, state)
            putExtra(CleverFerretBroadcasts.EXTRA_SHUFFLE, convertShuffleMode(shuffle))
            putExtra(CleverFerretBroadcasts.EXTRA_REPEAT, convertRepeatMode(repeat))
            putExtra(CleverFerretBroadcasts.EXTRA_VOLUME, volume)
            putExtra(CleverFerretBroadcasts.EXTRA_POSITION, position)
            putExtra(CleverFerretBroadcasts.EXTRA_DURATION, duration)
            
            // For now, keep broadcasts within app (can be changed for external widgets later)
            setPackage(context.packageName)
        }
        
        try {
            context.sendBroadcast(intent)
            if (BuildConfig.DEBUG) {
                Log.d(TAG, "Status changed: state=$state, shuffle=${convertShuffleMode(shuffle)}, " +
                        "repeat=${convertRepeatMode(repeat)}, volume=$volume")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error sending status broadcast", e)
        }
    }
    
    /**
     * Send track changed broadcast
     * 
     * Called when current track changes
     */
    fun sendTrackChanged(track: TrackInfo?, position: Long = 0L) {
        val intent = Intent(CleverFerretBroadcasts.ACTION_TRACK_CHANGED).apply {
            if (track != null) {
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_ID, track.id)
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_TITLE, track.title)
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_ARTIST, track.artist)
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_ALBUM, track.album)
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_DURATION, track.duration)
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_POSITION, position)
                
                // Album art URI if available
                track.albumArtUrl?.let { uri ->
                    putExtra(CleverFerretBroadcasts.EXTRA_ALBUM_ART_URI, uri)
                }
            }
            setPackage(context.packageName)
        }
        
        try {
            context.sendBroadcast(intent)
            if (BuildConfig.DEBUG) {
                Log.d(TAG, "Track changed: ${track?.title ?: "null"} by ${track?.artist ?: "null"}")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error sending track changed broadcast", e)
        }
    }
    
    /**
     * Send playing mode changed broadcast
     * 
     * Called when shuffle/repeat mode changes
     */
    fun sendPlayingModeChanged(shuffle: PlaylistMode, repeat: PlaylistMode) {
        val intent = Intent(CleverFerretBroadcasts.ACTION_PLAYING_MODE_CHANGED).apply {
            putExtra(CleverFerretBroadcasts.EXTRA_SHUFFLE, convertShuffleMode(shuffle))
            putExtra(CleverFerretBroadcasts.EXTRA_REPEAT, convertRepeatMode(repeat))
            setPackage(context.packageName)
        }
        
        try {
            context.sendBroadcast(intent)
            if (BuildConfig.DEBUG) {
                Log.d(TAG, "Playing mode changed: shuffle=${convertShuffleMode(shuffle)}, " +
                        "repeat=${convertRepeatMode(repeat)}")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error sending playing mode broadcast", e)
        }
    }
    
    /**
     * Send queue changed broadcast
     * 
     * Called when queue is modified
     */
    fun sendQueueChanged(queueSize: Int, currentPosition: Int) {
        val intent = Intent(CleverFerretBroadcasts.ACTION_QUEUE_CHANGED).apply {
            putExtra(CleverFerretBroadcasts.EXTRA_QUEUE_SIZE, queueSize)
            putExtra(CleverFerretBroadcasts.EXTRA_QUEUE_POSITION, currentPosition)
            setPackage(context.packageName)
        }
        
        try {
            context.sendBroadcast(intent)
            if (BuildConfig.DEBUG) {
                Log.d(TAG, "Queue changed: size=$queueSize, position=$currentPosition")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error sending queue changed broadcast", e)
        }
    }
    
    /**
     * Convert PlaylistMode to broadcast shuffle value
     */
    private fun convertShuffleMode(mode: PlaylistMode): Int {
        return if (mode == PlaylistMode.SHUFFLE) {
            CleverFerretBroadcasts.SHUFFLE_ON
        } else {
            CleverFerretBroadcasts.SHUFFLE_OFF
        }
    }
    
    /**
     * Convert PlaylistMode to broadcast repeat value
     */
    private fun convertRepeatMode(mode: PlaylistMode): Int {
        return when (mode) {
            PlaylistMode.REPEAT_ALL -> CleverFerretBroadcasts.REPEAT_ALL
            PlaylistMode.REPEAT_ONE -> CleverFerretBroadcasts.REPEAT_ONE
            else -> CleverFerretBroadcasts.REPEAT_OFF
        }
    }
}
sts.REPEAT_OFF
        }
    }
}
