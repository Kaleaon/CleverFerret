package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.data.settings.ImageGeneratorType
import com.universalmedialibrary.data.settings.ArtworkApiSettings
import com.universalmedialibrary.data.settings.LyricsApiSettings
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
                val comicVineKey = apiKeyRepository.getAPIKeyValue("comicvine")
                val tastediveKey = apiKeyRepository.getAPIKeyValue("tastedive")
                val tmdbKey = apiKeyRepository.getAPIKeyValue("tmdb")
                val musicBrainzKey = apiKeyRepository.getAPIKeyValue("musicbrainz")
                val googleBooksKey = apiKeyRepository.getAPIKeyValue("google_books")
                val openLibraryKey = apiKeyRepository.getAPIKeyValue("open_library")
                
                // Podcast
                val podcastIndexKey = apiKeyRepository.getAPIKeyValue("podcast_index")
                val itunesKey = apiKeyRepository.getAPIKeyValue("itunes")
                val listenNotesKey = apiKeyRepository.getAPIKeyValue("listen_notes")

                // TTS (if we migrate them to Repository, otherwise we might need TtsProviderManager injected here too)
                // For now, assuming they might be migrated or we just support the ones in repo.
                
                val imageGeneratorType = apiKeyRepository.getImageGeneratorType()

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    geminiApiKey = geminiKey,
                    comicVineApiKey = comicVineKey,
                    tastediveApiKey = tastediveKey,
                    tmdbApiKey = tmdbKey,
                    musicBrainzApiKey = musicBrainzKey,
                    googleBooksApiKey = googleBooksKey,
                    openLibraryApiKey = openLibraryKey,
                    podcastIndexApiKey = podcastIndexKey,
                    itunesApiKey = itunesKey,
                    listenNotesApiKey = listenNotesKey,
                    
                    imageGeneratorType = imageGeneratorType,
                    geminiEnabled = FeatureFlags.ENABLE_GEMINI,
                    exoPlayerEnabled = FeatureFlags.ENABLE_EXOPLAYER,
                    podcastsEnabled = FeatureFlags.ENABLE_PODCASTS,
                    cloudTTSEnabled = FeatureFlags.ENABLE_CLOUD_TTS,
                    artworkApis = _uiState.value.artworkApis,
                    lyricsApis = _uiState.value.lyricsApis
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

    fun saveArtworkApis(settings: ArtworkApiSettings) {
        _uiState.value = _uiState.value.copy(statusMessage = "Artwork API settings saved", hasError = false, artworkApis = settings)
    }

    fun saveLyricsApis(settings: LyricsApiSettings) {
        _uiState.value = _uiState.value.copy(statusMessage = "Lyrics API settings saved", hasError = false, lyricsApis = settings)
    }

    fun saveApiKey(provider: String, apiKey: String, category: String, displayName: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)
                
                apiKeyRepository.saveAPIKey(provider, apiKey, category, false)
                
                // Update local state map or individual fields
                _uiState.value = when(provider) {
                    "comicvine" -> _uiState.value.copy(comicVineApiKey = apiKey)
                    "tastedive" -> _uiState.value.copy(tastediveApiKey = apiKey)
                    "tmdb" -> _uiState.value.copy(tmdbApiKey = apiKey)
                    "musicbrainz" -> _uiState.value.copy(musicBrainzApiKey = apiKey)
                    "google_books" -> _uiState.value.copy(googleBooksApiKey = apiKey)
                    "open_library" -> _uiState.value.copy(openLibraryApiKey = apiKey)
                    "podcast_index" -> _uiState.value.copy(podcastIndexApiKey = apiKey)
                    "itunes" -> _uiState.value.copy(itunesApiKey = apiKey)
                    "listen_notes" -> _uiState.value.copy(listenNotesApiKey = apiKey)
                    else -> _uiState.value
                }

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "$displayName API key saved successfully",
                    hasError = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error saving $displayName key: ${e.message}",
                    hasError = true
                )
            }
        }
    }

    fun saveComicVineApiKey(apiKey: String) {
        saveApiKey("comicvine", apiKey, "COMICS_MANGA", "ComicVine")
    }
    
    fun saveTasteDiveApiKey(apiKey: String) {
        saveApiKey("tastedive", apiKey, "RECOMMENDATIONS", "TasteDive")
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

    /**
     * Update image generator type selection
     */
    fun updateImageGeneratorType(type: ImageGeneratorType) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)

                apiKeyRepository.saveImageGeneratorType(type)

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    imageGeneratorType = type,
                    statusMessage = when (type) {
                        ImageGeneratorType.IMAGEN -> "Using Gemini Imagen (Dedicated) for image generation"
                        ImageGeneratorType.GEMINI_BUILTIN -> "Using Gemini Built-in for image generation"
                    },
                    hasError = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error saving image generator type: ${e.message}",
                    hasError = true
                )
            }
        }
    }
}

/**
 * UI State for API Settings Screen
 */
data class APISettingsUiState(
    val isLoading: Boolean = false,
    val geminiApiKey: String? = null,
    val comicVineApiKey: String? = null,
    val tastediveApiKey: String? = null,
    val tmdbApiKey: String? = null,
    val musicBrainzApiKey: String? = null,
    val googleBooksApiKey: String? = null,
    val openLibraryApiKey: String? = null,
    val podcastIndexApiKey: String? = null,
    val itunesApiKey: String? = null,
    val listenNotesApiKey: String? = null,
    
    val geminiTestResult: String? = null,
    val imageGeneratorType: ImageGeneratorType = ImageGeneratorType.IMAGEN,
    val geminiEnabled: Boolean = true,
    val exoPlayerEnabled: Boolean = true,
    val podcastsEnabled: Boolean = true,
    val cloudTTSEnabled: Boolean = false,
    val statusMessage: String? = null,
    val hasError: Boolean = false
    ,
    val artworkApis: ArtworkApiSettings = ArtworkApiSettings(),
    val lyricsApis: LyricsApiSettings = LyricsApiSettings()
)
