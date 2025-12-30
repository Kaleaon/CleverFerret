package com.universalmedialibrary.ui.network

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.network.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Network Explorer Screen
 */
@HiltViewModel
class NetworkExplorerViewModel @Inject constructor(
    private val networkExplorerService: NetworkExplorerService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(NetworkExplorerUiState())
    val uiState: StateFlow<NetworkExplorerUiState> = _uiState.asStateFlow()

    init {
        viewModelScope.launch {
            collectDiscoveredDevices()
            collectConnectedDevice()
            collectBrowsePath()
        }
    }

    fun scanNetwork() {
        viewModelScope.launch {
            networkExplorerService.scanNetwork()
        }
    }

    fun connectToDevice(device: NetworkDevice) {
        viewModelScope.launch {
            when (device.type) {
                DeviceType.SMB_SERVER -> {
                    val success = networkExplorerService.connectSMB(
                        host = device.address,
                        shareName = device.shareName ?: "share"
                    )
                    _uiState.value = _uiState.value.copy(
                        connectionError = if (!success) "Failed to connect to SMB share" else null
                    )
                }
                DeviceType.FTP_SERVER -> {
                    val success = networkExplorerService.connectFTP(
                        host = device.address,
                        port = device.port
                    )
                    _uiState.value = _uiState.value.copy(
                        connectionError = if (!success) "Failed to connect to FTP server" else null
                    )
                }
                else -> {
                    _uiState.value = _uiState.value.copy(
                        connectionError = "Device type not supported yet"
                    )
                }
            }
        }
    }

    fun enterDirectory(file: NetworkFile) {
        viewModelScope.launch {
            val files = networkExplorerService.browseDirectory(file.path)
            _uiState.value = _uiState.value.copy(
                browsePath = files,
                currentPath = file.path
            )
        }
    }

    fun navigateUp() {
        viewModelScope.launch {
            val currentPath = _uiState.value.currentPath
            if (currentPath != "") {
                val parentPath = currentPath.substringBeforeLast("\\")
                val files = networkExplorerService.browseDirectory(parentPath)
                _uiState.value = _uiState.value.copy(
                    browsePath = files,
                    currentPath = parentPath
                )
            }
        }
    }

    fun downloadFile(file: NetworkFile) {
        viewModelScope.launch {
            val downloadPath = getDownloadPath(file.name)
            val success = networkExplorerService.downloadFile(
                remotePath = file.path,
                localPath = downloadPath
            ) { progress ->
                _uiState.value = _uiState.value.copy(
                    downloadProgress = progress
                )
            }
            
            _uiState.value = _uiState.value.copy(
                downloadComplete = success,
                downloadProgress = if (success) 1f else 0f
            )
        }
    }

    private fun collectDiscoveredDevices() {
        viewModelScope.launch {
            networkExplorerService.discoveredDevices.collect { devices ->
                _uiState.value = _uiState.value.copy(
                    discoveredDevices = devices
                )
            }
        }
    }

    private fun collectConnectedDevice() {
        viewModelScope.launch {
            networkExplorerService.connectedDevice.collect { device ->
                _uiState.value = _uiState.value.copy(
                    connectedDevice = device,
                    currentPath = if (device != null) "" else ""
                )
            }
        }
    }

    private fun collectBrowsePath() {
        viewModelScope.launch {
            networkExplorerService.browsePath.collect { files ->
                if (_uiState.value.currentPath.isEmpty()) {
                    _uiState.value = _uiState.value.copy(
                        browsePath = files
                    )
                }
            }
        }
    }

    private fun getDownloadPath(fileName: String): String {
        return "/storage/emulated/0/Downloads/CleverFerret/$fileName"
    }
}

data class NetworkExplorerUiState(
    val isScanning: Boolean = false,
    val discoveredDevices: List<NetworkDevice> = emptyList(),
    val connectedDevice: NetworkDevice? = null,
    val browsePath: List<NetworkFile> = emptyList(),
    val currentPath: String = "",
    val connectionError: String? = null,
    val downloadProgress: Float = 0f,
    val downloadComplete: Boolean = false
)