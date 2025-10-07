package com.universalmedialibrary.services.plex

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for syncing progress, ratings, collections and tags with Plex Media Server
 * Also handles mapping Plex items to the unified MediaItem model
 */
@Singleton
class PlexSyncService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val plexServerDao: PlexServerDao,
    private val mediaItemDao: MediaItemDao,
    private val libraryDao: LibraryDao,
    private val authService: PlexAuthService
) {

    companion object {
        private const val TAG = "PlexSyncService"
    }

    private val _syncStatus = MutableStateFlow<PlexSyncStatus>(PlexSyncStatus.Idle)
    val syncStatus: Flow<PlexSyncStatus> = _syncStatus.asStateFlow()

    private val retrofitInstances = mutableMapOf<String, PlexApi>()

    /**
     * Add a new Plex server
     */
    suspend fun addServer(
        name: String,
        host: String,
        port: Int = 32400,
        token: String
    ): Result<PlexServer> {
        return try {
            val api = getPlexApi(host, port)
            val serverInfo = api.getServerInfo(token)

            if (serverInfo.isSuccessful && serverInfo.body() != null) {
                val info = serverInfo.body()!!
                val server = PlexServer(
                    name = name,
                    host = host,
                    port = port,
                    token = token,
                    machineIdentifier = info.machineIdentifier,
                    version = info.version,
                    lastConnected = System.currentTimeMillis()
                )

                val serverId = plexServerDao.insertServer(server)
                Result.success(server.copy(serverId = serverId))
            } else {
                Result.failure(Exception("Failed to connect to Plex server: ${serverInfo.message()}"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error adding server", e)
            Result.failure(e)
        }
    }

    /**
     * Sync all active servers
     */
    suspend fun syncAllServers(): Result<Unit> {
        return try {
            _syncStatus.value = PlexSyncStatus.Syncing("Starting sync...")

            plexServerDao.getActiveServers().collect { servers ->
                for (server in servers) {
                    syncServer(server)
                }
            }

            _syncStatus.value = PlexSyncStatus.Success("Sync completed successfully")
            Result.success(Unit)
        } catch (e: Exception) {
            Log.e(TAG, "Error during sync", e)
            _syncStatus.value = PlexSyncStatus.Error("Sync failed: ${e.message}")
            Result.failure(e)
        }
    }

    /**
     * Sync a specific server
     */
    suspend fun syncServer(server: PlexServer): Result<Unit> {
        return try {
            _syncStatus.value = PlexSyncStatus.Syncing("Syncing ${server.name}...")

            val api = getPlexApi(server.host, server.port)

            // Test connection
            val serverInfo = api.getServerInfo(server.token)
            if (!serverInfo.isSuccessful) {
                throw Exception("Cannot connect to ${server.name}")
            }

            // Update last connected
            plexServerDao.updateLastConnected(server.serverId, System.currentTimeMillis())

            // Sync libraries and media items
            syncMediaItems(server, api)

            // Sync progress
            syncProgress(server, api)

            // Sync ratings
            syncRatings(server, api)

            // Sync collections
            syncCollections(server, api)

            // Update last synced
            plexServerDao.updateLastSynced(server.serverId, System.currentTimeMillis())

            Result.success(Unit)
        } catch (e: Exception) {
            Log.e(TAG, "Error syncing server ${server.name}", e)
            Result.failure(e)
        }
    }

    /**
     * Sync media items from Plex and map to unified model
     */
    private suspend fun syncMediaItems(server: PlexServer, api: PlexApi) {
        val libraries = api.getLibraries(server.token)
        val librariesBody = libraries.body()
        if (!libraries.isSuccessful || librariesBody?.mediaContainer?.directories == null) return

        for (library in librariesBody.mediaContainer.directories) {
            // Create or get a unified library for this Plex library
            val unifiedLibrary = getOrCreateUnifiedLibrary(server, library)

            val items = api.getLibraryItems(library.key, server.token)
            val itemsBody = items.body()
            if (items.isSuccessful && itemsBody?.mediaContainer?.metadata != null) {
                val plexItems = itemsBody.mediaContainer.metadata.map { metadata ->
                    PlexMediaItem(
                        serverId = server.serverId,
                        plexRatingKey = metadata.ratingKey,
                        title = metadata.title,
                        type = metadata.type,
                        year = metadata.year,
                        duration = metadata.duration,
                        libraryName = library.title,
                        librarySectionId = library.key
                    )
                }
                plexMediaItemDao.insertMediaItems(plexItems)

                // Map to unified MediaItem model (stub entries)
                mapPlexItemsToUnifiedModel(itemsBody.mediaContainer.metadata, unifiedLibrary.libraryId, server)
            }
        }
    }

    /**
     * Get or create a unified library for a Plex library section
     */
    private suspend fun getOrCreateUnifiedLibrary(server: PlexServer, plexLibrary: PlexLibrary): Library {
        val libraryName = "${server.name} - ${plexLibrary.title}"
        val existingLibrary = libraryDao.getLibraryByName(libraryName)

        return if (existingLibrary != null) {
            existingLibrary
        } else {
            val mediaType = mapPlexTypeToMediaType(plexLibrary.type)
            val library = Library(
                name = libraryName,
                path = "plex://${server.machineIdentifier}/${plexLibrary.key}",
                type = mediaType
            )
            val libraryId = libraryDao.insertLibrary(library)
            library.copy(libraryId = libraryId)
        }
    }

    /**
     * Map Plex items to unified MediaItem model (stub entries)
     */
    private suspend fun mapPlexItemsToUnifiedModel(
        plexMetadata: List<PlexMetadata>,
        libraryId: Long,
        server: PlexServer
    ) {
        for (metadata in plexMetadata) {
            val existingItem = mediaItemDao.getMediaItemByPath(
                "plex://${server.machineIdentifier}/${metadata.ratingKey}"
            )

            if (existingItem == null) {
                // Create stub entry in unified model
                val mediaItem = MediaItem(
                    libraryId = libraryId,
                    filePath = "plex://${server.machineIdentifier}/${metadata.ratingKey}",
                    fileName = metadata.title,
                    fileExtension = "", // Plex items don't have extensions
                    fileSize = 0L, // Size not available from Plex metadata
                    fileHash = metadata.ratingKey, // Use rating key as unique identifier
                    mediaType = mapPlexTypeToMediaType(metadata.type),
                    mimeType = null,
                    isAvailable = true,
                    hasMetadata = true,
                    hasThumbnail = !metadata.thumb.isNullOrEmpty(),
                    thumbnailPath = metadata.thumb
                )
                mediaItemDao.insertMediaItem(mediaItem)
            }
        }
    }

    /**
     * Map Plex media type to unified media type
     */
    private fun mapPlexTypeToMediaType(plexType: String): String {
        return when (plexType.lowercase()) {
            "movie" -> "MOVIE"
            "show", "season", "episode" -> "TV_SHOW"
            "artist", "album", "track" -> "MUSIC_TRACK"
            else -> "OTHER"
        }
    }

    /**
     * Sync playback progress
     */
    private suspend fun syncProgress(server: PlexServer, api: PlexApi) {
        // TODO: Implement when PlexSyncDao and PlexMediaItemDao are enabled
        // Get items that need progress sync
        // val progressItems = plexSyncDao.getProgressNeedingSync()
        //
        // for (progressItem in progressItems) {
        //     try {
        //         val plexItem = plexMediaItemDao.getMediaItemByRatingKey(progressItem.plexMediaItemId.toString())
        //         if (plexItem != null) {
        //             // Update progress on Plex
        //             if (progressItem.localProgress > progressItem.plexProgress) {
        //                 api.updateProgress(
        //                     token = server.token,
        //                     time = progressItem.localProgress,
        //                     state = "paused",
        //                     ratingKey = plexItem.plexRatingKey,
        //                     key = "/library/metadata/${plexItem.plexRatingKey}"
        //                 )
        //             }
        //
        //             // Mark as synced
        //             plexSyncDao.markProgressSynced(progressItem.id, System.currentTimeMillis())
        //         }
        //     } catch (e: Exception) {
        //         Log.e(TAG, "Error syncing progress for item ${progressItem.id}", e)
        //     }
        // }
    }

    /**
     * Sync ratings
     */
    private suspend fun syncRatings(server: PlexServer, api: PlexApi) {
        // TODO: Implement when PlexSyncDao and PlexMediaItemDao are enabled
        // val ratingItems = plexSyncDao.getRatingsNeedingSync()
        //
        // for (ratingItem in ratingItems) {
        //     try {
        //         val plexItem = plexMediaItemDao.getMediaItemByRatingKey(ratingItem.plexMediaItemId.toString())
        //         if (plexItem != null && ratingItem.localRating != null) {
        //             // Update rating on Plex
        //             api.updateMediaItem(
        //                 ratingKey = plexItem.plexRatingKey,
        //                 token = server.token,
        //                 rating = ratingItem.localRating
        //             )
        //
        //             // Mark as synced
        //             plexSyncDao.markRatingSynced(ratingItem.id, System.currentTimeMillis())
        //         }
        //     } catch (e: Exception) {
        //         Log.e(TAG, "Error syncing rating for item ${ratingItem.id}", e)
        //     }
        // }
    }

    /**
     * Sync collections
     */
    private suspend fun syncCollections(server: PlexServer, api: PlexApi) {
        val collections = api.getCollections(server.token)
        val collectionsBody = collections.body()
        if (collections.isSuccessful && collectionsBody?.mediaContainer?.metadata != null) {
            for (collectionData in collectionsBody.mediaContainer.metadata) {
                val collection = PlexCollection(
                    serverId = server.serverId,
                    plexRatingKey = collectionData.ratingKey,
                    title = collectionData.title,
                    type = collectionData.type,
                    summary = collectionData.summary,
                    itemCount = collectionData.childCount
                )

                val collectionId = plexSyncDao.insertCollection(collection)

                // Get collection items
                val collectionItems = api.getCollectionItems(collectionData.ratingKey, server.token)
                val collectionItemsBody = collectionItems.body()
                if (collectionItems.isSuccessful && collectionItemsBody?.mediaContainer?.metadata != null) {
                    // Clear existing items
                    plexSyncDao.deleteCollectionItems(collectionId)

                    // Add new items
                    val items = collectionItemsBody.mediaContainer.metadata.mapIndexedNotNull { index, metadata ->
                        val plexItem = plexMediaItemDao.getMediaItemByRatingKey(metadata.ratingKey)
                        plexItem?.let {
                            PlexCollectionItem(
                                collectionId = collectionId,
                                plexMediaItemId = it.id,
                                sortOrder = index
                            )
                        }
                    }
                    plexSyncDao.insertCollectionItems(items)
                }
            }
        }
    }

    /**
     * Update local progress and mark for sync
     */
    suspend fun updateLocalProgress(plexMediaItemId: Long, progress: Long): Result<Unit> {
        return try {
            val existingProgress = plexSyncDao.getProgressByItemId(plexMediaItemId)
            if (existingProgress != null) {
                val updated = existingProgress.copy(
                    localProgress = progress,
                    needsSync = true,
                    updatedAt = System.currentTimeMillis()
                )
                plexSyncDao.updateProgress(updated)
            } else {
                val newProgress = PlexProgress(
                    plexMediaItemId = plexMediaItemId,
                    localProgress = progress,
                    needsSync = true
                )
                plexSyncDao.insertProgress(newProgress)
            }
            Result.success(Unit)
        } catch (e: Exception) {
            Log.e(TAG, "Error updating local progress", e)
            Result.failure(e)
        }
    }

    /**
     * Update local rating and mark for sync
     */
    suspend fun updateLocalRating(plexMediaItemId: Long, rating: Float): Result<Unit> {
        return try {
            val existingRating = plexSyncDao.getRatingByItemId(plexMediaItemId)
            if (existingRating != null) {
                val updated = existingRating.copy(
                    localRating = rating,
                    needsSync = true,
                    updatedAt = System.currentTimeMillis()
                )
                plexSyncDao.updateRating(updated)
            } else {
                val newRating = PlexRating(
                    plexMediaItemId = plexMediaItemId,
                    localRating = rating,
                    needsSync = true
                )
                plexSyncDao.insertRating(newRating)
            }
            Result.success(Unit)
        } catch (e: Exception) {
            Log.e(TAG, "Error updating local rating", e)
            Result.failure(e)
        }
    }

    /**
     * Get all active servers
     */
    fun getAllServers(): Flow<List<PlexServer>> {
        return plexServerDao.getAllActiveServers()
    }

    /**
     * Get Plex API instance for server
     */
    private fun getPlexApi(host: String, port: Int): PlexApi {
        val baseUrl = "http://$host:$port"
        val key = "$host:$port"

        return retrofitInstances.getOrPut(key) {
            Retrofit.Builder()
                .baseUrl(baseUrl)
                .addConverterFactory(GsonConverterFactory.create())
                .build()
                .create(PlexApi::class.java)
        }
    }
}

/**
 * Sync status sealed class
 */
/**
 * Sync status sealed class
 */
sealed class PlexSyncStatus {
    object Idle : PlexSyncStatus()
    data class Syncing(val message: String) : PlexSyncStatus()
    data class Success(val message: String) : PlexSyncStatus()
    data class Error(val message: String) : PlexSyncStatus()
}
