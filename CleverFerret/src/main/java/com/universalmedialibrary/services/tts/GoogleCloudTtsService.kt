package com.universalmedialibrary.services.tts

import android.content.Context
import android.media.AudioAttributes
import android.media.MediaPlayer
import android.util.Base64
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
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
 * Google Cloud Text-to-Speech Service
 * 
 * Professional text-to-speech using Google Cloud TTS API
 * Documentation: https://cloud.google.com/text-to-speech/docs
 * Get API key: https://console.cloud.google.com/apis/credentials
 */
@Singleton
class GoogleCloudTtsService @Inject constructor(
    @ApplicationContext private val context: Context
) : TextToSpeechService {

    private var apiKey: String? = null
    private var languageCode: String = "en-US"
    private var voiceName: String = "en-US-Neural2-C" // Female voice
    private var speakingRate: Double = 1.0
    private var pitch: Double = 0.0
    
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
        private const val BASE_URL = "https://texttospeech.googleapis.com/v1"
    }

    override fun setApiKey(key: String) {
        this.apiKey = key
    }

    override fun speak(text: String) {
        if (apiKey.isNullOrBlank()) {
            _ttsState.value = TtsServiceState(
                isError = true,
                errorMessage = "Google Cloud TTS API key not configured"
            )
            return
        }

        serviceScope.launch {
            try {
                _ttsState.value = TtsServiceState(isSpeaking = true, isLoading = true)

                // Request audio from Google Cloud TTS API
                val audioBytes = requestTextToSpeech(text)
                
                // Play audio
                playAudio(audioBytes)
                
                _ttsState.value = TtsServiceState(isSpeaking = true, isLoading = false)
            } catch (e: Exception) {
                _ttsState.value = TtsServiceState(
                    isError = true,
                    errorMessage = "Google Cloud TTS failed: ${e.message}"
                )
            }
        }
    }

    private suspend fun requestTextToSpeech(text: String): ByteArray = withContext(Dispatchers.IO) {
        val json = JSONObject().apply {
            put("input", JSONObject().put("text", text))
            put("voice", JSONObject().apply {
                put("languageCode", languageCode)
                put("name", voiceName)
            })
            put("audioConfig", JSONObject().apply {
                put("audioEncoding", "MP3")
                put("speakingRate", speakingRate)
                put("pitch", pitch)
            })
        }

        val requestBody = json.toString().toRequestBody("application/json".toMediaType())
        
        val request = Request.Builder()
            .url("$BASE_URL/text:synthesize?key=$apiKey")
            .addHeader("Content-Type", "application/json")
            .post(requestBody)
            .build()

        val response = httpClient.newCall(request).execute()
        
        if (!response.isSuccessful) {
            val errorBody = response.body?.string() ?: "Unknown error"
            throw Exception("Google Cloud TTS API error (${response.code}): $errorBody")
        }

        val responseBody = response.body?.string() ?: throw Exception("Empty response")
        val responseJson = JSONObject(responseBody)
        val audioContent = responseJson.getString("audioContent")
        
        // Decode base64 audio
        Base64.decode(audioContent, Base64.DEFAULT)
    }

    private suspend fun playAudio(audioBytes: ByteArray) = withContext(Dispatchers.Main) {
        // Release previous player
        mediaPlayer?.release()
        mediaPlayer = null

        // Write audio to temporary file
        val tempFile = File.createTempFile("google_cloud_tts_", ".mp3", context.cacheDir)
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
                _ttsState.value = TtsServiceState(isSpeaking = false)
                tempFile.delete()
            }
            
            setOnErrorListener { _, what, extra ->
                _ttsState.value = TtsServiceState(
                    isError = true,
                    errorMessage = "MediaPlayer error: $what, $extra"
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
        _ttsState.value = _ttsState.value.copy(isSpeaking = false)
    }

    override fun resume() {
        mediaPlayer?.start()
        _ttsState.value = _ttsState.value.copy(isSpeaking = true)
    }

    override fun stop() {
        mediaPlayer?.stop()
        mediaPlayer?.release()
        mediaPlayer = null
        _ttsState.value = TtsServiceState(isSpeaking = false)
    }

    override fun setLanguage(language: String) {
        this.languageCode = language
        // Auto-select appropriate voice for language
        when {
            language.startsWith("en") -> voiceName = "en-US-Neural2-C"
            language.startsWith("es") -> voiceName = "es-ES-Neural2-A"
            language.startsWith("fr") -> voiceName = "fr-FR-Neural2-A"
            language.startsWith("de") -> voiceName = "de-DE-Neural2-A"
            language.startsWith("ja") -> voiceName = "ja-JP-Neural2-B"
            language.startsWith("zh") -> voiceName = "cmn-CN-Wavenet-A"
            else -> voiceName = "en-US-Neural2-C"
        }
    }

    override fun setVoice(voiceName: String) {
        this.voiceName = voiceName
    }

    override fun setSpeechRate(rate: Float) {
        // Google Cloud TTS supports 0.25 to 4.0
        this.speakingRate = rate.toDouble().coerceIn(0.25, 4.0)
    }

    override fun setPitch(pitch: Float) {
        // Google Cloud TTS supports -20.0 to 20.0
        this.pitch = pitch.toDouble().coerceIn(-20.0, 20.0)
    }

    override fun getAvailableVoices(): List<String> {
        // Common high-quality voices
        return listOf(
            // English
            "en-US-Neural2-A", "en-US-Neural2-C", "en-US-Neural2-D",
            "en-US-Neural2-E", "en-US-Neural2-F", "en-US-Neural2-G",
            "en-GB-Neural2-A", "en-GB-Neural2-B", "en-GB-Neural2-C",
            // Spanish
            "es-ES-Neural2-A", "es-ES-Neural2-B",
            // French
            "fr-FR-Neural2-A", "fr-FR-Neural2-B",
            // German
            "de-DE-Neural2-A", "de-DE-Neural2-B",
            // Japanese
            "ja-JP-Neural2-B", "ja-JP-Neural2-C",
            // Chinese
            "cmn-CN-Wavenet-A", "cmn-CN-Wavenet-B"
        )
    }

    /**
     * Fetch available voices from Google Cloud TTS API
     */
    suspend fun fetchVoices(): List<CloudVoiceInfo> = withContext(Dispatchers.IO) {
        if (apiKey.isNullOrBlank()) return@withContext emptyList()

        try {
            val request = Request.Builder()
                .url("$BASE_URL/voices?key=$apiKey")
                .get()
                .build()

            val response = httpClient.newCall(request).execute()
            if (!response.isSuccessful) return@withContext emptyList()

            val jsonResponse = response.body?.string() ?: return@withContext emptyList()
            val json = JSONObject(jsonResponse)
            val voicesArray = json.getJSONArray("voices")

            (0 until voicesArray.length()).map { i ->
                val voice = voicesArray.getJSONObject(i)
                val languageCodes = voice.getJSONArray("languageCodes")
                CloudVoiceInfo(
                    name = voice.getString("name"),
                    languageCode = if (languageCodes.length() > 0) languageCodes.getString(0) else "",
                    gender = voice.optString("ssmlGender", ""),
                    type = if (voice.getString("name").contains("Neural")) "Neural" else "Standard"
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
}

data class CloudVoiceInfo(
    val name: String,
    val languageCode: String,
    val gender: String,
    val type: String
)
