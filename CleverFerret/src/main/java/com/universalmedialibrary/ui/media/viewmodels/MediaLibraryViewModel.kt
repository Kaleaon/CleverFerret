package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.media.components.MediaItem
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Clean media-centric Library Screen
 * 
 * Handles:
 * - Loading items for a specific media type
 * - Filtering (unread, in-progress, favorites, etc.)
 * - Sorting (title, date added, rating, etc.)
 * - View mode persistence
 * - Search within library
 * 
 * Note: This is a simplified implementation. Full repository integration
 * will be added when the complete data layer is finalized.
 */
@HiltViewModel
class MediaLibraryViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle
) : ViewModel() {
    
    // Get media type from navigation argument
    private val mediaTypeArg: String = savedStateHandle.get<String>("mediaType") ?: "book"
    
    private val _mediaType = MutableStateFlow(MediaType.fromString(mediaTypeArg))
    val mediaType: StateFlow<MediaType> = _mediaType.asStateFlow()
    
    private val _uiState = MutableStateFlow(LibraryScreenState(
        libraryTitle = getLibraryTitle(MediaType.fromString(mediaTypeArg)),
        mediaType = MediaType.fromString(mediaTypeArg)
    ))
    val uiState: StateFlow<LibraryScreenState> = _uiState.asStateFlow()
    
    private val _currentFilter = MutableStateFlow(LibraryFilter.ALL)
    private val _currentSort = MutableStateFlow(LibrarySortOption.RECENTLY_ADDED)
    private val _viewMode = MutableStateFlow(LibraryViewMode.GRID)
    private val _searchQuery = MutableStateFlow("")
    
    init {
        loadLibraryItems()
        observeFilterChanges()
    }
    
    private fun observeFilterChanges() {
        viewModelScope.launch {
            combine(
                _currentFilter,
                _currentSort,
                _searchQuery
            ) { filter, sort, query ->
                Triple(filter, sort, query)
            }.collect { (filter, sort, query) ->
                loadLibraryItems(filter, sort, query)
            }
        }
    }
    
    fun setFilter(filter: LibraryFilter) {
        _currentFilter.value = filter
        _uiState.update { it.copy(currentFilter = filter) }
    }
    
    fun setSort(sort: LibrarySortOption) {
        _currentSort.value = sort
        _uiState.update { it.copy(sortOption = sort) }
    }
    
    fun setViewMode(mode: LibraryViewMode) {
        _viewMode.value = mode
        _uiState.update { it.copy(viewMode = mode) }
    }
    
    fun search(query: String) {
        _searchQuery.value = query
    }
    
    fun refresh() {
        loadLibraryItems(_currentFilter.value, _currentSort.value, _searchQuery.value)
    }
    
    private fun loadLibraryItems(
        filter: LibraryFilter = LibraryFilter.ALL,
        sort: LibrarySortOption = LibrarySortOption.RECENTLY_ADDED,
        query: String = ""
    ) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            // Simulate loading delay
            delay(300)
            
            val items = generateSampleItems(_mediaType.value, filter, query)
            
            _uiState.update { state ->
                state.copy(
                    items = items,
                    totalItems = items.size,
                    isLoading = false,
                    availableFilters = getFilterGroupsForMediaType(_mediaType.value)
                )
            }
        }
    }
    
    private fun generateSampleItems(
        mediaType: MediaType,
        filter: LibraryFilter,
        query: String
    ): List<MediaItem> {
        // Generate sample items based on media type
        return (1..20).map { index ->
            MediaItem(
                id = "${mediaType.name.lowercase()}_$index",
                title = "Sample ${getMediaTypeName(mediaType)} $index",
                subtitle = "Sample subtitle",
                imageUrl = null,
                mediaType = mediaType,
                progress = if (index % 3 == 0) 0.5f else 0f,
                rating = if (index % 2 == 0) (3.0f + (index % 3)) else null,
                year = 2020 + (index % 5),
                duration = getDurationString(mediaType, index),
                badges = emptyList()
            )
        }.filter { item ->
            query.isEmpty() || item.title.contains(query, ignoreCase = true)
        }
    }
    
    private fun getMediaTypeName(mediaType: MediaType): String = when (mediaType) {
        MediaType.BOOK -> "Book"
        MediaType.AUDIOBOOK -> "Audiobook"
        MediaType.MUSIC -> "Album"
        MediaType.PODCAST -> "Podcast"
        MediaType.COMIC -> "Comic"
        MediaType.MOVIE -> "Movie"
        MediaType.TV_SHOW -> "TV Show"
        MediaType.FANFICTION -> "Story"
        MediaType.DOCUMENT -> "Document"
        MediaType.RADIO -> "Station"
        MediaType.NEWS -> "Article"
        MediaType.UNKNOWN -> "Item"
    }
    
    private fun getDurationString(mediaType: MediaType, index: Int): String? = when (mediaType) {
        MediaType.BOOK, MediaType.COMIC -> "${100 + index * 20} pages"
        MediaType.AUDIOBOOK, MediaType.MOVIE -> "${1 + index % 3}h ${index * 5 % 60}m"
        MediaType.MUSIC -> "${8 + index % 5} tracks"
        MediaType.PODCAST -> "${10 + index % 20} episodes"
        MediaType.TV_SHOW -> "${2 + index % 5} seasons"
        MediaType.FANFICTION -> "${10 + index * 5} chapters"
        else -> null
    }
    
    private fun getLibraryTitle(mediaType: MediaType): String = when (mediaType) {
        MediaType.BOOK -> "Books"
        MediaType.AUDIOBOOK -> "Audiobooks"
        MediaType.MUSIC -> "Music"
        MediaType.PODCAST -> "Podcasts"
        MediaType.COMIC -> "Comics"
        MediaType.MOVIE -> "Movies"
        MediaType.TV_SHOW -> "TV Shows"
        MediaType.FANFICTION -> "Web Fiction"
        MediaType.DOCUMENT -> "Documents"
        MediaType.RADIO -> "Radio"
        MediaType.NEWS -> "News"
        MediaType.UNKNOWN -> "Library"
    }
    
    private fun getFilterGroupsForMediaType(mediaType: MediaType): List<LibraryFilterGroup> {
        return when (mediaType) {
            MediaType.BOOK, MediaType.COMIC, MediaType.FANFICTION -> listOf(
                LibraryFilterGroup("Status", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.UNREAD,
                    LibraryFilter.IN_PROGRESS,
                    LibraryFilter.COMPLETED
                )),
                LibraryFilterGroup("Collection", listOf(
                    LibraryFilter.FAVORITES,
                    LibraryFilter.DOWNLOADED
                ))
            )
            MediaType.AUDIOBOOK -> listOf(
                LibraryFilterGroup("Status", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.UNPLAYED,
                    LibraryFilter.IN_PROGRESS,
                    LibraryFilter.COMPLETED
                )),
                LibraryFilterGroup("Collection", listOf(
                    LibraryFilter.FAVORITES,
                    LibraryFilter.DOWNLOADED
                ))
            )
            MediaType.MUSIC -> listOf(
                LibraryFilterGroup("View", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.RECENTLY_PLAYED,
                    LibraryFilter.FAVORITES
                )),
                LibraryFilterGroup("Storage", listOf(
                    LibraryFilter.DOWNLOADED
                ))
            )
            MediaType.MOVIE, MediaType.TV_SHOW -> listOf(
                LibraryFilterGroup("Status", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.UNWATCHED,
                    LibraryFilter.IN_PROGRESS,
                    LibraryFilter.COMPLETED
                )),
                LibraryFilterGroup("Collection", listOf(
                    LibraryFilter.FAVORITES
                ))
            )
            MediaType.PODCAST -> listOf(
                LibraryFilterGroup("Status", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.UNPLAYED,
                    LibraryFilter.IN_PROGRESS
                )),
                LibraryFilterGroup("Storage", listOf(
                    LibraryFilter.DOWNLOADED
                ))
            )
            else -> listOf(
                LibraryFilterGroup("All", listOf(LibraryFilter.ALL))
            )
        }
    }
}

private fun MediaType.Companion.fromString(value: String): MediaType {
    return when (value.lowercase()) {
        "book" -> MediaType.BOOK
        "audiobook" -> MediaType.AUDIOBOOK
        "music" -> MediaType.MUSIC
        "podcast" -> MediaType.PODCAST
        "comic" -> MediaType.COMIC
        "movie" -> MediaType.MOVIE
        "tv_show", "tvshow" -> MediaType.TV_SHOW
        "fanfiction", "webfiction" -> MediaType.FANFICTION
        "document" -> MediaType.DOCUMENT
        "radio" -> MediaType.RADIO
        "news" -> MediaType.NEWS
        else -> MediaType.UNKNOWN
    }
}
