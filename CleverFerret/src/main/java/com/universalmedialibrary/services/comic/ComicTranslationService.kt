package com.universalmedialibrary.services.comic

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Log
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.generationConfig
import com.google.mlkit.nl.translate.TranslateLanguage
import com.google.mlkit.nl.translate.Translation
import com.google.mlkit.nl.translate.TranslatorOptions
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.tasks.await
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Comic Translation Service
 * 
 * Features:
 * - OCR text extraction from speech bubbles using ML Kit
 * - Language detection
 * - Translation using ML Kit + Gemini for context-aware translations
 * - Text positioning and formatting preservation
 */
@Singleton
class ComicTranslationService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private const val TAG = "ComicTranslation"
        private const val MODEL_NAME = "gemini-1.5-flash"
    }
    
    private val textRecognizer = TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)
    private var geminiModel: GenerativeModel? = null
    private val translators = mutableMapOf<String, com.google.mlkit.nl.translate.Translator>()
    
    /**
     * Initialize with Gemini API key for enhanced translations
     */
    fun initialize(apiKey: String) {
        if (apiKey.isNotBlank()) {
            geminiModel = GenerativeModel(
                modelName = MODEL_NAME,
                apiKey = apiKey,
                generationConfig = generationConfig {
                    temperature = 0.3f // Lower for more consistent translations
                    maxOutputTokens = 1024
                }
            )
        }
    }
    
    /**
     * Extract text from a speech bubble region
     */
    suspend fun extractTextFromBubble(
        imagePath: String,
        bubbleBounds: NormalizedRect,
        panelBounds: NormalizedRect? = null
    ): OCRResult {
        return withContext(Dispatchers.IO) {
            try {
                val bitmap = BitmapFactory.decodeFile(imagePath)
                
                // Crop to bubble region
                val bubbleBitmap = if (panelBounds != null) {
                    // Bubble coords are relative to panel, convert to image coords
                    val imageBubbleBounds = convertPanelToImageCoords(bubbleBounds, panelBounds)
                    cropToBounds(bitmap, imageBubbleBounds)
                } else {
                    cropToBounds(bitmap, bubbleBounds)
                }
                
                // Perform OCR
                val inputImage = InputImage.fromBitmap(bubbleBitmap, 0)
                val visionText = textRecognizer.process(inputImage).await()
                
                val extractedText = visionText.text
                val confidence = if (visionText.textBlocks.isNotEmpty()) {
                    visionText.textBlocks.map { it.confidence ?: 0.5f }.average().toFloat()
                } else {
                    0.0f
                }
                
                bubbleBitmap.recycle()
                
                OCRResult(
                    text = extractedText,
                    confidence = confidence,
                    language = detectLanguage(extractedText),
                    bounds = bubbleBounds
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error extracting text: ${e.message}", e)
                OCRResult(
                    text = "",
                    confidence = 0.0f,
                    language = "unknown",
                    bounds = bubbleBounds,
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Translate text using ML Kit + Gemini for context
     */
    suspend fun translateText(
        text: String,
        sourceLanguage: String,
        targetLanguage: String,
        context: TranslationContext? = null
    ): TranslationResult {
        return withContext(Dispatchers.IO) {
            try {
                // Try Gemini first for context-aware translation
                val geminiTranslation = if (geminiModel != null && context != null) {
                    translateWithGemini(text, sourceLanguage, targetLanguage, context)
                } else {
                    null
                }
                
                // Fallback to ML Kit translation
                val mlkitTranslation = if (geminiTranslation == null) {
                    translateWithMLKit(text, sourceLanguage, targetLanguage)
                } else {
                    null
                }
                
                val translatedText = geminiTranslation ?: mlkitTranslation ?: text
                
                TranslationResult(
                    originalText = text,
                    translatedText = translatedText,
                    sourceLanguage = sourceLanguage,
                    targetLanguage = targetLanguage,
                    method = if (geminiTranslation != null) "gemini" else "mlkit",
                    confidence = if (geminiTranslation != null) 0.9f else 0.7f
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error translating text: ${e.message}", e)
                TranslationResult(
                    originalText = text,
                    translatedText = text,
                    sourceLanguage = sourceLanguage,
                    targetLanguage = targetLanguage,
                    method = "failed",
                    confidence = 0.0f,
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Translate with Gemini for context-aware comic translation
     */
    private suspend fun translateWithGemini(
        text: String,
        sourceLanguage: String,
        targetLanguage: String,
        context: TranslationContext
    ): String? {
        return try {
            val prompt = buildTranslationPrompt(text, sourceLanguage, targetLanguage, context)
            val response = geminiModel?.generateContent(prompt)
            response?.text?.trim()
        } catch (e: Exception) {
            Log.e(TAG, "Gemini translation failed: ${e.message}", e)
            null
        }
    }
    
    /**
     * Translate with ML Kit
     */
    private suspend fun translateWithMLKit(
        text: String,
        sourceLanguage: String,
        targetLanguage: String
    ): String? {
        return try {
            val sourceCode = mapToMLKitLanguageCode(sourceLanguage)
            val targetCode = mapToMLKitLanguageCode(targetLanguage)
            
            if (sourceCode == null || targetCode == null) {
                return null
            }
            
            val translatorKey = "$sourceCode-$targetCode"
            val translator = translators.getOrPut(translatorKey) {
                val options = TranslatorOptions.Builder()
                    .setSourceLanguage(sourceCode)
                    .setTargetLanguage(targetCode)
                    .build()
                Translation.getClient(options).also { translator ->
                    // Download model if needed
                    translator.downloadModelIfNeeded().await()
                }
            }
            
            translator.translate(text).await()
        } catch (e: Exception) {
            Log.e(TAG, "ML Kit translation failed: ${e.message}", e)
            null
        }
    }
    
    /**
     * Batch translate multiple speech bubbles
     */
    suspend fun batchTranslate(
        imagePath: String,
        bubbles: List<DetectedSpeechBubble>,
        panelBounds: NormalizedRect?,
        sourceLanguage: String,
        targetLanguage: String,
        context: TranslationContext? = null
    ): List<BubbleTranslation> {
        return withContext(Dispatchers.IO) {
            bubbles.map { bubble ->
                // Extract text
                val ocrResult = extractTextFromBubble(imagePath, bubble.bounds, panelBounds)
                
                // Translate if text found
                val translation = if (ocrResult.text.isNotBlank()) {
                    translateText(
                        ocrResult.text,
                        sourceLanguage,
                        targetLanguage,
                        context
                    )
                } else {
                    null
                }
                
                BubbleTranslation(
                    bubble = bubble,
                    ocr = ocrResult,
                    translation = translation
                )
            }
        }
    }
    
    /**
     * Auto-detect and translate entire comic page
     */
    suspend fun translateComicPage(
        imagePath: String,
        panels: List<DetectedPanel>,
        targetLanguage: String,
        comicTitle: String? = null,
        previousContext: List<String> = emptyList()
    ): PageTranslationResult {
        return withContext(Dispatchers.IO) {
            val panelTranslations = mutableListOf<PanelTranslation>()
            
            for (panel in panels) {
                // Detect speech bubbles in panel
                val panelDetector = ComicPanelDetector()
                val bubbles = panelDetector.detectSpeechBubbles(imagePath, panel.bounds)
                
                // Build context from previous panels
                val context = TranslationContext(
                    comicTitle = comicTitle,
                    pageNumber = panel.pageNumber,
                    panelIndex = panel.panelIndex,
                    previousDialogue = previousContext.takeLast(3)
                )
                
                // Translate bubbles
                val bubbleTranslations = batchTranslate(
                    imagePath,
                    bubbles,
                    panel.bounds,
                    "auto", // Auto-detect
                    targetLanguage,
                    context
                )
                
                panelTranslations.add(
                    PanelTranslation(
                        panel = panel,
                        bubbles = bubbleTranslations
                    )
                )
            }
            
            PageTranslationResult(
                pageNumber = panels.firstOrNull()?.pageNumber ?: 0,
                panels = panelTranslations,
                targetLanguage = targetLanguage
            )
        }
    }
    
    // Helper methods
    
    private fun buildTranslationPrompt(
        text: String,
        sourceLanguage: String,
        targetLanguage: String,
        context: TranslationContext
    ): String {
        return """
            Translate this comic book dialogue from $sourceLanguage to $targetLanguage.
            
            Text: "$text"
            
            Context:
            - Comic: ${context.comicTitle ?: "Unknown"}
            - Page: ${context.pageNumber}, Panel: ${context.panelIndex}
            - Previous dialogue: ${context.previousDialogue.joinToString(" | ")}
            
            Guidelines:
            - Maintain the tone and personality of the character
            - Keep it concise (speech bubble space is limited)
            - Preserve emotion and exclamations
            - Use natural, colloquial language
            - Consider cultural context
            
            Return ONLY the translated text, no explanations or quotes.
        """.trimIndent()
    }
    
    private fun detectLanguage(text: String): String {
        // Simple language detection based on character sets
        return when {
            text.isEmpty() -> "unknown"
            text.contains(Regex("[\\u3040-\\u309F]")) -> "ja" // Hiragana
            text.contains(Regex("[\\u30A0-\\u30FF]")) -> "ja" // Katakana
            text.contains(Regex("[\\u4E00-\\u9FFF]")) -> "zh" // Chinese
            text.contains(Regex("[\\uAC00-\\uD7AF]")) -> "ko" // Korean
            text.contains(Regex("[\\u0400-\\u04FF]")) -> "ru" // Cyrillic
            text.contains(Regex("[\\u0600-\\u06FF]")) -> "ar" // Arabic
            else -> "en" // Default to English
        }
    }
    
    private fun mapToMLKitLanguageCode(language: String): String? {
        return when (language.lowercase()) {
            "en", "english" -> TranslateLanguage.ENGLISH
            "es", "spanish" -> TranslateLanguage.SPANISH
            "fr", "french" -> TranslateLanguage.FRENCH
            "de", "german" -> TranslateLanguage.GERMAN
            "ja", "japanese" -> TranslateLanguage.JAPANESE
            "zh", "chinese" -> TranslateLanguage.CHINESE
            "ko", "korean" -> TranslateLanguage.KOREAN
            "it", "italian" -> TranslateLanguage.ITALIAN
            "pt", "portuguese" -> TranslateLanguage.PORTUGUESE
            "ru", "russian" -> TranslateLanguage.RUSSIAN
            "ar", "arabic" -> TranslateLanguage.ARABIC
            "auto" -> null // Auto-detect not supported, return null
            else -> TranslateLanguage.ENGLISH // Default
        }
    }
    
    private fun convertPanelToImageCoords(
        bubbleBounds: NormalizedRect,
        panelBounds: NormalizedRect
    ): NormalizedRect {
        return NormalizedRect(
            x = panelBounds.x + (bubbleBounds.x * panelBounds.width),
            y = panelBounds.y + (bubbleBounds.y * panelBounds.height),
            width = bubbleBounds.width * panelBounds.width,
            height = bubbleBounds.height * panelBounds.height
        )
    }
    
    private fun cropToBounds(bitmap: Bitmap, bounds: NormalizedRect): Bitmap {
        val x = (bounds.x * bitmap.width).toInt().coerceIn(0, bitmap.width - 1)
        val y = (bounds.y * bitmap.height).toInt().coerceIn(0, bitmap.height - 1)
        val width = (bounds.width * bitmap.width).toInt().coerceAtLeast(1)
        val height = (bounds.height * bitmap.height).toInt().coerceAtLeast(1)
        
        val safeWidth = width.coerceAtMost(bitmap.width - x)
        val safeHeight = height.coerceAtMost(bitmap.height - y)
        
        return Bitmap.createBitmap(bitmap, x, y, safeWidth, safeHeight)
    }
    
    fun shutdown() {
        textRecognizer.close()
        translators.values.forEach { it.close() }
        translators.clear()
    }
}

// Data classes

data class OCRResult(
    val text: String,
    val confidence: Float,
    val language: String,
    val bounds: NormalizedRect,
    val error: String? = null
)

data class TranslationResult(
    val originalText: String,
    val translatedText: String,
    val sourceLanguage: String,
    val targetLanguage: String,
    val method: String,
    val confidence: Float,
    val error: String? = null
)

data class BubbleTranslation(
    val bubble: DetectedSpeechBubble,
    val ocr: OCRResult,
    val translation: TranslationResult?
)

data class PanelTranslation(
    val panel: DetectedPanel,
    val bubbles: List<BubbleTranslation>
)

data class PageTranslationResult(
    val pageNumber: Int,
    val panels: List<PanelTranslation>,
    val targetLanguage: String
)

data class TranslationContext(
    val comicTitle: String?,
    val pageNumber: Int,
    val panelIndex: Int,
    val previousDialogue: List<String>,
    val characterNames: List<String> = emptyList()
)
