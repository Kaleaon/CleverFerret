package com.universalmedialibrary.ui.library

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.repository.MediaRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class UniversalMediaLibraryViewModel @Inject constructor(
    private val mediaRepository: MediaRepository
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

    private var currentLibraryId: Long = -1
    private var allMediaItems: List<MediaItemWithMetadata> = emptyList()

    fun loadMediaItems(libraryId: Long) {
        currentLibraryId = libraryId
        viewModelScope.launch {
            _isLoading.value = true
            try {
                // Load media items from repository
                mediaRepository.getMediaItemsByLibrary(libraryId).collect { mediaItems ->
                    // Convert MediaItems to MediaItemWithMetadata
                    allMediaItems = mediaItems.map { mediaItem ->
                        // Get metadata for each item
                        val metadata = mediaRepository.getCommonMetadata(mediaItem.itemId)
                        
                        MediaItemWithMetadata(
                            itemId = mediaItem.itemId,
                            title = metadata?.title ?: mediaItem.fileName.substringBeforeLast('.'),
                            mediaType = parseMediaType(mediaItem.mediaType),
                            author = metadata?.creator ?: extractAuthorFromFileName(mediaItem.fileName),
                            dateAdded = mediaItem.dateAdded,
                            isFavorite = false, // TODO: Add favorite tracking
                            progress = 0f // TODO: Add progress tracking from reading progress repository
                        )
                    }
                    
                    // Apply filters and sorting
                    applyFiltersAndSort()
                }
            } catch (e: Exception) {
                // Log error and show empty list
                _mediaItems.value = emptyList()
            } finally {
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
            SortOption.RECENTLY_PLAYED -> filtered.sortedByDescending { it.dateAdded } // TODO: Sort by last played when available
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
