package com.universalmedialibrary.services.tts

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

/**
 * TTS Provider Manager
 * 
 * Manages the active TTS provider and provides the appropriate service
 */
@Singleton
class TtsProviderManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val androidTtsService: AndroidTextToSpeechService,
    private val geminiTtsService: GeminiTtsService
) {
    private val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "tts_settings")

    companion object {
        private val PROVIDER_KEY = stringPreferencesKey("tts_provider")
        private val API_KEY_PREFIX = "tts_api_key_"
        private val MODEL_KEY_PREFIX = "tts_model_"
        private val VOICE_ID_PREFIX = "tts_voice_id_"
    }

    /**
     * Get the current TTS provider settings
     */
    val providerSettings: Flow<TtsProviderSettings> = context.dataStore.data.map { preferences ->
        val providerName = preferences[PROVIDER_KEY] ?: TtsProvider.ANDROID.name
        val provider = try {
            TtsProvider.valueOf(providerName)
        } catch (e: IllegalArgumentException) {
            TtsProvider.ANDROID
        }

        TtsProviderSettings(
            provider = provider,
            apiKey = preferences[stringPreferencesKey("$API_KEY_PREFIX${provider.name}")],
            model = preferences[stringPreferencesKey("$MODEL_KEY_PREFIX${provider.name}")],
            voiceId = preferences[stringPreferencesKey("$VOICE_ID_PREFIX${provider.name}")]
        )
    }

    /**
     * Get the active TTS service based on current provider
     */
    suspend fun getActiveService(): TextToSpeechService {
        var settings: TtsProviderSettings? = null
        providerSettings.collect { settings = it }
        
        return when (settings?.provider) {
            TtsProvider.GEMINI -> {
                settings?.apiKey?.let { geminiTtsService.setApiKey(it) }
                geminiTtsService
            }
            TtsProvider.GOOGLE_CLOUD -> {
                // TODO: Implement Google Cloud TTS
                androidTtsService
            }
            TtsProvider.ELEVEN_LABS -> {
                // TODO: Implement ElevenLabs TTS
                androidTtsService
            }
            TtsProvider.OPENAI -> {
                // TODO: Implement OpenAI TTS
                androidTtsService
            }
            else -> androidTtsService
        }
    }

    /**
     * Set the TTS provider
     */
    suspend fun setProvider(provider: TtsProvider) {
        context.dataStore.edit { preferences ->
            preferences[PROVIDER_KEY] = provider.name
        }
    }

    /**
     * Set API key for a provider
     */
    suspend fun setApiKey(provider: TtsProvider, apiKey: String) {
        context.dataStore.edit { preferences ->
            preferences[stringPreferencesKey("$API_KEY_PREFIX${provider.name}")] = apiKey
        }
    }

    /**
     * Set model for a provider
     */
    suspend fun setModel(provider: TtsProvider, model: String) {
        context.dataStore.edit { preferences ->
            preferences[stringPreferencesKey("$MODEL_KEY_PREFIX${provider.name}")] = model
        }
    }

    /**
     * Set voice ID for a provider
     */
    suspend fun setVoiceId(provider: TtsProvider, voiceId: String) {
        context.dataStore.edit { preferences ->
            preferences[stringPreferencesKey("$VOICE_ID_PREFIX${provider.name}")] = voiceId
        }
    }

    /**
     * Check if a provider is properly configured
     */
    suspend fun isProviderConfigured(provider: TtsProvider): Boolean {
        if (!provider.requiresApiKey) return true

        var configured = false
        context.dataStore.data.collect { preferences ->
            val apiKey = preferences[stringPreferencesKey("$API_KEY_PREFIX${provider.name}")]
            configured = !apiKey.isNullOrBlank()
        }
        return configured
    }
}
