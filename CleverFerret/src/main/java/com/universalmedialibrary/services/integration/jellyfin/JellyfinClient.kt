package com.universalmedialibrary.services.integration.jellyfin

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import org.jellyfin.sdk.Jellyfin
import org.jellyfin.sdk.api.client.ApiClient
import org.jellyfin.sdk.api.client.extensions.itemsApi
import org.jellyfin.sdk.api.client.extensions.libraryApi
import org.jellyfin.sdk.api.client.extensions.systemApi
import org.jellyfin.sdk.api.client.extensions.userApi
import org.jellyfin.sdk.api.client.extensions.userLibraryApi
import org.jellyfin.sdk.model.api.BaseItemDto
import org.jellyfin.sdk.model.api.BaseItemKind
import org.jellyfin.sdk.model.api.ItemFields
import org.jellyfin.sdk.model.api.SystemInfo
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Jellyfin Client using official Jellyfin Kotlin SDK
 * Provides type-safe access to Jellyfin media server
 */
@Singleton
class JellyfinClient @Inject constructor(
    private val okHttpClient: OkHttpClient
) {
    private var jellyfin: Jellyfin? = null
    private var apiClient: ApiClient? = null

    /**
     * Initialize connection to Jellyfin server
     */
    fun initialize(serverUrl: String, apiKey: String? = null) {
        jellyfin = Jellyfin {
            context = null // Android context not needed for basic operations
            
            // Configure client info
            clientInfo {
                name = "CleverFerret"
                version = "1.0.0"
            }
            
            // Use existing OkHttp client
            httpClientOptions {
                client = okHttpClient
            }
        }
        
        apiClient = if (apiKey != null) {
            jellyfin?.createApi(
                baseUrl = serverUrl,
                accessToken = apiKey
            )
        } else {
            jellyfin?.createApi(baseUrl = serverUrl)
        }
    }

    /**
     * Authenticate with username and password
     */
    suspend fun authenticate(serverUrl: String, username: String, password: String): Result<String> = 
        withContext(Dispatchers.IO) {
            try {
                initialize(serverUrl)
                val client = apiClient ?: return@withContext Result.failure(
                    IllegalStateException("API client not initialized")
                )
                
                val response by client.userApi.authenticateUserByName(
                    username = username,
                    password = password
                )
                
                val accessToken = response.accessToken
                    ?: return@withContext Result.failure(
                        IllegalStateException("No access token received")
                    )
                
                // Reinitialize with access token
                initialize(serverUrl, accessToken)
                
                Result.success(accessToken)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }

    /**
     * Get server information
     */
    suspend fun getServerInfo(): Result<SystemInfo> = withContext(Dispatchers.IO) {
        try {
            val client = apiClient ?: return@withContext Result.failure(
                IllegalStateException("API client not initialized")
            )
            
            val response by client.systemApi.getSystemInfo()
            Result.success(response)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Get all library views
     */
    suspend fun getLibraryViews(): Result<List<BaseItemDto>> = withContext(Dispatchers.IO) {
        try {
            val client = apiClient ?: return@withContext Result.failure(
                IllegalStateException("API client not initialized")
            )
            
            val userId = client.userId ?: return@withContext Result.failure(
                IllegalStateException("User not authenticated")
            )
            
            val response by client.userLibraryApi.getUserViews(userId = userId)
            Result.success(response.items.orEmpty())
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Get items from a specific library
     */
    suspend fun getLibraryItems(
        parentId: String? = null,
        itemTypes: List<BaseItemKind> = listOf(
            BaseItemKind.MOVIE,
            BaseItemKind.SERIES,
            BaseItemKind.AUDIO,
            BaseItemKind.BOOK
        ),
        startIndex: Int = 0,
        limit: Int = 50
    ): Result<List<BaseItemDto>> = withContext(Dispatchers.IO) {
        try {
            val client = apiClient ?: return@withContext Result.failure(
                IllegalStateException("API client not initialized")
            )
            
            val userId = client.userId ?: return@withContext Result.failure(
                IllegalStateException("User not authenticated")
            )
            
            val response by client.itemsApi.getItems(
                userId = userId,
                parentId = parentId,
                includeItemTypes = itemTypes,
                startIndex = startIndex,
                limit = limit,
                recursive = true,
                fields = listOf(
                    ItemFields.OVERVIEW,
                    ItemFields.GENRES,
                    ItemFields.PEOPLE,
                    ItemFields.STUDIOS,
                    ItemFields.TAGS,
                    ItemFields.MEDIA_SOURCES
                )
            )
            
            Result.success(response.items.orEmpty())
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Get recently added items
     */
    suspend fun getRecentlyAdded(limit: Int = 20): Result<List<BaseItemDto>> = 
        withContext(Dispatchers.IO) {
            try {
                val client = apiClient ?: return@withContext Result.failure(
                    IllegalStateException("API client not initialized")
                )
                
                val userId = client.userId ?: return@withContext Result.failure(
                    IllegalStateException("User not authenticated")
                )
                
                val response by client.userLibraryApi.getLatestMedia(
                    userId = userId,
                    limit = limit,
                    fields = listOf(
                        ItemFields.OVERVIEW,
                        ItemFields.GENRES,
                        ItemFields.PEOPLE
                    )
                )
                
                Result.success(response)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }

    /**
     * Search for items
     */
    suspend fun searchItems(
        searchTerm: String,
        itemTypes: List<BaseItemKind> = listOf(
            BaseItemKind.MOVIE,
            BaseItemKind.SERIES,
            BaseItemKind.AUDIO,
            BaseItemKind.BOOK
        ),
        limit: Int = 50
    ): Result<List<BaseItemDto>> = withContext(Dispatchers.IO) {
        try {
            val client = apiClient ?: return@withContext Result.failure(
                IllegalStateException("API client not initialized")
            )
            
            val userId = client.userId ?: return@withContext Result.failure(
                IllegalStateException("User not authenticated")
            )
            
            val response by client.itemsApi.getItems(
                userId = userId,
                searchTerm = searchTerm,
                includeItemTypes = itemTypes,
                limit = limit,
                recursive = true,
                fields = listOf(
                    ItemFields.OVERVIEW,
                    ItemFields.GENRES,
                    ItemFields.PEOPLE
                )
            )
            
            Result.success(response.items.orEmpty())
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Get item details by ID
     */
    suspend fun getItemDetails(itemId: String): Result<BaseItemDto> = 
        withContext(Dispatchers.IO) {
            try {
                val client = apiClient ?: return@withContext Result.failure(
                    IllegalStateException("API client not initialized")
                )
                
                val userId = client.userId ?: return@withContext Result.failure(
                    IllegalStateException("User not authenticated")
                )
                
                val response by client.userLibraryApi.getItem(
                    userId = userId,
                    itemId = itemId
                )
                
                Result.success(response)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }

    /**
     * Mark item as played
     */
    suspend fun markPlayed(itemId: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val client = apiClient ?: return@withContext Result.failure(
                IllegalStateException("API client not initialized")
            )
            
            val userId = client.userId ?: return@withContext Result.failure(
                IllegalStateException("User not authenticated")
            )
            
            client.userLibraryApi.markPlayedItem(
                userId = userId,
                itemId = itemId
            )
            
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Mark item as unplayed
     */
    suspend fun markUnplayed(itemId: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val client = apiClient ?: return@withContext Result.failure(
                IllegalStateException("API client not initialized")
            )
            
            val userId = client.userId ?: return@withContext Result.failure(
                IllegalStateException("User not authenticated")
            )
            
            client.userLibraryApi.markUnplayedItem(
                userId = userId,
                itemId = itemId
            )
            
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Get image URL for an item
     */
    fun getImageUrl(itemId: String, imageType: String = "Primary", maxWidth: Int = 600): String? {
        val client = apiClient ?: return null
        return "${client.baseUrl}/Items/$itemId/Images/$imageType?maxWidth=$maxWidth"
    }

    /**
     * Get streaming URL for an item
     */
    fun getStreamUrl(itemId: String): String? {
        val client = apiClient ?: return null
        val userId = client.userId ?: return null
        return "${client.baseUrl}/Videos/$itemId/stream?userId=$userId&api_key=${client.accessToken}"
    }
}