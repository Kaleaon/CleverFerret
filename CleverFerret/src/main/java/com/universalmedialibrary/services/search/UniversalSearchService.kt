package com.universalmedialibrary.services.search

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal Search Service for CleverFerret
 * 
 * Provides unified search across all media types with advanced filtering,
 * search history, and intelligent result ranking.
 */
@Singleton
class UniversalSearchService @Inject constructor(
    private val bookSearchEngine: BookSearchEngine,
    private val audioSearchEngine: AudioSearchEngine,
    private val videoSearchEngine: VideoSearchEngine,
    private val documentSearchEngine: DocumentSearchEngine,
    private val searchHistoryManager: SearchHistoryManager
) {
    
    private val _searchResults = MutableStateFlow<List<UniversalSearchResult>>(emptyList())
    val searchResults: Flow<List<UniversalSearchResult>> = _searchResults.asStateFlow()
    
    private val searchEngines = mapOf(
        "BOOK" to bookSearchEngine,
        "AUDIO" to audioSearchEngine,
        "VIDEO" to videoSearchEngine,
        "DOCUMENT" to documentSearchEngine
    )

    /**
     * Perform universal search across specified media types
     */
    suspend fun search(searchRequest: SearchRequest): Flow<List<UniversalSearchResult>> {
        // Record search in history
        searchHistoryManager.recordSearch(searchRequest)
        
        val results = mutableListOf<UniversalSearchResult>()
        
        // Search across each requested media type
        searchRequest.mediaTypes.forEach { mediaType ->
            val engine = searchEngines[mediaType]
            if (engine != null) {
                try {
                    val engineResults = engine.search(searchRequest)
                    results.addAll(engineResults)
                } catch (e: Exception) {
                    // Log error but continue with other engines
                    println("Search failed for $mediaType: ${e.message}")
                }
            }
        }
        
        // Sort and rank results
        val sortedResults = results.sortedWith(compareByDescending<UniversalSearchResult> { it.score }
            .thenBy { it.title.lowercase() })
        
        // Apply limit
        val limitedResults = sortedResults.take(searchRequest.limit)
        
        _searchResults.value = limitedResults
        return MutableStateFlow(limitedResults).asStateFlow()
    }

    /**
     * Get search engine for specific media type
     */
    fun getSearchEngine(mediaType: String): MediaSearchEngine? {
        return searchEngines[mediaType]
    }

    /**
     * Get search history
     */
    fun getSearchHistory(): Flow<List<SearchHistoryEntry>> {
        return searchHistoryManager.getSearchHistory()
    }

    /**
     * Clear search history
     */
    suspend fun clearSearchHistory() {
        searchHistoryManager.clearHistory()
    }

    /**
     * Get search suggestions based on query
     */
    suspend fun getSearchSuggestions(query: String): List<String> {
        if (query.length < 2) return emptyList()
        
        val history = searchHistoryManager.getSearchHistory().first()
        return history
            .map { it.query }
            .filter { it.contains(query, ignoreCase = true) }
            .distinct()
            .take(5)
    }

    /**
     * Get popular searches
     */
    suspend fun getPopularSearches(): List<String> {
        return searchHistoryManager.getPopularSearches()
    }
}

/**
 * Search request data class
 */
data class SearchRequest(
    val query: String,
    val mediaTypes: Set<String>,
    val tags: Set<String> = emptySet(),
    val limit: Int = 20,
    val sortBy: SortOption = SortOption.RELEVANCE,
    val filters: Map<String, Any> = emptyMap()
)

/**
 * Search result data class
 */
data class UniversalSearchResult(
    val id: String,
    val title: String,
    val subtitle: String? = null,
    val description: String? = null,
    val mediaType: String,
    val thumbnailUrl: String? = null,
    val score: Double = 0.0,
    val metadata: Map<String, String> = emptyMap(),
    val tags: List<String> = emptyList()
)

/**
 * Search history entry
 */
data class SearchHistoryEntry(
    val query: String,
    val timestamp: Long,
    val resultCount: Int,
    val mediaTypes: Set<String>
)

/**
 * Sort options
 */
enum class SortOption {
    RELEVANCE,
    TITLE_ASC,
    TITLE_DESC,
    DATE_ADDED_ASC,
    DATE_ADDED_DESC,
    RATING_ASC,
    RATING_DESC
}