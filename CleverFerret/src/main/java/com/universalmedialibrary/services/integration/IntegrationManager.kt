package com.universalmedialibrary.services.integration

import android.content.Context
import com.universalmedialibrary.services.integration.cloud.CloudStorageService
import com.universalmedialibrary.services.integration.plex.PlexIntegrationService
import com.universalmedialibrary.services.integration.calibre.CalibreIntegrationService
import com.universalmedialibrary.services.integration.books.BookServicesIntegration
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Central Integration Manager for all external services
 * Coordinates Plex, Calibre, Cloud Storage, and Book Services
 */
@Singleton
class IntegrationManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val plexService: PlexIntegrationService,
    private val calibreService: CalibreIntegrationService,
    private val cloudService: CloudStorageService,
    private val bookServices: BookServicesIntegration
) {

    private val _integrationState = MutableStateFlow(IntegrationManagerState())
    val integrationState: StateFlow<IntegrationManagerState> = _integrationState.asStateFlow()

    /**
     * Initialize all integrations and check connectivity
     */
    suspend fun initializeIntegrations() {
        _integrationState.value = _integrationState.value.copy(isInitializing = true)

        try {
            // Check Plex connections
            val plexStatus = plexService.checkAllConnections()

            // Check Calibre connections
            val calibreStatus = calibreService.checkConnections()

            // Check cloud storage
            val cloudStatusRaw = cloudService.checkAllConnections()

            // Check book services
            val bookStatusRaw = bookServices.checkServices()

            // Convert service-specific status types to IntegrationManager types
            val calibreStatusConverted = CalibreConnectionStatus(
                isConnected = calibreStatus.isConnected,
                serverUrl = calibreStatus.serverUrl ?: "",
                libraryCount = calibreStatus.libraryCount
            )

            val cloudStatusConverted = CloudConnectionStatus(
                dropboxConnected = cloudStatusRaw.dropboxConnected,
                googleDriveConnected = cloudStatusRaw.googleDriveConnected,
                oneDriveConnected = cloudStatusRaw.oneDriveConnected,
                hasActiveConnections = cloudStatusRaw.hasActiveConnections
            )

            val bookStatusConverted = BookServicesStatus(
                amazonConnected = bookStatusRaw.amazonConnected,
                googleBooksConnected = bookStatusRaw.googleBooksConnected,
                hasActiveConnections = bookStatusRaw.hasActiveConnections
            )

            _integrationState.value = _integrationState.value.copy(
                isInitializing = false,
                plexStatus = plexStatus,
                calibreStatus = calibreStatusConverted,
                cloudStatus = cloudStatusConverted,
                bookServicesStatus = bookStatusConverted,
                lastSyncTime = System.currentTimeMillis()
            )

        } catch (e: Exception) {
            _integrationState.value = _integrationState.value.copy(
                isInitializing = false,
                error = "Failed to initialize integrations: ${e.message}"
            )
        }
    }

    /**
     * Sync all connected services
     */
    suspend fun syncAllServices() {
        _integrationState.value = _integrationState.value.copy(isSyncing = true)

        try {
            val syncResults = mutableListOf<SyncResult>()

            // Sync Plex libraries
            if (_integrationState.value.plexStatus.hasActiveConnections) {
                val plexSync = plexService.syncAllLibraries()
                syncResults.add(SyncResult("Plex", plexSync.successful, plexSync.itemsProcessed))
            }

            // Sync Calibre libraries
            if (_integrationState.value.calibreStatus.isConnected) {
                val calibreSync = calibreService.syncLibraries()
                syncResults.add(SyncResult("Calibre", calibreSync.successful, calibreSync.itemsProcessed))
            }

            // Sync to cloud storage
            if (_integrationState.value.cloudStatus.hasActiveConnections) {
                val cloudSync = cloudService.syncToCloud()
                syncResults.add(SyncResult("Cloud Storage", cloudSync.successful, cloudSync.itemsProcessed))
            }

            _integrationState.value = _integrationState.value.copy(
                isSyncing = false,
                lastSyncResults = syncResults,
                lastSyncTime = System.currentTimeMillis()
            )

        } catch (e: Exception) {
            _integrationState.value = _integrationState.value.copy(
                isSyncing = false,
                error = "Sync failed: ${e.message}"
            )
        }
    }

    /**
     * Get unified library statistics across all services
     */
    suspend fun getUnifiedLibraryStats(): UnifiedLibraryStats {
        val plexStats = if (_integrationState.value.plexStatus.hasActiveConnections) {
            plexService.getLibraryStats()
        } else null

        val calibreStats = if (_integrationState.value.calibreStatus.isConnected) {
            calibreService.getLibraryStats()
        } else null

        return UnifiedLibraryStats(
            totalMovies = (plexStats?.movies ?: 0),
            totalTVShows = (plexStats?.tvShows ?: 0),
            totalBooks = (calibreStats?.books ?: 0),
            totalMusic = (plexStats?.music ?: 0),
            totalPhotos = (plexStats?.photos ?: 0),
            cloudStorageUsed = cloudService.getTotalStorageUsed(),
            lastUpdated = System.currentTimeMillis()
        )
    }

    fun clearError() {
        _integrationState.value = _integrationState.value.copy(error = null)
    }
}

data class IntegrationManagerState(
    val isInitializing: Boolean = false,
    val isSyncing: Boolean = false,
    val plexStatus: PlexConnectionStatus = PlexConnectionStatus(),
    val calibreStatus: CalibreConnectionStatus = CalibreConnectionStatus(),
    val cloudStatus: CloudConnectionStatus = CloudConnectionStatus(),
    val bookServicesStatus: BookServicesStatus = BookServicesStatus(),
    val lastSyncResults: List<SyncResult> = emptyList(),
    val lastSyncTime: Long = 0L,
    val error: String? = null
)

data class SyncResult(
    val serviceName: String,
    val successful: Boolean,
    val itemsProcessed: Int,
    val details: String = ""
)

data class UnifiedLibraryStats(
    val totalMovies: Int,
    val totalTVShows: Int,
    val totalBooks: Int,
    val totalMusic: Int,
    val totalPhotos: Int,
    val cloudStorageUsed: Long,
    val lastUpdated: Long
)

// Status data classes for each service
data class PlexConnectionStatus(
    val connectedServers: List<String> = emptyList(),
    val hasActiveConnections: Boolean = false,
    val totalLibraries: Int = 0
)

data class CalibreConnectionStatus(
    val isConnected: Boolean = false,
    val serverUrl: String = "",
    val libraryCount: Int = 0
)

data class CloudConnectionStatus(
    val dropboxConnected: Boolean = false,
    val googleDriveConnected: Boolean = false,
    val oneDriveConnected: Boolean = false,
    val hasActiveConnections: Boolean = false
)

data class BookServicesStatus(
    val amazonConnected: Boolean = false,
    val googleBooksConnected: Boolean = false,
    val hasActiveConnections: Boolean = false
)
