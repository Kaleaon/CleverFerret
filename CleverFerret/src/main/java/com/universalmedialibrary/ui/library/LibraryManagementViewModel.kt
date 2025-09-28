package com.universalmedialibrary.ui.library

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.repository.LibraryRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for library management screen
 * Handles library creation, updates, and UI state management
 */
@HiltViewModel
class LibraryManagementViewModel @Inject constructor(
    private val libraryRepository: LibraryRepository
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
                    path = path,
                    isActive = true,
                    dateCreated = System.currentTimeMillis(),
                    lastScanned = 0,
                    description = "Created on ${java.text.SimpleDateFormat("MMM dd, yyyy").format(java.util.Date())}"
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
     * Scans a library for media files
     */
    fun scanLibrary(libraryId: Long) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading
                
                // TODO: Implement actual media scanning
                // For now, just update the last scanned timestamp
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
     * Imports a Calibre library from the specified path
     */
    fun importCalibreLibrary(path: String, libraryName: String) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading
                
                val library = Library(
                    name = libraryName,
                    type = "BOOK",
                    path = path,
                    isActive = true,
                    dateCreated = System.currentTimeMillis(),
                    lastScanned = 0,
                    description = "Imported from Calibre library at $path"
                )
                
                libraryRepository.createLibrary(library)
                
                // TODO: Implement actual Calibre database parsing and import
                // This would involve:
                // 1. Reading the metadata.db file from the Calibre library
                // 2. Parsing book metadata, authors, tags, etc.
                // 3. Creating MediaItem entries for each book
                // 4. Copying or linking to book files
                
                _uiState.value = LibraryManagementUiState.Success
                
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to import Calibre library: ${e.message}"
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