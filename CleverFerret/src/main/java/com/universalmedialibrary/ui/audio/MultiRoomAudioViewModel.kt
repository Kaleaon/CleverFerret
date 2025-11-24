package com.universalmedialibrary.ui.audio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.AudioSyncClient
import com.universalmedialibrary.data.local.entity.AudioSyncGroup
import com.universalmedialibrary.data.local.entity.AudioSyncServer
import com.universalmedialibrary.data.local.entity.SyncStatistics
import com.universalmedialibrary.services.audio.MultiRoomAudioService
import com.universalmedialibrary.services.audio.SyncQuality
import dagger.hilt.android.lifecycle.HiltViewModel
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
    private val multiRoomAudioService: MultiRoomAudioService
) : ViewModel() {

    private val _uiState = MutableStateFlow(MultiRoomAudioUiState())
    val uiState: StateFlow<MultiRoomAudioUiState> = _uiState.asStateFlow()

    init {
        loadData()
    }

    private fun loadData() {
        val serversFlow = multiRoomAudioService.getAllServers()
        // We assume for this UI we might want to see all clients/groups across all servers, 
        // or we could structure it by selected server. For simplicity, let's just load the first server's data if available,
        // or maybe we need a more complex flow combination if we want to show a dashboard.
        
        // Strategy: Observe servers. If servers exist, observe clients/groups for the "selected" or first server.
        
        serversFlow.onEach { servers ->
            val selectedId = _uiState.value.selectedServerId ?: servers.firstOrNull()?.id
            _uiState.value = _uiState.value.copy(
                servers = servers,
                selectedServerId = selectedId
            )
            
            if (selectedId != null) {
                observeServerDetails(selectedId)
            }
        }.launchIn(viewModelScope)
    }

    private fun observeServerDetails(serverId: Long) {
        combine(
            multiRoomAudioService.getClientsByServer(serverId),
            multiRoomAudioService.getGroupsByServer(serverId)
        ) { clients, groups ->
            _uiState.value = _uiState.value.copy(
                clients = clients,
                groups = groups
            )
        }.launchIn(viewModelScope)
    }

    fun selectServer(serverId: Long) {
        _uiState.value = _uiState.value.copy(selectedServerId = serverId)
        observeServerDetails(serverId)
    }

    fun addServer(name: String, host: String, port: Int) {
        viewModelScope.launch {
            val server = AudioSyncServer(
                name = name,
                host = host,
                port = port,
                isEnabled = true
            )
            multiRoomAudioService.addServer(server)
        }
    }

    fun deleteServer(server: AudioSyncServer) {
        viewModelScope.launch {
            multiRoomAudioService.deleteServer(server)
            if (_uiState.value.selectedServerId == server.id) {
                _uiState.value = _uiState.value.copy(selectedServerId = null, clients = emptyList(), groups = emptyList())
            }
        }
    }

    fun setClientVolume(client: AudioSyncClient, volume: Int) {
        viewModelScope.launch {
            multiRoomAudioService.setClientVolume(client.id, volume)
        }
    }

    fun toggleClientMute(client: AudioSyncClient) {
        viewModelScope.launch {
            multiRoomAudioService.setClientMuted(client.id, !client.isMuted)
        }
    }

    fun createGroup(name: String, clientIds: List<Long>) {
        val serverId = _uiState.value.selectedServerId ?: return
        viewModelScope.launch {
            val group = AudioSyncGroup(
                serverId = serverId,
                name = name,
                volume = 100,
                isMuted = false
            )
            val groupId = multiRoomAudioService.createGroup(group)
            clientIds.forEach { clientId ->
                multiRoomAudioService.assignClientToGroup(clientId, groupId)
            }
        }
    }

    fun deleteGroup(group: AudioSyncGroup) {
        viewModelScope.launch {
            multiRoomAudioService.deleteGroup(group)
        }
    }

    fun setGroupVolume(group: AudioSyncGroup, volume: Int) {
        viewModelScope.launch {
            multiRoomAudioService.setGroupVolume(group.groupId, volume)
        }
    }
    
    fun getClientSyncQuality(client: AudioSyncClient) {
        viewModelScope.launch {
             // This would ideally update a map in UiState
             // For now, we assume real-time stats might be handled differently or lazily
        }
    }
}

data class MultiRoomAudioUiState(
    val servers: List<AudioSyncServer> = emptyList(),
    val selectedServerId: Long? = null,
    val clients: List<AudioSyncClient> = emptyList(),
    val groups: List<AudioSyncGroup> = emptyList(),
    val clientStats: Map<String, SyncStatistics> = emptyMap()
)
