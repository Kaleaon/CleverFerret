package com.universalmedialibrary.audio

import android.media.audiofx.Equalizer
import android.media.audiofx.PresetReverb
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * 10-Band Parametric Equalizer
 * Professional audio equalization with per-device presets
 */
@Singleton
class ParametricEqualizer @Inject constructor() {
    
    data class Band(
        val frequency: Float,    // Hz
        val gain: Float,         // dB (-12 to +12)
        val q: Float = 1.0f      // Quality factor (0.1 to 10)
    )
    
    data class EQPreset(
        val name: String,
        val bands: List<Band>,
        val deviceId: String? = null  // Null for universal presets
    )
    
    private val _currentPreset = MutableStateFlow(FLAT)
    val currentPreset: StateFlow<EQPreset> = _currentPreset.asStateFlow()
    
    private val _enabled = MutableStateFlow(false)
    val enabled: StateFlow<Boolean> = _enabled.asStateFlow()
    
    private var equalizer: Equalizer? = null
    
    // Standard 10-band frequencies (ISO standard)
    private val standardBands = listOf(
        31.25f,   // Sub-bass
        62.5f,    // Bass
        125f,     // Low midrange
        250f,     // Midrange
        500f,     // Midrange
        1000f,    // Upper midrange
        2000f,    // Presence
        4000f,    // Brilliance
        8000f,    // High frequency
        16000f    // Ultra high
    )
    
    fun initialize(audioSessionId: Int) {
        try {
            equalizer?.release()
            equalizer = Equalizer(0, audioSessionId).apply {
                enabled = _enabled.value
            }
        } catch (e: Exception) {
            // EQ not supported
        }
    }
    
    fun setEnabled(enabled: Boolean) {
        _enabled.value = enabled
        equalizer?.enabled = enabled
    }
    
    fun applyPreset(preset: EQPreset) {
        _currentPreset.value = preset
        
        equalizer?.let { eq ->
            preset.bands.forEachIndexed { index, band ->
                if (index < eq.numberOfBands) {
                    // Convert dB to millibels (mB)
                    val level = (band.gain * 100).toInt().coerceIn(
                        eq.bandLevelRange[0].toInt(),
                        eq.bandLevelRange[1].toInt()
                    ).toShort()
                    
                    eq.setBandLevel(index.toShort(), level)
                }
            }
        }
    }
    
    fun updateBand(index: Int, gain: Float) {
        val currentBands = _currentPreset.value.bands.toMutableList()
        if (index in currentBands.indices) {
            currentBands[index] = currentBands[index].copy(gain = gain)
            _currentPreset.value = _currentPreset.value.copy(bands = currentBands)
            
            // Apply to equalizer
            equalizer?.let { eq ->
                if (index < eq.numberOfBands) {
                    val level = (gain * 100).toInt().coerceIn(
                        eq.bandLevelRange[0].toInt(),
                        eq.bandLevelRange[1].toInt()
                    ).toShort()
                    eq.setBandLevel(index.toShort(), level)
                }
            }
        }
    }
    
    fun savePreset(name: String, deviceId: String? = null): EQPreset {
        return EQPreset(
            name = name,
            bands = _currentPreset.value.bands,
            deviceId = deviceId
        )
    }
    
    fun release() {
        equalizer?.release()
        equalizer = null
    }
    
    companion object {
        // Built-in presets
        val FLAT = EQPreset(
            name = "Flat",
            bands = List(10) { index -> Band(0f, 0f) }
        )
        
        val BASS_BOOST = EQPreset(
            name = "Bass Boost",
            bands = listOf(
                Band(31.25f, 8f),
                Band(62.5f, 6f),
                Band(125f, 4f),
                Band(250f, 2f),
                Band(500f, 0f),
                Band(1000f, 0f),
                Band(2000f, 0f),
                Band(4000f, 0f),
                Band(8000f, 0f),
                Band(16000f, 0f)
            )
        )
        
        val VOCAL_BOOST = EQPreset(
            name = "Vocal Boost",
            bands = listOf(
                Band(31.25f, -2f),
                Band(62.5f, -1f),
                Band(125f, 0f),
                Band(250f, 3f),
                Band(500f, 4f),
                Band(1000f, 5f),
                Band(2000f, 4f),
                Band(4000f, 2f),
                Band(8000f, 0f),
                Band(16000f, -1f)
            )
        )
        
        val TREBLE_BOOST = EQPreset(
            name = "Treble Boost",
            bands = listOf(
                Band(31.25f, 0f),
                Band(62.5f, 0f),
                Band(125f, 0f),
                Band(250f, 0f),
                Band(500f, 0f),
                Band(1000f, 2f),
                Band(2000f, 4f),
                Band(4000f, 6f),
                Band(8000f, 8f),
                Band(16000f, 8f)
            )
        )
        
        val ROCK = EQPreset(
            name = "Rock",
            bands = listOf(
                Band(31.25f, 6f),
                Band(62.5f, 4f),
                Band(125f, 2f),
                Band(250f, -1f),
                Band(500f, -2f),
                Band(1000f, 0f),
                Band(2000f, 2f),
                Band(4000f, 4f),
                Band(8000f, 5f),
                Band(16000f, 5f)
            )
        )
        
        val CLASSICAL = EQPreset(
            name = "Classical",
            bands = listOf(
                Band(31.25f, 4f),
                Band(62.5f, 3f),
                Band(125f, 2f),
                Band(250f, 2f),
                Band(500f, 0f),
                Band(1000f, 0f),
                Band(2000f, -1f),
                Band(4000f, -1f),
                Band(8000f, 0f),
                Band(16000f, 3f)
            )
        )
        
        val JAZZ = EQPreset(
            name = "Jazz",
            bands = listOf(
                Band(31.25f, 3f),
                Band(62.5f, 2f),
                Band(125f, 1f),
                Band(250f, 2f),
                Band(500f, 0f),
                Band(1000f, 0f),
                Band(2000f, 0f),
                Band(4000f, 2f),
                Band(8000f, 3f),
                Band(16000f, 4f)
            )
        )
        
        val ACOUSTIC = EQPreset(
            name = "Acoustic",
            bands = listOf(
                Band(31.25f, 4f),
                Band(62.5f, 3f),
                Band(125f, 2f),
                Band(250f, 1f),
                Band(500f, 2f),
                Band(1000f, 2f),
                Band(2000f, 3f),
                Band(4000f, 3f),
                Band(8000f, 2f),
                Band(16000f, 1f)
            )
        )
        
        val PODCAST = EQPreset(
            name = "Podcast/Speech",
            bands = listOf(
                Band(31.25f, -4f),
                Band(62.5f, -3f),
                Band(125f, -1f),
                Band(250f, 2f),
                Band(500f, 4f),
                Band(1000f, 5f),
                Band(2000f, 4f),
                Band(4000f, 3f),
                Band(8000f, -2f),
                Band(16000f, -4f)
            )
        )
        
        fun getAllPresets() = listOf(
            FLAT, BASS_BOOST, VOCAL_BOOST, TREBLE_BOOST,
            ROCK, CLASSICAL, JAZZ, ACOUSTIC, PODCAST
        )
    }
}
