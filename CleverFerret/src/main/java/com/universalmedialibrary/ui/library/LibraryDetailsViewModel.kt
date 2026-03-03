package com.universalmedialibrary.ui.library

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.LibraryScanSettings
import com.universalmedialibrary.data.local.entity.ListenHistoryDailyCount
import com.universalmedialibrary.data.local.entity.ListenHistoryTopItem
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.ListenHistoryRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for the LibraryDetailsScreen
 * Manages the state of media items within a specific library
 */
@HiltViewModel
    class LibraryDetailsScreenViewModel @Inject constructor(
        private val libraryDao: LibraryDao,
        private val mediaItemDao: MediaItemDao,
        private val metadataDao: MetadataDao,
        private val libraryRepository: LibraryRepository,
        private val listenHistoryRepository: ListenHistoryRepository
    ) : ViewModel() {

    data class MediaItemWithMetadata(
        val mediaItem: MediaItem,
        val metadata: MetadataCommon?
    )

    data class UiState(
        val library: Library? = null,
        val mediaItems: List<MediaItemWithMetadata> = emptyList(),
        val scanSettings: LibraryScanSettings? = null,
        val topHistory: List<ListenHistoryTopItem> = emptyList(),
        val dailyCounts: List<ListenHistoryDailyCount> = emptyList(),
        val isLoading: Boolean = true,
        val error: String? = null
    )

    private val _uiState = MutableStateFlow(UiState())
    val uiState: StateFlow<UiState> = _uiState.asStateFlow()

    fun loadLibraryDetails(libraryId: Long) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)

                val library = libraryDao.getLibraryById(libraryId)
                if (library == null) {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = "Library not found"
                    )
                    return@launch
                }

                val mediaFlow = mediaItemDao.getMediaItemsByLibrary(libraryId).map { mediaItems ->
                    if (mediaItems.isEmpty()) {
                        emptyList()
                    } else {
                        val itemIds = mediaItems.map { it.itemId }
                        val metadataMap = metadataDao.getMetadataCommonBatch(itemIds)
                            .associateBy { it.itemId }
                        mediaItems.map { mediaItem ->
                            MediaItemWithMetadata(mediaItem, metadataMap[mediaItem.itemId])
                        }
                    }
                }

                val scanSettingsFlow = libraryRepository.observeScanSettings(libraryId)
                    .map { settings ->
                        settings ?: LibraryScanSettings.defaults(libraryId, library.path)
                    }

                combine(
                    mediaFlow,
                    scanSettingsFlow,
                    listenHistoryRepository.observeTopItems(libraryId, limit = 5),
                    listenHistoryRepository.observeDailyCounts(daysBack = 14, libraryId = libraryId)
                ) { mediaItems, scanSettings, topHistory, dailyCounts ->
                    UiState(
                        library = library,
                        mediaItems = mediaItems,
                        scanSettings = scanSettings,
                        topHistory = topHistory,
                        dailyCounts = dailyCounts,
                        isLoading = false,
                        error = null
                    )
                }.collect { newState ->
                    _uiState.value = newState
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message ?: "Unknown error occurred"
                )
            }
        }
    }

    fun refresh(libraryId: Long) {
        loadLibraryDetails(libraryId)
    }

    fun updateScanSettings(updated: LibraryScanSettings) {
        viewModelScope.launch {
            try {
                libraryRepository.updateScanSettings(updated)
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = e.message ?: "Failed to update scan settings"
                )
            }
        }
    }

}

/**
 * Extension function to convert Room MediaItem with metadata to UI MediaItemData
 */
fun LibraryDetailsScreenViewModel.MediaItemWithMetadata.toMediaItemData(): MediaItemData {
    val title = metadata?.title ?: mediaItem.fileName
    val author = when (mediaItem.mediaType) {
        "BOOK" -> "Unknown Author"
        "MOVIE" -> "Director Unknown"
        "MUSIC" -> "Unknown Artist"
        "PODCAST" -> "Unknown Host"
        "MAGAZINE" -> "Publisher"
        else -> "Unknown"
    }

    return MediaItemData(
        id = mediaItem.itemId.toInt(),
        title = title,
        author = author,
        year = metadata?.year ?: 2024,
        rating = metadata?.rating ?: (3.5f + (mediaItem.itemId % 11) * 0.15f), // Deterministic rating for demo
        genre = when (mediaItem.mediaType) {
            "BOOK" -> listOf("Sci-Fi", "Fiction", "Non-Fiction", "Biography")[(mediaItem.itemId % 4).toInt()]
            "MOVIE" -> listOf("Thriller", "Action", "Drama", "Comedy")[(mediaItem.itemId % 4).toInt()]
            "MUSIC" -> listOf("Electronic", "Pop", "Rock", "Jazz")[(mediaItem.itemId % 4).toInt()]
            "PODCAST" -> listOf("Technology", "Education", "Entertainment")[(mediaItem.itemId % 3).toInt()]
            "MAGAZINE" -> listOf("Technology", "Science", "Lifestyle")[(mediaItem.itemId % 3).toInt()]
            else -> "General"
        },
        type = when (mediaItem.mediaType) {
            "BOOK" -> MediaType.BOOK
            "MOVIE" -> MediaType.MOVIE
            "MUSIC" -> MediaType.MUSIC
            "PODCAST" -> MediaType.PODCAST
            "MAGAZINE" -> MediaType.MAGAZINE
            else -> MediaType.DOCUMENT
        },
        poster = null // No poster URLs for demo
    )
}
