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
 * Gemini AI Service for OCR, book identification, and automated debugging
 *
 * PRIMARY AI SERVICE for CleverFerret
 * This is the main AI integration that all devices should use.
 * Uses Google's Gemini API for cloud-based AI processing.
 *
 * This service provides:
 * - Visual OCR of book pages (images) to extract text
 * - Book metadata identification from covers and content
 * - Text analysis and enhancement capabilities
 * - Automated debugging and issue analysis
 * - Automated issue filing and error reporting
 *
 * For devices with powerful hardware, a separate plugin app with GemmaLLMService
 * can be downloaded for on-device processing.
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
                modelName = "gemini-2.5-pro",
                apiKey = apiKey
            )
            true
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Translate manga/comic speech bubbles from a single page image.
     * Returns strict JSON text with bubble coordinates and translations.
     */
    suspend fun translateComicPage(
        pageBitmap: Bitmap,
        targetLanguage: String = "en"
    ): String = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext "{\"error\":\"Gemini integration is disabled\"}"
        }

        val model = generativeModel
        if (model == null) {
            return@withContext "{\"error\":\"Gemini service not initialized\"}"
        }

        val prompt = """
            You are helping translate a manga/comic page. Tasks:
            1) Detect dialogue speech bubbles and rectangular narration boxes. Ignore pure SFX unless they clearly convey dialogue.
            2) Extract the exact original text per bubble/box (respect vertical or stylized text).
            3) Identify the source language.
            4) Translate faithfully to ${'$'}targetLanguage (natural, concise).
            5) Return only JSON with integer pixel coordinates in the source image space.

            Constraints:
            - Output JSON only, no extra commentary.
            - Coordinates are pixel integers relative to the provided image (origin top-left).
            - For each bubble/box, include a tight bbox and a 3–8 point polygon if irregular.

            JSON shape:
            {
              "page_language": "ja",
              "bubbles": [
                {
                  "id": "b1",
                  "bbox": [x, y, w, h],
                  "polygon": [[x1,y1],[x2,y2],[x3,y3],[x4,y4]],
                  "reading_order": 1,
                  "original_text": "…",
                  "translation": "…",
                  "is_dialogue": true
                }
              ]
            }

            Notes:
            - Preserve reading order as published (right-to-left if applicable).
            - If unsure or illegible, set original_text to "" and give best-effort translation.
        """.trimIndent()

        try {
            val c = content {
                text(prompt)
                image(pageBitmap)
            }
            val response = model.generateContent(c)
            response.text ?: "{}"
        } catch (e: Exception) {
            "{\"error\":\"${'$'}{e.message}\"}"
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
     * Analyze application errors and suggest fixes
     */
    suspend fun analyzeError(
        errorMessage: String,
        stackTrace: String,
        contextInfo: String = ""
    ): ErrorAnalysisResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext ErrorAnalysisResult(
                success = false,
                error = "Gemini integration is disabled"
            )
        }

        val model = generativeModel
        if (model == null) {
            return@withContext ErrorAnalysisResult(
                success = false,
                error = "Gemini service not initialized"
            )
        }

        try {
            val prompt = """
                Analyze this Android/Kotlin application error and provide debugging insights in JSON format:

                Error Message: $errorMessage
                Stack Trace: $stackTrace
                Context: $contextInfo

                Please provide your analysis in this JSON format:
                {
                    "errorType": "classification of error (e.g., NullPointerException, NetworkError, etc.)",
                    "severity": "LOW|MEDIUM|HIGH|CRITICAL",
                    "rootCause": "likely root cause of the issue",
                    "suggestedFixes": ["fix1", "fix2", "fix3"],
                    "codeExamples": ["corrected code snippet if applicable"],
                    "preventionTips": ["tip1", "tip2"],
                    "relatedIssues": ["similar issues that might be related"],
                    "confidence": 0.85,
                    "debuggingSteps": ["step1", "step2", "step3"],
                    "affectedComponents": ["component1", "component2"]
                }

                Focus on practical, actionable solutions for Android/Kotlin development.
            """.trimIndent()

            val response = model.generateContent(prompt)
            val responseText = response.text ?: ""

            parseErrorAnalysisResponse(responseText)

        } catch (e: Exception) {
            ErrorAnalysisResult(
                success = false,
                error = "Error analyzing issue: ${e.message}"
            )
        }
    }

    /**
     * Generate automated issue report for GitHub
     */
    suspend fun generateIssueReport(
        title: String,
        description: String,
        errorLogs: String = "",
        deviceInfo: String = "",
        stepsToReproduce: String = ""
    ): IssueReportResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext IssueReportResult(
                success = false,
                error = "Gemini integration is disabled"
            )
        }

        val model = generativeModel
        if (model == null) {
            return@withContext IssueReportResult(
                success = false,
                error = "Gemini service not initialized"
            )
        }

        try {
            val prompt = """
                Create a comprehensive GitHub issue report for CleverFerret Universal Media Library based on this information:

                Title: $title
                Description: $description
                Error Logs: $errorLogs
                Device Info: $deviceInfo
                Steps to Reproduce: $stepsToReproduce

                Generate a professional GitHub issue in markdown format with these sections:
                - **Summary**: Brief description of the issue
                - **Expected Behavior**: What should happen
                - **Actual Behavior**: What actually happens
                - **Steps to Reproduce**: Clear reproduction steps
                - **Environment**: Device and app version info
                - **Error Logs**: Formatted code blocks with logs
                - **Possible Causes**: Technical analysis
                - **Suggested Labels**: Appropriate GitHub labels
                - **Priority**: Assessment of issue priority

                Make it professional, clear, and actionable for developers.
            """.trimIndent()

            val response = model.generateContent(prompt)
            val issueReport = response.text ?: ""

            IssueReportResult(
                success = true,
                issueReport = issueReport,
                suggestedLabels = extractSuggestedLabels(issueReport),
                priority = extractPriority(issueReport)
            )

        } catch (e: Exception) {
            IssueReportResult(
                success = false,
                error = "Error generating issue report: ${e.message}"
            )
        }
    }

    /**
     * Analyze code quality and suggest improvements
     */
    suspend fun analyzeCodeQuality(
        codeSnippet: String,
        fileName: String = "",
        language: String = "kotlin"
    ): CodeAnalysisResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext CodeAnalysisResult(
                success = false,
                error = "Gemini integration is disabled"
            )
        }

        val model = generativeModel
        if (model == null) {
            return@withContext CodeAnalysisResult(
                success = false,
                error = "Gemini service not initialized"
            )
        }

        try {
            val prompt = """
                Analyze this $language code snippet and provide quality assessment and suggestions:

                File: $fileName
                Code:
                ```$language
                $codeSnippet
                ```

                Provide analysis in JSON format:
                {
                    "qualityScore": 8.5,
                    "issues": [
                        {
                            "type": "PERFORMANCE|SECURITY|MAINTAINABILITY|BUG|STYLE",
                            "severity": "LOW|MEDIUM|HIGH|CRITICAL",
                            "line": 10,
                            "description": "issue description",
                            "suggestion": "how to fix it"
                        }
                    ],
                    "positives": ["good practice 1", "good practice 2"],
                    "suggestions": ["improvement 1", "improvement 2"],
                    "complexity": "LOW|MEDIUM|HIGH",
                    "maintainability": "POOR|FAIR|GOOD|EXCELLENT",
                    "bestPractices": ["practice 1", "practice 2"]
                }

                Focus on Android/Kotlin best practices, performance, and maintainability.
            """.trimIndent()

            val response = model.generateContent(prompt)
            val responseText = response.text ?: ""

            parseCodeAnalysisResponse(responseText)

        } catch (e: Exception) {
            CodeAnalysisResult(
                success = false,
                error = "Error analyzing code: ${e.message}"
            )
        }
    }

    /**
     * Automated system health check and diagnostics
     */
    suspend fun performSystemDiagnostics(
        systemInfo: String,
        recentErrors: List<String> = emptyList(),
        performanceMetrics: String = ""
    ): DiagnosticsResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext DiagnosticsResult(
                success = false,
                error = "Gemini integration is disabled"
            )
        }

        val model = generativeModel
        if (model == null) {
            return@withContext DiagnosticsResult(
                success = false,
                error = "Gemini service not initialized"
            )
        }

        try {
            val prompt = """
                Perform comprehensive system diagnostics for CleverFerret app:

                System Info: $systemInfo
                Recent Errors: ${recentErrors.joinToString("\n")}
                Performance Metrics: $performanceMetrics

                Provide diagnostic results in JSON format:
                {
                    "overallHealth": "EXCELLENT|GOOD|FAIR|POOR",
                    "healthScore": 85,
                    "criticalIssues": ["issue1", "issue2"],
                    "warnings": ["warning1", "warning2"],
                    "recommendations": [
                        {
                            "category": "PERFORMANCE|MEMORY|STORAGE|NETWORK",
                            "priority": "LOW|MEDIUM|HIGH|CRITICAL",
                            "description": "recommendation description",
                            "action": "specific action to take"
                        }
                    ],
                    "systemOptimizations": ["optimization1", "optimization2"],
                    "preventiveMeasures": ["measure1", "measure2"],
                    "monitoringPoints": ["metric1", "metric2"]
                }

                Focus on Android app performance, stability, and user experience.
            """.trimIndent()

            val response = model.generateContent(prompt)
            val responseText = response.text ?: ""

            parseDiagnosticsResponse(responseText)

        } catch (e: Exception) {
            DiagnosticsResult(
                success = false,
                error = "Error performing diagnostics: ${e.message}"
            )
        }
    }

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

    /**
     * Parse error analysis response from Gemini
     */
    private fun parseErrorAnalysisResponse(responseText: String): ErrorAnalysisResult {
        return try {
            val jsonStart = responseText.indexOf("{")
            val jsonEnd = responseText.lastIndexOf("}") + 1

            if (jsonStart >= 0 && jsonEnd > jsonStart) {
                val jsonText = responseText.substring(jsonStart, jsonEnd)
                ErrorAnalysisResult(
                    success = true,
                    errorType = extractJsonValue(jsonText, "errorType"),
                    severity = extractJsonValue(jsonText, "severity") ?: "MEDIUM",
                    rootCause = extractJsonValue(jsonText, "rootCause"),
                    suggestedFixes = extractJsonArray(jsonText, "suggestedFixes"),
                    confidence = extractJsonValue(jsonText, "confidence")?.toFloatOrNull() ?: 0.5f
                )
            } else {
                ErrorAnalysisResult(
                    success = false,
                    error = "Could not parse error analysis response"
                )
            }
        } catch (e: Exception) {
            ErrorAnalysisResult(
                success = false,
                error = "Error parsing analysis: ${e.message}"
            )
        }
    }

    /**
     * Parse code analysis response from Gemini
     */
    private fun parseCodeAnalysisResponse(responseText: String): CodeAnalysisResult {
        return try {
            val jsonStart = responseText.indexOf("{")
            val jsonEnd = responseText.lastIndexOf("}") + 1

            if (jsonStart >= 0 && jsonEnd > jsonStart) {
                val jsonText = responseText.substring(jsonStart, jsonEnd)
                CodeAnalysisResult(
                    success = true,
                    qualityScore = extractJsonValue(jsonText, "qualityScore")?.toFloatOrNull() ?: 5.0f,
                    complexity = extractJsonValue(jsonText, "complexity") ?: "MEDIUM",
                    maintainability = extractJsonValue(jsonText, "maintainability") ?: "FAIR",
                    suggestions = extractJsonArray(jsonText, "suggestions")
                )
            } else {
                CodeAnalysisResult(
                    success = false,
                    error = "Could not parse code analysis response"
                )
            }
        } catch (e: Exception) {
            CodeAnalysisResult(
                success = false,
                error = "Error parsing code analysis: ${e.message}"
            )
        }
    }

    /**
     * Parse diagnostics response from Gemini
     */
    private fun parseDiagnosticsResponse(responseText: String): DiagnosticsResult {
        return try {
            val jsonStart = responseText.indexOf("{")
            val jsonEnd = responseText.lastIndexOf("}") + 1

            if (jsonStart >= 0 && jsonEnd > jsonStart) {
                val jsonText = responseText.substring(jsonStart, jsonEnd)
                DiagnosticsResult(
                    success = true,
                    overallHealth = extractJsonValue(jsonText, "overallHealth") ?: "FAIR",
                    healthScore = extractJsonValue(jsonText, "healthScore")?.toIntOrNull() ?: 50,
                    criticalIssues = extractJsonArray(jsonText, "criticalIssues"),
                    warnings = extractJsonArray(jsonText, "warnings"),
                    recommendations = extractJsonArray(jsonText, "systemOptimizations")
                )
            } else {
                DiagnosticsResult(
                    success = false,
                    error = "Could not parse diagnostics response"
                )
            }
        } catch (e: Exception) {
            DiagnosticsResult(
                success = false,
                error = "Error parsing diagnostics: ${e.message}"
            )
        }
    }

    /**
     * Extract suggested labels from issue report
     */
    private fun extractSuggestedLabels(issueReport: String): List<String> {
        val labelPattern = "\\*\\*Suggested Labels\\*\\*:?\\s*([^\\n]+)".toRegex()
        val match = labelPattern.find(issueReport)
        return match?.groupValues?.get(1)?.split(",")?.map { it.trim() } ?: emptyList()
    }

    /**
     * Extract priority from issue report
     */
    private fun extractPriority(issueReport: String): String {
        val priorityPattern = "\\*\\*Priority\\*\\*:?\\s*([^\\n]+)".toRegex()
        val match = priorityPattern.find(issueReport)
        return match?.groupValues?.get(1)?.trim() ?: "MEDIUM"
    }

    /**
     * Extract JSON array values (simple implementation)
     */
    private fun extractJsonArray(json: String, key: String): List<String> {
        val pattern = "\"$key\"\\s*:\\s*\\[([^\\]]+)\\]".toRegex()
        val match = pattern.find(json) ?: return emptyList()
        val arrayContent = match.groupValues[1]
        return arrayContent.split(",").map {
            it.trim().removeSurrounding("\"")
        }.filter { it.isNotBlank() }
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

/**
 * Result of error analysis
 */
data class ErrorAnalysisResult(
    val success: Boolean,
    val errorType: String? = null,
    val severity: String = "MEDIUM",
    val rootCause: String? = null,
    val suggestedFixes: List<String> = emptyList(),
    val confidence: Float = 0.5f,
    val error: String? = null
)

/**
 * Result of issue report generation
 */
data class IssueReportResult(
    val success: Boolean,
    val issueReport: String = "",
    val suggestedLabels: List<String> = emptyList(),
    val priority: String = "MEDIUM",
    val error: String? = null
)

/**
 * Result of code analysis
 */
data class CodeAnalysisResult(
    val success: Boolean,
    val qualityScore: Float = 5.0f,
    val complexity: String = "MEDIUM",
    val maintainability: String = "FAIR",
    val suggestions: List<String> = emptyList(),
    val error: String? = null
)

/**
 * Result of system diagnostics
 */
data class DiagnosticsResult(
    val success: Boolean,
    val overallHealth: String = "FAIR",
    val healthScore: Int = 50,
    val criticalIssues: List<String> = emptyList(),
    val warnings: List<String> = emptyList(),
    val recommendations: List<String> = emptyList(),
    val error: String? = null
)
