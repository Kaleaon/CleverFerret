package com.universalmedialibrary.ui.media.viewmodels

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
    private val searchService: EnhancedSearchService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(SearchScreenState())
    val uiState: StateFlow<SearchScreenState> = _uiState.asStateFlow()
    
    private var searchJob: Job? = null
    
    init {
        loadRecentSearches()
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
        _uiState.update { it.copy(query = query) }
        
        // Debounce search
        searchJob?.cancel()
        if (query.length >= 2) {
            searchJob = viewModelScope.launch {
                delay(300) // Debounce
                performSearch(query)
            }
        } else {
            _uiState.update { it.copy(results = emptyList(), groupedResults = emptyMap()) }
        }
    }
    
    fun search(query: String) {
        if (query.isBlank()) return
        performSearch(query)
    }
    
    fun clearSearch() {
        _uiState.update { it.copy(query = "", results = emptyList(), groupedResults = emptyMap()) }
    }
    
    fun setCategory(category: SearchCategory?) {
        _uiState.update { it.copy(selectedCategory = category) }
        
        // Re-filter results if we have any
        if (_uiState.value.query.isNotBlank()) {
            filterResults(category)
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
        _uiState.update { it.copy(query = query) }
        search(query)
    }
    
    private fun performSearch(query: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isSearching = true) }
            
            try {
                // Build search query with optional category filter
                val selectedCategory = _uiState.value.selectedCategory
                val mediaTypes = when (selectedCategory) {
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
                        results = uiResults,
                        groupedResults = groupedResults,
                        isSearching = false
                    )
                }
                
                // Refresh recent searches
                loadRecentSearches()
            } catch (e: kotlinx.coroutines.CancellationException) {
                throw e // Re-throw cancellation
            } catch (e: Exception) {
                _uiState.update {
                    it.copy(
                        results = emptyList(),
                        groupedResults = emptyMap(),
                        isSearching = false
                    )
                }
            }
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
    
    private fun filterResults(category: SearchCategory?) {
        val allResults = _uiState.value.groupedResults.values.flatten()
        val filtered = if (category != null) {
            allResults.filter { it.category == category }
        } else {
            allResults
        }
        _uiState.update { it.copy(results = filtered) }
    }
}
