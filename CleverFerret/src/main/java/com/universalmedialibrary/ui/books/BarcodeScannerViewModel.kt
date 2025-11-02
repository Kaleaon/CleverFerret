package com.universalmedialibrary.ui.books

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.services.barcode.BarcodeScannerService
import com.universalmedialibrary.services.metadata.sources.OpenLibraryMetadataSource
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Barcode Scanner Screen
 */
@HiltViewModel
class BarcodeScannerViewModel @Inject constructor(
    private val barcodeScannerService: BarcodeScannerService,
    private val openLibrarySource: OpenLibraryMetadataSource,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(BarcodeScannerUiState())
    val uiState: StateFlow<BarcodeScannerUiState> = _uiState.asStateFlow()
    
    /**
     * Handle a scanned barcode
     */
    fun onBarcodeScanned(isbn: String) {
        val normalizedISBN = barcodeScannerService.normalizeISBN(isbn)
        
        _uiState.update { it.copy(
            scannedISBN = normalizedISBN,
            isSearching = true,
            errorMessage = null
        )}
        
        // Search for the book using OpenLibrary
        viewModelScope.launch {
            try {
                val searchResult = openLibrarySource.search(
                    query = null,
                    isbn = normalizedISBN,
                    title = null,
                    author = null,
                    maxResults = 1
                )
                
                searchResult.fold(
                    onSuccess = { results ->
                        if (results.isNotEmpty()) {
                            val book = results.first()
                            // Book found, now check if we need to save it
                            _uiState.update { it.copy(
                                isSearching = false,
                                errorMessage = null
                            )}
                        } else {
                            _uiState.update { it.copy(
                                isSearching = false,
                                errorMessage = "Book not found in OpenLibrary database"
                            )}
                        }
                    },
                    onFailure = { error ->
                        _uiState.update { it.copy(
                            isSearching = false,
                            errorMessage = "Failed to search: ${error.message}"
                        )}
                    }
                )
            } catch (e: Exception) {
                _uiState.update { it.copy(
                    isSearching = false,
                    errorMessage = "Error: ${e.message}"
                )}
            }
        }
    }
    
    /**
     * Handle scan cancellation
     */
    fun onScanCancelled() {
        _uiState.update { it.copy(
            scannedISBN = null,
            isSearching = false,
            errorMessage = null
        )}
    }
    
    /**
     * Reset state
     */
    fun reset() {
        _uiState.value = BarcodeScannerUiState()
    }
}
