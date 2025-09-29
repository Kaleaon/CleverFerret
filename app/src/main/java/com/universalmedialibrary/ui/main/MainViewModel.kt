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
 * The ViewModel for the main screen of the application.
 *
 * This class is responsible for preparing and managing the data for the UI. It interacts with the
 * data layer (specifically the [LibraryDao]) to fetch and update library information.
 *
 * @property libraryDao The Data Access Object for libraries, injected by Hilt.
 */
@HiltViewModel
class MainViewModel
    @Inject
    constructor(
        private val libraryDao: LibraryDao,
    ) : ViewModel() {
        /**
         * A [StateFlow] that emits the current list of all libraries in the database.
         *
         * The UI can collect this flow to observe changes to the list of libraries in real-time.
         * The flow is configured to stay active for 5 seconds after the last collector unsubscribes,
         * which helps survive configuration changes without refetching the data.
         */
        val libraries: StateFlow<List<Library>> =
            libraryDao
                .getAllLibraries()
                .stateIn(
                    scope = viewModelScope,
                    started = SharingStarted.WhileSubscribed(5000),
                    initialValue = emptyList(),
                )

        /**
         * Creates and inserts a new library into the database.
         *
         * This function is executed in a coroutine within the [viewModelScope].
         *
         * @param name The name of the new library.
         * @param type The type of media the library will hold (e.g., "BOOK", "MOVIE").
         * @param path The root file path for the library.
         */
        fun addLibrary(
            name: String,
            type: String,
            path: String,
        ) {
            viewModelScope.launch {
                val newLibrary = Library(name = name, type = type, path = path)
                libraryDao.insertLibrary(newLibrary)
            }
        }
    }
