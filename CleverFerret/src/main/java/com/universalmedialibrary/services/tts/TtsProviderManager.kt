package com.universalmedialibrary.services.tts

import android.content.Context
import android.content.SharedPreferences
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
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
        private const val API_KEY_PREFIX = "tts_api_key_"
        private const val MODEL_KEY_PREFIX = "tts_model_"
        private const val VOICE_ID_PREFIX = "tts_voice_id_"
        private const val ENCRYPTED_PREFS_NAME = "tts_encrypted_keys"
    }

    // Encrypted storage for API keys
    private val encryptedPrefs: SharedPreferences by lazy {
        val masterKey = MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()

        EncryptedSharedPreferences.create(
            context,
            ENCRYPTED_PREFS_NAME,
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
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
            model = preferences[stringPreferencesKey("$MODEL_KEY_PREFIX${provider.name}")],
            voiceId = preferences[stringPreferencesKey("$VOICE_ID_PREFIX${provider.name}")]
        ).apply {
            apiKey = getEncryptedApiKey(provider)
        }
    }

    /**
     * Get the active TTS service based on current provider
     */
    suspend fun getActiveService(): TextToSpeechService {
        val settings = providerSettings.first()
        
        return when (settings.provider) {
            TtsProvider.GEMINI -> {
                val apiKey = getEncryptedApiKey(settings.provider)
                if (apiKey.isNullOrBlank()) {
                    throw IllegalStateException("Gemini TTS requires an API key. Please configure it in settings.")
                }
                geminiTtsService.setApiKey(apiKey)
                geminiTtsService
            }
            TtsProvider.GOOGLE_CLOUD -> {
                // Future: Implement Google Cloud TTS service
                androidTtsService
            }
            TtsProvider.ELEVEN_LABS -> {
                // Future: Implement ElevenLabs TTS service
                androidTtsService
            }
            TtsProvider.OPENAI -> {
                // Future: Implement OpenAI TTS service
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
     * Set API key for a provider (encrypted storage)
     */
    suspend fun setApiKey(provider: TtsProvider, apiKey: String) {
        // Store encrypted API key (trim to avoid auth failures from whitespace)
        encryptedPrefs.edit().putString("$API_KEY_PREFIX${provider.name}", apiKey.trim()).apply()
    }

    /**
     * Get encrypted API key for a provider
     */
    private fun getEncryptedApiKey(provider: TtsProvider): String? {
        return encryptedPrefs.getString("$API_KEY_PREFIX${provider.name}", null)
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
        
        val apiKey = getEncryptedApiKey(provider)
        return !apiKey.isNullOrBlank()
    }
}
