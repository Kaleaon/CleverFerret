package com.universalmedialibrary.ui.detail

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.ReadingProgress
import com.universalmedialibrary.data.local.entity.UnifiedCollection
import com.universalmedialibrary.data.repository.MetadataFetchRepository
import com.universalmedialibrary.data.repository.MetadataFetchResult
import com.universalmedialibrary.data.repository.CollectionRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import kotlinx.coroutines.flow.first
import javax.inject.Inject

/**
 * ViewModel for MediaItemDetailScreen
 */
@HiltViewModel
class MediaItemDetailViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val readingProgressDao: ReadingProgressDao,
    private val metadataFetchRepository: MetadataFetchRepository,
    private val collectionRepository: CollectionRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(MediaItemDetailUiState())
    val uiState: StateFlow<MediaItemDetailUiState> = _uiState.asStateFlow()

    fun loadMediaItem(itemId: Long) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)
                
                // Load media item
                val mediaItem = mediaItemDao.getMediaItemById(itemId)
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
                val progress = readingProgressDao.getProgress(itemId).first()
                
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
                // TODO: Add isFavorite boolean field to MediaItem entity schema
                // Then update: mediaItemDao.updateFavorite(currentItem.itemId, newFavoriteState)
                // Or add: @Query("UPDATE media_items SET is_favorite = :isFavorite WHERE item_id = :itemId")
                
                _uiState.value = _uiState.value.copy(isFavorite = newFavoriteState)
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun fetchMetadata() {
        viewModelScope.launch {
            try {
                val mediaItem = _uiState.value.mediaItem ?: return@launch
                
                _uiState.value = _uiState.value.copy(isFetchingMetadata = true, metadataFetchError = null)
                
                val result = metadataFetchRepository.fetchMetadataForItem(mediaItem.itemId)
                
                when (result) {
                    is MetadataFetchResult.Success -> {
                        _uiState.value = _uiState.value.copy(
                            isFetchingMetadata = false,
                            metadata = result.metadata,
                            metadataFetchError = null,
                            metadataFetchSuccess = "Metadata fetched from: ${result.sources.joinToString(", ")}"
                        )
                        // Reload item to get updated hasMetadata flag
                        loadMediaItem(mediaItem.itemId)
                    }
                    is MetadataFetchResult.Error -> {
                        _uiState.value = _uiState.value.copy(
                            isFetchingMetadata = false,
                            metadataFetchError = result.message,
                            metadataFetchSuccess = null
                        )
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isFetchingMetadata = false,
                    metadataFetchError = e.message ?: "Failed to fetch metadata"
                )
            }
        }
    }

    fun clearMetadataFetchStatus() {
        _uiState.value = _uiState.value.copy(
            metadataFetchError = null,
            metadataFetchSuccess = null
        )
    }

    fun refresh(itemId: Long) {
        loadMediaItem(itemId)
    }

    fun loadCollections() {
        viewModelScope.launch {
            try {
                collectionRepository.getCollections().collect { collections ->
                    _uiState.value = _uiState.value.copy(availableCollections = collections)
                }
            } catch (e: Exception) {
                // Silently fail for collections
            }
        }
    }

    fun showAddToCollectionDialog() {
        _uiState.value = _uiState.value.copy(showAddToCollectionDialog = true)
        loadCollections()
    }

    fun hideAddToCollectionDialog() {
        _uiState.value = _uiState.value.copy(showAddToCollectionDialog = false)
    }

    fun addToCollection(collectionId: Long) {
        viewModelScope.launch {
            try {
                val itemId = _uiState.value.mediaItem?.itemId ?: return@launch
                collectionRepository.addItem(collectionId, itemId)
                _uiState.value = _uiState.value.copy(
                    addToCollectionSuccess = "Added to collection"
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    addToCollectionError = e.message ?: "Failed to add to collection"
                )
            }
        }
    }

    fun clearAddToCollectionStatus() {
        _uiState.value = _uiState.value.copy(
            addToCollectionSuccess = null,
            addToCollectionError = null
        )
    }
}

data class MediaItemDetailUiState(
    val isLoading: Boolean = false,
    val mediaItem: MediaItem? = null,
    val metadata: MetadataCommon? = null,
    val progress: ReadingProgress? = null,
    val isFavorite: Boolean = false,
    val error: String? = null,
    val isFetchingMetadata: Boolean = false,
    val metadataFetchError: String? = null,
    val metadataFetchSuccess: String? = null,
    val showAddToCollectionDialog: Boolean = false,
    val availableCollections: List<UnifiedCollection> = emptyList(),
    val addToCollectionSuccess: String? = null,
    val addToCollectionError: String? = null
)
