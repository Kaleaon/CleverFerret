package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.ReadingProgress
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class ReadingProgressRepository @Inject constructor(
    private val readingProgressDao: ReadingProgressDao
) {
    fun getProgress(itemId: Long): Flow<ReadingProgress?> =
        readingProgressDao.getProgress(itemId)

    fun getRecentlyRead(limit: Int = 10): Flow<List<ReadingProgress>> =
        readingProgressDao.getRecentlyRead(limit)

    fun getCompleted(): Flow<List<ReadingProgress>> =
        readingProgressDao.getCompleted()

    suspend fun updateProgress(
        itemId: Long,
        currentPage: Int,
        percentage: Float,
        currentPosition: Long = 0,
        currentChapter: Int = 1
    ) {
        val existing = readingProgressDao.getProgress(itemId).first()
        val isCompleted = percentage >= 99.0f
        val updated = (existing ?: ReadingProgress(
            itemId = itemId
        )).copy(
            currentPage = currentPage,
            currentChapter = currentChapter,
            currentPosition = currentPosition,
            percentage = percentage,
            isCompleted = isCompleted,
            lastUpdate = System.currentTimeMillis(),
            completedDate = if (isCompleted) System.currentTimeMillis() else existing?.completedDate
        )
        readingProgressDao.upsert(updated)
    }

    suspend fun markAsRead(itemId: Long) {
        readingProgressDao.markAsCompleted(itemId, true)
    }

    suspend fun markAsUnread(itemId: Long) {
        readingProgressDao.delete(itemId)
    }
}

