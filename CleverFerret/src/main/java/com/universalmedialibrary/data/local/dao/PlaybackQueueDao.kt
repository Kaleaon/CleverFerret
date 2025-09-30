package com.universalmedialibrary.data.local.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import com.universalmedialibrary.data.local.entity.PlaybackQueue
import com.universalmedialibrary.data.local.entity.QueueItem

/**
 * DAO for PlaybackQueue operations
 *
 * Handles CRUD operations for playback queues and provides
 * reactive data streams for UI updates.
 */
@Dao
interface PlaybackQueueDao {

    // Basic CRUD operations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertQueue(queue: PlaybackQueue): Long

    @Update
    suspend fun updateQueue(queue: PlaybackQueue)

    @Delete
    suspend fun deleteQueue(queue: PlaybackQueue)

    @Query("DELETE FROM playback_queues WHERE queueId = :queueId")
    suspend fun deleteQueueById(queueId: Long)

    // Query operations
    @Query("SELECT * FROM playback_queues WHERE queueId = :queueId")
    suspend fun getQueueById(queueId: Long): PlaybackQueue?

    @Query("SELECT * FROM playback_queues WHERE queueName = :queueName")
    suspend fun getQueueByName(queueName: String): PlaybackQueue?

    @Query("SELECT * FROM playback_queues WHERE isActive = 1 LIMIT 1")
    suspend fun getActiveQueue(): PlaybackQueue?

    @Query("SELECT * FROM playback_queues ORDER BY lastUsed DESC")
    fun getAllQueues(): Flow<List<PlaybackQueue>>

    @Query("SELECT * FROM playback_queues WHERE queueType = :queueType ORDER BY lastUsed DESC")
    fun getQueuesByType(queueType: String): Flow<List<PlaybackQueue>>

    // Queue management operations
    @Query("UPDATE playback_queues SET isActive = 0")
    suspend fun deactivateAllQueues()

    @Query("UPDATE playback_queues SET isActive = 1 WHERE queueId = :queueId")
    suspend fun activateQueue(queueId: Long)

    @Query("UPDATE playback_queues SET lastUsed = :timestamp WHERE queueId = :queueId")
    suspend fun updateLastUsed(queueId: Long, timestamp: Long = System.currentTimeMillis())

    @Query("UPDATE playback_queues SET repeatMode = :repeatMode WHERE queueId = :queueId")
    suspend fun updateRepeatMode(queueId: Long, repeatMode: String)

    @Query("UPDATE playback_queues SET shuffleEnabled = :shuffleEnabled WHERE queueId = :queueId")
    suspend fun updateShuffleMode(queueId: Long, shuffleEnabled: Boolean)

    // Queue cleanup
    @Query("DELETE FROM playback_queues WHERE isPersistent = 0 AND lastUsed < :cutoffTime")
    suspend fun cleanupNonPersistentQueues(cutoffTime: Long)

    // Reactive streams for UI
    @Query("SELECT * FROM playback_queues WHERE isActive = 1 LIMIT 1")
    fun observeActiveQueue(): Flow<PlaybackQueue?>

    @Query("SELECT * FROM playback_queues WHERE queueName = :queueName")
    fun observeQueueByName(queueName: String): Flow<PlaybackQueue?>
}
