package com.universalmedialibrary.services.ocr

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Rect
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.text.Text
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.tasks.await
import javax.inject.Inject
import javax.inject.Singleton

/**
 * ML Kit-based OCR service for on-device text recognition
 * 
 * Uses Google ML Kit Text Recognition API for offline text extraction
 * from images in books, comics, and other media.
 */
@Singleton
class MLKitOcrService @Inject constructor(
    @ApplicationContext private val context: Context
) : OcrService {

    private val recognizer by lazy {
        TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)
    }

    companion object {
        /**
         * Default confidence value for ML Kit OCR results.
         * ML Kit Text Recognition API doesn't provide confidence scores,
         * so we use a high default value based on the API's known accuracy.
         */
        const val DEFAULT_CONFIDENCE = 0.9f
    }

    override suspend fun recognizeText(bitmap: Bitmap): Result<OcrResult> {
        return try {
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
                        confidence = DEFAULT_CONFIDENCE // ML Kit doesn't provide per-element confidence
                    )
                }
                TextLine(
                    text = line.text,
                    boundingBox = lineRect,
                    confidence = DEFAULT_CONFIDENCE, // ML Kit doesn't provide per-line confidence
                    words = words
                )
            }
            TextBlock(
                text = block.text,
                boundingBox = blockRect,
                confidence = DEFAULT_CONFIDENCE, // ML Kit doesn't provide per-block confidence
                lines = lines
            )
        }

        val avgConfidence = if (blocks.isNotEmpty()) DEFAULT_CONFIDENCE else 0f
        
        return OcrResult(
            text = visionText.text,
            blocks = blocks,
            confidence = avgConfidence
        )
    }
}
