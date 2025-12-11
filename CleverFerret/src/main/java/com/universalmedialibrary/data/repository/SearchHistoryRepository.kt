package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.SearchHistoryDao
import com.universalmedialibrary.data.local.entity.SearchHistory
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for search history data operations
 */
@Singleton
class SearchHistoryRepository @Inject constructor(
    private val searchHistoryDao: SearchHistoryDao
) {
    suspend fun getRecentSearches(limit: Int = 10): List<SearchHistory> =
        searchHistoryDao.getRecentSearches(limit)
    
    suspend fun getAllSearchHistory(limit: Int = 50): List<SearchHistory> =
        searchHistoryDao.getAllSearchHistory(limit)
    
    suspend fun insertSearch(search: SearchHistory): Long =
        searchHistoryDao.insertSearch(search)
    
    suspend fun clearSearchHistory() =
        searchHistoryDao.clearHistory()
}
