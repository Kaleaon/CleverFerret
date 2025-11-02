package com.universalmedialibrary.services.ocr

import android.graphics.Bitmap
import android.graphics.Rect

/**
 * OCR Service interface for text recognition from images
 */
interface OcrService {
    
    /**
     * Recognize text from a bitmap image
     * 
     * @param bitmap The image to process
     * @return Result containing OcrResult or error
     */
    suspend fun recognizeText(bitmap: Bitmap): Result<OcrResult>
    
    /**
     * Recognize text from a specific region of a bitmap
     * 
     * @param bitmap The image to process
     * @param region The region to extract text from
     * @return Result containing OcrResult or error
     */
    suspend fun recognizeTextInRegion(bitmap: Bitmap, region: Rect): Result<OcrResult>
    
    /**
     * Check if OCR service is available
     */
    fun isAvailable(): Boolean
}

/**
 * Result of OCR text recognition
 */
data class OcrResult(
    val text: String,
    val blocks: List<TextBlock>,
    val confidence: Float = 0f
)

/**
 * A block of text recognized by OCR
 */
data class TextBlock(
    val text: String,
    val boundingBox: Rect,
    val confidence: Float = 0f,
    val lines: List<TextLine> = emptyList()
)

/**
 * A line of text within a text block
 */
data class TextLine(
    val text: String,
    val boundingBox: Rect,
    val confidence: Float = 0f,
    val words: List<TextWord> = emptyList()
)

/**
 * A word within a text line
 */
data class TextWord(
    val text: String,
    val boundingBox: Rect,
    val confidence: Float = 0f
)
