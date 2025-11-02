package com.universalmedialibrary.services.ocr

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Rect
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.text.Text
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.TextRecognizer
import com.google.mlkit.vision.text.chinese.ChineseTextRecognizerOptions
import com.google.mlkit.vision.text.devanagari.DevanagariTextRecognizerOptions
import com.google.mlkit.vision.text.japanese.JapaneseTextRecognizerOptions
import com.google.mlkit.vision.text.korean.KoreanTextRecognizerOptions
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.tasks.await
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Multi-language ML Kit-based OCR service
 * 
 * Supports multiple scripts: Latin, Chinese, Japanese, Korean, Devanagari
 */
@Singleton
class MultiLanguageOcrService @Inject constructor(
    @ApplicationContext private val context: Context
) : OcrService {

    private val recognizers = mutableMapOf<OcrLanguage, TextRecognizer>()

    /**
     * Current OCR language, defaults to Latin (English)
     */
    @Volatile
    private var currentLanguage: OcrLanguage = OcrLanguage.LATIN

    init {
        // Pre-initialize Latin recognizer as default
        getRecognizer(OcrLanguage.LATIN)
    }

    /**
     * Set the OCR language
     */
    fun setLanguage(language: OcrLanguage) {
        currentLanguage = language
        // Pre-load recognizer for this language
        getRecognizer(language)
    }

    /**
     * Get the current language
     */
    fun getCurrentLanguage() = currentLanguage

    override suspend fun recognizeText(bitmap: Bitmap): Result<OcrResult> {
        return try {
            val recognizer = getRecognizer(currentLanguage)
            val image = InputImage.fromBitmap(bitmap, 0)
            val visionText = recognizer.process(image).await()
            
            val result = convertToOcrResult(visionText)
            Result.success(result)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    override suspend fun recognizeTextInRegion(bitmap: Bitmap, region: Rect): Result<OcrResult> {
        return try {
            // Crop bitmap to region
            val croppedBitmap = Bitmap.createBitmap(
                bitmap,
                region.left,
                region.top,
                region.width(),
                region.height()
            )
            
            recognizeText(croppedBitmap)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    override fun isAvailable(): Boolean {
        return true // ML Kit is always available offline
    }

    /**
     * Get or create recognizer for a specific language
     */
    private fun getRecognizer(language: OcrLanguage): TextRecognizer {
        return recognizers.getOrPut(language) {
            when (language) {
                OcrLanguage.LATIN -> TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)
                OcrLanguage.CHINESE -> TextRecognition.getClient(ChineseTextRecognizerOptions.Builder().build())
                OcrLanguage.DEVANAGARI -> TextRecognition.getClient(DevanagariTextRecognizerOptions.Builder().build())
                OcrLanguage.JAPANESE -> TextRecognition.getClient(JapaneseTextRecognizerOptions.Builder().build())
                OcrLanguage.KOREAN -> TextRecognition.getClient(KoreanTextRecognizerOptions.Builder().build())
            }
        }
    }

    private fun convertToOcrResult(visionText: Text): OcrResult {
        val blocks = visionText.textBlocks.map { block ->
            val blockRect = block.boundingBox ?: Rect()
            val lines = block.lines.map { line ->
                val lineRect = line.boundingBox ?: Rect()
                val words = line.elements.map { element ->
                    val wordRect = element.boundingBox ?: Rect()
                    TextWord(
                        text = element.text,
                        boundingBox = wordRect,
                        confidence = MLKitOcrService.DEFAULT_CONFIDENCE
                    )
                }
                TextLine(
                    text = line.text,
                    boundingBox = lineRect,
                    confidence = MLKitOcrService.DEFAULT_CONFIDENCE,
                    words = words
                )
            }
            TextBlock(
                text = block.text,
                boundingBox = blockRect,
                confidence = MLKitOcrService.DEFAULT_CONFIDENCE,
                lines = lines
            )
        }

        val avgConfidence = if (blocks.isNotEmpty()) MLKitOcrService.DEFAULT_CONFIDENCE else 0f
        
        return OcrResult(
            text = visionText.text,
            blocks = blocks,
            confidence = avgConfidence
        )
    }

    companion object {
        /**
         * Access to default confidence from MLKitOcrService
         */
        private const val DEFAULT_CONFIDENCE = 0.9f
    }
}

/**
 * Supported OCR languages/scripts
 */
enum class OcrLanguage(val displayName: String, val code: String) {
    LATIN("Latin (English, Spanish, French, etc.)", "latin"),
    CHINESE("Chinese", "zh"),
    DEVANAGARI("Devanagari (Hindi, Marathi, etc.)", "devanagari"),
    JAPANESE("Japanese", "ja"),
    KOREAN("Korean", "ko")
}
