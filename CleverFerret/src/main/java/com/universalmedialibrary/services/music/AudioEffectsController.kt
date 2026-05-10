package com.universalmedialibrary.services.music

import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlin.math.roundToInt
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Owns audio-effect state (EQ preset, bass boost, reverb, replay gain) and persists
 * it to SharedPreferences. Extracted from AdvancedMusicPlayerService so the player
 * service stays focused on playback orchestration.
 */
@Singleton
class AudioEffectsController @Inject constructor(
    @ApplicationContext context: Context,
    private val audioEffectsService: AudioEffectsService,
    private val replayGainService: ReplayGainService,
) {
    private val audioPrefs: SharedPreferences =
        context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    @Volatile var currentEqPreset: EqualizerPreset = EqualizerPreset.FLAT
        private set
    @Volatile var currentBassBoostStrength: Int = 0
        private set
    @Volatile var currentReverbEnabled: Boolean = false
        private set
    @Volatile var currentReverbPreset: ReverbPreset = ReverbPreset.SMALL_ROOM
        private set

    fun loadPreferences() {
        val eqOrdinal = audioPrefs.getInt(KEY_EQ_PRESET, EqualizerPreset.FLAT.ordinal)
        currentEqPreset = EqualizerPreset.values().getOrElse(eqOrdinal) { EqualizerPreset.FLAT }

        currentBassBoostStrength = audioPrefs.getInt(KEY_BASS_BOOST, 0).coerceIn(0, 1000)
        currentReverbEnabled = audioPrefs.getBoolean(KEY_REVERB_ENABLED, false)

        val reverbOrdinal = audioPrefs.getInt(KEY_REVERB_PRESET, ReverbPreset.SMALL_ROOM.ordinal)
        currentReverbPreset = ReverbPreset.values().getOrElse(reverbOrdinal) { ReverbPreset.SMALL_ROOM }

        val replayGainEnabled = audioPrefs.getBoolean(KEY_REPLAY_GAIN_ENABLED, true)
        val replayGainPreamp = audioPrefs.getInt(KEY_REPLAY_GAIN_PREAMP, 0)

        replayGainService.setEnabled(replayGainEnabled)
        replayGainService.setPreampGain(replayGainPreamp.toFloat())
    }

    fun applyStored() {
        try {
            audioEffectsService.applyEqualizerPreset(currentEqPreset)
        } catch (ignored: Exception) {
            Log.w(TAG, "Equalizer not available on this device")
        }
        try {
            audioEffectsService.setBassBoost(
                currentBassBoostStrength.coerceIn(0, 1000),
                enabled = currentBassBoostStrength > 0,
            )
        } catch (ignored: Exception) {
            Log.w(TAG, "Bass boost not available on this device")
        }
        try {
            audioEffectsService.setReverb(currentReverbPreset, currentReverbEnabled)
        } catch (ignored: Exception) {
            Log.w(TAG, "Reverb not available on this device")
        }
    }

    fun setEqualizerPreset(presetId: Int) {
        try {
            val preset = when (presetId) {
                0 -> EqualizerPreset.FLAT
                1 -> EqualizerPreset.BASS_BOOST
                2 -> EqualizerPreset.TREBLE_BOOST
                3 -> EqualizerPreset.VOCAL
                4 -> EqualizerPreset.DEEP
                5 -> EqualizerPreset.ELECTRONIC
                6 -> EqualizerPreset.ROCK
                7 -> EqualizerPreset.JAZZ
                else -> EqualizerPreset.FLAT
            }
            currentEqPreset = preset
            audioEffectsService.applyEqualizerPreset(preset)
            persist { putInt(KEY_EQ_PRESET, preset.ordinal) }
        } catch (e: Exception) {
            // Audio effects not available on this device
        }
    }

    fun enableReverb(enabled: Boolean) {
        try {
            currentReverbEnabled = enabled
            audioEffectsService.setReverb(currentReverbPreset, enabled)
            persist { putBoolean(KEY_REVERB_ENABLED, enabled) }
        } catch (e: Exception) {
        }
    }

    fun setReverbPreset(preset: ReverbPreset) {
        currentReverbPreset = preset
        try {
            audioEffectsService.setReverb(currentReverbPreset, currentReverbEnabled)
            persist { putInt(KEY_REVERB_PRESET, preset.ordinal) }
        } catch (e: Exception) {
        }
    }

    fun setBassBoost(strength: Int) {
        try {
            currentBassBoostStrength = strength.coerceIn(0, 1000)
            audioEffectsService.setBassBoost(currentBassBoostStrength, enabled = currentBassBoostStrength > 0)
            persist { putInt(KEY_BASS_BOOST, currentBassBoostStrength) }
        } catch (e: Exception) {
        }
    }

    fun setReplayGainEnabled(enabled: Boolean, currentTrack: TrackInfo?, applyReplayGain: (TrackInfo) -> Unit) {
        replayGainService.setEnabled(enabled)
        currentTrack?.let { applyReplayGain(it) }
        persist { putBoolean(KEY_REPLAY_GAIN_ENABLED, enabled) }
    }

    fun setReplayGainPreamp(preampDb: Int, currentTrack: TrackInfo?, applyReplayGain: (TrackInfo) -> Unit) {
        replayGainService.setPreampGain(preampDb.toFloat())
        currentTrack?.let { applyReplayGain(it) }
        persist { putInt(KEY_REPLAY_GAIN_PREAMP, preampDb) }
    }

    fun snapshot(): AudioEffectsSnapshot {
        val replayGainSettings = replayGainService.getSettings()
        return AudioEffectsSnapshot(
            eqPreset = currentEqPreset,
            bassBoostStrength = currentBassBoostStrength,
            reverbEnabled = currentReverbEnabled,
            reverbPreset = currentReverbPreset,
            replayGainEnabled = replayGainSettings.enabled,
            replayGainPreamp = replayGainSettings.preampGain.roundToInt(),
        )
    }

    private inline fun persist(block: SharedPreferences.Editor.() -> Unit) {
        audioPrefs.edit().apply {
            block()
            apply()
        }
    }

    companion object {
        private const val TAG = "AudioEffectsController"
        private const val PREFS_NAME = "audio_effects_settings"
        private const val KEY_EQ_PRESET = "eq_preset"
        private const val KEY_BASS_BOOST = "bass_boost_strength"
        private const val KEY_REVERB_ENABLED = "reverb_enabled"
        private const val KEY_REVERB_PRESET = "reverb_preset"
        private const val KEY_REPLAY_GAIN_ENABLED = "replay_gain_enabled"
        private const val KEY_REPLAY_GAIN_PREAMP = "replay_gain_preamp"
    }
}
