package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.TypeConverter
import kotlinx.serialization.Serializable
import kotlinx.serialization.SerialName
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.decodeFromString

/**
 * Comic Translation Cache Entity
 * Stores the complete Gemini AI translation response for offline access
 * 
 * This entity caches the full page translation data from the Gemini API,
 * allowing for instant offline viewing without re-processing the same page.
 */
@Entity(tableName = "comic_translation_cache")
data class ComicTranslationCache(
    @PrimaryKey
    val pageId: String, // e.g., "comic-id_page_15"
    
    val comicId: String,
    val pageNumber: Int,
    
    // Serialized ComicPageResponse JSON
    val translationData: String,
    
    val targetLanguage: String,
    val cachedAt: Long = System.currentTimeMillis()
)

/**
 * Data Models for Gemini AI Comic Translation Response
 * 
 * These models match the JSON structure returned by the Gemini AI API
 * after processing a comic page for translation.
 */
@Serializable
data class ComicPageResponse(
    val panels: List<Panel>
)

@Serializable
data class Panel(
    @SerialName("panel_number")
    val panelNumber: Int,
    
    @SerialName("panel_corners")
    val panelCorners: List<List<Int>>,
    
    @SerialName("text_elements")
    val textElements: List<TextElement>
)

@Serializable
data class TextElement(
    @SerialName("element_corners")
    val elementCorners: List<List<Int>>,
    
    @SerialName("shape_type")
    val shapeType: String, // "spherical", "square", "textbox", "no_bubble"
    
    @SerialName("rotation_angle")
    val rotationAngle: Float,
    
    @SerialName("translated_text")
    val translatedText: String
)

/**
 * Type Converter for ComicPageResponse
 * Handles serialization/deserialization for Room database storage
 */
class ComicTranslationConverters {
    private val json = Json { 
        ignoreUnknownKeys = true
        prettyPrint = false
    }
    
    @TypeConverter
    fun fromComicPageResponse(response: ComicPageResponse): String {
        return json.encodeToString(response)
    }
    
    @TypeConverter
    fun toComicPageResponse(jsonString: String): ComicPageResponse {
        return json.decodeFromString(jsonString)
    }
}
