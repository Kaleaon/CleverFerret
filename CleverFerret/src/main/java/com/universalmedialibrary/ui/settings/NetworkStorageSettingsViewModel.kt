package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.network.NetworkStorageConfig
import com.universalmedialibrary.services.network.NetworkStorageService
import com.universalmedialibrary.services.network.WebDavClient
import com.universalmedialibrary.services.network.WebDavConfig
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class NetworkStorageSettingsViewModel @Inject constructor(
    private val networkStorageService: NetworkStorageService,
    private val webDavClient: WebDavClient
) : ViewModel() {

    private val _uiState = MutableStateFlow(NetworkStorageSettingsUiState())
    val uiState: StateFlow<NetworkStorageSettingsUiState> = _uiState.asStateFlow()

    // In a real implementation, these would be persisted in the database
    private val smbConfigs = mutableListOf<NetworkStorageConfig>()
    private val webdavConfigs = mutableListOf<WebDavConfig>()

    fun addStorage(
        type: StorageType,
        name: String,
        server: String,
        share: String,
        domain: String,
        username: String,
        password: String,
        port: Int
    ) {
        viewModelScope.launch {
            when (type) {
                StorageType.SMB -> {
                    val config = NetworkStorageConfig(
                        name = name,
                        serverAddress = server,
                        shareName = share,
                        domain = domain,
                        username = username,
                        password = password,
                        port = port
                    )
                    smbConfigs.add(config)
                    
                    // Initialize and test connection
                    networkStorageService.initialize(domain, username, password)
                    val result = networkStorageService.exists(config.toSmbUrl())
                    
                    _uiState.update { state ->
                        state.copy(smbShares = state.smbShares + NetworkStorageInfo(
                            id = smbConfigs.size.toLong(),
                            name = name,
                            url = config.toSmbUrl(),
                            isConnected = result.isSuccess && result.getOrNull() == true,
                            type = StorageType.SMB
                        ))
                    }
                }
                StorageType.WEBDAV -> {
                    val serverUrl = if (server.startsWith("http")) server else "https://$server"
                    val config = WebDavConfig(
                        name = name,
                        serverUrl = serverUrl,
                        username = username,
                        password = password
                    )
                    webdavConfigs.add(config)
                    
                    // Initialize and test connection
                    webDavClient.initialize(serverUrl, username, password)
                    val result = webDavClient.listFiles("/")
                    
                    _uiState.update { state ->
                        state.copy(webdavStorage = state.webdavStorage + NetworkStorageInfo(
                            id = webdavConfigs.size.toLong(),
                            name = name,
                            url = serverUrl,
                            isConnected = result.isSuccess,
                            type = StorageType.WEBDAV
                        ))
                    }
                }
            }
        }
    }

    fun testConnection(storage: NetworkStorageInfo) {
        viewModelScope.launch {
            when (storage.type) {
                StorageType.SMB -> {
                    val config = smbConfigs.getOrNull(storage.id.toInt() - 1)
                    config?.let {
                        networkStorageService.initialize(it.domain, it.username, it.password)
                        val result = networkStorageService.exists(it.toSmbUrl())
                        
                        _uiState.update { state ->
                            state.copy(smbShares = state.smbShares.map { share ->
                                if (share.id == storage.id) {
                                    share.copy(isConnected = result.isSuccess && result.getOrNull() == true)
                                } else share
                            })
                        }
                    }
                }
                StorageType.WEBDAV -> {
                    val config = webdavConfigs.getOrNull(storage.id.toInt() - 1)
                    config?.let {
                        webDavClient.initialize(it.serverUrl, it.username, it.password)
                        val result = webDavClient.listFiles("/")
                        
                        _uiState.update { state ->
                            state.copy(webdavStorage = state.webdavStorage.map { webdav ->
                                if (webdav.id == storage.id) {
                                    webdav.copy(isConnected = result.isSuccess)
                                } else webdav
                            })
                        }
                    }
                }
            }
        }
    }

    fun browseStorage(storage: NetworkStorageInfo) {
        viewModelScope.launch {
            when (storage.type) {
                StorageType.SMB -> {
                    val config = smbConfigs.getOrNull(storage.id.toInt() - 1)
                    config?.let {
                        networkStorageService.initialize(it.domain, it.username, it.password)
                        val result = networkStorageService.listFiles(it.toSmbUrl())
                        // Handle browse result - could navigate to a file browser screen
                    }
                }
                StorageType.WEBDAV -> {
                    val config = webdavConfigs.getOrNull(storage.id.toInt() - 1)
                    config?.let {
                        webDavClient.initialize(it.serverUrl, it.username, it.password)
                        val result = webDavClient.listFiles("/")
                        // Handle browse result - could navigate to a file browser screen
                    }
                }
            }
        }
    }

    fun deleteStorage(storage: NetworkStorageInfo) {
        viewModelScope.launch {
            when (storage.type) {
                StorageType.SMB -> {
                    smbConfigs.removeAt(storage.id.toInt() - 1)
                    _uiState.update { state ->
                        state.copy(smbShares = state.smbShares.filter { it.id != storage.id })
                    }
                }
                StorageType.WEBDAV -> {
                    webdavConfigs.removeAt(storage.id.toInt() - 1)
                    _uiState.update { state ->
                        state.copy(webdavStorage = state.webdavStorage.filter { it.id != storage.id })
                    }
                }
            }
        }
    }
}

data class NetworkStorageSettingsUiState(
    val smbShares: List<NetworkStorageInfo> = emptyList(),
    val webdavStorage: List<NetworkStorageInfo> = emptyList()
)

data class NetworkStorageInfo(
    val id: Long,
    val name: String,
    val url: String,
    val isConnected: Boolean,
    val type: StorageType
)