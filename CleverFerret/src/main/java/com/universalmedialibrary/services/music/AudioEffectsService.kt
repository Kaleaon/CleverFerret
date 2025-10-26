package com.universalmedialibrary.services.music

import android.content.Context
import android.media.audiofx.BassBoost
import android.media.audiofx.Equalizer
import android.media.audiofx.PresetReverb
import android.media.audiofx.Virtualizer
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Advanced audio effects service
 * 
 * Effects:
 * - Bass Boost
 * - Virtualizer (3D/Surround)
 * - Reverb
 * - Custom Equalizer
 */
@Singleton
class AudioEffectsService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private var bassBoost: BassBoost? = null
    private var virtualizer: Virtualizer? = null
    private var reverb: PresetReverb? = null
    private var equalizer: Equalizer? = null

    private var currentAudioSessionId: Int = 0

    /**
     * Initialize effects for an audio session
     */
    fun initialize(audioSessionId: Int) {
        release() // Clean up old effects
        
        currentAudioSessionId = audioSessionId

        try {
            bassBoost = BassBoost(0, audioSessionId).apply {
                enabled = false
            }

            virtualizer = Virtualizer(0, audioSessionId).apply {
                enabled = false
            }

            reverb = PresetReverb(0, audioSessionId).apply {
                enabled = false
            }

            equalizer = Equalizer(0, audioSessionId).apply {
                enabled = true
            }
        } catch (e: Exception) {
            // Some devices don't support all effects
        }
    }

    /**
     * Bass boost control (0-1000)
     */
    fun setBassBoost(strength: Int, enabled: Boolean = true) {
        bassBoost?.apply {
            setStrength(strength.toShort())
            this.enabled = enabled
        }
    }

    /**
     * 3D/Surround sound (0-1000)
     */
    fun setVirtualizer(strength: Int, enabled: Boolean = true) {
        virtualizer?.apply {
            setStrength(strength.toShort())
            this.enabled = enabled
        }
    }

    /**
     * Reverb effect
     */
    fun setReverb(preset: ReverbPreset, enabled: Boolean = true) {
        reverb?.apply {
            this.preset = preset.value.toShort()
            this.enabled = enabled
        }
    }

    /**
     * Custom equalizer bands
     */
    fun setEqualizerBands(bands: List<Int>) {
        equalizer?.let { eq ->
            val numBands = eq.numberOfBands.toInt()
            bands.take(numBands).forEachIndexed { index, level ->
                eq.setBandLevel(index.toShort(), level.toShort())
            }
        }
    }

    /**
     * Apply equalizer preset
     */
    fun applyEqualizerPreset(preset: EqualizerPreset) {
        when (preset) {
            EqualizerPreset.FLAT -> setEqualizerBands(List(5) { 0 })
            EqualizerPreset.BASS_BOOST -> setEqualizerBands(listOf(800, 600, 200, -200, -400))
            EqualizerPreset.TREBLE_BOOST -> setEqualizerBands(listOf(-400, -200, 200, 600, 800))
            EqualizerPreset.VOCAL -> setEqualizerBands(listOf(-200, 400, 600, 400, 0))
            EqualizerPreset.DEEP -> setEqualizerBands(listOf(600, 400, 0, 200, 400))
            EqualizerPreset.ELECTRONIC -> setEqualizerBands(listOf(600, 200, 0, 400, 600))
            EqualizerPreset.ROCK -> setEqualizerBands(listOf(600, 400, -100, 200, 600))
            EqualizerPreset.JAZZ -> setEqualizerBands(listOf(200, 200, -200, 400, 600))
        }
    }

    /**
     * Get current effects state
     */
    fun getEffectsState(): AudioEffectsState {
        return AudioEffectsState(
            bassBoostStrength = bassBoost?.roundedStrength?.toInt() ?: 0,
            bassBoostEnabled = bassBoost?.enabled ?: false,
            virtualizerStrength = virtualizer?.roundedStrength?.toInt() ?: 0,
            virtualizerEnabled = virtualizer?.enabled ?: false,
            reverbEnabled = reverb?.enabled ?: false,
            equalizerEnabled = equalizer?.enabled ?: true
        )
    }

    /**
     * Release all effects
     */
    fun release() {
        try {
            bassBoost?.release()
            virtualizer?.release()
            reverb?.release()
            equalizer?.release()
        } catch (e: Exception) {
            // Ignore
        }
        
        bassBoost = null
        virtualizer = null
        reverb = null
        equalizer = null
    }
}

/**
 * Reverb presets
 */
enum class ReverbPreset(val value: Int, val displayName: String) {
    NONE(PresetReverb.PRESET_NONE.toInt(), "None"),
    SMALL_ROOM(PresetReverb.PRESET_SMALLROOM.toInt(), "Small Room"),
    MEDIUM_ROOM(PresetReverb.PRESET_MEDIUMROOM.toInt(), "Medium Room"),
    LARGE_ROOM(PresetReverb.PRESET_LARGEROOM.toInt(), "Large Room"),
    MEDIUM_HALL(PresetReverb.PRESET_MEDIUMHALL.toInt(), "Medium Hall"),
    LARGE_HALL(PresetReverb.PRESET_LARGEHALL.toInt(), "Large Hall"),
    PLATE(PresetReverb.PRESET_PLATE.toInt(), "Plate")
}

/**
 * Equalizer presets
 */
enum class EqualizerPreset(val displayName: String) {
    FLAT("Flat"),
    BASS_BOOST("Bass Boost"),
    TREBLE_BOOST("Treble Boost"),
    VOCAL("Vocal"),
    DEEP("Deep"),
    ELECTRONIC("Electronic"),
    ROCK("Rock"),
    JAZZ("Jazz")
}

/**
 * Current effects state
 */
data class AudioEffectsState(
    val bassBoostStrength: Int = 0,
    val bassBoostEnabled: Boolean = false,
    val virtualizerStrength: Int = 0,
    val virtualizerEnabled: Boolean = false,
    val reverbEnabled: Boolean = false,
    val equalizerEnabled: Boolean = true
)
