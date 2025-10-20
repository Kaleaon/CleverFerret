package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.tts.TtsProvider
import com.universalmedialibrary.services.tts.TtsProviderManager
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ApiSettingsViewModel @Inject constructor(
    private val ttsProviderManager: TtsProviderManager
) : ViewModel() {

    private val _uiState = MutableStateFlow(ApiSettingsUiState())
    val uiState: StateFlow<ApiSettingsUiState> = _uiState.asStateFlow()

    init {
        loadApiKeys()
    }

    private fun loadApiKeys() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isGeminiConfigured = ttsProviderManager.isProviderConfigured(TtsProvider.GEMINI),
                isOpenAiConfigured = ttsProviderManager.isProviderConfigured(TtsProvider.OPENAI),
                isElevenLabsConfigured = ttsProviderManager.isProviderConfigured(TtsProvider.ELEVEN_LABS),
                isGoogleCloudConfigured = ttsProviderManager.isProviderConfigured(TtsProvider.GOOGLE_CLOUD)
            )
        }
    }

    fun setGeminiApiKey(apiKey: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(geminiApiKey = apiKey)
            if (apiKey.isNotBlank()) {
                ttsProviderManager.setApiKey(TtsProvider.GEMINI, apiKey)
                _uiState.value = _uiState.value.copy(
                    isGeminiConfigured = true,
                    saveSuccess = true
                )
            }
        }
    }

    fun setOpenAiApiKey(apiKey: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(openaiApiKey = apiKey)
            if (apiKey.isNotBlank()) {
                ttsProviderManager.setApiKey(TtsProvider.OPENAI, apiKey)
                _uiState.value = _uiState.value.copy(
                    isOpenAiConfigured = true,
                    saveSuccess = true
                )
            }
        }
    }

    fun setElevenLabsApiKey(apiKey: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(elevenLabsApiKey = apiKey)
            if (apiKey.isNotBlank()) {
                ttsProviderManager.setApiKey(TtsProvider.ELEVEN_LABS, apiKey)
                _uiState.value = _uiState.value.copy(
                    isElevenLabsConfigured = true,
                    saveSuccess = true
                )
            }
        }
    }

    fun setGoogleCloudApiKey(apiKey: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(googleCloudApiKey = apiKey)
            if (apiKey.isNotBlank()) {
                ttsProviderManager.setApiKey(TtsProvider.GOOGLE_CLOUD, apiKey)
                _uiState.value = _uiState.value.copy(
                    isGoogleCloudConfigured = true,
                    saveSuccess = true
                )
            }
        }
    }
}

data class ApiSettingsUiState(
    val geminiApiKey: String = "",
    val openaiApiKey: String = "",
    val elevenLabsApiKey: String = "",
    val googleCloudApiKey: String = "",
    val isGeminiConfigured: Boolean = false,
    val isOpenAiConfigured: Boolean = false,
    val isElevenLabsConfigured: Boolean = false,
    val isGoogleCloudConfigured: Boolean = false,
    val saveSuccess: Boolean = false
)
