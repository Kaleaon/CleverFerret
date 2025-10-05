package com.universalmedialibrary.ui.library

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.model.Library
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for managing library operations.
 *
 * This ViewModel handles the creation, deletion, and management of media libraries.
 * It interacts with the LibraryDao to perform database operations and provides
 * state management for the library-related UI components.
 */
@HiltViewModel
class LibraryManagementViewModel
    @Inject
    constructor(
        private val libraryDao: LibraryDao,
    ) : ViewModel() {

    /**
     * StateFlow emitting the current list of all libraries.
     */
    val libraries: StateFlow<List<Library>> = libraryDao.getAllLibraries()
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList(),
        )

    /**
     * Creates a new library with the specified name, type, and path.
     *
     * @param name The name of the library.
     * @param type The type of media the library will contain (e.g., "BOOK", "MUSIC", "MOVIE").
     * @param path The file system path where the library is located.
     */
    fun createLibrary(name: String, type: String, path: String) {
        viewModelScope.launch {
            val library = Library(
                name = name,
                type = type,
                path = path,
            )
            libraryDao.insertLibrary(library)
        }
    }

    /**
     * Deletes a library by its ID.
     *
     * @param libraryId The ID of the library to delete.
     */
    fun deleteLibrary(libraryId: Long) {
        viewModelScope.launch {
            // Note: This would need a delete method in LibraryDao
            // For now, this is a placeholder
        }
    }
}