package com.universalmedialibrary.ui.main

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
 * The view model for the main screen of the application.
 *
 * @param libraryDao The DAO for libraries.
 */
@HiltViewModel
class MainViewModel @Inject constructor(
    private val libraryDao: LibraryDao
) : ViewModel() {

    /** A [StateFlow] that emits the list of all libraries. */
    val libraries: StateFlow<List<Library>> = libraryDao.getAllLibraries()
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )


    /**
     * Adds a new library to the database.
     *
     * @param name The name of the library.
     * @param type The type of the library.
     * @param path The path to the library's root directory.
     */
    fun addLibrary(name: String, type: String, path: String) {
        viewModelScope.launch {
            val newLibrary = Library(name = name, type = type, path = path)
            libraryDao.insertLibrary(newLibrary)
        }
    }
}
