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
    val lastSleepTimerMinutes: Int = 0
)

@Singleton
class AudioPlaybackPreferencesStore @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private object Keys {
        val SKIP_SILENCE = booleanPreferencesKey("skip_silence")
        val CROSSFADE_ENABLED = booleanPreferencesKey("crossfade_enabled")
        val CROSSFADE_DURATION = intPreferencesKey("crossfade_duration_ms")
        val LAST_SLEEP_TIMER_MIN = intPreferencesKey("last_sleep_timer_minutes")
    }

    val preferences: Flow<AudioPlaybackPreferences> = context.audioPlaybackDataStore.data.map { prefs ->
        AudioPlaybackPreferences(
            skipSilence = prefs[Keys.SKIP_SILENCE] ?: false,
            crossfadeEnabled = prefs[Keys.CROSSFADE_ENABLED] ?: false,
            crossfadeDurationMs = prefs[Keys.CROSSFADE_DURATION] ?: 0,
            lastSleepTimerMinutes = prefs[Keys.LAST_SLEEP_TIMER_MIN] ?: 0
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
}
