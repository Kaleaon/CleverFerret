package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.ListenHistoryDao
import com.universalmedialibrary.data.local.entity.ListenHistoryDailyCount
import com.universalmedialibrary.data.local.entity.ListenHistoryEntry
import com.universalmedialibrary.data.local.entity.ListenHistoryTopItem
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class ListenHistoryRepository @Inject constructor(
    private val listenHistoryDao: ListenHistoryDao
) {

    suspend fun log(entry: ListenHistoryEntry) {
        listenHistoryDao.insert(entry)
    }

    fun observeRecent(limit: Int = 50): Flow<List<ListenHistoryEntry>> =
        listenHistoryDao.observeRecent(limit)

    fun observeTopItems(libraryId: Long?, limit: Int = 10): Flow<List<ListenHistoryTopItem>> =
        listenHistoryDao.observeTopItems(libraryId, limit)

    fun observeDailyCounts(daysBack: Int = 30, libraryId: Long? = null): Flow<List<ListenHistoryDailyCount>> {
        val since = System.currentTimeMillis() - daysBack * 24L * 60L * 60L * 1000L
        return listenHistoryDao.observeDailyCounts(since, libraryId, daysBack)
    }
}
