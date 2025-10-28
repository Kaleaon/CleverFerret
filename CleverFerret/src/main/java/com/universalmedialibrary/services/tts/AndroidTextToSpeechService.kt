package com.universalmedialibrary.services.tts

import android.content.Context
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.withContext
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.coroutines.resume

/**
 * Android TextToSpeech implementation of the unified TTS interface
 *
 * Uses Android's built-in TextToSpeech engine for offline speech synthesis
 */
@Singleton
class AndroidTextToSpeechService @Inject constructor(
    @ApplicationContext private val context: Context
) : TextToSpeechService {

    private var tts: TextToSpeech? = null
    private val _ttsState = MutableStateFlow(TtsServiceState())
    override val ttsState: StateFlow<TtsServiceState> = _ttsState.asStateFlow()

    // Use a properly scoped coroutine scope instead of GlobalScope to prevent memory leaks
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    private var currentUtteranceId = 0

    override suspend fun initialize(): Boolean = withContext(Dispatchers.Main) {
        suspendCancellableCoroutine { continuation ->
            _ttsState.value = _ttsState.value.copy(error = null)

            tts = TextToSpeech(context) { status ->
                when (status) {
                    TextToSpeech.SUCCESS -> {
                        setupTtsListener()
                        _ttsState.value = _ttsState.value.copy(
                            isInitialized = true,
                            error = null
                        )
                        continuation.resume(true)
                    }
                    else -> {
                        _ttsState.value = _ttsState.value.copy(
                            isInitialized = false,
                            error = "Failed to initialize TextToSpeech"
                        )
                        continuation.resume(false)
                    }
                }
            }

            continuation.invokeOnCancellation {
                tts?.shutdown()
            }
        }
    }

    private fun setupTtsListener() {
        tts?.setOnUtteranceProgressListener(object : UtteranceProgressListener() {
            override fun onStart(utteranceId: String?) {
                _ttsState.value = _ttsState.value.copy(
                    isPlaying = true,
                    isPaused = false
                )
            }

            override fun onDone(utteranceId: String?) {
                _ttsState.value = _ttsState.value.copy(
                    isPlaying = false,
                    isPaused = false,
                    currentText = ""
                )
            }

            override fun onError(utteranceId: String?) {
                _ttsState.value = _ttsState.value.copy(
                    isPlaying = false,
                    isPaused = false,
                    error = "TTS playback error"
                )
            }
        })
    }

    override suspend fun speak(text: String): Boolean = withContext(Dispatchers.Main) {
        val ttsEngine = tts
        if (ttsEngine == null || !_ttsState.value.isInitialized) {
            return@withContext false
        }

        currentUtteranceId++
        val utteranceId = "utterance_$currentUtteranceId"

        _ttsState.value = _ttsState.value.copy(
            currentText = text,
            error = null
        )

        val result = ttsEngine.speak(text, TextToSpeech.QUEUE_FLUSH, null, utteranceId)
        result == TextToSpeech.SUCCESS
    }

    override fun pause() {
        // Android TTS doesn't support pause/resume, so we stop instead
        stop()
        _ttsState.value = _ttsState.value.copy(isPaused = true)
    }

    override fun resume() {
        // For Android TTS, we would need to re-speak from where we left off
        // This is a limitation of the Android TTS API
        val currentText = _ttsState.value.currentText
        if (currentText.isNotEmpty() && _ttsState.value.isPaused) {
            serviceScope.launch {
                speak(currentText)
            }
        }
    }

    override fun stop() {
        tts?.stop()
        _ttsState.value = _ttsState.value.copy(
            isPlaying = false,
            isPaused = false,
            currentText = ""
        )
    }

    override fun setSpeechRate(rate: Float) {
        val clampedRate = rate.coerceIn(0.1f, 3.0f)
        tts?.setSpeechRate(clampedRate)
        _ttsState.value = _ttsState.value.copy(speechRate = clampedRate)
    }

    override fun setPitch(pitch: Float) {
        val clampedPitch = pitch.coerceIn(0.5f, 2.0f)
        tts?.setPitch(clampedPitch)
        _ttsState.value = _ttsState.value.copy(pitch = clampedPitch)
    }

    override suspend fun getAvailableLanguages(): List<TtsLanguage> = withContext(Dispatchers.IO) {
        val ttsEngine = tts ?: return@withContext emptyList()

        val availableLanguages = mutableListOf<TtsLanguage>()

        // Common languages to check
        val languagesToCheck = listOf(
            Locale.ENGLISH to "English",
            Locale("es", "ES") to "Spanish",
            Locale.FRENCH to "French",
            Locale.GERMAN to "German",
            Locale.ITALIAN to "Italian",
            Locale("pt", "PT") to "Portuguese",
            Locale.CHINESE to "Chinese",
            Locale.JAPANESE to "Japanese",
            Locale.KOREAN to "Korean"
        )

        for ((locale, displayName) in languagesToCheck) {
            val availability = ttsEngine.isLanguageAvailable(locale)
            if (availability >= TextToSpeech.LANG_AVAILABLE) {
                availableLanguages.add(
                    TtsLanguage(
                        code = locale.toString(),
                        displayName = displayName,
                        isAvailable = true
                    )
                )
            }
        }

        availableLanguages
    }

    override suspend fun setLanguage(language: String): Boolean = withContext(Dispatchers.Main) {
        val ttsEngine = tts ?: return@withContext false

        try {
            val locale = if (language.contains("_")) {
                val parts = language.split("_")
                Locale(parts[0], parts[1])
            } else {
                Locale(language)
            }

            val result = ttsEngine.setLanguage(locale)
            val success = result >= TextToSpeech.LANG_AVAILABLE

            if (success) {
                _ttsState.value = _ttsState.value.copy(
                    currentLanguage = language,
                    error = null
                )
            } else {
                _ttsState.value = _ttsState.value.copy(
                    error = "Language not available: $language"
                )
            }

            success
        } catch (e: Exception) {
            _ttsState.value = _ttsState.value.copy(
                error = "Error setting language: ${e.message}"
            )
            false
        }
    }

    override fun isAvailable(): Boolean {
        return try {
            // Check if TTS data is installed
            val intent = android.content.Intent(TextToSpeech.Engine.ACTION_CHECK_TTS_DATA)
            val activities = context.packageManager.queryIntentActivities(intent, 0)
            activities.isNotEmpty()
        } catch (e: Exception) {
            false
        }
    }

    override fun shutdown() {
        tts?.shutdown()
        tts = null
        _ttsState.value = TtsServiceState()
    }
}

/**
 * Extension function to extract clean text from HTML content
 */
fun String.extractTextFromHtml(): String {
    return this
        .replace(Regex("<[^>]*>"), "") // Remove HTML tags
        .replace(Regex("&[^;]*;"), " ") // Remove HTML entities
        .replace(Regex("\\s+"), " ") // Normalize whitespace
        .trim()
}
