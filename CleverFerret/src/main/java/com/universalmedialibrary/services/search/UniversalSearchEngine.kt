package com.universalmedialibrary.services.search

import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.repository.TagRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

// Use the existing SearchFilters and SortBy from EnhancedSearchService

/**
 * Universal search engine that provides cross-media search capabilities
 *
 * Features:
 * - Full-text search across all media types
 * - Tag-based filtering with hierarchy support
 * - Smart search suggestions
 * - Faceted search results
 * - Search history and saved searches
 * - Relevance scoring
 */
@Singleton
class UniversalSearchEngine @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val tagRepository: TagRepository,
    private val tagHierarchyDao: TagHierarchyDao,
    private val searchHistoryDao: SearchHistoryDao
) {

    private val json = Json { ignoreUnknownKeys = true }

    // ==================== SEARCH ====================

    /**
     * Perform a universal search across all media types
     */
    suspend fun search(query: UniversalSearchQuery): EngineSearchResults = withContext(Dispatchers.IO) {
        val startTime = System.currentTimeMillis()

        // Build search components
        val textQuery = query.textQuery.trim().lowercase()
        val effectiveTags = expandTagsWithHierarchy(query.tagIds)

        // Search media items
        val mediaResults = searchMediaItems(
            textQuery = textQuery,
            mediaTypes = query.mediaTypes,
            tagIds = effectiveTags,
            filters = query.filters,
            sortBy = query.sortBy,
            sortDescending = query.sortDescending,
            limit = query.limit,
            offset = query.offset
        )

        // Calculate facets
        val facets = calculateFacets(textQuery, query.mediaTypes, effectiveTags)

        // Get tag suggestions based on search results
        val tagSuggestions = getTagSuggestionsForResults(mediaResults)

        // Save to search history
        if (query.saveToHistory && textQuery.isNotEmpty()) {
            saveSearchToHistory(query, mediaResults.size)
        }

        val searchTime = System.currentTimeMillis() - startTime

        EngineSearchResults(
            query = query.textQuery,
            results = mediaResults,
            totalCount = mediaResults.size,
            facets = facets,
            suggestedTags = tagSuggestions,
            searchTimeMs = searchTime,
            hasMore = mediaResults.size >= query.limit
        )
    }

    /**
     * Expand tag IDs to include child tags from hierarchy
     */
    private suspend fun expandTagsWithHierarchy(tagIds: List<Long>): List<Long> {
        if (tagIds.isEmpty()) return emptyList()

        val expandedIds = tagIds.toMutableSet()
        for (tagId in tagIds) {
            val descendants = tagHierarchyDao.getDescendantTags(tagId)
            expandedIds.addAll(descendants.map { it.tagId })
        }
        return expandedIds.toList()
    }

    /**
     * Search media items with filters
     */
    private suspend fun searchMediaItems(
        textQuery: String,
        mediaTypes: List<String>,
        tagIds: List<Long>,
        filters: UniversalSearchFilters,
        sortBy: UniversalSortBy,
        sortDescending: Boolean,
        limit: Int,
        offset: Int
    ): List<EngineSearchResult> {
        // Get items matching the query
        val items = mediaItemDao.searchMediaItems(
            query = if (textQuery.isNotEmpty()) "%$textQuery%" else "%",
            mediaTypes = mediaTypes.ifEmpty { null },
            minRating = filters.minRating,
            maxRating = null,
            isFavorite = null,
            limit = limit + offset // Get extra for offset
        )

        // Filter by tags if specified
        val tagFilteredItems = if (tagIds.isNotEmpty()) {
            items.filter { item ->
                val itemTagIds = tagRepository.getTagsForItem(item.itemId)
                    .first()
                    .map { it.tagId }
                tagIds.any { it in itemTagIds }
            }
        } else {
            items
        }

        // Convert to search results with relevance scoring
        val results = tagFilteredItems.mapNotNull { item ->
            val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)
            val relevanceScore = calculateRelevance(item, metadata, textQuery, tagIds)

            if (relevanceScore <= 0) return@mapNotNull null

            EngineSearchResult(
                itemId = item.itemId,
                title = metadata?.title ?: item.fileName.substringBeforeLast('.'),
                subtitle = "", // Creator would come from People table
                mediaType = item.mediaType,
                thumbnailUrl = metadata?.coverImagePath ?: item.thumbnailPath,
                relevanceScore = relevanceScore,
                matchHighlights = findMatchHighlights(item, metadata, textQuery),
                metadata = EngineSearchResultMetadata(
                    creator = null, // Would fetch from People table with AUTHOR role
                    year = metadata?.year,
                    rating = metadata?.rating ?: metadata?.userRating,
                    genres = emptyList(), // Would fetch from genre table
                    duration = null, // Would fetch for audio/video
                    pageCount = null, // Would fetch for books
                    fileSize = item.fileSize,
                    lastAccessed = if (item.lastPlayed > 0) item.lastPlayed else null,
                    isFavorite = item.isFavorite,
                    playCount = item.playCount
                )
            )
        }

        // Sort results
        val sortedResults = when (sortBy) {
            UniversalSortBy.RELEVANCE -> results.sortedByDescending { it.relevanceScore }
            UniversalSortBy.TITLE -> if (sortDescending) results.sortedByDescending { it.title.lowercase() }
            else results.sortedBy { it.title.lowercase() }
            UniversalSortBy.DATE_ADDED -> if (sortDescending) results.sortedByDescending { it.metadata.lastAccessed }
            else results.sortedBy { it.metadata.lastAccessed }
            UniversalSortBy.RATING -> if (sortDescending) results.sortedByDescending { it.metadata.rating ?: 0f }
            else results.sortedBy { it.metadata.rating ?: 0f }
        }

        // Apply offset and limit
        return sortedResults.drop(offset).take(limit)
    }

    /**
     * Calculate relevance score for a search result
     */
    private fun calculateRelevance(
        item: MediaItem,
        metadata: MetadataCommon?,
        textQuery: String,
        tagIds: List<Long>
    ): Float {
        if (textQuery.isEmpty() && tagIds.isEmpty()) return 0.5f

        var score = 0f
        val query = textQuery.lowercase()

        if (query.isNotEmpty()) {
            // Title match (highest weight)
            val title = (metadata?.title ?: item.fileName).lowercase()
            when {
                title == query -> score += 100f
                title.startsWith(query) -> score += 80f
                title.contains(query) -> score += 50f
            }

            // Summary/description match
            metadata?.summary?.lowercase()?.let { summary ->
                if (summary.contains(query)) score += 20f
            }

            // File name match (lower weight)
            if (item.fileName.lowercase().contains(query)) {
                score += 10f
            }
        }

        // Tag match bonus
        if (tagIds.isNotEmpty()) {
            score += 30f
        }

        // Boost for favorites
        if (item.isFavorite) {
            score += 5f
        }

        // Boost for recently accessed
        val oneWeekAgo = System.currentTimeMillis() - (7 * 24 * 60 * 60 * 1000L)
        if (item.lastPlayed > oneWeekAgo) {
            score += 3f
        }

        // Normalize to 0-100 range
        return minOf(score, 100f)
    }

    /**
     * Find text match highlights for search result
     */
    private fun findMatchHighlights(
        item: MediaItem,
        metadata: MetadataCommon?,
        textQuery: String
    ): List<MatchHighlight> {
        if (textQuery.isEmpty()) return emptyList()

        val highlights = mutableListOf<MatchHighlight>()
        val query = textQuery.lowercase()

        // Check title
        val title = metadata?.title ?: item.fileName.substringBeforeLast('.')
        findHighlightsInText(title, query, "title")?.let { highlights.add(it) }

        // Note: Creator would come from People table with AUTHOR role
        // Skipped for now since it requires a separate query

        // Check summary (show first match with context)
        metadata?.summary?.let { summary ->
            findHighlightsInText(summary, query, "summary")?.let { highlights.add(it) }
        }

        return highlights
    }

    /**
     * Find highlight positions in text
     */
    private fun findHighlightsInText(text: String, query: String, field: String): MatchHighlight? {
        val lowerText = text.lowercase()
        val startIndex = lowerText.indexOf(query)
        if (startIndex < 0) return null

        // Get context around match
        val contextStart = maxOf(0, startIndex - 30)
        val contextEnd = minOf(text.length, startIndex + query.length + 30)
        val context = text.substring(contextStart, contextEnd)

        return MatchHighlight(
            field = field,
            text = context,
            matchStart = startIndex - contextStart,
            matchEnd = startIndex - contextStart + query.length
        )
    }

    /**
     * Calculate facets for search results
     */
    private suspend fun calculateFacets(
        textQuery: String,
        mediaTypes: List<String>,
        tagIds: List<Long>
    ): UniversalSearchFacets {
        // In a real implementation, these would be calculated from search results
        return UniversalSearchFacets(
            mediaTypes = mapOf(
                "BOOK" to 0,
                "AUDIOBOOK" to 0,
                "MUSIC_TRACK" to 0,
                "MOVIE" to 0,
                "TV_SHOW" to 0,
                "PODCAST_EPISODE" to 0,
                "COMIC" to 0,
                "DOCUMENT" to 0
            ),
            years = emptyMap(),
            creators = emptyMap(),
            genres = emptyMap(),
            tags = emptyMap(),
            ratings = mapOf(
                "5" to 0,
                "4" to 0,
                "3" to 0,
                "2" to 0,
                "1" to 0
            )
        )
    }

    /**
     * Get tag suggestions based on search results
     */
    private suspend fun getTagSuggestionsForResults(results: List<EngineSearchResult>): List<UnifiedTag> {
        if (results.isEmpty()) return emptyList()

        // Get tags from first few results and find common ones
        val itemIds = results.take(10).map { it.itemId }
        val tagCounts = mutableMapOf<Long, Int>()

        for (itemId in itemIds) {
            val tags = tagRepository.getTagsForItem(itemId).first()
            for (tag in tags) {
                tagCounts[tag.tagId] = (tagCounts[tag.tagId] ?: 0) + 1
            }
        }

        // Return tags that appear in multiple results
        val commonTagIds = tagCounts.entries
            .filter { it.value >= 2 }
            .sortedByDescending { it.value }
            .take(5)
            .map { it.key }

        return commonTagIds.mapNotNull { tagRepository.getTagById(it) }
    }

    // ==================== SEARCH SUGGESTIONS ====================

    /**
     * Get search suggestions for autocomplete
     */
    suspend fun getSuggestions(
        partialQuery: String,
        mediaTypes: List<String> = emptyList(),
        limit: Int = 10
    ): List<SearchSuggestion> = withContext(Dispatchers.IO) {
        val suggestions = mutableListOf<SearchSuggestion>()
        val query = partialQuery.lowercase()

        // 1. Recent searches
        val recentSearches = searchHistoryDao.searchHistory(query, limit = 5)
        suggestions.addAll(recentSearches.map { history ->
            SearchSuggestion(
                text = history.query,
                type = SuggestionType.RECENT_SEARCH,
                metadata = "Searched recently"
            )
        })

        // 2. Tag matches
        val matchingTags = tagRepository.getTagSuggestions(query, limit = 3).first()
        suggestions.addAll(matchingTags.map { tag ->
            SearchSuggestion(
                text = tag.name,
                type = SuggestionType.TAG,
                tagId = tag.tagId,
                metadata = "Tag (${tag.usageCount} items)"
            )
        })

        // 3. Title matches (would query media items)
        // Limited implementation for now

        // 4. Creator/author matches
        // Limited implementation for now

        return@withContext suggestions
            .distinctBy { it.text.lowercase() }
            .take(limit)
    }

    // ==================== SEARCH HISTORY ====================

    /**
     * Save search to history
     */
    private suspend fun saveSearchToHistory(query: UniversalSearchQuery, resultCount: Int) {
        searchHistoryDao.insertSearch(
            SearchHistory(
                query = query.textQuery,
                resultCount = resultCount,
                mediaTypes = if (query.mediaTypes.isNotEmpty()) json.encodeToString(query.mediaTypes) else null,
                sortBy = query.sortBy.name,
                filterCriteria = json.encodeToString(query.filters)
            )
        )
    }

    /**
     * Get recent search history
     */
    suspend fun getSearchHistory(limit: Int = 20): List<SearchHistory> =
        searchHistoryDao.getRecentSearches(limit)

    /**
     * Get popular searches
     */
    suspend fun getPopularSearches(limit: Int = 10): List<SearchHistory> =
        searchHistoryDao.getPopularSearches(limit)

    /**
     * Clear search history
     */
    suspend fun clearSearchHistory() {
        searchHistoryDao.clearHistory()
    }

    /**
     * Delete specific history entry
     */
    suspend fun deleteHistoryEntry(historyId: Long) {
        searchHistoryDao.deleteSearch(historyId)
    }

    // ==================== SAVED SEARCHES ====================

    /**
     * Save a search for quick access
     */
    suspend fun saveSearch(name: String, query: UniversalSearchQuery): Long {
        return searchHistoryDao.insertSavedSearch(
            SavedSearchEntity(
                name = name,
                query = query.textQuery,
                mediaTypes = if (query.mediaTypes.isNotEmpty()) json.encodeToString(query.mediaTypes) else null,
                sortBy = query.sortBy.name,
                filterCriteria = json.encodeToString(query.filters)
            )
        )
    }

    /**
     * Get all saved searches
     */
    suspend fun getSavedSearches(): List<SavedSearchEntity> =
        searchHistoryDao.getAllSavedSearches()

    /**
     * Delete a saved search
     */
    suspend fun deleteSavedSearch(searchId: Long) {
        searchHistoryDao.deleteSavedSearch(searchId)
    }

    /**
     * Execute a saved search
     */
    suspend fun executeSavedSearch(savedSearch: SavedSearchEntity): EngineSearchResults {
        val mediaTypes = savedSearch.mediaTypes?.let {
            json.decodeFromString<List<String>>(it)
        } ?: emptyList()

        val filters = savedSearch.filterCriteria?.let {
            try {
                json.decodeFromString<UniversalSearchFilters>(it)
            } catch (e: Exception) {
                UniversalSearchFilters()
            }
        } ?: UniversalSearchFilters()

        val sortBy = savedSearch.sortBy?.let {
            try { UniversalSortBy.valueOf(it) } catch (e: Exception) { UniversalSortBy.RELEVANCE }
        } ?: UniversalSortBy.RELEVANCE

        // Update last used timestamp
        searchHistoryDao.updateLastUsed(savedSearch.savedSearchId)

        return search(
            UniversalSearchQuery(
                textQuery = savedSearch.query,
                mediaTypes = mediaTypes,
                filters = filters,
                sortBy = sortBy
            )
        )
    }
}

// ==================== DATA CLASSES ====================

/**
 * Universal search query parameters
 */
@Serializable
data class UniversalSearchQuery(
    val textQuery: String = "",
    val mediaTypes: List<String> = emptyList(),
    val tagIds: List<Long> = emptyList(),
    val filters: UniversalSearchFilters = UniversalSearchFilters(),
    val sortBy: UniversalSortBy = UniversalSortBy.RELEVANCE,
    val sortDescending: Boolean = true,
    val limit: Int = 50,
    val offset: Int = 0,
    val saveToHistory: Boolean = true
)

/**
 * Search filters for universal search
 * Note: mediaTypes is in UniversalSearchQuery, not here, to avoid duplication
 */
@Serializable
data class UniversalSearchFilters(
    val genres: List<String> = emptyList(),
    val tags: List<String> = emptyList(),
    val minRating: Float? = null,
    val dateFrom: Long? = null,
    val dateTo: Long? = null,
    val minFileSize: Long? = null,
    val maxFileSize: Long? = null
) {
    fun hasActiveFilters(): Boolean {
        return genres.isNotEmpty() ||
            tags.isNotEmpty() ||
            minRating != null ||
            dateFrom != null ||
            dateTo != null ||
            minFileSize != null ||
            maxFileSize != null
    }
}

/**
 * Sort options for universal search
 */
enum class UniversalSortBy {
    RELEVANCE,
    TITLE,
    DATE_ADDED,
    RATING
}

/**
 * Universal search results
 */
data class EngineSearchResults(
    val query: String,
    val results: List<EngineSearchResult>,
    val totalCount: Int,
    val facets: UniversalSearchFacets,
    val suggestedTags: List<UnifiedTag>,
    val searchTimeMs: Long,
    val hasMore: Boolean
)

/**
 * Individual search result from UniversalSearchEngine
 */
data class EngineSearchResult(
    val itemId: Long,
    val title: String,
    val subtitle: String,
    val mediaType: String,
    val thumbnailUrl: String?,
    val relevanceScore: Float,
    val matchHighlights: List<MatchHighlight>,
    val metadata: EngineSearchResultMetadata
)

/**
 * Search result metadata
 */
data class EngineSearchResultMetadata(
    val creator: String?,
    val year: Int?,
    val rating: Float?,
    val genres: List<String>,
    val duration: Long?,
    val pageCount: Int?,
    val fileSize: Long,
    val lastAccessed: Long?,
    val isFavorite: Boolean,
    val playCount: Int
)

/**
 * Match highlight information
 */
data class MatchHighlight(
    val field: String,
    val text: String,
    val matchStart: Int,
    val matchEnd: Int
)

/**
 * Search facets for filtering
 */
data class UniversalSearchFacets(
    val mediaTypes: Map<String, Int>,
    val years: Map<String, Int>,
    val creators: Map<String, Int>,
    val genres: Map<String, Int>,
    val tags: Map<String, Int>,
    val ratings: Map<String, Int>
)

/**
 * Search suggestion
 */
data class SearchSuggestion(
    val text: String,
    val type: SuggestionType,
    val itemId: Long? = null,
    val tagId: Long? = null,
    val metadata: String? = null
)

/**
 * Suggestion types
 */
enum class SuggestionType {
    RECENT_SEARCH,
    TITLE,
    CREATOR,
    TAG,
    GENRE,
    SERIES
}
