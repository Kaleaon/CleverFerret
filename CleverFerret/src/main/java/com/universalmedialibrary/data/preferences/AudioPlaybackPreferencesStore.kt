package com.universalmedialibrary.data.preferences

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.intPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

private val Context.audioPlaybackDataStore: DataStore<Preferences> by preferencesDataStore(
    name = "audio_playback_preferences"
)

data class AudioPlaybackPreferences(
    val skipSilence: Boolean = false,
    val crossfadeEnabled: Boolean = false,
    val crossfadeDurationMs: Int = 0,
    val lastSleepTimerMinutes: Int = 0,
    val skipForwardIntervalSec: Int = DEFAULT_FORWARD_SKIP_SEC,
    val skipBackwardIntervalSec: Int = DEFAULT_BACKWARD_SKIP_SEC
) {
    companion object {
        const val DEFAULT_FORWARD_SKIP_SEC = 30
        const val DEFAULT_BACKWARD_SKIP_SEC = 15
    }
}

@Singleton
class AudioPlaybackPreferencesStore @Inject constructor(
    @ApplicationContext private val context: Context
) {

    companion object {
        const val DEFAULT_FORWARD_SKIP_SEC = AudioPlaybackPreferences.DEFAULT_FORWARD_SKIP_SEC
        const val DEFAULT_BACKWARD_SKIP_SEC = AudioPlaybackPreferences.DEFAULT_BACKWARD_SKIP_SEC
    }

    private object Keys {
        val SKIP_SILENCE = booleanPreferencesKey("skip_silence")
        val CROSSFADE_ENABLED = booleanPreferencesKey("crossfade_enabled")
        val CROSSFADE_DURATION = intPreferencesKey("crossfade_duration_ms")
        val LAST_SLEEP_TIMER_MIN = intPreferencesKey("last_sleep_timer_minutes")
        val SKIP_FORWARD_INTERVAL_SEC = intPreferencesKey("skip_forward_interval_sec")
        val SKIP_BACKWARD_INTERVAL_SEC = intPreferencesKey("skip_backward_interval_sec")
    }

    val preferences: Flow<AudioPlaybackPreferences> = context.audioPlaybackDataStore.data.map { prefs ->
        val rawForward = prefs[Keys.SKIP_FORWARD_INTERVAL_SEC]
        val rawBackward = prefs[Keys.SKIP_BACKWARD_INTERVAL_SEC]
        AudioPlaybackPreferences(
            skipSilence = prefs[Keys.SKIP_SILENCE] ?: false,
            crossfadeEnabled = prefs[Keys.CROSSFADE_ENABLED] ?: false,
            crossfadeDurationMs = prefs[Keys.CROSSFADE_DURATION] ?: 0,
            lastSleepTimerMinutes = prefs[Keys.LAST_SLEEP_TIMER_MIN] ?: 0,
            skipForwardIntervalSec = if (rawForward != null && rawForward > 0) rawForward else DEFAULT_FORWARD_SKIP_SEC,
            skipBackwardIntervalSec = if (rawBackward != null && rawBackward > 0) rawBackward else DEFAULT_BACKWARD_SKIP_SEC
        )
    }

    suspend fun setSkipSilence(enabled: Boolean) {
        context.audioPlaybackDataStore.edit { it[Keys.SKIP_SILENCE] = enabled }
    }

    suspend fun setCrossfade(enabled: Boolean, durationMs: Int) {
        context.audioPlaybackDataStore.edit {
            it[Keys.CROSSFADE_ENABLED] = enabled
            it[Keys.CROSSFADE_DURATION] = durationMs
        }
    }

    suspend fun setLastSleepTimerMinutes(minutes: Int) {
        context.audioPlaybackDataStore.edit { it[Keys.LAST_SLEEP_TIMER_MIN] = minutes }
    }

    suspend fun setSkipForwardIntervalSec(seconds: Int) {
        val safeSeconds = if (seconds > 0) seconds else DEFAULT_FORWARD_SKIP_SEC
        context.audioPlaybackDataStore.edit { it[Keys.SKIP_FORWARD_INTERVAL_SEC] = safeSeconds }
    }

    suspend fun setSkipBackwardIntervalSec(seconds: Int) {
        val safeSeconds = if (seconds > 0) seconds else DEFAULT_BACKWARD_SKIP_SEC
        context.audioPlaybackDataStore.edit { it[Keys.SKIP_BACKWARD_INTERVAL_SEC] = safeSeconds }
    }

    suspend fun setSkipForwardInterval(seconds: Int) = setSkipForwardIntervalSec(seconds)

    suspend fun setSkipBackwardInterval(seconds: Int) = setSkipBackwardIntervalSec(seconds)

    suspend fun clear() {
        context.audioPlaybackDataStore.edit { it.clear() }
    }
}
