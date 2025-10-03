package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Query
import androidx.room.Upsert
import com.universalmedialibrary.data.local.entity.ReadingProgress
import kotlinx.coroutines.flow.Flow

@Dao
interface ReadingProgressDao {

    @Query("SELECT * FROM reading_progress WHERE itemId = :itemId LIMIT 1")
    fun getProgress(itemId: Long): Flow<ReadingProgress?>

    @Query("SELECT * FROM reading_progress WHERE isCompleted = 0 ORDER BY lastUpdate DESC LIMIT :limit")
    fun getRecentlyRead(limit: Int = 10): Flow<List<ReadingProgress>>

    @Query("SELECT * FROM reading_progress WHERE isCompleted = 1 ORDER BY completedDate DESC")
    fun getCompleted(): Flow<List<ReadingProgress>>

    @Upsert
    suspend fun upsert(progress: ReadingProgress)

    @Query("UPDATE reading_progress SET isCompleted = :completed, completedDate = CASE WHEN :completed = 1 THEN strftime('%s','now')*1000 ELSE completedDate END, lastUpdate = strftime('%s','now')*1000 WHERE itemId = :itemId")
    suspend fun markAsCompleted(itemId: Long, completed: Boolean)

    @Query("DELETE FROM reading_progress WHERE itemId = :itemId")
    suspend fun delete(itemId: Long)

    @Query("SELECT * FROM reading_progress WHERE itemId IN (:itemIds)")
    fun getProgressForItems(itemIds: List<Long>): Flow<List<ReadingProgress>>
}
