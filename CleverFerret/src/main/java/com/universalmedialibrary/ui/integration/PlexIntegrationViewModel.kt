package com.universalmedialibrary.ui.integration

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.integration.plex.PlexIntegrationService
import com.universalmedialibrary.services.integration.plex.PlexConnectionResult
import com.universalmedialibrary.services.integration.plex.MetadataEnhancementResult
import com.universalmedialibrary.services.integration.plex.DuplicateAnalysisResult
import com.universalmedialibrary.services.integration.plex.SmartCollectionResult
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MediaIntegrationViewModel @Inject constructor(
    private val plexService: PlexIntegrationService
) : ViewModel() {
    private var authPollingJob: Job? = null

    val plexState: StateFlow<com.universalmedialibrary.services.integration.plex.PlexIntegrationState> =
        plexService.plexState

    /**
     * Connect to a Plex server
     */
    fun connectToServer(serverName: String, serverUrl: String, token: String) {
        viewModelScope.launch {
            when (val result = plexService.connectToServer(serverName, serverUrl, token)) {
                is PlexConnectionResult.Success -> {
                    // Connection successful - UI will update via StateFlow
                }
                is PlexConnectionResult.Error -> {
                    // Error handled in PlexIntegrationService and reflected in state
                }
            }
        }
    }

    /**
     * Enhance metadata for a specific library
     */
    fun enhanceLibraryMetadata(serverName: String, libraryKey: String = "1") {
        viewModelScope.launch {
            when (val result = plexService.enhanceLibraryMetadata(serverName, libraryKey)) {
                is MetadataEnhancementResult.Success -> {
                    // Enhancement successful - UI will update via StateFlow
                }
                is MetadataEnhancementResult.Error -> {
                    // Error handled in PlexIntegrationService and reflected in state
                }
            }
        }
    }

    /**
     * Find duplicate content across libraries
     */
    fun findDuplicateContent(serverName: String) {
        viewModelScope.launch {
            when (val result = plexService.findDuplicateContent(serverName)) {
                is DuplicateAnalysisResult.Success -> {
                    // Analysis successful - UI will update via StateFlow
                }
                is DuplicateAnalysisResult.Error -> {
                    // Error handled in PlexIntegrationService and reflected in state
                }
            }
        }
    }

    /**
     * Create smart collections based on AI analysis
     */
    fun createSmartCollections(serverName: String, libraryKey: String = "1") {
        viewModelScope.launch {
            when (val result = plexService.createSmartCollections(serverName, libraryKey)) {
                is SmartCollectionResult.Success -> {
                    // Collection creation successful - UI will update via StateFlow
                }
                is SmartCollectionResult.Error -> {
                    // Error handled in PlexIntegrationService and reflected in state
                }
            }
        }
    }

    /**
     * Sync all connected Plex libraries
     */
    fun syncAllLibraries() {
        viewModelScope.launch {
            val result = plexService.syncAllLibraries(plexState.value.syncConflictPolicy)
            // Result is handled in PlexIntegrationService and reflected in state
        }
    }

    fun setSyncConflictPolicy(policy: PlexIntegrationService.SyncConflictPolicy) {
        plexService.setSyncConflictPolicy(policy)
    }

    fun startPinAuth() {
        authPollingJob?.cancel()
        viewModelScope.launch {
            plexService.requestPIN()
                .onSuccess { pinData ->
                    authPollingJob = launch {
                        plexService.pollForAuth(pinData.pinId)
                        plexService.discoverServers()
                    }
                }
        }
    }

    fun discoverServers() {
        viewModelScope.launch {
            plexService.discoverServers()
        }
    }

    fun connectDiscoveredServers() {
        viewModelScope.launch {
            plexService.discoverServers()
                .onSuccess { servers ->
                    servers.forEach { server ->
                        plexService.connectToDiscoveredServer(server)
                    }
                }
        }
    }

    fun signOut() {
        authPollingJob?.cancel()
        viewModelScope.launch {
            plexService.signOut()
        }
    }

    /**
     * Get library analytics for a server
     */
    fun getLibraryAnalytics(serverName: String) {
        viewModelScope.launch {
            val analytics = plexService.getLibraryAnalytics(serverName)
            // Analytics can be used for additional UI features
        }
    }

    /**
     * Clear any error state
     */
    fun clearError() {
        plexService.clearError()
    }
}
