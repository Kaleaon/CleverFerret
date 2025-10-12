package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.EmbyServer
import com.universalmedialibrary.data.local.entity.JellyfinServer
import com.universalmedialibrary.data.local.entity.PlexServer
import com.universalmedialibrary.data.repository.MediaServerRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MediaServerSettingsViewModel @Inject constructor(
    private val mediaServerRepository: MediaServerRepository,
    private val settingsRepository: com.universalmedialibrary.data.repository.SettingsRepository
) : ViewModel() {

    val selectedTheme: StateFlow<com.universalmedialibrary.ui.theme.ThemePalette> = settingsRepository.themeFlow
        .stateIn(
            scope = viewModelScope,
            started = kotlinx.coroutines.flow.SharingStarted.WhileSubscribed(5000),
            initialValue = com.universalmedialibrary.ui.theme.ThemePalette.NAVY_GOLD
        )

    val darkMode: StateFlow<Boolean> = settingsRepository.darkModeFlow
        .stateIn(
            scope = viewModelScope,
            started = kotlinx.coroutines.flow.SharingStarted.WhileSubscribed(5000),
            initialValue = true
        )

    private val _uiState = MutableStateFlow(MediaServerSettingsUiState())
    val uiState: StateFlow<MediaServerSettingsUiState> = _uiState.asStateFlow()

    init {
        loadServers()
    }

    private fun loadServers() {
        viewModelScope.launch {
            mediaServerRepository.getAllJellyfinServers().collect { servers ->
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
            mediaServerRepository.getAllPlexServers().collect { servers ->
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
            mediaServerRepository.getAllEmbyServers().collect { servers ->
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
                    val id = mediaServerRepository.insertJellyfinServer(server)
                    
                    // Test connection
                    val result = mediaServerRepository.testJellyfinConnection(server)
                    if (result.isSuccess) {
                        mediaServerRepository.updateJellyfinServer(server.copy(
                            id = id,
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
                    val id = mediaServerRepository.insertPlexServer(server)
                    
                    // Test connection
                    val result = mediaServerRepository.testPlexConnection(server)
                    if (result.isSuccess) {
                        mediaServerRepository.updatePlexServer(server.copy(
                            id = id,
                            isConnected = true
                        ))
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
                    val id = mediaServerRepository.insertEmbyServer(server)
                    
                    // Test connection
                    val result = mediaServerRepository.testEmbyConnection(server)
                    if (result.isSuccess) {
                        mediaServerRepository.updateEmbyServer(server.copy(
                            id = id,
                            isConnected = true
                        ))
                    }
                }
            }
        }
    }

    fun testConnection(server: ServerInfo) {
        viewModelScope.launch {
            when (server.type) {
                ServerType.JELLYFIN -> {
                    val jellyfinServer = mediaServerRepository.getJellyfinServerById(server.id)
                    jellyfinServer?.let {
                        val result = mediaServerRepository.testJellyfinConnection(it)
                        mediaServerRepository.updateJellyfinServer(it.copy(
                            isConnected = result.isSuccess,
                            apiKey = result.getOrNull()
                        ))
                    }
                }
                ServerType.PLEX -> {
                    val plexServer = mediaServerRepository.getPlexServerById(server.id)
                    plexServer?.let {
                        val result = mediaServerRepository.testPlexConnection(it)
                        mediaServerRepository.updatePlexServer(it.copy(
                            isConnected = result.isSuccess
                        ))
                    }
                }
                ServerType.EMBY -> {
                    val embyServer = mediaServerRepository.getEmbyServerById(server.id)
                    embyServer?.let {
                        val result = mediaServerRepository.testEmbyConnection(it)
                        mediaServerRepository.updateEmbyServer(it.copy(
                            isConnected = result.isSuccess
                        ))
                    }
                }
            }
        }
    }

    fun deleteServer(server: ServerInfo) {
        viewModelScope.launch {
            when (server.type) {
                ServerType.JELLYFIN -> mediaServerRepository.deleteJellyfinServerById(server.id)
                ServerType.PLEX -> mediaServerRepository.deletePlexServerById(server.id)
                ServerType.EMBY -> mediaServerRepository.deleteEmbyServerById(server.id)
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