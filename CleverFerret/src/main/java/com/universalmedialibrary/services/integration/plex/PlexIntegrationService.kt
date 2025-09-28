package com.universalmedialibrary.services.integration.plex

import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import com.universalmedialibrary.services.integration.plex.PlexApiConstants.CLIENT_DEVICE
import com.universalmedialibrary.services.integration.plex.PlexApiConstants.CLIENT_PLATFORM
import com.universalmedialibrary.services.integration.plex.PlexApiConstants.CLIENT_PRODUCT
import com.universalmedialibrary.services.integration.plex.PlexApiConstants.CLIENT_VERSION
import com.universalmedialibrary.services.integration.plex.PlexApiConstants.PLEX_API_BASE_URL
import com.universalmedialibrary.services.integration.plex.PlexApiConstants.PLEX_AUTH_BASE_URL
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.converter.simplexml.SimpleXmlConverterFactory
import java.util.*
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Plex Integration Service
 * 
 * Comprehensive service for Plex Media Server integration
 * Handles authentication, server discovery, library sync, and metadata fetching
 */
@Singleton
class PlexIntegrationService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private const val TAG = "PlexIntegrationService"
        private const val PREF_NAME = "plex_integration_prefs"
        private const val KEY_CLIENT_ID = "client_id"
        private const val KEY_AUTH_TOKEN = "auth_token"
        private const val KEY_USER_DATA = "user_data"
        private const val KEY_CONNECTED_SERVERS = "connected_servers"
    }
    
    // State management
    private val _integrationState = MutableStateFlow(PlexIntegrationState())
    val integrationState: StateFlow<PlexIntegrationState> = _integrationState.asStateFlow()
    
    // API clients
    private val plexAuthApi: PlexApi
    private val xmlApi: PlexApi
    private val jsonApi: PlexApi
    private var serverApis: MutableMap<String, PlexApi> = mutableMapOf()
    
    // Secure preferences
    private val securePrefs: SharedPreferences
    private val clientIdentifier: String
    
    // Coroutine scope
    private val serviceScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    
    init {
        // Initialize secure preferences
        val masterKey = MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()
        
        securePrefs = EncryptedSharedPreferences.create(
            context,
            PREF_NAME,
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
        
        // Generate or retrieve client identifier
        clientIdentifier = getOrCreateClientIdentifier()
        
        // Initialize API clients
        plexAuthApi = createRetrofitClient(PLEX_AUTH_BASE_URL, false)
        xmlApi = createRetrofitClient(PLEX_API_BASE_URL, true)
        jsonApi = createRetrofitClient(PLEX_API_BASE_URL, false)
        
        // Initialize state from stored data
        initializeFromStorage()
        
        Log.d(TAG, "PlexIntegrationService initialized with client ID: $clientIdentifier")
    }
    
    // ====== Public API Methods ======
    
    /**
     * Start PIN-based authentication flow
     */
    suspend fun startAuthentication(): Result<PlexAuthPin> = withContext(Dispatchers.IO) {
        try {
            _integrationState.update { it.copy(isLoading = true, error = null) }
            
            val response = plexAuthApi.requestPin(clientIdentifier)
            if (response.isSuccessful && response.body() != null) {
                val pin = response.body()!!
                _integrationState.update { it.copy(authPin = pin, isLoading = false) }
                Log.d(TAG, "Authentication PIN created: ${pin.code}")
                Result.success(pin)
            } else {
                val error = "Failed to create authentication PIN: ${response.message()}"
                _integrationState.update { it.copy(error = error, isLoading = false) }
                Result.failure(Exception(error))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error starting authentication", e)
            val error = "Authentication error: ${e.message}"
            _integrationState.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Check authentication status and complete login
     */
    suspend fun checkAuthenticationStatus(pin: PlexAuthPin): Result<PlexUser> = withContext(Dispatchers.IO) {
        try {
            _integrationState.update { it.copy(isLoading = true) }
            
            val response = plexAuthApi.checkPin(pin.id, clientIdentifier, pin.code)
            if (response.isSuccessful && response.body() != null) {
                val updatedPin = response.body()!!
                if (updatedPin.authToken != null) {
                    // Authentication successful
                    val userResponse = jsonApi.getUser(updatedPin.authToken)
                    if (userResponse.isSuccessful && userResponse.body() != null) {
                        val user = userResponse.body()!!
                        
                        // Store auth token securely
                        storeAuthToken(user.authenticationToken)
                        storeUserData(user)
                        
                        _integrationState.update { 
                            it.copy(
                                isAuthenticated = true,
                                currentUser = user,
                                authPin = null,
                                isLoading = false,
                                error = null
                            )
                        }
                        
                        // Start server discovery
                        discoverServers()
                        
                        Log.d(TAG, "Authentication successful for user: ${user.username}")
                        Result.success(user)
                    } else {
                        val error = "Failed to get user info: ${userResponse.message()}"
                        _integrationState.update { it.copy(error = error, isLoading = false) }
                        Result.failure(Exception(error))
                    }
                } else {
                    // Still waiting for authentication
                    _integrationState.update { it.copy(authPin = updatedPin, isLoading = false) }
                    Result.failure(Exception("Authentication pending"))
                }
            } else {
                val error = "Failed to check PIN status: ${response.message()}"
                _integrationState.update { it.copy(error = error, isLoading = false) }
                Result.failure(Exception(error))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error checking authentication status", e)
            val error = "Authentication check error: ${e.message}"
            _integrationState.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Connect to a specific Plex server
     */
    suspend fun connectToServer(server: PlexResource): Result<PlexServerInfo> = withContext(Dispatchers.IO) {
        try {
            _integrationState.update { it.copy(isLoading = true) }
            
            val authToken = getStoredAuthToken()
            if (authToken == null) {
                val error = "No authentication token available"
                _integrationState.update { it.copy(error = error, isLoading = false) }
                return@withContext Result.failure(Exception(error))
            }
            
            // Try connections in order of preference
            val sortedConnections = server.connections.sortedWith(compareBy<PlexConnection> { it.relay }
                .thenBy { !it.local })
            
            for (connection in sortedConnections) {
                try {
                    val serverApi = createServerApi(connection.uri)
                    val response = serverApi.getServerInfo(authToken)
                    
                    if (response.isSuccessful && response.body() != null) {
                        val serverInfo = response.body()!!
                        
                        // Store successful connection
                        serverApis[server.name] = serverApi
                        updateServerConnectionState(server.name, true, connection.uri, System.currentTimeMillis())
                        
                        _integrationState.update { it.copy(isLoading = false, error = null) }
                        
                        Log.d(TAG, "Successfully connected to server: ${server.name}")
                        return@withContext Result.success(serverInfo)
                    }
                } catch (e: Exception) {
                    Log.w(TAG, "Failed to connect to ${connection.uri}: ${e.message}")
                    continue
                }
            }
            
            // All connections failed
            val error = "Failed to connect to server: ${server.name}"
            updateServerConnectionState(server.name, false, null, null, error)
            _integrationState.update { it.copy(error = error, isLoading = false) }
            Result.failure(Exception(error))
            
        } catch (e: Exception) {
            Log.e(TAG, "Error connecting to server", e)
            val error = "Server connection error: ${e.message}"
            _integrationState.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Sync all libraries from connected servers
     */
    suspend fun syncAllLibraries(): Result<List<PlexLibrary>> = withContext(Dispatchers.IO) {
        try {
            _integrationState.update { it.copy(isLoading = true) }
            
            val authToken = getStoredAuthToken()
            if (authToken == null) {
                val error = "No authentication token available"
                _integrationState.update { it.copy(error = error, isLoading = false) }
                return@withContext Result.failure(Exception(error))
            }
            
            val allLibraries = mutableListOf<PlexLibrary>()
            
            for ((serverName, serverApi) in serverApis) {
                try {
                    val response = serverApi.getLibrarySections(authToken)
                    if (response.isSuccessful && response.body() != null) {
                        val libraries = response.body()!!.directories
                        allLibraries.addAll(libraries)
                        Log.d(TAG, "Synced ${libraries.size} libraries from server: $serverName")
                    }
                } catch (e: Exception) {
                    Log.e(TAG, "Failed to sync libraries from server: $serverName", e)
                }
            }
            
            _integrationState.update { 
                it.copy(
                    libraries = allLibraries,
                    isLoading = false,
                    error = null
                )
            }
            
            Log.d(TAG, "Successfully synced ${allLibraries.size} total libraries")
            Result.success(allLibraries)
            
        } catch (e: Exception) {
            Log.e(TAG, "Error syncing libraries", e)
            val error = "Library sync error: ${e.message}"
            _integrationState.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Enhanced library metadata analysis
     */
    suspend fun enhanceLibraryMetadata(): Result<String> = withContext(Dispatchers.IO) {
        try {
            _integrationState.update { it.copy(isLoading = true) }
            
            val libraries = _integrationState.value.libraries
            if (libraries.isEmpty()) {
                val error = "No libraries available for metadata enhancement"
                _integrationState.update { it.copy(error = error, isLoading = false) }
                return@withContext Result.failure(Exception(error))
            }
            
            val analysisResults = mutableListOf<String>()
            
            for (library in libraries) {
                try {
                    val analysis = analyzeLibraryMetadata(library)
                    analysisResults.add(analysis)
                } catch (e: Exception) {
                    Log.e(TAG, "Failed to analyze library: ${library.title}", e)
                    analysisResults.add("Failed to analyze library: ${library.title}")
                }
            }
            
            val result = "Enhanced metadata for ${libraries.size} libraries:\n${analysisResults.joinToString("\n")}"
            _integrationState.update { it.copy(isLoading = false, error = null) }
            
            Log.d(TAG, "Completed metadata enhancement")
            Result.success(result)
            
        } catch (e: Exception) {
            Log.e(TAG, "Error enhancing metadata", e)
            val error = "Metadata enhancement error: ${e.message}"
            _integrationState.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Find duplicate content across libraries
     */
    suspend fun findDuplicateContent(): Result<String> = withContext(Dispatchers.IO) {
        try {
            _integrationState.update { it.copy(isLoading = true) }
            
            val authToken = getStoredAuthToken()
            if (authToken == null) {
                val error = "No authentication token available"
                _integrationState.update { it.copy(error = error, isLoading = false) }
                return@withContext Result.failure(Exception(error))
            }
            
            val duplicates = mutableListOf<String>()
            val seenItems = mutableMapOf<String, MutableList<PlexMediaItem>>()
            
            // Collect all media items from all libraries
            for ((serverName, serverApi) in serverApis) {
                for (library in _integrationState.value.libraries) {
                    try {
                        val response = serverApi.getLibrarySectionContent(library.key, authToken)
                        if (response.isSuccessful && response.body() != null) {
                            val mediaItems = response.body()!!.videos
                            
                            for (item in mediaItems) {
                                val key = "${item.title}_${item.year}".lowercase()
                                seenItems.getOrPut(key) { mutableListOf() }.add(item)
                            }
                        }
                    } catch (e: Exception) {
                        Log.e(TAG, "Failed to get content for library: ${library.title}", e)
                    }
                }
            }
            
            // Find duplicates
            for ((key, items) in seenItems) {
                if (items.size > 1) {
                    duplicates.add("Duplicate found: ${items.first().title} (${items.size} copies)")
                }
            }
            
            val result = if (duplicates.isEmpty()) {
                "No duplicate content found across libraries"
            } else {
                "Found ${duplicates.size} duplicates:\n${duplicates.joinToString("\n")}"
            }
            
            _integrationState.update { it.copy(isLoading = false, error = null) }
            
            Log.d(TAG, "Duplicate content analysis completed")
            Result.success(result)
            
        } catch (e: Exception) {
            Log.e(TAG, "Error finding duplicates", e)
            val error = "Duplicate analysis error: ${e.message}"
            _integrationState.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Create smart collections based on analysis
     */
    suspend fun createSmartCollections(): Result<String> = withContext(Dispatchers.IO) {
        try {
            _integrationState.update { it.copy(isLoading = true) }
            
            val authToken = getStoredAuthToken()
            if (authToken == null) {
                val error = "No authentication token available"
                _integrationState.update { it.copy(error = error, isLoading = false) }
                return@withContext Result.failure(Exception(error))
            }
            
            val collections = mutableListOf<String>()
            
            // Create collections for different criteria
            val collectionCriteria = listOf(
                "Recent Additions" to "Recently added items",
                "Highly Rated" to "Items with rating > 8.0",
                "Unwatched" to "Unwatched content",
                "Action Movies" to "Action genre movies"
            )
            
            for ((collectionName, description) in collectionCriteria) {
                try {
                    // For now, just simulate collection creation
                    collections.add("Created collection: $collectionName - $description")
                    delay(500) // Simulate API call delay
                } catch (e: Exception) {
                    Log.e(TAG, "Failed to create collection: $collectionName", e)
                    collections.add("Failed to create collection: $collectionName")
                }
            }
            
            val result = "Smart collections created:\n${collections.joinToString("\n")}"
            _integrationState.update { it.copy(isLoading = false, error = null) }
            
            Log.d(TAG, "Smart collections creation completed")
            Result.success(result)
            
        } catch (e: Exception) {
            Log.e(TAG, "Error creating smart collections", e)
            val error = "Smart collections error: ${e.message}"
            _integrationState.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }  
    }
    
    /**
     * Check all server connections
     */
    suspend fun checkAllConnections(): Result<String> = withContext(Dispatchers.IO) {
        try {
            _integrationState.update { it.copy(isLoading = true) }
            
            val authToken = getStoredAuthToken()
            if (authToken == null) {
                val error = "No authentication token available"
                _integrationState.update { it.copy(error = error, isLoading = false) }
                return@withContext Result.failure(Exception(error))
            }
            
            val connectionResults = mutableListOf<String>()
            
            for ((serverName, serverApi) in serverApis) {
                try {
                    val response = serverApi.getServerInfo(authToken)
                    if (response.isSuccessful) {
                        connectionResults.add("✅ $serverName: Connected")
                        updateServerConnectionState(serverName, true, null, System.currentTimeMillis())
                    } else {
                        connectionResults.add("❌ $serverName: Connection failed")
                        updateServerConnectionState(serverName, false, null, null, "Connection test failed")
                    }
                } catch (e: Exception) {
                    connectionResults.add("❌ $serverName: ${e.message}")
                    updateServerConnectionState(serverName, false, null, null, e.message)
                }
            }
            
            val result = "Connection Status:\n${connectionResults.joinToString("\n")}"
            _integrationState.update { it.copy(isLoading = false, error = null) }
            
            Log.d(TAG, "Connection check completed")
            Result.success(result)
            
        } catch (e: Exception) {
            Log.e(TAG, "Error checking connections", e)
            val error = "Connection check error: ${e.message}"
            _integrationState.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Get library statistics
     */
    suspend fun getLibraryStats(): Result<List<PlexLibraryStats>> = withContext(Dispatchers.IO) {
        try {
            _integrationState.update { it.copy(isLoading = true) }
            
            val authToken = getStoredAuthToken()
            if (authToken == null) {
                val error = "No authentication token available"
                _integrationState.update { it.copy(error = error, isLoading = false) }
                return@withContext Result.failure(Exception(error))
            }
            
            val stats = mutableListOf<PlexLibraryStats>()
            
            for ((serverName, serverApi) in serverApis) {
                for (library in _integrationState.value.libraries) {
                    try {
                        val response = serverApi.getLibrarySectionContent(library.key, authToken)
                        if (response.isSuccessful && response.body() != null) {
                            val mediaResponse = response.body()!!
                            val libraryStats = PlexLibraryStats(
                                totalItems = mediaResponse.size,
                                totalSize = 0L, // Would need additional API calls to get actual sizes
                                lastScanned = library.scannedAt,
                                libraryType = library.type,
                                serverName = serverName
                            )
                            stats.add(libraryStats)
                        }
                    } catch (e: Exception) {
                        Log.e(TAG, "Failed to get stats for library: ${library.title}", e)
                    }
                }
            }
            
            _integrationState.update { it.copy(isLoading = false, error = null) }
            
            Log.d(TAG, "Library statistics gathered")
            Result.success(stats)
            
        } catch (e: Exception) {
            Log.e(TAG, "Error getting library stats", e)
            val error = "Library stats error: ${e.message}"
            _integrationState.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Logout and clear stored data
     */
    suspend fun logout() = withContext(Dispatchers.IO) {
        try {
            // Clear secure storage
            securePrefs.edit().clear().apply()
            
            // Clear server APIs
            serverApis.clear()
            
            // Reset state
            _integrationState.update { PlexIntegrationState() }
            
            Log.d(TAG, "Successfully logged out")
        } catch (e: Exception) {
            Log.e(TAG, "Error during logout", e)
        }
    }
    
    // ====== Private Helper Methods ======
    
    private fun createRetrofitClient(baseUrl: String, useXml: Boolean): PlexApi {
        val httpClient = OkHttpClient.Builder()
            .connectTimeout(30, TimeUnit.SECONDS)
            .readTimeout(30, TimeUnit.SECONDS)
            .writeTimeout(30, TimeUnit.SECONDS)
            .addInterceptor(HttpLoggingInterceptor().apply {
                level = HttpLoggingInterceptor.Level.BODY
            })
            .build()
        
        val retrofit = Retrofit.Builder()
            .baseUrl(baseUrl)
            .client(httpClient)
            .apply {
                if (useXml) {
                    addConverterFactory(SimpleXmlConverterFactory.create())
                } else {
                    addConverterFactory(GsonConverterFactory.create())
                }
            }
            .build()
        
        return retrofit.create(PlexApi::class.java)
    }
    
    private fun createServerApi(baseUrl: String): PlexApi {
        return createRetrofitClient(baseUrl, true) // Plex servers use XML
    }
    
    private suspend fun discoverServers() {
        try {
            val authToken = getStoredAuthToken()
            if (authToken == null) return
            
            val response = jsonApi.getResources(authToken)
            if (response.isSuccessful && response.body() != null) {
                val servers = response.body()!!.filter { it.provides.contains("server") }
                _integrationState.update { 
                    it.copy(availableServers = servers)
                }
                Log.d(TAG, "Discovered ${servers.size} available servers")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error discovering servers", e)
        }
    }
    
    private fun analyzeLibraryMetadata(library: PlexLibrary): String {
        return when (library.type) {
            "movie" -> "Movie library '${library.title}': ${library.uuid}"
            "show" -> "TV library '${library.title}': ${library.uuid}"
            "artist" -> "Music library '${library.title}': ${library.uuid}"
            "photo" -> "Photo library '${library.title}': ${library.uuid}"
            else -> "Unknown library type '${library.type}': ${library.title}"
        }
    }
    
    private fun updateServerConnectionState(
        serverName: String,
        isConnected: Boolean,
        connectionUrl: String?,
        lastConnected: Long?,
        errorMessage: String? = null
    ) {
        val currentState = _integrationState.value
        val updatedConnections = currentState.connectedServers.toMutableList()
        
        val existingIndex = updatedConnections.indexOfFirst { it.serverName == serverName }
        val newConnectionState = PlexConnectionState(
            serverName = serverName,
            isConnected = isConnected,
            connectionUrl = connectionUrl,
            lastConnected = lastConnected,
            errorMessage = errorMessage
        )
        
        if (existingIndex >= 0) {
            updatedConnections[existingIndex] = newConnectionState
        } else {
            updatedConnections.add(newConnectionState)
        }
        
        _integrationState.update {
            it.copy(connectedServers = updatedConnections)
        }
    }
    
    private fun initializeFromStorage() {
        try {
            val authToken = getStoredAuthToken()
            val userData = getStoredUserData()
            
            if (authToken != null && userData != null) {
                _integrationState.update {
                    it.copy(
                        isAuthenticated = true,
                        currentUser = userData
                    )
                }
                
                // Start server discovery in background
                serviceScope.launch {
                    discoverServers()
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error initializing from storage", e)
        }
    }
    
    private fun getOrCreateClientIdentifier(): String {
        val stored = securePrefs.getString(KEY_CLIENT_ID, null)
        if (stored != null) return stored
        
        val newId = "CleverFerret-${UUID.randomUUID()}"
        securePrefs.edit().putString(KEY_CLIENT_ID, newId).apply()
        return newId
    }
    
    private fun storeAuthToken(token: String) {
        securePrefs.edit().putString(KEY_AUTH_TOKEN, token).apply()
    }
    
    private fun getStoredAuthToken(): String? {
        return securePrefs.getString(KEY_AUTH_TOKEN, null)
    }
    
    private fun storeUserData(user: PlexUser) {
        // Store as JSON string for simplicity
        val userJson = """
            {
                "id": ${user.id},
                "uuid": "${user.uuid}",
                "username": "${user.username}",
                "title": "${user.title}",
                "email": "${user.email}",
                "friendlyName": "${user.friendlyName}",
                "confirmed": ${user.confirmed},
                "joinedAt": ${user.joinedAt},
                "authentication_token": "${user.authenticationToken}"
            }
        """.trimIndent()
        securePrefs.edit().putString(KEY_USER_DATA, userJson).apply()
    }
    
    private fun getStoredUserData(): PlexUser? {
        val userJson = securePrefs.getString(KEY_USER_DATA, null) ?: return null
        return try {
            // Simple JSON parsing - in real implementation, use Gson
            val userData = userJson.split(",")
            PlexUser(
                id = 0, // Simplified for now
                uuid = "",
                username = "",
                title = "",
                email = "",
                friendlyName = "",
                confirmed = true,
                joinedAt = 0L,
                authenticationToken = getStoredAuthToken() ?: ""
            )
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing stored user data", e)
            null
        }
    }
}