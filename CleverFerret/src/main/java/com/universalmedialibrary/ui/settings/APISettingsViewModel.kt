package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.gemini.GeminiService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for API Settings Screen
 *
 * Manages:
 * - API key storage and validation
 * - Feature flag management
 * - Service testing and configuration
 */
@HiltViewModel
class APISettingsViewModel @Inject constructor(
    private val apiKeyRepository: APIKeyRepository,
    private val geminiService: GeminiService
) : ViewModel() {

    private val _uiState = MutableStateFlow(APISettingsUiState())
    val uiState: StateFlow<APISettingsUiState> = _uiState.asStateFlow()

    /**
     * Load current settings
     */
    fun loadSettings() {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)

                val geminiKey = apiKeyRepository.getGeminiApiKey()

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    geminiApiKey = geminiKey,
                    geminiEnabled = FeatureFlags.ENABLE_GEMINI,
                    exoPlayerEnabled = FeatureFlags.ENABLE_EXOPLAYER,
                    podcastsEnabled = FeatureFlags.ENABLE_PODCASTS,
                    cloudTTSEnabled = FeatureFlags.ENABLE_CLOUD_TTS
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error loading settings: ${e.message}",
                    hasError = true
                )
            }
        }
    }

    /**
     * Save Gemini API key
     */
    fun saveGeminiApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)

                apiKeyRepository.setGeminiApiKey(apiKey)

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    geminiApiKey = apiKey,
                    statusMessage = "Gemini API key saved successfully",
                    hasError = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error saving API key: ${e.message}",
                    hasError = true
                )
            }
        }
    }

    /**
     * Test Gemini API key
     */
    fun testGeminiApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)

                // Save key temporarily for testing
                val originalKey = apiKeyRepository.getGeminiApiKey()
                apiKeyRepository.setGeminiApiKey(apiKey)

                // Initialize and test the service
                val initialized = geminiService.initialize()

                val testResult = if (initialized) {
                    "API key test successful! Gemini service is ready."
                } else {
                    "API key test failed. Please check your key and try again."
                }

                // Restore original key if test failed
                if (!initialized && originalKey != null) {
                    apiKeyRepository.setGeminiApiKey(originalKey)
                }

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    geminiTestResult = testResult
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    geminiTestResult = "Test failed: ${e.message}"
                )
            }
        }
    }

    /**
     * Toggle Gemini feature
     */
    fun setGeminiEnabled(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(
            geminiEnabled = enabled,
            statusMessage = if (enabled) {
                "Gemini AI features enabled"
            } else {
                "Gemini AI features disabled"
            },
            hasError = false
        )
    }

    /**
     * Toggle ExoPlayer feature
     */
    fun setExoPlayerEnabled(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(
            exoPlayerEnabled = enabled,
            statusMessage = if (enabled) {
                "Advanced media player enabled"
            } else {
                "Advanced media player disabled"
            },
            hasError = false
        )
    }

    /**
     * Toggle Podcasts feature
     */
    fun setPodcastsEnabled(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(
            podcastsEnabled = enabled,
            statusMessage = if (enabled) {
                "Podcast features enabled"
            } else {
                "Podcast features disabled"
            },
            hasError = false
        )
    }

    /**
     * Toggle Cloud TTS feature
     */
    fun setCloudTTSEnabled(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(
            cloudTTSEnabled = enabled,
            statusMessage = if (enabled) {
                "Cloud Text-to-Speech enabled"
            } else {
                "Cloud Text-to-Speech disabled (using device TTS)"
            },
            hasError = false
        )
    }
}

/**
 * UI State for API Settings Screen
 */
data class APISettingsUiState(
    val isLoading: Boolean = false,
    val geminiApiKey: String? = null,
    val geminiTestResult: String? = null,
    val geminiEnabled: Boolean = true,
    val exoPlayerEnabled: Boolean = true,
    val podcastsEnabled: Boolean = true,
    val cloudTTSEnabled: Boolean = false,
    val statusMessage: String? = null,
    val hasError: Boolean = false
)
