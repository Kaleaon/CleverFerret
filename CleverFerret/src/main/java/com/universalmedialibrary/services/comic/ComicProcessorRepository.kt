package com.universalmedialibrary.services.comic

import android.graphics.Bitmap
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.*
import com.google.cloud.translate.Translate
import com.google.cloud.translate.TranslateOptions
import com.universalmedialibrary.data.local.dao.ComicTranslationCacheDao
import com.universalmedialibrary.data.local.entity.ComicPageResponse
import com.universalmedialibrary.data.local.entity.ComicTranslationCache
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.json.Json
import java.io.ByteArrayOutputStream
import javax.inject.Inject

/**
 * Comic Processor Repository
 * 
 * Handles on-device AI-powered comic translation using:
 * - Google Gemini AI for visual analysis and panel/text detection
 * - Google Cloud Translation API for accurate language translation
 * - Local Room database for offline caching
 * 
 * This repository orchestrates the entire translation workflow:
 * 1. Check local cache first for instant offline access
 * 2. If not cached, call Gemini AI to analyze the comic page
 * 3. Use function calling to translate detected text
 * 4. Cache the results for future offline viewing
 * 
 * @param geminiApiKey User-provided API key for Gemini AI
 * @param translateApiKey User-provided API key for Google Cloud Translation
 * @param translationCacheDao Room DAO for caching translations
 */
class ComicProcessorRepository @Inject constructor(
    private val geminiApiKey: String,
    private val translateApiKey: String,
    private val translationCacheDao: ComicTranslationCacheDao
) {

    private val json = Json { 
        ignoreUnknownKeys = true
        prettyPrint = false
    }

    /**
     * Initialize the Gemini Model
     * Note: This version uses direct translation instead of function calling
     * as it's more compatible with the current Gemini SDK version
     */
    private val generativeModel by lazy {
        GenerativeModel(
            modelName = "gemini-1.5-pro-latest",
            apiKey = geminiApiKey
        )
    }

    /**
     * Initialize the Google Translate Client
     */
    private val translateService: Translate by lazy {
        TranslateOptions.newBuilder()
            .setApiKey(translateApiKey)
            .build()
            .service
    }

    /**
     * Main function to process a comic page
     * 
     * This function checks the local cache first, and if not found,
     * calls the Google APIs to analyze and translate the page.
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
        
        val uniqueId = "${comicId}_page_${pageNumber}"

        // 1. CHECK DATABASE FIRST for cached translation
        val savedData = translationCacheDao.getTranslation(uniqueId)
        if (savedData != null) {
            return@withContext try {
                val response = json.decodeFromString<ComicPageResponse>(savedData.translationData)
                Result.success(response)
            } catch (e: Exception) {
                // If cache is corrupted, continue to API call
                Result.failure(Exception("Cached data corrupted, re-processing", e))
            }
        }

        // 2. IF NOT FOUND, CALL THE GEMINI API
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
            
            // Parse the JSON response
            val geminiResponse = json.decodeFromString<ComicPageResponse>(cleanJson)
            
            // 4. Translate all text elements using Google Cloud Translation
            val resultData = translateTextElements(geminiResponse, userLanguage)

            // 5. SAVE THE NEW DATA to the database for offline access
            val cacheEntry = ComicTranslationCache(
                pageId = uniqueId,
                comicId = comicId,
                pageNumber = pageNumber,
                translationData = json.encodeToString(ComicPageResponse.serializer(), resultData),
                targetLanguage = userLanguage,
                cachedAt = System.currentTimeMillis()
            )
            translationCacheDao.saveTranslation(cacheEntry)
            
            Result.success(resultData)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Build the prompt for Gemini AI
     */
    private fun buildPrompt(targetLanguage: String): String {
        return """
            You are an expert comic book analyzer. Analyze the provided image and extract all text.
            
            Follow these steps:
            1. Identify the bounding box for each panel in the comic page.
            2. For each panel, identify every text element (speech bubbles, narration boxes, sound effects).
            3. For each text element:
               - Provide its bounding box (4 corner coordinates as [x, y] pairs in pixels)
               - Classify its shape: 'spherical', 'square', 'textbox', or 'no_bubble'
               - Determine its rotation angle (0 for normal text, non-zero for rotated text)
               - Extract the original text EXACTLY as it appears (do NOT translate yet)
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
                      "translated_text": "ORIGINAL TEXT HERE (NOT TRANSLATED)"
                    }
                  ]
                }
              ]
            }
            
            IMPORTANT: Put the ORIGINAL text in the translated_text field for now. Translation will be done separately.
            Return ONLY the JSON object, no additional text or explanation.
        """.trimIndent()
    }
    
    /**
     * Translate all text elements in the response using Google Cloud Translation
     */
    private fun translateTextElements(
        response: ComicPageResponse,
        targetLanguage: String
    ): ComicPageResponse {
        val translatedPanels = response.panels.map { panel ->
            val translatedElements = panel.textElements.map { textElement ->
                val translatedText = performTranslation(textElement.translatedText, targetLanguage)
                textElement.copy(translatedText = translatedText)
            }
            panel.copy(textElements = translatedElements)
        }
        return response.copy(panels = translatedPanels)
    }
    
    /**
     * Perform translation using Google Cloud Translation API
     */
    private fun performTranslation(text: String, targetLanguage: String): String {
        return try {
            translateService.translate(
                text, 
                Translate.TranslateOption.targetLanguage(targetLanguage)
            ).translatedText
        } catch (e: Exception) { 
            // Return original text on failure to prevent the whole process from stopping
            text 
        }
    }

    /**
     * Convert Bitmap to Content for Gemini API
     */
    private fun bitmapToContent(bitmap: Bitmap): Content {
        val stream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.JPEG, 90, stream)
        val byteArray = stream.toByteArray()
        
        return content {
            image(byteArray)
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
     * Check if a page is cached
     */
    suspend fun isPageCached(comicId: String, pageNumber: Int): Boolean {
        val pageId = "${comicId}_page_${pageNumber}"
        return translationCacheDao.isPageCached(pageId)
    }
}
