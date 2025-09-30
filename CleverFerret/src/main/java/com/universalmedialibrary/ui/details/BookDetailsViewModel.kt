package com.universalmedialibrary.ui.details

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.BookDetails
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class BookDetailsViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) : ViewModel() {

    private val _uiState = MutableStateFlow(BookDetailsUiState())
    val uiState: StateFlow<BookDetailsUiState> = _uiState.asStateFlow()

    fun load(bookId: Long) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            try {
                val details = mediaItemDao.getBookDetailsById(bookId)
                if (details != null) {
                    _uiState.value = _uiState.value.copy(isLoading = false, details = details)
                } else {
                    // Fallback: build minimal details from metadata tables if projection is missing
                    val common = metadataDao.getMetadataCommonByItemId(bookId)
                    val author = metadataDao.getAuthorsByItemId(bookId).firstOrNull()
                    if (common != null) {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            details = BookDetails(
                                mediaItem = com.universalmedialibrary.data.local.model.MediaItem(
                                    itemId = bookId,
                                    libraryId = 0,
                                    filePath = "",
                                    dateAdded = 0L,
                                    lastScanned = 0L,
                                    fileHash = ""
                                ),
                                metadata = common,
                                authorName = author
                            )
                        )
                    } else {
                        _uiState.value = _uiState.value.copy(isLoading = false, error = "Book not found")
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(isLoading = false, error = e.message ?: "Error loading book")
            }
        }
    }
}

data class BookDetailsUiState(
    val isLoading: Boolean = false,
    val details: BookDetails? = null,
    val error: String? = null
)
