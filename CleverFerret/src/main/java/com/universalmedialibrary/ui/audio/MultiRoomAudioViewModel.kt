package com.universalmedialibrary.ui.audio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.core.network.DiscoveredLanDevice
import com.universalmedialibrary.core.network.LanDiscoveryService
import com.universalmedialibrary.data.local.entity.AudioSyncClient
import com.universalmedialibrary.data.local.entity.AudioSyncGroup
import com.universalmedialibrary.data.local.entity.AudioSyncServer
import com.universalmedialibrary.data.local.entity.SyncStatistics
import com.universalmedialibrary.feature.audio.PlaybackSynchronizationEngine
import com.universalmedialibrary.services.audio.MultiRoomAudioService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.onEach
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MultiRoomAudioViewModel @Inject constructor(
    private val multiRoomAudioService: MultiRoomAudioService,
    private val lanDiscoveryService: LanDiscoveryService,
    private val syncEngine: PlaybackSynchronizationEngine
) : ViewModel() {

    private val _uiState = MutableStateFlow(MultiRoomAudioUiState())
    val uiState: StateFlow<MultiRoomAudioUiState> = _uiState.asStateFlow()

    private var serverDetailsJob: Job? = null

    init {
        loadData()
    }

    private fun loadData() {
        combine(
            multiRoomAudioService.getAllServers(),
            lanDiscoveryService.discoveredDevices,
            lanDiscoveryService.trustedDeviceIds(),
            syncEngine.state
        ) { servers, discovered, trustedIds, engineState ->
            val selectedId = _uiState.value.selectedServerId ?: servers.firstOrNull()?.serverId
            _uiState.value.copy(
                servers = servers,
                selectedServerId = selectedId,
                discoveredDevices = discovered,
                trustedDeviceIds = trustedIds,
                fallbackToLocalPlayback = engineState.fallbackToLocalPlayback,
                perDeviceDriftMs = engineState.devices.mapValues { it.value.offsetMs },
                perDeviceJitterMs = engineState.devices.mapValues { it.value.jitterMs }
            )
        }.onEach { _uiState.value = it }.launchIn(viewModelScope)

        multiRoomAudioService.getAllServers().onEach { servers ->
            val selectedId = _uiState.value.selectedServerId ?: servers.firstOrNull()?.serverId
            if (selectedId != null) {
                observeServerDetails(selectedId)
            }
        }.launchIn(viewModelScope)
    }

    private fun observeServerDetails(serverId: Long) {
        serverDetailsJob?.cancel()
        serverDetailsJob = combine(
            multiRoomAudioService.getClientsByServer(serverId),
            multiRoomAudioService.getGroupsByServer(serverId)
        ) { clients, groups ->
            _uiState.value = _uiState.value.copy(clients = clients, groups = groups)
        }.launchIn(viewModelScope)
    }

    fun selectServer(serverId: Long) {
        _uiState.value = _uiState.value.copy(selectedServerId = serverId)
        observeServerDetails(serverId)
    }

    fun addServer(name: String, host: String, port: Int) {
        viewModelScope.launch {
            multiRoomAudioService.addServer(AudioSyncServer(serverName = name, serverUrl = host, port = port, enabled = true))
        }
    }

    fun trustDevice(device: DiscoveredLanDevice) {
        viewModelScope.launch { lanDiscoveryService.trustDevice(device.deviceId) }
    }

    fun untrustDevice(device: DiscoveredLanDevice) {
        viewModelScope.launch { lanDiscoveryService.untrustDevice(device.deviceId) }
    }

    fun setClientVolume(client: AudioSyncClient, volume: Int) {
        viewModelScope.launch { multiRoomAudioService.setClientVolume(client.id, volume) }
    }

    fun toggleClientMute(client: AudioSyncClient) {
        viewModelScope.launch { multiRoomAudioService.setClientMuted(client.id, !client.muted) }
    }

    fun createGroup(name: String, clientIds: List<Long>) {
        val serverId = _uiState.value.selectedServerId ?: return
        viewModelScope.launch {
            val groupId = multiRoomAudioService.createGroup(AudioSyncGroup(serverId = serverId, groupName = name, volume = 100, muted = false))
            clientIds.forEach { clientId ->
                multiRoomAudioService.assignClientToGroup(clientId, groupId)
                val client = _uiState.value.clients.firstOrNull { it.id == clientId }
                if (client != null) {
                    syncEngine.joinGroup(client.clientId, name)
                }
            }
            syncEngine.createGroup(name, _uiState.value.clients.filter { it.id in clientIds }.map { it.clientId })
        }
    }

    fun leaveGroup(client: AudioSyncClient, group: AudioSyncGroup) {
        viewModelScope.launch {
            multiRoomAudioService.assignClientToGroup(client.id, null)
            syncEngine.leaveGroup(client.clientId, group.groupName)
        }
    }

    fun setGroupVolume(group: AudioSyncGroup, volume: Int) {
        viewModelScope.launch { multiRoomAudioService.setGroupVolume(group.groupId, volume) }
    }

    fun reportSyncTelemetry(client: AudioSyncClient, driftMs: Double, jitterMs: Double) {
        syncEngine.reportOffset(client.clientId, driftMs, jitterMs, System.currentTimeMillis())
    }

    fun handleTransientDisconnect(client: AudioSyncClient) {
        syncEngine.onDisconnect(client.clientId, System.currentTimeMillis())
    }

    fun autoRejoin(client: AudioSyncClient) {
        syncEngine.autoRejoin(client.clientId)
    }
}

data class MultiRoomAudioUiState(
    val servers: List<AudioSyncServer> = emptyList(),
    val selectedServerId: Long? = null,
    val clients: List<AudioSyncClient> = emptyList(),
    val groups: List<AudioSyncGroup> = emptyList(),
    val clientStats: Map<String, SyncStatistics> = emptyMap(),
    val discoveredDevices: List<DiscoveredLanDevice> = emptyList(),
    val trustedDeviceIds: Set<String> = emptySet(),
    val fallbackToLocalPlayback: Boolean = false,
    val perDeviceDriftMs: Map<String, Double> = emptyMap(),
    val perDeviceJitterMs: Map<String, Double> = emptyMap()
)
