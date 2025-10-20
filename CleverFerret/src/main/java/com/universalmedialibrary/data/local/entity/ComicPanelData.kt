package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Index
import kotlinx.serialization.Serializable

/**
 * Comic Panel Data Entity
 * Stores detected panel coordinates for panel-by-panel navigation
 */
@Serializable
@Entity(
    tableName = "comic_panels",
    indices = [
        Index(value = ["comicId", "pageNumber", "panelIndex"], unique = true)
    ]
)
data class ComicPanelData(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    // Associated comic file
    val comicId: Long,
    val comicFilePath: String,
    
    // Page information
    val pageNumber: Int,
    val totalPages: Int,
    
    // Panel coordinates (normalized 0-1)
    val panelIndex: Int,
    val x: Float,
    val y: Float,
    val width: Float,
    val height: Float,
    
    // Panel metadata
    val confidence: Float = 1.0f, // Edge detection confidence
    val readingOrder: Int = 0, // For manga/comic reading order
    
    // Timestamps
    val detectedAt: Long = System.currentTimeMillis(),
    val lastModified: Long = System.currentTimeMillis()
)

/**
 * Comic Speech Bubble Translation Entity
 * Stores OCR text and translations for speech bubbles
 */
@Serializable
@Entity(
    tableName = "comic_translations",
    indices = [
        Index(value = ["panelId"]),
        Index(value = ["comicId", "pageNumber"])
    ]
)
data class ComicTranslation(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    // Associated panel
    val panelId: Long,
    val comicId: Long,
    val pageNumber: Int,
    
    // Speech bubble coordinates (within panel, normalized 0-1)
    val bubbleX: Float,
    val bubbleY: Float,
    val bubbleWidth: Float,
    val bubbleHeight: Float,
    
    // OCR data
    val originalText: String,
    val detectedLanguage: String?,
    val ocrConfidence: Float = 0.0f,
    
    // Translation data
    val translatedText: String? = null,
    val targetLanguage: String? = null,
    val translatedAt: Long? = null,
    
    // Rendering hints
    val fontSize: Float = 12.0f,
    val fontColor: Int = 0xFF000000.toInt(), // ARGB
    val backgroundColor: Int = 0xFFFFFFFF.toInt(), // ARGB
    
    // Timestamps
    val detectedAt: Long = System.currentTimeMillis(),
    val lastModified: Long = System.currentTimeMillis()
)

/**
 * Comic Reading Session
 * Tracks user's reading progress with panel-by-panel navigation
 */
@Serializable
@Entity(
    tableName = "comic_reading_sessions",
    indices = [
        Index(value = ["comicId"])
    ]
)
data class ComicReadingSession(
    @PrimaryKey
    val comicId: Long,
    
    val comicFilePath: String,
    val comicTitle: String,
    
    // Current position
    val currentPage: Int = 0,
    val currentPanel: Int = 0,
    val totalPages: Int = 0,
    
    // Reading preferences
    val readingMode: String = "PAGE", // PAGE, PANEL, CONTINUOUS
    val isRightToLeft: Boolean = false, // For manga
    val zoomLevel: Float = 1.0f,
    
    // Translation preferences
    val enableTranslation: Boolean = false,
    val targetLanguage: String = "en",
    
    // Timestamps
    val lastReadAt: Long = System.currentTimeMillis(),
    val createdAt: Long = System.currentTimeMillis()
)

/**
 * JSON export format for comic panel data
 * Can be saved alongside comic files for portability
 */
data class ComicPanelDataExport(
    val comicFilePath: String,
    val comicTitle: String,
    val totalPages: Int,
    val exportedAt: Long = System.currentTimeMillis(),
    val version: String = "1.0",
    val pages: List<PageData>
) {
    data class PageData(
        val pageNumber: Int,
        val panels: List<PanelData>,
        val translations: List<TranslationData>
    )
    
    data class PanelData(
        val panelIndex: Int,
        val x: Float,
        val y: Float,
        val width: Float,
        val height: Float,
        val readingOrder: Int,
        val confidence: Float
    )
    
    data class TranslationData(
        val panelIndex: Int,
        val bubbleX: Float,
        val bubbleY: Float,
        val bubbleWidth: Float,
        val bubbleHeight: Float,
        val originalText: String,
        val detectedLanguage: String?,
        val translatedText: String?,
        val targetLanguage: String?,
        val fontSize: Float,
        val fontColor: Int,
        val backgroundColor: Int
    )
}
