package com.universalmedialibrary.ui.detail

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.ReadingProgress
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for MediaItemDetailScreen
 */
@HiltViewModel
class MediaItemDetailViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val readingProgressDao: ReadingProgressDao
) : ViewModel() {

    private val _uiState = MutableStateFlow(MediaItemDetailUiState())
    val uiState: StateFlow<MediaItemDetailUiState> = _uiState.asStateFlow()

    fun loadMediaItem(itemId: Long) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)
                
                // Load media item
                val mediaItem = mediaItemDao.getItemById(itemId)
                if (mediaItem == null) {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = "Media item not found"
                    )
                    return@launch
                }
                
                // Load metadata
                val metadata = metadataDao.getMetadataCommonByItemId(itemId)
                
                // Load progress
                val progress = readingProgressDao.getProgressByItemId(itemId)
                
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    mediaItem = mediaItem,
                    metadata = metadata,
                    progress = progress,
                    error = null
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message ?: "Unknown error occurred"
                )
            }
        }
    }

    fun toggleFavorite() {
        viewModelScope.launch {
            try {
                val currentItem = _uiState.value.mediaItem ?: return@launch
                val newFavoriteState = !_uiState.value.isFavorite
                
                // Update in database
                // TODO: Add favorite field to MediaItem entity
                
                _uiState.value = _uiState.value.copy(isFavorite = newFavoriteState)
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun refresh(itemId: Long) {
        loadMediaItem(itemId)
    }
}

data class MediaItemDetailUiState(
    val isLoading: Boolean = false,
    val mediaItem: MediaItem? = null,
    val metadata: MetadataCommon? = null,
    val progress: ReadingProgress? = null,
    val isFavorite: Boolean = false,
    val error: String? = null
)
