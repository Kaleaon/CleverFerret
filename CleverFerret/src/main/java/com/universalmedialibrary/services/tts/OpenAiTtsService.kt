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
import kotlinx.coroutines.cancel
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.MediaType.Companion.toMediaType
import org.json.JSONObject
import java.io.File
import java.io.FileOutputStream
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * OpenAI Text-to-Speech Service
 * 
 * High-quality text-to-speech using OpenAI's TTS API
 * Documentation: https://platform.openai.com/docs/guides/text-to-speech
 * Get API key: https://platform.openai.com/api-keys
 */
@Singleton
class OpenAiTtsService @Inject constructor(
    @ApplicationContext private val context: Context
) : TextToSpeechService {

    private var apiKey: String? = null
    private var voice: String = "alloy" // Default voice
    private var model: String = "tts-1" // Default model (also: tts-1-hd)
    private var speed: Float = 1.0f
    
    private val _ttsState = MutableStateFlow(TtsServiceState())
    override val ttsState: StateFlow<TtsServiceState> = _ttsState.asStateFlow()
    
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private var mediaPlayer: MediaPlayer? = null

    private val httpClient = OkHttpClient.Builder()
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(60, TimeUnit.SECONDS)
        .writeTimeout(30, TimeUnit.SECONDS)
        .build()

    companion object {
        private const val BASE_URL = "https://api.openai.com/v1"
        
        // Available voices
        const val VOICE_ALLOY = "alloy"
        const val VOICE_ECHO = "echo"
        const val VOICE_FABLE = "fable"
        const val VOICE_ONYX = "onyx"
        const val VOICE_NOVA = "nova"
        const val VOICE_SHIMMER = "shimmer"
        
        // Available models
        const val MODEL_TTS_1 = "tts-1" // Faster, lower quality
        const val MODEL_TTS_1_HD = "tts-1-hd" // Higher quality
    }

    fun setApiKey(key: String) {
        this.apiKey = key
    }

    fun setModel(model: String) {
        this.model = model
    }

    override suspend fun initialize(): Boolean {
        return apiKey?.isNotBlank() == true
    }

    override suspend fun speak(text: String): Boolean {
        if (apiKey.isNullOrBlank()) {
            _ttsState.value = TtsServiceState(
                error = "OpenAI API key not configured"
            )
            return false
        }

        return try {
            _ttsState.value = _ttsState.value.copy(isPlaying = true, currentText = text)

            // Request audio from OpenAI API
            val audioBytes = requestTextToSpeech(text)
            
            // Play audio
            playAudio(audioBytes)
            
            _ttsState.value = _ttsState.value.copy(isPlaying = true)
            true
        } catch (e: Exception) {
            _ttsState.value = TtsServiceState(
                error = "OpenAI TTS failed: ${e.message}"
            )
            false
        }
    }

    private suspend fun requestTextToSpeech(text: String): ByteArray = withContext(Dispatchers.IO) {
        val json = JSONObject().apply {
            put("model", model)
            put("input", text)
            put("voice", voice)
            put("speed", speed)
            put("response_format", "mp3")
        }

        val requestBody = json.toString().toRequestBody("application/json".toMediaType())
        
        val request = Request.Builder()
            .url("$BASE_URL/audio/speech")
            .addHeader("Authorization", "Bearer $apiKey")
            .addHeader("Content-Type", "application/json")
            .post(requestBody)
            .build()

        httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                val errorBody = response.body?.string() ?: "Unknown error"
                throw Exception("OpenAI API error (${response.code}): $errorBody")
            }

            response.body?.bytes() ?: throw Exception("Empty response from OpenAI")
        }
    }

    private suspend fun playAudio(audioBytes: ByteArray) = withContext(Dispatchers.Main) {
        // Release previous player
        mediaPlayer?.release()
        mediaPlayer = null

        // Write audio to temporary file
        val tempFile = File.createTempFile("openai_tts_", ".mp3", context.cacheDir)
        withContext(Dispatchers.IO) {
            FileOutputStream(tempFile).use { it.write(audioBytes) }
        }

        // Initialize MediaPlayer
        mediaPlayer = MediaPlayer().apply {
            setAudioAttributes(
                AudioAttributes.Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                    .setUsage(AudioAttributes.USAGE_ASSISTANT)
                    .build()
            )
            
            setDataSource(tempFile.absolutePath)
            
            setOnCompletionListener {
                _ttsState.value = _ttsState.value.copy(isPlaying = false)
                tempFile.delete()
                // Release MediaPlayer to prevent resource leak
                mediaPlayer?.release()
                mediaPlayer = null
            }
            
            setOnErrorListener { _, what, extra ->
                _ttsState.value = TtsServiceState(
                    error = "MediaPlayer error: $what, $extra"
                )
                tempFile.delete()
                // Release MediaPlayer on error to prevent resource leak
                mediaPlayer?.release()
                mediaPlayer = null
                true
            }
            
            prepare()
            start()
        }
    }

    override fun pause() {
        mediaPlayer?.pause()
        _ttsState.value = _ttsState.value.copy(isPlaying = false, isPaused = true)
    }

    override fun resume() {
        mediaPlayer?.start()
        _ttsState.value = _ttsState.value.copy(isPlaying = true, isPaused = false)
    }

    override fun stop() {
        mediaPlayer?.stop()
        mediaPlayer?.release()
        mediaPlayer = null
        _ttsState.value = _ttsState.value.copy(isPlaying = false, isPaused = false)
    }

    override suspend fun setLanguage(language: String): Boolean {
        // OpenAI TTS automatically detects language
        _ttsState.value = _ttsState.value.copy(currentLanguage = language)
        return true
    }

    fun setVoice(voiceName: String) {
        this.voice = voiceName
    }

    override fun setSpeechRate(rate: Float) {
        // OpenAI supports speed from 0.25 to 4.0
        this.speed = rate.coerceIn(0.25f, 4.0f)
    }

    override fun setPitch(pitch: Float) {
        // OpenAI TTS doesn't support pitch adjustment
        _ttsState.value = _ttsState.value.copy(pitch = pitch)
    }

    override suspend fun getAvailableLanguages(): List<TtsLanguage> {
        // OpenAI TTS supports 58 languages
        return listOf(
            TtsLanguage("en", "English"),
            TtsLanguage("es", "Spanish"),
            TtsLanguage("fr", "French"),
            TtsLanguage("de", "German"),
            TtsLanguage("it", "Italian"),
            TtsLanguage("pt", "Portuguese"),
            TtsLanguage("pl", "Polish"),
            TtsLanguage("nl", "Dutch"),
            TtsLanguage("ja", "Japanese"),
            TtsLanguage("zh", "Chinese"),
            TtsLanguage("ko", "Korean")
        )
    }

    override fun isAvailable(): Boolean {
        return apiKey?.isNotBlank() == true
    }

    override fun shutdown() {
        stop()
        serviceScope.cancel()
    }

    fun getAvailableVoices(): List<String> {
        return listOf(
            VOICE_ALLOY,
            VOICE_ECHO,
            VOICE_FABLE,
            VOICE_ONYX,
            VOICE_NOVA,
            VOICE_SHIMMER
        )
    }
}
