package com.universalmedialibrary.data.preferences

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

val Context.aiSettingsDataStore: DataStore<Preferences> by preferencesDataStore(name = "ai_settings")

@Singleton
class AISettingsPreferencesStore @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val SELECTED_PROVIDER_KEY = stringPreferencesKey("selected_ai_provider")

    val selectedProvider: Flow<String> = context.aiSettingsDataStore.data
        .map { preferences ->
            preferences[SELECTED_PROVIDER_KEY] ?: "GEMINI"
        }

    suspend fun setSelectedProvider(providerId: String) {
        context.aiSettingsDataStore.edit { preferences ->
            preferences[SELECTED_PROVIDER_KEY] = providerId
        }
    }
}
