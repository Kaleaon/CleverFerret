package com.universalmedialibrary.ui.reader

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.reader.AnnotationService
import com.universalmedialibrary.services.reader.SearchResult
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for search functionality
 */
@HiltViewModel
class SearchViewModel @Inject constructor(
    private val annotationService: AnnotationService
) : ViewModel() {

    private val _uiState = MutableStateFlow(SearchUiState())
    val uiState: StateFlow<SearchUiState> = _uiState.asStateFlow()

    private var currentMediaId: Long = 0

    fun setMediaId(mediaId: Long) {
        currentMediaId = mediaId
    }

    fun updateQuery(query: String) {
        _uiState.value = _uiState.value.copy(
            query = query,
            hasSearched = false
        )
    }

    fun clearQuery() {
        _uiState.value = _uiState.value.copy(
            query = "",
            searchResults = emptyList(),
            hasSearched = false
        )
    }

    fun performSearch() {
        val query = _uiState.value.query.trim()
        if (query.isEmpty()) return

        _uiState.value = _uiState.value.copy(
            isSearching = true,
            hasSearched = true
        )

        viewModelScope.launch {
            try {
                val results = if (_uiState.value.searchInCurrentBook) {
                    annotationService.searchInBook(currentMediaId, query)
                } else {
                    annotationService.searchAcrossBooks(query)
                }

                // Apply filters
                val filteredResults = applySearchFilters(results, query)

                // Add to search history
                addToSearchHistory(query)

                _uiState.value = _uiState.value.copy(
                    searchResults = filteredResults,
                    isSearching = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    searchResults = emptyList(),
                    isSearching = false,
                    error = e.message
                )
            }
        }
    }

    private fun applySearchFilters(results: List<SearchResult>, query: String): List<SearchResult> {
        var filteredResults = results

        if (_uiState.value.caseSensitive) {
            filteredResults = filteredResults.filter { result ->
                result.matchedText.contains(query)
            }
        }

        if (_uiState.value.wholeWords) {
            val regex = "\\b${Regex.escape(query)}\\b".toRegex(
                if (_uiState.value.caseSensitive) setOf() else setOf(RegexOption.IGNORE_CASE)
            )
            filteredResults = filteredResults.filter { result ->
                regex.containsMatchIn(result.matchedText)
            }
        }

        return filteredResults
    }

    fun toggleSearchScope() {
        _uiState.value = _uiState.value.copy(
            searchInCurrentBook = !_uiState.value.searchInCurrentBook
        )
    }

    fun toggleCaseSensitive() {
        _uiState.value = _uiState.value.copy(
            caseSensitive = !_uiState.value.caseSensitive
        )
    }

    fun toggleWholeWords() {
        _uiState.value = _uiState.value.copy(
            wholeWords = !_uiState.value.wholeWords
        )
    }

    private fun addToSearchHistory(query: String) {
        val currentHistory = _uiState.value.searchHistory.toMutableList()

        // Remove if already exists
        currentHistory.remove(query)

        // Add to beginning
        currentHistory.add(0, query)

        // Keep only last 10 searches
        if (currentHistory.size > 10) {
            currentHistory.removeAt(currentHistory.size - 1)
        }

        _uiState.value = _uiState.value.copy(
            searchHistory = currentHistory
        )
    }

    fun removeFromHistory(query: String) {
        val currentHistory = _uiState.value.searchHistory.toMutableList()
        currentHistory.remove(query)
        _uiState.value = _uiState.value.copy(
            searchHistory = currentHistory
        )
    }

    fun clearSearchHistory() {
        _uiState.value = _uiState.value.copy(
            searchHistory = emptyList()
        )
    }
}

/**
 * UI state for search functionality
 */
data class SearchUiState(
    val query: String = "",
    val searchResults: List<SearchResult> = emptyList(),
    val searchHistory: List<String> = emptyList(),
    val isSearching: Boolean = false,
    val hasSearched: Boolean = false,
    val searchInCurrentBook: Boolean = true,
    val caseSensitive: Boolean = false,
    val wholeWords: Boolean = false,
    val error: String? = null
)
