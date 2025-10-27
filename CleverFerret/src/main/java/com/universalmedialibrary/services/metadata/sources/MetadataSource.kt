package com.universalmedialibrary.services.metadata.sources

/**
 * Interface for metadata sources (Goodreads, Google Books, etc.)
 */
interface MetadataSource {
    val sourceName: String
    val priority: Int
    val supportedTypes: List<MediaType>
    
    /**
     * Search for items
     */
    suspend fun search(
        query: String? = null,
        isbn: String? = null,
        title: String? = null,
        author: String? = null,
        maxResults: Int = 10
    ): Result<List<MetadataSearchResult>>
    
    /**
     * Get detailed metadata
     */
    suspend fun getDetails(sourceId: String): Result<EnhancedMetadata?>
}

enum class MediaType {
    BOOK,
    COMIC,
    MANGA,
    AUDIOBOOK,
    EBOOK
}

/**
 * Search result with basic info
 */
data class MetadataSearchResult(
    val sourceId: String,
    val title: String,
    val authors: List<String>,
    val description: String?,
    val coverUrl: String?,
    val isbn: String?,
    val publishDate: String?,
    val source: String
)

/**
 * Enhanced metadata with all available fields
 */
data class EnhancedMetadata(
    val title: String,
    val subtitle: String? = null,
    val authors: List<String>,
    val description: String? = null,
    val isbn: String? = null,
    val isbn13: String? = null,
    val publisher: String? = null,
    val publishDate: String? = null,
    val language: String = "en",
    val pageCount: Int? = null,
    val categories: List<String> = emptyList(),
    val tags: List<String> = emptyList(),
    val series: SeriesInfo? = null,
    val rating: Float? = null,
    val ratingCount: Int? = null,
    val reviewCount: Int? = null,
    val coverUrl: String? = null,
    val sourceId: String,
    val source: String,
    
    // Enhanced fields
    val genres: List<String> = emptyList(),
    val moods: List<String> = emptyList(),
    val characters: List<String> = emptyList(),
    val settings: List<String> = emptyList(),
    val awards: List<String> = emptyList(),
    val similarBooks: List<BookReference> = emptyList()
)

data class SeriesInfo(
    val name: String,
    val position: Float? = null,
    val totalBooks: Int? = null
)

data class BookReference(
    val title: String,
    val authors: List<String>,
    val coverUrl: String? = null,
    val sourceId: String? = null
)
