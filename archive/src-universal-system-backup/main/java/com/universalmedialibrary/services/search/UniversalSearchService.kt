package com.universalmedialibrary.services.search

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.combine
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.services.tagging.UniversalTagManager
import com.universalmedialibrary.data.local.dao.SearchHistoryDao
import com.universalmedialibrary.data.local.dao.MediaTagRelationDao
import com.universalmedialibrary.data.local.dao.ContentRelationshipDao
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.services.search.engine.*

/**
 * Universal Search Service - Central search system for all media types.
 * Provides unified search across books, audio, video, documents, and all content types.
 */
@Singleton
class UniversalSearchService @Inject constructor(
    private val searchHistoryDao: SearchHistoryDao,
    private val mediaTagRelationDao: MediaTagRelationDao,
    private val contentRelationshipDao: ContentRelationshipDao,
    private val tagManager: UniversalTagManager,
    private val bookSearchEngine: BookSearchEngine,
    private val audioSearchEngine: AudioSearchEngine,
    private val videoSearchEngine: VideoSearchEngine,
    private val documentSearchEngine: DocumentSearchEngine
) {
    
    // ========== Main Search Operations ==========
    
    /**
     * Performs universal search across all media types.
     */
    suspend fun search(
        query: String,
        filters: SearchFilters = SearchFilters(),
        mediaTypes: List<MediaType> = MediaType.values().toList(),
        maxResults: Int = 50,
        includeTags: Boolean = true,
        includeContent: Boolean = true
    ): SearchResult {
        val startTime = System.currentTimeMillis()
        
        try {
            // Normalize query
            val normalizedQuery = normalizeQuery(query)
            
            // Record search in history
            val searchHistory = SearchHistory(
                query = query,
                normalizedQuery = normalizedQuery,
                filters = filters.toJson(),
                mediaTypes = mediaTypes.joinToString(",") { it.name },
                searchDurationMs = 0, // Will be updated at the end
                searchSource = SearchSource.MANUAL
            )
            val searchId = searchHistoryDao.insertSearch(searchHistory)
            
            // Perform search across specified media types
            val results = mutableListOf<MediaSearchResult>()
            
            if (includeContent) {
                mediaTypes.forEach { mediaType ->
                    when (mediaType) {
                        MediaType.BOOK, MediaType.AUDIO_BOOK, MediaType.COMIC, MediaType.DOCUMENT -> {
                            results.addAll(bookSearchEngine.search(query, filters, maxResults / mediaTypes.size))
                        }
                        MediaType.MUSIC, MediaType.PODCAST, MediaType.RADIO -> {
                            results.addAll(audioSearchEngine.search(query, filters, maxResults / mediaTypes.size))
                        }
                        MediaType.VIDEO -> {
                            results.addAll(videoSearchEngine.search(query, filters, maxResults / mediaTypes.size))
                        }
                        MediaType.IMAGE -> {
                            results.addAll(documentSearchEngine.search(query, filters, maxResults / mediaTypes.size))
                        }
                        else -> {
                            // Handle other media types
                        }
                    }
                }
            }
            
            // Search by tags if requested
            if (includeTags) {
                val tagResults = searchByTags(query, filters, mediaTypes)
                results.addAll(tagResults)
            }
            
            // Sort and rank results
            val rankedResults = rankResults(results, query, filters)
            
            // Limit results
            val limitedResults = rankedResults.take(maxResults)
            
            // Update search history with results
            val searchDuration = System.currentTimeMillis() - startTime
            searchHistoryDao.insertSearch(
                searchHistory.copy(
                    id = searchId,
                    resultCount = limitedResults.size,
                    searchDurationMs = searchDuration
                )
            )
            
            return SearchResult(
                query = query,
                results = limitedResults,
                totalResults = rankedResults.size,
                searchDurationMs = searchDuration,
                filters = filters,
                mediaTypes = mediaTypes
            )
            
        } catch (e: Exception) {
            // Record failed search
            val failedSearch = SearchHistory(
                query = query,
                normalizedQuery = normalizeQuery(query),
                filters = filters.toJson(),
                mediaTypes = mediaTypes.joinToString(",") { it.name },
                resultCount = 0,
                searchDurationMs = System.currentTimeMillis() - startTime,
                searchSource = SearchSource.MANUAL
            )
            searchHistoryDao.insertSearch(failedSearch)
            
            throw e
        }
    }
    
    /**
     * Performs natural language search with AI enhancements.
     */
    suspend fun naturalLanguageSearch(
        query: String,
        maxResults: Int = 50
    ): SearchResult {
        // Parse natural language query into structured search
        val parsedQuery = parseNaturalLanguageQuery(query)
        
        return search(
            query = parsedQuery.query,
            filters = parsedQuery.filters,
            mediaTypes = parsedQuery.mediaTypes,
            maxResults = maxResults
        )
    }
    
    /**
     * Search for content similar to a specific media item.
     */
    suspend fun findSimilarContent(
        mediaId: String,
        mediaType: MediaType,
        maxResults: Int = 20,
        includeAcrossTypes: Boolean = true
    ): List<MediaSearchResult> {
        val results = mutableListOf<MediaSearchResult>()
        
        // Get relationships from content relationship service
        val relationships = contentRelationshipDao.getRelationshipsFromMedia(mediaId, mediaType)
        
        relationships.forEach { relationship ->
            if (relationship.strength >= 0.5f) { // Only include strong relationships
                val relatedResult = MediaSearchResult(
                    id = relationship.targetMediaId,
                    title = "", // Will be filled by search engine
                    mediaType = relationship.targetMediaType,
                    relevanceScore = relationship.strength,
                    matchType = MatchType.RELATED,
                    highlights = emptyList(),
                    metadata = mapOf(
                        "relationship_type" to relationship.relationshipType.name,
                        "relationship_strength" to relationship.strength
                    )
                )
                results.add(relatedResult)
            }
        }
        
        // If requested, search across different media types
        if (includeAcrossTypes) {
            val crossMediaResults = searchCrossMediaSimilar(mediaId, mediaType, maxResults)
            results.addAll(crossMediaResults)
        }
        
        // Rank and limit results
        return results.sortedByDescending { it.relevanceScore }.take(maxResults)
    }
    
    // ========== Search Suggestions ==========
    
    /**
     * Gets search suggestions based on query and user history.
     */
    suspend fun getSearchSuggestions(
        query: String,
        limit: Int = 10,
        includeHistory: Boolean = true,
        includeTags: Boolean = true
    ): List<SearchSuggestion> {
        val suggestions = mutableListOf<SearchSuggestion>()
        val normalizedQuery = normalizeQuery(query)
        
        // Get suggestions from search history
        if (includeHistory) {
            val historySuggestions = searchHistoryDao.getSearchSuggestions(query, normalizedQuery, limit / 2)
            suggestions.addAll(historySuggestions.map { suggestion ->
                SearchSuggestion(
                    text = suggestion.query,
                    type = SuggestionType.HISTORY,
                    frequency = suggestion.frequency,
                    metadata = mapOf("last_used" to suggestion.lastUsed)
                )
            })
        }
        
        // Get suggestions from tags
        if (includeTags) {
            val tagSuggestions = tagManager.getTagSuggestions(normalizedQuery, limit / 2)
            suggestions.addAll(tagSuggestions.map { tag ->
                SearchSuggestion(
                    text = tag.name,
                    type = SuggestionType.TAG,
                    frequency = tag.usageCount,
                    metadata = mapOf(
                        "category" to tag.category.name,
                        "color" to tag.color
                    )
                )
            })
        }
        
        // Sort by relevance and limit
        return suggestions.sortedWith(compareByDescending<SearchSuggestion> { it.frequency }
            .thenBy { it.text.startsWith(query, ignoreCase = true) })
            .take(limit)
    }
    
    /**
     * Gets autocomplete suggestions for search input.
     */
    suspend fun getAutocompleteSuggestions(
        prefix: String,
        limit: Int = 10
    ): List<String> {
        val suggestions = searchHistoryDao.getAutocompleteSuggestions(prefix, limit)
        return suggestions.map { it.query }
    }
    
    // ========== Advanced Search ==========
    
    /**
     * Advanced search with complex filters and ranking.
     */
    suspend fun advancedSearch(
        request: AdvancedSearchRequest
    ): SearchResult {
        // Convert advanced request to basic search
        val filters = SearchFilters(
            mediaTypes = request.mediaTypes,
            dateRange = request.dateRange,
            tags = request.tags,
            excludeTags = request.excludeTags,
            durationRange = request.durationRange,
            sizeRange = request.sizeRange,
            qualityRange = request.qualityRange,
            language = request.language,
            source = request.source,
            sortBy = request.sortBy,
            sortOrder = request.sortOrder
        )
        
        return search(
            query = request.query,
            filters = filters,
            mediaTypes = request.mediaTypes,
            maxResults = request.maxResults,
            includeTags = request.includeInTagSearch,
            includeContent = request.includeInContentSearch
        )
    }
    
    /**
     * Saved searches management.
     */
    suspend fun saveSearch(
        name: String,
        query: String,
        filters: SearchFilters = SearchFilters()
    ): SavedSearch {
        val search = SavedSearch(
            id = 0, // Will be generated by database
            name = name,
            query = query,
            filters = filters.toJson(),
            createdAt = System.currentTimeMillis(),
            isDefault = false
        )
        // Implementation would save to database
        return search
    }
    
    suspend fun getSavedSearches(): List<SavedSearch> {
        // Implementation would retrieve from database
        return emptyList()
    }
    
    suspend fun deleteSavedSearch(searchId: Long): Boolean {
        // Implementation would delete from database
        return true
    }
    
    // ========== Search History ==========
    
    /**
     * Gets search history for user.
     */
    fun getSearchHistory(limit: Int = 50): Flow<List<SearchHistory>> {
        return searchHistoryDao.getAllSearchHistory().map { it.take(limit) }
    }
    
    /**
     * Gets recent searches.
     */
    suspend fun getRecentSearches(limit: Int = 20): List<SearchHistory> {
        return searchHistoryDao.getRecentSearches(limit)
    }
    
    /**
     * Gets favorite searches.
     */
    fun getFavoriteSearches(): Flow<List<SearchHistory>> {
        return searchHistoryDao.getFavoriteSearches()
    }
    
    /**
     * Marks a search as favorite.
     */
    suspend fun markSearchAsFavorite(searchId: Long): Boolean {
        return try {
            searchHistoryDao.markAsFavorite(searchId)
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Removes favorite status from a search.
     */
    suspend fun unmarkSearchAsFavorite(searchId: Long): Boolean {
        return try {
            searchHistoryDao.unmarkAsFavorite(searchId)
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Clears search history.
     */
    suspend fun clearSearchHistory(): Boolean {
        return try {
            // Implementation would clear history
            true
        } catch (e: Exception) {
            false
        }
    }
    
    // ========== Analytics ==========
    
    /**
     * Gets search analytics.
     */
    suspend fun getSearchAnalytics(days: Int = 30): SearchAnalytics {
        val since = System.currentTimeMillis() - (days * 24 * 60 * 60 * 1000L)
        
        val sourceStats = searchHistoryDao.getSearchSourceStats(since)
        val dailyStats = searchHistoryDao.getDailySearchStats(since)
        val popularSearches = searchHistoryDao.getPopularSearches(since, 20)
        
        return SearchAnalytics(
            totalSearches = searchHistoryDao.getSearchCountSince(since),
            averageDuration = searchHistoryDao.getAverageSearchDuration(since) ?: 0f,
            averageResults = searchHistoryDao.getAverageResultCount(since) ?: 0f,
            sourceBreakdown = sourceStats,
            dailyBreakdown = dailyStats,
            popularQueries = popularSearches.map { it.query }
        )
    }
    
    // ========== Private Helper Methods ==========
    
    private suspend fun searchByTags(
        query: String,
        filters: SearchFilters,
        mediaTypes: List<MediaType>
    ): List<MediaSearchResult> {
        val results = mutableListOf<MediaSearchResult>()
        
        // Find tags matching query
        val matchingTags = tagManager.searchTags(query, 20)
        
        matchingTags.forEach { tag ->
            // Get media items for this tag
            val mediaRelations = relationDao.getMediaForTag(tag.id)
            mediaRelations.collect { relations ->
                relations.filter { it.mediaType in mediaTypes }.forEach { relation ->
                    val result = MediaSearchResult(
                        id = relation.mediaId,
                        title = "", // Will be filled by search engine
                        mediaType = relation.mediaType,
                        relevanceScore = relation.weight * relation.confidence,
                        matchType = MatchType.TAG,
                        highlights = listOf("Tag: ${tag.name}"),
                        metadata = mapOf(
                            "tag_name" to tag.name,
                            "tag_category" to tag.category.name,
                            "tag_color" to tag.color
                        )
                    )
                    results.add(result)
                }
            }
        }
        
        return results
    }
    
    private suspend fun searchCrossMediaSimilar(
        mediaId: String,
        mediaType: MediaType,
        maxResults: Int
    ): List<MediaSearchResult> {
        val results = mutableListOf<MediaSearchResult>()
        
        // Get tags for the source media
        val sourceTags = mediaTagRelationDao.getTagsForMedia(mediaId, mediaType)
        
        // Find media with similar tags across different types
        sourceTags.forEach { relation ->
            val similarMedia = relationDao.getMediaForTag(relation.tagId)
            similarMedia.collect { relations ->
                relations.filter { it.mediaType != mediaType }
                    .take(maxResults / sourceTags.size)
                    .forEach { similarRelation ->
                        val result = MediaSearchResult(
                            id = similarRelation.mediaId,
                            title = "",
                            mediaType = similarRelation.mediaType,
                            relevanceScore = similarRelation.weight * relation.confidence,
                            matchType = MatchType.SIMILAR_TAGS,
                            highlights = listOf("Similar tags"),
                            metadata = mapOf("shared_tags" to relation.tagId)
                        )
                        results.add(result)
                    }
            }
        }
        
        return results
    }
    
    private fun rankResults(
        results: List<MediaSearchResult>,
        query: String,
        filters: SearchFilters
    ): List<MediaSearchResult> {
        return results.sortedWith(compareByDescending<MediaSearchResult> { result ->
            var score = result.relevanceScore
            
            // Boost exact title matches
            if (result.title.equals(query, ignoreCase = true)) {
                score *= 1.5f
            }
            
            // Boost partial title matches
            if (result.title.contains(query, ignoreCase = true)) {
                score *= 1.2f
            }
            
            // Boost preferred media types
            if (result.mediaType in filters.preferredMediaTypes) {
                score *= 1.1f
            }
            
            // Apply date recency boost if requested
            if (filters.boostRecent && result.metadata.containsKey("created_at")) {
                val createdAt = result.metadata["created_at"] as? Long ?: 0
                val daysSinceCreation = (System.currentTimeMillis() - createdAt) / (24 * 60 * 60 * 1000)
                val recencyBoost = maxOf(0.0f, 1.0f - (daysSinceCreation / 365.0f))
                score *= (1.0f + recencyBoost * 0.2f)
            }
            
            score
        }.thenBy { it.title.lowercase() })
    }
    
    private fun normalizeQuery(query: String): String {
        return query.trim().lowercase()
            .replace(Regex("[^a-zA-Z0-9\\s]"), " ")
            .replace(Regex("\\s+"), " ")
    }
    
    private fun parseNaturalLanguageQuery(query: String): ParsedQuery {
        // Natural language parsing implementation
        // This would use AI or rule-based parsing to extract filters from natural language
        
        var processedQuery = query
        val filters = SearchFilters()
        val mediaTypes = mutableListOf<MediaType>()
        
        // Extract media type hints
        if (processedQuery.contains("book", ignoreCase = true)) {
            mediaTypes.addAll(listOf(MediaType.BOOK, MediaType.AUDIO_BOOK, MediaType.COMIC))
            processedQuery = processedQuery.replace(Regex("\\b(book|books)\\b", RegexOption.IGNORE_CASE), "")
        }
        
        if (processedQuery.contains("music", ignoreCase = true) || processedQuery.contains("song", ignoreCase = true)) {
            mediaTypes.addAll(listOf(MediaType.MUSIC))
            processedQuery = processedQuery.replace(Regex("\\b(music|song|songs)\\b", RegexOption.IGNORE_CASE), "")
        }
        
        if (processedQuery.contains("video", ignoreCase = true) || processedQuery.contains("movie", ignoreCase = true)) {
            mediaTypes.addAll(listOf(MediaType.VIDEO))
            processedQuery = processedQuery.replace(Regex("\\b(video|movie|movies)\\b", RegexOption.IGNORE_CASE), "")
        }
        
        // Extract date hints
        val datePattern = Regex("(\\d{4})|recent|new|old")
        datePattern.find(processedQuery)?.let { match ->
            match.value.toIntOrNull()?.let { year ->
                filters.dateRange = DateRange(year, year)
            }
        }
        
        return ParsedQuery(
            query = processedQuery.trim(),
            filters = filters,
            mediaTypes = if (mediaTypes.isEmpty()) MediaType.values().toList() else mediaTypes
        )
    }
}

// Data classes for search operations
data class SearchResult(
    val query: String,
    val results: List<MediaSearchResult>,
    val totalResults: Int,
    val searchDurationMs: Long,
    val filters: SearchFilters,
    val mediaTypes: List<MediaType>
)

data class MediaSearchResult(
    val id: String,
    val title: String,
    val mediaType: MediaType,
    val relevanceScore: Float,
    val matchType: MatchType,
    val highlights: List<String>,
    val metadata: Map<String, Any>
)

data class SearchFilters(
    val mediaTypes: List<MediaType> = emptyList(),
    val dateRange: DateRange? = null,
    val tags: List<String> = emptyList(),
    val excludeTags: List<String> = emptyList(),
    val durationRange: DurationRange? = null,
    val sizeRange: SizeRange? = null,
    val qualityRange: QualityRange? = null,
    val language: String? = null,
    val source: String? = null,
    val sortBy: SortBy = SortBy.RELEVANCE,
    val sortOrder: SortOrder = SortOrder.DESC,
    val preferredMediaTypes: List<MediaType> = emptyList(),
    val boostRecent: Boolean = false
)

data class SearchSuggestion(
    val text: String,
    val type: SuggestionType,
    val frequency: Int,
    val metadata: Map<String, Any> = emptyMap()
)

data class SavedSearch(
    val id: Long,
    val name: String,
    val query: String,
    val filters: String, // JSON
    val createdAt: Long,
    val isDefault: Boolean
)

data class SearchAnalytics(
    val totalSearches: Int,
    val averageDuration: Float,
    val averageResults: Float,
    val sourceBreakdown: List<SearchSourceStats>,
    val dailyBreakdown: List<DailySearchStats>,
    val popularQueries: List<String>
)

// Enums and supporting data classes
enum class MatchType {
    TITLE, CONTENT, TAG, METADATA, RELATED, SIMILAR_TAGS
}

enum class SuggestionType {
    HISTORY, TAG, AUTO_COMPLETE, RECOMMENDATION
}

enum class SortBy {
    RELEVANCE, TITLE, DATE, DURATION, SIZE, RATING, USAGE
}

enum class SortOrder {
    ASC, DESC
}

data class DateRange(val start: Int, val end: Int)
data class DurationRange(val min: Long, val max: Long)
data class SizeRange(val min: Long, val max: Long)
data class QualityRange(val min: Float, val max: Float)

data class ParsedQuery(
    val query: String,
    val filters: SearchFilters,
    val mediaTypes: List<MediaType>
)

data class AdvancedSearchRequest(
    val query: String,
    val mediaTypes: List<MediaType>,
    val dateRange: DateRange? = null,
    val tags: List<String> = emptyList(),
    val excludeTags: List<String> = emptyList(),
    val durationRange: DurationRange? = null,
    val sizeRange: SizeRange? = null,
    val qualityRange: QualityRange? = null,
    val language: String? = null,
    val source: String? = null,
    val sortBy: SortBy = SortBy.RELEVANCE,
    val sortOrder: SortOrder = SortOrder.DESC,
    val maxResults: Int = 50,
    val includeInTagSearch: Boolean = true,
    val includeInContentSearch: Boolean = true
)