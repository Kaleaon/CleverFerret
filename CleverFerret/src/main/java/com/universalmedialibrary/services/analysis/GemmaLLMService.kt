package com.universalmedialibrary.services.analysis

import android.content.Context
import android.graphics.Bitmap
import com.google.mediapipe.tasks.core.BaseOptions
import com.google.mediapipe.tasks.genai.llminference.LlmInference
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for running Gemma LLM on-device for enhanced OCR and text analysis
 * Uses MediaPipe for efficient on-device inference
 */
@Singleton
class GemmaLLMService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private var llmInference: LlmInference? = null
    private val _modelState = MutableStateFlow(ModelState())
    val modelState: StateFlow<ModelState> = _modelState.asStateFlow()

    data class ModelState(
        val isLoaded: Boolean = false,
        val isLoading: Boolean = false,
        val modelPath: String? = null,
        val error: String? = null
    )

    data class OCRResult(
        val text: String,
        val confidence: Float,
        val metadata: ExtractedMetadata? = null
    )

    data class ExtractedMetadata(
        val title: String? = null,
        val author: String? = null,
        val isbn: String? = null,
        val publisher: String? = null,
        val publicationYear: Int? = null,
        val genre: List<String> = emptyList(),
        val language: String? = null,
        val summary: String? = null
    )

    /**
     * Initialize the Gemma model
     * Model should be downloaded and stored in app's private directory
     */
    suspend fun initializeModel(modelPath: String = "gemma-2b-it-cpu-int4.bin"): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                _modelState.value = _modelState.value.copy(isLoading = true)
                
                val modelFile = File(context.filesDir, modelPath)
                
                if (!modelFile.exists()) {
                    // In production, download model from CDN
                    _modelState.value = _modelState.value.copy(
                        isLoading = false,
                        error = "Model file not found. Please download the model first."
                    )
                    return@withContext false
                }

                val baseOptionsBuilder = BaseOptions.builder()
                    .setModelAssetPath(modelFile.absolutePath)

                val options = LlmInference.LlmInferenceOptions.builder()
                    .setBaseOptions(baseOptionsBuilder.build())
                    .setMaxTokens(2048)
                    .setTemperature(0.3f) // Lower temperature for more deterministic output
                    .setTopK(40)
                    .setRandomSeed(42)
                    .build()

                llmInference = LlmInference.createFromOptions(context, options)

                _modelState.value = ModelState(
                    isLoaded = true,
                    isLoading = false,
                    modelPath = modelPath
                )
                true
            } catch (e: Exception) {
                _modelState.value = _modelState.value.copy(
                    isLoading = false,
                    error = "Failed to initialize model: ${e.message}"
                )
                false
            }
        }
    }

    /**
     * Enhanced OCR using Gemma for text extraction and understanding
     */
    suspend fun performEnhancedOCR(
        text: String,
        context: String = "book cover"
    ): OCRResult = withContext(Dispatchers.IO) {
        if (llmInference == null) {
            return@withContext OCRResult(
                text = text,
                confidence = 0.5f,
                metadata = null
            )
        }

        try {
            val prompt = buildOCRPrompt(text, context)
            val response = llmInference?.generateResponse(prompt) ?: ""
            
            val metadata = parseMetadataResponse(response)
            
            OCRResult(
                text = text,
                confidence = 0.85f,
                metadata = metadata
            )
        } catch (e: Exception) {
            OCRResult(
                text = text,
                confidence = 0.5f,
                metadata = null
            )
        }
    }

    /**
     * Extract metadata from book cover image
     */
    suspend fun extractMetadataFromCover(
        ocrText: String
    ): ExtractedMetadata? = withContext(Dispatchers.IO) {
        if (llmInference == null || ocrText.isBlank()) {
            return@withContext null
        }

        try {
            val prompt = """
                Extract book metadata from the following OCR text from a book cover:
                
                OCR Text: "$ocrText"
                
                Please extract and format as JSON:
                - title: The book title
                - author: The author name(s)
                - publisher: The publisher if visible
                - genre: Likely genre based on title/cover
                
                Return ONLY valid JSON, no explanation.
            """.trimIndent()

            val response = llmInference?.generateResponse(prompt) ?: ""
            parseMetadataResponse(response)
        } catch (e: Exception) {
            null
        }
    }

    /**
     * Analyze first pages of a book for metadata
     */
    suspend fun analyzeFirstPages(
        pageTexts: List<String>
    ): ExtractedMetadata? = withContext(Dispatchers.IO) {
        if (llmInference == null || pageTexts.isEmpty()) {
            return@withContext null
        }

        try {
            val combinedText = pageTexts.take(3).joinToString("\n---PAGE BREAK---\n")
            
            val prompt = """
                Analyze the following text from the first pages of a book and extract metadata:
                
                Text:
                $combinedText
                
                Extract:
                - title: The book title
                - author: The author name(s)
                - isbn: ISBN if present
                - publisher: The publisher
                - publicationYear: Year of publication
                - genre: Book genre/category
                - language: Language of the text
                - summary: Brief 2-3 sentence summary
                
                Return as JSON format only.
            """.trimIndent()

            val response = llmInference?.generateResponse(prompt) ?: ""
            parseMetadataResponse(response)
        } catch (e: Exception) {
            null
        }
    }

    /**
     * Correct and enhance OCR text using LLM
     */
    suspend fun correctOCRText(
        rawText: String,
        context: String = "general"
    ): String = withContext(Dispatchers.IO) {
        if (llmInference == null || rawText.isBlank()) {
            return@withContext rawText
        }

        try {
            val prompt = """
                Correct the following OCR text which may contain errors.
                Context: $context
                
                Raw OCR text:
                "$rawText"
                
                Please provide the corrected text only, fixing:
                - Spelling errors
                - Character recognition errors (like 0 vs O, 1 vs l)
                - Formatting issues
                - Missing spaces or incorrect word breaks
                
                Corrected text:
            """.trimIndent()

            llmInference?.generateResponse(prompt) ?: rawText
        } catch (e: Exception) {
            rawText
        }
    }

    /**
     * Generate book summary from content
     */
    suspend fun generateSummary(
        text: String,
        maxLength: Int = 200
    ): String = withContext(Dispatchers.IO) {
        if (llmInference == null || text.isBlank()) {
            return@withContext ""
        }

        try {
            val prompt = """
                Summarize the following book content in $maxLength words or less:
                
                $text
                
                Summary:
            """.trimIndent()

            llmInference?.generateResponse(prompt) ?: ""
        } catch (e: Exception) {
            ""
        }
    }

    private fun buildOCRPrompt(text: String, context: String): String {
        return """
            You are analyzing OCR text from a $context.
            
            OCR Text: "$text"
            
            Tasks:
            1. Correct any OCR errors
            2. Extract metadata (title, author, etc.)
            3. Identify the type of content
            
            Provide structured output.
        """.trimIndent()
    }

    private fun parseMetadataResponse(response: String): ExtractedMetadata? {
        return try {
            // Simple JSON parsing - in production use Gson or kotlinx.serialization
            val cleanResponse = response
                .substringAfter("{")
                .substringBeforeLast("}")
                .let { "{$it}" }

            // Parse JSON manually for demonstration
            val title = extractJsonValue(cleanResponse, "title")
            val author = extractJsonValue(cleanResponse, "author")
            val isbn = extractJsonValue(cleanResponse, "isbn")
            val publisher = extractJsonValue(cleanResponse, "publisher")
            val year = extractJsonValue(cleanResponse, "publicationYear")?.toIntOrNull()
            val genre = extractJsonArray(cleanResponse, "genre")
            val language = extractJsonValue(cleanResponse, "language")
            val summary = extractJsonValue(cleanResponse, "summary")

            ExtractedMetadata(
                title = title,
                author = author,
                isbn = isbn,
                publisher = publisher,
                publicationYear = year,
                genre = genre,
                language = language,
                summary = summary
            )
        } catch (e: Exception) {
            null
        }
    }

    private fun extractJsonValue(json: String, key: String): String? {
        val pattern = """"$key"\s*:\s*"([^"]*)"""".toRegex()
        return pattern.find(json)?.groupValues?.get(1)
    }

    private fun extractJsonArray(json: String, key: String): List<String> {
        val pattern = """"$key"\s*:\s*\[([^\]]*)\]""".toRegex()
        val match = pattern.find(json)?.groupValues?.get(1) ?: return emptyList()
        
        return match.split(",")
            .map { it.trim().removeSurrounding("\"") }
            .filter { it.isNotBlank() }
    }

    /**
     * Clean up resources
     */
    fun close() {
        llmInference?.close()
        llmInference = null
        _modelState.value = ModelState()
    }
}