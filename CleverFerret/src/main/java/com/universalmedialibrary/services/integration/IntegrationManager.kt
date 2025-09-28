package com.universalmedialibrary.services.integration

import android.content.Context
import android.util.Log
import com.universalmedialibrary.services.integration.plex.PlexIntegrationService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Integration Manager
 * 
 * Central coordination service for all integration services
 * Manages Plex, Calibre, Cloud Storage, and Book Services integrations
 */
@Singleton
class IntegrationManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val plexService: PlexIntegrationService,
    private val calibreService: CalibreIntegrationService,
    private val cloudStorageService: CloudStorageService,
    private val bookServicesIntegration: BookServicesIntegration
) {
    
    companion object {
        private const val TAG = "IntegrationManager"
    }
    
    data class IntegrationStatus(
        val plexConnected: Boolean = false,
        val calibreConnected: Boolean = false,
        val cloudStorageConnected: Map<CloudStorageService.CloudProvider, Boolean> = emptyMap(),
        val bookServicesConnected: Map<BookServicesIntegration.BookService, Boolean> = emptyMap(),
        val totalConnectedServices: Int = 0,
        val lastSync: Long? = null,
        val isLoading: Boolean = false,
        val error: String? = null
    )
    
    // State management
    private val _integrationStatus = MutableStateFlow(IntegrationStatus())
    val integrationStatus: StateFlow<IntegrationStatus> = _integrationStatus.asStateFlow()
    
    // Coroutine scope
    private val managerScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    
    init {
        // Monitor all service states
        managerScope.launch {
            combine(
                plexService.integrationState,
                calibreService.connectionState,
                cloudStorageService.connectionStates,
                bookServicesIntegration.serviceStates
            ) { plexState, calibreState, cloudStates, bookStates ->
                
                val cloudConnected = cloudStates.mapValues { it.value.isConnected }
                val bookConnected = bookStates.mapValues { it.value.isConnected }
                
                val totalConnected = listOf(
                    plexState.isAuthenticated,
                    calibreState,
                    cloudConnected.values.any { it },
                    bookConnected.values.any { it }
                ).count { it }
                
                IntegrationStatus(
                    plexConnected = plexState.isAuthenticated,
                    calibreConnected = calibreState,
                    cloudStorageConnected = cloudConnected,
                    bookServicesConnected = bookConnected,
                    totalConnectedServices = totalConnected,
                    lastSync = System.currentTimeMillis(),
                    isLoading = plexState.isLoading,
                    error = plexState.error
                )
            }.collect { status ->
                _integrationStatus.value = status
            }
        }
        
        Log.d(TAG, "IntegrationManager initialized")
    }
    
    /**
     * Initialize all integration services
     */
    suspend fun initializeAll(): Result<String> = withContext(Dispatchers.IO) {
        try {
            _integrationStatus.update { it.copy(isLoading = true, error = null) }
            
            val results = mutableListOf<String>()
            
            // Initialize default book services (no API keys required)
            val defaultServices = listOf(
                BookServicesIntegration.BookService.OPEN_LIBRARY,
                BookServicesIntegration.BookService.GOOGLE_BOOKS
            )
            
            for (service in defaultServices) {
                try {
                    bookServicesIntegration.configureService(service, null)
                    results.add("✅ Initialized ${service.name}")
                } catch (e: Exception) {
                    results.add("❌ Failed to initialize ${service.name}: ${e.message}")
                }
            }
            
            _integrationStatus.update { it.copy(isLoading = false) }
            
            val summary = "Integration services initialized:\n${results.joinToString("\n")}"
            Log.d(TAG, "All services initialized")
            Result.success(summary)
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to initialize services", e)
            val error = "Initialization error: ${e.message}"
            _integrationStatus.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Connect to Plex service
     */
    suspend fun connectPlex(): Result<String> = withContext(Dispatchers.IO) {
        try {
            val pinResult = plexService.startAuthentication()
            if (pinResult.isSuccess) {
                val pin = pinResult.getOrThrow()
                Result.success("Plex authentication started. PIN: ${pin.code}")
            } else {
                Result.failure(pinResult.exceptionOrNull() ?: Exception("Failed to start Plex authentication"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to connect to Plex", e)
            Result.failure(e)
        }
    }
    
    /**
     * Connect to Calibre service
     */
    suspend fun connectCalibre(serverUrl: String, username: String, password: String): Result<String> = withContext(Dispatchers.IO) {
        try {
            calibreService.connectToServer(serverUrl, username, password)
        } catch (e: Exception) {
            Log.e(TAG, "Failed to connect to Calibre", e)
            Result.failure(e)
        }
    }
    
    /**
     * Connect to cloud storage provider
     */
    suspend fun connectCloudStorage(provider: CloudStorageService.CloudProvider, accessToken: String): Result<String> = withContext(Dispatchers.IO) {
        try {
            cloudStorageService.connectToProvider(provider, accessToken)
        } catch (e: Exception) {
            Log.e(TAG, "Failed to connect to cloud storage", e)
            Result.failure(e)
        }
    }
    
    /**
     * Configure book service API key
     */
    suspend fun configureBookService(service: BookServicesIntegration.BookService, apiKey: String?): Result<String> = withContext(Dispatchers.IO) {
        try {
            bookServicesIntegration.configureService(service, apiKey)
        } catch (e: Exception) {
            Log.e(TAG, "Failed to configure book service", e)
            Result.failure(e)
        }
    }
    
    /**
     * Sync all connected services
     */
    suspend fun syncAll(): Result<String> = withContext(Dispatchers.IO) {
        try {
            _integrationStatus.update { it.copy(isLoading = true, error = null) }
            
            val results = mutableListOf<String>()
            val status = _integrationStatus.value
            
            // Sync Plex if connected
            if (status.plexConnected) {
                try {
                    val plexResult = plexService.syncAllLibraries()
                    if (plexResult.isSuccess) {
                        val libraries = plexResult.getOrThrow()
                        results.add("✅ Plex: Synced ${libraries.size} libraries")
                    } else {
                        results.add("❌ Plex sync failed: ${plexResult.exceptionOrNull()?.message}")
                    }
                } catch (e: Exception) {
                    results.add("❌ Plex sync error: ${e.message}")
                }
            }
            
            // Sync Calibre if connected
            if (status.calibreConnected) {
                try {
                    val calibreResult = calibreService.syncLibrary()
                    if (calibreResult.isSuccess) {
                        results.add("✅ Calibre: ${calibreResult.getOrThrow()}")
                    } else {
                        results.add("❌ Calibre sync failed: ${calibreResult.exceptionOrNull()?.message}")
                    }
                } catch (e: Exception) {
                    results.add("❌ Calibre sync error: ${e.message}")
                }
            }
            
            // Sync cloud storage if connected
            for ((provider, isConnected) in status.cloudStorageConnected) {
                if (isConnected) {
                    try {
                        val cloudResult = cloudStorageService.syncToCloud(provider, emptyList())
                        if (cloudResult.isSuccess) {
                            results.add("✅ ${provider.name}: ${cloudResult.getOrThrow()}")
                        } else {
                            results.add("❌ ${provider.name} sync failed: ${cloudResult.exceptionOrNull()?.message}")
                        }
                    } catch (e: Exception) {
                        results.add("❌ ${provider.name} sync error: ${e.message}")
                    }
                }
            }
            
            _integrationStatus.update { 
                it.copy(
                    isLoading = false, 
                    lastSync = System.currentTimeMillis(),
                    error = null
                )
            }
            
            val summary = "Sync completed for ${status.totalConnectedServices} services:\n${results.joinToString("\n")}"
            Log.d(TAG, "All services synced")
            Result.success(summary)
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to sync all services", e)
            val error = "Sync error: ${e.message}"
            _integrationStatus.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Test all connections
     */
    suspend fun testAllConnections(): Result<String> = withContext(Dispatchers.IO) {
        try {
            _integrationStatus.update { it.copy(isLoading = true, error = null) }
            
            val results = mutableListOf<String>()
            val status = _integrationStatus.value
            
            // Test Plex connection
            if (status.plexConnected) {
                try {
                    val plexResult = plexService.checkAllConnections()
                    if (plexResult.isSuccess) {
                        results.add("✅ Plex: ${plexResult.getOrThrow()}")
                    } else {
                        results.add("❌ Plex test failed: ${plexResult.exceptionOrNull()?.message}")
                    }
                } catch (e: Exception) {
                    results.add("❌ Plex test error: ${e.message}")
                }
            } else {
                results.add("⚪ Plex: Not connected")
            }
            
            // Test book services
            for ((service, isConnected) in status.bookServicesConnected) {
                if (isConnected) {
                    try {
                        val bookResult = bookServicesIntegration.testServiceConnection(service)
                        if (bookResult.isSuccess) {
                            results.add("✅ ${service.name}: ${bookResult.getOrThrow()}")
                        } else {
                            results.add("❌ ${service.name} test failed: ${bookResult.exceptionOrNull()?.message}")
                        }
                    } catch (e: Exception) {
                        results.add("❌ ${service.name} test error: ${e.message}")
                    }
                } else {
                    results.add("⚪ ${service.name}: Not configured")
                }
            }
            
            _integrationStatus.update { it.copy(isLoading = false, error = null) }
            
            val summary = "Connection tests completed:\n${results.joinToString("\n")}"
            Log.d(TAG, "All connections tested")
            Result.success(summary)
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to test connections", e)
            val error = "Connection test error: ${e.message}"
            _integrationStatus.update { it.copy(error = error, isLoading = false) }
            Result.failure(e)
        }
    }
    
    /**
     * Disconnect all services
     */
    suspend fun disconnectAll() = withContext(Dispatchers.IO) {
        try {
            // Disconnect Plex
            plexService.logout()
            
            // Disconnect Calibre
            calibreService.disconnect()
            
            // Disconnect cloud storage
            for (provider in CloudStorageService.CloudProvider.values()) {
                cloudStorageService.disconnectFromProvider(provider)
            }
            
            Log.d(TAG, "All services disconnected")
        } catch (e: Exception) {
            Log.e(TAG, "Error disconnecting services", e)
        }
    }
    
    /**
     * Get comprehensive status report
     */
    fun getStatusReport(): String {
        val status = _integrationStatus.value
        
        return buildString {
            appendLine("=== Integration Status Report ===")
            appendLine("Total Connected Services: ${status.totalConnectedServices}")
            appendLine()
            
            appendLine("Plex Integration: ${if (status.plexConnected) "✅ Connected" else "❌ Not Connected"}")
            appendLine("Calibre Integration: ${if (status.calibreConnected) "✅ Connected" else "❌ Not Connected"}")
            
            appendLine()
            appendLine("Cloud Storage:")
            for ((provider, isConnected) in status.cloudStorageConnected) {
                appendLine("  ${provider.name}: ${if (isConnected) "✅ Connected" else "❌ Not Connected"}")
            }
            
            appendLine()
            appendLine("Book Services:")
            for ((service, isConnected) in status.bookServicesConnected) {
                appendLine("  ${service.name}: ${if (isConnected) "✅ Connected" else "❌ Not Connected"}")
            }
            
            if (status.lastSync != null) {
                appendLine()
                appendLine("Last Sync: ${java.util.Date(status.lastSync)}")
            }
            
            if (status.error != null) {
                appendLine()
                appendLine("Error: ${status.error}")
            }
        }
    }
}