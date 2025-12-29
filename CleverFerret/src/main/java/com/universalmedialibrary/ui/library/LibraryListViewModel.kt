package com.universalmedialibrary.ui.library

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.Library
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for the LibraryListScreen
 * Manages the state of the library list and media item counts
 */
@HiltViewModel
class LibraryListViewModel @Inject constructor(
    private val libraryDao: LibraryDao,
    private val mediaItemDao: MediaItemDao
) : ViewModel() {

    data class LibraryWithCount(
        val library: Library,
        val itemCount: Int
    )

    data class UiState(
        val libraries: List<LibraryWithCount> = emptyList(),
        val isLoading: Boolean = true,
        val error: String? = null
    )

    private val _uiState = MutableStateFlow(UiState())
    val uiState: StateFlow<UiState> = _uiState.asStateFlow()

    init {
        loadLibraries()
    }

    private fun loadLibraries() {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)

                libraryDao.getAllActiveLibraries().collect { libraries ->
                    // Get item counts for each library
                    val librariesWithCounts = libraries.map { library ->
                        val itemCount = mediaItemDao.getItemCountByLibrary(library.libraryId)
                        LibraryWithCount(library, itemCount)
                    }
                    _uiState.value = _uiState.value.copy(
                        libraries = librariesWithCounts,
                        isLoading = false,
                        error = null
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message ?: "Unknown error occurred"
                )
            }
        }
    }

    fun refresh() {
        loadLibraries()
    }
}

/**
 * Extension function to convert Room Library entity to UI LibraryItem
 */
fun LibraryListViewModel.LibraryWithCount.toLibraryItem(): LibraryItem {
    return LibraryItem(
        id = library.libraryId.toInt(),
        name = library.name,
        type = when (library.type) {
            "BOOK" -> LibraryType.BOOK
            "MOVIE" -> LibraryType.MOVIE
            "MUSIC" -> LibraryType.MUSIC
            "PODCAST" -> LibraryType.PODCAST
            "MAGAZINE" -> LibraryType.MAGAZINE
            "DOCUMENT" -> LibraryType.DOCUMENT
            else -> LibraryType.DOCUMENT
        },
        itemCount = itemCount,
        isActive = library.isActive,
        lastSyncTime = if (library.lastScanned?.let { it > 0 } == true) {
            formatLastSyncTime(library.lastScanned!!)
        } else {
            "Never synced"
        }
    )
}

private fun formatLastSyncTime(timestamp: Long): String {
    val now = System.currentTimeMillis()
    val diffMillis = now - timestamp
    val diffHours = diffMillis / (1000 * 60 * 60)
    val diffDays = diffHours / 24

    return when {
        diffHours < 1 -> "Updated just now"
        diffHours < 24 -> "Updated ${diffHours}h ago"
        diffDays == 1L -> "Updated yesterday"
        diffDays < 7 -> "Updated ${diffDays}d ago"
        else -> "Updated ${diffDays / 7}w ago"
    }
}
