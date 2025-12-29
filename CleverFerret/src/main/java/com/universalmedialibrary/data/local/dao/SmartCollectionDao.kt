package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow

/**
 * DAO for smart collection operations
 */
@Dao
interface SmartCollectionDao {

    // ==================== SMART COLLECTION RULES ====================

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertRule(rule: SmartCollectionRule): Long

    @Update
    suspend fun updateRule(rule: SmartCollectionRule)

    @Delete
    suspend fun deleteRule(rule: SmartCollectionRule)

    @Query("SELECT * FROM smart_collection_rules WHERE ruleId = :ruleId")
    suspend fun getRuleById(ruleId: Long): SmartCollectionRule?

    @Query("SELECT * FROM smart_collection_rules ORDER BY displayPriority DESC, name ASC")
    fun getAllRules(): Flow<List<SmartCollectionRule>>

    @Query("SELECT * FROM smart_collection_rules WHERE isEnabled = 1 ORDER BY displayPriority DESC")
    fun getEnabledRules(): Flow<List<SmartCollectionRule>>

    @Query("SELECT * FROM smart_collection_rules WHERE collectionType = :type ORDER BY name ASC")
    fun getRulesByType(type: SmartCollectionType): Flow<List<SmartCollectionRule>>

    @Query("SELECT * FROM smart_collection_rules WHERE isSystemGenerated = 1 ORDER BY displayPriority DESC")
    fun getSystemRules(): Flow<List<SmartCollectionRule>>

    @Query("SELECT * FROM smart_collection_rules WHERE isSystemGenerated = 0 ORDER BY name ASC")
    fun getUserRules(): Flow<List<SmartCollectionRule>>

    /**
     * Get rules that need refreshing
     */
    @Query("""
        SELECT * FROM smart_collection_rules 
        WHERE isEnabled = 1 
          AND refreshInterval > 0 
          AND (lastRefreshed + refreshInterval) < :currentTime
        ORDER BY lastRefreshed ASC
    """)
    suspend fun getRulesNeedingRefresh(currentTime: Long): List<SmartCollectionRule>

    /**
     * Update last refreshed timestamp
     */
    @Query("""
        UPDATE smart_collection_rules 
        SET lastRefreshed = :timestamp, currentItemCount = :itemCount 
        WHERE ruleId = :ruleId
    """)
    suspend fun updateRefreshStatus(ruleId: Long, timestamp: Long, itemCount: Int)

    // ==================== SMART COLLECTION CACHE ====================

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCacheEntry(cache: SmartCollectionCache): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCacheEntries(entries: List<SmartCollectionCache>)

    @Query("DELETE FROM smart_collection_cache WHERE ruleId = :ruleId")
    suspend fun clearCacheForRule(ruleId: Long)

    @Query("DELETE FROM smart_collection_cache WHERE cachedAt < :timestamp")
    suspend fun clearOldCache(timestamp: Long)

    /**
     * Get cached items for a rule
     */
    @Query("""
        SELECT m.* FROM media_items m
        INNER JOIN smart_collection_cache scc ON m.itemId = scc.itemId
        WHERE scc.ruleId = :ruleId
        ORDER BY scc.sortOrder ASC
    """)
    fun getCachedItemsForRule(ruleId: Long): Flow<List<MediaItem>>

    /**
     * Get cached item IDs for a rule
     */
    @Query("SELECT itemId FROM smart_collection_cache WHERE ruleId = :ruleId ORDER BY sortOrder ASC")
    suspend fun getCachedItemIdsForRule(ruleId: Long): List<Long>

    /**
     * Check if rule has cached results
     */
    @Query("SELECT COUNT(*) > 0 FROM smart_collection_cache WHERE ruleId = :ruleId")
    suspend fun hasCachedResults(ruleId: Long): Boolean

    // ==================== DISMISSED SUGGESTIONS ====================

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertDismissal(dismissal: DismissedSuggestion): Long

    @Query("SELECT * FROM dismissed_suggestions WHERE suggestionKey = :key LIMIT 1")
    suspend fun getDismissal(key: String): DismissedSuggestion?

    @Query("SELECT EXISTS(SELECT 1 FROM dismissed_suggestions WHERE suggestionKey = :key)")
    suspend fun isSuggestionDismissed(key: String): Boolean

    @Query("DELETE FROM dismissed_suggestions WHERE suggestionKey = :key")
    suspend fun undoDismissal(key: String)

    @Query("DELETE FROM dismissed_suggestions WHERE dismissedAt < :timestamp")
    suspend fun clearOldDismissals(timestamp: Long)

    // ==================== DETECTION QUERIES ====================

    /**
     * Detect potential book series based on title patterns
     * Looks for common series indicators like "Book 1", "Vol. 2", "#3", etc.
     */
    @Query("""
        SELECT * FROM media_items 
        WHERE mediaType = 'BOOK' 
          AND (
            fileName LIKE '%Book %' 
            OR fileName LIKE '%Vol.%' 
            OR fileName LIKE '%Volume %'
            OR fileName LIKE '% #%'
            OR fileName LIKE '%Part %'
          )
        ORDER BY fileName ASC
    """)
    suspend fun detectPotentialSeriesBooks(): List<MediaItem>

    /**
     * Get items grouped by author/creator for author collections
     * Uses the people table with AUTHOR role
     */
    @Query("""
        SELECT p.name as creator, COUNT(DISTINCT mi.itemId) as itemCount
        FROM people p
        INNER JOIN item_person_role ipr ON p.personId = ipr.personId
        INNER JOIN media_items mi ON ipr.itemId = mi.itemId
        WHERE ipr.role = 'AUTHOR' AND p.name IS NOT NULL AND p.name != ''
        GROUP BY p.name
        HAVING COUNT(DISTINCT mi.itemId) >= :minItems
        ORDER BY itemCount DESC
    """)
    suspend fun getAuthorItemCounts(minItems: Int = 3): List<AuthorItemCount>

    /**
     * Get items by specific author
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN item_person_role ipr ON mi.itemId = ipr.itemId
        INNER JOIN people p ON ipr.personId = p.personId
        WHERE p.name = :author AND ipr.role = 'AUTHOR'
        ORDER BY mi.fileName ASC
    """)
    fun getItemsByAuthor(author: String): Flow<List<MediaItem>>

    /**
     * Get genre item counts for genre collections
     */
    @Query("""
        SELECT g.name as genreName, COUNT(DISTINCT ig.itemId) as itemCount
        FROM genre g
        INNER JOIN item_genre ig ON g.genreId = ig.genreId
        GROUP BY g.genreId
        HAVING COUNT(DISTINCT ig.itemId) >= :minItems
        ORDER BY itemCount DESC
    """)
    suspend fun getGenreItemCounts(minItems: Int = 5): List<GenreItemCount>

    /**
     * Get recently added items
     */
    @Query("""
        SELECT * FROM media_items 
        WHERE dateAdded >= :sinceTimestamp
        ORDER BY dateAdded DESC
        LIMIT :limit
    """)
    suspend fun getRecentlyAddedItems(sinceTimestamp: Long, limit: Int = 50): List<MediaItem>

    /**
     * Get recently accessed items
     */
    @Query("""
        SELECT * FROM media_items 
        WHERE lastPlayed >= :sinceTimestamp
        ORDER BY lastPlayed DESC
        LIMIT :limit
    """)
    suspend fun getRecentlyAccessedItems(sinceTimestamp: Long, limit: Int = 50): List<MediaItem>

    /**
     * Get most played items
     */
    @Query("""
        SELECT * FROM media_items 
        WHERE playCount > 0
        ORDER BY playCount DESC
        LIMIT :limit
    """)
    suspend fun getMostPlayedItems(limit: Int = 50): List<MediaItem>

    /**
     * Get favorite items
     */
    @Query("""
        SELECT * FROM media_items 
        WHERE isFavorite = 1
        ORDER BY dateAdded DESC
    """)
    fun getFavoriteItems(): Flow<List<MediaItem>>

    /**
     * Get items with specific tags
     */
    @Query("""
        SELECT DISTINCT mi.* FROM media_items mi
        INNER JOIN item_tags it ON mi.itemId = it.itemId
        INNER JOIN unified_tags ut ON it.tagId = ut.tagId
        WHERE ut.name IN (:tagNames)
        ORDER BY mi.dateAdded DESC
    """)
    fun getItemsWithTags(tagNames: List<String>): Flow<List<MediaItem>>

    /**
     * Get in-progress items (started but not finished)
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN reading_progress rp ON mi.itemId = rp.itemId
        WHERE rp.percentage > 0 AND rp.percentage < 100
        ORDER BY rp.lastUpdate DESC
    """)
    fun getInProgressItems(): Flow<List<MediaItem>>

    /**
     * Get backlog items (not started)
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        LEFT JOIN reading_progress rp ON mi.itemId = rp.itemId
        WHERE rp.progressId IS NULL OR rp.percentage = 0
        ORDER BY mi.dateAdded DESC
        LIMIT :limit
    """)
    suspend fun getBacklogItems(limit: Int = 100): List<MediaItem>

    /**
     * Get items by year range
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN metadata_common mc ON mi.itemId = mc.itemId
        WHERE mc.year BETWEEN :fromYear AND :toYear
        ORDER BY mc.year DESC, mc.title ASC
    """)
    fun getItemsByYearRange(fromYear: Int, toYear: Int): Flow<List<MediaItem>>

    /**
     * Get highly rated items
     */
    @Query("""
        SELECT mi.* FROM media_items mi
        INNER JOIN metadata_common mc ON mi.itemId = mc.itemId
        WHERE mc.rating >= :minRating OR mc.userRating >= :minRating
        ORDER BY COALESCE(mc.userRating, mc.rating) DESC
        LIMIT :limit
    """)
    suspend fun getHighlyRatedItems(minRating: Float, limit: Int = 50): List<MediaItem>

    // ==================== BATCH OPERATIONS ====================

    @Transaction
    suspend fun refreshRuleCache(ruleId: Long, itemIds: List<Long>) {
        clearCacheForRule(ruleId)
        val entries = itemIds.mapIndexed { index, itemId ->
            SmartCollectionCache(
                ruleId = ruleId,
                itemId = itemId,
                sortOrder = index
            )
        }
        insertCacheEntries(entries)
        updateRefreshStatus(
            ruleId = ruleId,
            timestamp = System.currentTimeMillis(),
            itemCount = itemIds.size
        )
    }
}

/**
 * Author item count result
 */
data class AuthorItemCount(
    val creator: String,
    val itemCount: Int
)

/**
 * Genre item count result
 */
data class GenreItemCount(
    val genreName: String,
    val itemCount: Int
)
