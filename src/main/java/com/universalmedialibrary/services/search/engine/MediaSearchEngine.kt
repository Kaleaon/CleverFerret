package com.universalmedialibrary.services.search.engine

import com.universalmedialibrary.data.local.entity.MediaType
import com.universalmedialibrary.services.search.SearchFilters
import com.universalmedialibrary.services.search.MediaSearchResult

/**
 * Abstract base class for media-specific search engines.
 * Each media type (books, audio, video, etc.) implements its own search logic.
 */
abstract class MediaSearchEngine {
    
    /**
     * Performs search within the specific media type.
     */
    abstract suspend fun search(
        query: String,
        filters: SearchFilters,
        maxResults: Int
    ): List<MediaSearchResult>
    
    /**
     * Gets suggestions for autocomplete within this media type.
     */
    abstract suspend fun getSuggestions(query: String, limit: Int): List<String>
    
    /**
     * Gets detailed information for a specific media item.
     */
    abstract suspend fun getMediaDetails(mediaId: String): MediaSearchResult?
    
    /**
     * Calculates relevance score for a search result.
     */
    protected fun calculateRelevanceScore(
        title: String,
        content: String,
        query: String,
        metadata: Map<String, Any> = emptyMap()
    ): Float {
        var score = 0.0f
        
        val queryLower = query.lowercase()
        val titleLower = title.lowercase()
        val contentLower = content.lowercase()
        
        // Exact title match
        if (titleLower == queryLower) {
            score += 1.0f
        }
        // Title starts with query
        else if (titleLower.startsWith(queryLower)) {
            score += 0.8f
        }
        // Title contains query
        else if (titleLower.contains(queryLower)) {
            score += 0.6f
        }
        
        // Content matches
        if (contentLower.contains(queryLower)) {
            score += 0.4f
        }
        
        // Boost based on metadata
        metadata["rating"]?.let { rating ->
            if (rating is Number) {
                score += rating.toFloat() * 0.1f
            }
        }
        
        metadata["popularity"]?.let { popularity ->
            if (popularity is Number) {
                score += minOf(popularity.toFloat() * 0.05f, 0.2f)
            }
        }
        
        return score.coerceIn(0.0f, 1.0f)
    }
    
    /**
     * Extracts highlights from content for search results.
     */
    protected fun extractHighlights(content: String, query: String, maxHighlights: Int = 3): List<String> {
        val queryLower = query.lowercase()
        val sentences = content.split(Regex("[.!?]+")).map { it.trim() }.filter { it.isNotEmpty() }
        
        return sentences
            .filter { it.lowercase().contains(queryLower) }
            .take(maxHighlights)
            .map { sentence ->
                // Highlight the matching term
                val highlighted = sentence.replace(
                    Regex(query, RegexOption.IGNORE_CASE),
                    { match -> "**${match.value}**" }
                )
                if (highlighted.length > 100) {
                    "${highlighted.take(97)}..."
                } else {
                    highlighted
                }
            }
    }
    
    /**
     * Applies filters to search results.
     */
    protected suspend fun applyFilters(
        results: List<MediaSearchResult>,
        filters: SearchFilters,
        mediaType: MediaType
    ): List<MediaSearchResult> {
        return results.filter { result ->
            // Media type filter
            if (filters.mediaTypes.isNotEmpty() && mediaType !in filters.mediaTypes) {
                return@filter false
            }
            
            // Date range filter
            filters.dateRange?.let { dateRange ->
                val year = result.metadata["year"] as? Int
                if (year != null && (year < dateRange.start || year > dateRange.end)) {
                    return@filter false
                }
            }
            
            // Duration filter
            filters.durationRange?.let { durationRange ->
                val duration = result.metadata["duration"] as? Long
                if (duration != null && (duration < durationRange.min || duration > durationRange.max)) {
                    return@filter false
                }
            }
            
            // Size filter
            filters.sizeRange?.let { sizeRange ->
                val size = result.metadata["size"] as? Long
                if (size != null && (size < sizeRange.min || size > sizeRange.max)) {
                    return@filter false
                }
            }
            
            // Quality filter
            filters.qualityRange?.let { qualityRange ->
                val quality = result.metadata["quality"] as? Float
                if (quality != null && (quality < qualityRange.min || quality > qualityRange.max)) {
                    return@filter false
                }
            }
            
            // Language filter
            filters.language?.let { language ->
                val itemLanguage = result.metadata["language"] as? String
                if (itemLanguage != null && itemLanguage != language) {
                    return@filter false
                }
            }
            
            // Source filter
            filters.source?.let { source ->
                val itemSource = result.metadata["source"] as? String
                if (itemSource != null && itemSource != source) {
                    return@filter false
                }
            }
            
            true
        }
    }
}

/**
 * Data class for search engine configuration.
 */
data class SearchEngineConfig(
    val maxResults: Int = 50,
    val enableFuzzySearch: Boolean = true,
    val enableContentSearch: Boolean = true,
    val enableMetadataSearch: Boolean = true,
    val boostRecent: Boolean = false,
    val boostPopular: Boolean = false
)