package com.universalmedialibrary.data.repository

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import com.universalmedialibrary.services.network.NetworkStorageConfig
import com.universalmedialibrary.services.network.NetworkStorageService
import com.universalmedialibrary.services.network.WebDavClient
import com.universalmedialibrary.services.network.WebDavConfig
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

private val Context.networkStorageDataStore: DataStore<Preferences> by preferencesDataStore(
    name = "network_storage_settings"
)

/**
 * Repository for managing network storage configurations
 * Handles SMB/CIFS and WebDAV storage settings
 */
@Singleton
class NetworkStorageRepository @Inject constructor(
    @ApplicationContext private val context: Context,
    private val networkStorageService: NetworkStorageService,
    private val webDavClient: WebDavClient
) {
    private val json = Json { ignoreUnknownKeys = true }
    
    companion object {
        private val SMB_CONFIGS_KEY = stringPreferencesKey("smb_configs")
        private val WEBDAV_CONFIGS_KEY = stringPreferencesKey("webdav_configs")
    }
    
    // SMB/CIFS Operations
    
    fun getSmbConfigs(): Flow<List<NetworkStorageConfig>> {
        return context.networkStorageDataStore.data.map { preferences ->
            val configsJson = preferences[SMB_CONFIGS_KEY] ?: "[]"
            json.decodeFromString<List<SerializableNetworkStorageConfig>>(configsJson)
                .map { it.toNetworkStorageConfig() }
        }
    }
    
    suspend fun addSmbConfig(config: NetworkStorageConfig) {
        context.networkStorageDataStore.edit { preferences ->
            val currentConfigs = preferences[SMB_CONFIGS_KEY]?.let {
                json.decodeFromString<List<SerializableNetworkStorageConfig>>(it)
            } ?: emptyList()
            
            val updatedConfigs = currentConfigs + SerializableNetworkStorageConfig.from(config)
            preferences[SMB_CONFIGS_KEY] = json.encodeToString(updatedConfigs)
        }
    }
    
    suspend fun updateSmbConfig(index: Int, config: NetworkStorageConfig) {
        context.networkStorageDataStore.edit { preferences ->
            val currentConfigs = preferences[SMB_CONFIGS_KEY]?.let {
                json.decodeFromString<List<SerializableNetworkStorageConfig>>(it)
            } ?: emptyList()
            
            if (index in currentConfigs.indices) {
                val updatedConfigs = currentConfigs.toMutableList()
                updatedConfigs[index] = SerializableNetworkStorageConfig.from(config)
                preferences[SMB_CONFIGS_KEY] = json.encodeToString(updatedConfigs)
            }
        }
    }
    
    suspend fun deleteSmbConfig(index: Int) {
        context.networkStorageDataStore.edit { preferences ->
            val currentConfigs = preferences[SMB_CONFIGS_KEY]?.let {
                json.decodeFromString<List<SerializableNetworkStorageConfig>>(it)
            } ?: emptyList()
            
            if (index in currentConfigs.indices) {
                val updatedConfigs = currentConfigs.toMutableList()
                updatedConfigs.removeAt(index)
                preferences[SMB_CONFIGS_KEY] = json.encodeToString(updatedConfigs)
            }
        }
    }
    
    suspend fun testSmbConnection(config: NetworkStorageConfig): Result<Boolean> {
        return try {
            networkStorageService.initialize(config.domain, config.username, config.password)
            val result = networkStorageService.exists(config.toSmbUrl())
            result.map { it }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    // WebDAV Operations
    
    fun getWebDavConfigs(): Flow<List<WebDavConfig>> {
        return context.networkStorageDataStore.data.map { preferences ->
            val configsJson = preferences[WEBDAV_CONFIGS_KEY] ?: "[]"
            json.decodeFromString<List<SerializableWebDavConfig>>(configsJson)
                .map { it.toWebDavConfig() }
        }
    }
    
    suspend fun addWebDavConfig(config: WebDavConfig) {
        context.networkStorageDataStore.edit { preferences ->
            val currentConfigs = preferences[WEBDAV_CONFIGS_KEY]?.let {
                json.decodeFromString<List<SerializableWebDavConfig>>(it)
            } ?: emptyList()
            
            val updatedConfigs = currentConfigs + SerializableWebDavConfig.from(config)
            preferences[WEBDAV_CONFIGS_KEY] = json.encodeToString(updatedConfigs)
        }
    }
    
    suspend fun updateWebDavConfig(index: Int, config: WebDavConfig) {
        context.networkStorageDataStore.edit { preferences ->
            val currentConfigs = preferences[WEBDAV_CONFIGS_KEY]?.let {
                json.decodeFromString<List<SerializableWebDavConfig>>(it)
            } ?: emptyList()
            
            if (index in currentConfigs.indices) {
                val updatedConfigs = currentConfigs.toMutableList()
                updatedConfigs[index] = SerializableWebDavConfig.from(config)
                preferences[WEBDAV_CONFIGS_KEY] = json.encodeToString(updatedConfigs)
            }
        }
    }
    
    suspend fun deleteWebDavConfig(index: Int) {
        context.networkStorageDataStore.edit { preferences ->
            val currentConfigs = preferences[WEBDAV_CONFIGS_KEY]?.let {
                json.decodeFromString<List<SerializableWebDavConfig>>(it)
            } ?: emptyList()
            
            if (index in currentConfigs.indices) {
                val updatedConfigs = currentConfigs.toMutableList()
                updatedConfigs.removeAt(index)
                preferences[WEBDAV_CONFIGS_KEY] = json.encodeToString(updatedConfigs)
            }
        }
    }
    
    suspend fun testWebDavConnection(config: WebDavConfig): Result<Boolean> {
        return try {
            webDavClient.initialize(config.serverUrl, config.username, config.password)
            val result = webDavClient.listFiles(config.basePath)
            Result.success(result.isSuccess)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}

// Serializable versions for DataStore
@Serializable
private data class SerializableNetworkStorageConfig(
    val name: String,
    val serverAddress: String,
    val shareName: String,
    val domain: String,
    val username: String,
    val password: String,
    val port: Int
) {
    fun toNetworkStorageConfig() = NetworkStorageConfig(
        name = name,
        serverAddress = serverAddress,
        shareName = shareName,
        domain = domain,
        username = username,
        password = password,
        port = port
    )
    
    companion object {
        fun from(config: NetworkStorageConfig) = SerializableNetworkStorageConfig(
            name = config.name,
            serverAddress = config.serverAddress,
            shareName = config.shareName,
            domain = config.domain,
            username = config.username,
            password = config.password,
            port = config.port
        )
    }
}

@Serializable
private data class SerializableWebDavConfig(
    val name: String,
    val serverUrl: String,
    val username: String,
    val password: String,
    val basePath: String
) {
    fun toWebDavConfig() = WebDavConfig(
        name = name,
        serverUrl = serverUrl,
        username = username,
        password = password,
        basePath = basePath
    )
    
    companion object {
        fun from(config: WebDavConfig) = SerializableWebDavConfig(
            name = config.name,
            serverUrl = config.serverUrl,
            username = config.username,
            password = config.password,
            basePath = config.basePath
        )
    }
}