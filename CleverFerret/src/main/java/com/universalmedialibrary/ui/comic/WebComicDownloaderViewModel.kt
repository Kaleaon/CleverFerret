package com.universalmedialibrary.ui.comic

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.comic.ComicSeries
import com.universalmedialibrary.services.comic.ComicvineMetadataSource
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class WebComicDownloaderViewModel @Inject constructor(
    private val comicvineMetadataSource: ComicvineMetadataSource
) : ViewModel() {

    private val _uiState = MutableStateFlow(WebComicDownloaderState())
    val uiState: StateFlow<WebComicDownloaderState> = _uiState.asStateFlow()

    fun search(query: String) {
        if (query.isBlank()) return
        
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            
            val result = comicvineMetadataSource.searchSeries(query)
            
            result.fold(
                onSuccess = { series ->
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        searchResults = series
                    )
                },
                onFailure = { error ->
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = error.message ?: "Unknown error"
                    )
                }
            )
        }
    }

    fun downloadFromUrl(url: String) {
        // TODO: Implement actual file download logic
        // For now, just simulate a download process
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isDownloading = true, downloadStatus = "Starting download...")
            kotlinx.coroutines.delay(1000)
            _uiState.value = _uiState.value.copy(downloadStatus = "Downloading... 50%")
            kotlinx.coroutines.delay(1000)
            _uiState.value = _uiState.value.copy(
                isDownloading = false, 
                downloadStatus = "Download complete (Simulated)",
                downloadSuccess = true
            )
        }
    }
    
    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }
    
    fun clearDownloadStatus() {
        _uiState.value = _uiState.value.copy(downloadSuccess = false, downloadStatus = "")
    }
}

data class WebComicDownloaderState(
    val isLoading: Boolean = false,
    val searchResults: List<ComicSeries> = emptyList(),
    val error: String? = null,
    val isDownloading: Boolean = false,
    val downloadStatus: String = "",
    val downloadSuccess: Boolean = false
)
