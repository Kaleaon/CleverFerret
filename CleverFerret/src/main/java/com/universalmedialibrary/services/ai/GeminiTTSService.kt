package com.universalmedialibrary.services.ai

import android.content.Context
import android.speech.tts.TextToSpeech
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.content
import com.google.ai.client.generativeai.type.generationConfig
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Gemini-powered Text-to-Speech Service
 * 
 * Features:
 * - Enhanced TTS using Gemini for natural language processing
 * - Text preprocessing and optimization for better speech quality
 * - Voice cloning suggestions
 * - Emotion and tone detection for expressive reading
 * - Multi-language support with dialect detection
 */
@Singleton
class GeminiTTSService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private const val MODEL_NAME = "gemini-1.5-flash"
        private const val DEFAULT_TEMPERATURE = 0.7f
        private const val MAX_OUTPUT_TOKENS = 2048
    }
    
    private var geminiModel: GenerativeModel? = null
    private var textToSpeech: TextToSpeech? = null
    private var isInitialized = false
    
    /**
     * Initialize Gemini TTS service with API key
     */
    fun initialize(apiKey: String) {
        if (apiKey.isBlank()) {
            throw IllegalArgumentException("Gemini API key is required")
        }
        
        geminiModel = GenerativeModel(
            modelName = MODEL_NAME,
            apiKey = apiKey,
            generationConfig = generationConfig {
                temperature = DEFAULT_TEMPERATURE
                maxOutputTokens = MAX_OUTPUT_TOKENS
            }
        )
        
        // Initialize Android TTS as fallback
        textToSpeech = TextToSpeech(context) { status ->
            if (status == TextToSpeech.SUCCESS) {
                textToSpeech?.language = Locale.US
                isInitialized = true
            }
        }
    }
    
    /**
     * Preprocess text using Gemini for better TTS quality
     * - Normalizes formatting
     * - Expands abbreviations
     * - Adds pronunciation hints
     * - Detects emotion/tone
     */
    suspend fun preprocessTextForTTS(text: String, context: String? = null): TTSPreprocessedText {
        return withContext(Dispatchers.IO) {
            try {
                val prompt = buildPreprocessingPrompt(text, context)
                val response = geminiModel?.generateContent(prompt)
                val processedText = response?.text ?: text
                
                // Parse Gemini response
                parseTTSResponse(processedText, text)
            } catch (e: Exception) {
                // Fallback to original text
                TTSPreprocessedText(
                    originalText = text,
                    processedText = text,
                    detectedEmotion = "neutral",
                    suggestedPitch = 1.0f,
                    suggestedRate = 1.0f,
                    pronunciationHints = emptyMap()
                )
            }
        }
    }
    
    /**
     * Generate natural speech from text using Gemini preprocessing + Android TTS
     */
    suspend fun speak(
        text: String,
        context: String? = null,
        speed: Float = 1.0f,
        pitch: Float = 1.0f
    ): Boolean {
        if (!isInitialized || textToSpeech == null) {
            return false
        }
        
        return withContext(Dispatchers.Main) {
            try {
                // Preprocess with Gemini
                val preprocessed = preprocessTextForTTS(text, context)
                
                // Apply Gemini suggestions
                textToSpeech?.setSpeechRate(speed * preprocessed.suggestedRate)
                textToSpeech?.setPitch(pitch * preprocessed.suggestedPitch)
                
                // Speak processed text
                val result = textToSpeech?.speak(
                    preprocessed.processedText,
                    TextToSpeech.QUEUE_FLUSH,
                    null,
                    "tts_${System.currentTimeMillis()}"
                )
                
                result == TextToSpeech.SUCCESS
            } catch (e: Exception) {
                false
            }
        }
    }
    
    /**
     * Generate voice cloning prompt for character voices in comics
     */
    suspend fun generateVoiceProfile(
        characterName: String,
        characterDescription: String,
        sampleDialogue: List<String>
    ): VoiceProfile {
        return withContext(Dispatchers.IO) {
            try {
                val prompt = """
                    Analyze this character and suggest voice characteristics for text-to-speech:
                    
                    Character: $characterName
                    Description: $characterDescription
                    
                    Sample Dialogue:
                    ${sampleDialogue.joinToString("\n") { "- \"$it\"" }}
                    
                    Provide voice profile with:
                    1. Pitch (0.5-2.0, where 1.0 is normal)
                    2. Speed (0.5-2.0, where 1.0 is normal)
                    3. Tone (warm/cold/neutral)
                    4. Emotion range (calm/energetic/variable)
                    5. Voice type (deep/high/medium)
                    
                    Format: JSON with keys: pitch, speed, tone, emotion, voiceType, description
                """.trimIndent()
                
                val response = geminiModel?.generateContent(prompt)
                parseVoiceProfile(response?.text ?: "", characterName)
            } catch (e: Exception) {
                VoiceProfile(
                    characterName = characterName,
                    pitch = 1.0f,
                    speed = 1.0f,
                    tone = "neutral",
                    emotion = "calm",
                    voiceType = "medium"
                )
            }
        }
    }
    
    /**
     * Detect language and suggest best TTS settings
     */
    suspend fun detectLanguageAndOptimize(text: String): LanguageOptimization {
        return withContext(Dispatchers.IO) {
            try {
                val prompt = """
                    Detect the language of this text and suggest optimal TTS settings:
                    
                    Text: "$text"
                    
                    Provide:
                    1. Language code (ISO 639-1)
                    2. Confidence (0-1)
                    3. Dialect/region if applicable
                    4. Suggested speaking rate for this language
                    5. Any pronunciation challenges
                    
                    Format: JSON
                """.trimIndent()
                
                val response = geminiModel?.generateContent(prompt)
                parseLanguageOptimization(response?.text ?: "")
            } catch (e: Exception) {
                LanguageOptimization(
                    languageCode = "en",
                    confidence = 0.5f,
                    dialect = "US",
                    suggestedRate = 1.0f,
                    pronunciationHints = emptyList()
                )
            }
        }
    }
    
    /**
     * Generate expressive narration for comic panels
     */
    suspend fun generateExpressiveNarration(
        panelText: String,
        panelContext: String,
        previousPanels: List<String>
    ): String {
        return withContext(Dispatchers.IO) {
            try {
                val prompt = """
                    Convert this comic panel text into expressive narration suitable for text-to-speech:
                    
                    Current Panel: "$panelText"
                    Context: $panelContext
                    
                    Previous Panels:
                    ${previousPanels.joinToString("\n") { "- $it" }}
                    
                    Guidelines:
                    - Add emotional cues for TTS
                    - Expand sound effects into descriptions
                    - Convert visual elements to audio-friendly descriptions
                    - Maintain character voice consistency
                    - Keep it natural and engaging
                    
                    Return only the narration text, no explanations.
                """.trimIndent()
                
                val response = geminiModel?.generateContent(prompt)
                response?.text?.trim() ?: panelText
            } catch (e: Exception) {
                panelText
            }
        }
    }
    
    // Helper methods
    
    private fun buildPreprocessingPrompt(text: String, context: String?): String {
        return """
            Optimize this text for natural text-to-speech:
            
            Text: "$text"
            ${if (context != null) "Context: $context" else ""}
            
            Tasks:
            1. Normalize formatting (numbers, dates, abbreviations)
            2. Expand acronyms naturally
            3. Add pronunciation hints for difficult words
            4. Detect emotional tone
            5. Suggest pitch and rate adjustments
            
            Return JSON format:
            {
                "processedText": "normalized text",
                "emotion": "happy/sad/angry/neutral/etc",
                "suggestedPitch": 0.8-1.2,
                "suggestedRate": 0.8-1.2,
                "pronunciationHints": {"word": "pronunciation"}
            }
        """.trimIndent()
    }
    
    private fun parseTTSResponse(response: String, originalText: String): TTSPreprocessedText {
        // Simple JSON-like parsing (in production, use proper JSON parser)
        return try {
            val processedText = extractJsonValue(response, "processedText") ?: originalText
            val emotion = extractJsonValue(response, "emotion") ?: "neutral"
            val pitch = extractJsonValue(response, "suggestedPitch")?.toFloatOrNull() ?: 1.0f
            val rate = extractJsonValue(response, "suggestedRate")?.toFloatOrNull() ?: 1.0f
            
            TTSPreprocessedText(
                originalText = originalText,
                processedText = processedText,
                detectedEmotion = emotion,
                suggestedPitch = pitch.coerceIn(0.5f, 2.0f),
                suggestedRate = rate.coerceIn(0.5f, 2.0f),
                pronunciationHints = emptyMap()
            )
        } catch (e: Exception) {
            TTSPreprocessedText(
                originalText = originalText,
                processedText = originalText,
                detectedEmotion = "neutral",
                suggestedPitch = 1.0f,
                suggestedRate = 1.0f,
                pronunciationHints = emptyMap()
            )
        }
    }
    
    private fun parseVoiceProfile(response: String, characterName: String): VoiceProfile {
        return try {
            VoiceProfile(
                characterName = characterName,
                pitch = extractJsonValue(response, "pitch")?.toFloatOrNull() ?: 1.0f,
                speed = extractJsonValue(response, "speed")?.toFloatOrNull() ?: 1.0f,
                tone = extractJsonValue(response, "tone") ?: "neutral",
                emotion = extractJsonValue(response, "emotion") ?: "calm",
                voiceType = extractJsonValue(response, "voiceType") ?: "medium",
                description = extractJsonValue(response, "description")
            )
        } catch (e: Exception) {
            VoiceProfile(characterName = characterName)
        }
    }
    
    private fun parseLanguageOptimization(response: String): LanguageOptimization {
        return try {
            LanguageOptimization(
                languageCode = extractJsonValue(response, "languageCode") ?: "en",
                confidence = extractJsonValue(response, "confidence")?.toFloatOrNull() ?: 0.5f,
                dialect = extractJsonValue(response, "dialect"),
                suggestedRate = extractJsonValue(response, "suggestedRate")?.toFloatOrNull() ?: 1.0f,
                pronunciationHints = emptyList()
            )
        } catch (e: Exception) {
            LanguageOptimization()
        }
    }
    
```suggestion
private fun extractJsonValue(json: String, key: String): String? {
    val quoted = ("\"$key\"\\s*:\\s*\"([^\"]*)\"".toRegex().find(json))?.groupValues?.getOrNull(1)
    if (quoted != null) return quoted
    val numeric = ("\"$key\"\\s*:\\s*([-+]?[0-9]*\\.?[0-9]+)".toRegex().find(json))?.groupValues?.getOrNull(1)
    return numeric
}
        val regex = """"$key"\s*:\s*"([^"]*)"""".toRegex()
        val match = regex.find(json)
        return match?.groupValues?.getOrNull(1)
    }
    
    fun stop() {
        textToSpeech?.stop()
    }
    
    fun shutdown() {
        textToSpeech?.shutdown()
        textToSpeech = null
        geminiModel = null
        isInitialized = false
    }
}

// Data classes

data class TTSPreprocessedText(
    val originalText: String,
    val processedText: String,
    val detectedEmotion: String,
    val suggestedPitch: Float,
    val suggestedRate: Float,
    val pronunciationHints: Map<String, String>
)

data class VoiceProfile(
    val characterName: String,
    val pitch: Float = 1.0f,
    val speed: Float = 1.0f,
    val tone: String = "neutral",
    val emotion: String = "calm",
    val voiceType: String = "medium",
    val description: String? = null
)

data class LanguageOptimization(
    val languageCode: String = "en",
    val confidence: Float = 1.0f,
    val dialect: String? = null,
    val suggestedRate: Float = 1.0f,
    val pronunciationHints: List<String> = emptyList()
)
