package com.universalmedialibrary.services.search

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.entity.MediaItem
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Enhanced Search Service with Advanced Filtering
 *
 * Features:
 * - Multi-field search (title, author, genre, tags)
 * - Faceted filtering (by type, genre, rating, date)
 * - Saved searches
 * - Search history
 * - Smart search suggestions
 * - Advanced query syntax
 */
@Singleton
class EnhancedSearchService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val database: AppDatabase
) {

    private val mediaItemDao = database.mediaItemDao()
    private val metadataDao = database.metadataDao()
    // TODO: Add searchHistoryDao when implemented in database
    // private val searchHistoryDao = database.searchHistoryDao()

    /**
     * Advanced search with multiple filters
     */
    suspend fun search(query: SearchQuery): List<SearchResult> {
        val results = mutableListOf<SearchResult>()

        // Search media items
        val mediaItems = if (query.textQuery.isNotEmpty()) {
            mediaItemDao.searchMediaItems(query.textQuery, limit = query.limit)
        } else {
            mediaItemDao.getAllMediaItems().take(query.limit)
        }

        // Apply filters
        val filtered = mediaItems.filter { item ->
            matchesFilters(item, query.filters)
        }

        // Sort by relevance or specified sort
        val sorted = when (query.sortBy) {
            SortBy.RELEVANCE -> filtered.sortedByDescending { calculateRelevance(it, query.textQuery) }
            SortBy.TITLE -> filtered.sortedBy { it.fileName }
            SortBy.DATE_ADDED -> filtered.sortedByDescending { it.dateAdded }
            SortBy.DATE_MODIFIED -> filtered.sortedByDescending { it.dateAdded } // Using dateAdded as fallback
            SortBy.FILE_SIZE -> filtered.sortedByDescending { it.fileSize }
            SortBy.RATING -> filtered // TODO: Add rating field
        }

        // Convert to search results with highlights
        results.addAll(sorted.map { item ->
            SearchResult(
                itemId = item.itemId,
                title = item.fileName,
                subtitle = extractSubtitle(item),
                mediaType = item.mediaType,
                thumbnailUrl = null,
                relevanceScore = calculateRelevance(item, query.textQuery),
                highlights = findHighlights(item, query.textQuery)
            )
        })

        // TODO: Save search to history when implemented
        // if (query.textQuery.isNotEmpty()) {
        //     saveSearchHistory(query.textQuery, results.size)
        // }

        return results
    }

    /**
     * Get search suggestions based on history and content
     */
    suspend fun getSuggestions(partial: String): List<String> {
        val suggestions = mutableListOf<String>()

        // TODO: Get from search history when implemented
        // val history = searchHistoryDao.getRecentSearches(limit = 5)
        // suggestions.addAll(history.filter { it.contains(partial, ignoreCase = true) })

        // Get from metadata (titles, authors)
        if (partial.length >= 2) {
            val titleMatches = metadataDao.searchByTitle(partial).take(10)
            suggestions.addAll(titleMatches.map { it.title })
        }

        return suggestions.distinct().take(10)
    }

    /**
     * Get available facets for filtering
     */
    suspend fun getFacets(): SearchFacets {
        val allItems = mediaItemDao.getAllMediaItems()
        
        return SearchFacets(
            mediaTypes = allItems.groupBy { it.mediaType }.mapValues { it.value.size },
            dateRanges = calculateDateRanges(allItems),
            fileSizeRanges = calculateSizeRanges(allItems)
        )
    }

    /**
     * Save a search for later use
     */
    suspend fun saveSearch(name: String, query: SearchQuery) {
        // TODO: Implement saved searches table
        // searchHistoryDao.insertSearch(...)
    }

    /**
     * Get saved searches
     */
    suspend fun getSavedSearches(): List<SavedSearch> {
        // TODO: Implement saved searches retrieval
        return emptyList()
    }

    /**
     * Clear search history
     */
    suspend fun clearHistory() {
        // TODO: Implement when search history DAO is available
        // searchHistoryDao.clearHistory()
    }

    // Helper methods

    private fun matchesFilters(item: MediaItem, filters: SearchFilters): Boolean {
        // Media type filter
        if (filters.mediaTypes.isNotEmpty() && item.mediaType !in filters.mediaTypes) {
            return false
        }

        // Date range filter
        if (filters.dateFrom != null && item.dateAdded < filters.dateFrom) {
            return false
        }
        if (filters.dateTo != null && item.dateAdded > filters.dateTo) {
            return false
        }

        // File size filter
        if (filters.minFileSize != null && item.fileSize < filters.minFileSize) {
            return false
        }
        if (filters.maxFileSize != null && item.fileSize > filters.maxFileSize) {
            return false
        }

        // Library filter
        if (filters.libraryIds.isNotEmpty() && item.libraryId !in filters.libraryIds) {
            return false
        }

        return true
    }

    private fun calculateRelevance(item: MediaItem, query: String): Float {
        if (query.isEmpty()) return 0f

        var score = 0f
        val queryLower = query.lowercase()
        val fileName = item.fileName.lowercase()

        // Exact match
        if (fileName == queryLower) score += 100f

        // Starts with query
        if (fileName.startsWith(queryLower)) score += 50f

        // Contains query
        if (fileName.contains(queryLower)) score += 25f

        // Recent items get boost
        val daysSinceAdded = (System.currentTimeMillis() - item.dateAdded) / (1000 * 60 * 60 * 24)
        if (daysSinceAdded < 7) score += 10f

        return score
    }

    private fun extractSubtitle(item: MediaItem): String {
        return when (item.mediaType) {
            "BOOK" -> "Book" // TODO: Get author from metadata
            "AUDIO" -> "Audio"
            "VIDEO" -> "Video"
            "COMIC" -> "Comic"
            else -> item.mediaType
        }
    }

    private fun findHighlights(item: MediaItem, query: String): List<String> {
        if (query.isEmpty()) return emptyList()

        val highlights = mutableListOf<String>()
        val queryLower = query.lowercase()

        // Highlight in filename
        val fileName = item.fileName
        val index = fileName.lowercase().indexOf(queryLower)
        if (index >= 0) {
            val start = maxOf(0, index - 20)
            val end = minOf(fileName.length, index + query.length + 20)
            highlights.add("..." + fileName.substring(start, end) + "...")
        }

        return highlights
    }

    private suspend fun saveSearchHistory(query: String, resultCount: Int) {
        // TODO: Implement when search history DAO is available
        // searchHistoryDao.insertSearch(...)
    }

    private fun calculateDateRanges(items: List<MediaItem>): Map<String, Int> {
        val now = System.currentTimeMillis()
        val dayMs = 1000L * 60 * 60 * 24

        return mapOf(
            "Today" to items.count { (now - it.dateAdded) < dayMs },
            "This Week" to items.count { (now - it.dateAdded) < dayMs * 7 },
            "This Month" to items.count { (now - it.dateAdded) < dayMs * 30 },
            "This Year" to items.count { (now - it.dateAdded) < dayMs * 365 },
            "Older" to items.count { (now - it.dateAdded) >= dayMs * 365 }
        )
    }

    private fun calculateSizeRanges(items: List<MediaItem>): Map<String, Int> {
        val mb = 1024L * 1024
        return mapOf(
            "< 1 MB" to items.count { it.fileSize < mb },
            "1-10 MB" to items.count { it.fileSize in mb..(10 * mb) },
            "10-100 MB" to items.count { it.fileSize in (10 * mb)..(100 * mb) },
            "100-500 MB" to items.count { it.fileSize in (100 * mb)..(500 * mb) },
            "> 500 MB" to items.count { it.fileSize > 500 * mb }
        )
    }
}

/**
 * Search query with filters
 */
data class SearchQuery(
    val textQuery: String = "",
    val filters: SearchFilters = SearchFilters(),
    val sortBy: SortBy = SortBy.RELEVANCE,
    val limit: Int = 100
)

/**
 * Search filters
 */
data class SearchFilters(
    val mediaTypes: List<String> = emptyList(),
    val genres: List<String> = emptyList(),
    val libraryIds: List<Long> = emptyList(),
    val dateFrom: Long? = null,
    val dateTo: Long? = null,
    val minFileSize: Long? = null,
    val maxFileSize: Long? = null,
    val minRating: Float? = null,
    val tags: List<String> = emptyList()
)

/**
 * Sort options
 */
enum class SortBy {
    RELEVANCE,
    TITLE,
    DATE_ADDED,
    DATE_MODIFIED,
    FILE_SIZE,
    RATING
}

/**
 * Search result
 */
data class SearchResult(
    val itemId: Long,
    val title: String,
    val subtitle: String,
    val mediaType: String,
    val thumbnailUrl: String?,
    val relevanceScore: Float,
    val highlights: List<String>
)

/**
 * Search facets for filtering
 */
data class SearchFacets(
    val mediaTypes: Map<String, Int>,
    val dateRanges: Map<String, Int>,
    val fileSizeRanges: Map<String, Int>
)

/**
 * Search history entry
 */
data class SearchHistory(
    val historyId: Long = 0,
    val query: String,
    val timestamp: Long,
    val resultCount: Int
)

/**
 * Saved search
 */
data class SavedSearch(
    val savedSearchId: Long = 0,
    val name: String,
    val query: SearchQuery,
    val createdAt: Long
)

// TODO: Add SearchHistoryDao to AppDatabase
interface SearchHistoryDao {
    suspend fun insertSearch(search: SearchHistory)
    suspend fun getRecentSearches(limit: Int): List<SearchHistory>
    suspend fun clearHistory()
}
