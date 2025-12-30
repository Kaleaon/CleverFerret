package com.universalmedialibrary.ui.sharing

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.media.*
import com.universalmedialibrary.services.sharing.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for QR Code Sharing Screen
 */
@HiltViewModel
class QRCodeSharingViewModel @Inject constructor(
    private val qrCodeSharingService: QRCodeSharingService,
    private val mediaLibraryService: MediaLibraryService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(QRCodeSharingUiState())
    val uiState: StateFlow<QRCodeSharingUiState> = _uiState.asStateFlow()

    init {
        viewModelScope.launch {
            collectSharingStatus()
            collectShareUrl()
            collectQRCode()
            collectConnectedDevices()
        }
    }

    fun initialize() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isInitialized = true
            )
        }
    }

    fun startSharing(type: SharingType) {
        viewModelScope.launch {
            when (type) {
                SharingType.PLAYLIST -> {
                    // For now, create a sample playlist
                    val playlist = createSamplePlaylist()
                    val result = qrCodeSharingService.startSharing(playlist)
                    
                    if (result.success) {
                        _uiState.value = _uiState.value.copy(
                            sharingMode = SharingMode.SHARING,
                            shareResult = result
                        )
                    } else {
                        _uiState.value = _uiState.value.copy(
                            error = result.message
                        )
                    }
                }
                SharingType.CURRENT_TRACK -> {
                    val result = qrCodeSharingService.shareCurrentlyPlaying()
                    
                    if (result.success) {
                        _uiState.value = _uiState.value.copy(
                            sharingMode = SharingMode.SHARING,
                            shareResult = result
                        )
                    } else {
                        _uiState.value = _uiState.value.copy(
                            error = result.message
                        )
                    }
                }
                SharingType.MEDIA_ITEM -> {
                    // Implementation would show media picker
                    _uiState.value = _uiState.value.copy(
                        error = "Media picker not implemented yet"
                    )
                }
            }
        }
    }

    fun stopSharing() {
        qrCodeSharingService.stopSharing()
        _uiState.value = _uiState.value.copy(
            sharingMode = SharingMode.IDLE,
            shareResult = null
        )
    }

    fun receiveFromUrl(url: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isReceiving = true
            )
            
            val result = qrCodeSharingService.receiveFromQRCode(url)
            
            if (result.success) {
                _uiState.value = _uiState.value.copy(
                    receiveResult = result,
                    error = null
                )
                
                // Import received items to library
                result.playlist?.items?.forEach { item ->
                    mediaLibraryService.addMediaItem(item)
                }
            } else {
                _uiState.value = _uiState.value.copy(
                    error = result.message,
                    isReceiving = false
                )
            }
        }
    }

    fun clearReceiveUrl() {
        _uiState.value = _uiState.value.copy(
            receiveUrl = null,
            receiveResult = null,
            isReceiving = false,
            error = null
        )
    }

    fun clearError() {
        _uiState.value = _uiState.value.copy(
            error = null
        )
    }

    private fun collectSharingStatus() {
        viewModelScope.launch {
            qrCodeSharingService.isSharing.collect { isSharing ->
                if (!isSharing && _uiState.value.sharingMode == SharingMode.SHARING) {
                    _uiState.value = _uiState.value.copy(
                        sharingMode = SharingMode.IDLE,
                        shareResult = null
                    )
                }
            }
        }
    }

    private fun collectShareUrl() {
        viewModelScope.launch {
            qrCodeSharingService.shareUrl.collect { url ->
                _uiState.value = _uiState.value.copy(
                    shareUrl = url
                )
            }
        }
    }

    private fun collectQRCode() {
        viewModelScope.launch {
            qrCodeSharingService.qrCode.collect { qrCode ->
                _uiState.value = _uiState.value.copy(
                    qrCode = qrCode
                )
            }
        }
    }

    private fun collectConnectedDevices() {
        viewModelScope.launch {
            qrCodeSharingService.connectedDevices.collect { devices ->
                _uiState.value = _uiState.value.copy(
                    connectedDevices = devices
                )
            }
        }
    }

    private fun createSamplePlaylist(): MediaPlaylist {
        val items = listOf(
            MediaItem(
                id = "1",
                title = "Sample Track 1",
                artist = "Sample Artist",
                mimeType = "audio/mpeg",
                url = "http://example.com/track1.mp3"
            ),
            MediaItem(
                id = "2",
                title = "Sample Track 2",
                artist = "Sample Artist",
                mimeType = "audio/mpeg",
                url = "http://example.com/track2.mp3"
            )
        )
        
        return MediaPlaylist(
            id = "sample_playlist",
            name = "Sample Playlist",
            items = items,
            createdAt = System.currentTimeMillis(),
            description = "A sample playlist for sharing"
        )
    }
}

data class QRCodeSharingUiState(
    val isInitialized: Boolean = false,
    val sharingMode: SharingMode = SharingMode.IDLE,
    val shareUrl: String? = null,
    val qrCode: android.graphics.Bitmap? = null,
    val connectedDevices: List<ConnectedDevice> = emptyList(),
    val shareResult: ShareResult? = null,
    val receiveUrl: String? = null,
    val receiveResult: ReceiveResult? = null,
    val isReceiving: Boolean = false,
    val error: String? = null
)