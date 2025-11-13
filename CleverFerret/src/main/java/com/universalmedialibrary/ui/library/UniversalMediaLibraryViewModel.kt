package com.universalmedialibrary.ui.library

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.repository.HistoryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import javax.inject.Inject

@HiltViewModel
class UniversalMediaLibraryViewModel @Inject constructor(
    private val mediaRepository: MediaRepository,
    private val historyRepository: HistoryRepository
) : ViewModel() {

    private val _mediaItems = MutableStateFlow<List<MediaItemWithMetadata>>(emptyList())
    val mediaItems: StateFlow<List<MediaItemWithMetadata>> = _mediaItems.asStateFlow()

    private val _viewMode = MutableStateFlow(ViewMode.GRID)
    val viewMode: StateFlow<ViewMode> = _viewMode.asStateFlow()

    private val _sortOption = MutableStateFlow(SortOption.TITLE)
    val sortOption: StateFlow<SortOption> = _sortOption.asStateFlow()

    private val _searchQuery = MutableStateFlow("")
    val searchQuery: StateFlow<String> = _searchQuery.asStateFlow()

    private val _selectedMediaType = MutableStateFlow(MediaType.BOOK)
    val selectedMediaType: StateFlow<MediaType> = _selectedMediaType.asStateFlow()

    private val _showFilters = MutableStateFlow(false)
    val showFilters: StateFlow<Boolean> = _showFilters.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    // Stub for library item counts - TODO: implement actual counting
    private val _libraryItemCounts = MutableStateFlow<Map<Long, Int>>(emptyMap())
    val libraryItemCounts: StateFlow<Map<Long, Int>> = _libraryItemCounts.asStateFlow()

    private val _errorMessage = MutableStateFlow<String?>(null)
    val errorMessage: StateFlow<String?> = _errorMessage.asStateFlow()

    private var currentLibraryId: Long = -1
    private var allMediaItems: List<MediaItemWithMetadata> = emptyList()

    fun loadMediaItems(libraryId: Long) {
        currentLibraryId = libraryId
        viewModelScope.launch {
            _isLoading.value = true
            try {
                // Load media items from repository
                mediaRepository.getMediaItemsByLibrary(libraryId).collect { mediaItems ->
                    withContext(Dispatchers.IO) {
                        // PERFORMANCE OPTIMIZATION: Use batch queries to avoid N+1 problem
                        if (mediaItems.isEmpty()) {
                            allMediaItems = emptyList()
                        } else {
                            val itemIds = mediaItems.map { it.itemId }
                            
                            // Batch fetch all metadata and progress at once
                            val metadataMap = mediaRepository.getCommonMetadataBatch(itemIds)
                            val progressMap = historyRepository.getReadingProgressBatch(itemIds)
                            
                            // Convert MediaItems to MediaItemWithMetadata using pre-fetched data
                            allMediaItems = mediaItems.map { mediaItem ->
                                val metadata = metadataMap[mediaItem.itemId]
                                val progressData = progressMap[mediaItem.itemId]
                                
                                MediaItemWithMetadata(
                                    itemId = mediaItem.itemId,
                                    title = metadata?.title ?: mediaItem.fileName.substringBeforeLast('.'),
                                    mediaType = parseMediaType(mediaItem.mediaType),
                                    author = extractAuthorFromFileName(mediaItem.fileName), // Author from metadata not yet implemented - requires BookMetadata table
                                    dateAdded = mediaItem.dateAdded,
                                    isFavorite = mediaItem.isFavorite || metadata?.isFavorite == true,
                                    progress = progressData?.percentage ?: 0f
                                )
                            }
                        }
                        
                        // Update library item counts by media type
                        val countsByMediaType = mediaItems.groupingBy { it.mediaType }.eachCount()
                        _libraryItemCounts.value = countsByMediaType
                    }
                    
                    // Apply filters and sorting
                    applyFiltersAndSort()
                    
                    // Turn off loading after first emission
                    _isLoading.value = false
                }
            } catch (e: Exception) {
                _mediaItems.value = emptyList()
                _isLoading.value = false
            }
        }
    }

    fun setViewMode(mode: ViewMode) {
        _viewMode.value = mode
    }

    fun setSortOption(option: SortOption) {
        _sortOption.value = option
        applyFiltersAndSort()
    }

    fun setSearchQuery(query: String) {
        _searchQuery.value = query
        applyFiltersAndSort()
    }

    fun setSelectedMediaType(mediaType: MediaType) {
        _selectedMediaType.value = mediaType
        if (currentLibraryId != -1L) {
            loadMediaItems(currentLibraryId)
        }
    }

    fun toggleFilters() {
        _showFilters.value = !_showFilters.value
    }

    fun clearError() {
        _errorMessage.value = null
    }

    fun toggleFavorite(itemId: Long, currentState: Boolean) {
        viewModelScope.launch {
            try {
                mediaRepository.setFavorite(itemId, !currentState)
                allMediaItems = allMediaItems.map { item ->
                    if (item.itemId == itemId) {
                        item.copy(isFavorite = !currentState)
                    } else {
                        item
                    }
                }
                applyFiltersAndSort()
            } catch (e: Exception) {
                _errorMessage.value = "Failed to update favorite status: ${e.message}"
            }
        }
    }

    /**
     * Apply current search query and sort option to the media items
     */
    private fun applyFiltersAndSort() {
        var filtered = allMediaItems

        // Apply search filter
        val query = _searchQuery.value
        if (query.isNotBlank()) {
            filtered = filtered.filter { item ->
                item.title.contains(query, ignoreCase = true) ||
                item.author?.contains(query, ignoreCase = true) == true
            }
        }

        // Apply media type filter
        val selectedType = _selectedMediaType.value
        filtered = filtered.filter { it.mediaType == selectedType }

        // Apply sorting
        filtered = when (_sortOption.value) {
            SortOption.TITLE -> filtered.sortedBy { it.title.lowercase() }
            SortOption.AUTHOR -> filtered.sortedBy { it.author?.lowercase() ?: "" }
            SortOption.DATE_ADDED -> filtered.sortedByDescending { it.dateAdded }
            SortOption.DATE_MODIFIED -> filtered.sortedByDescending { it.dateAdded } // Use dateAdded as fallback for lastModified
            SortOption.RATING -> filtered.sortedByDescending { it.progress } // Use progress as fallback for rating
            SortOption.RECENTLY_VIEWED -> filtered.sortedByDescending { it.dateAdded } // Use dateAdded as fallback for lastViewed
        }

        _mediaItems.value = filtered
    }

    /**
     * Parse string media type to MediaType enum
     */
    private fun parseMediaType(mediaType: String): MediaType {
        return try {
            MediaType.valueOf(mediaType)
        } catch (e: IllegalArgumentException) {
            // Fallback mapping for common types
            when (mediaType.uppercase()) {
                "EBOOK" -> MediaType.BOOK
                "MUSIC_TRACK" -> MediaType.MUSIC_TRACK
                "MUSIC_ALBUM" -> MediaType.MUSIC_ALBUM
                "VIDEO" -> MediaType.MOVIE
                "AUDIOBOOK" -> MediaType.BOOK
                else -> MediaType.DOCUMENT
            }
        }
    }

    /**
     * Extract author from filename (basic heuristic)
     */
    private fun extractAuthorFromFileName(fileName: String): String? {
        // Try to extract author from common filename patterns like "Author - Title.ext"
        val parts = fileName.substringBeforeLast('.').split(" - ", limit = 2)
        return if (parts.size > 1) parts[0] else null
    }

}
