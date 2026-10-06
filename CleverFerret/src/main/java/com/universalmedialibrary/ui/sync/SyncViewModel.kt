package com.universalmedialibrary.ui.sync

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.jobs.WorkScheduler
import com.universalmedialibrary.services.sync.*
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SyncViewModel @Inject constructor(
    private val cloudSyncEngine: CloudSyncEngine,
    @ApplicationContext private val context: Context
) : ViewModel() {

    private val _uiState = MutableStateFlow(SyncUiState())
    val uiState: StateFlow<SyncUiState> = _uiState.asStateFlow()

    val syncState: StateFlow<SyncState> = cloudSyncEngine.syncState
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), SyncState())

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

                val result = cloudSyncEngine.sync(options)

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
    }

    fun handleConflict(conflict: SyncConflict, resolution: ConflictResolutionStrategy) {
        viewModelScope.launch {
            try {
                cloudSyncEngine.resolveConflict(conflict.itemId, resolution == ConflictResolutionStrategy.USE_LOCAL)
                _uiState.value = _uiState.value.copy(currentConflict = null)
                if (_uiState.value.isSyncing) startSync()
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = e.message ?: "Failed to resolve conflict")
            }
        }
    }

    fun updateSyncOptions(options: SyncOptions) {
        _syncOptions.value = options
    }

    fun toggleAutoSync(enabled: Boolean) {
        _syncOptions.value = _syncOptions.value.copy(syncOnlyOnWifi = enabled)
        scheduleAutoSync(enabled)
    }

    fun setConflictResolution(strategy: ConflictResolutionStrategy) {
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
                val lastSync = cloudSyncEngine.syncState.value.lastSyncTime
                _uiState.value = _uiState.value.copy(lastSyncTime = lastSync)
            } catch (e: Exception) {
                // Continue without last sync info
            }
        }
    }

    fun getConflicts() {
        viewModelScope.launch {
            try {
                val conflicts = cloudSyncEngine.conflicts.value
                _uiState.value = _uiState.value.copy(
                    pendingConflicts = conflicts,
                    currentConflict = conflicts.firstOrNull()
                )
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

    /**
     * Schedule auto-sync using WorkScheduler
     */
    private fun scheduleAutoSync(enabled: Boolean) {
        try {
            if (enabled) {
                WorkScheduler.scheduleFeedCatalogSync(
                    context = context,
                    intervalMinutes = 30,
                    wifiOnly = _syncOptions.value.syncOnlyOnWifi
                )
                android.util.Log.i("SyncViewModel", "Auto-sync scheduled via WorkScheduler")
            } else {
                WorkScheduler.cancelFeedCatalogSync(context)
                android.util.Log.i("SyncViewModel", "Auto-sync cancelled via WorkScheduler")
            }
        } catch (e: Exception) {
            android.util.Log.e("SyncViewModel", "Failed to schedule auto-sync: ${e.message}")
        }
    }
}

data class SyncUiState(
    val isSyncing: Boolean = false,
    val lastSyncTime: Long? = null,
    val lastSyncResult: SyncResult? = null,
    val currentConflict: SyncConflict? = null,
    val pendingConflicts: List<SyncConflict> = emptyList(),
    val showSyncComplete: Boolean = false,
    val error: String? = null
)
