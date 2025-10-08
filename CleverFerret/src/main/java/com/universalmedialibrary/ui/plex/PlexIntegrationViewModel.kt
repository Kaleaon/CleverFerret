package com.universalmedialibrary.ui.plex

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.integration.plex.PlexIntegrationService
import com.universalmedialibrary.services.integration.plex.PlexConnectionResult
import com.universalmedialibrary.services.plex.PlexAuthState
import com.universalmedialibrary.services.plex.PlexDiscoveredServer
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Plex integration UI
 * Handles authentication, server discovery, and connection
 */
@HiltViewModel
class PlexIntegrationViewModel @Inject constructor(
    private val plexService: PlexIntegrationService
) : ViewModel() {

    private val _uiState = MutableStateFlow(PlexIntegrationUiState())
    val uiState: StateFlow<PlexIntegrationUiState> = _uiState.asStateFlow()

    // Observe Plex state from the service
    val plexState = plexService.plexState.stateIn(
        viewModelScope,
        SharingStarted.WhileSubscribed(5000),
        plexService.plexState.value
    )

    init {
        checkAuthStatus()
    }

    /**
     * Check if user is already authenticated
     */
    private fun checkAuthStatus() {
        viewModelScope.launch {
            val isAuthenticated = plexService.isAuthenticated()
            _uiState.value = _uiState.value.copy(
                isAuthenticated = isAuthenticated,
                isLoading = false
            )

            if (isAuthenticated) {
                // Auto-discover servers if already authenticated
                discoverServers()
            }
        }
    }

    /**
     * Start PIN authentication flow
     */
    fun startAuthentication() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isLoading = true,
                error = null
            )

            val result = plexService.requestPIN()

            result.onSuccess { pinData ->
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    pinCode = pinData.pinCode,
                    pinId = pinData.pinId,
                    showPinDialog = true
                )

                // Start polling for authentication
                pollForAuthentication(pinData.pinId)

            }.onFailure { error ->
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to start authentication: ${error.message}"
                )
            }
        }
    }

    /**
     * Poll for authentication completion
     */
    private fun pollForAuthentication(pinId: String) {
        viewModelScope.launch {
            val result = plexService.pollForAuth(pinId)

            result.onSuccess { authResult ->
                _uiState.value = _uiState.value.copy(
                    isAuthenticated = true,
                    showPinDialog = false,
                    pinCode = null,
                    pinId = null,
                    username = authResult.username
                )

                // Automatically discover servers after authentication
                discoverServers()

            }.onFailure { error ->
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    showPinDialog = false,
                    error = "Authentication failed: ${error.message}"
                )
            }
        }
    }

    /**
     * Discover available Plex servers
     */
    fun discoverServers() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isDiscovering = true,
                error = null
            )

            val result = plexService.discoverServers()

            result.onSuccess { servers ->
                _uiState.value = _uiState.value.copy(
                    isDiscovering = false,
                    discoveredServers = servers,
                    error = if (servers.isEmpty()) "No servers found" else null
                )
            }.onFailure { error ->
                _uiState.value = _uiState.value.copy(
                    isDiscovering = false,
                    error = "Failed to discover servers: ${error.message}"
                )
            }
        }
    }

    /**
     * Connect to a discovered server
     */
    fun connectToServer(server: PlexDiscoveredServer) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isConnecting = true,
                error = null
            )

            val result = plexService.connectToDiscoveredServer(server)

            when (result) {
                is PlexConnectionResult.Success -> {
                    _uiState.value = _uiState.value.copy(
                        isConnecting = false,
                        connectedServerName = server.name,
                        connectionSuccess = true
                    )
                }
                is PlexConnectionResult.Error -> {
                    _uiState.value = _uiState.value.copy(
                        isConnecting = false,
                        error = "Failed to connect: ${result.message}"
                    )
                }
            }
        }
    }

    /**
     * Sync libraries from all connected servers
     */
    fun syncLibraries() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isSyncing = true,
                error = null
            )

            try {
                val result = plexService.syncAllLibraries()

                _uiState.value = _uiState.value.copy(
                    isSyncing = false,
                    syncSuccess = result.successful,
                    error = if (!result.successful) "Sync failed" else null
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isSyncing = false,
                    error = "Sync error: ${e.message}"
                )
            }
        }
    }

    /**
     * Sign out from Plex
     */
    fun signOut() {
        plexService.signOut()
        _uiState.value = PlexIntegrationUiState()
    }

    /**
     * Clear error message
     */
    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }

    /**
     * Dismiss PIN dialog
     */
    fun dismissPinDialog() {
        _uiState.value = _uiState.value.copy(showPinDialog = false)
    }
}

/**
 * UI state for Plex integration
 */
data class PlexIntegrationUiState(
    val isLoading: Boolean = true,
    val isAuthenticated: Boolean = false,
    val username: String? = null,

    // PIN authentication
    val showPinDialog: Boolean = false,
    val pinCode: String? = null,
    val pinId: String? = null,

    // Server discovery
    val isDiscovering: Boolean = false,
    val discoveredServers: List<PlexDiscoveredServer> = emptyList(),

    // Server connection
    val isConnecting: Boolean = false,
    val connectedServerName: String? = null,
    val connectionSuccess: Boolean = false,

    // Library sync
    val isSyncing: Boolean = false,
    val syncSuccess: Boolean = false,

    // Error handling
    val error: String? = null
)
