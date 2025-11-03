package com.universalmedialibrary.services.music

import android.util.Log
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.math.pow

/**
 * Service for applying ReplayGain volume normalization
 * 
 * ReplayGain analyzes audio files to determine their loudness and stores gain adjustments
 * in metadata tags. This service applies those adjustments for consistent playback volume.
 */
@Singleton
class ReplayGainService @Inject constructor() {
    
    private val TAG = "ReplayGainService"
    
    // ReplayGain settings
    private var replayGainEnabled = true
    private var preferAlbumGain = true // Use album gain over track gain when available
    private var preampGain = 0.0f // Additional preamp adjustment in dB
    
    /**
     * Enable or disable ReplayGain
     */
    fun setEnabled(enabled: Boolean) {
        replayGainEnabled = enabled
    }
    
    /**
     * Set whether to prefer album gain over track gain
     */
    fun setPreferAlbumGain(prefer: Boolean) {
        preferAlbumGain = prefer
    }
    
    /**
     * Set additional preamp gain in dB
     */
    fun setPreampGain(gainDb: Float) {
        preampGain = gainDb.coerceIn(-15f, 15f)
    }
    
    /**
     * Calculate the volume adjustment for a track
     * 
     * @param trackGain Track ReplayGain value in dB (from metadata)
     * @param albumGain Album ReplayGain value in dB (from metadata)
     * @return Volume multiplier (1.0 = no change, <1.0 = reduce volume, >1.0 = increase volume)
     */
    fun calculateVolumeAdjustment(trackGain: Float?, albumGain: Float?): Float {
        if (!replayGainEnabled) {
            return 1.0f
        }
        
        // Determine which gain value to use
        val gainDb = when {
            preferAlbumGain && albumGain != null -> albumGain
            trackGain != null -> trackGain
            albumGain != null -> albumGain
            else -> return 1.0f // No gain info available
        }
        
        // Apply preamp adjustment
        val totalGainDb = gainDb + preampGain
        
        // Convert dB to linear multiplier: multiplier = 10^(dB/20)
        val multiplier = 10.0.pow(totalGainDb / 20.0).toFloat()
        
        // Clamp to reasonable range (prevent extreme volume changes)
        return multiplier.coerceIn(0.1f, 10.0f)
    }
    
    /**
     * Apply ReplayGain to current volume
     * 
     * @param currentVolume Current playback volume (0.0 to 1.0)
     * @param trackGain Track ReplayGain value in dB
     * @param albumGain Album ReplayGain value in dB
     * @return Adjusted volume (0.0 to 1.0)
     */
    fun applyReplayGain(currentVolume: Float, trackGain: Float?, albumGain: Float?): Float {
        val adjustment = calculateVolumeAdjustment(trackGain, albumGain)
        val adjustedVolume = currentVolume * adjustment
        
        // Clamp to valid volume range
        return adjustedVolume.coerceIn(0.0f, 1.0f)
    }
    
    /**
     * Parse ReplayGain value from string tag
     * Common formats: "+2.5 dB", "-3.2 dB", "2.5", etc.
     */
    fun parseReplayGainTag(tag: String?): Float? {
        if (tag.isNullOrBlank()) return null
        
        try {
            // Remove "dB" suffix and whitespace
            val cleaned = tag.trim()
                .replace("dB", "", ignoreCase = true)
                .replace("db", "", ignoreCase = true)
                .trim()
            
            return cleaned.toFloatOrNull()
        } catch (e: Exception) {
            Log.w(TAG, "Failed to parse ReplayGain tag: $tag", e)
            return null
        }
    }
    
    /**
     * Get current ReplayGain settings
     */
    fun getSettings(): ReplayGainSettings {
        return ReplayGainSettings(
            enabled = replayGainEnabled,
            preferAlbumGain = preferAlbumGain,
            preampGain = preampGain
        )
    }
}

/**
 * ReplayGain settings data class
 */
data class ReplayGainSettings(
    val enabled: Boolean,
    val preferAlbumGain: Boolean,
    val preampGain: Float
)
