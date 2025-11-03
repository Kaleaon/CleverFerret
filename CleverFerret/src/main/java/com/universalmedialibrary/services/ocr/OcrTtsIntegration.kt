package com.universalmedialibrary.services.ocr

import com.universalmedialibrary.services.tts.AndroidTextToSpeechService
import com.universalmedialibrary.ui.reader.OcrState
import kotlinx.coroutines.flow.StateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Integration service connecting OCR results with Text-to-Speech
 * 
 * Allows users to hear the extracted text read aloud using Android's TTS engine
 */
@Singleton
class OcrTtsIntegration @Inject constructor(
    private val ttsService: AndroidTextToSpeechService
) {

    /**
     * Speak the OCR result text using TTS
     * 
     * @param ocrState Current OCR state containing the text to speak
     * @return true if TTS started successfully, false otherwise
     */
    suspend fun speakOcrResult(ocrState: StateFlow<OcrState>): Boolean {
        return when (val state = ocrState.value) {
            is OcrState.Success -> {
                if (!ttsService.ttsState.value.isInitialized) {
                    ttsService.initialize()
                }
                ttsService.speak(state.result.text)
                true
            }
            else -> false
        }
    }

    /**
     * Speak specific text from OCR
     * 
     * @param text The text to speak
     * @return true if TTS started successfully, false otherwise
     */
    suspend fun speakText(text: String): Boolean {
        if (text.isBlank()) return false
        
        if (!ttsService.ttsState.value.isInitialized) {
            ttsService.initialize()
        }
        
        return ttsService.speak(text)
    }

    /**
     * Stop current TTS playback
     */
    fun stopSpeaking() {
        ttsService.stop()
    }

    /**
     * Pause current TTS playback
     */
    fun pauseSpeaking() {
        ttsService.pause()
    }

    /**
     * Resume TTS playback
     */
    fun resumeSpeaking() {
        ttsService.resume()
    }

    /**
     * Check if TTS is currently speaking
     */
    fun isSpeaking(): Boolean {
        return ttsService.ttsState.value.isPlaying
    }

    /**
     * Get TTS state for UI updates
     */
    fun getTtsState() = ttsService.ttsState

    /**
     * Set TTS speech rate
     * 
     * @param rate Speech rate (0.5 = half speed, 1.0 = normal, 2.0 = double speed)
     */
    suspend fun setSpeechRate(rate: Float) {
        ttsService.setSpeechRate(rate)
    }

    /**
     * Set TTS pitch
     * 
     * @param pitch Pitch level (0.5 = lower pitch, 1.0 = normal, 2.0 = higher pitch)
     */
    suspend fun setPitch(pitch: Float) {
        ttsService.setPitch(pitch)
    }

    /**
     * Set TTS language
     * 
     * @param languageCode Language code (e.g., "en", "es", "fr")
     */
    suspend fun setLanguage(languageCode: String) {
        ttsService.setLanguage(languageCode)
    }
}
