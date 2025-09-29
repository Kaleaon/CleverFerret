package com.universalmedialibrary.ui.details

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.model.BookDetails
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import javax.inject.Inject

/**
 * The ViewModel for the library details screen.
 *
 * This class is responsible for fetching and managing the data for a specific library's content.
 * It uses the `libraryId` passed via navigation to query the database.
 *
 * @property mediaItemDao The Data Access Object for media items, injected by Hilt.
 * @param savedStateHandle A handle to the saved state of the ViewModel, used to retrieve navigation arguments.
 */
@HiltViewModel
class LibraryDetailsViewModel
    @Inject
    constructor(
        private val mediaItemDao: MediaItemDao,
        savedStateHandle: SavedStateHandle,
    ) : ViewModel() {
        /** Retrieves the library ID from the navigation arguments. Defaults to 0 if not found. */
        private val libraryId: Long = savedStateHandle.get<String>("libraryId")?.toLong() ?: 0

        /**
         * A [StateFlow] that emits the list of [BookDetails] for the current library.
         *
         * The UI can collect this flow to display the books in the library and observe any changes.
         * The flow is configured to stay active for 5 seconds after the last collector unsubscribes,
         * helping to preserve the state across configuration changes.
         */
        val bookDetails: StateFlow<List<BookDetails>> =
            mediaItemDao
                .getBookDetailsForLibrary(libraryId)
                .stateIn(
                    scope = viewModelScope,
                    started = SharingStarted.WhileSubscribed(5000),
                    initialValue = emptyList(),
                )
    }
