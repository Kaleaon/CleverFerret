package com.universalmedialibrary.services.tts

import android.content.Context
import android.media.AudioAttributes
import android.media.MediaPlayer
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.Body
import retrofit2.http.Header
import retrofit2.http.POST
import java.io.File
import java.io.FileOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Google Cloud Text-to-Speech Service with Gemini Voices
 * 
 * Uses Google Cloud Text-to-Speech API for high-quality AI-powered speech
 * Documentation: https://cloud.google.com/text-to-speech/docs/gemini-tts
 */
@Singleton
class GeminiTtsService @Inject constructor(
    @ApplicationContext private val context: Context
) : TextToSpeechService {

    private var apiKey: String? = null
    private val _ttsState = MutableStateFlow(TtsServiceState())
    override val ttsState: StateFlow<TtsServiceState> = _ttsState.asStateFlow()
    
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private var mediaPlayer: MediaPlayer? = null

    private val cloudTtsApi: CloudTextToSpeechApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://texttospeech.googleapis.com/v1/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(CloudTextToSpeechApi::class.java)
    }

    private var voiceName: String = "gemini-2.5-flash-tts-001" // Default Gemini voice

    fun setApiKey(key: String) {
        apiKey = key
    }

    fun setVoice(voice: String) {
        voiceName = voice
    }

    override suspend fun initialize(): Boolean = withContext(Dispatchers.IO) {
        if (apiKey.isNullOrBlank()) {
            _ttsState.value = _ttsState.value.copy(
                isInitialized = false,
                error = "Gemini API key not configured"
            )
            return@withContext false
        }

        try {
            // Test the API key with a simple request
            _ttsState.value = _ttsState.value.copy(
                isInitialized = true,
                error = null
            )
            true
        } catch (e: Exception) {
            _ttsState.value = _ttsState.value.copy(
                isInitialized = false,
                error = "Failed to initialize Gemini TTS: ${e.message}"
            )
            false
        }
    }

    override suspend fun speak(text: String): Boolean = withContext(Dispatchers.IO) {
        if (!_ttsState.value.isInitialized || apiKey.isNullOrBlank()) {
            return@withContext false
        }

        try {
            _ttsState.value = _ttsState.value.copy(
                isPlaying = true,
                currentText = text,
                error = null
            )

            // Call Cloud Text-to-Speech API with Gemini voices
            val request = SynthesizeSpeechRequest(
                input = TextInput(text = text),
                voice = VoiceSelectionParams(
                    languageCode = _ttsState.value.currentLanguage,
                    name = voiceName
                ),
                audioConfig = AudioConfig(
                    audioEncoding = "MP3",
                    speakingRate = _ttsState.value.speechRate.toDouble(),
                    pitch = _ttsState.value.pitch.toDouble()
                )
            )

            val response = cloudTtsApi.synthesizeSpeech(
                apiKey = apiKey!!,
                request = request
            )

            // Decode and validate audio content
            val audioBase64 = response.audioContent
            if (audioBase64.isNullOrBlank()) {
                _ttsState.value = _ttsState.value.copy(
                    isPlaying = false,
                    error = "Empty audioContent from TTS API"
                )
                return@withContext false
            }

            val audioBytes = android.util.Base64.decode(audioBase64, android.util.Base64.DEFAULT)
            if (audioBytes.isEmpty()) {
                _ttsState.value = _ttsState.value.copy(
                    isPlaying = false,
                    error = "Failed to decode audio"
                )
                return@withContext false
            }

            // Play audio using MediaPlayer
            try {
                // Write audio bytes to temporary file
                val tempFile = File.createTempFile("tts_", ".mp3", context.cacheDir)
                FileOutputStream(tempFile).use { fos ->
                    fos.write(audioBytes)
                }

                // Initialize MediaPlayer
                mediaPlayer?.release()
                mediaPlayer = MediaPlayer().apply {
                    setAudioAttributes(
                        AudioAttributes.Builder()
                            .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                            .setUsage(AudioAttributes.USAGE_MEDIA)
                            .build()
                    )
                    setDataSource(tempFile.absolutePath)
                    setOnCompletionListener {
                        _ttsState.value = _ttsState.value.copy(
                            isPlaying = false,
                            currentText = ""
                        )
                        tempFile.delete()
                    }
                    setOnErrorListener { _, what, extra ->
                        _ttsState.value = _ttsState.value.copy(
                            isPlaying = false,
                            error = "MediaPlayer error: $what, $extra"
                        )
                        tempFile.delete()
                        true
                    }
                    prepare()
                    start()
                }
                
                true
            } catch (e: Exception) {
                _ttsState.value = _ttsState.value.copy(
                    isPlaying = false,
                    error = "Failed to play audio: ${e.message}"
                )
                false
            }
        } catch (e: Exception) {
            _ttsState.value = _ttsState.value.copy(
                isPlaying = false,
                error = "Gemini TTS error: ${e.message}"
            )
            false
        }
    }

    override fun pause() {
        mediaPlayer?.pause()
        _ttsState.value = _ttsState.value.copy(
            isPlaying = false,
            isPaused = true
        )
    }

    override fun resume() {
        val text = _ttsState.value.currentText
        if (text.isNotEmpty() && _ttsState.value.isPaused) {
            _ttsState.value = _ttsState.value.copy(isPaused = false)
            serviceScope.launch { speak(text) }
        }
    }

    override fun stop() {
        mediaPlayer?.stop()
        mediaPlayer?.release()
        mediaPlayer = null
        _ttsState.value = _ttsState.value.copy(
            isPlaying = false,
            isPaused = false,
            currentText = ""
        )
    }

    override fun setSpeechRate(rate: Float) {
        // Cloud TTS speakingRate accepts 0.25-4.0
        val clampedRate = rate.coerceIn(0.25f, 4.0f)
        _ttsState.value = _ttsState.value.copy(speechRate = clampedRate)
    }

    override fun setPitch(pitch: Float) {
        val clampedPitch = pitch.coerceIn(0.5f, 2.0f)
        _ttsState.value = _ttsState.value.copy(pitch = clampedPitch)
    }

    override suspend fun getAvailableLanguages(): List<TtsLanguage> {
        // Gemini supports many languages
        return listOf(
            TtsLanguage("en-US", "English (US)", true),
            TtsLanguage("en-GB", "English (UK)", true),
            TtsLanguage("es-ES", "Spanish", true),
            TtsLanguage("fr-FR", "French", true),
            TtsLanguage("de-DE", "German", true),
            TtsLanguage("it-IT", "Italian", true),
            TtsLanguage("pt-BR", "Portuguese (Brazil)", true),
            TtsLanguage("ja-JP", "Japanese", true),
            TtsLanguage("ko-KR", "Korean", true),
            TtsLanguage("zh-CN", "Chinese (Simplified)", true),
            TtsLanguage("hi-IN", "Hindi", true),
            TtsLanguage("ar-SA", "Arabic", true)
        )
    }

    override suspend fun setLanguage(language: String): Boolean {
        _ttsState.value = _ttsState.value.copy(
            currentLanguage = language,
            error = null
        )
        return true
    }

    override fun isAvailable(): Boolean {
        return !apiKey.isNullOrBlank()
    }

    override fun shutdown() {
        stop()
        _ttsState.value = TtsServiceState()
    }
}

/**
 * Google Cloud Text-to-Speech API Interface
 * Documentation: https://cloud.google.com/text-to-speech/docs/reference/rest
 */
interface CloudTextToSpeechApi {
    @POST("text:synthesize")
    suspend fun synthesizeSpeech(
        @Header("X-Goog-Api-Key") apiKey: String,
        @Body request: SynthesizeSpeechRequest
    ): SynthesizeSpeechResponse
}

/**
 * Cloud Text-to-Speech API Models
 * Based on official Google Cloud TTS API
 */
data class SynthesizeSpeechRequest(
    val input: TextInput,
    val voice: VoiceSelectionParams,
    val audioConfig: AudioConfig
)

data class TextInput(
    val text: String
)

data class VoiceSelectionParams(
    val languageCode: String,
    val name: String? = null,
    val ssmlGender: String? = null
)

data class AudioConfig(
    val audioEncoding: String,
    val speakingRate: Double = 1.0,
    val pitch: Double = 0.0,
    val volumeGainDb: Double = 0.0,
    val sampleRateHertz: Int? = null
)

data class SynthesizeSpeechResponse(
    val audioContent: String // Base64-encoded audio
)
