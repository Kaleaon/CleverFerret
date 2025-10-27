package com.universalmedialibrary.api

/**
 * Media Command API Interface
 * 
 * Inspired by PowerampAPI's comprehensive command system
 * Defines all playback and control commands for CleverFerret
 * 
 * This interface is implemented by AdvancedMusicPlayerService
 * to provide professional-grade music player control
 */
interface MediaCommandAPI {
    
    // ===== BASIC PLAYBACK CONTROL =====
    
    /**
     * Start playback
     */
    fun play()
    
    /**
     * Pause playback
     */
    fun pause()
    
    /**
     * Toggle between play and pause
     */
    fun togglePlayPause()
    
    /**
     * Stop playback and clear state
     */
    fun stop()
    
    /**
     * Skip to next track
     */
    fun skipNext()
    
    /**
     * Skip to previous track
     */
    fun skipPrevious()
    
    /**
     * Seek to specific position
     * @param positionMs Position in milliseconds
     */
    fun seekTo(positionMs: Long)
    
    /**
     * Seek relative to current position
     * @param deltaMs Delta in milliseconds (can be negative)
     */
    fun seekRelative(deltaMs: Long)
    
    // ===== QUEUE MANAGEMENT =====
    
    /**
     * Skip to specific position in queue
     * @param index Queue index (0-based)
     */
    fun skipToQueuePosition(index: Int)
    
    /**
     * Add track to queue
     * @param mediaId Track ID to add
     */
    fun addToQueue(mediaId: String)
    
    /**
     * Remove track from queue
     * @param index Queue position to remove
     */
    fun removeFromQueue(index: Int)
    
    /**
     * Move track in queue
     * @param from Source index
     * @param to Destination index
     */
    fun moveInQueue(from: Int, to: Int)
    
    /**
     * Clear entire queue
     */
    fun clearQueue()
    
    /**
     * Shuffle current queue
     */
    fun shuffleQueue()
    
    // ===== PLAYBACK MODES =====
    
    /**
     * Set shuffle mode
     * @param mode Shuffle mode (OFF, ALL, CATEGORIES)
     */
    fun setShuffleMode(mode: ShuffleMode)
    
    /**
     * Set repeat mode
     * @param mode Repeat mode (OFF, ALL, ONE, ADVANCE_LIST)
     */
    fun setRepeatMode(mode: RepeatMode)
    
    /**
     * Toggle shuffle mode
     */
    fun toggleShuffle()
    
    /**
     * Toggle repeat mode
     */
    fun toggleRepeat()
    
    // ===== VOLUME & SPEED =====
    
    /**
     * Set volume level
     * @param volume Volume (0.0 to 1.0)
     */
    fun setVolume(volume: Float)
    
    /**
     * Adjust volume by delta
     * @param delta Volume delta (can be negative)
     */
    fun adjustVolume(delta: Float)
    
    /**
     * Set playback speed
     * @param speed Playback speed (typically 0.5 to 2.0)
     */
    fun setPlaybackSpeed(speed: Float)
    
    // ===== AUDIO EFFECTS =====
    
    /**
     * Set equalizer preset
     * @param presetId Preset ID
     */
    fun setEqualizerPreset(presetId: Int)
    
    /**
     * Enable/disable reverb effect
     * @param enabled True to enable
     */
    fun enableReverb(enabled: Boolean)
    
    /**
     * Set bass boost strength
     * @param strength Strength (0-1000)
     */
    fun setBassBoost(strength: Int)
}

/**
 * Shuffle modes
 */
enum class ShuffleMode {
    /** Shuffle off */
    OFF,
    /** Shuffle all tracks */
    ALL,
    /** Shuffle within categories */
    CATEGORIES
}

/**
 * Repeat modes
 */
enum class RepeatMode {
    /** Repeat off */
    OFF,
    /** Repeat all tracks */
    ALL,
    /** Repeat current track */
    ONE,
    /** Advance to next list when current ends */
    ADVANCE_LIST
}
