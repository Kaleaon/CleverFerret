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
import com.universalmedialibrary.data.local.entity.UnifiedTag
import com.universalmedialibrary.data.repository.MetadataFetchRepository
import com.universalmedialibrary.data.repository.MetadataFetchResult
import com.universalmedialibrary.data.repository.CollectionRepository
import com.universalmedialibrary.data.repository.TagRepository
import com.universalmedialibrary.services.ai.AIMetadataService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
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
    private val collectionRepository: CollectionRepository,
    private val tagRepository: TagRepository,
    private val aiMetadataService: AIMetadataService
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
                
                // Load tags
                val tags = tagRepository.getTagsForItem(itemId).first()

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    mediaItem = mediaItem,
                    metadata = metadata,
                    progress = progress,
                    tags = tags,
                    error = null,
                    isFavorite = mediaItem.isFavorite || metadata?.isFavorite == true
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
                
                mediaItemDao.setFavorite(currentItem.itemId, newFavoriteState)
                metadataDao.setFavorite(currentItem.itemId, newFavoriteState)

                _uiState.value = _uiState.value.copy(
                    isFavorite = newFavoriteState,
                    mediaItem = currentItem.copy(isFavorite = newFavoriteState),
                    metadata = _uiState.value.metadata?.copy(isFavorite = newFavoriteState)
                )
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

    fun suggestTags() {
        viewModelScope.launch {
            try {
                val mediaItem = _uiState.value.mediaItem ?: return@launch
                val metadata = _uiState.value.metadata

                _uiState.value = _uiState.value.copy(
                    isSuggestingTags = true,
                    tagSuggestionError = null
                )

                val result = aiMetadataService.suggestTags(mediaItem, metadata)

                result.onSuccess { tags ->
                    _uiState.value = _uiState.value.copy(
                        isSuggestingTags = false,
                        suggestedTags = tags
                    )
                }.onFailure { error ->
                    _uiState.value = _uiState.value.copy(
                        isSuggestingTags = false,
                        tagSuggestionError = error.message ?: "Failed to suggest tags"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isSuggestingTags = false,
                    tagSuggestionError = e.message ?: "Failed to suggest tags"
                )
            }
        }
    }

    fun saveSuggestedTags(selectedTags: List<String>) {
        viewModelScope.launch {
            try {
                val itemId = _uiState.value.mediaItem?.itemId ?: return@launch
                tagRepository.applyTagsByName(itemId, selectedTags)
                
                // Refresh tags
                val tags = tagRepository.getTagsForItem(itemId).first()
                _uiState.value = _uiState.value.copy(
                    tags = tags,
                    suggestedTags = emptyList() // Clear suggestions after saving
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    tagSuggestionError = e.message ?: "Failed to save tags"
                )
            }
        }
    }

    fun dismissTagSuggestions() {
        _uiState.value = _uiState.value.copy(
            suggestedTags = emptyList(),
            tagSuggestionError = null
        )
    }
}

data class MediaItemDetailUiState(
    val isLoading: Boolean = false,
    val mediaItem: MediaItem? = null,
    val metadata: MetadataCommon? = null,
    val progress: ReadingProgress? = null,
    val tags: List<UnifiedTag> = emptyList(),
    val isFavorite: Boolean = false,
    val error: String? = null,
    
    val isFetchingMetadata: Boolean = false,
    val metadataFetchError: String? = null,
    val metadataFetchSuccess: String? = null,
    
    val showAddToCollectionDialog: Boolean = false,
    val availableCollections: List<UnifiedCollection> = emptyList(),
    val addToCollectionSuccess: String? = null,
    val addToCollectionError: String? = null,

    val isSuggestingTags: Boolean = false,
    val suggestedTags: List<String> = emptyList(),
    val tagSuggestionError: String? = null
)
