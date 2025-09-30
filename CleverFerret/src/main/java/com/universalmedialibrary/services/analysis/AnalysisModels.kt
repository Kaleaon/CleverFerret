package com.universalmedialibrary.services.analysis

import com.universalmedialibrary.data.MediaType

/**
 * Data models for content analysis services
 */

data class ExtractedMetadata(
    val title: String?,
    val author: String?,
    val description: String?,
    val publishDate: String?,
    val genre: String?,
    val language: String?,
    val isbn: String?,
    val publisher: String?,
    val pageCount: Int?,
    val confidence: Float = 0.0f,
    val extractionMethod: String,
    val additionalData: Map<String, Any> = emptyMap()
)

data class ContentClassification(
    val mediaType: MediaType,
    val genre: String?,
    val subGenre: String?,
    val ageRating: String?,
    val contentWarnings: List<String> = emptyList(),
    val confidence: Float = 0.0f,
    val classificationReason: String,
    val tags: List<String> = emptyList()
)

data class ArchiveMatch(
    val matchType: ArchiveMatchType,
    val confidence: Float,
    val sourceArchive: String,
    val matchedItem: ArchiveItem,
    val similarityScore: Float,
    val matchedFields: List<String>
)

enum class ArchiveMatchType {
    EXACT_MATCH,
    FUZZY_MATCH,
    PARTIAL_MATCH,
    NO_MATCH
}

data class ArchiveItem(
    val id: String,
    val title: String,
    val author: String?,
    val year: String?,
    val isbn: String?,
    val source: String,
    val metadata: Map<String, Any> = emptyMap()
)

data class ContentAnalysisResult(
    val extractedMetadata: ExtractedMetadata?,
    val classification: ContentClassification?,
    val archiveMatches: List<ArchiveMatch>,
    val fingerprint: String?,
    val processingTime: Long,
    val success: Boolean,
    val errors: List<String> = emptyList()
)
