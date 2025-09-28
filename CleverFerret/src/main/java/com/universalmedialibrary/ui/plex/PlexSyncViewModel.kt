package com.universalmedialibrary.ui.plex

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.PlexServer
import com.universalmedialibrary.services.plex.PlexSyncService
import com.universalmedialibrary.services.plex.PlexSyncStatus
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class PlexSyncViewModel @Inject constructor(
    private val plexSyncService: PlexSyncService
) : ViewModel() {
    
    // UI State
    private val _uiState = MutableStateFlow(PlexSyncUiState())
    val uiState: StateFlow<PlexSyncUiState> = _uiState.asStateFlow()
    
    // Plex servers
    val servers: StateFlow<List<PlexServer>> = plexSyncService.getAllServers()
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )
    
    // Sync status
    val syncStatus: StateFlow<PlexSyncStatus> = plexSyncService.syncStatus
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = PlexSyncStatus.Idle
        )
    
    init {
        // Auto-refresh sync status
        viewModelScope.launch {
            syncStatus.collect { status ->
                _uiState.value = _uiState.value.copy(
                    isLoading = status is PlexSyncStatus.Syncing,
                    errorMessage = if (status is PlexSyncStatus.Error) status.message else null,
                    successMessage = if (status is PlexSyncStatus.Success) status.message else null
                )
            }
        }
    }
    
    /**
     * Add a new Plex server
     */
    fun addServer(name: String, host: String, port: Int, token: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, errorMessage = null)
            
            plexSyncService.addServer(name, host, port, token)
                .onSuccess {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        successMessage = "Server added successfully",
                        showAddServerDialog = false
                    )
                }
                .onFailure { error ->
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        errorMessage = "Failed to add server: ${error.message}"
                    )
                }
        }
    }
    
    /**
     * Sync all servers
     */
    fun syncAllServers() {
        viewModelScope.launch {
            plexSyncService.syncAllServers()
        }
    }
    
    /**
     * Sync specific server
     */
    fun syncServer(server: PlexServer) {
        viewModelScope.launch {
            plexSyncService.syncServer(server)
        }
    }
    
    /**
     * Show add server dialog
     */
    fun showAddServerDialog() {
        _uiState.value = _uiState.value.copy(showAddServerDialog = true)
    }
    
    /**
     * Hide add server dialog
     */
    fun hideAddServerDialog() {
        _uiState.value = _uiState.value.copy(showAddServerDialog = false)
    }
    
    /**
     * Clear messages
     */
    fun clearMessages() {
        _uiState.value = _uiState.value.copy(errorMessage = null, successMessage = null)
    }
}

/**
 * UI State for Plex sync screen
 */
data class PlexSyncUiState(
    val isLoading: Boolean = false,
    val errorMessage: String? = null,
    val successMessage: String? = null,
    val showAddServerDialog: Boolean = false
)