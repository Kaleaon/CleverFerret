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
    val detectedLanguage: String = ""
) {
    val language: String get() = detectedLanguage // Alias for compatibility
}
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
