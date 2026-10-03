package com.universalmedialibrary.ui.detail

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
                val mediaItem = mediaItemDao.getBookDetailsById(bookId)
                if (mediaItem != null) {
                    // Build details from media item and metadata
                    val common = metadataDao.getMetadataCommonByItemId(bookId)
                    val author = metadataDao.getAuthorsByItemId(bookId).firstOrNull()
                    val seriesName = metadataDao.getSeriesByItemId(bookId)
                    
                    if (common != null) {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            details = BookDetails(
                                mediaItem = mediaItem,
                                metadata = common,
                                authorName = author,
                                seriesName = seriesName
                            )
                        )
                    } else {
                        _uiState.value = _uiState.value.copy(isLoading = false, error = "Book metadata not found")
                    }
                } else {
                    _uiState.value = _uiState.value.copy(isLoading = false, error = "Book not found")
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
