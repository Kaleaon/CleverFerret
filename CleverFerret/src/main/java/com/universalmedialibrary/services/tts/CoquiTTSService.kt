package com.universalmedialibrary.services.tts

import android.content.Context
import android.speech.tts.TextToSpeech
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.floatPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

private val Context.ttsDataStore by preferencesDataStore("tts_preferences")

/**
 * A service for Text-to-Speech (TTS) functionality.
 * This service is designed to integrate with Coqui TTS in the future, but currently uses the standard Android TTS engine.
 *
 * @param context The application context.
 */
@Singleton
class CoquiTTSService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private val SPEECH_RATE_KEY = floatPreferencesKey("speech_rate")
        private val VOICE_MODEL_KEY = stringPreferencesKey("voice_model")
        private val EMOTION_STYLE_KEY = stringPreferencesKey("emotion_style")
        private val VOICE_PITCH_KEY = floatPreferencesKey("voice_pitch")

        // Default values
        const val DEFAULT_SPEECH_RATE = 1.0f
        const val DEFAULT_VOICE_MODEL = "neural_voice_v1"
        const val DEFAULT_EMOTION_STYLE = "neutral"
        const val DEFAULT_VOICE_PITCH = 1.0f
    }

    private var textToSpeech: TextToSpeech? = null
    private var isInitialized = false

    /** A [Flow] that emits the current speech rate. */
    val speechRate: Flow<Float> = context.ttsDataStore.data.map { preferences ->
        preferences[SPEECH_RATE_KEY] ?: DEFAULT_SPEECH_RATE
    }

    /** A [Flow] that emits the current voice model ID. */
    val voiceModel: Flow<String> = context.ttsDataStore.data.map { preferences ->
        preferences[VOICE_MODEL_KEY] ?: DEFAULT_VOICE_MODEL
    }

    /** A [Flow] that emits the current emotion style. */
    val emotionStyle: Flow<String> = context.ttsDataStore.data.map { preferences ->
        preferences[EMOTION_STYLE_KEY] ?: DEFAULT_EMOTION_STYLE
    }

    /** A [Flow] that emits the current voice pitch. */
    val voicePitch: Flow<Float> = context.ttsDataStore.data.map { preferences ->
        preferences[VOICE_PITCH_KEY] ?: DEFAULT_VOICE_PITCH
    }

    /**
     * Initializes the TTS engine if it's not already initialized.
     */
    suspend fun initializeTTS() {
        if (!isInitialized) {
            // Initialize Android TTS for now, Coqui integration planned for future
            initializeAndroidTTS()
        }
    }

    private suspend fun initializeAndroidTTS() {
        textToSpeech = TextToSpeech(context) { status ->
            if (status == TextToSpeech.SUCCESS) {
                isInitialized = true
            }
        }
    }

    /**
     * Speaks the given text using the TTS engine.
     *
     * @param text The text to speak.
     * @param emotion The emotional style to use for the speech.
     * @param onProgress A callback to report speech progress (currently simulated).
     * @param onComplete A callback for when speech is finished.
     */
    suspend fun speak(
        text: String,
        emotion: EmotionStyle = EmotionStyle.NEUTRAL,
        onProgress: ((Float) -> Unit)? = null,
        onComplete: (() -> Unit)? = null
    ) {
        if (!isInitialized) {
            initializeTTS()
        }

        // Use Android TTS for now - Coqui integration coming soon
        speakWithAndroidTTS(text, onProgress, onComplete)
    }

    private fun speakWithAndroidTTS(
        text: String,
        onProgress: ((Float) -> Unit)?,
        onComplete: (() -> Unit)?
    ) {
        textToSpeech?.let { tts ->
            // Apply settings from flow (would need to be properly handled)
            tts.setSpeechRate(DEFAULT_SPEECH_RATE)

            // For Android TTS, we don't have real-time progress, so simulate it
            tts.speak(text, TextToSpeech.QUEUE_FLUSH, null, "utteranceId")

            // Simulate progress (this would be improved with actual TTS callbacks)
            onProgress?.invoke(1.0f)
            onComplete?.invoke()
        }
    }

    /**
     * Stops the current speech.
     */
    suspend fun stop() {
        textToSpeech?.stop()
    }

    /**
     * Pauses the current speech (currently stops it).
     */
    suspend fun pause() {
        // Android TTS doesn't have pause, so we stop
        textToSpeech?.stop()
    }

    /**
     * Resumes the current speech (not yet implemented).
     */
    suspend fun resume() {
        // For Android TTS, we would need to re-speak from the current position
    }

    /**
     * Sets the speech rate.
     * @param rate The new speech rate.
     */
    suspend fun setSpeechRate(rate: Float) {
        context.ttsDataStore.edit { preferences ->
            preferences[SPEECH_RATE_KEY] = rate
        }
        textToSpeech?.setSpeechRate(rate)
    }

    /**
     * Sets the voice model.
     * @param model The ID of the new voice model.
     */
    suspend fun setVoiceModel(model: String) {
        context.ttsDataStore.edit { preferences ->
            preferences[VOICE_MODEL_KEY] = model
        }
        // Coqui voice model switching will be implemented in future update
    }

    /**
     * Sets the emotion style for the speech.
     * @param style The new emotion style.
     */
    suspend fun setEmotionStyle(style: String) {
        context.ttsDataStore.edit { preferences ->
            preferences[EMOTION_STYLE_KEY] = style
        }
        // Emotion control will be available with Coqui TTS integration
    }

    /**
     * Sets the voice pitch.
     * @param pitch The new voice pitch.
     */
    suspend fun setVoicePitch(pitch: Float) {
        context.ttsDataStore.edit { preferences ->
            preferences[VOICE_PITCH_KEY] = pitch
        }
        textToSpeech?.setPitch(pitch)
    }

    /**
     * Gets a list of available TTS voices.
     * @return A list of [VoiceModel]s.
     */
    fun getAvailableVoices(): List<VoiceModel> {
        // Return placeholder voices for now - Coqui voices coming soon
        return listOf(
            VoiceModel("android_default", "Android Default", VoiceQuality.STANDARD),
            VoiceModel("android_high_quality", "Android High Quality", VoiceQuality.HIGH),
            VoiceModel("coqui_neural_female", "Coqui Neural Female (Coming Soon)", VoiceQuality.NEURAL),
            VoiceModel("coqui_neural_male", "Coqui Neural Male (Coming Soon)", VoiceQuality.NEURAL)
        )
    }

    /**
     * Gets a list of available emotion styles.
     * @return A list of [EmotionStyle]s.
     */
    fun getAvailableEmotions(): List<EmotionStyle> {
        // Return all emotion styles - will be functional with Coqui integration
        return listOf(
            EmotionStyle.NEUTRAL,
            EmotionStyle.HAPPY,
            EmotionStyle.SAD,
            EmotionStyle.ANGRY,
            EmotionStyle.CALM,
            EmotionStyle.EXCITED,
            EmotionStyle.MYSTERIOUS,
            EmotionStyle.DRAMATIC,
            EmotionStyle.ROMANTIC,
            EmotionStyle.SUSPENSEFUL
        )
    }

    /**
     * Releases the resources used by the TTS engine.
     */
    fun release() {
        textToSpeech?.shutdown()
        isInitialized = false
    }
}

/**
 * The available emotional styles for the TTS voice.
 */
enum class EmotionStyle(val displayName: String) {
    NEUTRAL("Neutral"),
    HAPPY("Happy"),
    SAD("Sad"),
    ANGRY("Angry"),
    EXCITED("Excited"),
    CALM("Calm"),
    MYSTERIOUS("Mysterious"),
    DRAMATIC("Dramatic"),
    ROMANTIC("Romantic"),
    SUSPENSEFUL("Suspenseful")
}

/**
 * Represents a TTS voice model.
 *
 * @property id The unique identifier for the voice model.
 * @property name The display name of the voice.
 * @property quality The quality of the voice.
 * @property description A description of the voice.
 * @property language The language of the voice.
 * @property gender The gender of the voice.
 */
data class VoiceModel(
    val id: String,
    val name: String,
    val quality: VoiceQuality,
    val description: String = "",
    val language: String = "en-US",
    val gender: VoiceGender = VoiceGender.NEUTRAL
)

/**
 * The quality of a TTS voice.
 */
enum class VoiceQuality(val displayName: String) {
    STANDARD("Standard"),
    HIGH("High Quality"),
    NEURAL("Neural (Premium)")
}

/**
 * The gender of a TTS voice.
 */
enum class VoiceGender(val displayName: String) {
    MALE("Male"),
    FEMALE("Female"),
    NEUTRAL("Neutral")
}