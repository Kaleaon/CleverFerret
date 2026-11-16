package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.ProgressSyncJournal
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object for progress synchronization journal entries.
 */
@Dao
interface ProgressSyncJournalDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(entry: ProgressSyncJournal): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(entries: List<ProgressSyncJournal>)

    @Query("SELECT * FROM progress_sync_journal WHERE id = :id")
    suspend fun getEntryById(id: Long): ProgressSyncJournal?

    @Query("SELECT * FROM progress_sync_journal WHERE isProcessed = 0 ORDER BY sequenceNumber ASC, createdAt ASC")
    suspend fun getPendingEvents(): List<ProgressSyncJournal>

    @Query("SELECT * FROM progress_sync_journal WHERE isProcessed = 0 ORDER BY sequenceNumber ASC, createdAt ASC")
    fun observePendingEvents(): Flow<List<ProgressSyncJournal>>

    @Query("SELECT * FROM progress_sync_journal WHERE itemId = :itemId AND isProcessed = 0 ORDER BY sequenceNumber ASC, createdAt ASC")
    suspend fun getPendingEventsForItem(itemId: String): List<ProgressSyncJournal>

    @Query("SELECT * FROM progress_sync_journal WHERE itemId = :itemId ORDER BY sequenceNumber ASC, createdAt ASC")
    suspend fun getAllEventsForItem(itemId: String): List<ProgressSyncJournal>

    @Query("SELECT MAX(sequenceNumber) FROM progress_sync_journal WHERE itemId = :itemId")
    suspend fun getLatestSequenceNumber(itemId: String): Long?

    @Query("UPDATE progress_sync_journal SET isProcessed = 1, processedAt = :processedAt WHERE id = :id")
    suspend fun markProcessed(id: Long, processedAt: Long = System.currentTimeMillis())

    @Query("UPDATE progress_sync_journal SET isProcessed = 1, processedAt = :processedAt WHERE id IN (:ids)")
    suspend fun markProcessed(ids: List<Long>, processedAt: Long = System.currentTimeMillis())

    @Query("DELETE FROM progress_sync_journal WHERE isProcessed = 1 AND (processedAt < :threshold OR (processedAt IS NULL AND createdAt < :threshold))")
    suspend fun deleteProcessedOlderThan(threshold: Long): Int

    /**
     * Automated pruning logic to purge synced journal entries older than retention threshold (default 30 days).
     */
    suspend fun pruneSyncedEntries(retentionPeriodMs: Long = 30L * 24 * 60 * 60 * 1000L): Int {
        val threshold = System.currentTimeMillis() - retentionPeriodMs
        return deleteProcessedOlderThan(threshold)
    }

    @Query("SELECT COUNT(*) FROM progress_sync_journal WHERE isProcessed = 0")
    suspend fun getPendingCount(): Int

    @Query("DELETE FROM progress_sync_journal")
    suspend fun clearAll()
}
