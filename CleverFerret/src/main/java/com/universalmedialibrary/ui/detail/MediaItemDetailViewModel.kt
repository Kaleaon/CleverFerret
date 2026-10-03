package com.universalmedialibrary.ui.detail

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import android.net.Uri
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
import com.universalmedialibrary.services.thumbnails.ThumbnailService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.launch
import java.io.File
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
    private val aiMetadataService: AIMetadataService,
    private val thumbnailService: ThumbnailService
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
                if (e is CancellationException) throw e
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
                if (e is CancellationException) throw e
                // Handle error
            }
        }
    }

    fun fetchMetadata() {
        viewModelScope.launch {
            try {
                val mediaItem = _uiState.value.mediaItem ?: return@launch
                _uiState.value = _uiState.value.copy(
                    isFetchingMetadata = true,
                    metadataFetchError = null,
                    metadataRefreshTask = BackgroundTaskState.queued("Metadata refresh")
                )
                _uiState.value = _uiState.value.copy(
                    metadataRefreshTask = BackgroundTaskState.running("Metadata refresh", progress = 0.2f)
                )
                
                val result = metadataFetchRepository.fetchMetadataForItem(mediaItem.itemId)
                
                when (result) {
                    is MetadataFetchResult.Success -> {
                        _uiState.value = _uiState.value.copy(
                            isFetchingMetadata = false,
                            metadata = result.metadata,
                            metadataFetchError = null,
                            metadataFetchSuccess = "Metadata fetched from: ${result.sources.joinToString(", ")}",
                            imageCacheVersion = System.currentTimeMillis(),
                            metadataRefreshTask = BackgroundTaskState.success(
                                "Metadata refresh",
                                "Metadata updated from ${result.sources.joinToString(", ")}"
                            )
                        )
                        // Reload item to get updated hasMetadata flag
                        loadMediaItem(mediaItem.itemId)
                    }
                    is MetadataFetchResult.Error -> {
                        _uiState.value = _uiState.value.copy(
                            isFetchingMetadata = false,
                            metadataFetchError = result.message,
                            metadataFetchSuccess = null,
                            metadataRefreshTask = BackgroundTaskState.failed("Metadata refresh", result.message)
                        )
                    }
                }
            } catch (e: Exception) {
                if (e is CancellationException) throw e
                _uiState.value = _uiState.value.copy(
                    isFetchingMetadata = false,
                    metadataFetchError = e.message ?: "Failed to fetch metadata",
                    metadataRefreshTask = BackgroundTaskState.failed(
                        "Metadata refresh",
                        e.message ?: "Failed to fetch metadata"
                    )
                )
            }
        }
    }

    fun regenerateThumbnail() {
        viewModelScope.launch {
            val mediaItem = _uiState.value.mediaItem ?: return@launch
            val metadata = _uiState.value.metadata
            val oldCoverPath = metadata?.coverImagePath
            val oldThumbnailPath = mediaItem.thumbnailPath
            try {
                _uiState.value = _uiState.value.copy(
                    thumbnailTask = BackgroundTaskState.queued("Thumbnail regeneration")
                )
                _uiState.value = _uiState.value.copy(
                    thumbnailTask = BackgroundTaskState.running("Thumbnail regeneration", progress = 0.2f)
                )

                val sourceUri = when {
                    mediaItem.filePath.startsWith("content://") || mediaItem.filePath.startsWith("file://") ->
                        Uri.parse(mediaItem.filePath)
                    else -> Uri.fromFile(File(mediaItem.filePath))
                }

                val thumbnailFile = when (mediaItem.fileExtension.lowercase()) {
                    "epub" -> thumbnailService.extractCoverFromEpub(sourceUri)
                    "cbz" -> thumbnailService.extractCoverFromCbz(sourceUri)
                    else -> null
                } ?: thumbnailService.generatePlaceholder(
                    title = metadata?.title ?: mediaItem.fileName.substringBeforeLast('.')
                )

                _uiState.value = _uiState.value.copy(
                    thumbnailTask = BackgroundTaskState.running("Thumbnail regeneration", progress = 0.85f)
                )

                val timestamp = System.currentTimeMillis()
                val thumbnailPath = thumbnailFile.absolutePath
                mediaItemDao.updateMediaItem(
                    mediaItem.copy(
                        hasThumbnail = true,
                        thumbnailPath = thumbnailPath,
                        lastScanned = timestamp
                    )
                )

                val updatedMetadata = (metadata ?: MetadataCommon(
                    itemId = mediaItem.itemId,
                    title = mediaItem.fileName.substringBeforeLast('.')
                )).copy(
                    coverImagePath = thumbnailPath,
                    lastUpdated = timestamp
                )
                metadataDao.insertMetadataCommon(updatedMetadata)
                cleanupStaleCacheFile(oldCoverPath, thumbnailPath)
                cleanupStaleCacheFile(oldThumbnailPath, thumbnailPath)

                _uiState.value = _uiState.value.copy(
                    mediaItem = mediaItem.copy(
                        hasThumbnail = true,
                        thumbnailPath = thumbnailPath,
                        lastScanned = timestamp
                    ),
                    metadata = updatedMetadata,
                    imageCacheVersion = timestamp,
                    thumbnailTask = BackgroundTaskState.success(
                        "Thumbnail regeneration",
                        "Thumbnail regenerated successfully"
                    )
                )
            } catch (e: Exception) {
                if (e is CancellationException) throw e
                _uiState.value = _uiState.value.copy(
                    thumbnailTask = BackgroundTaskState.failed(
                        "Thumbnail regeneration",
                        e.message ?: "Failed to regenerate thumbnail"
                    )
                )
            }
        }
    }

    fun clearBackgroundTask(taskType: BackgroundTaskType) {
        when (taskType) {
            BackgroundTaskType.METADATA -> _uiState.value = _uiState.value.copy(metadataRefreshTask = null)
            BackgroundTaskType.THUMBNAIL -> _uiState.value = _uiState.value.copy(thumbnailTask = null)
        }
    }

    private fun cleanupStaleCacheFile(oldPath: String?, newPath: String?) {
        if (oldPath.isNullOrBlank() || oldPath == newPath) return
        runCatching {
            if (!oldPath.startsWith("http://") && !oldPath.startsWith("https://")) {
                File(oldPath).takeIf { it.exists() }?.delete()
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
                if (e is CancellationException) throw e
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
                if (e is CancellationException) throw e
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
                if (e is CancellationException) throw e
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
                if (e is CancellationException) throw e
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
    val metadataRefreshTask: BackgroundTaskState? = null,
    val thumbnailTask: BackgroundTaskState? = null,
    val imageCacheVersion: Long = 0L,
    
    val showAddToCollectionDialog: Boolean = false,
    val availableCollections: List<UnifiedCollection> = emptyList(),
    val addToCollectionSuccess: String? = null,
    val addToCollectionError: String? = null,

    val isSuggestingTags: Boolean = false,
    val suggestedTags: List<String> = emptyList(),
    val tagSuggestionError: String? = null
)

enum class BackgroundTaskStatus {
    QUEUED,
    RUNNING,
    FAILED,
    SUCCESS
}

enum class BackgroundTaskType {
    METADATA,
    THUMBNAIL
}

data class BackgroundTaskState(
    val label: String,
    val status: BackgroundTaskStatus,
    val progress: Float,
    val message: String? = null
) {
    companion object {
        fun queued(label: String) = BackgroundTaskState(label, BackgroundTaskStatus.QUEUED, progress = 0f)
        fun running(label: String, progress: Float) = BackgroundTaskState(label, BackgroundTaskStatus.RUNNING, progress = progress)
        fun failed(label: String, message: String) = BackgroundTaskState(label, BackgroundTaskStatus.FAILED, progress = 1f, message = message)
        fun success(label: String, message: String) = BackgroundTaskState(label, BackgroundTaskStatus.SUCCESS, progress = 1f, message = message)
    }
}
