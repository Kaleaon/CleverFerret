package com.universalmedialibrary.ui.library

import android.content.Context
import android.content.Intent
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.services.CalibreImportService
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for library management screen
 * Handles library creation, updates, and UI state management
 */
@HiltViewModel
class LibraryManagementViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val libraryRepository: LibraryRepository,
    private val calibreExportService: CalibreExportService
) : ViewModel() {

    private val _uiState = MutableStateFlow<LibraryManagementUiState>(LibraryManagementUiState.Success)
    val uiState: StateFlow<LibraryManagementUiState> = _uiState.asStateFlow()

    val libraries: StateFlow<List<Library>> = libraryRepository.getAllActiveLibraries()
        .catch { throwable ->
            _uiState.value = LibraryManagementUiState.Error(
                throwable.message ?: "Failed to load libraries"
            )
        }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )

    /**
     * Creates a new library with the specified parameters
     */
    fun createLibrary(name: String, type: String, path: String) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading

                val library = Library(
                    name = name,
                    type = type,
                    path = path
                )

                libraryRepository.createLibrary(library)
                _uiState.value = LibraryManagementUiState.Success

            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to create library: ${e.message}"
                )
            }
        }
    }

    /**
     * Updates an existing library
     */
    fun updateLibrary(library: Library) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading
                libraryRepository.updateLibrary(library)
                _uiState.value = LibraryManagementUiState.Success
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to update library: ${e.message}"
                )
            }
        }
    }

    /**
     * Deletes a library
     */
    fun deleteLibrary(library: Library) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading
                libraryRepository.deleteLibrary(library)
                _uiState.value = LibraryManagementUiState.Success
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to delete library: ${e.message}"
                )
            }
        }
    }

    /**
     * Activates or deactivates a library
     */
    fun setLibraryActive(libraryId: Long, isActive: Boolean) {
        viewModelScope.launch {
            try {
                libraryRepository.toggleLibraryActive(libraryId, isActive)
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to update library status: ${e.message}"
                )
            }
        }
    }

    /**
     * Scans a library for media files using MediaScannerService
     */
    fun scanLibrary(libraryId: Long) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading

                // Get library details
                val library = libraryRepository.getLibraryById(libraryId)
                if (library == null) {
                    _uiState.value = LibraryManagementUiState.Error("Library not found")
                    return@launch
                }

                // Start MediaScannerService for this library
                val intent = Intent(context, MediaScannerService::class.java).apply {
                    action = MediaScannerService.ACTION_SCAN_LIBRARY
                    putExtra(MediaScannerService.EXTRA_LIBRARY_ID, libraryId)
                    putExtra(MediaScannerService.EXTRA_SCAN_PATH, library.path)
                }
                context.startService(intent)

                // Update last scanned timestamp
                libraryRepository.updateLastScanned(libraryId, System.currentTimeMillis())

                _uiState.value = LibraryManagementUiState.Success
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to scan library: ${e.message}"
                )
            }
        }
    }

    /**
     * Imports a Calibre library from the specified path using CalibreImportService
     */
    fun importCalibreLibrary(path: String, libraryName: String) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading

                val library = Library(
                    name = libraryName,
                    type = "BOOK",
                    path = path,
                    source = "CALIBRE"
                )

                val libraryId = libraryRepository.createLibrary(library)

                // Start CalibreImportService for actual import
                val intent = Intent(context, CalibreImportService::class.java).apply {
                    action = CalibreImportService.ACTION_IMPORT_CALIBRE
                    putExtra(CalibreImportService.EXTRA_LIBRARY_ID, libraryId)
                    putExtra(CalibreImportService.EXTRA_CALIBRE_PATH, path)
                }
                context.startService(intent)

                _uiState.value = LibraryManagementUiState.Success

            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to import Calibre library: ${e.message}"
                )
            }
        }
    }

    /**
     * Exports library to Calibre format
     */
    fun exportToCalibre(exportPath: String, libraryId: Long? = null) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading
                
                val result = calibreExportService.exportToCalibre(exportPath, libraryId)
                
                if (result.success) {
                    _uiState.value = LibraryManagementUiState.Success
                } else {
                    _uiState.value = LibraryManagementUiState.Error(result.message)
                }
                
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to export to Calibre: ${e.message}"
                )
            }
        }
    }

    /**
     * Clears any error state
     */
    fun clearError() {
        if (_uiState.value is LibraryManagementUiState.Error) {
            _uiState.value = LibraryManagementUiState.Success
        }
    }
}

/**
 * UI state for library management screen
 */
sealed class LibraryManagementUiState {
    object Success : LibraryManagementUiState()
    object Loading : LibraryManagementUiState()
    data class Error(val message: String) : LibraryManagementUiState()
}
