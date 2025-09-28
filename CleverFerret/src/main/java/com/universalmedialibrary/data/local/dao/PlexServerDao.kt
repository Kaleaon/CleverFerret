package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.PlexServer
import kotlinx.coroutines.flow.Flow

@Dao
interface PlexServerDao {
    
    @Query("SELECT * FROM plex_servers WHERE isActive = 1")
    fun getAllActiveServers(): Flow<List<PlexServer>>
    
    @Query("SELECT * FROM plex_servers WHERE serverId = :serverId")
    suspend fun getServerById(serverId: Long): PlexServer?
    
    @Query("SELECT * FROM plex_servers WHERE host = :host AND port = :port")
    suspend fun getServerByAddress(host: String, port: Int): PlexServer?
    
    @Query("SELECT * FROM plex_servers WHERE machineIdentifier = :machineId")
    suspend fun getServerByMachineId(machineId: String): PlexServer?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertServer(server: PlexServer): Long
    
    @Update
    suspend fun updateServer(server: PlexServer)
    
    @Delete
    suspend fun deleteServer(server: PlexServer)
    
    @Query("UPDATE plex_servers SET lastConnected = :timestamp WHERE serverId = :serverId")
    suspend fun updateLastConnected(serverId: Long, timestamp: Long)
    
    @Query("UPDATE plex_servers SET lastSynced = :timestamp WHERE serverId = :serverId") 
    suspend fun updateLastSynced(serverId: Long, timestamp: Long)
}