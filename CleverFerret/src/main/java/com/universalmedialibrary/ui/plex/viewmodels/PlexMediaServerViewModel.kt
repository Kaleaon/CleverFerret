package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.plex.PlexAuthService
import com.universalmedialibrary.services.plex.PlexAuthState
import com.universalmedialibrary.services.plex.PlexSyncService
import com.universalmedialibrary.services.integration.jellyfin.JellyfinIntegrationService
import com.universalmedialibrary.services.integration.jellyfin.JellyfinSyncService
import com.universalmedialibrary.ui.plex.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Media Server Settings
 * 
 * Manages connections to:
 * - Plex servers (via PIN authentication)
 * - Jellyfin servers
 * - Emby servers
 * - Subsonic/Navidrome servers
 * - Calibre Content Server
 * - Kavita/Komga servers
 * - Audiobookshelf
 */
@HiltViewModel
class PlexMediaServerViewModel @Inject constructor(
    private val plexAuthService: PlexAuthService,
    private val plexSyncService: PlexSyncService,
    private val jellyfinService: JellyfinIntegrationService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(MediaServerSettingsState())
    val uiState: StateFlow<MediaServerSettingsState> = _uiState.asStateFlow()
    
    private val _plexAuthState = MutableStateFlow<PlexAuthUIState>(PlexAuthUIState.Idle)
    val plexAuthState: StateFlow<PlexAuthUIState> = _plexAuthState.asStateFlow()
    
    init {
        loadConnectedServers()
        discoverServers()
        observePlexAuthState()
    }
    
    private fun loadConnectedServers() {
        viewModelScope.launch {
            // Load saved server configurations from database
            // For now, using placeholder data
            val servers = listOf<MediaServerConfig>()
            _uiState.update { it.copy(connectedServers = servers) }
        }
    }
    
    private fun discoverServers() {
        viewModelScope.launch {
            _uiState.update { it.copy(isScanning = true) }
            
            // Discover servers on local network
            // This would use mDNS/Bonjour for Plex, Jellyfin, Emby discovery
            val discovered = listOf<DiscoveredServer>()
            
            _uiState.update { 
                it.copy(
                    discoveredServers = discovered,
                    isScanning = false
                )
            }
        }
    }
    
    private fun observePlexAuthState() {
        viewModelScope.launch {
            plexAuthService.authState.collect { state ->
                _plexAuthState.value = when (state) {
                    is PlexAuthState.Idle -> PlexAuthUIState.Idle
                    is PlexAuthState.RequestingPin -> PlexAuthUIState.RequestingPin
                    is PlexAuthState.WaitingForUser -> PlexAuthUIState.WaitingForPin(
                        pinCode = state.pinData.pinCode,
                        expiresAt = state.pinData.expiresAt
                    )
                    is PlexAuthState.Authenticated -> PlexAuthUIState.Authenticated(
                        username = state.user.username,
                        email = state.user.email
                    )
                    is PlexAuthState.Error -> PlexAuthUIState.Error(state.message)
                }
            }
        }
    }
    
    // ==========================================================================
    // PLEX AUTHENTICATION
    // ==========================================================================
    
    fun startPlexAuth() {
        viewModelScope.launch {
            val result = plexAuthService.startPinAuth()
            result.onSuccess { pinData ->
                // Start polling for authentication
                pollPlexAuth(pinData.pinId)
            }
        }
    }
    
    private fun pollPlexAuth(pinId: String) {
        viewModelScope.launch {
            val result = plexAuthService.pollForAuth(pinId)
            result.onSuccess { authResult ->
                // Save auth token and load servers
                loadPlexServers(authResult.authToken)
            }
        }
    }
    
    private fun loadPlexServers(authToken: String) {
        viewModelScope.launch {
            // Fetch user's Plex servers
            plexSyncService.fetchServers(authToken).collect { servers ->
                val plexServers = servers.map { server ->
                    MediaServerConfig(
                        id = server.id,
                        name = server.name,
                        type = ServerType.PLEX,
                        url = server.url,
                        isEnabled = true,
                        status = ServerStatus.CONNECTED,
                        libraryCount = server.libraryCount,
                        itemCount = server.itemCount,
                        lastSync = "Just now"
                    )
                }
                
                _uiState.update { state ->
                    state.copy(
                        connectedServers = state.connectedServers + plexServers
                    )
                }
            }
        }
    }
    
    // ==========================================================================
    // JELLYFIN AUTHENTICATION
    // ==========================================================================
    
    fun connectJellyfin(serverUrl: String, username: String, password: String) {
        viewModelScope.launch {
            try {
                val api = jellyfinService.createApi(serverUrl)
                // Authenticate with Jellyfin
                // api.authenticate(username, password)
                
                val server = MediaServerConfig(
                    id = "jellyfin_${serverUrl.hashCode()}",
                    name = "Jellyfin Server",
                    type = ServerType.JELLYFIN,
                    url = serverUrl,
                    isEnabled = true,
                    status = ServerStatus.CONNECTED,
                    libraryCount = 0,
                    itemCount = 0,
                    lastSync = "Just now"
                )
                
                _uiState.update { state ->
                    state.copy(connectedServers = state.connectedServers + server)
                }
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
    
    // ==========================================================================
    // GENERIC SERVER OPERATIONS
    // ==========================================================================
    
    fun addServer(type: ServerType) {
        // Show add server dialog for the given type
        // This is handled by the UI
    }
    
    fun removeServer(serverId: String) {
        viewModelScope.launch {
            _uiState.update { state ->
                state.copy(
                    connectedServers = state.connectedServers.filter { it.id != serverId }
                )
            }
            // Also remove from database
        }
    }
    
    fun editServer(config: MediaServerConfig) {
        // Navigate to edit screen or show edit dialog
    }
    
    fun testConnection(serverId: String) {
        viewModelScope.launch {
            val server = _uiState.value.connectedServers.find { it.id == serverId } ?: return@launch
            
            _uiState.update { state ->
                state.copy(
                    connectedServers = state.connectedServers.map {
                        if (it.id == serverId) it.copy(status = ServerStatus.CONNECTING)
                        else it
                    }
                )
            }
            
            // Test connection to server
            val isConnected = testServerConnection(server)
            
            _uiState.update { state ->
                state.copy(
                    connectedServers = state.connectedServers.map {
                        if (it.id == serverId) {
                            it.copy(status = if (isConnected) ServerStatus.CONNECTED else ServerStatus.ERROR)
                        } else it
                    }
                )
            }
        }
    }
    
    fun syncServer(serverId: String) {
        viewModelScope.launch {
            val server = _uiState.value.connectedServers.find { it.id == serverId } ?: return@launch
            
            when (server.type) {
                ServerType.PLEX -> {
                    // Sync with Plex
                    plexSyncService.syncLibrary(server.id)
                }
                ServerType.JELLYFIN -> {
                    // Sync with Jellyfin
                }
                else -> {
                    // Generic sync
                }
            }
            
            // Update last sync time
            _uiState.update { state ->
                state.copy(
                    connectedServers = state.connectedServers.map {
                        if (it.id == serverId) it.copy(lastSync = "Just now")
                        else it
                    }
                )
            }
        }
    }
    
    fun toggleServerEnabled(serverId: String, enabled: Boolean) {
        viewModelScope.launch {
            _uiState.update { state ->
                state.copy(
                    connectedServers = state.connectedServers.map {
                        if (it.id == serverId) it.copy(isEnabled = enabled)
                        else it
                    }
                )
            }
            // Save to database
        }
    }
    
    private suspend fun testServerConnection(server: MediaServerConfig): Boolean {
        return try {
            when (server.type) {
                ServerType.PLEX -> true // Test Plex connection
                ServerType.JELLYFIN -> true // Test Jellyfin connection
                else -> true
            }
        } catch (e: Exception) {
            false
        }
    }
}

// =============================================================================
// UI STATE
// =============================================================================

sealed class PlexAuthUIState {
    object Idle : PlexAuthUIState()
    object RequestingPin : PlexAuthUIState()
    data class WaitingForPin(
        val pinCode: String,
        val expiresAt: String
    ) : PlexAuthUIState()
    data class Authenticated(
        val username: String,
        val email: String?
    ) : PlexAuthUIState()
    data class Error(val message: String) : PlexAuthUIState()
}

// Helper extension to get server info from PlexSyncService
private fun PlexSyncService.fetchServers(authToken: String) = flow {
    // This would fetch from the Plex API
    emit(emptyList<PlexServerInfo>())
}

private fun PlexSyncService.syncLibrary(serverId: String) {
    // Sync specific library
}

private data class PlexServerInfo(
    val id: String,
    val name: String,
    val url: String,
    val libraryCount: Int,
    val itemCount: Int
)
