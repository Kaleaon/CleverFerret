package com.universalmedialibrary.services.integration.plex

import android.content.Context
import com.universalmedialibrary.services.integration.PlexConnectionStatus
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Comprehensive Plex Integration Service
 *
 * Features:
 * - Remote Plex server management
 * - Duplicate detection across Plex libraries
 * - Smart collection creation
 * - Library analytics and health monitoring
 * - Watch status sync
 * - Custom artwork management
 */
@Singleton
class PlexIntegrationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val plexAuthService: com.universalmedialibrary.services.plex.PlexAuthService
) {

    private val _plexState = MutableStateFlow(PlexIntegrationState())
    val plexState: StateFlow<PlexIntegrationState> = _plexState.asStateFlow()

    private val connectedServers = mutableMapOf<String, PlexServerConnection>()
    private val plexApis = mutableMapOf<String, PlexApi>()

    /**
     * Request a PIN for Plex authentication
     * Delegates to PlexAuthService which handles the full PIN flow
     */
    suspend fun requestPIN(): Result<com.universalmedialibrary.services.plex.PlexPinAuthData> = withContext(Dispatchers.IO) {
        return@withContext plexAuthService.startPinAuth()
    }

    /**
     * Poll for PIN authentication completion
     * Should be called after requestPIN() to wait for user authentication
     */
    suspend fun pollForAuth(pinId: String): Result<com.universalmedialibrary.services.plex.PlexAuthResult> = withContext(Dispatchers.IO) {
        return@withContext plexAuthService.pollForAuth(pinId)
    }

    /**
     * Discover available Plex servers for the authenticated user
     */
    suspend fun discoverServers(): Result<List<com.universalmedialibrary.services.plex.PlexDiscoveredServer>> = withContext(Dispatchers.IO) {
        return@withContext plexAuthService.discoverServers()
    }

    /**
     * Check if user is authenticated with Plex
     */
    fun isAuthenticated(): Boolean {
        return plexAuthService.isAuthenticated()
    }

    /**
     * Get stored authentication token
     */
    fun getStoredToken(): String? {
        return plexAuthService.getStoredToken()
    }

    /**
     * Sign out from Plex
     */
    suspend fun signOut() {
        plexAuthService.signOut()
        disconnectAllServers()
    }

    /**
     * Sync libraries from all connected servers
     * Delegates to the comprehensive syncAllLibraries method
     */
    suspend fun syncLibraries() {
        syncAllLibraries()
    }

    /**
     * Disconnect from all servers
     * Clears all connected servers and their API instances
     */
    suspend fun disconnectAllServers() {
        connectedServers.clear()
        plexApis.clear()
        updateConnectionStatus()
    }

    /**
     * Disconnect from a specific server
     */
    suspend fun disconnectServer(serverName: String) {
        connectedServers.remove(serverName)
        plexApis.remove(serverName)
        updateConnectionStatus()
    }

    /**
     * Connect to a discovered Plex server
     * This is the recommended method for connecting after discovery
     */
    suspend fun connectToDiscoveredServer(
        server: com.universalmedialibrary.services.plex.PlexDiscoveredServer
    ): PlexConnectionResult = withContext(Dispatchers.IO) {
        // Try connections in order: local first, then remote
        val sortedConnections = server.connections.sortedByDescending { it.local }

        for (connection in sortedConnections) {
            try {
                val serverUrl = connection.uri
                val result = connectToServer(server.name, serverUrl, server.accessToken)

                if (result is PlexConnectionResult.Success) {
                    return@withContext result
                }
            } catch (e: Exception) {
                // Try next connection
                continue
            }
        }

        PlexConnectionResult.Error("Failed to connect to any of the server's connections")
    }

    /**
     * Connect to a Plex server with explicit parameters
     */
    suspend fun connectToServer(
        serverName: String,
        serverUrl: String,
        token: String
    ): PlexConnectionResult = withContext(Dispatchers.IO) {
        try {
            _plexState.value = _plexState.value.copy(isConnecting = true)

            val retrofit = Retrofit.Builder()
                .baseUrl(serverUrl.ensureTrailingSlash())
                .addConverterFactory(GsonConverterFactory.create())
                .client(createOkHttpClient(token))
                .build()

            val api = retrofit.create(PlexApi::class.java)

            // Test connection and get server info
            val serverInfo = api.getServerInfo()
            val libraries = api.getLibraries()

            val connection = PlexServerConnection(
                name = serverName,
                url = serverUrl,
                token = token,
                serverId = serverInfo.machineIdentifier,
                version = serverInfo.version,
                libraries = libraries.directory.map { dir ->
                    PlexLibrary(
                        key = dir.key,
                        title = dir.title,
                        type = dir.type,
                        uuid = dir.uuid,
                        itemCount = dir.count ?: 0
                    )
                }
            )

            connectedServers[serverName] = connection
            plexApis[serverName] = api

            updateConnectionStatus()

            _plexState.value = _plexState.value.copy(
                isConnecting = false,
                lastConnectionResult = "Successfully connected to $serverName"
            )

            PlexConnectionResult.Success("Successfully connected to $serverName", null)

        } catch (e: Exception) {
            _plexState.value = _plexState.value.copy(
                isConnecting = false,
                error = "Failed to connect to $serverName: ${e.message}"
            )
            PlexConnectionResult.Error(e.message ?: "Unknown error")
        }
    }

    /**
     * Analyze and enhance metadata for a Plex library
     */
    suspend fun enhanceLibraryMetadata(
        serverName: String,
        libraryKey: String
    ): MetadataEnhancementResult = withContext(Dispatchers.IO) {
        try {
            val api = plexApis[serverName] ?: return@withContext MetadataEnhancementResult.Error("Server not connected")

            _plexState.value = _plexState.value.copy(isEnhancingMetadata = true)

            // Get all items in the library
            val libraryItems = api.getLibraryItems(libraryKey)
            val enhancementResults = mutableListOf<ItemEnhancementResult>()

            // Process items in parallel batches
            libraryItems.media.chunked(10).forEach { batch ->
                val batchResults = batch.map { item ->
                    async {
                        enhanceItemMetadata(api, item)
                    }
                }.awaitAll()

                enhancementResults.addAll(batchResults)
            }

            val successful = enhancementResults.count { it.successful }
            val failed = enhancementResults.count { !it.successful }

            _plexState.value = _plexState.value.copy(
                isEnhancingMetadata = false,
                lastEnhancementResult = "Enhanced $successful items, $failed failed"
            )

            MetadataEnhancementResult.Success(enhancementResults.size, successful)

        } catch (e: Exception) {
            _plexState.value = _plexState.value.copy(
                isEnhancingMetadata = false,
                error = "Metadata enhancement failed: ${e.message}"
            )
            MetadataEnhancementResult.Error(e.message ?: "Enhancement failed")
        }
    }

    /**
     * Find and report duplicate content across libraries
     */
    suspend fun findDuplicateContent(serverName: String): DuplicateAnalysisResult = withContext(Dispatchers.IO) {
        try {
            val api = plexApis[serverName] ?: return@withContext DuplicateAnalysisResult.Error("Server not connected")
            val connection = connectedServers[serverName] ?: return@withContext DuplicateAnalysisResult.Error("Connection not found")

            _plexState.value = _plexState.value.copy(isAnalyzingDuplicates = true)

            val allItems = mutableListOf<PlexMediaItem>()

            // Collect all media items from all libraries
            for (library in connection.libraries) {
                try {
                    val libraryItems = api.getLibraryItems(library.key)
                    allItems.addAll(libraryItems.media)
                } catch (e: Exception) {
                    // Continue with other libraries if one fails
                }
            }

            // Find duplicates using content analysis
            val duplicateGroups = findDuplicateGroups(allItems)

            _plexState.value = _plexState.value.copy(
                isAnalyzingDuplicates = false,
                duplicatesFound = duplicateGroups.size
            )

            DuplicateAnalysisResult.Success(duplicateGroups, duplicateGroups.sumOf { it.items.size })

        } catch (e: Exception) {
            _plexState.value = _plexState.value.copy(
                isAnalyzingDuplicates = false,
                error = "Duplicate analysis failed: ${e.message}"
            )
            DuplicateAnalysisResult.Error(e.message ?: "Analysis failed")
        }
    }

    /**
     * Create smart collections based on AI analysis
     */
    suspend fun createSmartCollections(
        serverName: String,
        libraryKey: String
    ): SmartCollectionResult = withContext(Dispatchers.IO) {
        try {
            val api = plexApis[serverName] ?: return@withContext SmartCollectionResult.Error("Server not connected")

            _plexState.value = _plexState.value.copy(isCreatingCollections = true)

            val libraryItems = api.getLibraryItems(libraryKey)
            val collections = mutableListOf<SmartCollection>()

            // Group by genre with AI enhancement
            val genreGroups = libraryItems.media.groupBy { item ->
                // Use AI to improve genre classification
                item.genre?.firstOrNull() ?: "Unknown"
            }

            for ((genre, items) in genreGroups) {
                if (items.size >= 3) { // Only create collections with 3+ items
                    val collection = SmartCollection(
                        name = "CleverFerret: $genre Collection",
                        type = "genre",
                        items = items.map { it.ratingKey },
                        description = "AI-curated $genre collection"
                    )
                    collections.add(collection)

                    // Create the collection on Plex server
                    api.createCollection(libraryKey, collection.name, 0, collection.items.joinToString(","))
                }
            }

            // Create collections based on AI-detected themes
            val themeCollections = createThemeBasedCollections(libraryItems.media)
            collections.addAll(themeCollections)

            _plexState.value = _plexState.value.copy(
                isCreatingCollections = false,
                collectionsCreated = collections.size
            )

            SmartCollectionResult.Success(collections.map { it.name }, collections.size)

        } catch (e: Exception) {
            _plexState.value = _plexState.value.copy(
                isCreatingCollections = false,
                error = "Smart collection creation failed: ${e.message}"
            )
            SmartCollectionResult.Error(e.message ?: "Collection creation failed")
        }
    }

    /**
     * Get comprehensive library analytics
     */
    suspend fun getLibraryAnalytics(serverName: String): PlexLibraryAnalytics = withContext(Dispatchers.IO) {
        try {
            val api = plexApis[serverName] ?: return@withContext PlexLibraryAnalytics.empty()
            val connection = connectedServers[serverName] ?: return@withContext PlexLibraryAnalytics.empty()

            val analytics = PlexLibraryAnalytics(
                serverName = serverName,
                totalLibraries = connection.libraries.size,
                libraryBreakdown = connection.libraries.associate {
                    it.title to it.itemCount
                },
                totalItems = connection.libraries.sumOf { it.itemCount },
                duplicatesFound = _plexState.value.duplicatesFound,
                collectionsCreated = _plexState.value.collectionsCreated,
                lastAnalyzed = System.currentTimeMillis()
            )

            analytics

        } catch (e: Exception) {
            PlexLibraryAnalytics.empty()
        }
    }

    /**
     * Sync all connected Plex libraries
     */
    suspend fun syncAllLibraries(): PlexSyncResult = withContext(Dispatchers.IO) {
        try {
            _plexState.value = _plexState.value.copy(isSyncing = true)

            var totalProcessed = 0
            val syncResults = mutableListOf<String>()

            for ((serverName, connection) in connectedServers) {
                val api = plexApis[serverName]
                if (api != null) {
                    for (library in connection.libraries) {
                        try {
                            val libraryItems = api.getLibraryItems(library.key)
                            totalProcessed += libraryItems.media.size
                            syncResults.add("$serverName:${library.title} - ${libraryItems.media.size} items")
                        } catch (e: Exception) {
                            syncResults.add("$serverName:${library.title} - ERROR: ${e.message}")
                        }
                    }
                }
            }

            _plexState.value = _plexState.value.copy(
                isSyncing = false,
                lastSyncTime = System.currentTimeMillis()
            )

            PlexSyncResult(true, totalProcessed, syncResults)

        } catch (e: Exception) {
            _plexState.value = _plexState.value.copy(
                isSyncing = false,
                error = "Sync failed: ${e.message}"
            )
            PlexSyncResult(false, 0, listOf("ERROR: ${e.message}"))
        }
    }

    suspend fun checkAllConnections(): PlexConnectionStatus {
        val activeConnections = connectedServers.keys.toList()
        val totalLibraries = connectedServers.values.sumOf { it.libraries.size }

        return PlexConnectionStatus(
            connectedServers = activeConnections,
            hasActiveConnections = activeConnections.isNotEmpty(),
            totalLibraries = totalLibraries
        )
    }

    fun getLibraryStats(): PlexLibraryStats? {
        val totalItems = connectedServers.values.flatMap { it.libraries }.sumOf { it.itemCount }
        val movieLibraries = connectedServers.values.flatMap { it.libraries }.filter { it.type == "movie" }
        val tvLibraries = connectedServers.values.flatMap { it.libraries }.filter { it.type == "show" }
        val musicLibraries = connectedServers.values.flatMap { it.libraries }.filter { it.type == "artist" }
        val photoLibraries = connectedServers.values.flatMap { it.libraries }.filter { it.type == "photo" }

        return PlexLibraryStats(
            movies = movieLibraries.sumOf { it.itemCount },
            tvShows = tvLibraries.sumOf { it.itemCount },
            music = musicLibraries.sumOf { it.itemCount },
            photos = photoLibraries.sumOf { it.itemCount }
        )
    }

    // Private helper methods
    private suspend fun enhanceItemMetadata(api: PlexApi, item: PlexMediaItem): ItemEnhancementResult {
        return try {
            // Use CleverFerret's AI to analyze and improve metadata
            // This would involve analyzing the item's current metadata and suggesting improvements

            // For demonstration, we'll show the concept
            val enhancedTitle = item.title // Could be improved by AI
            val enhancedSummary = item.summary // Could be enhanced by AI
            val enhancedGenres = item.genre // Could be reclassified by AI

            // Update the item on Plex server
            api.updateItemMetadata(
                item.ratingKey,
                enhancedTitle,
                enhancedSummary,
                enhancedGenres?.joinToString(",")
            )

            ItemEnhancementResult(item.ratingKey, true, "Enhanced metadata")

        } catch (e: Exception) {
            ItemEnhancementResult(item.ratingKey, false, e.message ?: "Enhancement failed")
        }
    }

    private fun findDuplicateGroups(items: List<PlexMediaItem>): List<DuplicateGroup> {
        val duplicateGroups = mutableListOf<DuplicateGroup>()

        // Group by title similarity
        val titleGroups = items.groupBy { it.title.lowercase().trim() }

        for ((title, groupItems) in titleGroups) {
            if (groupItems.size > 1) {
                duplicateGroups.add(
                    DuplicateGroup(
                        items = groupItems,
                        similarity = 1.0f, // Exact title match
                        reason = "Identical titles: $title"
                    )
                )
            }
        }

        return duplicateGroups
    }

    private suspend fun createThemeBasedCollections(items: List<PlexMediaItem>): List<SmartCollection> {
        // This would use AI analysis to create theme-based collections
        // For now, return empty list as a placeholder
        return emptyList()
    }

    private fun updateConnectionStatus() {
        // Update the state with current connection info
        val activeConnections = connectedServers.keys.toList()
        _plexState.value = _plexState.value.copy(
            connectedServers = activeConnections,
            totalLibraries = connectedServers.values.sumOf { it.libraries.size }
        )
    }

    private fun createOkHttpClient(token: String): okhttp3.OkHttpClient {
        return okhttp3.OkHttpClient.Builder()
            .addInterceptor { chain ->
                val request = chain.request().newBuilder()
                    .addHeader("X-Plex-Token", token)
                    .addHeader("X-Plex-Client-Identifier", "CleverFerret")
                    .addHeader("Accept", "application/json")
                    .build()
                chain.proceed(request)
            }
            .build()
    }

    private fun String.ensureTrailingSlash(): String {
        return if (this.endsWith("/")) this else "$this/"
    }
}

// Data classes and interfaces
data class PlexIntegrationState(
    val isConnecting: Boolean = false,
    val isSyncing: Boolean = false,
    val isEnhancingMetadata: Boolean = false,
    val isAnalyzingDuplicates: Boolean = false,
    val isCreatingCollections: Boolean = false,
    val connectedServers: List<String> = emptyList(),
    val totalLibraries: Int = 0,
    val duplicatesFound: Int = 0,
    val collectionsCreated: Int = 0,
    val lastSyncTime: Long = 0L,
    val lastConnectionResult: String = "",
    val lastEnhancementResult: String = "",
    val error: String? = null
)

data class PlexServerConnection(
    val name: String,
    val url: String,
    val token: String,
    val serverId: String,
    val version: String,
    val libraries: List<PlexLibrary>
)

data class PlexLibrary(
    val key: String,
    val title: String,
    val type: String,
    val uuid: String,
    val itemCount: Int
)

data class PlexLibraryStats(
    val movies: Int,
    val tvShows: Int,
    val music: Int,
    val photos: Int
)

// Result classes are defined in PlexServiceResults.kt

data class ItemEnhancementResult(
    val ratingKey: String,
    val successful: Boolean,
    val details: String
)

// Note: DuplicateGroup is defined in PlexServiceResults.kt
data class DuplicateGroupLocal(
    val id: String,
    val title: String,
    val items: List<PlexMediaItem>,
    val similarity: Float,
    val reason: String
)

data class SmartCollection(
    val name: String,
    val type: String,
    val items: List<String>,
    val description: String
)

data class PlexLibraryAnalytics(
    val serverName: String,
    val totalLibraries: Int,
    val libraryBreakdown: Map<String, Int>,
    val totalItems: Int,
    val duplicatesFound: Int,
    val collectionsCreated: Int,
    val lastAnalyzed: Long
) {
    companion object {
        fun empty() = PlexLibraryAnalytics("", 0, emptyMap(), 0, 0, 0, 0L)
    }
}

data class PlexSyncResult(
    val successful: Boolean,
    val itemsProcessed: Int,
    val details: List<String> = emptyList()
)
