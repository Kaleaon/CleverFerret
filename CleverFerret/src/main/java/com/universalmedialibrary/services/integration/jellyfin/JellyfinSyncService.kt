package com.universalmedialibrary.services.integration.jellyfin

import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.entity.JellyfinServer
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import kotlinx.coroutines.flow.*
import retrofit2.Response
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Complete Jellyfin Integration Service
 *
 * Features:
 * - Server authentication and connection
 * - Library synchronization
 * - Media item fetching
 * - Metadata synchronization
 * - Progress tracking
 */
@Singleton
class JellyfinSyncService @Inject constructor(
    private val database: AppDatabase,
    private val jellyfinIntegration: JellyfinIntegrationService
) {
    private val jellyfinServerDao = database.jellyfinServerDao()
    private val libraryDao = database.libraryDao()
    private val mediaItemDao = database.mediaItemDao()
    private val metadataDao = database.metadataDao()

    private val _syncState = MutableStateFlow(JellyfinSyncState())
    val syncState: StateFlow<JellyfinSyncState> = _syncState.asStateFlow()

    /**
     * Authenticate with Jellyfin server
     */
    suspend fun authenticateServer(
        serverUrl: String,
        username: String,
        password: String
    ): Result<JellyfinServer> {
        return try {
            _syncState.value = _syncState.value.copy(isConnecting = true, error = null)

            val api = jellyfinIntegration.createApi(serverUrl)

            // Authenticate and get token
            val authResponse = api.authenticate(
                mapOf(
                    "Username" to username,
                    "Pw" to password
                )
            )

            if (authResponse.isSuccessful && authResponse.body() != null) {
                val authData = authResponse.body() ?: run {
                    val error = "Empty authentication response"
                    _syncState.value = _syncState.value.copy(isConnecting = false, error = error)
                    return Result.failure(Exception(error))
                }

                val accessToken = authData["AccessToken"] as? String
                val userId = authData["User"]?.let { (it as? Map<*, *>)?.get("Id") as? String }

                if (accessToken != null && userId != null) {
                    // Get server info
                    val userResponse = api.getCurrentUser(accessToken)
                    val serverName = userResponse.body()?.get("ServerName") as? String ?: "Jellyfin Server"

                    // Parse URL to extract host and port
                    val url = java.net.URL(serverUrl)
                    val host = url.host
                    val port = if (url.port > 0) url.port else 8096

                    val server = JellyfinServer(
                        name = serverName,
                        host = host,
                        port = port,
                        apiKey = accessToken, // Map accessToken to apiKey
                        userId = userId,
                        isActive = true
                    )

                    // Save to database
                    val serverId = jellyfinServerDao.insert(server)
                    val savedServer = server.copy(id = serverId)

                    _syncState.value = _syncState.value.copy(
                        isConnecting = false,
                        isConnected = true,
                        currentServer = savedServer
                    )

                    Result.success(savedServer)
                } else {
                    val error = "Invalid authentication response"
                    _syncState.value = _syncState.value.copy(isConnecting = false, error = error)
                    Result.failure(Exception(error))
                }
            } else {
                val error = "Authentication failed: ${authResponse.message()}"
                _syncState.value = _syncState.value.copy(isConnecting = false, error = error)
                Result.failure(Exception(error))
            }
        } catch (e: Exception) {
            val error = "Connection error: ${e.message}"
            _syncState.value = _syncState.value.copy(isConnecting = false, error = error)
            Result.failure(e)
        }
    }

    /**
     * Sync libraries from Jellyfin server
     */
    suspend fun syncLibraries(server: JellyfinServer): Result<List<Library>> {
        return try {
            _syncState.value = _syncState.value.copy(isSyncing = true, error = null)

            // Reconstruct URL from host and port
            val serverUrl = "http://${server.host}:${server.port}"
            val api = jellyfinIntegration.createApi(serverUrl)
            val response = api.getLibraries(server.apiKey ?: "")

            if (response.isSuccessful && response.body() != null) {
                val responseBody = response.body() ?: run {
                    val error = "Empty response from server"
                    _syncState.value = _syncState.value.copy(isSyncing = false, error = error)
                    return Result.failure(Exception(error))
                }

                val items = responseBody["Items"] as? List<Map<String, Any>> ?: emptyList()
                val libraries = mutableListOf<Library>()

                items.forEach { item ->
                    val libraryId = item["Id"] as? String ?: return@forEach
                    val name = item["Name"] as? String ?: "Unknown Library"
                    val collectionType = item["CollectionType"] as? String

                    // Map Jellyfin types to CleverFerret types
                    val type = when (collectionType) {
                        "movies" -> "MOVIE"
                        "tvshows" -> "TV_SHOW"
                        "music" -> "MUSIC"
                        "books" -> "BOOK"
                        else -> "DOCUMENT"
                    }

                    val library = Library(
                        name = "$name (Jellyfin)",
                        type = type,
                        path = "jellyfin://${server.id}/$libraryId",
                        source = "JELLYFIN"
                    )

                    val localLibraryId = libraryDao.insertLibrary(library)
                    libraries.add(library.copy(libraryId = localLibraryId))
                }

                _syncState.value = _syncState.value.copy(
                    isSyncing = false,
                    syncedLibraries = libraries.size,
                    lastSyncTime = System.currentTimeMillis()
                )

                Result.success(libraries)
            } else {
                val error = "Failed to fetch libraries: ${response.message()}"
                _syncState.value = _syncState.value.copy(isSyncing = false, error = error)
                Result.failure(Exception(error))
            }
        } catch (e: Exception) {
            val error = "Sync error: ${e.message}"
            _syncState.value = _syncState.value.copy(isSyncing = false, error = error)
            Result.failure(e)
        }
    }

    /**
     * Sync media items from a specific library
     */
    suspend fun syncMediaItems(
        server: JellyfinServer,
        jellyfinLibraryId: String,
        localLibraryId: Long
    ): Result<Int> {
        return try {
            _syncState.value = _syncState.value.copy(isSyncing = true)

            // Reconstruct URL from host and port
            val serverUrl = "http://${server.host}:${server.port}"
            val api = jellyfinIntegration.createApi(serverUrl)
            val response = api.getLibraryItems(
                userId = server.userId ?: "",
                token = server.apiKey ?: ""
            )

            if (response.isSuccessful && response.body() != null) {
                val responseBody = response.body() ?: run {
                    val error = "Empty response from server"
                    _syncState.value = _syncState.value.copy(isSyncing = false, error = error)
                    return Result.failure(Exception(error))
                }

                val items = responseBody["Items"] as? List<Map<String, Any>> ?: emptyList()
                var syncedCount = 0

                items.forEach { item ->
                    val itemId = item["Id"] as? String ?: return@forEach
                    val name = item["Name"] as? String ?: "Unknown"
                    val type = item["Type"] as? String

                    // Create MediaItem stub
                    val mediaItem = MediaItem(
                        libraryId = localLibraryId,
                        filePath = "jellyfin://${server.id}/$itemId",
                        fileName = name,
                        fileExtension = "",
                        fileSize = 0, // Unknown for remote
                        mediaType = getMediaTypeFromJellyfinType(type)
                    )

                    val localItemId = mediaItemDao.insertMediaItem(mediaItem)

                    // Create metadata
                    val serverUrl = "http://${server.host}:${server.port}"
                    val thumbnailUrl = getJellyfinImageUrl(serverUrl, itemId, server.apiKey ?: "")
                    val metadata = MetadataCommon(
                        itemId = localItemId,
                        title = name
                    )

                    metadataDao.insertMetadataCommon(metadata)
                    syncedCount++
                }

                _syncState.value = _syncState.value.copy(
                    isSyncing = false,
                    syncedItems = syncedCount,
                    lastSyncTime = System.currentTimeMillis()
                )

                Result.success(syncedCount)
            } else {
                val error = "Failed to fetch items: ${response.message()}"
                _syncState.value = _syncState.value.copy(isSyncing = false, error = error)
                Result.failure(Exception(error))
            }
        } catch (e: Exception) {
            _syncState.value = _syncState.value.copy(isSyncing = false, error = e.message)
            Result.failure(e)
        }
    }

    private fun getMimeTypeFromJellyfinType(type: String?): String {
        return when (type) {
            "Movie" -> "video/mp4"
            "Episode" -> "video/mp4"
            "Audio" -> "audio/mp3"
            "Book" -> "application/epub+zip"
            else -> "application/octet-stream"
        }
    }

    private fun getMediaTypeFromJellyfinType(type: String?): String {
        return when (type) {
            "Movie" -> "MOVIE"
            "Episode" -> "TV_SHOW"
            "Audio" -> "MUSIC"
            "Book" -> "BOOK"
            else -> "DOCUMENT"
        }
    }

    private fun getJellyfinImageUrl(serverUrl: String, itemId: String, token: String): String {
        return "$serverUrl/Items/$itemId/Images/Primary?api_key=$token"
    }

    fun disconnectServer() {
        _syncState.value = JellyfinSyncState()
    }
}

data class JellyfinSyncState(
    val isConnecting: Boolean = false,
    val isConnected: Boolean = false,
    val isSyncing: Boolean = false,
    val currentServer: JellyfinServer? = null,
    val syncedLibraries: Int = 0,
    val syncedItems: Int = 0,
    val lastSyncTime: Long? = null,
    val error: String? = null
)
