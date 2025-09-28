package com.universalmedialibrary.data.local.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import com.universalmedialibrary.data.local.entity.QueueItem
import com.universalmedialibrary.data.local.entity.MediaItem

/**
 * DAO for QueueItem operations
 * 
 * Manages queue items with position tracking, playback state,
 * and efficient reordering operations.
 */
@Dao
interface QueueItemDao {
    
    // Basic CRUD operations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertQueueItem(queueItem: QueueItem): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertQueueItems(queueItems: List<QueueItem>): List<Long>
    
    @Update
    suspend fun updateQueueItem(queueItem: QueueItem)
    
    @Delete
    suspend fun deleteQueueItem(queueItem: QueueItem)
    
    @Query("DELETE FROM queue_items WHERE queueItemId = :queueItemId")
    suspend fun deleteQueueItemById(queueItemId: Long)
    
    @Query("DELETE FROM queue_items WHERE queueId = :queueId")
    suspend fun deleteAllItemsInQueue(queueId: Long)
    
    // Query operations
    @Query("SELECT * FROM queue_items WHERE queueItemId = :queueItemId")
    suspend fun getQueueItemById(queueItemId: Long): QueueItem?
    
    @Query("SELECT * FROM queue_items WHERE queueId = :queueId ORDER BY queuePosition ASC")
    suspend fun getQueueItems(queueId: Long): List<QueueItem>
    
    @Query("SELECT * FROM queue_items WHERE queueId = :queueId AND isCurrentlyPlaying = 1 LIMIT 1")
    suspend fun getCurrentPlayingItem(queueId: Long): QueueItem?
    
    @Query("SELECT * FROM queue_items WHERE queueId = :queueId AND queuePosition = :position LIMIT 1")
    suspend fun getQueueItemAtPosition(queueId: Long, position: Int): QueueItem?
    
    // Reactive streams for UI
    @Query("SELECT * FROM queue_items WHERE queueId = :queueId ORDER BY queuePosition ASC")
    fun observeQueueItems(queueId: Long): Flow<List<QueueItem>>
    
    @Query("SELECT * FROM queue_items WHERE queueId = :queueId AND isCurrentlyPlaying = 1 LIMIT 1")
    fun observeCurrentPlayingItem(queueId: Long): Flow<QueueItem?>
    
    // Position and playback state management
    @Query("UPDATE queue_items SET isCurrentlyPlaying = 0 WHERE queueId = :queueId")
    suspend fun clearCurrentlyPlaying(queueId: Long)
    
    @Query("UPDATE queue_items SET isCurrentlyPlaying = 1 WHERE queueItemId = :queueItemId")
    suspend fun setCurrentlyPlaying(queueItemId: Long)
    
    @Query("UPDATE queue_items SET playbackPositionMs = :positionMs WHERE queueItemId = :queueItemId")
    suspend fun updatePlaybackPosition(queueItemId: Long, positionMs: Long)
    
    @Query("UPDATE queue_items SET lastPlayed = :timestamp, playCount = playCount + 1 WHERE queueItemId = :queueItemId")
    suspend fun recordPlayback(queueItemId: Long, timestamp: Long = System.currentTimeMillis())
    
    // Queue reordering operations  
    @Query("UPDATE queue_items SET queuePosition = queuePosition + 1 WHERE queueId = :queueId AND queuePosition >= :fromPosition")
    suspend fun shiftPositionsUp(queueId: Long, fromPosition: Int)
    
    @Query("UPDATE queue_items SET queuePosition = queuePosition - 1 WHERE queueId = :queueId AND queuePosition > :position AND queuePosition <= :toPosition")
    suspend fun shiftPositionsDown(queueId: Long, position: Int, toPosition: Int)
    
    @Query("UPDATE queue_items SET queuePosition = :newPosition WHERE queueItemId = :queueItemId")
    suspend fun updateItemPosition(queueItemId: Long, newPosition: Int)
    
    @Query("SELECT MAX(queuePosition) FROM queue_items WHERE queueId = :queueId")
    suspend fun getMaxPosition(queueId: Long): Int?
    
    @Query("SELECT COUNT(*) FROM queue_items WHERE queueId = :queueId")
    suspend fun getQueueSize(queueId: Long): Int
    
    // Advanced queries with joins
    @Query("""
        SELECT qi.*, mi.filePath, mi.fileName, mi.mediaType as mediaItemType
        FROM queue_items qi
        INNER JOIN media_items mi ON qi.mediaItemId = mi.itemId
        WHERE qi.queueId = :queueId 
        ORDER BY qi.queuePosition ASC
    """)
    fun observeQueueItemsWithMediaInfo(queueId: Long): Flow<List<QueueItemWithMediaInfo>>
    
    // Search and filtering
    @Query("SELECT * FROM queue_items WHERE queueId = :queueId AND mediaType = :mediaType ORDER BY queuePosition ASC")
    suspend fun getQueueItemsByMediaType(queueId: Long, mediaType: String): List<QueueItem>
    
    @Query("SELECT * FROM queue_items WHERE title LIKE '%' || :searchQuery || '%' OR artist LIKE '%' || :searchQuery || '%'")
    suspend fun searchQueueItems(searchQuery: String): List<QueueItem>
}

/**
 * Data class for queue items with media information
 */
data class QueueItemWithMediaInfo(
    val queueItemId: Long,
    val queueId: Long,
    val mediaItemId: Long,
    val queuePosition: Int,
    val isCurrentlyPlaying: Boolean,
    val playbackPositionMs: Long,
    val durationMs: Long,
    val mediaType: String,
    val chapterIndex: Int?,
    val chapterTitle: String?,
    val playbackSpeed: Float,
    val title: String,
    val artist: String?,
    val album: String?,
    val coverArtUrl: String?,
    val addedToQueue: Long,
    val lastPlayed: Long?,
    val playCount: Int,
    val skipSilence: Boolean,
    val crossfadeEnabled: Boolean,
    // From MediaItem join
    val filePath: String,
    val fileName: String,
    val mediaItemType: String
)