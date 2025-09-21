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
 * The view model for the library details screen.
 *
 * @param mediaItemDao The DAO for media items.
 * @param savedStateHandle A handle to the saved state of the view model.
 */
@HiltViewModel
class LibraryDetailsViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    savedStateHandle: SavedStateHandle
) : ViewModel() {

    private val libraryId: Long = savedStateHandle.get<String>("libraryId")?.toLong() ?: 0

    /** A [StateFlow] that emits the list of book details for the current library. */
    val bookDetails: StateFlow<List<BookDetails>> = mediaItemDao.getBookDetailsForLibrary(libraryId)
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )
}
