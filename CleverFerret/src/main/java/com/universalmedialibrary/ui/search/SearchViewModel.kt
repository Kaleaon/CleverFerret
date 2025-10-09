package com.universalmedialibrary.ui.search

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.MediaItemWithMetadata
import com.universalmedialibrary.data.repository.FilterOptions
import com.universalmedialibrary.data.repository.SearchFilters
import com.universalmedialibrary.data.repository.SearchRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.FlowPreview
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@OptIn(FlowPreview::class)
@HiltViewModel
class SearchViewModel @Inject constructor(
    private val searchRepository: SearchRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(SearchUiState())
    val uiState: StateFlow<SearchUiState> = _uiState.asStateFlow()

    private val _searchQuery = MutableStateFlow("")
    val searchQuery: StateFlow<String> = _searchQuery.asStateFlow()

    private val _filters = MutableStateFlow(SearchFilters())
    val filters: StateFlow<SearchFilters> = _filters.asStateFlow()

    init {
        // Load filter options
        loadFilterOptions()
        
        // Setup search with debounce
        viewModelScope.launch {
            _searchQuery
                .debounce(300) // Wait 300ms after user stops typing
                .distinctUntilChanged()
                .collect { query ->
                    performSearch(query)
                }
        }
    }

    fun onSearchQueryChange(query: String) {
        _searchQuery.value = query
        if (query.length >= 2) {
            loadSuggestions(query)
        } else {
            _uiState.value = _uiState.value.copy(suggestions = emptyList())
        }
    }

    fun onFilterChange(filters: SearchFilters) {
        _filters.value = filters
        performSearch(_searchQuery.value)
    }

    fun clearFilters() {
        _filters.value = SearchFilters()
        performSearch(_searchQuery.value)
    }

    fun toggleMediaType(mediaType: String) {
        val currentTypes = _filters.value.mediaTypes.toMutableList()
        if (currentTypes.contains(mediaType)) {
            currentTypes.remove(mediaType)
        } else {
            currentTypes.add(mediaType)
        }
        _filters.value = _filters.value.copy(mediaTypes = currentTypes)
        performSearch(_searchQuery.value)
    }

    fun setRatingFilter(min: Float?, max: Float?) {
        _filters.value = _filters.value.copy(minRating = min, maxRating = max)
        performSearch(_searchQuery.value)
    }

    fun setYearFilter(from: Int?, to: Int?) {
        _filters.value = _filters.value.copy(yearFrom = from, yearTo = to)
        performSearch(_searchQuery.value)
    }

    fun setMetadataFilter(hasMetadata: Boolean?) {
        _filters.value = _filters.value.copy(hasMetadata = hasMetadata)
        performSearch(_searchQuery.value)
    }

    fun setLibraryFilter(libraryId: Long?) {
        _filters.value = _filters.value.copy(libraryId = libraryId)
        loadFilterOptions(libraryId)
        performSearch(_searchQuery.value)
    }

    private fun performSearch(query: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isSearching = true, error = null)
                
                val results = searchRepository.searchMedia(
                    query = query,
                    mediaTypes = _filters.value.mediaTypes,
                    minRating = _filters.value.minRating,
                    maxRating = _filters.value.maxRating,
                    yearFrom = _filters.value.yearFrom,
                    yearTo = _filters.value.yearTo,
                    hasMetadata = _filters.value.hasMetadata,
                    libraryId = _filters.value.libraryId
                )

                _uiState.value = _uiState.value.copy(
                    isSearching = false,
                    results = results,
                    hasSearched = query.isNotBlank() || _filters.value.isActive(),
                    error = null
                )

                // Save to recent searches if query is not empty
                if (query.isNotBlank()) {
                    searchRepository.saveRecentSearch(query)
                }
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
                val suggestions = searchRepository.getSearchSuggestions(query)
                _uiState.value = _uiState.value.copy(suggestions = suggestions)
            } catch (e: Exception) {
                // Silently fail for suggestions
            }
        }
    }

    private fun loadFilterOptions(libraryId: Long? = null) {
        viewModelScope.launch {
            try {
                val options = searchRepository.getAvailableFilters(libraryId)
                _uiState.value = _uiState.value.copy(filterOptions = options)
            } catch (e: Exception) {
                // Continue without filter options
            }
        }
    }

    fun loadRecentSearches() {
        viewModelScope.launch {
            try {
                val recentSearches = searchRepository.getRecentSearches()
                _uiState.value = _uiState.value.copy(recentSearches = recentSearches)
            } catch (e: Exception) {
                // Continue without recent searches
            }
        }
    }

    fun clearSearch() {
        _searchQuery.value = ""
        _filters.value = SearchFilters()
        _uiState.value = SearchUiState()
        loadFilterOptions()
    }
}

data class SearchUiState(
    val isSearching: Boolean = false,
    val results: List<MediaItemWithMetadata> = emptyList(),
    val suggestions: List<String> = emptyList(),
    val recentSearches: List<String> = emptyList(),
    val filterOptions: FilterOptions? = null,
    val hasSearched: Boolean = false,
    val error: String? = null
)
