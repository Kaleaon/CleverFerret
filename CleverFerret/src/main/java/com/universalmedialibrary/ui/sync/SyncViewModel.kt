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
        if (_uiState.value.isSyncing) return
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(
                    isSyncing = true,
                    error = null,
                    errorType = null,
                    currentConflict = null
                )

                val result = cloudSyncEngine.sync(options)

                if (!result.success && result.error != null) {
                    val classified = classifySyncError(result.error)
                    _uiState.value = _uiState.value.copy(
                        isSyncing = false,
                        lastSyncResult = result,
                        error = result.error,
                        errorType = classified,
                        showSyncComplete = false
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isSyncing = false,
                        lastSyncResult = result,
                        showSyncComplete = true
                    )
                }

                loadLastSyncInfo()
            } catch (e: Exception) {
                val errorMsg = e.message?.ifBlank { "Sync failed due to an unexpected error" }
                    ?: "Sync failed due to an unexpected error"
                _uiState.value = _uiState.value.copy(
                    isSyncing = false,
                    error = errorMsg,
                    errorType = classifySyncError(e)
                )
            }
        }
    }

    fun retrySync() {
        startSync()
    }

    fun handleConflict(conflict: SyncConflict, resolution: ConflictResolutionStrategy) {
        viewModelScope.launch {
            try {
                cloudSyncEngine.resolveConflict(conflict.itemId, resolution == ConflictResolutionStrategy.USE_LOCAL)
                _uiState.value = _uiState.value.copy(currentConflict = null)
                if (_uiState.value.isSyncing) startSync()
            } catch (e: Exception) {
                val errorMsg = e.message ?: "Failed to resolve conflict"
                _uiState.value = _uiState.value.copy(
                    error = errorMsg,
                    errorType = classifySyncError(e)
                )
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
        _uiState.value = _uiState.value.copy(error = null, errorType = null)
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
                val errorMsg = e.message ?: "Failed to load conflicts"
                _uiState.value = _uiState.value.copy(
                    error = errorMsg,
                    errorType = classifySyncError(e)
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
    val error: String? = null,
    val errorType: SyncErrorType? = null
)

/**
 * Structured sync error classification distinguishing auth, network, and server errors.
 */
enum class SyncErrorType {
    AUTH_EXPIRED,
    NETWORK_OFFLINE,
    SERVER_ERROR,
    UNKNOWN
}

private val AUTH_KEYWORDS = listOf(
    "401", "403", "auth", "unauthorized", "forbidden", "token", "credential", "expired", "login"
)
private val NETWORK_KEYWORDS = listOf(
    "offline", "network", "connect", "timeout", "unreachable", "no internet", "unknownhost", "socket", "host"
)
private val SERVER_KEYWORDS = listOf(
    "500", "502", "503", "504", "server error", "internal server", "bad gateway", "service unavailable", "internal error"
)

/**
 * Classifies a throwable into a structured SyncErrorType.
 */
fun classifySyncError(throwable: Throwable?): SyncErrorType {
    if (throwable == null) return SyncErrorType.UNKNOWN
    return classifySyncError(throwable.message)
}

/**
 * Classifies an error message into a structured SyncErrorType.
 */
fun classifySyncError(message: String?): SyncErrorType {
    if (message.isNullOrBlank()) return SyncErrorType.UNKNOWN
    val lower = message.lowercase()
    return when {
        AUTH_KEYWORDS.any { lower.contains(it) } -> SyncErrorType.AUTH_EXPIRED
        SERVER_KEYWORDS.any { lower.contains(it) } -> SyncErrorType.SERVER_ERROR
        NETWORK_KEYWORDS.any { lower.contains(it) } -> SyncErrorType.NETWORK_OFFLINE
        else -> SyncErrorType.UNKNOWN
    }
}

/**
 * Returns contextual diagnostic advice based on the classified error type.
 */
fun getSyncErrorDiagnosticTip(errorType: SyncErrorType, error: String? = null): String {
    return when (errorType) {
        SyncErrorType.AUTH_EXPIRED ->
            "Your session or credentials have expired. Please re-authenticate to continue syncing."
        SyncErrorType.NETWORK_OFFLINE ->
            "Unable to connect to the network. Please check your internet connection and try again."
        SyncErrorType.SERVER_ERROR ->
            "The remote server is temporarily unavailable or returned an error. Please try again later."
        SyncErrorType.UNKNOWN ->
            if (error.isNullOrBlank()) {
                "An unexpected synchronization error occurred. Please check your settings or try again."
            } else {
                "An unexpected error occurred: $error"
            }
    }
}
