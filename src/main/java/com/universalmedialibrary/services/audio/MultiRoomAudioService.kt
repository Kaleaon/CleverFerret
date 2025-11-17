package com.universalmedialibrary.services.audio

import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing multi-room audio synchronization
 * Inspired by Snapcast's synchronized audio playback
 */
@Singleton
class MultiRoomAudioService @Inject constructor(
    private val serverDao: AudioSyncServerDao,
    private val clientDao: AudioSyncClientDao,
    private val groupDao: AudioSyncGroupDao,
    private val streamDao: AudioStreamDao,
    private val statsDao: SyncStatisticsDao
) {
    
    // Server Management
    
    fun getAllServers(): Flow<List<AudioSyncServer>> {
        return serverDao.getAllServers()
    }
    
    suspend fun addServer(server: AudioSyncServer): Long {
        return serverDao.insertServer(server)
    }
    
    suspend fun updateServer(server: AudioSyncServer) {
        serverDao.updateServer(server)
    }
    
    suspend fun deleteServer(server: AudioSyncServer) {
        serverDao.deleteServer(server)
    }
    
    suspend fun toggleServer(serverId: Long, enabled: Boolean) {
        serverDao.setServerEnabled(serverId, enabled)
    }
    
    // Client Management
    
    fun getClientsByServer(serverId: Long): Flow<List<AudioSyncClient>> {
        return clientDao.getClientsByServerId(serverId)
    }
    
    fun getConnectedClients(serverId: Long): Flow<List<AudioSyncClient>> {
        return clientDao.getConnectedClients(serverId)
    }
    
    suspend fun addClient(client: AudioSyncClient): Long {
        return clientDao.insertClient(client)
    }
    
    suspend fun updateClient(client: AudioSyncClient) {
        clientDao.updateClient(client)
    }
    
    suspend fun updateClientConnection(clientId: String, connected: Boolean) {
        clientDao.updateClientConnection(clientId, connected, System.currentTimeMillis())
    }
    
    suspend fun setClientVolume(clientId: Long, volume: Int) {
        clientDao.updateClientVolume(clientId, volume.coerceIn(0, 100))
    }
    
    suspend fun setClientMuted(clientId: Long, muted: Boolean) {
        clientDao.updateClientMuted(clientId, muted)
    }
    
    suspend fun assignClientToGroup(clientId: Long, groupId: Long?) {
        clientDao.updateClientGroup(clientId, groupId)
    }
    
    // Group Management
    
    fun getGroupsByServer(serverId: Long): Flow<List<AudioSyncGroup>> {
        return groupDao.getGroupsByServerId(serverId)
    }
    
    suspend fun createGroup(group: AudioSyncGroup): Long {
        return groupDao.insertGroup(group)
    }
    
    suspend fun updateGroup(group: AudioSyncGroup) {
        groupDao.updateGroup(group)
    }
    
    suspend fun deleteGroup(group: AudioSyncGroup) {
        // First, unassign all clients from this group
        val clients = clientDao.getClientsByGroupId(group.groupId).first()
        clients.forEach { client ->
            clientDao.updateClientGroup(client.id, null)
        }
        groupDao.deleteGroup(group)
    }
    
    suspend fun setGroupVolume(groupId: Long, volume: Int) {
        groupDao.updateGroupVolume(groupId, volume.coerceIn(0, 100))
        
        // Also update all clients in the group
        val clients = clientDao.getClientsByGroupId(groupId).first()
        clients.forEach { client ->
            clientDao.updateClientVolume(client.id, volume)
        }
    }
    
    suspend fun setGroupMuted(groupId: Long, muted: Boolean) {
        groupDao.updateGroupMuted(groupId, muted)
        
        // Also update all clients in the group
        val clients = clientDao.getClientsByGroupId(groupId).first()
        clients.forEach { client ->
            clientDao.updateClientMuted(client.id, muted)
        }
    }
    
    // Stream Management
    
    fun getStreamsByServer(serverId: Long): Flow<List<AudioStream>> {
        return streamDao.getStreamsByServerId(serverId)
    }
    
    suspend fun addStream(stream: AudioStream): Long {
        return streamDao.insertStream(stream)
    }
    
    suspend fun updateStream(stream: AudioStream) {
        streamDao.updateStream(stream)
    }
    
    suspend fun deleteStream(stream: AudioStream) {
        streamDao.deleteStream(stream)
    }
    
    suspend fun setStreamPlaying(streamId: Long, playing: Boolean) {
        streamDao.updateStreamPlayingState(streamId, playing)
    }
    
    // Synchronization
    
    /**
     * Calculate time synchronization offset for a client
     */
    suspend fun calculateSyncOffset(clientId: String): Long {
        // This would involve:
        // 1. Send timestamp to client
        // 2. Client responds with its timestamp
        // 3. Calculate round-trip time and offset
        // 4. Apply offset to future audio packets
        
        // Placeholder implementation
        return 0L
    }
    
    /**
     * Record sync statistics
     */
    suspend fun recordSyncStats(
        clientId: String,
        timeDeviationMs: Float,
        bufferLevel: Int,
        droppedFrames: Int,
        latencyMs: Int,
        jitterMs: Float,
        packetLoss: Float
    ) {
        val stats = SyncStatistics(
            clientId = clientId,
            timeDeviationMs = timeDeviationMs,
            bufferLevel = bufferLevel,
            droppedFrames = droppedFrames,
            latencyMs = latencyMs,
            jitterMs = jitterMs,
            packetLoss = packetLoss
        )
        statsDao.insertStats(stats)
    }
    
    /**
     * Get sync statistics for a client
     */
    fun getSyncStats(clientId: String, limit: Int = 100): Flow<List<SyncStatistics>> {
        return statsDao.getStatsByClientId(clientId, limit)
    }
    
    /**
     * Get average sync deviation for a client
     */
    suspend fun getAverageSyncDeviation(clientId: String, hoursBack: Int = 24): Float? {
        val since = System.currentTimeMillis() - (hoursBack * 60 * 60 * 1000L)
        return statsDao.getAverageDeviation(clientId, since)
    }
    
    /**
     * Clean up old statistics
     */
    suspend fun cleanupOldStats(daysOld: Int = 7) {
        val timestamp = System.currentTimeMillis() - (daysOld * 24 * 60 * 60 * 1000L)
        statsDao.deleteOldStats(timestamp)
    }
    
    /**
     * Get sync quality for a client
     */
    suspend fun getSyncQuality(clientId: String): SyncQuality {
        val avgDeviation = getAverageSyncDeviation(clientId, 1) ?: return SyncQuality.UNKNOWN
        
        return when {
            avgDeviation < 0.5f -> SyncQuality.EXCELLENT
            avgDeviation < 1.0f -> SyncQuality.GOOD
            avgDeviation < 2.0f -> SyncQuality.FAIR
            else -> SyncQuality.POOR
        }
    }
}

enum class SyncQuality {
    EXCELLENT,  // < 0.5ms deviation
    GOOD,       // < 1.0ms deviation
    FAIR,       // < 2.0ms deviation
    POOR,       // >= 2.0ms deviation
    UNKNOWN
}

/**
 * Multi-room audio configuration
 */
data class MultiRoomConfig(
    val serverId: Long,
    val groups: List<AudioSyncGroup>,
    val clients: List<AudioSyncClient>,
    val streams: List<AudioStream>
)