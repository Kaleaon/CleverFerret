package com.universalmedialibrary.ui.integration

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.integration.IntegrationManager
import com.universalmedialibrary.services.integration.plex.PlexIntegrationService
import com.universalmedialibrary.services.integration.plex.PlexResource
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Plex Integration ViewModel
 * 
 * Manages UI state and user interactions for Plex integration
 * Coordinates between UI and integration services
 */
@HiltViewModel
class PlexIntegrationViewModel @Inject constructor(
    private val plexService: PlexIntegrationService,
    private val integrationManager: IntegrationManager
) : ViewModel() {
    
    // UI State
    data class PlexIntegrationUiState(
        val isLoading: Boolean = false,
        val error: String? = null,
        val isAuthenticated: Boolean = false,
        val authPin: String? = null,
        val availableServers: List<PlexResource> = emptyList(),
        val connectedServers: List<String> = emptyList(),
        val libraries: List<String> = emptyList(),
        val operationResult: String? = null,
        val connectionStatus: String = "Not connected"
    )
    
    private val _uiState = MutableStateFlow(PlexIntegrationUiState())
    val uiState: StateFlow<PlexIntegrationUiState> = _uiState.asStateFlow()
    
    init {
        // Observe Plex service state
        viewModelScope.launch {
            plexService.integrationState.collect { plexState ->
                _uiState.update { currentState ->
                    currentState.copy(
                        isLoading = plexState.isLoading,
                        error = plexState.error,
                        isAuthenticated = plexState.isAuthenticated,
                        authPin = plexState.authPin?.code,
                        availableServers = plexState.availableServers,
                        connectedServers = plexState.connectedServers.map { it.serverName },
                        libraries = plexState.libraries.map { "${it.title} (${it.type})" },
                        connectionStatus = if (plexState.isAuthenticated) {
                            "Connected - ${plexState.connectedServers.size} servers"
                        } else {
                            "Not connected"
                        }
                    )
                }
            }
        }
    }
    
    /**
     * Start Plex authentication
     */
    fun startAuthentication() {
        viewModelScope.launch {
            val result = plexService.startAuthentication()
            if (result.isSuccess) {
                _uiState.update { 
                    it.copy(operationResult = "Authentication started. Enter PIN in Plex app.")
                }
            } else {
                _uiState.update { 
                    it.copy(
                        error = result.exceptionOrNull()?.message,
                        operationResult = null
                    )
                }
            }
        }
    }
    
    /**
     * Check authentication status
     */
    fun checkAuthenticationStatus() {
        viewModelScope.launch {
            val currentPin = plexService.integrationState.value.authPin
            if (currentPin != null) {
                val result = plexService.checkAuthenticationStatus(currentPin)
                if (result.isSuccess) {
                    _uiState.update { 
                        it.copy(operationResult = "Authentication successful!")
                    }
                } else {
                    val message = result.exceptionOrNull()?.message
                    if (message?.contains("pending") == true) {
                        _uiState.update { 
                            it.copy(operationResult = "Still waiting for authentication...")
                        }
                    } else {
                        _uiState.update { 
                            it.copy(error = message, operationResult = null)
                        }
                    }
                }
            }
        }
    }
    
    /**
     * Connect to a specific server
     */
    fun connectToServer(server: PlexResource) {
        viewModelScope.launch {
            val result = plexService.connectToServer(server)
            if (result.isSuccess) {
                _uiState.update { 
                    it.copy(operationResult = "Connected to server: ${server.name}")
                }
            } else {
                _uiState.update { 
                    it.copy(
                        error = result.exceptionOrNull()?.message,
                        operationResult = null
                    )
                }
            }
        }
    }
    
    /**
     * Sync all libraries
     */
    fun syncAllLibraries() {
        viewModelScope.launch {
            val result = plexService.syncAllLibraries()
            if (result.isSuccess) {
                val libraries = result.getOrThrow()
                _uiState.update { 
                    it.copy(operationResult = "Synced ${libraries.size} libraries")
                }
            } else {
                _uiState.update { 
                    it.copy(
                        error = result.exceptionOrNull()?.message,
                        operationResult = null
                    )
                }
            }
        }
    }
    
    /**
     * Enhance library metadata
     */
    fun enhanceLibraryMetadata() {
        viewModelScope.launch {
            val result = plexService.enhanceLibraryMetadata()
            if (result.isSuccess) {
                _uiState.update { 
                    it.copy(operationResult = result.getOrThrow())
                }
            } else {
                _uiState.update { 
                    it.copy(
                        error = result.exceptionOrNull()?.message,
                        operationResult = null
                    )
                }
            }
        }
    }
    
    /**
     * Find duplicate content
     */
    fun findDuplicateContent() {
        viewModelScope.launch {
            val result = plexService.findDuplicateContent()
            if (result.isSuccess) {
                _uiState.update { 
                    it.copy(operationResult = result.getOrThrow())
                }
            } else {
                _uiState.update { 
                    it.copy(
                        error = result.exceptionOrNull()?.message,
                        operationResult = null
                    )
                }
            }
        }
    }
    
    /**
     * Create smart collections
     */
    fun createSmartCollections() {
        viewModelScope.launch {
            val result = plexService.createSmartCollections()
            if (result.isSuccess) {
                _uiState.update { 
                    it.copy(operationResult = result.getOrThrow())
                }
            } else {
                _uiState.update { 
                    it.copy(
                        error = result.exceptionOrNull()?.message,
                        operationResult = null
                    )
                }
            }
        }
    }
    
    /**
     * Check all connections
     */
    fun checkAllConnections() {
        viewModelScope.launch {
            val result = plexService.checkAllConnections()
            if (result.isSuccess) {
                _uiState.update { 
                    it.copy(operationResult = result.getOrThrow())
                }
            } else {
                _uiState.update { 
                    it.copy(
                        error = result.exceptionOrNull()?.message,
                        operationResult = null
                    )
                }
            }
        }
    }
    
    /**
     * Get library analytics
     */
    fun getLibraryAnalytics() {
        viewModelScope.launch {
            val result = plexService.getLibraryStats()
            if (result.isSuccess) {
                val stats = result.getOrThrow()
                val summary = "Library Statistics:\n" + stats.joinToString("\n") { 
                    "${it.serverName}: ${it.totalItems} ${it.libraryType} items"
                }
                _uiState.update { 
                    it.copy(operationResult = summary)
                }
            } else {
                _uiState.update { 
                    it.copy(
                        error = result.exceptionOrNull()?.message,
                        operationResult = null
                    )
                }
            }
        }
    }
    
    /**
     * Logout from Plex
     */
    fun logout() {
        viewModelScope.launch {
            plexService.logout()
            _uiState.update { 
                it.copy(operationResult = "Logged out successfully")
            }
        }
    }
    
    /**
     * Clear error message
     */
    fun clearError() {
        _uiState.update { it.copy(error = null) }
    }
    
    /**
     * Clear operation result
     */
    fun clearOperationResult() {
        _uiState.update { it.copy(operationResult = null) }
    }
}