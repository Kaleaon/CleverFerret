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
        try {
            val existing = readingProgressDao.getProgress(itemId).first()
            val isCompleted = percentage >= 100f
            val timestamp = System.currentTimeMillis()
            val updated = (existing ?: ReadingProgress(
                itemId = itemId
            )).copy(
                currentPage = currentPage,
                currentChapter = currentChapter,
                currentPosition = currentPosition,
                percentage = percentage,
                isCompleted = isCompleted,
                lastUpdate = timestamp,
                lastModified = timestamp,
                completedDate = if (isCompleted) timestamp else null
            )
            readingProgressDao.upsert(updated)
        } catch (e: android.database.sqlite.SQLiteConstraintException) {
            // Foreign key constraint failed - media item doesn't exist in database
            // This can happen when opening files directly without adding to library
            // Silently ignore to allow file viewing without persistence
        }
    }

    suspend fun markAsRead(itemId: Long) {
        try {
            readingProgressDao.markAsCompleted(itemId, true)
        } catch (e: android.database.sqlite.SQLiteConstraintException) {
            // Ignore foreign key constraint errors
        }
    }

    suspend fun markAsUnread(itemId: Long) {
        readingProgressDao.delete(itemId)
    }
}
