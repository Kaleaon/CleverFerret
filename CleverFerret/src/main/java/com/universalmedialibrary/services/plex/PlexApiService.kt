package com.universalmedialibrary.services.plex

import android.content.Context
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONArray
import org.json.JSONObject
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Plex Media Server API Integration Service
 * 
 * Provides access to Plex media libraries, metadata, and artwork.
 * Supports authentication and server discovery.
 */
@Singleton
class PlexApiService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiKeyRepository: APIKeyRepository
) {
    
    private val httpClient = OkHttpClient()
    
    private val _connectionState = MutableStateFlow(PlexConnectionState.DISCONNECTED)
    val connectionState: StateFlow<PlexConnectionState> = _connectionState.asStateFlow()
    
    private var plexToken: String? = null
    private var serverUrl: String? = null
    
    /**
     * Connect to Plex Media Server
     */
    suspend fun connectToServer(serverUrl: String, token: String): Boolean = withContext(Dispatchers.IO) {
        try {
            _connectionState.value = PlexConnectionState.CONNECTING
            
            val testUrl = "$serverUrl/identity"
            val request = Request.Builder()
                .url(testUrl)
                .addHeader("X-Plex-Token", token)
                .addHeader("Accept", "application/json")
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (response.isSuccessful) {
                this@PlexApiService.serverUrl = serverUrl
                this@PlexApiService.plexToken = token
                _connectionState.value = PlexConnectionState.CONNECTED
                true
            } else {
                _connectionState.value = PlexConnectionState.ERROR
                false
            }
        } catch (e: Exception) {
            _connectionState.value = PlexConnectionState.ERROR
            false
        }
    }
    
    /**
     * Get Plex media libraries
     */
    suspend fun getLibraries(): List<PlexLibrary> = withContext(Dispatchers.IO) {
        if (serverUrl == null || plexToken == null) return@withContext emptyList()
        
        try {
            val request = Request.Builder()
                .url("$serverUrl/library/sections")
                .addHeader("X-Plex-Token", plexToken!!)
                .addHeader("Accept", "application/json")
                .build()
            
            val response = httpClient.newCall(request).execute()
            val responseBody = response.body?.string() ?: return@withContext emptyList()
            
            parsePlexLibraries(responseBody)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get media items from a Plex library section
     */
    suspend fun getLibraryItems(libraryKey: String): List<PlexMediaItem> = withContext(Dispatchers.IO) {
        if (serverUrl == null || plexToken == null) return@withContext emptyList()
        
        try {
            val request = Request.Builder()
                .url("$serverUrl/library/sections/$libraryKey/all")
                .addHeader("X-Plex-Token", plexToken!!)
                .addHeader("Accept", "application/json")
                .build()
            
            val response = httpClient.newCall(request).execute()
            val responseBody = response.body?.string() ?: return@withContext emptyList()
            
            parsePlexMediaItems(responseBody)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get artwork URL for a Plex media item
     */
    fun getArtworkUrl(thumbPath: String?): String? {
        if (thumbPath.isNullOrBlank() || serverUrl == null || plexToken == null) return null
        return "$serverUrl$thumbPath?X-Plex-Token=$plexToken"
    }
    
    /**
     * Get stream URL for a Plex media item
     */
    fun getStreamUrl(key: String): String? {
        if (serverUrl == null || plexToken == null) return null
        return "$serverUrl$key?X-Plex-Token=$plexToken"
    }
    
    private fun parsePlexLibraries(json: String): List<PlexLibrary> {
        try {
            val jsonObject = JSONObject(json)
            val mediaContainer = jsonObject.getJSONObject("MediaContainer")
            val directories = mediaContainer.getJSONArray("Directory")
            
            val libraries = mutableListOf<PlexLibrary>()
            for (i in 0 until directories.length()) {
                val directory = directories.getJSONObject(i)
                libraries.add(
                    PlexLibrary(
                        key = directory.getString("key"),
                        title = directory.getString("title"),
                        type = directory.getString("type"),
                        thumb = directory.optString("thumb", null)
                    )
                )
            }
            return libraries
        } catch (e: Exception) {
            return emptyList()
        }
    }
    
    private fun parsePlexMediaItems(json: String): List<PlexMediaItem> {
        try {
            val jsonObject = JSONObject(json)
            val mediaContainer = jsonObject.getJSONObject("MediaContainer")
            val metadata = mediaContainer.getJSONArray("Metadata")
            
            val items = mutableListOf<PlexMediaItem>()
            for (i in 0 until metadata.length()) {
                val item = metadata.getJSONObject(i)
                items.add(
                    PlexMediaItem(
                        key = item.getString("key"),
                        title = item.getString("title"),
                        type = item.getString("type"),
                        thumb = item.optString("thumb", null),
                        art = item.optString("art", null),
                        duration = item.optLong("duration", 0),
                        year = item.optInt("year", 0),
                        artist = item.optString("grandparentTitle", null),
                        album = item.optString("parentTitle", null),
                        track = item.optInt("index", 0)
                    )
                )
            }
            return items
        } catch (e: Exception) {
            return emptyList()
        }
    }
}

/**
 * Plex connection states
 */
enum class PlexConnectionState {
    DISCONNECTED,
    CONNECTING,
    CONNECTED,
    ERROR
}

/**
 * Plex library representation
 */
data class PlexLibrary(
    val key: String,
    val title: String,
    val type: String,
    val thumb: String?
)

/**
 * Plex media item representation
 */
data class PlexMediaItem(
    val key: String,
    val title: String,
    val type: String,
    val thumb: String?,
    val art: String?,
    val duration: Long,
    val year: Int,
    val artist: String?,
    val album: String?,
    val track: Int
)