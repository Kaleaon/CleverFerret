package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow

/**
 * DAO for collaborative session operations
 */
@Dao
interface CollaborativeSessionDao {
    
    // Session operations
    @Query("SELECT * FROM collaborative_sessions WHERE sessionId = :sessionId")
    fun getSession(sessionId: String): Flow<CollaborativeSession?>

    @Query("SELECT * FROM collaborative_sessions WHERE status = :status ORDER BY createdAt DESC")
    fun getSessionsByStatus(status: SessionStatus): Flow<List<CollaborativeSession>>

    @Query("SELECT * FROM collaborative_sessions WHERE hostDeviceId = :deviceId ORDER BY createdAt DESC")
    fun getSessionsByHost(deviceId: String): Flow<List<CollaborativeSession>>

    @Query("SELECT * FROM collaborative_sessions WHERE status IN (:statuses) ORDER BY createdAt DESC")
    fun getActiveSessions(statuses: List<SessionStatus>): Flow<List<CollaborativeSession>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSession(session: CollaborativeSession)

    @Update
    suspend fun updateSession(session: CollaborativeSession)

    @Query("UPDATE collaborative_sessions SET status = :status WHERE sessionId = :sessionId")
    suspend fun updateSessionStatus(sessionId: String, status: SessionStatus)

    @Query("UPDATE collaborative_sessions SET currentTrackIndex = :index, isPlaying = :isPlaying WHERE sessionId = :sessionId")
    suspend fun updatePlaybackState(sessionId: String, index: Int, isPlaying: Boolean)

    @Delete
    suspend fun deleteSession(session: CollaborativeSession)

    @Query("DELETE FROM collaborative_sessions WHERE sessionId = :sessionId")
    suspend fun deleteSessionById(sessionId: String)

    // Client operations
    @Query("SELECT * FROM session_clients WHERE sessionId = :sessionId AND isConnected = 1")
    fun getConnectedClients(sessionId: String): Flow<List<SessionClient>>

    @Query("SELECT * FROM session_clients WHERE clientId = :clientId")
    fun getClient(clientId: String): Flow<SessionClient?>

    @Query("SELECT COUNT(*) FROM session_clients WHERE sessionId = :sessionId AND isConnected = 1")
    suspend fun getConnectedClientCount(sessionId: String): Int

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertClient(client: SessionClient)

    @Update
    suspend fun updateClient(client: SessionClient)

    @Query("UPDATE session_clients SET isConnected = 0 WHERE clientId = :clientId")
    suspend fun disconnectClient(clientId: String)

    @Query("UPDATE session_clients SET lastActiveAt = :timestamp WHERE clientId = :clientId")
    suspend fun updateClientActivity(clientId: String, timestamp: Long)

    @Delete
    suspend fun deleteClient(client: SessionClient)

    // Queue operations
    @Query("SELECT * FROM session_queue_items WHERE sessionId = :sessionId AND status = :status ORDER BY position ASC")
    fun getQueueItems(sessionId: String, status: QueueItemStatus): Flow<List<SessionQueueItem>>

    @Query("SELECT * FROM session_queue_items WHERE sessionId = :sessionId ORDER BY position ASC")
    fun getAllQueueItems(sessionId: String): Flow<List<SessionQueueItem>>

    @Query("SELECT * FROM session_queue_items WHERE id = :itemId")
    fun getQueueItem(itemId: Long): Flow<SessionQueueItem?>

    @Query("SELECT * FROM session_queue_items WHERE sessionId = :sessionId AND status = :status ORDER BY votes DESC, addedAt ASC LIMIT :limit")
    fun getTopVotedItems(sessionId: String, status: QueueItemStatus, limit: Int): Flow<List<SessionQueueItem>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertQueueItem(item: SessionQueueItem): Long

    @Update
    suspend fun updateQueueItem(item: SessionQueueItem)

    @Query("UPDATE session_queue_items SET status = :status WHERE id = :itemId")
    suspend fun updateQueueItemStatus(itemId: Long, status: QueueItemStatus)

    @Query("UPDATE session_queue_items SET votes = votes + 1 WHERE id = :itemId")
    suspend fun incrementVotes(itemId: Long)

    @Query("UPDATE session_queue_items SET votes = votes - 1 WHERE id = :itemId")
    suspend fun decrementVotes(itemId: Long)

    @Query("UPDATE session_queue_items SET position = :position WHERE id = :itemId")
    suspend fun updateQueuePosition(itemId: Long, position: Int)

    @Delete
    suspend fun deleteQueueItem(item: SessionQueueItem)

    @Query("DELETE FROM session_queue_items WHERE sessionId = :sessionId")
    suspend fun clearQueue(sessionId: String)

    // Vote operations
    @Query("SELECT * FROM session_votes WHERE sessionId = :sessionId AND queueItemId = :itemId")
    fun getVotesForItem(sessionId: String, itemId: Long): Flow<List<SessionVote>>

    @Query("SELECT COUNT(*) FROM session_votes WHERE sessionId = :sessionId AND queueItemId = :itemId AND voteType = :voteType")
    suspend fun getVoteCount(sessionId: String, itemId: Long, voteType: VoteType): Int

    @Query("SELECT * FROM session_votes WHERE clientId = :clientId AND queueItemId = :itemId")
    suspend fun getClientVoteForItem(clientId: String, itemId: Long): SessionVote?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertVote(vote: SessionVote)

    @Delete
    suspend fun deleteVote(vote: SessionVote)

    @Query("DELETE FROM session_votes WHERE sessionId = :sessionId AND clientId = :clientId AND queueItemId = :itemId")
    suspend fun deleteVoteByIds(sessionId: String, clientId: String, itemId: Long)

    // Cleanup operations
    @Query("DELETE FROM session_clients WHERE sessionId = :sessionId")
    suspend fun deleteAllClients(sessionId: String)

    @Query("DELETE FROM session_votes WHERE sessionId = :sessionId")
    suspend fun deleteAllVotes(sessionId: String)

    @Query("UPDATE session_clients SET isConnected = 0 WHERE sessionId = :sessionId AND lastActiveAt < :timeout")
    suspend fun disconnectInactiveClients(sessionId: String, timeout: Long)

    // Statistics
    @Query("SELECT COUNT(*) FROM session_queue_items WHERE sessionId = :sessionId AND addedBy = :clientId")
    suspend fun getClientTrackCount(sessionId: String, clientId: String): Int

    @Query("SELECT COUNT(*) FROM session_votes WHERE sessionId = :sessionId AND clientId = :clientId")
    suspend fun getClientVoteCount(sessionId: String, clientId: String): Int
}
