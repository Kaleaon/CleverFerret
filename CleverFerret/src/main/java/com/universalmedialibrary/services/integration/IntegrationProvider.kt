package com.universalmedialibrary.services.integration

import com.universalmedialibrary.data.local.entity.ExternalMediaEntity
import kotlinx.coroutines.flow.StateFlow

/**
 * Platform connector types for external media integrations
 */
enum class ProviderType {
    PLEX,
    JELLYFIN,
    EMBY,
    YAACC,
    CALIBRE,
    POWERAMP
}

/**
 * Standard provider status state
 */
data class ProviderStatus(
    val providerId: String,
    val name: String,
    val providerType: ProviderType,
    val isConnected: Boolean = false,
    val isSyncing: Boolean = false,
    val itemCount: Int = 0,
    val lastSyncTime: Long = 0L,
    val errorMessage: String? = null
)

/**
 * Result of a sync operation
 */
data class ProviderSyncResult(
    val success: Boolean,
    val itemsProcessed: Int,
    val message: String = ""
)

/**
 * Unified interface contract for all third-party media server and app integrations.
 */
interface IntegrationProvider {
    val providerId: String
    val providerName: String
    val providerType: ProviderType
    val status: StateFlow<ProviderStatus>

    suspend fun connect(config: Map<String, String>): Boolean
    suspend fun disconnect()
    suspend fun testConnection(): Boolean
    suspend fun sync(): ProviderSyncResult
    suspend fun searchRemote(query: String, limit: Int = 50): List<ExternalMediaEntity>
    suspend fun fetchEntities(): List<ExternalMediaEntity>
}
