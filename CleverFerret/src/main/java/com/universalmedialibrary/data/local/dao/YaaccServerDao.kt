package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.YaaccServer
import kotlinx.coroutines.flow.Flow

/**
 * DAO for YAACC (DLNA/UPnP) server database operations
 */
@Dao
interface YaaccServerDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(server: YaaccServer): Long

    @Update
    suspend fun update(server: YaaccServer)

    @Delete
    suspend fun delete(server: YaaccServer)

    @Query("SELECT * FROM yaacc_servers WHERE id = :id")
    suspend fun getById(id: Long): YaaccServer?

    @Query("SELECT * FROM yaacc_servers WHERE udn = :udn")
    suspend fun getByUdn(udn: String): YaaccServer?

    @Query("SELECT * FROM yaacc_servers WHERE host = :host AND port = :port")
    suspend fun getByHostPort(host: String, port: Int): YaaccServer?

    @Query("SELECT * FROM yaacc_servers ORDER BY name ASC")
    fun getAll(): Flow<List<YaaccServer>>

    @Query("SELECT * FROM yaacc_servers WHERE isActive = 1 ORDER BY lastSynced DESC")
    fun getActiveServers(): Flow<List<YaaccServer>>

    @Query("UPDATE yaacc_servers SET isActive = :isActive WHERE id = :id")
    suspend fun updateActiveStatus(id: Long, isActive: Boolean)

    @Query("UPDATE yaacc_servers SET lastSynced = :timestamp WHERE id = :id")
    suspend fun updateLastSynced(id: Long, timestamp: Long)

    @Query("DELETE FROM yaacc_servers WHERE id = :id")
    suspend fun deleteById(id: Long)

    @Query("SELECT COUNT(*) FROM yaacc_servers")
    suspend fun getServerCount(): Int

    @Query("SELECT * FROM yaacc_servers WHERE isActive = 1 LIMIT 1")
    suspend fun getFirstActiveServer(): YaaccServer?
}
