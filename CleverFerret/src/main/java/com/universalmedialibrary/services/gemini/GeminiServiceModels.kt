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
