package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.PlexServer
import kotlinx.coroutines.flow.Flow

/**
 * DAO for Plex server database operations
 */
@Dao
interface PlexServerDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertServer(server: PlexServer): Long

    @Update
    suspend fun updateServer(server: PlexServer)

    @Delete
    suspend fun deleteServer(server: PlexServer)

    @Query("SELECT * FROM plex_servers WHERE serverId = :serverId")
    suspend fun getServerById(serverId: Long): PlexServer?

    @Query("SELECT * FROM plex_servers WHERE machineIdentifier = :machineId")
    suspend fun getServerByMachineId(machineId: String): PlexServer?

    @Query("SELECT * FROM plex_servers WHERE host = :host AND port = :port")
    suspend fun getServerByHostPort(host: String, port: Int): PlexServer?

    @Query("SELECT * FROM plex_servers ORDER BY dateAdded DESC")
    fun getAllServers(): Flow<List<PlexServer>>

    @Query("SELECT * FROM plex_servers WHERE isActive = 1 ORDER BY lastConnected DESC")
    fun getActiveServers(): Flow<List<PlexServer>>

    @Query("UPDATE plex_servers SET isActive = :isActive WHERE serverId = :serverId")
    suspend fun updateActiveStatus(serverId: Long, isActive: Boolean)

    @Query("UPDATE plex_servers SET lastConnected = :timestamp WHERE serverId = :serverId")
    suspend fun updateLastConnected(serverId: Long, timestamp: Long)

    @Query("UPDATE plex_servers SET lastSynced = :timestamp WHERE serverId = :serverId")
    suspend fun updateLastSynced(serverId: Long, timestamp: Long)

    @Query("DELETE FROM plex_servers WHERE serverId = :serverId")
    suspend fun deleteServerById(serverId: Long)

    @Query("SELECT COUNT(*) FROM plex_servers")
    suspend fun getServerCount(): Int

    @Query("SELECT * FROM plex_servers WHERE isActive = 1 LIMIT 1")
    suspend fun getFirstActiveServer(): PlexServer?
}
