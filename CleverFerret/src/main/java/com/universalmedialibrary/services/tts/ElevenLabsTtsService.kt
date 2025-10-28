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
 * ElevenLabs Text-to-Speech Service
 * 
 * High-quality AI voice synthesis using ElevenLabs API
 * Documentation: https://elevenlabs.io/docs/api-reference/text-to-speech
 * Get API key: https://elevenlabs.io/app/settings/api-keys
 */
@Singleton
class ElevenLabsTtsService @Inject constructor(
    @ApplicationContext private val context: Context
) : TextToSpeechService {

    private var apiKey: String? = null
    private var voiceId: String = "21m00Tcm4TlvDq8ikWAM" // Default voice (Rachel)
    private var modelId: String = "eleven_multilingual_v2" // Default model
    
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
        private const val BASE_URL = "https://api.elevenlabs.io/v1"
    }

    fun setApiKey(key: String) {
        this.apiKey = key
    }

    fun setVoiceId(voiceId: String) {
        this.voiceId = voiceId
    }

    fun setModelId(modelId: String) {
        this.modelId = modelId
    }

    override suspend fun initialize(): Boolean {
        return apiKey?.isNotBlank() == true
    }

    override suspend fun speak(text: String): Boolean {
        if (apiKey.isNullOrBlank()) {
            _ttsState.value = TtsServiceState(
                error = "ElevenLabs API key not configured"
            )
            return false
        }

        return try {
            _ttsState.value = _ttsState.value.copy(isPlaying = true, currentText = text)

            // Request audio from ElevenLabs API
            val audioBytes = requestTextToSpeech(text)
            
            // Play audio
            playAudio(audioBytes)
            
            _ttsState.value = _ttsState.value.copy(isPlaying = true)
            true
        } catch (e: Exception) {
            _ttsState.value = TtsServiceState(
                error = "ElevenLabs TTS failed: ${e.message}"
            )
            false
        }
    }

    private suspend fun requestTextToSpeech(text: String): ByteArray = withContext(Dispatchers.IO) {
        val json = JSONObject().apply {
            put("text", text)
            put("model_id", modelId)
            put("voice_settings", JSONObject().apply {
                put("stability", 0.5)
                put("similarity_boost", 0.75)
                put("style", 0.0)
                put("use_speaker_boost", true)
            })
        }

        val requestBody = json.toString().toRequestBody("application/json".toMediaType())
        
        val request = Request.Builder()
            .url("$BASE_URL/text-to-speech/$voiceId")
            .addHeader("xi-api-key", apiKey!!)
            .addHeader("Content-Type", "application/json")
            .post(requestBody)
            .build()

        return httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                val errorBody = response.body?.string() ?: "Unknown error"
                throw Exception("ElevenLabs API error (${response.code}): $errorBody")
            }

            response.body?.bytes() ?: throw Exception("Empty response from ElevenLabs")
        }
    }

    private suspend fun playAudio(audioBytes: ByteArray) = withContext(Dispatchers.Main) {
        // Release previous player
        mediaPlayer?.release()
        mediaPlayer = null

        // Write audio to temporary file
        val tempFile = File.createTempFile("elevenlabs_tts_", ".mp3", context.cacheDir)
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
            }
            
            setOnErrorListener { _, what, extra ->
                _ttsState.value = TtsServiceState(
                    error = "MediaPlayer error: $what, $extra"
                )
                tempFile.delete()
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
        // ElevenLabs handles language automatically
        _ttsState.value = _ttsState.value.copy(currentLanguage = language)
        return true
    }

    fun setVoice(voiceName: String) {
        this.voiceId = voiceName
    }

    override fun setSpeechRate(rate: Float) {
        // ElevenLabs doesn't support speed adjustment via API
        // Could be implemented via audio processing
    }

    override fun setPitch(pitch: Float) {
        // ElevenLabs doesn't support pitch adjustment via API
        _ttsState.value = _ttsState.value.copy(pitch = pitch)
    }

    override suspend fun getAvailableLanguages(): List<TtsLanguage> {
        // ElevenLabs supports multiple languages automatically
        return listOf(
            TtsLanguage("en", "English"),
            TtsLanguage("es", "Spanish"),
            TtsLanguage("fr", "French"),
            TtsLanguage("de", "German"),
            TtsLanguage("it", "Italian"),
            TtsLanguage("pt", "Portuguese"),
            TtsLanguage("pl", "Polish"),
            TtsLanguage("hi", "Hindi"),
            TtsLanguage("ja", "Japanese"),
            TtsLanguage("zh", "Chinese")
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
        // Common ElevenLabs voices
        return listOf(
            "21m00Tcm4TlvDq8ikWAM", // Rachel
            "AZnzlk1XvdvUeBnXmlld", // Domi
            "EXAVITQu4vr4xnSDxMaL", // Bella
            "ErXwobaYiN019PkySvjV", // Antoni
            "MF3mGyEYCl7XYWbV9V6O", // Elli
            "TxGEqnHWrfWFTfGW9XjX", // Josh
            "VR6AewLTigWG4xSOukaG", // Arnold
            "pNInz6obpgDQGcFmaJgB", // Adam
            "yoZ06aMxZJJ28mfd3POQ"  // Sam
        )
    }

    /**
     * Fetch available voices from ElevenLabs API
     */
    suspend fun fetchVoices(): List<VoiceInfo> = withContext(Dispatchers.IO) {
        if (apiKey.isNullOrBlank()) return@withContext emptyList()

        try {
            val request = Request.Builder()
                .url("$BASE_URL/voices")
                .addHeader("xi-api-key", apiKey!!)
                .get()
                .build()

            httpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) return@withContext emptyList()

                val jsonResponse = response.body?.string() ?: return@withContext emptyList()
                val json = JSONObject(jsonResponse)
                val voicesArray = json.getJSONArray("voices")

                (0 until voicesArray.length()).map { i ->
                    val voice = voicesArray.getJSONObject(i)
                    VoiceInfo(
                        id = voice.getString("voice_id"),
                        name = voice.getString("name"),
                        description = voice.optString("description", ""),
                        category = voice.optString("category", "generated")
                    )
                }
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
}

data class VoiceInfo(
    val id: String,
    val name: String,
    val description: String,
    val category: String
)
