package com.universalmedialibrary.services.comic

import android.graphics.Bitmap
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.*
import com.google.mlkit.common.model.DownloadConditions
import com.google.mlkit.nl.translate.TranslateLanguage
import com.google.mlkit.nl.translate.Translation
import com.google.mlkit.nl.translate.TranslatorOptions
import com.universalmedialibrary.data.local.dao.ComicTranslationCacheDao
import com.universalmedialibrary.data.local.entity.ComicPageResponse
import com.universalmedialibrary.data.local.entity.ComicTranslationCache
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.withContext
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import kotlinx.serialization.json.Json
import java.io.ByteArrayOutputStream
import java.util.Locale
import javax.inject.Inject

/**
 * Comic Processor Repository
 * 
 * Handles on-device AI-powered comic translation using:
 * - Google Gemini 2.5 Pro for visual analysis and panel/text detection
 * - Google ML Kit Translate for on-device language translation
 * - Local Room database for offline caching
 * 
 * This repository orchestrates the entire translation workflow:
 * 1. Check local cache first for instant offline access
 * 2. If not cached, call Gemini 2.5 AI to analyze the comic page
 * 3. Use ML Kit on-device translation for detected text
 * 4. Cache the results for future offline viewing
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
     * Using the latest Gemini 2.5 Pro for improved visual analysis
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
        
        val uniqueId = generatePageId(comicId, pageNumber, userLanguage)

        // 1. CHECK DATABASE FIRST for cached translation
        val savedData = translationCacheDao.getTranslation(uniqueId)
        if (savedData != null) {
            runCatching {
                json.decodeFromString<ComicPageResponse>(savedData.translationData)
            }.onSuccess { decoded ->
                return@withContext Result.success(decoded)
            }.onFailure { e ->
                // Delete corrupted cache and fall through to re-process
                translationCacheDao.deleteTranslation(savedData)
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
     * Translate all text elements in the response using ML Kit on-device translation
     */
    private suspend fun translateTextElements(
        response: ComicPageResponse,
        targetLanguage: String
    ): ComicPageResponse = withContext(Dispatchers.IO) {
        // Map language code to ML Kit language code
        val mlKitLanguage = mapToMLKitLanguage(targetLanguage)
        
        // Create translator options
        val options = TranslatorOptions.Builder()
            .setSourceLanguage(TranslateLanguage.JAPANESE) // Assume Japanese source for now
            .setTargetLanguage(mlKitLanguage)
            .build()
        
        val translator = Translation.getClient(options)
        
        // Download model if needed
        val conditions = DownloadConditions.Builder()
            .requireWifi()
            .build()
        
        try {
            // Download model if needed using suspendCancellableCoroutine
            suspendCancellableCoroutine<Void?> { continuation ->
                val task = translator.downloadModelIfNeeded(conditions)
                task.addOnSuccessListener { continuation.resume(it) }
                    .addOnFailureListener { continuation.resumeWithException(it) }
                    .addOnCanceledListener { continuation.cancel() }
                    
                continuation.invokeOnCancellation {
                    // Cleanup if coroutine is cancelled
                }
            }
            
            val translatedPanels = response.panels.map { panel ->
                val translatedElements = panel.textElements.map { textElement ->
                    val translatedText = performTranslation(translator, textElement.translatedText)
                    textElement.copy(translatedText = translatedText)
                }
                panel.copy(textElements = translatedElements)
            }
            
            translator.close()
            response.copy(panels = translatedPanels)
        } catch (e: Exception) {
            translator.close()
            // Return original response if translation fails
            response
        }
    }
    
    /**
     * Perform translation using ML Kit translator
     */
    private suspend fun performTranslation(translator: com.google.mlkit.nl.translate.Translator, text: String): String {
        return try {
            // Use suspendCancellableCoroutine instead of tasks.await()
            suspendCancellableCoroutine { continuation ->
                val task = translator.translate(text)
                task.addOnSuccessListener { result -> continuation.resume(result) }
                    .addOnFailureListener { exception -> continuation.resumeWithException(exception) }
                    .addOnCanceledListener { continuation.cancel() }
                    
                continuation.invokeOnCancellation {
                    // Cleanup if coroutine is cancelled
                }
            }
        } catch (e: Exception) { 
            // Return original text on failure
            text 
        }
    }
    
    /**
     * Map ISO language codes to ML Kit language codes
     */
    private fun mapToMLKitLanguage(languageCode: String): String {
        return when (languageCode.lowercase(Locale.ROOT)) {
            "en" -> TranslateLanguage.ENGLISH
            "es" -> TranslateLanguage.SPANISH
            "fr" -> TranslateLanguage.FRENCH
            "de" -> TranslateLanguage.GERMAN
            "it" -> TranslateLanguage.ITALIAN
            "pt" -> TranslateLanguage.PORTUGUESE
            "ja" -> TranslateLanguage.JAPANESE
            "ko" -> TranslateLanguage.KOREAN
            "zh" -> TranslateLanguage.CHINESE
            "ru" -> TranslateLanguage.RUSSIAN
            "ar" -> TranslateLanguage.ARABIC
            "hi" -> TranslateLanguage.HINDI
            else -> TranslateLanguage.ENGLISH
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
