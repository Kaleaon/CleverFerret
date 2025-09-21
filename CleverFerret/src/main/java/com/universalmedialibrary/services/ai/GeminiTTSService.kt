package com.universalmedialibrary.services.ai

import android.content.Context
import android.media.MediaPlayer
import com.google.gson.Gson
import com.google.gson.annotations.SerializedName
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import okhttp3.*
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.RequestBody.Companion.toRequestBody
import java.io.File
import java.io.IOException
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Gemini AI Text-to-Speech Service for Enhanced E-Reader Experience
 * 
 * Advanced TTS service that uses Google's Gemini 2.5 Flash/Pro TTS models to provide
 * high-quality, natural-sounding speech synthesis for book reading and content consumption.
 * 
 * Key Features:
 * - High-quality lifelike audio generation with natural expressiveness
 * - Multi-language support (24+ languages) with seamless switching
 * - Multi-speaker support for dialogue and narrative content
 * - Natural language controls for style, tone, pace, and emotional nuance
 * - Long-form synthesis (up to 32k tokens) perfect for book chapters
 * - Optimized for audiobook and podcast-quality output
 * - Advanced voice controls: whispering, accent variation, emotional tone
 * 
 * Perfect for:
 * - E-book text-to-speech with natural narration
 * - Multi-character dialogue with distinct voices
 * - Educational content with expressive reading
 * - Accessibility features for visually impaired users
 * - Podcast-quality audio generation from text content
 */
@Singleton
class GeminiTTSService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private val client = OkHttpClient.Builder()
        .connectTimeout(60, java.util.concurrent.TimeUnit.SECONDS)
        .readTimeout(120, java.util.concurrent.TimeUnit.SECONDS) // Longer for audio generation
        .build()
    
    private val gson = Gson()
    
    private val _ttsState = MutableStateFlow(GeminiTTSState())
    val ttsState: StateFlow<GeminiTTSState> = _ttsState.asStateFlow()
    
    private var currentMediaPlayer: MediaPlayer? = null
    
    companion object {
        private const val GEMINI_API_BASE = "https://generativelanguage.googleapis.com/v1beta"
        private const val MAX_TEXT_LENGTH = 32000 // 32k token limit
        private const val CHUNK_SIZE = 8000 // Process in chunks for very long text
    }
    
    /**
     * Generate high-quality speech from text using Gemini TTS
     */
    suspend fun generateSpeech(
        text: String,
        apiKey: String,
        options: GeminiTTSOptions = GeminiTTSOptions()
    ): GeminiTTSResult = withContext(Dispatchers.IO) {
        try {
            _ttsState.value = _ttsState.value.copy(
                isGenerating = true,
                progress = 0f,
                error = null
            )
            
            // Split long text into manageable chunks
            val textChunks = if (text.length > MAX_TEXT_LENGTH) {
                splitTextIntoChunks(text, CHUNK_SIZE)
            } else {
                listOf(text)
            }
            
            val audioFiles = mutableListOf<File>()
            
            textChunks.forEachIndexed { index, chunk ->
                _ttsState.value = _ttsState.value.copy(
                    progress = index.toFloat() / textChunks.size,
                    currentChunk = index + 1,
                    totalChunks = textChunks.size
                )
                
                val audioFile = generateSpeechChunk(chunk, apiKey, options, index)
                audioFiles.add(audioFile)
            }
            
            // Combine audio files if multiple chunks
            val finalAudioFile = if (audioFiles.size > 1) {
                combineAudioFiles(audioFiles)
            } else {
                audioFiles.first()
            }
            
            _ttsState.value = _ttsState.value.copy(
                isGenerating = false,
                progress = 1f
            )
            
            GeminiTTSResult(
                success = true,
                audioFile = finalAudioFile,
                duration = getAudioDuration(finalAudioFile),
                textLength = text.length,
                language = options.language,
                processingTimeMs = System.currentTimeMillis() - _ttsState.value.startTime
            )
            
        } catch (e: Exception) {
            _ttsState.value = _ttsState.value.copy(
                isGenerating = false,
                error = "Speech generation failed: ${e.message}"
            )
            
            GeminiTTSResult(
                success = false,
                error = e.message
            )
        }
    }
    
    /**
     * Generate speech for a single chunk of text
     */
    private suspend fun generateSpeechChunk(
        text: String,
        apiKey: String,
        options: GeminiTTSOptions,
        chunkIndex: Int
    ): File = withContext(Dispatchers.IO) {
        
        val prompt = buildGeminiTTSPrompt(text, options)
        
        val requestBody = GeminiTTSRequest(
            model = options.model.apiName,
            contents = listOf(
                GeminiTTSContent(
                    parts = listOf(
                        GeminiTTSPart(text = prompt)
                    )
                )
            ),
            generationConfig = GeminiTTSGenerationConfig(
                temperature = 0.1f, // Low temperature for consistent speech
                candidateCount = 1
            ),
            speechConfig = GeminiSpeechConfig(
                voiceConfig = GeminiVoiceConfig(
                    prebuiltVoiceConfig = GeminiPrebuiltVoiceConfig(
                        voiceName = options.voiceName
                    )
                )
            )
        )
        
        val request = Request.Builder()
            .url("$GEMINI_API_BASE/models/${options.model.apiName}:generateContent?key=$apiKey")
            .post(gson.toJson(requestBody).toRequestBody("application/json".toMediaType()))
            .addHeader("Accept", "audio/mp3")
            .build()
        
        val response = client.newCall(request).execute()
        
        if (response.isSuccessful && response.body != null) {
            val audioData = response.body!!.bytes()
            
            // Save audio to temporary file
            val audioFile = File(context.cacheDir, "gemini_tts_chunk_${chunkIndex}_${System.currentTimeMillis()}.mp3")
            audioFile.writeBytes(audioData)
            
            audioFile
        } else {
            throw IOException("Gemini TTS API error: ${response.code} - ${response.body?.string()}")
        }
    }
    
    /**
     * Build advanced TTS prompt with natural language controls
     */
    private fun buildGeminiTTSPrompt(text: String, options: GeminiTTSOptions): String {
        return buildString {
            append("Generate natural, expressive speech from the following text")
            
            // Voice style instructions
            when (options.style) {
                GeminiTTSStyle.NARRATIVE -> append(" in a narrative storytelling style")
                GeminiTTSStyle.CONVERSATIONAL -> append(" in a conversational, friendly tone")
                GeminiTTSStyle.DRAMATIC -> append(" with dramatic emphasis and emotional expression")
                GeminiTTSStyle.EDUCATIONAL -> append(" in a clear, educational teaching style")
                GeminiTTSStyle.CALM -> append(" in a calm, soothing manner")
                GeminiTTSStyle.ENERGETIC -> append(" with energy and enthusiasm")
            }
            
            // Pace instructions
            when (options.pace) {
                GeminiTTSPace.SLOW -> append(", speaking slowly and deliberately")
                GeminiTTSPace.NORMAL -> append(", at a comfortable reading pace")
                GeminiTTSPace.FAST -> append(", with a brisk, engaging pace")
            }
            
            // Emotional tone
            options.emotionalTone?.let { emotion ->
                append(", conveying a $emotion emotional tone")
            }
            
            // Multi-speaker support
            if (options.enableMultiSpeaker) {
                append(". Use distinct voices for different speakers in dialogue")
                append(". Switch between a narrator voice and character voices as appropriate")
            }
            
            // Language instructions
            if (options.language != "en") {
                append(". Generate speech in ${getLanguageName(options.language)}")
                if (options.enableLanguageSwitching) {
                    append(", switching languages naturally when encountering text in other languages")
                }
            }
            
            // Accessibility enhancements
            if (options.enhanceAccessibility) {
                append(". Include natural pauses at punctuation")
                append(". Emphasize important words and phrases")
                append(". Provide clear pronunciation of technical terms")
            }
            
            append(".\n\nText to synthesize:\n$text")
        }
    }
    
    /**
     * Play generated audio using MediaPlayer
     */
    suspend fun playAudio(audioFile: File): Boolean = withContext(Dispatchers.Main) {
        try {
            stopCurrentPlayback()
            
            currentMediaPlayer = MediaPlayer().apply {
                setDataSource(audioFile.absolutePath)
                setOnCompletionListener {
                    _ttsState.value = _ttsState.value.copy(isPlaying = false)
                }
                setOnErrorListener { _, what, extra ->
                    _ttsState.value = _ttsState.value.copy(
                        isPlaying = false,
                        error = "Playback error: $what, $extra"
                    )
                    true
                }
                prepare()
                start()
            }
            
            _ttsState.value = _ttsState.value.copy(isPlaying = true)
            true
            
        } catch (e: Exception) {
            _ttsState.value = _ttsState.value.copy(
                error = "Playback failed: ${e.message}"
            )
            false
        }
    }
    
    /**
     * Stop current audio playback
     */
    fun stopCurrentPlayback() {
        currentMediaPlayer?.apply {
            if (isPlaying) {
                stop()
            }
            release()
        }
        currentMediaPlayer = null
        _ttsState.value = _ttsState.value.copy(isPlaying = false)
    }
    
    /**
     * Enhanced text-to-speech for e-reader integration
     */
    suspend fun generateBookChapterSpeech(
        chapterText: String,
        chapterTitle: String,
        bookTitle: String,
        apiKey: String,
        options: GeminiTTSOptions = GeminiTTSOptions()
    ): GeminiTTSResult = withContext(Dispatchers.IO) {
        
        val enhancedText = buildString {
            append("Chapter: $chapterTitle from the book $bookTitle.\n\n")
            append(chapterText)
        }
        
        val bookOptions = options.copy(
            style = GeminiTTSStyle.NARRATIVE,
            pace = GeminiTTSPace.NORMAL,
            enhanceAccessibility = true,
            enableMultiSpeaker = chapterText.contains("\"") // Enable if dialogue detected
        )
        
        generateSpeech(enhancedText, apiKey, bookOptions)
    }
    
    /**
     * Utility methods
     */
    private fun splitTextIntoChunks(text: String, chunkSize: Int): List<String> {
        val chunks = mutableListOf<String>()
        var currentIndex = 0
        
        while (currentIndex < text.length) {
            val endIndex = minOf(currentIndex + chunkSize, text.length)
            
            // Try to split at sentence boundary
            var splitIndex = endIndex
            if (endIndex < text.length) {
                val lastPeriod = text.lastIndexOf('.', endIndex)
                val lastExclamation = text.lastIndexOf('!', endIndex)
                val lastQuestion = text.lastIndexOf('?', endIndex)
                
                val sentenceEnd = maxOf(lastPeriod, lastExclamation, lastQuestion)
                if (sentenceEnd > currentIndex + chunkSize / 2) {
                    splitIndex = sentenceEnd + 1
                }
            }
            
            chunks.add(text.substring(currentIndex, splitIndex).trim())
            currentIndex = splitIndex
        }
        
        return chunks
    }
    
    private suspend fun combineAudioFiles(audioFiles: List<File>): File = withContext(Dispatchers.IO) {
        // For now, return the first file. In a full implementation, 
        // you would use audio processing libraries to concatenate the files
        val combinedFile = File(context.cacheDir, "gemini_tts_combined_${System.currentTimeMillis()}.mp3")
        
        // Simple concatenation - in production, use proper audio merging
        combinedFile.outputStream().use { output ->
            audioFiles.forEach { file ->
                file.inputStream().use { input ->
                    input.copyTo(output)
                }
            }
        }
        
        // Clean up temporary files
        audioFiles.forEach { it.delete() }
        
        combinedFile
    }
    
    private fun getAudioDuration(audioFile: File): Long {
        return try {
            val mp = MediaPlayer().apply {
                setDataSource(audioFile.absolutePath)
                prepare()
            }
            val duration = mp.duration.toLong()
            mp.release()
            duration
        } catch (e: Exception) {
            0L
        }
    }
    
    private fun getLanguageName(languageCode: String): String {
        return when (languageCode) {
            "en" -> "English"
            "es" -> "Spanish"
            "fr" -> "French"
            "de" -> "German"
            "it" -> "Italian"
            "pt" -> "Portuguese"
            "ru" -> "Russian"
            "ja" -> "Japanese"
            "ko" -> "Korean"
            "zh" -> "Chinese"
            else -> "the specified language"
        }
    }
}

// Data classes for Gemini TTS
data class GeminiTTSState(
    val isGenerating: Boolean = false,
    val isPlaying: Boolean = false,
    val progress: Float = 0f,
    val currentChunk: Int = 0,
    val totalChunks: Int = 0,
    val error: String? = null,
    val startTime: Long = System.currentTimeMillis()
)

data class GeminiTTSOptions(
    val model: GeminiTTSModel = GeminiTTSModel.FLASH_TTS,
    val voiceName: String = "en-US-Studio-O", // Premium voice
    val language: String = "en",
    val style: GeminiTTSStyle = GeminiTTSStyle.NARRATIVE,
    val pace: GeminiTTSPace = GeminiTTSPace.NORMAL,
    val emotionalTone: String? = null,
    val enableMultiSpeaker: Boolean = false,
    val enableLanguageSwitching: Boolean = true,
    val enhanceAccessibility: Boolean = true
)

enum class GeminiTTSModel(val apiName: String, val displayName: String) {
    FLASH_TTS("gemini-2.5-flash-tts", "Gemini 2.5 Flash TTS"),
    PRO_TTS("gemini-2.5-pro-tts", "Gemini 2.5 Pro TTS")
}

enum class GeminiTTSStyle {
    NARRATIVE, CONVERSATIONAL, DRAMATIC, EDUCATIONAL, CALM, ENERGETIC
}

enum class GeminiTTSPace {
    SLOW, NORMAL, FAST
}

data class GeminiTTSResult(
    val success: Boolean,
    val audioFile: File? = null,
    val duration: Long = 0L, // Duration in milliseconds
    val textLength: Int = 0,
    val language: String = "",
    val processingTimeMs: Long = 0L,
    val error: String? = null
)

// Gemini TTS API data classes
data class GeminiTTSRequest(
    val model: String,
    val contents: List<GeminiTTSContent>,
    val generationConfig: GeminiTTSGenerationConfig,
    val speechConfig: GeminiSpeechConfig
)

data class GeminiTTSContent(
    val parts: List<GeminiTTSPart>
)

data class GeminiTTSPart(
    val text: String
)

data class GeminiTTSGenerationConfig(
    val temperature: Float,
    val candidateCount: Int
)

data class GeminiSpeechConfig(
    val voiceConfig: GeminiVoiceConfig
)

data class GeminiVoiceConfig(
    val prebuiltVoiceConfig: GeminiPrebuiltVoiceConfig
)

data class GeminiPrebuiltVoiceConfig(
    val voiceName: String
)