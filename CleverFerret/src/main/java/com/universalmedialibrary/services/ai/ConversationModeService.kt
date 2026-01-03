package com.universalmedialibrary.services.ai

import android.content.Context
import android.content.Intent
import android.media.AudioManager
import android.os.Bundle
import android.speech.RecognitionListener
import android.speech.RecognizerIntent
import android.speech.SpeechRecognizer
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.callbackFlow
import java.util.Locale
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Conversation Mode Service - Voice input and TTS output for AI chat
 * 
 * Inspired by oxproxion's Conversation Mode feature, this service enables:
 * - Voice-to-text input using Android's SpeechRecognizer
 * - Text-to-speech output for AI responses
 * - Continuous conversation flow (speak → AI responds → auto-listen)
 * - Customizable voice settings
 * 
 * Perfect for hands-free reading assistance, audiobook discussions,
 * and accessibility features.
 */
@Singleton
class ConversationModeService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private const val TAG = "ConversationModeService"
    }

    private var speechRecognizer: SpeechRecognizer? = null
    private var textToSpeech: TextToSpeech? = null
    private var audioManager: AudioManager? = null

    private val _isListening = MutableStateFlow(false)
    val isListening: StateFlow<Boolean> = _isListening.asStateFlow()

    private val _isSpeaking = MutableStateFlow(false)
    val isSpeaking: StateFlow<Boolean> = _isSpeaking.asStateFlow()

    private val _conversationModeActive = MutableStateFlow(false)
    val conversationModeActive: StateFlow<Boolean> = _conversationModeActive.asStateFlow()

    private val _currentState = MutableStateFlow<ConversationState>(ConversationState.Idle)
    val currentState: StateFlow<ConversationState> = _currentState.asStateFlow()

    private var ttsInitialized = false
    private var autoListenAfterSpeech = false
    private var onSpeechResult: ((String) -> Unit)? = null

    // Voice settings
    private var speechRate: Float = 1.0f
    private var speechPitch: Float = 1.0f
    private var preferredLocale: Locale = Locale.getDefault()

    /**
     * Initialize the conversation mode services
     */
    fun initialize() {
        audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager

        // Initialize TTS
        textToSpeech = TextToSpeech(context) { status ->
            if (status == TextToSpeech.SUCCESS) {
                ttsInitialized = true
                textToSpeech?.language = preferredLocale
                textToSpeech?.setSpeechRate(speechRate)
                textToSpeech?.setPitch(speechPitch)
                
                textToSpeech?.setOnUtteranceProgressListener(object : UtteranceProgressListener() {
                    override fun onStart(utteranceId: String?) {
                        _isSpeaking.value = true
                        _currentState.value = ConversationState.Speaking
                    }

                    override fun onDone(utteranceId: String?) {
                        _isSpeaking.value = false
                        if (autoListenAfterSpeech && _conversationModeActive.value) {
                            startListening()
                        } else {
                            _currentState.value = ConversationState.Idle
                        }
                    }

                    @Deprecated("Deprecated in Java")
                    override fun onError(utteranceId: String?) {
                        _isSpeaking.value = false
                        _currentState.value = ConversationState.Error("TTS error occurred")
                    }
                })
                
                Log.d(TAG, "TTS initialized successfully")
            } else {
                Log.e(TAG, "TTS initialization failed with status: $status")
                _currentState.value = ConversationState.Error("TTS initialization failed")
            }
        }

        // Initialize Speech Recognizer
        if (SpeechRecognizer.isRecognitionAvailable(context)) {
            speechRecognizer = SpeechRecognizer.createSpeechRecognizer(context)
            Log.d(TAG, "Speech recognizer initialized")
        } else {
            Log.e(TAG, "Speech recognition not available")
            _currentState.value = ConversationState.Error("Speech recognition not available")
        }
    }

    /**
     * Start conversation mode - enables continuous voice interaction
     */
    fun startConversationMode(
        autoListen: Boolean = true,
        onResult: (String) -> Unit
    ) {
        _conversationModeActive.value = true
        autoListenAfterSpeech = autoListen
        onSpeechResult = onResult
        _currentState.value = ConversationState.Ready
        
        Log.d(TAG, "Conversation mode started")
    }

    /**
     * Stop conversation mode
     */
    fun stopConversationMode() {
        _conversationModeActive.value = false
        autoListenAfterSpeech = false
        onSpeechResult = null
        stopListening()
        stopSpeaking()
        _currentState.value = ConversationState.Idle
        
        Log.d(TAG, "Conversation mode stopped")
    }

    /**
     * Start listening for voice input
     */
    fun startListening(): Flow<SpeechResult> = callbackFlow {
        if (speechRecognizer == null) {
            trySend(SpeechResult.Error("Speech recognizer not initialized"))
            close()
            return@callbackFlow
        }

        if (_isSpeaking.value) {
            stopSpeaking()
        }

        _isListening.value = true
        _currentState.value = ConversationState.Listening

        val intent = Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH).apply {
            putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
            putExtra(RecognizerIntent.EXTRA_LANGUAGE, preferredLocale.toLanguageTag())
            putExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS, true)
            putExtra(RecognizerIntent.EXTRA_MAX_RESULTS, 1)
        }

        speechRecognizer?.setRecognitionListener(object : RecognitionListener {
            override fun onReadyForSpeech(params: Bundle?) {
                trySend(SpeechResult.Ready)
            }

            override fun onBeginningOfSpeech() {
                trySend(SpeechResult.Started)
            }

            override fun onRmsChanged(rmsdB: Float) {
                // Audio level changed - could be used for visual feedback
                trySend(SpeechResult.AudioLevel(rmsdB))
            }

            override fun onBufferReceived(buffer: ByteArray?) {}

            override fun onEndOfSpeech() {
                _isListening.value = false
                _currentState.value = ConversationState.Processing
            }

            override fun onError(error: Int) {
                _isListening.value = false
                val errorMessage = when (error) {
                    SpeechRecognizer.ERROR_AUDIO -> "Audio recording error"
                    SpeechRecognizer.ERROR_CLIENT -> "Client side error"
                    SpeechRecognizer.ERROR_INSUFFICIENT_PERMISSIONS -> "Insufficient permissions"
                    SpeechRecognizer.ERROR_NETWORK -> "Network error"
                    SpeechRecognizer.ERROR_NETWORK_TIMEOUT -> "Network timeout"
                    SpeechRecognizer.ERROR_NO_MATCH -> "No speech detected"
                    SpeechRecognizer.ERROR_RECOGNIZER_BUSY -> "Recognition service busy"
                    SpeechRecognizer.ERROR_SERVER -> "Server error"
                    SpeechRecognizer.ERROR_SPEECH_TIMEOUT -> "Speech timeout"
                    else -> "Unknown error"
                }
                
                _currentState.value = ConversationState.Error(errorMessage)
                trySend(SpeechResult.Error(errorMessage))
                
                // Auto-restart listening if in conversation mode and it's a minor error
                if (_conversationModeActive.value && 
                    error in listOf(SpeechRecognizer.ERROR_NO_MATCH, SpeechRecognizer.ERROR_SPEECH_TIMEOUT)) {
                    _currentState.value = ConversationState.Ready
                }
            }

            override fun onResults(results: Bundle?) {
                val matches = results?.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION)
                val text = matches?.firstOrNull()
                
                if (!text.isNullOrBlank()) {
                    _currentState.value = ConversationState.RecognizedText(text)
                    trySend(SpeechResult.FinalResult(text))
                    onSpeechResult?.invoke(text)
                } else {
                    _currentState.value = ConversationState.Ready
                    trySend(SpeechResult.Error("No speech recognized"))
                }
            }

            override fun onPartialResults(partialResults: Bundle?) {
                val matches = partialResults?.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION)
                val text = matches?.firstOrNull()
                if (!text.isNullOrBlank()) {
                    trySend(SpeechResult.PartialResult(text))
                }
            }

            override fun onEvent(eventType: Int, params: Bundle?) {}
        })

        speechRecognizer?.startListening(intent)

        awaitClose {
            speechRecognizer?.stopListening()
            _isListening.value = false
        }
    }

    /**
     * Stop listening for voice input
     */
    fun stopListening() {
        speechRecognizer?.stopListening()
        _isListening.value = false
        if (_currentState.value is ConversationState.Listening) {
            _currentState.value = ConversationState.Idle
        }
    }

    /**
     * Speak text using TTS
     */
    fun speak(text: String, queueMode: Int = TextToSpeech.QUEUE_FLUSH): Boolean {
        if (!ttsInitialized || textToSpeech == null) {
            Log.e(TAG, "TTS not initialized")
            return false
        }

        // Stop listening while speaking
        if (_isListening.value) {
            stopListening()
        }

        val utteranceId = UUID.randomUUID().toString()
        val params = Bundle().apply {
            putString(TextToSpeech.Engine.KEY_PARAM_UTTERANCE_ID, utteranceId)
        }

        textToSpeech?.speak(text, queueMode, params, utteranceId)
        return true
    }

    /**
     * Speak AI response with optimizations for voice output
     */
    fun speakAIResponse(text: String) {
        // Clean up text for better speech output
        val cleanedText = text
            .replace(Regex("```[\\s\\S]*?```"), "Code block omitted.") // Remove code blocks
            .replace(Regex("\\[.*?\\]\\(.*?\\)"), "") // Remove markdown links
            .replace(Regex("#{1,6}\\s"), "") // Remove markdown headers
            .replace(Regex("\\*{1,2}(.*?)\\*{1,2}"), "$1") // Remove bold/italic
            .replace(Regex("`(.*?)`"), "$1") // Remove inline code
            .replace(Regex("•|\\-\\s"), ", ") // Convert bullet points
            .replace(Regex("\\n{2,}"), ". ") // Convert multiple newlines
            .replace(Regex("\\n"), " ") // Convert single newlines
            .trim()

        speak(cleanedText)
    }

    /**
     * Stop speaking
     */
    fun stopSpeaking() {
        textToSpeech?.stop()
        _isSpeaking.value = false
        if (_currentState.value is ConversationState.Speaking) {
            _currentState.value = ConversationState.Idle
        }
    }

    /**
     * Set voice settings
     */
    fun setVoiceSettings(
        rate: Float = speechRate,
        pitch: Float = speechPitch,
        locale: Locale = preferredLocale
    ) {
        speechRate = rate.coerceIn(0.5f, 2.0f)
        speechPitch = pitch.coerceIn(0.5f, 2.0f)
        preferredLocale = locale

        textToSpeech?.let { tts ->
            tts.setSpeechRate(speechRate)
            tts.setPitch(speechPitch)
            tts.language = preferredLocale
        }
    }

    /**
     * Get available TTS voices
     */
    fun getAvailableVoices(): List<VoiceInfo> {
        return textToSpeech?.voices?.map { voice ->
            VoiceInfo(
                name = voice.name,
                locale = voice.locale,
                isNetworkRequired = voice.isNetworkConnectionRequired,
                quality = voice.quality
            )
        } ?: emptyList()
    }

    /**
     * Check if conversation mode is supported
     */
    fun isSupported(): Boolean {
        return SpeechRecognizer.isRecognitionAvailable(context)
    }

    /**
     * Release resources
     */
    fun release() {
        stopConversationMode()
        
        speechRecognizer?.destroy()
        speechRecognizer = null
        
        textToSpeech?.stop()
        textToSpeech?.shutdown()
        textToSpeech = null
        
        ttsInitialized = false
        Log.d(TAG, "Conversation mode service released")
    }
}

// ==================== State Models ====================

sealed class ConversationState {
    data object Idle : ConversationState()
    data object Ready : ConversationState()
    data object Listening : ConversationState()
    data object Processing : ConversationState()
    data object Speaking : ConversationState()
    data class RecognizedText(val text: String) : ConversationState()
    data class Error(val message: String) : ConversationState()
}

sealed class SpeechResult {
    data object Ready : SpeechResult()
    data object Started : SpeechResult()
    data class AudioLevel(val level: Float) : SpeechResult()
    data class PartialResult(val text: String) : SpeechResult()
    data class FinalResult(val text: String) : SpeechResult()
    data class Error(val message: String) : SpeechResult()
}

data class VoiceInfo(
    val name: String,
    val locale: Locale,
    val isNetworkRequired: Boolean,
    val quality: Int
) {
    val displayName: String
        get() = "${locale.displayLanguage} - $name"
}
