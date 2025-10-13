package com.universalmedialibrary.ui.reader

import android.content.Context
import com.universalmedialibrary.services.tts.TextToSpeechService
import com.universalmedialibrary.services.tts.TtsProviderManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Enhanced Text-to-Speech Controller with Provider Support
 * 
 * This controller wraps the TTS service and provides a unified interface
 * for the UI layer while supporting multiple TTS providers.
 */
@Singleton
class EnhancedTtsController @Inject constructor(
    @ApplicationContext private val context: Context,
    private val ttsProviderManager: TtsProviderManager
) {
    private var currentService: TextToSpeechService? = null
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    private val _settings = MutableStateFlow(TtsSettings())
    val settings: StateFlow<TtsSettings> = _settings.asStateFlow()

    private val _playbackState = MutableStateFlow(TtsPlaybackState())
    val playbackState: StateFlow<TtsPlaybackState> = _playbackState.asStateFlow()

    private var currentText: String = ""
    private var sentences: List<String> = emptyList()
    private var currentSentenceIndex = 0

    /**
     * Initialize the TTS controller with the selected provider
     */
    suspend fun initialize(onInitialized: (Boolean) -> Unit) {
        _playbackState.value = _playbackState.value.copy(state = TtsState.INITIALIZING)

        try {
            // Get the active TTS service from the provider manager
            currentService = ttsProviderManager.getActiveService()
            
            val success = currentService?.initialize() ?: false
            
            if (success) {
                _playbackState.value = _playbackState.value.copy(state = TtsState.IDLE)
                onInitialized(true)
            } else {
                _playbackState.value = _playbackState.value.copy(
                    state = TtsState.ERROR,
                    errorMessage = "Failed to initialize TTS"
                )
                onInitialized(false)
            }
        } catch (e: Exception) {
            _playbackState.value = _playbackState.value.copy(
                state = TtsState.ERROR,
                errorMessage = "Error initializing TTS: ${e.message}"
            )
            onInitialized(false)
        }
    }

    /**
     * Load text for TTS
     */
    fun loadText(text: String) {
        if (_playbackState.value.state == TtsState.PLAYING) {
            stop()
        }

        currentText = text
        sentences = text.split(Regex("[.!?]+"))
            .map { it.trim() }
            .filter { it.isNotEmpty() }
        currentSentenceIndex = 0

        _playbackState.value = _playbackState.value.copy(
            totalSentences = sentences.size,
            currentSentenceIndex = 0,
            progress = 0f
        )
    }

    /**
     * Start or resume playback
     */
    fun play() {
        if (_playbackState.value.state == TtsState.PAUSED) {
            resume()
        } else {
            scope.launch {
                playSentence(currentSentenceIndex)
            }
        }
    }

    /**
     * Play a specific sentence
     */
    private suspend fun playSentence(index: Int) {
        if (index >= sentences.size) return

        currentSentenceIndex = index
        _playbackState.value = _playbackState.value.copy(
            state = TtsState.PLAYING,
            currentSentenceIndex = currentSentenceIndex,
            progress = if (sentences.isNotEmpty())
                currentSentenceIndex.toFloat() / sentences.size
            else 0f
        )

        val success = currentService?.speak(sentences[index]) ?: false
        
        if (success && index < sentences.size - 1) {
            // Continue to next sentence (avoid deep recursion)
            scope.launch { playSentence(index + 1) }
        } else if (index >= sentences.size - 1) {
            // Finished all sentences
            _playbackState.value = _playbackState.value.copy(
                state = TtsState.IDLE,
                progress = 1f
            )
        }
    }

    /**
     * Pause playback
     */
    fun pause() {
        currentService?.pause()
        _playbackState.value = _playbackState.value.copy(state = TtsState.PAUSED)
    }

    /**
     * Resume playback
     */
    fun resume() {
        // Use controller-managed playback restart instead of service.resume()
        scope.launch {
            playSentence(currentSentenceIndex)
        }
    }

    /**
     * Stop playback
     */
    fun stop() {
        currentService?.stop()
        currentSentenceIndex = 0
        _playbackState.value = _playbackState.value.copy(
            state = TtsState.IDLE,
            currentSentenceIndex = 0,
            progress = 0f
        )
    }

    /**
     * Skip to next sentence
     */
    fun skipForward() {
        if (currentSentenceIndex < sentences.size - 1) {
            scope.launch {
                playSentence(currentSentenceIndex + 1)
            }
        }
    }

    /**
     * Skip to previous sentence
     */
    fun skipBackward() {
        if (currentSentenceIndex > 0) {
            scope.launch {
                playSentence(currentSentenceIndex - 1)
            }
        }
    }

    /**
     * Seek to a specific sentence
     */
    fun seekTo(sentenceIndex: Int) {
        if (sentenceIndex in sentences.indices) {
            scope.launch {
                playSentence(sentenceIndex)
            }
        }
    }

    /**
     * Update TTS settings
     */
    fun updateSettings(newSettings: TtsSettings) {
        _settings.value = newSettings
        currentService?.setSpeechRate(newSettings.speed)
        currentService?.setPitch(newSettings.pitch)
    }

    /**
     * Get available voices
     */
    suspend fun getAvailableVoices(): List<String> {
        val languages = currentService?.getAvailableLanguages() ?: emptyList()
        return languages.map { it.displayName }
    }

    /**
     * Set voice
     */
    suspend fun setVoice(languageCode: String) {
        currentService?.setLanguage(languageCode)
        _settings.value = _settings.value.copy(voice = languageCode)
    }

    /**
     * Release resources
     */
    fun release() {
        currentService?.shutdown()
        currentService = null
    }

    /**
     * Reload the TTS service (useful when provider changes)
     */
    suspend fun reloadService() {
        currentService?.shutdown()
        initialize { success ->
            if (!success) {
                _playbackState.value = _playbackState.value.copy(
                    state = TtsState.ERROR,
                    errorMessage = "Failed to reload TTS service"
                )
            }
        }
    }
}
