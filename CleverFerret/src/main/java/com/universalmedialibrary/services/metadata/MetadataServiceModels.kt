package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.MediaType

/**
 * A unified data class for search results from various metadata sources.
 *
 * @property id The unique identifier from the source.
 * @property title The title of the media.
 * @property author The author of the media.
 * @property description A summary or description of the media.
 * @property coverUrl The URL for the cover art.
 * @property publishDate The publication date.
 * @property isbn The ISBN, if applicable.
 * @property publisher The publisher, if applicable.
 * @property pageCount The number of pages, if applicable.
 * @property genre The genre of the media.
 * @property language The language of the media.
 * @property rating The rating of the media.
 * @property mediaType The type of the media.
 * @property source The source of the metadata (e.g., "google_books", "tmdb").
 * @property confidence The confidence score of the match.
 * @property additionalData A map of any other extracted data.
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

/**
 * The result of a metadata enrichment operation.
 *
 * @property originalItem The original item that was enriched.
 * @property enrichedMetadata A map of the new or updated metadata fields.
 * @property sources The sources that provided the new metadata.
 * @property confidence The confidence score of the enrichment.
 * @property processingTime The time it took to process the enrichment, in milliseconds.
 * @property success Whether the enrichment was successful.
 * @property errors A list of any errors that occurred during enrichment.
 */
data class MetadataEnrichmentResult(
    val originalItem: Any,
    val enrichedMetadata: Map<String, Any>,
    val sources: List<String>,
    val confidence: Float,
    val processingTime: Long,
    val success: Boolean,
    val errors: List<String> = emptyList()
)

/**
 * Represents a metadata provider.
 *
 * @property name The name of the provider.
 * @property apiKey The API key for the provider.
 * @property isActive Whether the provider is currently active.
 * @property supportedTypes The types of media this provider supports.
 * @property rateLimitPerMinute The rate limit for the provider in requests per minute.
 * @property priority The priority of this provider in the metadata fetching process.
 */
data class MetadataProvider(
    val name: String,
    val apiKey: String?,
    val isActive: Boolean,
    val supportedTypes: List<MediaType>,
    val rateLimitPerMinute: Int,
    val priority: Int = 0
)

/**
 * Represents the result of a metadata lookup operation.
 */
sealed class MetadataLookupResult {
    /** A successful lookup with a list of results. */
    data class Success(val results: List<UnifiedMetadataSearchResult>) : MetadataLookupResult()
    /** A failed lookup with an error message. */
    data class Error(val message: String, val exception: Throwable? = null) : MetadataLookupResult()
    /** A lookup that completed successfully but found no results. */
    object NoResults : MetadataLookupResult()
}