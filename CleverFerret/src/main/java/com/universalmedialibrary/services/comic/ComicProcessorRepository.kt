package com.universalmedialibrary.services.comic

import android.graphics.Bitmap
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.content
import com.google.ai.client.generativeai.type.Content
import com.universalmedialibrary.data.local.dao.ComicTranslationCacheDao
import com.universalmedialibrary.data.local.entity.ComicPageResponse
import com.universalmedialibrary.data.local.entity.ComicTranslationCache
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.json.Json
import java.util.Locale
import javax.inject.Inject

/**
 * Comic Processor Repository
 * 
 * Handles AI-powered comic translation using Google Gemini 2.5 Pro for:
 * - Visual analysis and panel detection
 * - Text extraction from speech bubbles and narration boxes
 * - Direct translation to target language
 * - Local Room database for offline caching
 * 
 * This repository orchestrates the entire translation workflow:
 * 1. Check local cache first for instant offline access
 * 2. If not cached, call Gemini 2.5 AI to analyze and translate the comic page
 * 3. Cache the results for future offline viewing
 * 
 * @param geminiApiKey User-provided API key for Gemini AI
 * @param translationCacheDao Room DAO for caching translations
 */
class ComicProcessorRepository @Inject constructor(
    private val geminiApiKey: String,
    private val translationCacheDao: ComicTranslationCacheDao
) {

    private val json = Json { 
        ignoreUnknownKeys = true
        prettyPrint = false
    }

    /**
     * Initialize the Gemini 2.5 Model
     * Using the latest Gemini 2.5 Pro for improved visual analysis and translation
     */
    private val generativeModel by lazy {
        GenerativeModel(
            modelName = "gemini-2.5-pro-latest",
            apiKey = geminiApiKey
        )
    }

    /**
     * Generate a language-aware cache key
     */
    private fun generatePageId(comicId: String, pageNumber: Int, language: String): String {
        val normalizedLang = language.lowercase(Locale.ROOT)
        return "${comicId}_page_${pageNumber}_lang_${normalizedLang}"
    }

    /**
     * Main function to process a comic page
     * 
     * This function checks the local cache first, and if not found,
     * calls Gemini AI to analyze and translate the page in a single request.
     * 
     * @param imageBitmap The comic page image
     * @param comicId Unique identifier for the comic (e.g., file path or library ID)
     * @param pageNumber The page number within the comic
     * @param userLanguage Target language code (ISO 639-1, e.g., "en", "es", "ja")
     * @return Result containing the ComicPageResponse or an error
     */
    suspend fun processPage(
        imageBitmap: Bitmap,
        comicId: String,
        pageNumber: Int,
        userLanguage: String = "en"
    ): Result<ComicPageResponse> = withContext(Dispatchers.IO) {
        
        val uniqueId = generatePageId(comicId, pageNumber, userLanguage)

        // 1. CHECK DATABASE FIRST for cached translation
        val savedData = translationCacheDao.getTranslation(uniqueId)
        if (savedData != null) {
            runCatching {
                json.decodeFromString<ComicPageResponse>(savedData.translationData)
            }.onSuccess { decoded ->
                return@withContext Result.success(decoded)
            }.onFailure {
                // Delete corrupted cache and fall through to re-process
                translationCacheDao.deleteTranslation(savedData)
            }
        }

        // 2. IF NOT FOUND, CALL GEMINI API for analysis AND translation
        try {
            val imagePart = bitmapToContent(imageBitmap)
            val prompt = buildPrompt(userLanguage)

            // Generate content with image and prompt
            val response = generativeModel.generateContent(imagePart, content { text(prompt) })
            
            // 3. Parse the response
            val responseText = response.text ?: throw IllegalStateException("Response was empty.")
            
            // Clean up markdown code blocks if present
            val cleanJson = responseText
                .replace("```json", "")
                .replace("```", "")
                .trim()
            
            // Parse the JSON response - Gemini already translated the text
            val translatedResponse = json.decodeFromString<ComicPageResponse>(cleanJson)

            // 4. SAVE THE TRANSLATED DATA to the database for offline access
            val cacheEntry = ComicTranslationCache(
                pageId = uniqueId,
                comicId = comicId,
                pageNumber = pageNumber,
                translationData = json.encodeToString(ComicPageResponse.serializer(), translatedResponse),
                targetLanguage = userLanguage,
                cachedAt = System.currentTimeMillis()
            )
            translationCacheDao.saveTranslation(cacheEntry)
            
            Result.success(translatedResponse)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Build the prompt for Gemini AI to analyze and translate in one step
     */
    private fun buildPrompt(targetLanguage: String): String {
        val languageName = getLanguageName(targetLanguage)
        return """
            You are an expert comic book analyzer and translator. Analyze the provided image and translate all text to $languageName.
            
            Follow these steps:
            1. Identify the bounding box for each panel in the comic page.
            2. For each panel, identify every text element (speech bubbles, narration boxes, sound effects).
            3. For each text element:
               - Provide its bounding box (4 corner coordinates as [x, y] pairs in pixels)
               - Classify its shape: 'spherical', 'square', 'textbox', or 'no_bubble'
               - Determine its rotation angle (0 for normal text, non-zero for rotated text)
               - Extract and TRANSLATE the text to $languageName
            4. Return a single, clean JSON object with this structure:
            {
              "panels": [
                {
                  "panel_number": 1,
                  "panel_corners": [[x1,y1], [x2,y2], [x3,y3], [x4,y4]],
                  "text_elements": [
                    {
                      "element_corners": [[x1,y1], [x2,y2], [x3,y3], [x4,y4]],
                      "shape_type": "spherical",
                      "rotation_angle": 0.0,
                      "translated_text": "TRANSLATED TEXT IN $languageName HERE"
                    }
                  ]
                }
              ]
            }
            
            IMPORTANT: Translate ALL text to $languageName in the translated_text field.
            Preserve the meaning and tone of the original text.
            Return ONLY the JSON object, no additional text or explanation.
        """.trimIndent()
    }
    
    /**
     * Convert ISO 639-1 language codes to readable names
     */
    private fun getLanguageName(languageCode: String): String {
        return when (languageCode.lowercase(Locale.ROOT)) {
            "en" -> "English"
            "es" -> "Spanish"
            "fr" -> "French"
            "de" -> "German"
            "it" -> "Italian"
            "pt" -> "Portuguese"
            "ja" -> "Japanese"
            "ko" -> "Korean"
            "zh" -> "Chinese"
            "ru" -> "Russian"
            "ar" -> "Arabic"
            "hi" -> "Hindi"
            else -> "English"
        }
    }

    /**
     * Convert Bitmap to Content for Gemini API
     */
    private fun bitmapToContent(bitmap: Bitmap): Content {
        return content {
            image(bitmap)
        }
    }

    /**
     * Clear cached translations for a specific comic
     */
    suspend fun clearCache(comicId: String) {
        translationCacheDao.deleteAllTranslationsForComic(comicId)
    }

    /**
     * Clear all cached translations
     */
    suspend fun clearAllCache() {
        translationCacheDao.deleteAllTranslations()
    }

    /**
     * Get the number of cached pages for a comic
     */
    suspend fun getCachedPageCount(comicId: String): Int {
        return translationCacheDao.getCachedPageCount(comicId)
    }

    /**
     * Check if a page is cached for a specific language
     */
    suspend fun isPageCached(comicId: String, pageNumber: Int, targetLanguage: String = "en"): Boolean {
        val pageId = generatePageId(comicId, pageNumber, targetLanguage)
        return translationCacheDao.isPageCached(pageId)
    }
}
