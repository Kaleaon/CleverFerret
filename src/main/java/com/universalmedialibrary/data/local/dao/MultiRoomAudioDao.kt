package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow

@Dao
interface AudioSyncServerDao {
    
    @Query("SELECT * FROM audio_sync_servers ORDER BY serverName ASC")
    fun getAllServers(): Flow<List<AudioSyncServer>>
    
    @Query("SELECT * FROM audio_sync_servers WHERE enabled = 1")
    fun getEnabledServers(): Flow<List<AudioSyncServer>>
    
    @Query("SELECT * FROM audio_sync_servers WHERE serverId = :serverId")
    suspend fun getServerById(serverId: Long): AudioSyncServer?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertServer(server: AudioSyncServer): Long
    
    @Update
    suspend fun updateServer(server: AudioSyncServer)
    
    @Delete
    suspend fun deleteServer(server: AudioSyncServer)
    
    @Query("UPDATE audio_sync_servers SET enabled = :enabled WHERE serverId = :serverId")
    suspend fun setServerEnabled(serverId: Long, enabled: Boolean)
}

@Dao
interface AudioSyncClientDao {
    
    @Query("SELECT * FROM audio_sync_clients WHERE serverId = :serverId ORDER BY clientName ASC")
    fun getClientsByServerId(serverId: Long): Flow<List<AudioSyncClient>>
    
    @Query("SELECT * FROM audio_sync_clients WHERE groupId = :groupId")
    fun getClientsByGroupId(groupId: Long): Flow<List<AudioSyncClient>>
    
    @Query("SELECT * FROM audio_sync_clients WHERE clientId = :clientId")
    suspend fun getClientByClientId(clientId: String): AudioSyncClient?
    
    @Query("SELECT * FROM audio_sync_clients WHERE serverId = :serverId AND connected = 1")
    fun getConnectedClients(serverId: Long): Flow<List<AudioSyncClient>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertClient(client: AudioSyncClient): Long
    
    @Update
    suspend fun updateClient(client: AudioSyncClient)
    
    @Delete
    suspend fun deleteClient(client: AudioSyncClient)
    
    @Query("UPDATE audio_sync_clients SET connected = :connected, lastSeen = :lastSeen WHERE clientId = :clientId")
    suspend fun updateClientConnection(clientId: String, connected: Boolean, lastSeen: Long)
    
    @Query("UPDATE audio_sync_clients SET volume = :volume WHERE id = :id")
    suspend fun updateClientVolume(id: Long, volume: Int)
    
    @Query("UPDATE audio_sync_clients SET muted = :muted WHERE id = :id")
    suspend fun updateClientMuted(id: Long, muted: Boolean)
    
    @Query("UPDATE audio_sync_clients SET groupId = :groupId WHERE id = :id")
    suspend fun updateClientGroup(id: Long, groupId: Long?)
}

@Dao
interface AudioSyncGroupDao {
    
    @Query("SELECT * FROM audio_sync_groups WHERE serverId = :serverId ORDER BY groupName ASC")
    fun getGroupsByServerId(serverId: Long): Flow<List<AudioSyncGroup>>
    
    @Query("SELECT * FROM audio_sync_groups WHERE groupId = :groupId")
    suspend fun getGroupById(groupId: Long): AudioSyncGroup?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertGroup(group: AudioSyncGroup): Long
    
    @Update
    suspend fun updateGroup(group: AudioSyncGroup)
    
    @Delete
    suspend fun deleteGroup(group: AudioSyncGroup)
    
    @Query("UPDATE audio_sync_groups SET volume = :volume WHERE groupId = :groupId")
    suspend fun updateGroupVolume(groupId: Long, volume: Int)
    
    @Query("UPDATE audio_sync_groups SET muted = :muted WHERE groupId = :groupId")
    suspend fun updateGroupMuted(groupId: Long, muted: Boolean)
}

@Dao
interface AudioStreamDao {
    
    @Query("SELECT * FROM audio_streams WHERE serverId = :serverId ORDER BY streamName ASC")
    fun getStreamsByServerId(serverId: Long): Flow<List<AudioStream>>
    
    @Query("SELECT * FROM audio_streams WHERE streamId = :streamId")
    suspend fun getStreamById(streamId: Long): AudioStream?
    
    @Query("SELECT * FROM audio_streams WHERE serverId = :serverId AND enabled = 1")
    fun getEnabledStreams(serverId: Long): Flow<List<AudioStream>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertStream(stream: AudioStream): Long
    
    @Update
    suspend fun updateStream(stream: AudioStream)
    
    @Delete
    suspend fun deleteStream(stream: AudioStream)
    
    @Query("UPDATE audio_streams SET playing = :playing WHERE streamId = :streamId")
    suspend fun updateStreamPlayingState(streamId: Long, playing: Boolean)
}

@Dao
interface SyncStatisticsDao {
    
    @Query("SELECT * FROM sync_statistics WHERE clientId = :clientId ORDER BY timestamp DESC LIMIT :limit")
    fun getStatsByClientId(clientId: String, limit: Int = 100): Flow<List<SyncStatistics>>
    
    @Query("SELECT * FROM sync_statistics WHERE timestamp BETWEEN :startTime AND :endTime ORDER BY timestamp DESC")
    fun getStatsInTimeRange(startTime: Long, endTime: Long): Flow<List<SyncStatistics>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertStats(stats: SyncStatistics): Long
    
    @Query("DELETE FROM sync_statistics WHERE timestamp < :timestamp")
    suspend fun deleteOldStats(timestamp: Long)
    
    @Query("SELECT AVG(timeDeviationMs) FROM sync_statistics WHERE clientId = :clientId AND timestamp > :since")
    suspend fun getAverageDeviation(clientId: String, since: Long): Float?
}