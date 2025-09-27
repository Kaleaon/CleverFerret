package com.universalmedialibrary.services.gemini

import android.content.Context
import android.graphics.Bitmap
import android.net.Uri
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.content
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Gemini AI Service for OCR and book identification
 * 
 * This service provides:
 * - Visual OCR of book pages (images) to extract text
 * - Book metadata identification from covers and content
 * - Text analysis and enhancement capabilities
 */
@Singleton
class GeminiService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiKeyRepository: APIKeyRepository
) {
    
    private var generativeModel: GenerativeModel? = null
    
    /**
     * Check if Gemini service is configured with a valid API key
     */
    suspend fun isConfigured(): Boolean = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext false
        }
        
        val apiKey = apiKeyRepository.getGeminiApiKey()
        return@withContext !apiKey.isNullOrBlank() && generativeModel != null
    }
    
    /**
     * Initialize the Gemini service with API key
     */
    suspend fun initialize(): Boolean = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext false
        }
        
        try {
            val apiKey = apiKeyRepository.getGeminiApiKey()
            if (apiKey.isNullOrBlank()) {
                return@withContext false
            }
            
            generativeModel = GenerativeModel(
                modelName = "gemini-2.5-flash",
                apiKey = apiKey
            )
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Identify book metadata from cover images
     */
    suspend fun identifyBookFromImages(images: List<Bitmap>): BookIdentificationResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext BookIdentificationResult(
                success = false,
                error = "Gemini integration is disabled"
            )
        }
        
        val model = generativeModel
        if (model == null) {
            return@withContext BookIdentificationResult(
                success = false,
                error = "Gemini service not initialized"
            )
        }
        
        try {
            val prompt = """
                Analyze these book cover/page images and extract the following information in JSON format:
                {
                    "title": "book title",
                    "author": "author name(s)",
                    "isbn": "ISBN if visible",
                    "publisher": "publisher name if visible",
                    "genre": "genre or category",
                    "description": "brief description based on cover/content",
                    "language": "detected language code (e.g., 'en', 'es')",
                    "confidence": 0.95
                }
                
                If you can't identify the book with high confidence, set confidence to a value between 0.0 and 1.0.
                Extract only what is clearly visible or identifiable from the images.
            """.trimIndent()
            
            val content = content {
                text(prompt)
                images.forEach { bitmap ->
                    image(bitmap)
                }
            }
            
            val response = model.generateContent(content)
            val responseText = response.text ?: ""
            
            parseBookIdentificationResponse(responseText)
            
        } catch (e: Exception) {
            BookIdentificationResult(
                success = false,
                error = "Error identifying book: ${e.message}"
            )
        }
    }
    
    /**
     * Extract text from book page images using OCR
     */
    suspend fun extractTextFromImages(images: List<Bitmap>): TextExtractionResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext TextExtractionResult(
                success = false,
                error = "Gemini integration is disabled"
            )
        }
        
        val model = generativeModel
        if (model == null) {
            return@withContext TextExtractionResult(
                success = false,
                error = "Gemini service not initialized"
            )
        }
        
        try {
            val prompt = """
                Extract all readable text from these book page images. 
                Preserve the original formatting, paragraph breaks, and structure as much as possible.
                Return only the extracted text without any additional commentary.
                If there are multiple pages, clearly separate them with "--- PAGE BREAK ---".
            """.trimIndent()
            
            val content = content {
                text(prompt)
                images.forEach { bitmap ->
                    image(bitmap)
                }
            }
            
            val response = model.generateContent(content)
            val extractedText = response.text ?: ""
            
            TextExtractionResult(
                success = true,
                extractedText = extractedText.trim(),
                pageCount = images.size
            )
            
        } catch (e: Exception) {
            TextExtractionResult(
                success = false,
                error = "Error extracting text: ${e.message}"
            )
        }
    }
    
    /**
     * Enhance book metadata with additional information
     */
    suspend fun enhanceBookMetadata(
        title: String,
        author: String,
        existingText: String? = null
    ): BookEnhancementResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_AI_METADATA) {
            return@withContext BookEnhancementResult(
                success = false,
                error = "AI metadata enhancement is disabled"
            )
        }
        
        val model = generativeModel
        if (model == null) {
            return@withContext BookEnhancementResult(
                success = false,
                error = "Gemini service not initialized"
            )
        }
        
        try {
            val textInfo = if (existingText?.isNotBlank() == true) {
                "Here is some text from the book:\n${existingText.take(1000)}..."
            } else {
                ""
            }
            
            val prompt = """
                Based on the book title "$title" by "$author", provide enhanced metadata in JSON format:
                {
                    "genre": "primary genre",
                    "subgenres": ["subgenre1", "subgenre2"],
                    "publicationYear": "estimated year if known", 
                    "series": "series name if part of a series",
                    "seriesNumber": "number in series if applicable",
                    "description": "comprehensive description",
                    "themes": ["theme1", "theme2"],
                    "targetAudience": "target audience (e.g., adult, young adult, children)",
                    "language": "language code",
                    "tags": ["tag1", "tag2", "tag3"]
                }
                
                $textInfo
                
                Provide accurate information based on your knowledge. If uncertain about any field, use null or leave it empty.
            """.trimIndent()
            
            val response = model.generateContent(prompt)
            val responseText = response.text ?: ""
            
            parseBookEnhancementResponse(responseText)
            
        } catch (e: Exception) {
            BookEnhancementResult(
                success = false,
                error = "Error enhancing metadata: ${e.message}"
            )
        }
    }
    
    /**
     * Check if the service is properly initialized
     */
    fun isInitialized(): Boolean = generativeModel != null && FeatureFlags.ENABLE_GEMINI
    
    /**
     * Parse book identification response from Gemini
     */
    private fun parseBookIdentificationResponse(responseText: String): BookIdentificationResult {
        return try {
            // Simple JSON parsing - in a real implementation, use a proper JSON parser
            val jsonStart = responseText.indexOf("{")
            val jsonEnd = responseText.lastIndexOf("}") + 1
            
            if (jsonStart >= 0 && jsonEnd > jsonStart) {
                val jsonText = responseText.substring(jsonStart, jsonEnd)
                // For now, return a basic result with the raw response
                // In a real implementation, parse the JSON properly
                BookIdentificationResult(
                    success = true,
                    bookMetadata = BasicBookMetadata(
                        title = extractJsonValue(jsonText, "title"),
                        author = extractJsonValue(jsonText, "author"),
                        isbn = extractJsonValue(jsonText, "isbn"),
                        publisher = extractJsonValue(jsonText, "publisher"),
                        genre = extractJsonValue(jsonText, "genre"),
                        description = extractJsonValue(jsonText, "description"),
                        language = extractJsonValue(jsonText, "language"),
                        confidence = extractJsonValue(jsonText, "confidence")?.toFloatOrNull() ?: 0.5f
                    )
                )
            } else {
                BookIdentificationResult(
                    success = false,
                    error = "Could not parse response"
                )
            }
        } catch (e: Exception) {
            BookIdentificationResult(
                success = false,
                error = "Error parsing response: ${e.message}"
            )
        }
    }
    
    /**
     * Parse book enhancement response from Gemini
     */
    private fun parseBookEnhancementResponse(responseText: String): BookEnhancementResult {
        return try {
            // Simple parsing - in a real implementation, use proper JSON parsing
            val jsonStart = responseText.indexOf("{")
            val jsonEnd = responseText.lastIndexOf("}") + 1
            
            if (jsonStart >= 0 && jsonEnd > jsonStart) {
                val jsonText = responseText.substring(jsonStart, jsonEnd)
                BookEnhancementResult(
                    success = true,
                    enhancedMetadata = EnhancedBookMetadata(
                        genre = extractJsonValue(jsonText, "genre"),
                        publicationYear = extractJsonValue(jsonText, "publicationYear"),
                        series = extractJsonValue(jsonText, "series"),
                        description = extractJsonValue(jsonText, "description"),
                        targetAudience = extractJsonValue(jsonText, "targetAudience"),
                        language = extractJsonValue(jsonText, "language")
                    )
                )
            } else {
                BookEnhancementResult(
                    success = false,
                    error = "Could not parse response"
                )
            }
        } catch (e: Exception) {
            BookEnhancementResult(
                success = false,
                error = "Error parsing response: ${e.message}"
            )
        }
    }
    
    /**
     * Simple JSON value extraction (for demonstration - use proper JSON parser in production)
     */
    private fun extractJsonValue(json: String, key: String): String? {
        val pattern = "\"$key\"\\s*:\\s*\"([^\"]*)\""
        val regex = Regex(pattern)
        return regex.find(json)?.groupValues?.get(1)
    }
}

/**
 * Result of book identification from images
 */
data class BookIdentificationResult(
    val success: Boolean,
    val bookMetadata: BasicBookMetadata? = null,
    val error: String? = null
)

/**
 * Result of text extraction from images
 */
data class TextExtractionResult(
    val success: Boolean,
    val extractedText: String = "",
    val pageCount: Int = 0,
    val error: String? = null
)

/**
 * Result of book metadata enhancement
 */
data class BookEnhancementResult(
    val success: Boolean,
    val enhancedMetadata: EnhancedBookMetadata? = null,
    val error: String? = null
)

/**
 * Basic book metadata from image identification
 */
data class BasicBookMetadata(
    val title: String?,
    val author: String?,
    val isbn: String?,
    val publisher: String?,
    val genre: String?,
    val description: String?,
    val language: String?,
    val confidence: Float
)

/**
 * Enhanced book metadata from AI analysis
 */
data class EnhancedBookMetadata(
    val genre: String?,
    val publicationYear: String?,
    val series: String?,
    val description: String?,
    val targetAudience: String?,
    val language: String?
)