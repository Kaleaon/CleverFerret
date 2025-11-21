package com.universalmedialibrary.data.repository

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import com.universalmedialibrary.data.settings.*
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "cleverferret_settings")

@Singleton
class SettingsRepository @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val json = Json { ignoreUnknownKeys = true }

    private object PreferencesKeys {
        val THEME = stringPreferencesKey("theme")
        val DARK_MODE = booleanPreferencesKey("dark_mode")
        val AUTO_DOWNLOAD_PODCASTS = booleanPreferencesKey("auto_download_podcasts")
        val WIFI_ONLY_DOWNLOADS = booleanPreferencesKey("wifi_only_downloads")
        val NOTIFICATIONS_ENABLED = booleanPreferencesKey("notifications_enabled")
        val API_SETTINGS = stringPreferencesKey("api_settings")
        val CACHE_LOCATION = stringPreferencesKey("cache_location")
        val MAX_CACHE_SIZE_MB = stringPreferencesKey("max_cache_size_mb")
        val BOTTOM_GEAR_POSITION = stringPreferencesKey("bottom_gear_position")
        val MINI_PLAYER_BACKGROUND = stringPreferencesKey("mini_player_background")
        val BOTTOM_BAR_CONFIG = stringPreferencesKey("bottom_bar_config")
    }

    val themeFlow: Flow<ThemePalette> = context.dataStore.data.map { preferences ->
        val themeName = preferences[PreferencesKeys.THEME] ?: ThemePalette.NAVY_GOLD.name
        try {
            ThemePalette.valueOf(themeName)
        } catch (e: IllegalArgumentException) {
            ThemePalette.NAVY_GOLD
        }
    }

    val darkModeFlow: Flow<Boolean> = context.dataStore.data.map { preferences ->
        preferences[PreferencesKeys.DARK_MODE] ?: true
    }

    val autoDownloadPodcastsFlow: Flow<Boolean> = context.dataStore.data.map { preferences ->
        preferences[PreferencesKeys.AUTO_DOWNLOAD_PODCASTS] ?: false
    }

    val wifiOnlyDownloadsFlow: Flow<Boolean> = context.dataStore.data.map { preferences ->
        preferences[PreferencesKeys.WIFI_ONLY_DOWNLOADS] ?: true
    }

    val notificationsEnabledFlow: Flow<Boolean> = context.dataStore.data.map { preferences ->
        preferences[PreferencesKeys.NOTIFICATIONS_ENABLED] ?: true
    }

    val apiSettingsFlow: Flow<ApiSettings> = context.dataStore.data.map { preferences ->
        val settingsJson = preferences[PreferencesKeys.API_SETTINGS]
        if (settingsJson != null) {
            try {
                json.decodeFromString<ApiSettings>(settingsJson)
            } catch (e: Exception) {
                ApiSettings()
            }
        } else {
            ApiSettings()
        }
    }

    val cacheLocationFlow: Flow<CacheLocation> = context.dataStore.data.map { preferences ->
        val location = preferences[PreferencesKeys.CACHE_LOCATION] ?: CacheLocation.INTERNAL.name
        try {
            CacheLocation.valueOf(location)
        } catch (e: IllegalArgumentException) {
            CacheLocation.INTERNAL
        }
    }

    val maxCacheSizeMBFlow: Flow<Int> = context.dataStore.data.map { preferences ->
        preferences[PreferencesKeys.MAX_CACHE_SIZE_MB]?.toIntOrNull() ?: 500
    }

    val bottomGearPositionFlow: Flow<BottomGearPosition> = context.dataStore.data.map { preferences ->
        BottomGearPosition.fromString(preferences[PreferencesKeys.BOTTOM_GEAR_POSITION])
    }

    val miniPlayerBackgroundModeFlow: Flow<MiniPlayerBackgroundMode> = context.dataStore.data.map { preferences ->
        MiniPlayerBackgroundMode.fromName(preferences[PreferencesKeys.MINI_PLAYER_BACKGROUND])
    }

    val bottomBarPreferencesFlow: Flow<BottomBarPreferences> = context.dataStore.data.map { preferences ->
        val configJson = preferences[PreferencesKeys.BOTTOM_BAR_CONFIG]
        if (configJson.isNullOrBlank()) {
            BottomBarPreferences.Default
        } else {
            runCatching { json.decodeFromString<BottomBarPreferences>(configJson) }
                .getOrDefault(BottomBarPreferences.Default)
        }
    }

    suspend fun setTheme(palette: ThemePalette) {
        context.dataStore.edit { preferences ->
            preferences[PreferencesKeys.THEME] = palette.name
        }
    }

    suspend fun setDarkMode(enabled: Boolean) {
        context.dataStore.edit { preferences ->
            preferences[PreferencesKeys.DARK_MODE] = enabled
        }
    }

    suspend fun setAutoDownloadPodcasts(enabled: Boolean) {
        context.dataStore.edit { preferences ->
            preferences[PreferencesKeys.AUTO_DOWNLOAD_PODCASTS] = enabled
        }
    }

    suspend fun setWifiOnlyDownloads(enabled: Boolean) {
        context.dataStore.edit { preferences ->
            preferences[PreferencesKeys.WIFI_ONLY_DOWNLOADS] = enabled
        }
    }

    suspend fun setNotificationsEnabled(enabled: Boolean) {
        context.dataStore.edit { preferences ->
            preferences[PreferencesKeys.NOTIFICATIONS_ENABLED] = enabled
        }
    }

    suspend fun setApiSettings(settings: ApiSettings) {
        context.dataStore.edit { preferences ->
            preferences[PreferencesKeys.API_SETTINGS] = json.encodeToString(settings)
        }
    }

    suspend fun setCacheLocation(location: CacheLocation) {
        context.dataStore.edit { preferences ->
            preferences[PreferencesKeys.CACHE_LOCATION] = location.name
        }
    }

    suspend fun setMaxCacheSizeMB(sizeMB: Int) {
        context.dataStore.edit { preferences ->
            preferences[PreferencesKeys.MAX_CACHE_SIZE_MB] = sizeMB.toString()
        }
    }

    suspend fun setBottomGearPosition(position: BottomGearPosition) {
        context.dataStore.edit { preferences ->
            preferences[PreferencesKeys.BOTTOM_GEAR_POSITION] = position.name
        }
    }

    suspend fun setMiniPlayerBackgroundMode(mode: MiniPlayerBackgroundMode) {
        context.dataStore.edit { preferences ->
            preferences[PreferencesKeys.MINI_PLAYER_BACKGROUND] = mode.name
        }
    }

    suspend fun setBottomBarPreferences(preferencesValue: BottomBarPreferences) {
        context.dataStore.edit { preferences ->
            if (preferencesValue == BottomBarPreferences.Default) {
                preferences.remove(PreferencesKeys.BOTTOM_BAR_CONFIG)
            } else {
                preferences[PreferencesKeys.BOTTOM_BAR_CONFIG] = json.encodeToString(preferencesValue)
            }
        }
    }
}

/**
 * Cache storage location options
 */
enum class CacheLocation {
    INTERNAL,  // Device internal storage
    EXTERNAL   // SD card or external storage
}
