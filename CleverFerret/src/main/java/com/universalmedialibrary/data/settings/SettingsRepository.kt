package com.universalmedialibrary.data.settings

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Provides a [DataStore] instance for the application settings.
 */
val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "app_settings")

/**
 * A repository for managing user settings, using Jetpack DataStore for persistence.
 * Settings are stored as JSON strings.
 *
 * @param context The application context, used to access the DataStore.
 */
@Singleton
class SettingsRepository @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val json = Json {
        ignoreUnknownKeys = true
        encodeDefaults = true
    }

    companion object {
        private val API_SETTINGS_KEY = stringPreferencesKey("api_settings")
        private val READER_SETTINGS_KEY = stringPreferencesKey("reader_settings")
        private val SECURITY_SETTINGS_KEY = stringPreferencesKey("security_settings")
        private val GENERAL_SETTINGS_KEY = stringPreferencesKey("general_settings")
    }

    /**
     * A [Flow] that emits the current [ApiSettings].
     * If parsing fails or no settings are stored, it emits default settings.
     */
    val apiSettings: Flow<ApiSettings> = context.dataStore.data.map { preferences ->
        preferences[API_SETTINGS_KEY]?.let { jsonString ->
            try {
                json.decodeFromString<ApiSettings>(jsonString)
            } catch (e: Exception) {
                ApiSettings() // Return default if parsing fails
            }
        } ?: ApiSettings()
    }

    /**
     * A [Flow] that emits the current [ReaderSettings].
     * If parsing fails or no settings are stored, it emits default settings.
     */
    val readerSettings: Flow<ReaderSettings> = context.dataStore.data.map { preferences ->
        preferences[READER_SETTINGS_KEY]?.let { jsonString ->
            try {
                json.decodeFromString<ReaderSettings>(jsonString)
            } catch (e: Exception) {
                ReaderSettings() // Return default if parsing fails
            }
        } ?: ReaderSettings()
    }

    /**
     * A [Flow] that emits the current [SecuritySettings].
     * If parsing fails or no settings are stored, it emits default settings.
     */
    val securitySettings: Flow<SecuritySettings> = context.dataStore.data.map { preferences ->
        preferences[SECURITY_SETTINGS_KEY]?.let { jsonString ->
            try {
                json.decodeFromString<SecuritySettings>(jsonString)
            } catch (e: Exception) {
                SecuritySettings() // Return default if parsing fails
            }
        } ?: SecuritySettings()
    }

    /**
     * A [Flow] that emits the current [GeneralSettings].
     * If parsing fails or no settings are stored, it emits default settings.
     */
    val generalSettings: Flow<GeneralSettings> = context.dataStore.data.map { preferences ->
        preferences[GENERAL_SETTINGS_KEY]?.let { jsonString ->
            try {
                json.decodeFromString<GeneralSettings>(jsonString)
            } catch (e: Exception) {
                GeneralSettings() // Return default if parsing fails
            }
        } ?: GeneralSettings()
    }

    /**
     * Updates the [ApiSettings] in the DataStore.
     * @param settings The new settings to save.
     */
    suspend fun updateApiSettings(settings: ApiSettings) {
        context.dataStore.edit { preferences ->
            preferences[API_SETTINGS_KEY] = json.encodeToString(ApiSettings.serializer(), settings)
        }
    }

    /**
     * Updates the [ReaderSettings] in the DataStore.
     * @param settings The new settings to save.
     */
    suspend fun updateReaderSettings(settings: ReaderSettings) {
        context.dataStore.edit { preferences ->
            preferences[READER_SETTINGS_KEY] = json.encodeToString(ReaderSettings.serializer(), settings)
        }
    }

    /**
     * Updates the [SecuritySettings] in the DataStore.
     * @param settings The new settings to save.
     */
    suspend fun updateSecuritySettings(settings: SecuritySettings) {
        context.dataStore.edit { preferences ->
            preferences[SECURITY_SETTINGS_KEY] = json.encodeToString(SecuritySettings.serializer(), settings)
        }
    }

    /**
     * Updates the [GeneralSettings] in the DataStore.
     * @param settings The new settings to save.
     */
    suspend fun updateGeneralSettings(settings: GeneralSettings) {
        context.dataStore.edit { preferences ->
            preferences[GENERAL_SETTINGS_KEY] = json.encodeToString(GeneralSettings.serializer(), settings)
        }
    }

    /**
     * A convenience method to update only the book API settings.
     * @param bookApis The new [BookApiSettings] to save.
     */
    suspend fun updateBookApiSettings(bookApis: BookApiSettings) {
        context.dataStore.edit { preferences ->
            val jsonString = preferences[API_SETTINGS_KEY]
            val currentSettings = if (!jsonString.isNullOrEmpty()) {
                try {
                    json.decodeFromString<ApiSettings>(jsonString)
                } catch (e: Exception) {
                    ApiSettings()
                }
            } else {
                ApiSettings()
            }
            val updatedSettings = currentSettings.copy(bookApis = bookApis)
            preferences[API_SETTINGS_KEY] = json.encodeToString(ApiSettings.serializer(), updatedSettings)
        }
    }
}