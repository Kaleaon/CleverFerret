package com.universalmedialibrary.ui.integration

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.EmbyServer
import com.universalmedialibrary.data.local.entity.JellyfinServer
import com.universalmedialibrary.services.integration.emby.EmbySyncService
import com.universalmedialibrary.services.integration.jellyfin.JellyfinSyncService
import com.universalmedialibrary.services.integration.plex.PlexIntegrationService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ServerIntegrationViewModel @Inject constructor(
    private val plexService: PlexIntegrationService,
    private val jellyfinService: JellyfinSyncService,
    private val embyService: EmbySyncService
) : ViewModel() {

    private val _uiState = MutableStateFlow(ServerIntegrationState())
    val uiState: StateFlow<ServerIntegrationState> = _uiState.asStateFlow()

    init {
        loadConnectedServers()
    }

    private fun loadConnectedServers() {
        viewModelScope.launch {
            combine(
                plexService.plexState,
                jellyfinService.syncState,
                embyService.syncState
            ) { plexState, jellyfinState, embyState ->
                ServerIntegrationState(
                    plexServers = listOfNotNull(plexState.connectedServer),
                    jellyfinServers = listOfNotNull(jellyfinState.currentServer),
                    embyServers = listOfNotNull(embyState.currentServer)
                )
            }.collect { state ->
                _uiState.value = state
            }
        }
    }

    // Plex operations
    fun authenticatePlex(url: String, username: String, password: String) {
        viewModelScope.launch {
            // Plex uses PIN-based auth, this is a simplified version
            // In reality, would need to implement PIN flow
            plexService.requestPIN()
        }
    }

    fun syncPlexServer(serverId: Long) {
        viewModelScope.launch {
            plexService.syncLibraries()
        }
    }

    fun disconnectPlexServer(serverId: Long) {
        viewModelScope.launch {
            plexService.disconnectServer()
        }
    }

    // Jellyfin operations
    fun authenticateJellyfin(url: String, username: String, password: String) {
        viewModelScope.launch {
            jellyfinService.authenticateServer(url, username, password)
        }
    }

    fun syncJellyfinServer(serverId: Long) {
        viewModelScope.launch {
            _uiState.value.jellyfinServers.find { it.serverId == serverId }?.let { server ->
                jellyfinService.syncLibraries(server)
            }
        }
    }

    fun disconnectJellyfinServer(serverId: Long) {
        viewModelScope.launch {
            jellyfinService.disconnectServer()
        }
    }

    // Emby operations
    fun authenticateEmby(url: String, username: String, password: String) {
        viewModelScope.launch {
            embyService.authenticateServer(url, username, password)
        }
    }

    fun syncEmbyServer(serverId: Long) {
        viewModelScope.launch {
            _uiState.value.embyServers.find { it.serverId == serverId }?.let { server ->
                embyService.syncLibraries(server)
            }
        }
    }

    fun disconnectEmbyServer(serverId: Long) {
        viewModelScope.launch {
            embyService.disconnectServer()
        }
    }
}

data class ServerIntegrationState(
    val plexServers: List<com.universalmedialibrary.data.local.entity.PlexServer> = emptyList(),
    val jellyfinServers: List<JellyfinServer> = emptyList(),
    val embyServers: List<EmbyServer> = emptyList()
) {
    val hasConnectedServers: Boolean
        get() = plexServers.isNotEmpty() || jellyfinServers.isNotEmpty() || embyServers.isNotEmpty()
}