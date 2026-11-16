package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.search.EnhancedSearchService
import com.universalmedialibrary.services.search.SearchQuery
import com.universalmedialibrary.services.search.SearchFilters
import com.universalmedialibrary.services.search.SortBy
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.screens.SearchCategory
import com.universalmedialibrary.ui.media.screens.SearchResult
import com.universalmedialibrary.ui.media.screens.SearchScreenState
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Clean media-centric Universal Search
 * 
 * Searches across:
 * - Local library (all media types)
 * - Uses real EnhancedSearchService for database queries
 */
@HiltViewModel
class SearchViewModel @Inject constructor(
    private val searchService: EnhancedSearchService,
    private val savedStateHandle: SavedStateHandle = SavedStateHandle()
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(SearchScreenState())
    val uiState: StateFlow<SearchScreenState> = _uiState.asStateFlow()

    private val _userMessages = MutableSharedFlow<String>(extraBufferCapacity = 1)
    val userMessages: SharedFlow<String> = _userMessages.asSharedFlow()
    
    private var searchJob: Job? = null
    
    init {
        val restoredQuery: String = savedStateHandle.get<String>(KEY_QUERY) ?: ""
        val restoredCategory: SearchCategory? = parseSearchCategory(savedStateHandle.get<Any>(KEY_CATEGORY))
        val restoredMediaType: MediaType? = parseMediaType(
            savedStateHandle.get<Any>(KEY_MEDIA_TYPE) ?: savedStateHandle.get<Any>("mediaType")
        )

        if (restoredQuery.isNotEmpty() || restoredCategory != null || restoredMediaType != null) {
            _uiState.update {
                it.copy(
                    query = restoredQuery,
                    selectedCategory = restoredCategory,
                    selectedMediaType = restoredMediaType
                )
            }
        }

        loadRecentSearches()

        if (restoredQuery.isNotBlank()) {
            search(restoredQuery)
        }
    }
    
    private fun loadRecentSearches() {
        viewModelScope.launch {
            try {
                val history = searchService.getSearchHistory()
                _uiState.update { it.copy(recentSearches = history.map { h -> h.query }) }
            } catch (e: Exception) {
                // Continue without history
            }
        }
    }
    
    fun updateQuery(query: String) {
        savedStateHandle[KEY_QUERY] = query
        _uiState.update { it.copy(query = query) }
        
        // Debounce search
        searchJob?.cancel()
        if (query.length >= 2) {
            searchJob = viewModelScope.launch {
                delay(300) // Debounce
                performSearch(query)
            }
        } else {
            _uiState.update { it.copy(results = emptyList(), groupedResults = emptyMap(), allResults = emptyList()) }
        }
    }
    
    fun search(query: String) {
        if (query.isBlank()) return
        savedStateHandle[KEY_QUERY] = query
        _uiState.update { it.copy(query = query) }
        searchJob?.cancel()
        searchJob = viewModelScope.launch {
            performSearch(query)
        }
    }
    
    fun clearSearch() {
        searchJob?.cancel()
        savedStateHandle.remove<String>(KEY_QUERY)
        _uiState.update { it.copy(query = "", results = emptyList(), groupedResults = emptyMap(), allResults = emptyList()) }
    }
    
    fun setCategory(category: SearchCategory?) {
        if (category != null) {
            savedStateHandle[KEY_CATEGORY] = category.name
        } else {
            savedStateHandle.remove<String>(KEY_CATEGORY)
        }
        _uiState.update { it.copy(selectedCategory = category) }
        
        // Re-filter results if we have any
        if (_uiState.value.query.isNotBlank()) {
            applyClientSideFilters(category = category)
        }
    }

    fun setMediaType(mediaType: MediaType?) {
        if (mediaType != null) {
            savedStateHandle[KEY_MEDIA_TYPE] = mediaType.name
        } else {
            savedStateHandle.remove<String>(KEY_MEDIA_TYPE)
        }
        _uiState.update { it.copy(selectedMediaType = mediaType) }

        if (_uiState.value.query.isNotBlank()) {
            applyClientSideFilters(mediaType = mediaType)
        }
    }
    
    fun clearRecentSearches() {
        viewModelScope.launch {
            try {
                searchService.clearHistory()
                _uiState.update { it.copy(recentSearches = emptyList()) }
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
    
    fun useRecentSearch(query: String) {
        savedStateHandle[KEY_QUERY] = query
        _uiState.update { it.copy(query = query) }
        search(query)
    }
    
    private suspend fun performSearch(query: String) {
        _uiState.update { it.copy(isSearching = true) }
        
        try {
            val selectedCategory = _uiState.value.selectedCategory
            val selectedMediaType = _uiState.value.selectedMediaType
            val mediaTypes = when {
                selectedMediaType != null -> selectedMediaType.toServiceMediaTypes()
                else -> when (selectedCategory) {
                    SearchCategory.BOOKS -> listOf("BOOK")
                    SearchCategory.AUDIOBOOKS -> listOf("AUDIOBOOK")
                    SearchCategory.MUSIC -> listOf("MUSIC_TRACK", "MUSIC_ALBUM")
                    SearchCategory.PODCASTS -> listOf("PODCAST")
                    SearchCategory.MOVIES -> listOf("MOVIE")
                    SearchCategory.TV_SHOWS -> listOf("TV_SHOW", "TV_EPISODE")
                    SearchCategory.COMICS -> listOf("COMIC")
                    SearchCategory.WEB_FICTION -> listOf("FANFICTION", "WEB_FICTION")
                    SearchCategory.DOCUMENTS -> listOf("DOCUMENT", "PDF")
                    null -> emptyList() // Search all types
                }
            }

            val searchQuery = SearchQuery(
                textQuery = query,
                filters = SearchFilters(mediaTypes = mediaTypes),
                sortBy = SortBy.RELEVANCE
            )
            
            val serviceResults = searchService.search(searchQuery)
            
            // Convert service results to UI results
            val uiResults = serviceResults.map { result ->
                SearchResult(
                    id = result.itemId.toString(),
                    title = result.title,
                    subtitle = result.subtitle ?: "",
                    imageUrl = result.thumbnailUrl,
                    category = mapMediaTypeToCategory(result.mediaType),
                    source = "Local",
                    mediaType = mapStringToMediaType(result.mediaType)
                )
            }
            
            // Group results by category
            val groupedResults = uiResults.groupBy { it.category }
            
            _uiState.update {
                it.copy(
                    allResults = uiResults,
                    groupedResults = groupedResults,
                    isSearching = false
                )
            }

            applyClientSideFilters()
            
            // Refresh recent searches
            loadRecentSearches()
        } catch (e: CancellationException) {
            _uiState.update { it.copy(isSearching = false) }
            throw e
        } catch (e: Exception) {
            _uiState.update {
                it.copy(
                    results = emptyList(),
                    groupedResults = emptyMap(),
                    allResults = emptyList(),
                    isSearching = false
                )
            }
            _userMessages.tryEmit("Search failed. Please try again.")
        }
    }
    
    private fun mapMediaTypeToCategory(mediaType: String): SearchCategory {
        return when (mediaType.uppercase()) {
            "BOOK", "EBOOK" -> SearchCategory.BOOKS
            "AUDIOBOOK" -> SearchCategory.AUDIOBOOKS
            "MUSIC_TRACK", "MUSIC_ALBUM", "MUSIC" -> SearchCategory.MUSIC
            "PODCAST", "PODCAST_EPISODE" -> SearchCategory.PODCASTS
            "MOVIE", "VIDEO" -> SearchCategory.MOVIES
            "TV_SHOW", "TV_EPISODE" -> SearchCategory.TV_SHOWS
            "COMIC", "MANGA" -> SearchCategory.COMICS
            "FANFICTION", "WEB_FICTION" -> SearchCategory.WEB_FICTION
            else -> SearchCategory.BOOKS // Default
        }
    }
    
    private fun mapStringToMediaType(type: String): MediaType {
        return when (type.uppercase()) {
            "BOOK", "EBOOK" -> MediaType.BOOK
            "AUDIOBOOK" -> MediaType.AUDIOBOOK
            "MUSIC_TRACK", "MUSIC_ALBUM", "MUSIC" -> MediaType.MUSIC
            "PODCAST", "PODCAST_EPISODE" -> MediaType.PODCAST
            "MOVIE", "VIDEO" -> MediaType.MOVIE
            "TV_SHOW", "TV_EPISODE" -> MediaType.TV_SHOW
            "COMIC", "MANGA" -> MediaType.COMIC
            "FANFICTION", "WEB_FICTION" -> MediaType.FANFICTION
            else -> MediaType.BOOK
        }
    }
    
    private fun applyClientSideFilters(
        category: SearchCategory? = _uiState.value.selectedCategory,
        mediaType: MediaType? = _uiState.value.selectedMediaType
    ) {
        val base = _uiState.value.allResults
        val categoryFiltered = if (category != null) {
            base.filter { it.category == category }
        } else {
            base
        }
        val filtered = if (mediaType != null) {
            categoryFiltered.filter { it.mediaType == mediaType }
        } else {
            categoryFiltered
        }
        _uiState.update { it.copy(results = filtered) }
    }

    companion object {
        const val KEY_QUERY = "query"
        const val KEY_CATEGORY = "category"
        const val KEY_MEDIA_TYPE = "media_type"

        private fun parseSearchCategory(raw: Any?): SearchCategory? = when (raw) {
            is SearchCategory -> raw
            is String -> SearchCategory.entries.firstOrNull { it.name.equals(raw.trim(), ignoreCase = true) }
            else -> null
        }

        private fun parseMediaType(raw: Any?): MediaType? = when (raw) {
            is MediaType -> raw
            is String -> MediaType.entries.firstOrNull { it.name.equals(raw.trim(), ignoreCase = true) }
            else -> null
        }
    }
}

private fun MediaType.toServiceMediaTypes(): List<String> {
    return when (this) {
        MediaType.BOOK -> listOf("BOOK", "EBOOK")
        MediaType.AUDIOBOOK -> listOf("AUDIOBOOK")
        MediaType.COMIC -> listOf("COMIC", "MANGA")
        MediaType.MUSIC -> listOf("MUSIC", "MUSIC_TRACK", "MUSIC_ALBUM")
        MediaType.PODCAST -> listOf("PODCAST", "PODCAST_EPISODE")
        MediaType.MOVIE -> listOf("MOVIE", "VIDEO")
        MediaType.TV_SHOW -> listOf("TV_SHOW", "TV_EPISODE")
        MediaType.FANFICTION -> listOf("FANFICTION", "WEB_FICTION")
        MediaType.DOCUMENT -> listOf("DOCUMENT", "PDF")
        MediaType.RADIO -> listOf("RADIO")
        MediaType.NEWS -> listOf("NEWS")
        MediaType.UNKNOWN -> emptyList()
    }
}
