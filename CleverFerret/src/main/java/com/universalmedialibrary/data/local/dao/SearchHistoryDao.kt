package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.SearchHistory
import com.universalmedialibrary.data.local.entity.SavedSearchEntity

/**
 * Data Access Object for search history operations
 */
@Dao
interface SearchHistoryDao {
    
    /**
     * Insert a new search into history
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSearch(search: SearchHistory): Long
    
    /**
     * Get recent search queries (distinct by query text)
     */
    @Query("""
        SELECT * FROM search_history 
        GROUP BY query 
        ORDER BY timestamp DESC 
        LIMIT :limit
    """)
    suspend fun getRecentSearches(limit: Int = 10): List<SearchHistory>
    
    /**
     * Get all search history with result counts
     */
    @Query("""
        SELECT * FROM search_history 
        ORDER BY timestamp DESC 
        LIMIT :limit
    """)
    suspend fun getAllSearchHistory(limit: Int = 50): List<SearchHistory>
    
    /**
     * Search history by query text
     */
    @Query("""
        SELECT * FROM search_history 
        WHERE query LIKE '%' || :queryText || '%' 
        ORDER BY timestamp DESC 
        LIMIT :limit
    """)
    suspend fun searchHistory(queryText: String, limit: Int = 10): List<SearchHistory>
    
    /**
     * Get popular searches (most frequent queries)
     */
    @Query("""
        SELECT query, COUNT(*) as resultCount, MAX(timestamp) as timestamp, 
               0 as historyId, NULL as mediaTypes, NULL as sortBy, NULL as filterCriteria
        FROM search_history 
        GROUP BY query 
        ORDER BY COUNT(*) DESC, timestamp DESC 
        LIMIT :limit
    """)
    suspend fun getPopularSearches(limit: Int = 10): List<SearchHistory>
    
    /**
     * Clear all search history
     */
    @Query("DELETE FROM search_history")
    suspend fun clearHistory()
    
    /**
     * Clear search history older than a specific timestamp
     */
    @Query("DELETE FROM search_history WHERE timestamp < :timestamp")
    suspend fun clearOldHistory(timestamp: Long)
    
    /**
     * Delete a specific search from history
     */
    @Query("DELETE FROM search_history WHERE historyId = :historyId")
    suspend fun deleteSearch(historyId: Long)
    
    // Saved searches operations
    
    /**
     * Insert or update a saved search
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSavedSearch(savedSearch: SavedSearchEntity): Long
    
    /**
     * Update a saved search
     */
    @Update
    suspend fun updateSavedSearch(savedSearch: SavedSearchEntity)
    
    /**
     * Get all saved searches
     */
    @Query("SELECT * FROM saved_searches ORDER BY name ASC")
    suspend fun getAllSavedSearches(): List<SavedSearchEntity>
    
    /**
     * Get a saved search by ID
     */
    @Query("SELECT * FROM saved_searches WHERE savedSearchId = :searchId")
    suspend fun getSavedSearchById(searchId: Long): SavedSearchEntity?
    
    /**
     * Get a saved search by name
     */
    @Query("SELECT * FROM saved_searches WHERE name = :name LIMIT 1")
    suspend fun getSavedSearchByName(name: String): SavedSearchEntity?
    
    /**
     * Delete a saved search
     */
    @Query("DELETE FROM saved_searches WHERE savedSearchId = :searchId")
    suspend fun deleteSavedSearch(searchId: Long)
    
    /**
     * Update last used timestamp for a saved search
     */
    @Query("UPDATE saved_searches SET lastUsed = :timestamp WHERE savedSearchId = :searchId")
    suspend fun updateLastUsed(searchId: Long, timestamp: Long = System.currentTimeMillis())
}
