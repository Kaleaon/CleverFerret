package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.NetworkStorageRepository
import com.universalmedialibrary.services.network.NetworkStorageConfig
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
    private val networkStorageRepository: NetworkStorageRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(NetworkStorageSettingsUiState())
    val uiState: StateFlow<NetworkStorageSettingsUiState> = _uiState.asStateFlow()

    init {
        loadStorageConfigs()
    }

    private fun loadStorageConfigs() {
        viewModelScope.launch {
            networkStorageRepository.getSmbConfigs().collect { configs ->
                _uiState.update { state ->
                    state.copy(smbShares = configs.mapIndexed { index, config ->
                        NetworkStorageInfo(
                            id = index.toLong(),
                            name = config.name,
                            url = config.toSmbUrl(),
                            isConnected = false,
                            type = StorageType.SMB
                        )
                    })
                }
            }
        }

        viewModelScope.launch {
            networkStorageRepository.getWebDavConfigs().collect { configs ->
                _uiState.update { state ->
                    state.copy(webdavStorage = configs.mapIndexed { index, config ->
                        NetworkStorageInfo(
                            id = index.toLong(),
                            name = config.name,
                            url = config.serverUrl,
                            isConnected = false,
                            type = StorageType.WEBDAV
                        )
                    })
                }
            }
        }
    }

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
                    networkStorageRepository.addSmbConfig(config)
                    
                    // Test connection
                    val result = networkStorageRepository.testSmbConnection(config)
                    // Connection status will be updated through the flow
                }
                StorageType.WEBDAV -> {
                    val serverUrl = if (server.startsWith("http")) server else "https://$server"
                    val config = WebDavConfig(
                        name = name,
                        serverUrl = serverUrl,
                        username = username,
                        password = password
                    )
                    networkStorageRepository.addWebDavConfig(config)
                    
                    // Test connection
                    val result = networkStorageRepository.testWebDavConnection(config)
                    // Connection status will be updated through the flow
                }
            }
        }
    }

    fun testConnection(storage: NetworkStorageInfo) {
        viewModelScope.launch {
            when (storage.type) {
                StorageType.SMB -> {
                    val configs = networkStorageRepository.getSmbConfigs()
                    // Test connection logic here
                }
                StorageType.WEBDAV -> {
                    val configs = networkStorageRepository.getWebDavConfigs()
                    // Test connection logic here
                }
            }
        }
    }

    fun browseStorage(storage: NetworkStorageInfo) {
        viewModelScope.launch {
            // Browse functionality to be implemented
            // This would navigate to a file browser screen
        }
    }

    fun deleteStorage(storage: NetworkStorageInfo) {
        viewModelScope.launch {
            when (storage.type) {
                StorageType.SMB -> {
                    networkStorageRepository.deleteSmbConfig(storage.id.toInt())
                }
                StorageType.WEBDAV -> {
                    networkStorageRepository.deleteWebDavConfig(storage.id.toInt())
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