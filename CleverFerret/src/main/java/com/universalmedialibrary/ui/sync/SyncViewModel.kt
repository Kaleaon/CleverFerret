package com.universalmedialibrary.ui.sync

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.sync.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SyncViewModel @Inject constructor(
    private val syncService: EnhancedSyncService
) : ViewModel() {

    private val _uiState = MutableStateFlow(SyncUiState())
    val uiState: StateFlow<SyncUiState> = _uiState.asStateFlow()

    val syncState: StateFlow<EnhancedSyncState> = syncService.syncState
        .stateIn(viewModelScope, SharingStarted.Eagerly, EnhancedSyncState())

    private val _syncOptions = MutableStateFlow(SyncOptions())
    val syncOptions: StateFlow<SyncOptions> = _syncOptions.asStateFlow()

    init {
        loadLastSyncInfo()
    }

    fun startSync(options: SyncOptions = _syncOptions.value) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(
                    isSyncing = true,
                    error = null,
                    currentConflict = null
                )

                val result = syncService.sync(options)
                
                _uiState.value = _uiState.value.copy(
                    isSyncing = false,
                    lastSyncResult = result,
                    showSyncComplete = true
                )

                loadLastSyncInfo()
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isSyncing = false,
                    error = e.message ?: "Sync failed"
                )
            }
        }
```suggestion
fun handleConflict(conflict: EnhancedSyncConflict, resolution: EnhancedConflictResolution) {
    viewModelScope.launch {
        try {
            // TODO: Implement conflict resolution in service when available
            // syncService.resolveConflict(conflict, resolution)
            _uiState.value = _uiState.value.copy(currentConflict = null)
            if (_uiState.value.isSyncing) startSync()
        } catch (e: Exception) {
            _uiState.value = _uiState.value.copy(error = e.message ?: "Failed to resolve conflict")
        }
    }
}

viewModelScope.launch {
    try {
        syncService.resolveConflict(conflict, resolution)
        _uiState.value = _uiState.value.copy(currentConflict = null)
        // Optionally resume sync if needed
        if (_uiState.value.isSyncing) startSync()
    } catch (e: Exception) {
        _uiState.value = _uiState.value.copy(error = e.message ?: "Failed to resolve conflict")
    }
}
        viewModelScope.launch {
            try {
                // TODO: Implement conflict resolution in service
                // syncService.resolveConflict(conflict, resolution)
                _uiState.value = _uiState.value.copy(currentConflict = null)
                
                // Continue sync if there was a pending sync
                if (_uiState.value.isSyncing) {
                    startSync()
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = e.message ?: "Failed to resolve conflict"
                )
            }
        }
    }

    fun updateSyncOptions(options: SyncOptions) {
        _syncOptions.value = options
    }

    fun toggleAutoSync(enabled: Boolean) {
        // Interpret this as "WiFi Only" toggle for sync
        _syncOptions.value = _syncOptions.value.copy(syncOnlyOnWifi = enabled)
        // TODO: If true auto-sync scheduling is needed, use WorkManager
    }

    fun setConflictResolution(strategy: EnhancedConflictResolution) {
        _syncOptions.value = _syncOptions.value.copy(conflictResolution = strategy)
    }

    fun dismissSyncComplete() {
        _uiState.value = _uiState.value.copy(showSyncComplete = false)
    }

    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }

    private fun loadLastSyncInfo() {
        viewModelScope.launch {
            try {
                // TODO: Implement when service supports it
                // val lastSync = syncService.getLastSyncTime()
                // _uiState.value = _uiState.value.copy(lastSyncTime = lastSync)
            } catch (e: Exception) {
                // Continue without last sync info
            }
        }
    }

    fun getConflicts() {
        viewModelScope.launch {
            try {
                // TODO: Implement when service supports it
                // val conflicts = syncService.getPendingConflicts()
                // _uiState.value = _uiState.value.copy(
                //     pendingConflicts = conflicts,
                //     currentConflict = conflicts.firstOrNull()
                // )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = e.message ?: "Failed to load conflicts"
                )
            }
        }
    }

    fun skipConflict() {
        val current = _uiState.value.pendingConflicts
        if (current.isNotEmpty()) {
            _uiState.value = _uiState.value.copy(
                pendingConflicts = current.drop(1),
                currentConflict = current.getOrNull(1)
            )
        }
    }
}

data class SyncUiState(
    val isSyncing: Boolean = false,
    val lastSyncTime: Long? = null,
    val lastSyncResult: SyncResult? = null,
    val currentConflict: EnhancedSyncConflict? = null,
    val pendingConflicts: List<EnhancedSyncConflict> = emptyList(),
    val showSyncComplete: Boolean = false,
    val error: String? = null
)
