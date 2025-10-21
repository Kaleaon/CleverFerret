package com.universalmedialibrary.ui.search

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.search.EnhancedSearchService
import com.universalmedialibrary.services.search.SearchQuery
import com.universalmedialibrary.services.search.SearchFilters
import com.universalmedialibrary.services.search.SearchResult
import com.universalmedialibrary.services.search.SearchFacets
import com.universalmedialibrary.services.search.SearchHistory
import com.universalmedialibrary.services.search.SortBy
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.FlowPreview
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@OptIn(FlowPreview::class)
@HiltViewModel
class EnhancedSearchViewModel @Inject constructor(
    private val searchService: EnhancedSearchService
) : ViewModel() {

    private val _uiState = MutableStateFlow(EnhancedSearchUiState())
    val uiState: StateFlow<EnhancedSearchUiState> = _uiState.asStateFlow()

    private val _searchQuery = MutableStateFlow("")
    val searchQuery: StateFlow<String> = _searchQuery.asStateFlow()

    private val _filters = MutableStateFlow(SearchFilters())
    val filters: StateFlow<SearchFilters> = _filters.asStateFlow()

    private val _sortBy = MutableStateFlow(SortBy.RELEVANCE)
    val sortBy: StateFlow<SortBy> = _sortBy.asStateFlow()

    init {
        // Load search history
        loadSearchHistory()
        
        // Setup search with debounce
        viewModelScope.launch {
            combine(
                _searchQuery.debounce(300).distinctUntilChanged(),
                _filters,
                _sortBy
            ) { query, filters, sort ->
                Triple(query, filters, sort)
            }.collect { (query, filters, sort) ->
                if (query.isNotBlank() || filters.hasActiveFilters()) {
                    performSearch(query, filters, sort)
                } else {
                    _uiState.value = _uiState.value.copy(
                        results = emptyList(),
                        facets = null,
                        hasSearched = false
                    )
                }
            }
        }

        // Load suggestions with shorter debounce
        viewModelScope.launch {
            _searchQuery
                .debounce(150)
                .distinctUntilChanged()
                .collect { query ->
                    if (query.length >= 2) {
                        loadSuggestions(query)
                    } else {
                        _uiState.value = _uiState.value.copy(suggestions = emptyList())
                    }
                }
        }
    }

    fun onSearchQueryChange(query: String) {
        _searchQuery.value = query
    }

    fun onFilterChange(filters: SearchFilters) {
        _filters.value = filters
    }

    fun onSortChange(sortBy: SortBy) {
        _sortBy.value = sortBy
    }

    fun clearFilters() {
        _filters.value = SearchFilters()
    }

    fun toggleMediaTypeFilter(mediaType: String) {
        val current = _filters.value.mediaTypes.toMutableList()
        if (current.contains(mediaType)) {
            current.remove(mediaType)
        } else {
            current.add(mediaType)
        }
        _filters.value = _filters.value.copy(
            mediaTypes = current
        )
    }

    fun toggleGenreFilter(genre: String) {
        val current = _filters.value.genres.toMutableList()
        if (current.contains(genre)) {
            current.remove(genre)
        } else {
            current.add(genre)
        }
        _filters.value = _filters.value.copy(
            genres = current
        )
    }

    fun setDateRangeFilter(startDate: Long?, endDate: Long?) {
        _filters.value = _filters.value.copy(
            dateFrom = startDate,
            dateTo = endDate
        )
    }

    fun setFileSizeRangeFilter(minSize: Long?, maxSize: Long?) {
        _filters.value = _filters.value.copy(
            minFileSize = minSize,
            maxFileSize = maxSize
        )
    }

    fun setRatingFilter(minRating: Float?) {
        _filters.value = _filters.value.copy(minRating = minRating)
    }

    fun selectSuggestion(suggestion: String) {
        _searchQuery.value = suggestion
    }

    fun selectHistoryItem(historyItem: SearchHistory) {
        _searchQuery.value = historyItem.query
        // Note: SearchHistory doesn't store filters and sortBy
        // Just use the query
    }

    fun deleteHistoryItem(historyItem: SearchHistory) {
        viewModelScope.launch {
            // TODO: Implement when search history DAO is available
            // searchService.deleteSearchHistory(historyItem.historyId)
            loadSearchHistory()
        }
    }

    fun clearSearchHistory() {
        viewModelScope.launch {
            searchService.clearHistory()
            _uiState.value = _uiState.value.copy(searchHistory = emptyList())
        }
    }

    fun clearSearch() {
        _searchQuery.value = ""
        _filters.value = SearchFilters()
        _sortBy.value = SortBy.RELEVANCE
        _uiState.value = EnhancedSearchUiState()
    }

    private fun performSearch(query: String, filters: SearchFilters, sortBy: SortBy) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isSearching = true, error = null)
                
                val searchQuery = SearchQuery(
                    textQuery = query,
                    filters = filters,
                    sortBy = sortBy
                )

                val results = searchService.search(searchQuery)
                val facets = searchService.getFacets()

                _uiState.value = _uiState.value.copy(
                    isSearching = false,
                    results = results,
                    facets = facets,
                    hasSearched = true,
                    error = null
                )

                // TODO: Save to search history when implemented
                // if (query.isNotBlank()) {
                //     searchService.saveSearchHistory(query, results.size)
                //     loadSearchHistory()
                // }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isSearching = false,
                    error = e.message ?: "Search failed"
                )
            }
        }
    }

    private fun loadSuggestions(query: String) {
        viewModelScope.launch {
            try {
                val suggestions = searchService.getSuggestions(query)
                _uiState.value = _uiState.value.copy(suggestions = suggestions)
            } catch (e: Exception) {
                // Silently fail for suggestions
            }
        }
    }

    private fun loadSearchHistory() {
        viewModelScope.launch {
            try {
                // TODO: Implement when search history DAO is available
                // val history = searchService.getSearchHistory()
                // _uiState.value = _uiState.value.copy(searchHistory = history)
            } catch (e: Exception) {
                // Continue without search history
            }
        }
    }
}

data class EnhancedSearchUiState(
    val isSearching: Boolean = false,
    val results: List<SearchResult> = emptyList(),
    val suggestions: List<String> = emptyList(),
    val searchHistory: List<SearchHistory> = emptyList(),
    val facets: SearchFacets? = null,
    val hasSearched: Boolean = false,
    val error: String? = null
)
