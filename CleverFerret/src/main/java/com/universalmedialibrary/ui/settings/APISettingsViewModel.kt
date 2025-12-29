package com.universalmedialibrary.ui.settings

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.data.settings.ImageGeneratorType
import com.universalmedialibrary.data.settings.ArtworkApiSettings
import com.universalmedialibrary.data.settings.LyricsApiSettings
import com.universalmedialibrary.services.gemini.GeminiService
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
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
    @ApplicationContext private val context: Context,
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
                val openaiKey = apiKeyRepository.getAPIKeyValue("openai")
                val comicVineKey = apiKeyRepository.getAPIKeyValue("comicvine")
                val tastediveKey = apiKeyRepository.getAPIKeyValue("tastedive")
                val tmdbKey = apiKeyRepository.getAPIKeyValue("tmdb")
                val musicBrainzKey = apiKeyRepository.getAPIKeyValue("musicbrainz")
                val googleBooksKey = apiKeyRepository.getAPIKeyValue("google_books")
                val openLibraryKey = apiKeyRepository.getAPIKeyValue("open_library")
                
                // New keys
                val goodreadsKey = apiKeyRepository.getAPIKeyValue("goodreads")
                val nytKey = apiKeyRepository.getAPIKeyValue("nyt")
                val tvdbKey = apiKeyRepository.getAPIKeyValue("tvdb")
                val omdbKey = apiKeyRepository.getAPIKeyValue("omdb")
                val discogsKey = apiKeyRepository.getAPIKeyValue("discogs_token")
                
                // Podcast
                val podcastIndexKey = apiKeyRepository.getAPIKeyValue("podcast_index")
                val itunesKey = apiKeyRepository.getAPIKeyValue("itunes")
                val listenNotesKey = apiKeyRepository.getAPIKeyValue("listen_notes")
                
                // Debug/Development
                val githubKey = apiKeyRepository.getAPIKeyValue("github_token")

                // TTS (if we migrate them to Repository, otherwise we might need TtsProviderManager injected here too)
                // For now, assuming they might be migrated or we just support the ones in repo.
                
                val imageGeneratorType = apiKeyRepository.getImageGeneratorType()

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    geminiApiKey = geminiKey,
                    openaiApiKey = openaiKey,
                    comicVineApiKey = comicVineKey,
                    tastediveApiKey = tastediveKey,
                    tmdbApiKey = tmdbKey,
                    musicBrainzApiKey = musicBrainzKey,
                    googleBooksApiKey = googleBooksKey,
                    openLibraryApiKey = openLibraryKey,
                    goodreadsApiKey = goodreadsKey,
                    nytApiKey = nytKey,
                    tvdbApiKey = tvdbKey,
                    omdbApiKey = omdbKey,
                    discogsApiKey = discogsKey,
                    podcastIndexApiKey = podcastIndexKey,
                    itunesApiKey = itunesKey,
                    listenNotesApiKey = listenNotesKey,
                    githubApiKey = githubKey,
                    
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
                    "goodreads" -> _uiState.value.copy(goodreadsApiKey = apiKey)
                    "nyt" -> _uiState.value.copy(nytApiKey = apiKey)
                    "tvdb" -> _uiState.value.copy(tvdbApiKey = apiKey)
                    "omdb" -> _uiState.value.copy(omdbApiKey = apiKey)
                    "discogs_token" -> _uiState.value.copy(discogsApiKey = apiKey)
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
     * Save GitHub API token for debug bug reporting
     * Stores both in database (via Repository) and SharedPreferences (for DebugBugReportUI access)
     */
    fun saveGitHubApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)
                
                // Save to database via repository
                apiKeyRepository.saveAPIKey("github_token", apiKey, "DEVELOPMENT", false)
                
                // Also save to SharedPreferences for DebugBugReportUI access
                // (since the UI reads synchronously without suspend function)
                context.getSharedPreferences("api_settings", Context.MODE_PRIVATE)
                    .edit()
                    .putString("github_token", apiKey)
                    .apply()
                
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    githubApiKey = apiKey,
                    statusMessage = "GitHub API token saved successfully",
                    hasError = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error saving GitHub token: ${e.message}",
                    hasError = true
                )
            }
        }
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

    /**
     * Save OpenAI/ChatGPT API key
     */
    fun saveOpenAIApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)

                apiKeyRepository.saveAPIKey("openai", apiKey, "AI", false)

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    openaiApiKey = apiKey,
                    statusMessage = "OpenAI API key saved successfully",
                    hasError = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error saving OpenAI key: ${e.message}",
                    hasError = true
                )
            }
        }
    }

    /**
     * Test OpenAI API key
     */
    fun testOpenAIApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)
                
                // Basic validation - OpenAI keys start with "sk-"
                val testResult = if (apiKey.startsWith("sk-") && apiKey.length > 20) {
                    "API key format looks valid. Save to test with actual API calls."
                } else {
                    "Invalid key format. OpenAI keys should start with 'sk-'"
                }

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    openaiTestResult = testResult
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    openaiTestResult = "Test failed: ${e.message}"
                )
            }
        }
    }

    /**
     * Update AI function settings
     */
    fun updateAIFunctionSettings(settings: AIFunctionSettings) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                aiFunctions = settings,
                statusMessage = "AI function settings updated",
                hasError = false
            )
        }
    }

    /**
     * Toggle individual AI function
     */
    fun toggleAIFunction(function: String, enabled: Boolean) {
        val currentSettings = _uiState.value.aiFunctions
        val newSettings = when (function) {
            "ocr" -> currentSettings.copy(ocrEnabled = enabled)
            "book_id" -> currentSettings.copy(bookIdentification = enabled)
            "summarization" -> currentSettings.copy(contentSummarization = enabled)
            "recommendations" -> currentSettings.copy(recommendations = enabled)
            "translation" -> currentSettings.copy(translation = enabled)
            "chat" -> currentSettings.copy(chatAssistant = enabled)
            else -> currentSettings
        }
        _uiState.value = _uiState.value.copy(
            aiFunctions = newSettings,
            statusMessage = "$function ${if (enabled) "enabled" else "disabled"}",
            hasError = false
        )
    }

    /**
     * Set preferred AI provider
     */
    fun setPreferredAIProvider(provider: AIProvider) {
        val currentSettings = _uiState.value.aiFunctions
        _uiState.value = _uiState.value.copy(
            aiFunctions = currentSettings.copy(preferredProvider = provider),
            statusMessage = "Using ${provider.displayName} as preferred AI provider",
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
    val openaiApiKey: String? = null,  // OpenAI/ChatGPT API key
    val comicVineApiKey: String? = null,
    val tastediveApiKey: String? = null,
    val tmdbApiKey: String? = null,
    val musicBrainzApiKey: String? = null,
    val googleBooksApiKey: String? = null,
    val openLibraryApiKey: String? = null,
    val goodreadsApiKey: String? = null,
    val nytApiKey: String? = null,
    val tvdbApiKey: String? = null,
    val omdbApiKey: String? = null,
    val discogsApiKey: String? = null,
    
    val podcastIndexApiKey: String? = null,
    val itunesApiKey: String? = null,
    val listenNotesApiKey: String? = null,
    
    val githubApiKey: String? = null,  // GitHub token for debug bug reports
    
    val geminiTestResult: String? = null,
    val openaiTestResult: String? = null,
    val imageGeneratorType: ImageGeneratorType = ImageGeneratorType.IMAGEN,
    val geminiEnabled: Boolean = true,
    val exoPlayerEnabled: Boolean = true,
    val podcastsEnabled: Boolean = true,
    val cloudTTSEnabled: Boolean = false,
    val statusMessage: String? = null,
    val hasError: Boolean = false,
    val artworkApis: ArtworkApiSettings = ArtworkApiSettings(),
    val lyricsApis: LyricsApiSettings = LyricsApiSettings(),
    
    // AI Function Controls - fine-grained control over which AI functions to use
    val aiFunctions: AIFunctionSettings = AIFunctionSettings()
)

/**
 * Settings for individual AI functions
 * Allows users to enable/disable specific AI capabilities
 */
data class AIFunctionSettings(
    val ocrEnabled: Boolean = true,              // OCR/Text extraction from images
    val bookIdentification: Boolean = true,      // Book identification and metadata
    val contentSummarization: Boolean = true,    // Summarize books/articles
    val recommendations: Boolean = true,         // AI-powered recommendations
    val translation: Boolean = false,            // Translate text (optional, uses quota)
    val chatAssistant: Boolean = false,          // AI chat assistant for queries
    val preferredProvider: AIProvider = AIProvider.GEMINI  // Which AI to use
)

/**
 * Available AI providers
 */
enum class AIProvider(val displayName: String) {
    GEMINI("Google Gemini"),
    OPENAI("OpenAI ChatGPT"),
    AUTO("Auto (Best Available)")
}
