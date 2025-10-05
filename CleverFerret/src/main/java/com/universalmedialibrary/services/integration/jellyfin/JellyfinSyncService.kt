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
                val authData = authResponse.body()!!
                val accessToken = authData["AccessToken"] as? String
                val userId = authData["User"]?.let { (it as? Map<*, *>)?.get("Id") as? String }

                if (accessToken != null && userId != null) {
                    // Get server info
                    val userResponse = api.getCurrentUser(accessToken)
                    val serverName = userResponse.body()?.get("ServerName") as? String ?: "Jellyfin Server"

                    val server = JellyfinServer(
                        url = serverUrl,
                        name = serverName,
                        accessToken = accessToken,
                        userId = userId,
                        isActive = true
                    )

                    // Save to database
                    val serverId = jellyfinServerDao.insert(server)
                    val savedServer = server.copy(serverId = serverId)

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

            val api = jellyfinIntegration.createApi(server.url)
            val response = api.getLibraries(server.accessToken)

            if (response.isSuccessful && response.body() != null) {
                val items = response.body()!!["Items"] as? List<Map<String, Any>> ?: emptyList()
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
                        path = "jellyfin://${server.serverId}/$libraryId",
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

            val api = jellyfinIntegration.createApi(server.url)
            val response = api.getLibraryItems(
                token = server.accessToken,
                libraryId = jellyfinLibraryId
            )

            if (response.isSuccessful && response.body() != null) {
                val items = response.body()!!["Items"] as? List<Map<String, Any>> ?: emptyList()
                var syncedCount = 0

                items.forEach { item ->
                    val itemId = item["Id"] as? String ?: return@forEach
                    val name = item["Name"] as? String ?: "Unknown"
                    val type = item["Type"] as? String

                    // Create MediaItem stub
                    val mediaItem = MediaItem(
                        libraryId = localLibraryId,
                        filePath = "jellyfin://${server.serverId}/$itemId",
                        fileName = name,
                        fileSize = 0, // Unknown for remote
                        mimeType = getMimeTypeFromJellyfinType(type),
                        mediaType = getMediaTypeFromJellyfinType(type)
                    )

                    val localItemId = mediaItemDao.insertMediaItem(mediaItem)

                    // Create metadata
                    val metadata = MetadataCommon(
                        itemId = localItemId,
                        title = name,
                        description = item["Overview"] as? String,
                        rating = (item["CommunityRating"] as? Double)?.toFloat(),
                        thumbnailPath = getJellyfinImageUrl(server.url, itemId, server.accessToken),
                        isFavorite = false,
                        isDownloaded = false
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