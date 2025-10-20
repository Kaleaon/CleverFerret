package com.universalmedialibrary.services.comic

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Log
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.content
import com.google.ai.client.generativeai.type.generationConfig
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import java.io.ByteArrayOutputStream
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified Gemini Comic Service
 * 
 * Uses Gemini Vision API to handle ALL comic analysis tasks:
 * - Panel detection and boundary identification
 * - OCR text extraction from speech bubbles
 * - Language detection
 * - Context-aware translation
 * - Reading order determination (LTR vs RTL)
 * - Speech bubble location identification
 * 
 * Single API, zero additional dependencies!
 */
@Singleton
class GeminiComicService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private const val TAG = "GeminiComicService"
        private const val MODEL_NAME = "gemini-1.5-flash"
        private const val VISION_MODEL_NAME = "gemini-1.5-flash"
        private const val MAX_OUTPUT_TOKENS = 4096
    }
    
    private var geminiModel: GenerativeModel? = null
    private var visionModel: GenerativeModel? = null
    private var isInitialized = false
    
    private val json = Json {
        ignoreUnknownKeys = true
        isLenient = true
    }
    
    private fun requireInitialized() {
        if (!isInitialized) {
            throw IllegalStateException("GeminiComicService must be initialized with an API key before use. Call initialize(apiKey) first.")
        }
    }
    
    /**
     * Initialize Gemini service with API key
     */
    fun initialize(apiKey: String) {
        if (apiKey.isBlank()) {
            throw IllegalArgumentException("Gemini API key is required")
        }
        
        geminiModel = GenerativeModel(
            modelName = MODEL_NAME,
            apiKey = apiKey,
            generationConfig = generationConfig {
                temperature = 0.4f
                maxOutputTokens = MAX_OUTPUT_TOKENS
            }
        )
        
        visionModel = GenerativeModel(
            modelName = VISION_MODEL_NAME,
            apiKey = apiKey,
            generationConfig = generationConfig {
                temperature = 0.4f
                maxOutputTokens = MAX_OUTPUT_TOKENS
            }
        )
        
        isInitialized = true
    }
    
    /**
     * Detect all panels in a comic page using Gemini Vision
     */
    suspend fun detectPanels(imagePath: String, pageNumber: Int): PanelDetectionResult {
        requireInitialized()
        return withContext(Dispatchers.IO) {
            try {
                val bitmap = BitmapFactory.decodeFile(imagePath)
                if (bitmap == null) {
                    return@withContext PanelDetectionResult(
                        pageNumber = pageNumber,
                        panels = emptyList(),
                        detectionMethod = "gemini_vision",
                        confidence = 0.0f,
                        error = "Failed to decode image at path: $imagePath"
                    )
                }
                detectPanelsFromBitmap(bitmap, pageNumber)
            } catch (e: Exception) {
                Log.e(TAG, "Error detecting panels: ${e.message}", e)
                PanelDetectionResult(
                    pageNumber = pageNumber,
                    panels = emptyList(),
                    detectionMethod = "gemini_vision",
                    confidence = 0.0f,
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Detect panels from bitmap using Gemini Vision
     */
    suspend fun detectPanelsFromBitmap(bitmap: Bitmap, pageNumber: Int): PanelDetectionResult {
        requireInitialized()
        return withContext(Dispatchers.IO) {
            try {
                val prompt = """
                    Analyze this comic book page and identify all panels.
                    
                    For each panel, provide:
                    1. Panel number/index (starting from 0)
                    2. Bounding box coordinates as percentages (0-100) of image dimensions:
                       - x: left edge position (% from left)
                       - y: top edge position (% from top)
                       - width: panel width (% of image width)
                       - height: panel height (% of image height)
                    3. Reading order (0 for first panel to read, 1 for second, etc.)
                    4. Confidence score (0.0 to 1.0)
                    
                    Also determine:
                    - Is this manga-style (right-to-left reading)? true/false
                    - Overall detection confidence (0.0 to 1.0)
                    
                    Return ONLY a JSON object with this exact structure:
                    {
                      "isRightToLeft": false,
                      "confidence": 0.9,
                      "panels": [
                        {
                          "panelIndex": 0,
                          "x": 10.5,
                          "y": 5.2,
                          "width": 40.3,
                          "height": 45.8,
                          "readingOrder": 0,
                          "confidence": 0.95
                        }
                      ]
                    }
                    
                    If this is a single splash page with no distinct panels, return an empty panels array.
                    Be precise with the coordinates - they should tightly fit each panel.
                """.trimIndent()
                
                val response = visionModel?.generateContent(
                    content {
                        image(bitmap)
                        text(prompt)
                    }
                )
                
                val jsonResponse = response?.text?.trim() ?: ""
                
                // Extract JSON from response (may have markdown formatting)
                val jsonString = extractJsonFromResponse(jsonResponse)
                
                // Parse response
                val geminiResponse = json.decodeFromString<GeminiPanelResponse>(jsonString)
                
                // Convert to our format
                val panels = geminiResponse.panels.map { geminiPanel ->
                    DetectedPanel(
                        panelIndex = geminiPanel.panelIndex,
                        pageNumber = pageNumber,
                        bounds = NormalizedRect(
                            x = (geminiPanel.x / 100.0).toFloat(),
                            y = (geminiPanel.y / 100.0).toFloat(),
                            width = (geminiPanel.width / 100.0).toFloat(),
                            height = (geminiPanel.height / 100.0).toFloat()
                        ),
                        confidence = geminiPanel.confidence.toFloat(),
                        area = ((geminiPanel.width * geminiPanel.height) / 10000.0).toFloat(),
                        readingOrder = geminiPanel.readingOrder
                    )
                }
                
                PanelDetectionResult(
                    pageNumber = pageNumber,
                    panels = panels,
                    detectionMethod = "gemini_vision",
                    confidence = geminiResponse.confidence.toFloat(),
                    isRightToLeft = geminiResponse.isRightToLeft
                )
                
            } catch (e: Exception) {
                Log.e(TAG, "Error in Gemini panel detection: ${e.message}", e)
                PanelDetectionResult(
                    pageNumber = pageNumber,
                    panels = emptyList(),
                    detectionMethod = "gemini_vision",
                    confidence = 0.0f,
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Detect speech bubbles within a panel using Gemini Vision
     */
    suspend fun detectSpeechBubbles(
        imagePath: String,
        panelBounds: NormalizedRect
    ): List<DetectedSpeechBubble> {
        requireInitialized()
        return withContext(Dispatchers.IO) {
            try {
                val bitmap = BitmapFactory.decodeFile(imagePath)
                if (bitmap == null) {
                    Log.e(TAG, "Failed to decode image at path: $imagePath")
                    return@withContext emptyList()
                }
                val panelBitmap = cropBitmap(bitmap, panelBounds)
                
                val prompt = """
                    Identify all speech bubbles and text boxes in this comic panel.
                    
                    For each bubble/text box, provide:
                    1. Bubble index (starting from 0)
                    2. Bounding box as percentages (0-100) of panel dimensions:
                       - x: left position (%)
                       - y: top position (%)
                       - width: bubble width (%)
                       - height: bubble height (%)
                    3. Confidence score (0.0 to 1.0)
                    
                    Return ONLY a JSON object:
                    {
                      "bubbles": [
                        {
                          "bubbleIndex": 0,
                          "x": 15.0,
                          "y": 10.0,
                          "width": 30.0,
                          "height": 15.0,
                          "confidence": 0.9
                        }
                      ]
                    }
                """.trimIndent()
                
                val response = visionModel?.generateContent(
                    content {
                        image(panelBitmap)
                        text(prompt)
                    }
                )
                
                val jsonResponse = response?.text?.trim() ?: ""
                val jsonString = extractJsonFromResponse(jsonResponse)
                
                val geminiResponse = json.decodeFromString<GeminiBubbleResponse>(jsonString)
                
                geminiResponse.bubbles.map { bubble ->
                    DetectedSpeechBubble(
                        bounds = NormalizedRect(
                            x = (bubble.x / 100.0).toFloat(),
                            y = (bubble.y / 100.0).toFloat(),
                            width = (bubble.width / 100.0).toFloat(),
                            height = (bubble.height / 100.0).toFloat()
                        ),
                        text = bubble.text ?: "",
                        detectedLanguage = bubble.detectedLanguage ?: "unknown",
                        confidence = bubble.confidence.toFloat(),
                        ocr = OcrResult(
                            text = bubble.text ?: "",
                            confidence = bubble.confidence.toFloat(),
                            detectedLanguage = bubble.detectedLanguage ?: "unknown"
                        )
                    )
                }
                
            } catch (e: Exception) {
                Log.e(TAG, "Error detecting bubbles: ${e.message}", e)
                emptyList()
            }
        }
    }
    
    /**
     * Extract and translate text from a speech bubble using Gemini Vision
     */
    suspend fun extractAndTranslateText(
        imagePath: String,
        bubbleBounds: NormalizedRect,
        panelBounds: NormalizedRect?,
        targetLanguage: String,
        context: String? = null
    ): BubbleTextResult {
        requireInitialized()
        return withContext(Dispatchers.IO) {
            try {
                val bitmap = BitmapFactory.decodeFile(imagePath)
                if (bitmap == null) {
                    return@withContext BubbleTextResult(
                        originalText = "",
                        detectedLanguage = "unknown",
                        translatedText = "",
                        ocrConfidence = 0.0f,
                        translationConfidence = 0.0f,
                        error = "Failed to decode image at path: $imagePath"
                    )
                }
                
                // Crop to bubble region
                val bubbleBitmap = if (panelBounds != null) {
                    val panelBitmap = cropBitmap(bitmap, panelBounds)
                    cropBitmap(panelBitmap, bubbleBounds)
                } else {
                    cropBitmap(bitmap, bubbleBounds)
                }
                
                val prompt = """
                    Extract the text from this speech bubble and translate it.
                    
                    ${if (context != null) "Context: $context" else ""}
                    
                    Tasks:
                    1. Extract all visible text (OCR)
                    2. Detect the source language (ISO 639-1 code)
                    3. Translate to $targetLanguage
                    4. Provide confidence scores
                    
                    Return ONLY a JSON object:
                    {
                      "originalText": "extracted text",
                      "detectedLanguage": "en",
                      "translatedText": "translated text",
                      "ocrConfidence": 0.95,
                      "translationConfidence": 0.9
                    }
                    
                    If no text is visible, return empty strings for text fields.
                """.trimIndent()
                
                val response = visionModel?.generateContent(
                    content {
                        image(bubbleBitmap)
                        text(prompt)
                    }
                )
                
                val jsonResponse = response?.text?.trim() ?: ""
                val jsonString = extractJsonFromResponse(jsonResponse)
                
                val result = json.decodeFromString<GeminiTextResponse>(jsonString)
                
                BubbleTextResult(
                    originalText = result.originalText,
                    detectedLanguage = result.detectedLanguage,
                    translatedText = result.translatedText,
                    ocrConfidence = result.ocrConfidence.toFloat(),
                    translationConfidence = result.translationConfidence.toFloat()
                )
                
            } catch (e: Exception) {
                Log.e(TAG, "Error extracting/translating text: ${e.message}", e)
                BubbleTextResult(
                    originalText = "",
                    detectedLanguage = "unknown",
                    translatedText = "",
                    ocrConfidence = 0.0f,
                    translationConfidence = 0.0f,
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Analyze entire comic page in one shot (panels + text + translation)
     */
    suspend fun analyzeCompletePage(
        imagePath: String,
        pageNumber: Int,
        targetLanguage: String,
        comicTitle: String? = null
    ): CompletePageAnalysis {
        requireInitialized()
        return withContext(Dispatchers.IO) {
            try {
                val bitmap = BitmapFactory.decodeFile(imagePath)
                if (bitmap == null) {
                    return@withContext CompletePageAnalysis(
                        pageNumber = pageNumber,
                        isRightToLeft = false,
                        confidence = 0.0f,
                        panels = emptyList(),
                        error = "Failed to decode image at path: $imagePath"
                    )
                }
                
                val prompt = """
                    Analyze this complete comic book page and provide comprehensive information.
                    
                    Comic: ${comicTitle ?: "Unknown"}
                    Page: $pageNumber
                    
                    Provide:
                    1. All panels with precise coordinates (% of image dimensions)
                    2. Reading order (manga style: right-to-left? true/false)
                    3. For each panel:
                       - All speech bubbles with coordinates
                       - OCR extracted text from each bubble
                       - Detected language
                       - Translation to $targetLanguage
                    
                    Return ONLY this JSON structure:
                    {
                      "isRightToLeft": false,
                      "confidence": 0.9,
                      "panels": [
                        {
                          "panelIndex": 0,
                          "x": 10.0,
                          "y": 5.0,
                          "width": 40.0,
                          "height": 45.0,
                          "readingOrder": 0,
                          "bubbles": [
                            {
                              "bubbleIndex": 0,
                              "x": 15.0,
                              "y": 10.0,
                              "width": 25.0,
                              "height": 10.0,
                              "originalText": "Hello!",
                              "detectedLanguage": "en",
                              "translatedText": "¡Hola!"
                            }
                          ]
                        }
                      ]
                    }
                    
                    Be thorough and accurate with all coordinates and text.
                """.trimIndent()
                
                val response = visionModel?.generateContent(
                    content {
                        image(bitmap)
                        text(prompt)
                    }
                )
                
                val jsonResponse = response?.text?.trim() ?: ""
                val jsonString = extractJsonFromResponse(jsonResponse)
                
                val result = json.decodeFromString<GeminiCompletePageResponse>(jsonString)
                
                CompletePageAnalysis(
                    pageNumber = pageNumber,
                    isRightToLeft = result.isRightToLeft,
                    confidence = result.confidence.toFloat(),
                    panels = result.panels.map { panel ->
                        AnalyzedPanel(
                            panelIndex = panel.panelIndex,
                            bounds = NormalizedRect(
                                x = (panel.x / 100.0).toFloat(),
                                y = (panel.y / 100.0).toFloat(),
                                width = (panel.width / 100.0).toFloat(),
                                height = (panel.height / 100.0).toFloat()
                            ),
                            readingOrder = panel.readingOrder,
                            bubbles = panel.bubbles.map { bubble ->
                                AnalyzedBubble(
                                    bubbleIndex = bubble.bubbleIndex,
                                    bounds = NormalizedRect(
                                        x = (bubble.x / 100.0).toFloat(),
                                        y = (bubble.y / 100.0).toFloat(),
                                        width = (bubble.width / 100.0).toFloat(),
                                        height = (bubble.height / 100.0).toFloat()
                                    ),
                                    originalText = bubble.originalText,
                                    detectedLanguage = bubble.detectedLanguage,
                                    translatedText = bubble.translatedText
                                )
                            }
                        )
                    }
                )
                
            } catch (e: Exception) {
                Log.e(TAG, "Error analyzing complete page: ${e.message}", e)
                CompletePageAnalysis(
                    pageNumber = pageNumber,
                    isRightToLeft = false,
                    confidence = 0.0f,
                    panels = emptyList(),
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Generate expressive narration for TTS
     */
    suspend fun generateNarration(
        panelTexts: List<String>,
        comicContext: String,
        previousPanels: List<String> = emptyList()
    ): String {
        requireInitialized()
        return withContext(Dispatchers.IO) {
            try {
                val prompt = """
                    Convert this comic panel dialogue into expressive narration for text-to-speech.
                    
                    Panel text: ${panelTexts.joinToString(" | ")}
                    Context: $comicContext
                    Previous panels: ${previousPanels.joinToString(" | ")}
                    
                    Guidelines:
                    - Add emotional cues (excited, worried, calm, etc.)
                    - Describe sound effects naturally
                    - Maintain character voices
                    - Keep it engaging for audio
                    - Natural pacing
                    
                    Return only the narration text, no explanations.
                """.trimIndent()
                
                val response = geminiModel?.generateContent(prompt)
                response?.text?.trim() ?: panelTexts.joinToString(" ")
                
            } catch (e: Exception) {
                Log.e(TAG, "Error generating narration: ${e.message}", e)
                panelTexts.joinToString(" ")
            }
        }
    }
    
    // Helper methods
    
    private fun extractJsonFromResponse(response: String): String {
        // Remove markdown code blocks if present
        var json = response.trim()
        if (json.startsWith("```json")) {
            json = json.removePrefix("```json").removeSuffix("```").trim()
        } else if (json.startsWith("```")) {
            json = json.removePrefix("```").removeSuffix("```").trim()
        }
        return json
    }
    
    private fun cropBitmap(bitmap: Bitmap, bounds: NormalizedRect): Bitmap {
        val x = (bounds.x * bitmap.width).toInt().coerceIn(0, bitmap.width - 1)
        val y = (bounds.y * bitmap.height).toInt().coerceIn(0, bitmap.height - 1)
        val width = (bounds.width * bitmap.width).toInt().coerceAtLeast(1)
        val height = (bounds.height * bitmap.height).toInt().coerceAtLeast(1)
        
        val safeWidth = width.coerceAtMost(bitmap.width - x)
        val safeHeight = height.coerceAtMost(bitmap.height - y)
        
        if (safeWidth <= 0 || safeHeight <= 0) {
            Log.w(TAG, "Invalid crop dimensions: ${safeWidth}x${safeHeight}, returning 1x1 bitmap")
            return Bitmap.createBitmap(1, 1, bitmap.config ?: Bitmap.Config.ARGB_8888)
        }
        
        return Bitmap.createBitmap(bitmap, x, y, safeWidth, safeHeight)
    }
}

// Gemini response data classes

@Serializable
private data class GeminiPanelResponse(
    val isRightToLeft: Boolean,
    val confidence: Double,
    val panels: List<GeminiPanel>
)

@Serializable
private data class GeminiPanel(
    val panelIndex: Int,
    val x: Double,
    val y: Double,
    val width: Double,
    val height: Double,
    val readingOrder: Int,
    val confidence: Double
)

@Serializable
private data class GeminiBubbleResponse(
    val bubbles: List<GeminiBubble>
)

@Serializable
private data class GeminiBubble(
    val bubbleIndex: Int,
    val x: Double,
    val y: Double,
    val width: Double,
    val height: Double,
    val confidence: Double,
    val text: String? = null,
    val detectedLanguage: String? = null
)

@Serializable
private data class GeminiTextResponse(
    val originalText: String,
    val detectedLanguage: String,
    val translatedText: String,
    val ocrConfidence: Double,
    val translationConfidence: Double
)

@Serializable
private data class GeminiCompletePageResponse(
    val isRightToLeft: Boolean,
    val confidence: Double,
    val panels: List<GeminiCompletePanel>
)

@Serializable
private data class GeminiCompletePanel(
    val panelIndex: Int,
    val x: Double,
    val y: Double,
    val width: Double,
    val height: Double,
    val readingOrder: Int,
    val bubbles: List<GeminiCompleteBubble>
)

@Serializable
private data class GeminiCompleteBubble(
    val bubbleIndex: Int,
    val x: Double,
    val y: Double,
    val width: Double,
    val height: Double,
    val originalText: String,
    val detectedLanguage: String,
    val translatedText: String
)

// Result data classes

data class BubbleTextResult(
    val originalText: String,
    val detectedLanguage: String,
    val translatedText: String,
    val ocrConfidence: Float,
    val translationConfidence: Float,
    val error: String? = null
)

data class CompletePageAnalysis(
    val pageNumber: Int,
    val isRightToLeft: Boolean,
    val confidence: Float,
    val panels: List<AnalyzedPanel>,
    val error: String? = null
)

data class AnalyzedPanel(
    val panelIndex: Int,
    val bounds: NormalizedRect,
    val readingOrder: Int,
    val bubbles: List<AnalyzedBubble>
)

data class AnalyzedBubble(
    val bubbleIndex: Int,
    val bounds: NormalizedRect,
    val originalText: String,
    val detectedLanguage: String,
    val translatedText: String
)

/**
 * Normalized rectangle for bounding box coordinates (0.0 to 1.0)
 */
data class NormalizedRect(
    val x: Float,
    val y: Float,
    val width: Float,
    val height: Float
) {
    val area: Float get() = width * height
}

/**
 * Result from panel detection
 */
data class PanelDetectionResult(
    val pageNumber: Int,
    val panels: List<DetectedPanel>,
    val detectionMethod: String,
    val confidence: Float,
    val error: String? = null,
    val isRightToLeft: Boolean = false
)

/**
 * Detected panel information
 */
data class DetectedPanel(
    val pageNumber: Int,
    val panelIndex: Int,
    val bounds: NormalizedRect,
    val confidence: Float,
    val readingOrder: Int,
    val area: Float = bounds.area
)

/**
 * Result from page translation
 */
data class PageTranslationResult(
    val pageNumber: Int,
    val panels: List<TranslatedPanel>,
    val sourceLanguage: String,
    val targetLanguage: String,
    val translationMethod: String,
    val error: String? = null
)

/**
 * Translated panel information
 */
data class TranslatedPanel(
    val panelIndex: Int,
    val bubbles: List<TranslatedBubble>
)

/**
 * Translated speech bubble
 */
data class TranslatedBubble(
    val bounds: NormalizedRect,
    val originalText: String,
    val translatedText: String,
    val confidence: Float
)

/**
 * Detected speech bubble
 */
data class DetectedSpeechBubble(
    val bounds: NormalizedRect,
    val text: String,
    val detectedLanguage: String,
    val confidence: Float,
    val ocr: OcrResult
)

/**
 * OCR result data
 */
data class OcrResult(
    val text: String,
    val confidence: Float,
    val detectedLanguage: String = "",
    val language: String = detectedLanguage // Alias for compatibility
)

/**
 * Translation result data
 */
data class TranslationResult(
    val translatedText: String,
    val confidence: Float,
    val targetLanguage: String = ""
)

/**
 * Bubble translation result combining OCR and translation
 */
data class BubbleTranslationResult(
    val bubble: DetectedSpeechBubble,
    val ocr: OcrResult,
    val translation: TranslationResult?
)

/**
 * Panel translation wrapper
 */
data class PanelTranslationWrapper(
    val panel: DetectedPanel,
    val bubbles: List<BubbleTranslationResult>
)

/**
 * Page translation wrapper
 */
data class PageTranslationWrapper(
    val pageNumber: Int,
    val panels: List<PanelTranslationWrapper>
)
