package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.MaintenanceChange
import kotlinx.coroutines.flow.Flow

@Dao
interface MaintenanceChangeDao {
    @Query("SELECT * FROM maintenance_changes WHERE status = :status ORDER BY createdAt DESC")
    fun getByStatus(status: String = "PENDING"): Flow<List<MaintenanceChange>>

    @Query("SELECT * FROM maintenance_changes ORDER BY createdAt DESC")
    fun getAll(): Flow<List<MaintenanceChange>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(change: MaintenanceChange): Long

    @Update
    suspend fun update(change: MaintenanceChange)

    @Query("UPDATE maintenance_changes SET status = :status, decidedAt = strftime('%s','now')*1000 WHERE changeId = :changeId")
    suspend fun setStatus(changeId: Long, status: String)

    @Query("DELETE FROM maintenance_changes WHERE changeId = :changeId")
    suspend fun delete(changeId: Long)
}

