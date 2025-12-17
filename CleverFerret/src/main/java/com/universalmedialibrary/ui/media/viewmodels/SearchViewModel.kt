package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
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
 * - OPDS catalogs
 * - External metadata providers
 * - Podcast directories
 * - Web fiction sources
 * 
 * Note: This is a simplified implementation with placeholder data.
 * Full repository and service integration will be added when the
 * search services are finalized.
 */
@HiltViewModel
class SearchViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(SearchScreenState())
    val uiState: StateFlow<SearchScreenState> = _uiState.asStateFlow()
    
    private var searchJob: Job? = null
    
    private val _searchHistory = mutableListOf("Recent search 1", "Recent search 2", "Recent search 3")
    
    init {
        loadRecentSearches()
    }
    
    private fun loadRecentSearches() {
        _uiState.update { it.copy(recentSearches = _searchHistory) }
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
        
        // Save to history
        if (!_searchHistory.contains(query)) {
            _searchHistory.add(0, query)
            if (_searchHistory.size > 10) {
                _searchHistory.removeAt(_searchHistory.lastIndex)
            }
            loadRecentSearches()
        }
        
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
        _searchHistory.clear()
        _uiState.update { it.copy(recentSearches = emptyList()) }
    }
    
    fun useRecentSearch(query: String) {
        _uiState.update { it.copy(query = query) }
        search(query)
    }
    
    private fun performSearch(query: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isSearching = true) }
            
            // Simulate search delay
            delay(500)
            
            val allResults = generateSampleResults(query)
            
            // Group results by category
            val groupedResults = allResults.groupBy { it.category }
            
            // Filter if category selected
            val selectedCategory = _uiState.value.selectedCategory
            val filteredResults = if (selectedCategory != null) {
                allResults.filter { it.category == selectedCategory }
            } else {
                allResults
            }
            
            _uiState.update {
                it.copy(
                    results = filteredResults,
                    groupedResults = groupedResults,
                    isSearching = false
                )
            }
        }
    }
    
    private fun generateSampleResults(query: String): List<SearchResult> {
        val results = mutableListOf<SearchResult>()
        
        // Books
        results.add(SearchResult(
            id = "book_1",
            title = "$query: A Novel",
            subtitle = "Sample Author",
            imageUrl = null,
            category = SearchCategory.BOOKS,
            source = "Local",
            mediaType = MediaType.BOOK
        ))
        
        // Audiobooks
        results.add(SearchResult(
            id = "audiobook_1",
            title = "$query Audiobook",
            subtitle = "Narrated by Sample Narrator",
            imageUrl = null,
            category = SearchCategory.AUDIOBOOKS,
            source = "Local",
            mediaType = MediaType.AUDIOBOOK
        ))
        
        // Music
        results.add(SearchResult(
            id = "album_1",
            title = "$query Album",
            subtitle = "Sample Artist",
            imageUrl = null,
            category = SearchCategory.MUSIC,
            source = "Local",
            mediaType = MediaType.MUSIC
        ))
        
        // Podcasts
        results.add(SearchResult(
            id = "podcast_1",
            title = "The $query Podcast",
            subtitle = "Sample Host",
            imageUrl = null,
            category = SearchCategory.PODCASTS,
            source = "Local",
            mediaType = MediaType.PODCAST
        ))
        
        // Movies
        results.add(SearchResult(
            id = "movie_1",
            title = "$query: The Movie",
            subtitle = "2024",
            imageUrl = null,
            category = SearchCategory.MOVIES,
            source = "Local",
            mediaType = MediaType.MOVIE
        ))
        
        // TV Shows
        results.add(SearchResult(
            id = "tvshow_1",
            title = "The $query Show",
            subtitle = "3 seasons",
            imageUrl = null,
            category = SearchCategory.TV_SHOWS,
            source = "Local",
            mediaType = MediaType.TV_SHOW
        ))
        
        // Comics
        results.add(SearchResult(
            id = "comic_1",
            title = "$query Comics",
            subtitle = "Issue #1",
            imageUrl = null,
            category = SearchCategory.COMICS,
            source = "Local",
            mediaType = MediaType.COMIC
        ))
        
        // Web Fiction
        results.add(SearchResult(
            id = "webfic_1",
            title = "$query Fantasy Story",
            subtitle = "Sample Author • 100 chapters",
            imageUrl = null,
            category = SearchCategory.WEB_FICTION,
            source = "Local",
            mediaType = MediaType.FANFICTION
        ))
        
        return results
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
