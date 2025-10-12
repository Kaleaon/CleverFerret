package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.EmbyServerDao
import com.universalmedialibrary.data.local.dao.JellyfinServerDao
import com.universalmedialibrary.data.local.dao.PlexServerDao
import com.universalmedialibrary.data.local.entity.EmbyServer
import com.universalmedialibrary.data.local.entity.JellyfinServer
import com.universalmedialibrary.data.local.entity.PlexServer
import com.universalmedialibrary.services.integration.api.ApiManager
import com.universalmedialibrary.services.integration.jellyfin.JellyfinClient
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MediaServerSettingsViewModel @Inject constructor(
    private val jellyfinServerDao: JellyfinServerDao,
    private val plexServerDao: PlexServerDao,
    private val embyServerDao: EmbyServerDao,
    private val jellyfinClient: JellyfinClient,
    private val apiManager: ApiManager
) : ViewModel() {

    private val _uiState = MutableStateFlow(MediaServerSettingsUiState())
    val uiState: StateFlow<MediaServerSettingsUiState> = _uiState.asStateFlow()

    init {
        loadServers()
    }

    private fun loadServers() {
        viewModelScope.launch {
            jellyfinServerDao.getAllServers().collect { servers ->
                _uiState.update { it.copy(jellyfinServers = servers.map { server ->
                    ServerInfo(
                        id = server.id,
                        name = server.name,
                        url = server.url,
                        isConnected = server.isConnected,
                        type = ServerType.JELLYFIN
                    )
                }) }
            }
        }

        viewModelScope.launch {
            plexServerDao.getAllServers().collect { servers ->
                _uiState.update { it.copy(plexServers = servers.map { server ->
                    ServerInfo(
                        id = server.id,
                        name = server.name,
                        url = server.url,
                        isConnected = server.isConnected,
                        type = ServerType.PLEX
                    )
                }) }
            }
        }

        viewModelScope.launch {
            embyServerDao.getAllServers().collect { servers ->
                _uiState.update { it.copy(embyServers = servers.map { server ->
                    ServerInfo(
                        id = server.id,
                        name = server.name,
                        url = server.url,
                        isConnected = server.isConnected,
                        type = ServerType.EMBY
                    )
                }) }
            }
        }
    }

    fun addServer(
        type: ServerType,
        name: String,
        url: String,
        username: String,
        password: String,
        apiKey: String
    ) {
        viewModelScope.launch {
            when (type) {
                ServerType.JELLYFIN -> {
                    val server = JellyfinServer(
                        name = name,
                        url = url.trimEnd('/'),
                        username = username,
                        password = password,
                        isConnected = false
                    )
                    jellyfinServerDao.insertServer(server)
                    
                    // Test connection
                    val result = jellyfinClient.authenticate(url, username, password)
                    if (result.isSuccess) {
                        jellyfinServerDao.updateServer(server.copy(
                            isConnected = true,
                            apiKey = result.getOrNull()
                        ))
                    }
                }
                ServerType.PLEX -> {
                    val server = PlexServer(
                        name = name,
                        url = url.trimEnd('/'),
                        token = apiKey,
                        isConnected = false
                    )
                    plexServerDao.insertServer(server)
                    
                    // Test connection
                    try {
                        val api = apiManager.createPlexApi(url, apiKey)
                        val info = api.getServerInfo()
                        plexServerDao.updateServer(server.copy(isConnected = true))
                    } catch (e: Exception) {
                        // Connection failed
                    }
                }
                ServerType.EMBY -> {
                    val server = EmbyServer(
                        name = name,
                        url = url.trimEnd('/'),
                        username = username,
                        password = password,
                        isConnected = false
                    )
                    embyServerDao.insertServer(server)
                    
                    // Test connection could be added here
                }
            }
        }
    }

    fun testConnection(server: ServerInfo) {
        viewModelScope.launch {
            when (server.type) {
                ServerType.JELLYFIN -> {
                    val jellyfinServer = jellyfinServerDao.getServerById(server.id)
                    jellyfinServer?.let {
                        val result = jellyfinClient.authenticate(
                            it.url,
                            it.username,
                            it.password
                        )
                        jellyfinServerDao.updateServer(it.copy(
                            isConnected = result.isSuccess,
                            apiKey = result.getOrNull()
                        ))
                    }
                }
                ServerType.PLEX -> {
                    val plexServer = plexServerDao.getServerById(server.id)
                    plexServer?.let {
                        try {
                            val api = apiManager.createPlexApi(it.url, it.token)
                            api.getServerInfo()
                            plexServerDao.updateServer(it.copy(isConnected = true))
                        } catch (e: Exception) {
                            plexServerDao.updateServer(it.copy(isConnected = false))
                        }
                    }
                }
                ServerType.EMBY -> {
                    // Emby connection test could be added here
                }
            }
        }
    }

    fun deleteServer(server: ServerInfo) {
        viewModelScope.launch {
            when (server.type) {
                ServerType.JELLYFIN -> jellyfinServerDao.deleteServerById(server.id)
                ServerType.PLEX -> plexServerDao.deleteServerById(server.id)
                ServerType.EMBY -> embyServerDao.deleteServerById(server.id)
            }
        }
    }
}

data class MediaServerSettingsUiState(
    val jellyfinServers: List<ServerInfo> = emptyList(),
    val plexServers: List<ServerInfo> = emptyList(),
    val embyServers: List<ServerInfo> = emptyList()
)

data class ServerInfo(
    val id: Long,
    val name: String,
    val url: String,
    val isConnected: Boolean,
    val type: ServerType
)