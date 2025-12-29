package com.universalmedialibrary.services.collections

import com.universalmedialibrary.data.local.dao.SmartCollectionDao
import com.universalmedialibrary.data.local.dao.AuthorItemCount
import com.universalmedialibrary.data.local.dao.GenreItemCount
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.repository.UnifiedCollectionRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Engine for managing smart collections and auto-suggestions
 *
 * Handles:
 * - Smart collection rule evaluation
 * - Auto-detection of potential collections (series, authors, genres)
 * - Collection suggestions based on user behavior
 * - Cache management for performance
 */
@Singleton
class SmartCollectionEngine @Inject constructor(
    private val smartCollectionDao: SmartCollectionDao,
    private val collectionRepository: UnifiedCollectionRepository
) {

    private val json = Json { 
        ignoreUnknownKeys = true 
        encodeDefaults = true
    }

    // ==================== COLLECTION SUGGESTIONS ====================

    /**
     * Generate collection suggestions based on library analysis
     */
    suspend fun generateSuggestions(limit: Int = 10): List<SuggestedCollection> = withContext(Dispatchers.IO) {
        val suggestions = mutableListOf<SuggestedCollection>()

        // 1. Detect book series
        val seriesSuggestions = detectBookSeriesSuggestions()
        suggestions.addAll(seriesSuggestions)

        // 2. Author collections
        val authorSuggestions = detectAuthorCollectionSuggestions()
        suggestions.addAll(authorSuggestions)

        // 3. Genre collections
        val genreSuggestions = detectGenreCollectionSuggestions()
        suggestions.addAll(genreSuggestions)

        // 4. Recently added collection
        val recentSuggestion = createRecentlyAddedSuggestion()
        if (recentSuggestion != null) {
            suggestions.add(recentSuggestion)
        }

        // 5. Favorites collection
        val favoritesSuggestion = createFavoritesSuggestion()
        if (favoritesSuggestion != null) {
            suggestions.add(favoritesSuggestion)
        }

        // 6. In-progress collection
        val inProgressSuggestion = createInProgressSuggestion()
        if (inProgressSuggestion != null) {
            suggestions.add(inProgressSuggestion)
        }

        // Filter out dismissed suggestions
        val filteredSuggestions = suggestions.filterNot { suggestion ->
            smartCollectionDao.isSuggestionDismissed(suggestion.suggestionId)
        }

        // Sort by confidence and return top N
        filteredSuggestions
            .sortedByDescending { it.confidence }
            .take(limit)
    }

    /**
     * Detect potential book series based on title patterns
     */
    private suspend fun detectBookSeriesSuggestions(): List<SuggestedCollection> {
        val potentialSeriesBooks = smartCollectionDao.detectPotentialSeriesBooks()
        if (potentialSeriesBooks.isEmpty()) return emptyList()

        // Group books by potential series name
        val seriesGroups = groupBySeriesName(potentialSeriesBooks)

        return seriesGroups.mapNotNull { (seriesName, items) ->
            if (items.size < 2) return@mapNotNull null

            val queryRules = CollectionQuery(
                rules = listOf(
                    CollectionQueryRule(
                        field = "title",
                        operator = QueryOperator.CONTAINS,
                        value = seriesName
                    )
                )
            )

            SuggestedCollection(
                suggestionId = "series:${seriesName.lowercase().replace(" ", "-")}",
                suggestedName = "$seriesName Series",
                collectionType = SmartCollectionType.BOOK_SERIES,
                reason = "Found ${items.size} books that appear to be part of the \"$seriesName\" series",
                confidence = calculateSeriesConfidence(items),
                previewItemIds = items.take(5).map { it.itemId },
                estimatedItemCount = items.size,
                queryRules = json.encodeToString(queryRules),
                mediaTypes = listOf("BOOK"),
                previewCoverUrl = null // Would be populated from first book
            )
        }
    }

    /**
     * Group books by extracted series name
     */
    private fun groupBySeriesName(books: List<MediaItem>): Map<String, List<MediaItem>> {
        val seriesPatterns = listOf(
            Regex("""^(.+?)[\s:–-]+Book\s*\d""", RegexOption.IGNORE_CASE),
            Regex("""^(.+?)[\s:–-]+Vol(?:ume)?\.?\s*\d""", RegexOption.IGNORE_CASE),
            Regex("""^(.+?)[\s:–-]+#\d"""),
            Regex("""^(.+?)[\s:–-]+Part\s*\d""", RegexOption.IGNORE_CASE),
            Regex("""^(.+?)\s+\(\d+\)$"""),
            Regex("""^(.+?)\s+\d+$""")
        )

        return books.groupBy { book ->
            val title = book.fileName.substringBeforeLast('.')
            for (pattern in seriesPatterns) {
                val match = pattern.find(title)
                if (match != null) {
                    return@groupBy match.groupValues[1].trim()
                }
            }
            // No pattern matched, use first 3 words as potential series name
            title.split(" ").take(3).joinToString(" ")
        }.filter { it.value.size >= 2 }
    }

    /**
     * Calculate confidence score for series detection
     */
    private fun calculateSeriesConfidence(items: List<MediaItem>): Float {
        val baseConfidence = 0.5f

        // More items = higher confidence
        val itemBonus = minOf(items.size * 0.1f, 0.3f)

        // Check for numbered patterns
        val numberedCount = items.count { item ->
            val title = item.fileName
            title.contains(Regex("""\d+"""))
        }
        val numberBonus = if (numberedCount == items.size) 0.2f else 0f

        return minOf(baseConfidence + itemBonus + numberBonus, 1.0f)
    }

    /**
     * Detect author-based collection suggestions
     */
    private suspend fun detectAuthorCollectionSuggestions(): List<SuggestedCollection> {
        val authorCounts = smartCollectionDao.getAuthorItemCounts(minItems = 3)

        return authorCounts.take(5).map { authorCount ->
            val queryRules = CollectionQuery(
                rules = listOf(
                    CollectionQueryRule(
                        field = "creator",
                        operator = QueryOperator.EQUALS,
                        value = authorCount.creator
                    )
                )
            )

            SuggestedCollection(
                suggestionId = "author:${authorCount.creator.lowercase().replace(" ", "-")}",
                suggestedName = "Works by ${authorCount.creator}",
                collectionType = SmartCollectionType.AUTHOR_COLLECTION,
                reason = "You have ${authorCount.itemCount} items by ${authorCount.creator}",
                confidence = calculateAuthorConfidence(authorCount),
                previewItemIds = emptyList(), // Would be populated
                estimatedItemCount = authorCount.itemCount,
                queryRules = json.encodeToString(queryRules),
                mediaTypes = listOf("BOOK", "AUDIOBOOK"),
                previewCoverUrl = null
            )
        }
    }

    private fun calculateAuthorConfidence(authorCount: AuthorItemCount): Float {
        return when {
            authorCount.itemCount >= 10 -> 0.95f
            authorCount.itemCount >= 5 -> 0.85f
            authorCount.itemCount >= 3 -> 0.7f
            else -> 0.5f
        }
    }

    /**
     * Detect genre-based collection suggestions
     */
    private suspend fun detectGenreCollectionSuggestions(): List<SuggestedCollection> {
        val genreCounts = smartCollectionDao.getGenreItemCounts(minItems = 5)

        return genreCounts.take(5).map { genreCount ->
            val queryRules = CollectionQuery(
                rules = listOf(
                    CollectionQueryRule(
                        field = "genre",
                        operator = QueryOperator.EQUALS,
                        value = genreCount.genreName
                    )
                )
            )

            SuggestedCollection(
                suggestionId = "genre:${genreCount.genreName.lowercase().replace(" ", "-")}",
                suggestedName = genreCount.genreName,
                collectionType = SmartCollectionType.GENRE_COLLECTION,
                reason = "You have ${genreCount.itemCount} ${genreCount.genreName} items",
                confidence = calculateGenreConfidence(genreCount),
                previewItemIds = emptyList(),
                estimatedItemCount = genreCount.itemCount,
                queryRules = json.encodeToString(queryRules),
                mediaTypes = listOf("BOOK", "MOVIE", "MUSIC_TRACK"),
                previewCoverUrl = null
            )
        }
    }

    private fun calculateGenreConfidence(genreCount: GenreItemCount): Float {
        return when {
            genreCount.itemCount >= 20 -> 0.9f
            genreCount.itemCount >= 10 -> 0.8f
            genreCount.itemCount >= 5 -> 0.65f
            else -> 0.5f
        }
    }

    /**
     * Create suggestion for recently added items
     */
    private suspend fun createRecentlyAddedSuggestion(): SuggestedCollection? {
        val oneWeekAgo = System.currentTimeMillis() - (7 * 24 * 60 * 60 * 1000L)
        val recentItems = smartCollectionDao.getRecentlyAddedItems(oneWeekAgo, 50)

        if (recentItems.size < 3) return null

        val queryRules = CollectionQuery(
            rules = listOf(
                CollectionQueryRule(
                    field = "dateAdded",
                    operator = QueryOperator.GREATER_THAN,
                    value = oneWeekAgo.toString()
                )
            )
        )

        return SuggestedCollection(
            suggestionId = "system:recently-added",
            suggestedName = "Recently Added",
            collectionType = SmartCollectionType.RECENTLY_ADDED,
            reason = "${recentItems.size} items added in the last 7 days",
            confidence = 0.9f,
            previewItemIds = recentItems.take(5).map { it.itemId },
            estimatedItemCount = recentItems.size,
            queryRules = json.encodeToString(queryRules),
            mediaTypes = listOf("BOOK", "AUDIOBOOK", "MUSIC_TRACK", "MOVIE", "TV_SHOW"),
            previewCoverUrl = null
        )
    }

    /**
     * Create suggestion for favorites
     */
    private suspend fun createFavoritesSuggestion(): SuggestedCollection? {
        val favorites = smartCollectionDao.getFavoriteItems().first()

        if (favorites.size < 3) return null

        val queryRules = CollectionQuery(
            rules = listOf(
                CollectionQueryRule(
                    field = "isFavorite",
                    operator = QueryOperator.EQUALS,
                    value = "true"
                )
            )
        )

        return SuggestedCollection(
            suggestionId = "system:favorites",
            suggestedName = "My Favorites",
            collectionType = SmartCollectionType.FAVORITES,
            reason = "Your ${favorites.size} favorited items",
            confidence = 0.95f,
            previewItemIds = favorites.take(5).map { it.itemId },
            estimatedItemCount = favorites.size,
            queryRules = json.encodeToString(queryRules),
            mediaTypes = listOf("BOOK", "AUDIOBOOK", "MUSIC_TRACK", "MOVIE", "TV_SHOW"),
            previewCoverUrl = null
        )
    }

    /**
     * Create suggestion for in-progress items
     */
    private suspend fun createInProgressSuggestion(): SuggestedCollection? {
        val inProgress = smartCollectionDao.getInProgressItems().first()

        if (inProgress.size < 2) return null

        val queryRules = CollectionQuery(
            rules = listOf(
                CollectionQueryRule(
                    field = "progress",
                    operator = QueryOperator.BETWEEN,
                    value = "1",
                    value2 = "99"
                )
            )
        )

        return SuggestedCollection(
            suggestionId = "system:in-progress",
            suggestedName = "Continue Reading/Watching",
            collectionType = SmartCollectionType.IN_PROGRESS,
            reason = "${inProgress.size} items you've started but not finished",
            confidence = 0.85f,
            previewItemIds = inProgress.take(5).map { it.itemId },
            estimatedItemCount = inProgress.size,
            queryRules = json.encodeToString(queryRules),
            mediaTypes = listOf("BOOK", "AUDIOBOOK", "MOVIE", "TV_SHOW"),
            previewCoverUrl = null
        )
    }

    // ==================== SMART COLLECTION RULES ====================

    /**
     * Create a smart collection from a suggestion
     */
    suspend fun createCollectionFromSuggestion(suggestion: SuggestedCollection): Long {
        val rule = SmartCollectionRule(
            name = suggestion.suggestedName,
            collectionType = suggestion.collectionType,
            description = suggestion.reason,
            queryRules = suggestion.queryRules,
            targetMediaTypes = json.encodeToString(suggestion.mediaTypes),
            isEnabled = true,
            refreshInterval = getDefaultRefreshInterval(suggestion.collectionType),
            isSystemGenerated = suggestion.suggestionId.startsWith("system:")
        )

        val ruleId = smartCollectionDao.insertRule(rule)

        // Refresh the collection immediately
        refreshCollection(ruleId)

        return ruleId
    }

    /**
     * Get default refresh interval for collection type
     */
    private fun getDefaultRefreshInterval(type: SmartCollectionType): Long {
        return when (type) {
            SmartCollectionType.RECENTLY_ADDED -> 1 * 60 * 60 * 1000L // 1 hour
            SmartCollectionType.RECENTLY_ACCESSED -> 1 * 60 * 60 * 1000L
            SmartCollectionType.IN_PROGRESS -> 30 * 60 * 1000L // 30 minutes
            SmartCollectionType.FAVORITES -> 24 * 60 * 60 * 1000L // 1 day
            SmartCollectionType.BOOK_SERIES -> 0 // Manual refresh
            SmartCollectionType.AUTHOR_COLLECTION -> 0
            SmartCollectionType.GENRE_COLLECTION -> 24 * 60 * 60 * 1000L
            else -> 0
        }
    }

    /**
     * Refresh a smart collection by re-evaluating its rules
     */
    suspend fun refreshCollection(ruleId: Long) = withContext(Dispatchers.IO) {
        val rule = smartCollectionDao.getRuleById(ruleId) ?: return@withContext

        val itemIds = evaluateCollectionRule(rule)

        smartCollectionDao.refreshRuleCache(ruleId, itemIds)
    }

    /**
     * Evaluate a collection rule and return matching item IDs
     */
    private suspend fun evaluateCollectionRule(rule: SmartCollectionRule): List<Long> {
        return when (rule.collectionType) {
            SmartCollectionType.RECENTLY_ADDED -> {
                val sinceTimestamp = System.currentTimeMillis() - (7 * 24 * 60 * 60 * 1000L)
                smartCollectionDao.getRecentlyAddedItems(sinceTimestamp, rule.maxItems ?: 100)
                    .map { it.itemId }
            }
            SmartCollectionType.RECENTLY_ACCESSED -> {
                val sinceTimestamp = System.currentTimeMillis() - (30 * 24 * 60 * 60 * 1000L)
                smartCollectionDao.getRecentlyAccessedItems(sinceTimestamp, rule.maxItems ?: 50)
                    .map { it.itemId }
            }
            SmartCollectionType.MOST_PLAYED -> {
                smartCollectionDao.getMostPlayedItems(rule.maxItems ?: 50)
                    .map { it.itemId }
            }
            SmartCollectionType.FAVORITES -> {
                smartCollectionDao.getFavoriteItems().first()
                    .map { it.itemId }
            }
            SmartCollectionType.IN_PROGRESS -> {
                smartCollectionDao.getInProgressItems().first()
                    .map { it.itemId }
            }
            SmartCollectionType.BACKLOG -> {
                smartCollectionDao.getBacklogItems(rule.maxItems ?: 100)
                    .map { it.itemId }
            }
            else -> {
                // Parse and evaluate query rules
                evaluateQueryRules(rule.queryRules, rule.maxItems ?: 100)
            }
        }
    }

    /**
     * Evaluate custom query rules
     */
    private suspend fun evaluateQueryRules(queryRulesJson: String, maxItems: Int): List<Long> {
        // For complex queries, would need to parse and dynamically build SQL
        // For now, return empty list as placeholder
        return emptyList()
    }

    /**
     * Dismiss a suggestion
     */
    suspend fun dismissSuggestion(suggestionId: String, reason: String? = null) {
        smartCollectionDao.insertDismissal(
            DismissedSuggestion(
                suggestionKey = suggestionId,
                reason = reason
            )
        )
    }

    /**
     * Get all smart collections
     */
    fun getAllSmartCollections(): Flow<List<SmartCollectionRule>> =
        smartCollectionDao.getAllRules()

    /**
     * Get items in a smart collection
     */
    fun getSmartCollectionItems(ruleId: Long): Flow<List<MediaItem>> =
        smartCollectionDao.getCachedItemsForRule(ruleId)

    /**
     * Refresh all collections that need it
     */
    suspend fun refreshStaleCollections() = withContext(Dispatchers.IO) {
        val staleRules = smartCollectionDao.getRulesNeedingRefresh(System.currentTimeMillis())
        for (rule in staleRules) {
            refreshCollection(rule.ruleId)
        }
    }
}
