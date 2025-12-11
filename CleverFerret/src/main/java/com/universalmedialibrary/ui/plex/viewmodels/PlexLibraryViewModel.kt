package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.plex.components.PlexMediaItem
import com.universalmedialibrary.ui.plex.components.PlexMediaType
import com.universalmedialibrary.ui.plex.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Plex-style Library Screen
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
class PlexLibraryViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle
) : ViewModel() {
    
    // Get media type from navigation argument
    private val mediaTypeArg: String = savedStateHandle.get<String>("mediaType") ?: "book"
    
    private val _mediaType = MutableStateFlow(PlexMediaType.fromString(mediaTypeArg))
    val mediaType: StateFlow<PlexMediaType> = _mediaType.asStateFlow()
    
    private val _uiState = MutableStateFlow(LibraryScreenState(
        libraryTitle = getLibraryTitle(PlexMediaType.fromString(mediaTypeArg)),
        mediaType = PlexMediaType.fromString(mediaTypeArg)
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
        mediaType: PlexMediaType,
        filter: LibraryFilter,
        query: String
    ): List<PlexMediaItem> {
        // Generate sample items based on media type
        return (1..20).map { index ->
            PlexMediaItem(
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
    
    private fun getMediaTypeName(mediaType: PlexMediaType): String = when (mediaType) {
        PlexMediaType.BOOK -> "Book"
        PlexMediaType.AUDIOBOOK -> "Audiobook"
        PlexMediaType.MUSIC -> "Album"
        PlexMediaType.PODCAST -> "Podcast"
        PlexMediaType.COMIC -> "Comic"
        PlexMediaType.MOVIE -> "Movie"
        PlexMediaType.TV_SHOW -> "TV Show"
        PlexMediaType.FANFICTION -> "Story"
        PlexMediaType.DOCUMENT -> "Document"
        PlexMediaType.RADIO -> "Station"
        PlexMediaType.NEWS -> "Article"
        PlexMediaType.UNKNOWN -> "Item"
    }
    
    private fun getDurationString(mediaType: PlexMediaType, index: Int): String? = when (mediaType) {
        PlexMediaType.BOOK, PlexMediaType.COMIC -> "${100 + index * 20} pages"
        PlexMediaType.AUDIOBOOK, PlexMediaType.MOVIE -> "${1 + index % 3}h ${index * 5 % 60}m"
        PlexMediaType.MUSIC -> "${8 + index % 5} tracks"
        PlexMediaType.PODCAST -> "${10 + index % 20} episodes"
        PlexMediaType.TV_SHOW -> "${2 + index % 5} seasons"
        PlexMediaType.FANFICTION -> "${10 + index * 5} chapters"
        else -> null
    }
    
    private fun getLibraryTitle(mediaType: PlexMediaType): String = when (mediaType) {
        PlexMediaType.BOOK -> "Books"
        PlexMediaType.AUDIOBOOK -> "Audiobooks"
        PlexMediaType.MUSIC -> "Music"
        PlexMediaType.PODCAST -> "Podcasts"
        PlexMediaType.COMIC -> "Comics"
        PlexMediaType.MOVIE -> "Movies"
        PlexMediaType.TV_SHOW -> "TV Shows"
        PlexMediaType.FANFICTION -> "Web Fiction"
        PlexMediaType.DOCUMENT -> "Documents"
        PlexMediaType.RADIO -> "Radio"
        PlexMediaType.NEWS -> "News"
        PlexMediaType.UNKNOWN -> "Library"
    }
    
    private fun getFilterGroupsForMediaType(mediaType: PlexMediaType): List<LibraryFilterGroup> {
        return when (mediaType) {
            PlexMediaType.BOOK, PlexMediaType.COMIC, PlexMediaType.FANFICTION -> listOf(
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
            PlexMediaType.AUDIOBOOK -> listOf(
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
            PlexMediaType.MUSIC -> listOf(
                LibraryFilterGroup("View", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.RECENTLY_PLAYED,
                    LibraryFilter.FAVORITES
                )),
                LibraryFilterGroup("Storage", listOf(
                    LibraryFilter.DOWNLOADED
                ))
            )
            PlexMediaType.MOVIE, PlexMediaType.TV_SHOW -> listOf(
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
            PlexMediaType.PODCAST -> listOf(
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

private fun PlexMediaType.Companion.fromString(value: String): PlexMediaType {
    return when (value.lowercase()) {
        "book" -> PlexMediaType.BOOK
        "audiobook" -> PlexMediaType.AUDIOBOOK
        "music" -> PlexMediaType.MUSIC
        "podcast" -> PlexMediaType.PODCAST
        "comic" -> PlexMediaType.COMIC
        "movie" -> PlexMediaType.MOVIE
        "tv_show", "tvshow" -> PlexMediaType.TV_SHOW
        "fanfiction", "webfiction" -> PlexMediaType.FANFICTION
        "document" -> PlexMediaType.DOCUMENT
        "radio" -> PlexMediaType.RADIO
        "news" -> PlexMediaType.NEWS
        else -> PlexMediaType.UNKNOWN
    }
}
