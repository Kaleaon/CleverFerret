package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.RemoteSyncMutation
import kotlinx.coroutines.flow.Flow

@Dao
interface RemoteSyncMutationDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(mutation: RemoteSyncMutation): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(mutations: List<RemoteSyncMutation>): List<Long>

    @Update
    suspend fun update(mutation: RemoteSyncMutation)

    @Delete
    suspend fun delete(mutation: RemoteSyncMutation)

    @Query("DELETE FROM remote_sync_mutations WHERE id = :id")
    suspend fun deleteById(id: Long)

    @Query("SELECT * FROM remote_sync_mutations WHERE id = :id")
    suspend fun getById(id: Long): RemoteSyncMutation?

    @Query("SELECT * FROM remote_sync_mutations WHERE status != 'COMPLETED' ORDER BY createdAt ASC")
    suspend fun getPendingMutations(): List<RemoteSyncMutation>

    @Query("SELECT * FROM remote_sync_mutations WHERE status != 'COMPLETED' ORDER BY createdAt ASC")
    fun observePendingMutations(): Flow<List<RemoteSyncMutation>>

    @Query("SELECT * FROM remote_sync_mutations WHERE serverType = :serverType AND serverId = :serverId ORDER BY createdAt ASC")
    suspend fun getMutationsForServer(serverType: String, serverId: Long): List<RemoteSyncMutation>

    @Query("UPDATE remote_sync_mutations SET status = :status, retryCount = :retryCount, lastAttemptAt = :lastAttemptAt WHERE id = :id")
    suspend fun updateStatus(id: Long, status: String, retryCount: Int, lastAttemptAt: Long)

    @Query("DELETE FROM remote_sync_mutations WHERE status = 'COMPLETED'")
    suspend fun clearCompleted()
}
