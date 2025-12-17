package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.media.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
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
 * 
 * Note: This is a simplified implementation. Full service integration
 * will be added when authentication services are finalized.
 */
@HiltViewModel
class MediaServerViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(MediaServerSettingsState())
    val uiState: StateFlow<MediaServerSettingsState> = _uiState.asStateFlow()
    
    private val _plexAuthState = MutableStateFlow<PlexAuthUIState>(PlexAuthUIState.Idle)
    val plexAuthState: StateFlow<PlexAuthUIState> = _plexAuthState.asStateFlow()
    
    init {
        loadConnectedServers()
        discoverServers()
    }
    
    private fun loadConnectedServers() {
        viewModelScope.launch {
            // Load saved server configurations from database
            val servers = listOf<MediaServerConfig>()
            _uiState.update { it.copy(connectedServers = servers) }
        }
    }
    
    private fun discoverServers() {
        viewModelScope.launch {
            _uiState.update { it.copy(isScanning = true) }
            
            // Simulate network scan
            delay(1000)
            
            // Return empty list for now
            val discovered = listOf<DiscoveredServer>()
            
            _uiState.update { 
                it.copy(
                    discoveredServers = discovered,
                    isScanning = false
                )
            }
        }
    }
    
    // ==========================================================================
    // PLEX AUTHENTICATION
    // ==========================================================================
    
    fun startPlexAuth() {
        viewModelScope.launch {
            _plexAuthState.value = PlexAuthUIState.RequestingPin
            
            // Simulate PIN request
            delay(1000)
            
            _plexAuthState.value = PlexAuthUIState.WaitingForPin(
                pinCode = "ABCD1234",
                expiresAt = "5 minutes"
            )
        }
    }
    
    fun cancelPlexAuth() {
        _plexAuthState.value = PlexAuthUIState.Idle
    }
    
    // ==========================================================================
    // JELLYFIN/EMBY AUTHENTICATION
    // ==========================================================================
    
    fun connectJellyfin(serverUrl: String, username: String, password: String) {
        viewModelScope.launch {
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
        }
    }
    
    fun connectEmby(serverUrl: String, username: String, password: String) {
        viewModelScope.launch {
            val server = MediaServerConfig(
                id = "emby_${serverUrl.hashCode()}",
                name = "Emby Server",
                type = ServerType.EMBY,
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
        }
    }
    
    // ==========================================================================
    // GENERIC SERVER OPERATIONS
    // ==========================================================================
    
    fun addServer(type: ServerType) {
        // Show add server dialog - handled by UI
    }
    
    fun removeServer(serverId: String) {
        viewModelScope.launch {
            _uiState.update { state ->
                state.copy(
                    connectedServers = state.connectedServers.filter { it.id != serverId }
                )
            }
        }
    }
    
    fun editServer(config: MediaServerConfig) {
        // Navigate to edit screen - handled by UI
    }
    
    fun testConnection(serverId: String) {
        viewModelScope.launch {
            _uiState.update { state ->
                state.copy(
                    connectedServers = state.connectedServers.map {
                        if (it.id == serverId) it.copy(status = ServerStatus.CONNECTING)
                        else it
                    }
                )
            }
            
            // Simulate connection test
            delay(1500)
            
            _uiState.update { state ->
                state.copy(
                    connectedServers = state.connectedServers.map {
                        if (it.id == serverId) it.copy(status = ServerStatus.CONNECTED)
                        else it
                    }
                )
            }
        }
    }
    
    fun syncServer(serverId: String) {
        viewModelScope.launch {
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
