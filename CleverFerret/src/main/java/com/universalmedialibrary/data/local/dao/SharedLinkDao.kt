package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.SharedLink
import kotlinx.coroutines.flow.Flow

@Dao
interface SharedLinkDao {
    @Query("SELECT * FROM shared_links WHERE token = :token AND enabled = 1 AND (expiresAt IS NULL OR expiresAt > strftime('%s','now')*1000)")
    suspend fun getByToken(token: String): SharedLink?

    @Query("SELECT * FROM shared_links WHERE targetType = :type AND targetId = :id ORDER BY createdAt DESC")
    fun getForTarget(type: String, id: Long): Flow<List<SharedLink>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(link: SharedLink): Long

    @Query("UPDATE shared_links SET enabled = :enabled WHERE id = :id")
    suspend fun setEnabled(id: Long, enabled: Boolean)

    @Delete
    suspend fun delete(link: SharedLink)
}
