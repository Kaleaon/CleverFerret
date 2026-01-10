package com.universalmedialibrary.ui.search

import android.net.Uri
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.search.EnhancedSearchService
import com.universalmedialibrary.services.search.SearchQuery
import com.universalmedialibrary.services.search.SearchFilters
import com.universalmedialibrary.services.search.SearchResult
import com.universalmedialibrary.services.search.SearchFacets
import com.universalmedialibrary.data.local.entity.SearchHistory
import com.universalmedialibrary.services.search.SortBy
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.FlowPreview
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

private const val TAG_PARAM_DELIMITER = "|"

@OptIn(FlowPreview::class)
@HiltViewModel
class EnhancedSearchViewModel @Inject constructor(
    private val searchService: EnhancedSearchService,
    private val savedStateHandle: SavedStateHandle
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
        val initialQuery = savedStateHandle.get<String>("query")
            ?.let { Uri.decode(it) }
            ?.takeIf { it.isNotBlank() }

        val initialMediaTypes = decodeListParam(savedStateHandle.get<String>("mediaTypes"))
        val initialTags = decodeListParam(savedStateHandle.get<String>("tags"))

        if (initialQuery != null) {
            _searchQuery.value = initialQuery
        }

        if (initialMediaTypes.isNotEmpty() || initialTags.isNotEmpty()) {
            _filters.value = _filters.value.copy(
                mediaTypes = initialMediaTypes,
                tags = initialTags
            )
        }

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
                if (query != _searchQuery.value) {
                    // Skip stale emissions (e.g., when restoring history before debounce completes).
                    return@collect
                }
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

        searchService.restoreSort(historyItem)?.let { restoredSort ->
            _sortBy.value = restoredSort
        }

        val restoredFilters = searchService.restoreFilters(historyItem)
        _filters.value = restoredFilters ?: SearchFilters()
    }

    fun deleteHistoryItem(historyItem: SearchHistory) {
        viewModelScope.launch {
            if (historyItem.historyId != 0L) {
                searchService.deleteHistoryEntry(historyItem.historyId)
            }
            loadSearchHistory()
        }
    }

    fun clearSearchHistory() {
        viewModelScope.launch {
            searchService.clearHistory()
            _uiState.value = _uiState.value.copy(searchHistory = emptyList())
            loadSearchHistory()
        }
    }

    fun clearSearch() {
        _searchQuery.value = ""
        _filters.value = SearchFilters()
        _sortBy.value = SortBy.RELEVANCE
        _uiState.value = EnhancedSearchUiState()
        loadSearchHistory()
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
                loadSearchHistory()
            } catch (e: kotlinx.coroutines.CancellationException) {
                // Search was cancelled (e.g., user typed new query), don't update state
                throw e
            } catch (e: Exception) {
                // Filter out internal coroutine messages that shouldn't be shown to users
                val errorMessage = when {
                    e.message?.contains("coroutine", ignoreCase = true) == true -> "Search cancelled. Please try again."
                    e.message?.contains("StandaloneCoroutine", ignoreCase = true) == true -> "Search cancelled. Please try again."
                    e.message?.contains("timeout", ignoreCase = true) == true -> "Search timed out. Please try again."
                    e.message?.contains("network", ignoreCase = true) == true -> "Network error. Please check your connection."
                    else -> e.message ?: "Search failed. Please try again."
                }
                _uiState.value = _uiState.value.copy(
                    isSearching = false,
                    error = errorMessage
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
                val history = searchService.getSearchHistory()
                _uiState.value = _uiState.value.copy(searchHistory = history)
            } catch (e: Exception) {
                // Continue without search history
            }
        }
    }

    private fun decodeListParam(raw: String?): List<String> {
        if (raw.isNullOrBlank()) return emptyList()
        val decoded = Uri.decode(raw)
        return decoded
            .split(TAG_PARAM_DELIMITER)
            .map { it.trim() }
            .filter { it.isNotEmpty() }
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
