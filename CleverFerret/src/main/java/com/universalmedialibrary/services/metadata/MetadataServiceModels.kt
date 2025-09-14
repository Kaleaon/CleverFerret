package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.MediaType

/**
 * Data models for metadata services
 */

data class UnifiedMetadataSearchResult(
    val id: String,
    val title: String,
    val author: String?,
    val description: String?,
    val coverUrl: String?,
    val publishDate: String?,
    val isbn: String?,
    val publisher: String?,
    val pageCount: Int?,
    val genre: String?,
    val language: String?,
    val rating: Float?,
    val mediaType: MediaType,
    val source: String, // "google_books", "tmdb", "spotify", etc.
    val confidence: Float = 0.0f,
    val additionalData: Map<String, Any> = emptyMap()
)

data class MetadataEnrichmentResult(
    val originalItem: Any,
    val enrichedMetadata: Map<String, Any>,
    val sources: List<String>,
    val confidence: Float,
    val processingTime: Long,
    val success: Boolean,
    val errors: List<String> = emptyList()
)

data class MetadataProvider(
    val name: String,
    val apiKey: String?,
    val isActive: Boolean,
    val supportedTypes: List<MediaType>,
    val rateLimitPerMinute: Int,
    val priority: Int = 0
)

sealed class MetadataLookupResult {
    data class Success(val results: List<UnifiedMetadataSearchResult>) : MetadataLookupResult()
    data class Error(val message: String, val exception: Throwable? = null) : MetadataLookupResult()
    object NoResults : MetadataLookupResult()
}