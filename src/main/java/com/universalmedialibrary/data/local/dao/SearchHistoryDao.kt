package com.universalmedialibrary.data.local.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import com.universalmedialibrary.data.local.entity.SearchHistory
import com.universalmedialibrary.data.local.entity.SearchSource

/**
 * Data Access Object for SearchHistory operations.
 * Manages search analytics, suggestions, and user search patterns.
 */
@Dao
interface SearchHistoryDao {
    
    // Basic CRUD Operations
    @Insert
    suspend fun insertSearch(search: SearchHistory): Long
    
    @Insert
    suspend fun insertSearches(searches: List<SearchHistory>): List<Long>
    
    @Update
    suspend fun updateSearch(search: SearchHistory)
    
    @Delete
    suspend fun deleteSearch(search: SearchHistory)
    
    @Query("DELETE FROM search_history WHERE id = :searchId")
    suspend fun deleteSearchById(searchId: Long)
    
    @Query("SELECT * FROM search_history WHERE id = :searchId")
    suspend fun getSearchById(searchId: Long): SearchHistory?
    
    // Query Operations
    @Query("SELECT * FROM search_history ORDER BY timestamp DESC")
    fun getAllSearchHistory(): Flow<List<SearchHistory>>
    
    @Query("SELECT * FROM search_history WHERE user_id = :userId ORDER BY timestamp DESC")
    fun getSearchHistoryForUser(userId: String): Flow<List<SearchHistory>>
    
    @Query("SELECT * FROM search_history ORDER BY timestamp DESC LIMIT :limit")
    suspend fun getRecentSearches(limit: Int = 50): List<SearchHistory>
    
    @Query("SELECT * FROM search_history WHERE user_id = :userId ORDER BY timestamp DESC LIMIT :limit")
    suspend fun getRecentSearchesForUser(userId: String, limit: Int = 50): List<SearchHistory>>
    
    // Favorite Searches
    @Query("SELECT * FROM search_history WHERE is_favorite = 1 ORDER BY timestamp DESC")
    fun getFavoriteSearches(): Flow<List<SearchHistory>>
    
    @Query("UPDATE search_history SET is_favorite = 1 WHERE id = :searchId")
    suspend fun markAsFavorite(searchId: Long)
    
    @Query("UPDATE search_history SET is_favorite = 0 WHERE id = :searchId")
    suspend fun unmarkAsFavorite(searchId: Long)
    
    @Query("UPDATE search_history SET is_favorite = :isFavorite WHERE normalized_query = :normalizedQuery AND user_id = :userId")
    suspend fun updateFavoriteStatus(normalizedQuery: String, userId: String, isFavorite: Boolean)
    
    // Search Suggestions and Autocomplete
    @Query("""
        SELECT DISTINCT query, COUNT(*) as frequency, MAX(timestamp) as last_used
        FROM search_history 
        WHERE query LIKE '%' || :query || '%' 
           OR normalized_query LIKE '%' || :normalizedQuery || '%'
        GROUP BY query
        ORDER BY frequency DESC, last_used DESC
        LIMIT :limit
    """)
    suspend fun getSearchSuggestions(query: String, normalizedQuery: String, limit: Int = 10): List<SearchSuggestion>
    
    @Query("""
        SELECT DISTINCT query, COUNT(*) as frequency
        FROM search_history 
        WHERE normalized_query LIKE :prefix || '%' 
        GROUP BY query
        ORDER BY frequency DESC
        LIMIT :limit
    """)
    suspend fun getAutocompleteSuggestions(prefix: String, limit: Int = 10): List<SearchSuggestion>
    
    // Analytics and Statistics
    @Query("""
        SELECT source, COUNT(*) as count, AVG(search_duration_ms) as avg_duration, AVG(result_count) as avg_results
        FROM search_history
        WHERE timestamp >= :since
        GROUP BY source
        ORDER BY count DESC
    """)
    suspend fun getSearchSourceStats(since: Long): List<SearchSourceStats>
    
    @Query("""
        SELECT DATE(timestamp / 1000, 'unixepoch') as date, COUNT(*) as searches, AVG(result_count) as avg_results
        FROM search_history
        WHERE timestamp >= :since
        GROUP BY date
        ORDER BY date DESC
    """)
    suspend fun getDailySearchStats(since: Long): List<DailySearchStats>
    
    @Query("SELECT COUNT(*) FROM search_history WHERE timestamp >= :since")
    suspend fun getSearchCountSince(since: Long): Int
    
    @Query("SELECT AVG(search_duration_ms) FROM search_history WHERE timestamp >= :since")
    suspend fun getAverageSearchDuration(since: Long): Float?
    
    @Query("SELECT AVG(result_count) FROM search_history WHERE timestamp >= :since")
    suspend fun getAverageResultCount(since: Long): Float?
    
    // Popular Searches
    @Query("""
        SELECT query, COUNT(*) as frequency
        FROM search_history
        WHERE timestamp >= :since AND result_count > 0
        GROUP BY query
        ORDER BY frequency DESC
        LIMIT :limit
    """)
    suspend fun getPopularSearches(since: Long, limit: Int = 20): List<SearchSuggestion>
    
    @Query("""
        SELECT media_types, COUNT(*) as frequency
        FROM search_history
        WHERE timestamp >= :since AND media_types IS NOT NULL
        GROUP BY media_types
        ORDER BY frequency DESC
    """)
    suspend fun getPopularMediaTypeCombinations(since: Long): List<MediaTypeStats>
    
    // User Behavior Analysis
    @Query("""
        SELECT clicked_result_id, COUNT(*) as click_count
        FROM search_history
        WHERE timestamp >= :since AND clicked_result_id IS NOT NULL
        GROUP BY clicked_result_id
        ORDER BY click_count DESC
        LIMIT :limit
    """)
    suspend fun getMostClickedResults(since: Long, limit: Int = 20): List<ClickedResultStats>
    
    @Query("""
        SELECT query, AVG(search_duration_ms) as avg_duration
        FROM search_history
        WHERE timestamp >= :since AND search_duration_ms > 0
        GROUP BY query
        ORDER BY avg_duration ASC
        LIMIT :limit
    """)
    suspend fun getFastestSearchQueries(since: Long, limit: Int = 10): List<QueryPerformanceStats>
    
    // Maintenance and Cleanup
    @Query("DELETE FROM search_history WHERE timestamp < :cutoffTime AND is_favorite = 0")
    suspend fun cleanupOldSearches(cutoffTime: Long)
    
    @Query("DELETE FROM search_history WHERE result_count = 0 AND timestamp < :cutoffTime")
    suspend fun cleanupFailedSearches(cutoffTime: Long)
    
    @Query("SELECT COUNT(*) FROM search_history")
    suspend fun getTotalSearchCount(): Int
    
    @Query("SELECT COUNT(*) FROM search_history WHERE is_favorite = 1")
    suspend fun getFavoriteSearchCount(): Int
    
    // Duplicate Management
    @Query("""
        SELECT normalized_query, COUNT(*) as count
        FROM search_history
        GROUP BY normalized_query
        HAVING count > 1
        ORDER BY count DESC
        LIMIT :limit
    """)
    suspend fun getDuplicateSearchQueries(limit: Int = 20): List<DuplicateQueryStats>
    
    // Session Analysis
    @Query("""
        SELECT session_id, COUNT(*) as searches, AVG(search_duration_ms) as avg_duration
        FROM search_history
        WHERE session_id IS NOT NULL AND timestamp >= :since
        GROUP BY session_id
        ORDER BY searches DESC
        LIMIT :limit
    """)
    suspend fun getTopSearchSessions(since: Long, limit: Int = 10): List<SessionStats>
    
    // Transaction Operations
    @Transaction
    suspend fun recordSearchWithUpdate(search: SearchHistory): Long {
        val id = insertSearch(search)
        // Update any existing duplicate queries
        search.query.takeIf { it.isNotBlank() }?.let { query ->
            updateSearchTimestamp(query, search.timestamp)
        }
        return id
    }
    
    @Query("UPDATE search_history SET timestamp = :timestamp WHERE normalized_query = :normalizedQuery")
    suspend fun updateSearchTimestamp(normalizedQuery: String, timestamp: Long)
}

// Data classes for complex queries
data class SearchSuggestion(
    val query: String,
    val frequency: Int,
    val lastUsed: Long?
)

data class SearchSourceStats(
    val source: SearchSource,
    val count: Int,
    val avgDuration: Float,
    val avgResults: Float
)

data class DailySearchStats(
    val date: String,
    val searches: Int,
    val avgResults: Float
)

data class MediaTypeStats(
    val mediaTypes: String,
    val frequency: Int
)

data class ClickedResultStats(
    val clickedResultId: String,
    val clickCount: Int
)

data class QueryPerformanceStats(
    val query: String,
    val avgDuration: Float
)

data class DuplicateQueryStats(
    val normalizedQuery: String,
    val count: Int
)

data class SessionStats(
    val sessionId: String,
    val searches: Int,
    val avgDuration: Float
)