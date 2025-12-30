package com.universalmedialibrary.services.search

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manages search history and analytics
 */
@Singleton
class SearchHistoryManager @Inject constructor() {
    
    private val _searchHistory = MutableStateFlow<List<SearchHistoryEntry>>(emptyList())
    private val searchHistory = _searchHistory.asStateFlow()

    /**
     * Record a search in history
     */
    suspend fun recordSearch(searchRequest: SearchRequest) {
        val entry = SearchHistoryEntry(
            query = searchRequest.query,
            timestamp = System.currentTimeMillis(),
            resultCount = 0, // Would be populated by actual search results
            mediaTypes = searchRequest.mediaTypes
        )
        
        val currentHistory = _searchHistory.value.toMutableList()
        currentHistory.add(0, entry) // Add to beginning
        
        // Keep only last 100 searches
        if (currentHistory.size > 100) {
            currentHistory.removeAt(currentHistory.size - 1)
        }
        
        _searchHistory.value = currentHistory
    }

    /**
     * Get search history
     */
    fun getSearchHistory(): Flow<List<SearchHistoryEntry>> {
        return searchHistory
    }

    /**
     * Clear search history
     */
    suspend fun clearHistory() {
        _searchHistory.value = emptyList()
    }

    /**
     * Get popular searches
     */
    suspend fun getPopularSearches(limit: Int = 10): List<String> {
        return _searchHistory.value
            .groupBy { it.query }
            .map { (query, entries) -> query to entries.size }
            .sortedByDescending { it.second }
            .take(limit)
            .map { it.first }
    }

    /**
     * Get recent searches
     */
    suspend fun getRecentSearches(limit: Int = 10): List<String> {
        return _searchHistory.value
            .take(limit)
            .map { it.query }
    }
}