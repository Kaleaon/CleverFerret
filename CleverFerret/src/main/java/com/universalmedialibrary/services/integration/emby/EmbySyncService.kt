package com.universalmedialibrary.services.integration.emby

import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.entity.EmbyServer
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Complete Emby Integration Service
 *
 * Features:
 * - Server authentication and connection
 * - Library synchronization
 * - Media item fetching
 * - Metadata synchronization
 * - Progress tracking
 *
 * Note: Emby API is very similar to Jellyfin (both use X-Emby-Token header)
 */
@Singleton
class EmbySyncService @Inject constructor(
    private val database: AppDatabase,
    private val embyIntegration: EmbyIntegrationService
) {
    private val embyServerDao = database.embyServerDao()
    private val libraryDao = database.libraryDao()
    private val mediaItemDao = database.mediaItemDao()
    private val metadataDao = database.metadataDao()

    private val _syncState = MutableStateFlow(EmbySyncState())
    val syncState: StateFlow<EmbySyncState> = _syncState.asStateFlow()

    /**
     * Authenticate with Emby server
     */
    suspend fun authenticateServer(
        serverUrl: String,
        username: String,
        password: String
    ): Result<EmbyServer> {
        return try {
            _syncState.value = _syncState.value.copy(isConnecting = true, error = null)

            val api = embyIntegration.createApi(serverUrl)

            // Authenticate and get token
            val authResponse = api.authenticate(
                mapOf(
                    "Username" to username,
                    "Password" to password
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
                    val serverName = userResponse.body()?.get("ServerName") as? String ?: "Emby Server"

                    // Parse URL to extract host and port
                    val url = java.net.URL(serverUrl)
                    val host = url.host
                    val port = if (url.port > 0) url.port else 8096

                    val server = EmbyServer(
                        name = serverName,
                        host = host,
                        port = port,
                        apiKey = accessToken, // Map accessToken to apiKey
                        userId = userId,
                        isActive = true
                    )

                    // Save to database
                    val serverId = embyServerDao.insert(server)
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
     * Sync libraries from Emby server
     */
    suspend fun syncLibraries(server: EmbyServer): Result<List<Library>> {
        return try {
            _syncState.value = _syncState.value.copy(isSyncing = true, error = null)

            // Reconstruct URL from host and port
            val serverUrl = "http://${server.host}:${server.port}"
            val api = embyIntegration.createApi(serverUrl)
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

                    // Map Emby types to CleverFerret types
                    val type = when (collectionType) {
                        "movies" -> "MOVIE"
                        "tvshows" -> "TV_SHOW"
                        "music" -> "MUSIC"
                        "books" -> "BOOK"
                        else -> "DOCUMENT"
                    }

                    val library = Library(
                        name = "$name (Emby)",
                        type = type,
                        path = "emby://${server.id}/$libraryId",
                        source = "EMBY"
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
        server: EmbyServer,
        embyLibraryId: String,
        localLibraryId: Long
    ): Result<Int> {
        return try {
            _syncState.value = _syncState.value.copy(isSyncing = true)

            // Reconstruct URL from host and port
            val serverUrl = "http://${server.host}:${server.port}"
            val api = embyIntegration.createApi(serverUrl)
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
                    val path = item["Path"] as? String
                        ?: (item["MediaSources"] as? List<Map<String, Any>>)
                            ?.firstOrNull()
                            ?.get("Path") as? String
                    val size = (item["Size"] as? Number)?.toLong()
                        ?: ((item["MediaSources"] as? List<Map<String, Any>>)
                            ?.firstOrNull()
                            ?.get("Size") as? Number)?.toLong()
                        ?: 0L
                    val fileExtension = path?.substringAfterLast('.', "")?.lowercase().orEmpty()
                    val fileName = path?.substringAfterLast('/')?.ifBlank { name } ?: name

                    val mediaItem = MediaItem(
                        libraryId = localLibraryId,
                        filePath = path ?: "emby://${server.id}/$itemId",
                        fileName = fileName,
                        fileExtension = fileExtension,
                        fileSize = size,
                        mediaType = getMediaTypeFromEmbyType(type),
                        isAvailable = path != null,
                        hasMetadata = true
                    )

                    val localItemId = mediaItemDao.insertMediaItem(mediaItem)

                    // Create metadata
                    val serverUrl = "http://${server.host}:${server.port}"
                    val thumbnailUrl = getEmbyImageUrl(serverUrl, itemId, server.apiKey ?: "")
                    val metadata = MetadataCommon(
                        itemId = localItemId,
                        title = name,
                        summary = item["Overview"] as? String,
                        coverImagePath = thumbnailUrl
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

    private fun getMimeTypeFromEmbyType(type: String?): String {
        return when (type) {
            "Movie" -> "video/mp4"
            "Episode" -> "video/mp4"
            "Audio" -> "audio/mp3"
            "Book" -> "application/epub+zip"
            else -> "application/octet-stream"
        }
    }

    private fun getMediaTypeFromEmbyType(type: String?): String {
        return when (type) {
            "Movie" -> "MOVIE"
            "Episode" -> "TV_SHOW"
            "Audio" -> "MUSIC"
            "Book" -> "BOOK"
            else -> "DOCUMENT"
        }
    }

    private fun getEmbyImageUrl(serverUrl: String, itemId: String, token: String): String {
        return "$serverUrl/Items/$itemId/Images/Primary?api_key=$token"
    }

    fun disconnectServer() {
        _syncState.value = EmbySyncState()
    }
}

data class EmbySyncState(
    val isConnecting: Boolean = false,
    val isConnected: Boolean = false,
    val isSyncing: Boolean = false,
    val currentServer: EmbyServer? = null,
    val syncedLibraries: Int = 0,
    val syncedItems: Int = 0,
    val lastSyncTime: Long? = null,
    val error: String? = null
)
