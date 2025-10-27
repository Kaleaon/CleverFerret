package com.universalmedialibrary.api

/**
 * CleverFerret Broadcast API - Intent-based control and status system
 * 
 * Inspired by PowerampAPI's broadcast system for external app integration
 * 
 * Enables:
 * - Home screen widgets
 * - Tasker/automation app integration
 * - Smartwatch control
 * - External app monitoring
 * 
 * Usage Examples:
 * 
 * 1. Send command from external app:
 * ```kotlin
 * val intent = Intent(CleverFerretBroadcasts.ACTION_API_COMMAND).apply {
 *     putExtra(CleverFerretBroadcasts.EXTRA_COMMAND, CleverFerretBroadcasts.CMD_TOGGLE_PLAY_PAUSE)
 *     setPackage("com.universalmedialibrary")
 * }
 * context.sendBroadcast(intent)
 * ```
 * 
 * 2. Receive status updates:
 * ```kotlin
 * class MyReceiver : BroadcastReceiver() {
 *     override fun onReceive(context: Context, intent: Intent) {
 *         when (intent.action) {
 *             CleverFerretBroadcasts.ACTION_TRACK_CHANGED -> {
 *                 val title = intent.getStringExtra(CleverFerretBroadcasts.EXTRA_TRACK_TITLE)
 *                 val artist = intent.getStringExtra(CleverFerretBroadcasts.EXTRA_TRACK_ARTIST)
 *                 // Update widget UI
 *             }
 *         }
 *     }
 * }
 * ```
 */
object CleverFerretBroadcasts {
    
    // ===== ACTIONS (Outgoing - CleverFerret sends these) =====
    
    /**
     * Broadcast when playback state changes (play/pause/stop)
     * 
     * Extras:
     * - EXTRA_STATE: Current playback state (0=stopped, 1=playing, 2=paused)
     * - EXTRA_SHUFFLE: Shuffle mode (0=off, 1=on)
     * - EXTRA_REPEAT: Repeat mode (0=off, 1=all, 2=one)
     * - EXTRA_VOLUME: Current volume (0.0-1.0)
     * - EXTRA_POSITION: Current position in milliseconds
     * - EXTRA_DURATION: Track duration in milliseconds
     */
    const val ACTION_STATUS_CHANGED = "com.universalmedialibrary.STATUS_CHANGED"
    
    /**
     * Broadcast when track changes
     * 
     * Extras:
     * - EXTRA_TRACK_ID: Track ID
     * - EXTRA_TRACK_TITLE: Track title
     * - EXTRA_TRACK_ARTIST: Track artist
     * - EXTRA_TRACK_ALBUM: Track album
     * - EXTRA_TRACK_DURATION: Track duration in milliseconds
     * - EXTRA_TRACK_POSITION: Current position in milliseconds
     * - EXTRA_ALBUM_ART_URI: Album art URI (if available)
     */
    const val ACTION_TRACK_CHANGED = "com.universalmedialibrary.TRACK_CHANGED"
    
    /**
     * Broadcast when playing mode changes (shuffle/repeat)
     * 
     * Extras:
     * - EXTRA_SHUFFLE: Shuffle mode
     * - EXTRA_REPEAT: Repeat mode
     */
    const val ACTION_PLAYING_MODE_CHANGED = "com.universalmedialibrary.PLAYING_MODE_CHANGED"
    
    /**
     * Broadcast when queue changes
     * 
     * Extras:
     * - EXTRA_QUEUE_SIZE: Number of tracks in queue
     * - EXTRA_QUEUE_POSITION: Current track position in queue
     */
    const val ACTION_QUEUE_CHANGED = "com.universalmedialibrary.QUEUE_CHANGED"
    
    // ===== ACTIONS (Incoming - External apps send these) =====
    
    /**
     * Control action - Send commands to CleverFerret
     * 
     * Required Extra:
     * - EXTRA_COMMAND: Command to execute (see CMD_* constants)
     * 
     * Optional Extras (command-specific):
     * - EXTRA_POSITION: For CMD_SEEK
     * - EXTRA_VOLUME: For CMD_SET_VOLUME
     * - EXTRA_SPEED: For CMD_SET_SPEED
     */
    const val ACTION_API_COMMAND = "com.universalmedialibrary.API_COMMAND"
    
    // ===== TRACK INFO EXTRAS =====
    
    /** Track ID (String) */
    const val EXTRA_TRACK_ID = "id"
    
    /** Track title (String) */
    const val EXTRA_TRACK_TITLE = "title"
    
    /** Track artist (String) */
    const val EXTRA_TRACK_ARTIST = "artist"
    
    /** Track album (String) */
    const val EXTRA_TRACK_ALBUM = "album"
    
    /** Track duration in milliseconds (Long) */
    const val EXTRA_TRACK_DURATION = "duration"
    
    /** Current playback position in milliseconds (Long) */
    const val EXTRA_TRACK_POSITION = "position"
    
    /** Album art URI (String) */
    const val EXTRA_ALBUM_ART_URI = "albumArtUri"
    
    // ===== STATE EXTRAS =====
    
    /**
     * Playback state (Int)
     * 0 = Stopped
     * 1 = Playing
     * 2 = Paused
     */
    const val EXTRA_STATE = "state"
    const val STATE_STOPPED = 0
    const val STATE_PLAYING = 1
    const val STATE_PAUSED = 2
    
    /**
     * Shuffle mode (Int)
     * 0 = Off
     * 1 = On (all tracks)
     */
    const val EXTRA_SHUFFLE = "shuffle"
    const val SHUFFLE_OFF = 0
    const val SHUFFLE_ON = 1
    
    /**
     * Repeat mode (Int)
     * 0 = Off
     * 1 = Repeat all
     * 2 = Repeat one
     */
    const val EXTRA_REPEAT = "repeat"
    const val REPEAT_OFF = 0
    const val REPEAT_ALL = 1
    const val REPEAT_ONE = 2
    
    /** Volume level (Float, 0.0 to 1.0) */
    const val EXTRA_VOLUME = "volume"
    
    /** Track duration in milliseconds (Long) */
    const val EXTRA_DURATION = "duration"
    
    /** Current position in milliseconds (Long) */
    const val EXTRA_POSITION = "position"
    
    // ===== QUEUE EXTRAS =====
    
    /** Queue size (Int) */
    const val EXTRA_QUEUE_SIZE = "queueSize"
    
    /** Current position in queue (Int) */
    const val EXTRA_QUEUE_POSITION = "queuePosition"
    
    // ===== COMMAND EXTRAS =====
    
    /** Command to execute (Int, see CMD_* constants) */
    const val EXTRA_COMMAND = "cmd"
    
    /** Playback speed (Float, typically 0.5 to 2.0) */
    const val EXTRA_SPEED = "speed"
    
    // ===== COMMANDS =====
    
    /** Toggle between play and pause */
    const val CMD_TOGGLE_PLAY_PAUSE = 1
    
    /** Start playback */
    const val CMD_PLAY = 2
    
    /** Pause playback */
    const val CMD_PAUSE = 3
    
    /** Skip to next track */
    const val CMD_NEXT = 4
    
    /** Skip to previous track */
    const val CMD_PREVIOUS = 5
    
    /** Stop playback */
    const val CMD_STOP = 6
    
    /** 
     * Seek to position
     * Requires: EXTRA_POSITION (Long, milliseconds)
     */
    const val CMD_SEEK = 7
    
    /** Toggle shuffle mode */
    const val CMD_TOGGLE_SHUFFLE = 8
    
    /** Toggle repeat mode */
    const val CMD_TOGGLE_REPEAT = 9
    
    /**
     * Set volume
     * Requires: EXTRA_VOLUME (Float, 0.0 to 1.0)
     */
    const val CMD_SET_VOLUME = 10
    
    /**
     * Adjust volume by delta
     * Requires: EXTRA_VOLUME (Float, can be negative)
     */
    const val CMD_ADJUST_VOLUME = 11
    
    /**
     * Set playback speed
     * Requires: EXTRA_SPEED (Float, typically 0.5 to 2.0)
     */
    const val CMD_SET_SPEED = 12
    
    /**
     * Seek relative to current position
     * Requires: EXTRA_POSITION (Long, milliseconds, can be negative)
     */
    const val CMD_SEEK_RELATIVE = 13
    
    /** Clear the playback queue */
    const val CMD_CLEAR_QUEUE = 14
    
    /** Shuffle the current queue */
    const val CMD_SHUFFLE_QUEUE = 15
    
    // ===== METADATA EXTRAS (Optional) =====
    
    /** Issuing app package name for debugging (String) */
    const val EXTRA_PACKAGE = "package"
    
    /** Command source for debugging (String, e.g., "widget", "tasker") */
    const val EXTRA_SOURCE = "source"
}
