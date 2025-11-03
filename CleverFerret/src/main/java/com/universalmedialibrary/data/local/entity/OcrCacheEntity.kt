package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Entity for caching OCR results to avoid reprocessing
 */
@Entity(tableName = "ocr_cache")
data class OcrCacheEntity(
    @PrimaryKey
    val id: String, // Hash of image or page identifier
    val mediaItemId: String, // Associated media item ID
    val pageNumber: Int = 0, // Page number for books/comics
    val text: String, // Extracted text
    val blocksJson: String, // JSON representation of text blocks
    val confidence: Float = 0f,
    val timestamp: Long = System.currentTimeMillis(),
    val language: String = "en" // Language of recognized text
)
