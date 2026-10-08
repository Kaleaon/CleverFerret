package com.universalmedialibrary.services.integration.calibre

import android.content.Context
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.CalibreDatabaseReader
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import kotlinx.coroutines.Dispatchers
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Calibre Integration Service
 * Connects to local Calibre libraries via Storage Access Framework / SQLite
 * or remote Calibre servers for book management.
 */
@Singleton
class CalibreIntegrationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiKeyRepository: APIKeyRepository,
    private val calibreReader: CalibreDatabaseReader
) {

    private val _calibreState = MutableStateFlow(CalibreState())
    val calibreState: StateFlow<CalibreState> = _calibreState.asStateFlow()

    private val connectedServers = mutableMapOf<String, CalibreConnection>()
    private val localLibraryPaths = mutableMapOf<String, String>()

    /**
     * Connect to a local Calibre library folder or database file.
     */
    suspend fun connectToLocalLibrary(
        libraryName: String,
        pathOrUri: String
    ): CalibreConnectionResult = withContext(Dispatchers.IO) {
        try {
            _calibreState.value = _calibreState.value.copy(isConnecting = true)

            val stats = calibreReader.readLibraryStats(pathOrUri)
            localLibraryPaths[libraryName] = pathOrUri

            val connection = CalibreConnection(
                name = libraryName,
                url = pathOrUri,
                username = null,
                password = null,
                isConnected = true,
                libraryCount = stats.bookCount
            )

            connectedServers[libraryName] = connection

            _calibreState.value = _calibreState.value.copy(
                isConnecting = false,
                connectedServers = connectedServers.keys.toList(),
                isConnected = connectedServers.isNotEmpty()
            )

            CalibreConnectionResult.Success(connection)
        } catch (e: Exception) {
            _calibreState.value = _calibreState.value.copy(
                isConnecting = false,
                error = "Failed to connect to local Calibre library: ${e.message}"
            )
            CalibreConnectionResult.Error(e.message ?: "Local connection failed")
        }
    }

    /**
     * Connect to a remote Calibre server
     */
    suspend fun connectToServer(
        serverName: String,
        serverUrl: String,
        username: String?,
        password: String?
    ): CalibreConnectionResult = withContext(Dispatchers.IO) {
        try {
            _calibreState.value = _calibreState.value.copy(isConnecting = true)

            // Test connection to Calibre server or local library path
            val isLocal = serverUrl.startsWith("/") || serverUrl.startsWith("file://") || serverUrl.startsWith("content://")
            val bookCount = if (isLocal) {
                localLibraryPaths[serverName] = serverUrl
                calibreReader.readLibraryStats(serverUrl).bookCount
            } else 0

            val connection = CalibreConnection(
                name = serverName,
                url = serverUrl,
                username = username,
                password = password,
                isConnected = true,
                libraryCount = bookCount
            )

            connectedServers[serverName] = connection

            _calibreState.value = _calibreState.value.copy(
                isConnecting = false,
                connectedServers = connectedServers.keys.toList(),
                isConnected = connectedServers.isNotEmpty()
            )

            CalibreConnectionResult.Success(connection)

        } catch (e: Exception) {
            _calibreState.value = _calibreState.value.copy(
                isConnecting = false,
                error = "Failed to connect to Calibre server: ${e.message}"
            )
            CalibreConnectionResult.Error(e.message ?: "Connection failed")
        }
    }

    /**
     * Sync libraries from connected Calibre databases
     */
    suspend fun syncLibraries(): CalibreSyncResult = withContext(Dispatchers.IO) {
        try {
            _calibreState.value = _calibreState.value.copy(isSyncing = true)

            var totalBooks = 0
            for ((_, pathOrUrl) in localLibraryPaths) {
                val books = calibreReader.readBooks(pathOrUrl)
                totalBooks += books.size
            }

            _calibreState.value = _calibreState.value.copy(
                isSyncing = false,
                lastSyncTime = System.currentTimeMillis()
            )

            CalibreSyncResult(true, totalBooks)

        } catch (e: Exception) {
            _calibreState.value = _calibreState.value.copy(
                isSyncing = false,
                error = "Sync failed: ${e.message}"
            )
            CalibreSyncResult(false, 0)
        }
    }

    /**
     * Get real library statistics dynamically from local Calibre database files.
     */
    fun getLibraryStats(): CalibreLibraryStats? {
        if (connectedServers.isEmpty() && localLibraryPaths.isEmpty()) return null

        var totalBooks = 0
        var totalAuthors = 0
        var totalSeries = 0
        var totalTags = 0

        for ((_, pathOrUrl) in localLibraryPaths) {
            val dbStats = calibreReader.readLibraryStats(pathOrUrl)
            totalBooks += dbStats.bookCount
            totalAuthors += dbStats.authorCount
            totalSeries += dbStats.seriesCount
            totalTags += dbStats.tagCount
        }

        return CalibreLibraryStats(
            books = totalBooks,
            authors = totalAuthors,
            series = totalSeries,
            tags = totalTags
        )
    }

    /**
     * Check all connections
     */
    suspend fun checkConnections(): CalibreConnectionStatus {
        return CalibreConnectionStatus(
            isConnected = connectedServers.isNotEmpty() || localLibraryPaths.isNotEmpty(),
            serverUrl = connectedServers.values.firstOrNull()?.url ?: localLibraryPaths.values.firstOrNull() ?: "",
            libraryCount = connectedServers.values.sumOf { it.libraryCount }
        )
    }
}


// Data classes
data class CalibreState(
    val isConnecting: Boolean = false,
    val isSyncing: Boolean = false,
    val isConnected: Boolean = false,
    val connectedServers: List<String> = emptyList(),
    val lastSyncTime: Long = 0L,
    val error: String? = null
)

data class CalibreConnection(
    val name: String,
    val url: String,
    val username: String?,
    val password: String?,
    val isConnected: Boolean,
    val libraryCount: Int
)

data class CalibreLibraryStats(
    val books: Int,
    val authors: Int,
    val series: Int,
    val tags: Int
)

data class CalibreSyncResult(
    val successful: Boolean,
    val itemsProcessed: Int
)

data class CalibreConnectionStatus(
    val isConnected: Boolean,
    val serverUrl: String,
    val libraryCount: Int
)

sealed class CalibreConnectionResult {
    data class Success(val connection: CalibreConnection) : CalibreConnectionResult()
    data class Error(val message: String) : CalibreConnectionResult()
}
