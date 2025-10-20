package com.universalmedialibrary.ui.settings

import android.content.Context
import android.content.SharedPreferences
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import com.universalmedialibrary.data.services.SettingsBackupService
import com.universalmedialibrary.services.tts.TtsProvider
import com.universalmedialibrary.services.tts.TtsProviderManager
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ApiSettingsViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val ttsProviderManager: TtsProviderManager,
    private val backupService: SettingsBackupService
) : ViewModel() {

    private val _uiState = MutableStateFlow(ApiSettingsUiState())
    val uiState: StateFlow<ApiSettingsUiState> = _uiState.asStateFlow()

    private val encryptedPrefs: SharedPreferences by lazy {
        val masterKey = MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()

        EncryptedSharedPreferences.create(
            context,
            "api_keys_encrypted",
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
    }

    init {
        loadApiKeys()
    }

    private fun loadApiKeys() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                // TTS
                isGeminiConfigured = ttsProviderManager.isProviderConfigured(TtsProvider.GEMINI),
                isOpenAiConfigured = ttsProviderManager.isProviderConfigured(TtsProvider.OPENAI),
                isElevenLabsConfigured = ttsProviderManager.isProviderConfigured(TtsProvider.ELEVEN_LABS),
                isGoogleCloudConfigured = ttsProviderManager.isProviderConfigured(TtsProvider.GOOGLE_CLOUD),
                // Metadata
                isTmdbConfigured = !getApiKey("tmdb").isNullOrBlank(),
                isMusicBrainzConfigured = !getApiKey("musicbrainz").isNullOrBlank(),
                isGoogleBooksConfigured = !getApiKey("google_books").isNullOrBlank(),
                isOpenLibraryConfigured = !getApiKey("open_library").isNullOrBlank(),
                // Podcasts
                isPodcastIndexConfigured = !getApiKey("podcast_index").isNullOrBlank(),
                isItunesConfigured = !getApiKey("itunes").isNullOrBlank(),
                isListenNotesConfigured = !getApiKey("listen_notes").isNullOrBlank()
            )
        }
    }

    private fun saveApiKey(key: String, value: String) {
        encryptedPrefs.edit().putString(key, value.trim()).apply()
    }

    private fun getApiKey(key: String): String? {
        return encryptedPrefs.getString(key, null)
    }

    // === TTS API KEYS ===
    
    fun setGeminiApiKey(apiKey: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(geminiApiKey = apiKey)
            if (apiKey.isNotBlank()) {
                ttsProviderManager.setApiKey(TtsProvider.GEMINI, apiKey)
                _uiState.value = _uiState.value.copy(isGeminiConfigured = true, saveSuccess = true)
            }
        }
    }

    fun setOpenAiApiKey(apiKey: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(openaiApiKey = apiKey)
            if (apiKey.isNotBlank()) {
                ttsProviderManager.setApiKey(TtsProvider.OPENAI, apiKey)
                _uiState.value = _uiState.value.copy(isOpenAiConfigured = true, saveSuccess = true)
            }
        }
    }

    fun setElevenLabsApiKey(apiKey: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(elevenLabsApiKey = apiKey)
            if (apiKey.isNotBlank()) {
                ttsProviderManager.setApiKey(TtsProvider.ELEVEN_LABS, apiKey)
                _uiState.value = _uiState.value.copy(isElevenLabsConfigured = true, saveSuccess = true)
            }
        }
    }

    fun setGoogleCloudApiKey(apiKey: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(googleCloudApiKey = apiKey)
            if (apiKey.isNotBlank()) {
                ttsProviderManager.setApiKey(TtsProvider.GOOGLE_CLOUD, apiKey)
                _uiState.value = _uiState.value.copy(isGoogleCloudConfigured = true, saveSuccess = true)
            }
        }
    }

    // === METADATA API KEYS ===
    
    fun setTmdbApiKey(apiKey: String) {
        viewModelScope.launch {
            val trimmed = apiKey.trim()
            _uiState.value = _uiState.value.copy(tmdbApiKey = trimmed)
            
            if (trimmed.isNotBlank()) {
                saveApiKey("tmdb", trimmed)
                _uiState.value = _uiState.value.copy(isTmdbConfigured = true, saveSuccess = true)
            } else {
                // Clear key from storage
                encryptedPrefs.edit().remove("tmdb").apply()
                _uiState.value = _uiState.value.copy(isTmdbConfigured = false, saveSuccess = true)
            }
        }
    }

    fun setMusicBrainzApiKey(apiKey: String) {
        viewModelScope.launch {
            val trimmed = apiKey.trim()
            _uiState.value = _uiState.value.copy(musicBrainzApiKey = trimmed)
            
            if (trimmed.isNotBlank()) {
                saveApiKey("musicbrainz", trimmed)
                _uiState.value = _uiState.value.copy(isMusicBrainzConfigured = true, saveSuccess = true)
            } else {
                // Clear key from storage
                encryptedPrefs.edit().remove("musicbrainz").apply()
                _uiState.value = _uiState.value.copy(isMusicBrainzConfigured = false, saveSuccess = true)
            }
        }
    }

    fun setGoogleBooksApiKey(apiKey: String) {
        viewModelScope.launch {
            val trimmed = apiKey.trim()
            _uiState.value = _uiState.value.copy(googleBooksApiKey = trimmed)
            
            if (trimmed.isNotBlank()) {
                saveApiKey("google_books", trimmed)
                _uiState.value = _uiState.value.copy(isGoogleBooksConfigured = true, saveSuccess = true)
            } else {
                // Clear key from storage
                encryptedPrefs.edit().remove("google_books").apply()
                _uiState.value = _uiState.value.copy(isGoogleBooksConfigured = false, saveSuccess = true)
            }
        }
    }

    fun setOpenLibraryApiKey(apiKey: String) {
        viewModelScope.launch {
            val trimmed = apiKey.trim()
            _uiState.value = _uiState.value.copy(openLibraryApiKey = trimmed)
            
            if (trimmed.isNotBlank()) {
                saveApiKey("open_library", trimmed)
                _uiState.value = _uiState.value.copy(isOpenLibraryConfigured = true, saveSuccess = true)
            } else {
                // Clear key from storage
                encryptedPrefs.edit().remove("open_library").apply()
                _uiState.value = _uiState.value.copy(isOpenLibraryConfigured = false, saveSuccess = true)
            }
        }
    }

    // === PODCAST API KEYS ===
    
    fun setPodcastIndexApiKey(apiKey: String) {
        viewModelScope.launch {
            val trimmed = apiKey.trim()
            _uiState.value = _uiState.value.copy(podcastIndexApiKey = trimmed)
            
            if (trimmed.isNotBlank()) {
                saveApiKey("podcast_index", trimmed)
                _uiState.value = _uiState.value.copy(isPodcastIndexConfigured = true, saveSuccess = true)
            } else {
                // Clear key from storage
                encryptedPrefs.edit().remove("podcast_index").apply()
                _uiState.value = _uiState.value.copy(isPodcastIndexConfigured = false, saveSuccess = true)
            }
        }
    }

    fun setItunesApiKey(apiKey: String) {
        viewModelScope.launch {
            val trimmed = apiKey.trim()
            _uiState.value = _uiState.value.copy(itunesApiKey = trimmed)
            
            if (trimmed.isNotBlank()) {
                saveApiKey("itunes", trimmed)
                _uiState.value = _uiState.value.copy(isItunesConfigured = true, saveSuccess = true)
            } else {
                // Clear key from storage
                encryptedPrefs.edit().remove("itunes").apply()
                _uiState.value = _uiState.value.copy(isItunesConfigured = false, saveSuccess = true)
            }
        }
    }

    fun setListenNotesApiKey(apiKey: String) {
        viewModelScope.launch {
            val trimmed = apiKey.trim()
            _uiState.value = _uiState.value.copy(listenNotesApiKey = trimmed)
            
            if (trimmed.isNotBlank()) {
                saveApiKey("listen_notes", trimmed)
                _uiState.value = _uiState.value.copy(isListenNotesConfigured = true, saveSuccess = true)
            } else {
                // Clear key from storage
                encryptedPrefs.edit().remove("listen_notes").apply()
                _uiState.value = _uiState.value.copy(isListenNotesConfigured = false, saveSuccess = true)
            }
        }
    }
    
    /**
     * Get stored API key for external use
     */
    fun getStoredApiKey(service: String): String? {
        return getApiKey(service)
    }
    
    /**
     * Backup all settings to storage
     */
    fun backupSettings() {
        viewModelScope.launch {
            try {
                val result = backupService.exportToStorage()
                result.onSuccess { file ->
                    _uiState.value = _uiState.value.copy(
                        backupSuccess = true,
                        backupMessage = "Settings backed up to ${file.name}"
                    )
                }.onFailure { error ->
                    _uiState.value = _uiState.value.copy(
                        backupSuccess = false,
                        backupMessage = "Backup failed: ${error.message}"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    backupSuccess = false,
                    backupMessage = "Backup error: ${e.message}"
                )
            }
        }
    }
    
    /**
     * Restore settings from backup
     */
    fun restoreSettings() {
        // This would typically show a file picker
        // For now, just show a message
        _uiState.value = _uiState.value.copy(
            backupMessage = "Use file picker to select backup file"
        )
    }
}

data class ApiSettingsUiState(
    // TTS APIs
    val geminiApiKey: String = "",
    val openaiApiKey: String = "",
    val elevenLabsApiKey: String = "",
    val googleCloudApiKey: String = "",
    val isGeminiConfigured: Boolean = false,
    val isOpenAiConfigured: Boolean = false,
    val isElevenLabsConfigured: Boolean = false,
    val isGoogleCloudConfigured: Boolean = false,
    
    // Metadata APIs
    val tmdbApiKey: String = "",
    val musicBrainzApiKey: String = "",
    val googleBooksApiKey: String = "",
    val openLibraryApiKey: String = "",
    val isTmdbConfigured: Boolean = false,
    val isMusicBrainzConfigured: Boolean = false,
    val isGoogleBooksConfigured: Boolean = false,
    val isOpenLibraryConfigured: Boolean = false,
    
    // Podcast APIs
    val podcastIndexApiKey: String = "",
    val itunesApiKey: String = "",
    val listenNotesApiKey: String = "",
    val isPodcastIndexConfigured: Boolean = false,
    val isItunesConfigured: Boolean = false,
    val isListenNotesConfigured: Boolean = false,
    
    // General
    val saveSuccess: Boolean = false,
    val backupSuccess: Boolean = false,
    val backupMessage: String? = null
)
