package com.universalmedialibrary.ui.media

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.plex.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Plex authentication UI
 */
@HiltViewModel
class MediaAuthViewModel @Inject constructor(
    private val authService: PlexAuthService,
    private val plexSyncService: PlexSyncService
) : ViewModel() {

    private val _authState = MutableStateFlow<PlexAuthUiState>(PlexAuthUiState.Idle)
    val authState: StateFlow<PlexAuthUiState> = _authState.asStateFlow()

    private val _discoveredServers = MutableStateFlow<List<PlexDiscoveredServer>>(emptyList())
    val discoveredServers: StateFlow<List<PlexDiscoveredServer>> = _discoveredServers.asStateFlow()

    private var pollingJob: Job? = null

    init {
        // Observe auth service state
        viewModelScope.launch {
            authService.authState.collect { state ->
                _authState.value = when (state) {
                    is PlexAuthState.Idle -> PlexAuthUiState.Idle
                    is PlexAuthState.RequestingPin -> PlexAuthUiState.RequestingPin
                    is PlexAuthState.WaitingForUser -> PlexAuthUiState.WaitingForUser(state.pinData.pinCode)
                    is PlexAuthState.FetchingUserInfo -> PlexAuthUiState.Authenticating
                    is PlexAuthState.Authenticated -> PlexAuthUiState.Authenticated(
                        username = state.result.username,
                        email = state.result.email
                    )
                    is PlexAuthState.DiscoveringServers -> PlexAuthUiState.DiscoveringServers
                    is PlexAuthState.Error -> PlexAuthUiState.Error(state.message)
                }
            }
        }
    }

    /**
     * Start PIN authentication flow
     */
    fun startPinAuth() {
        viewModelScope.launch {
            val result = authService.startPinAuth()

            result.onSuccess { pinData ->
                // Start polling for authentication
                startPolling(pinData.pinId)
            }
        }
    }

    /**
     * Start polling for PIN authentication completion
     */
    private fun startPolling(pinId: String) {
        pollingJob?.cancel()
        pollingJob = viewModelScope.launch {
            authService.pollForAuth(pinId)
        }
    }

    /**
     * Cancel authentication
     */
    fun cancelAuth() {
        pollingJob?.cancel()
        _authState.value = PlexAuthUiState.Idle
    }

    /**
     * Discover available Plex servers
     */
    fun discoverServers() {
        viewModelScope.launch {
            _authState.value = PlexAuthUiState.DiscoveringServers

            val result = authService.discoverServers()

            result.onSuccess { servers ->
                _discoveredServers.value = servers
                _authState.value = PlexAuthUiState.ServersDiscovered(servers.size)
            }.onFailure { error ->
                _authState.value = PlexAuthUiState.Error(error.message ?: "Failed to discover servers")
            }
        }
    }

    /**
     * Select a Plex server to sync
     */
    fun selectServer(server: PlexDiscoveredServer) {
        viewModelScope.launch {
            // Find the best connection (prefer local, then remote)
            val connection = server.connections.firstOrNull { it.local }
                ?: server.connections.firstOrNull()

            if (connection != null) {
                // Add server to database
                val result = plexSyncService.addServer(
                    name = server.name,
                    host = connection.address,
                    port = connection.port,
                    token = server.accessToken
                )

                result.onSuccess {
                    // Server added successfully - could navigate to sync screen
                }.onFailure { error ->
                    _authState.value = PlexAuthUiState.Error(
                        "Failed to add server: ${error.message}"
                    )
                }
            } else {
                _authState.value = PlexAuthUiState.Error("No valid connection found for server")
            }
        }
    }

    /**
     * Sign out
     */
    fun signOut() {
        authService.signOut()
        _discoveredServers.value = emptyList()
        _authState.value = PlexAuthUiState.Idle
    }

    /**
     * Check if user is authenticated
     */
    fun isAuthenticated(): Boolean {
        return authService.isAuthenticated()
    }

    /**
     * Get stored username
     */
    fun getUsername(): String? {
        return authService.getStoredUsername() ?: authService.getStoredToken()?.let { "Plex User" }
    }

    override fun onCleared() {
        super.onCleared()
        pollingJob?.cancel()
    }

    /**
     * Clear current error state if present
     */
    fun clearError() {
        authService.clearError()
        if (_authState.value is PlexAuthUiState.Error) {
            _authState.value = PlexAuthUiState.Idle
        }
    }

    /**
     * Sign in using credentials (username/password) instead of PIN.
     */
    fun signInWithCredentials(username: String, password: String) {
        val trimmedUsername = username.trim()
        if (trimmedUsername.isEmpty() || password.isEmpty()) {
            _authState.value = PlexAuthUiState.Error("Please enter both username and password")
            return
        }

        viewModelScope.launch {
            val result = authService.authenticateWithCredentials(trimmedUsername, password)
            result.onSuccess {
                // Automatically fetch available servers after successful sign-in
                discoverServers()
            }
        }
    }
}

/**
 * UI state for Plex authentication
 */
sealed class PlexAuthUiState {
    object Idle : PlexAuthUiState()
    object RequestingPin : PlexAuthUiState()
    data class WaitingForUser(val pinCode: String) : PlexAuthUiState()
    object Authenticating : PlexAuthUiState()
    data class Authenticated(val username: String, val email: String) : PlexAuthUiState()
    object DiscoveringServers : PlexAuthUiState()
    data class ServersDiscovered(val count: Int) : PlexAuthUiState()
    data class Error(val message: String) : PlexAuthUiState()
}
