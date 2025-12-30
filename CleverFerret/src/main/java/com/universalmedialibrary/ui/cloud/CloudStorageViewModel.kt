package com.universalmedialibrary.ui.cloud

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.cloud.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Cloud Storage Screen
 */
@HiltViewModel
class CloudStorageViewModel @Inject constructor(
    private val cloudSyncManager: CloudSyncManager,
    private val googleDriveService: GoogleDriveService,
    private val dropboxService: DropboxService,
    private val oneDriveService: OneDriveService,
    private val webDavService: WebDavService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(CloudStorageUiState())
    val uiState: StateFlow<CloudStorageUiState> = _uiState.asStateFlow()

    init {
        viewModelScope.launch {
            collectSyncStatus()
            collectActiveProviders()
            collectStorageUsage()
        }
    }

    fun initialize() {
        viewModelScope.launch {
            val initialized = cloudSyncManager.initialize()
            _uiState.value = _uiState.value.copy(
                isInitialized = initialized
            )
        }
    }

    fun toggleProvider(provider: CloudProvider, enabled: Boolean) {
        viewModelScope.launch {
            cloudSyncManager.setProviderEnabled(provider, enabled)
        }
    }

    fun authenticateProvider(provider: CloudProvider) {
        viewModelScope.launch {
            // Implementation would show authentication dialog
            // For now, we'll assume authentication is handled elsewhere
        }
    }

    fun manageProvider(provider: CloudProvider) {
        // Implementation would navigate to provider management screen
    }

    fun syncAllProviders() {
        viewModelScope.launch {
            val results = cloudSyncManager.syncAll()
            _uiState.value = _uiState.value.copy(
                lastSyncResults = results
            )
        }
    }

    fun refreshAll() {
        viewModelScope.launch {
            // Refresh all provider connections and storage info
        }
    }

    private fun collectSyncStatus() {
        viewModelScope.launch {
            cloudSyncManager.syncStatus.collect { status ->
                _uiState.value = _uiState.value.copy(
                    syncStatus = status
                )
            }
        }
    }

    private fun collectActiveProviders() {
        viewModelScope.launch {
            cloudSyncManager.activeProviders.collect { providers ->
                _uiState.value = _uiState.value.copy(
                    activeProviders = providers
                )
                
                // Update authenticated providers
                val authenticated = mutableSetOf<CloudProvider>()
                providers.forEach { provider ->
                    when (provider) {
                        CloudProvider.GOOGLE_DRIVE -> {
                            if (googleDriveService.isAuthenticated.value) {
                                authenticated.add(provider)
                            }
                        }
                        CloudProvider.DROPBOX -> {
                            if (dropboxService.isAuthenticated.value) {
                                authenticated.add(provider)
                            }
                        }
                        CloudProvider.ONEDRIVE -> {
                            if (oneDriveService.isAuthenticated.value) {
                                authenticated.add(provider)
                            }
                        }
                        CloudProvider.WEBDAV -> {
                            if (webDavService.isAuthenticated.value) {
                                authenticated.add(provider)
                            }
                        }
                    }
                }
                _uiState.value = _uiState.value.copy(
                    authenticatedProviders = authenticated
                )
            }
        }
    }

    private fun collectStorageUsage() {
        viewModelScope.launch {
            cloudSyncManager.getCombinedStorageUsage().collect { usage ->
                _uiState.value = _uiState.value.copy(
                    storageUsage = usage
                )
            }
        }
    }
}

data class CloudStorageUiState(
    val isInitialized: Boolean = false,
    val syncStatus: SyncStatus = SyncStatus.IDLE,
    val syncProgress: Float = 0f,
    val activeProviders: Set<CloudProvider> = emptySet(),
    val authenticatedProviders: Set<CloudProvider> = emptySet(),
    val storageUsage: Map<CloudProvider, StorageUsage?> = emptyMap(),
    val lastSyncResults: Map<CloudProvider, SyncResult> = emptyMap()
)