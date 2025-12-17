package com.universalmedialibrary.services.audio

import com.universalmedialibrary.data.local.dao.AudioStreamDao
import com.universalmedialibrary.data.local.dao.AudioSyncClientDao
import com.universalmedialibrary.data.local.dao.AudioSyncGroupDao
import com.universalmedialibrary.data.local.dao.AudioSyncServerDao
import com.universalmedialibrary.data.local.dao.SyncStatisticsDao
import com.universalmedialibrary.data.local.entity.AudioStream
import com.universalmedialibrary.data.local.entity.AudioSyncClient
import com.universalmedialibrary.data.local.entity.AudioSyncGroup
import com.universalmedialibrary.data.local.entity.AudioSyncServer
import com.universalmedialibrary.data.local.entity.SyncStatistics
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manages multi-room audio synchronization similar to Snapcast.
 */
@Singleton
class MultiRoomAudioService @Inject constructor(
    private val serverDao: AudioSyncServerDao,
    private val clientDao: AudioSyncClientDao,
    private val groupDao: AudioSyncGroupDao,
    private val streamDao: AudioStreamDao,
    private val statsDao: SyncStatisticsDao
) {

    fun getAllServers(): Flow<List<AudioSyncServer>> = serverDao.getAllServers()

    suspend fun addServer(server: AudioSyncServer): Long = serverDao.insertServer(server)

    suspend fun updateServer(server: AudioSyncServer) = serverDao.updateServer(server)

    suspend fun deleteServer(server: AudioSyncServer) = serverDao.deleteServer(server)

    suspend fun toggleServer(serverId: Long, enabled: Boolean) =
        serverDao.setServerEnabled(serverId, enabled)

    fun getClientsByServer(serverId: Long): Flow<List<AudioSyncClient>> =
        clientDao.getClientsByServerId(serverId)

    fun getConnectedClients(serverId: Long): Flow<List<AudioSyncClient>> =
        clientDao.getConnectedClients(serverId)

    suspend fun addClient(client: AudioSyncClient): Long = clientDao.insertClient(client)

    suspend fun updateClient(client: AudioSyncClient) = clientDao.updateClient(client)

    suspend fun updateClientConnection(clientId: String, connected: Boolean) =
        clientDao.updateClientConnection(clientId, connected, System.currentTimeMillis())

    suspend fun setClientVolume(clientId: Long, volume: Int) =
        clientDao.updateClientVolume(clientId, volume.coerceIn(0, 100))

    suspend fun setClientMuted(clientId: Long, muted: Boolean) =
        clientDao.updateClientMuted(clientId, muted)

    suspend fun assignClientToGroup(clientId: Long, groupId: Long?) =
        clientDao.updateClientGroup(clientId, groupId)

    fun getGroupsByServer(serverId: Long): Flow<List<AudioSyncGroup>> =
        groupDao.getGroupsByServerId(serverId)

    suspend fun createGroup(group: AudioSyncGroup): Long = groupDao.insertGroup(group)

    suspend fun updateGroup(group: AudioSyncGroup) = groupDao.updateGroup(group)

    suspend fun deleteGroup(group: AudioSyncGroup) {
        val clients = clientDao.getClientsByGroupId(group.groupId).first()
        clients.forEach { clientDao.updateClientGroup(it.id, null) }
        groupDao.deleteGroup(group)
    }

    suspend fun setGroupVolume(groupId: Long, volume: Int) {
        val clamped = volume.coerceIn(0, 100)
        groupDao.updateGroupVolume(groupId, clamped)

        val clients = clientDao.getClientsByGroupId(groupId).first()
        clients.forEach { clientDao.updateClientVolume(it.id, clamped) }
    }

    suspend fun setGroupMuted(groupId: Long, muted: Boolean) {
        groupDao.updateGroupMuted(groupId, muted)
        val clients = clientDao.getClientsByGroupId(groupId).first()
        clients.forEach { clientDao.updateClientMuted(it.id, muted) }
    }

    fun getStreamsByServer(serverId: Long): Flow<List<AudioStream>> =
        streamDao.getStreamsByServerId(serverId)

    suspend fun addStream(stream: AudioStream): Long = streamDao.insertStream(stream)

    suspend fun updateStream(stream: AudioStream) = streamDao.updateStream(stream)

    suspend fun deleteStream(stream: AudioStream) = streamDao.deleteStream(stream)

    suspend fun setStreamPlaying(streamId: Long, playing: Boolean) =
        streamDao.updateStreamPlayingState(streamId, playing)

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

    fun getSyncStats(clientId: String, limit: Int = 100): Flow<List<SyncStatistics>> =
        statsDao.getStatsByClientId(clientId, limit)

    suspend fun getAverageSyncDeviation(clientId: String, hoursBack: Int = 24): Float? {
        val since = System.currentTimeMillis() - (hoursBack * 60 * 60 * 1000L)
        return statsDao.getAverageDeviation(clientId, since)
    }

    suspend fun cleanupOldStats(daysOld: Int = 7) {
        val timestamp = System.currentTimeMillis() - (daysOld * 24 * 60 * 60 * 1000L)
        statsDao.deleteOldStats(timestamp)
    }

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
    EXCELLENT,
    GOOD,
    FAIR,
    POOR,
    UNKNOWN
}

data class MultiRoomConfig(
    val serverId: Long,
    val groups: List<AudioSyncGroup>,
    val clients: List<AudioSyncClient>,
    val streams: List<AudioStream>
)
