package com.universalmedialibrary.services.tts

import kotlinx.coroutines.flow.StateFlow

/**
 * Unified Text-to-Speech Service Interface
 *
 * This interface abstracts TTS functionality to allow switching between
 * different TTS backends (Android TTS, Cloud TTS services, etc.)
 */
interface TextToSpeechService {

    /**
     * Current TTS state
     */
    val ttsState: StateFlow<TtsServiceState>

    /**
     * Initialize the TTS service
     */
    suspend fun initialize(): Boolean

    /**
     * Speak the given text
     */
    suspend fun speak(text: String): Boolean

    /**
     * Pause TTS playback
     */
    fun pause()

    /**
     * Resume TTS playback
     */
    fun resume()

    /**
     * Stop TTS playback
     */
    fun stop()

    /**
     * Set speech rate (0.1 to 3.0, 1.0 is normal)
     */
    fun setSpeechRate(rate: Float)

    /**
     * Set speech pitch (0.5 to 2.0, 1.0 is normal)
     */
    fun setPitch(pitch: Float)

    /**
     * Get available languages
     */
    suspend fun getAvailableLanguages(): List<TtsLanguage>

    /**
     * Set language for TTS
     */
    suspend fun setLanguage(language: String): Boolean

    /**
     * Check if TTS is available on the device
     */
    fun isAvailable(): Boolean

    /**
     * Clean up resources
     */
    fun shutdown()
}

/**
 * TTS Service State representation
 */
data class TtsServiceState(
    val isInitialized: Boolean = false,
    val isPlaying: Boolean = false,
    val isPaused: Boolean = false,
    val currentText: String = "",
    val currentLanguage: String = "en",
    val speechRate: Float = 1.0f,
    val pitch: Float = 1.0f,
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val canSpeak: Boolean get() = isInitialized && !hasError
}

/**
 * TTS Language representation
 */
data class TtsLanguage(
    val code: String,
    val displayName: String,
    val isAvailable: Boolean = true
)

/**
 * TTS Events
 */
sealed class TtsEvent {
    object Started : TtsEvent()
    object Completed : TtsEvent()
    object Paused : TtsEvent()
    object Resumed : TtsEvent()
    object Stopped : TtsEvent()
    data class Error(val message: String) : TtsEvent()
}
