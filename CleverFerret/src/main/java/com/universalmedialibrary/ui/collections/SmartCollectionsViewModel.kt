package com.universalmedialibrary.ui.collections

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.SmartCollectionRule
import com.universalmedialibrary.data.local.entity.SuggestedCollection
import com.universalmedialibrary.data.local.entity.CollectionType
import com.universalmedialibrary.data.repository.UnifiedCollectionRepository
import com.universalmedialibrary.services.collections.SmartCollectionEngine
import com.universalmedialibrary.services.suggestions.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SmartCollectionsViewModel @Inject constructor(
    private val smartCollectionEngine: SmartCollectionEngine,
    private val autoSuggestionService: AutoSuggestionService,
    private val collectionRepository: UnifiedCollectionRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(SmartCollectionsUiState())
    val uiState: StateFlow<SmartCollectionsUiState> = _uiState.asStateFlow()

    // Use stateIn for active collections to avoid multiple collectors
    private val activeCollectionsFlow = smartCollectionEngine.getAllSmartCollections()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    init {
        loadSuggestions()
        loadAllSuggestions()
        
        // Single collector for active collections
        viewModelScope.launch {
            activeCollectionsFlow.collect { collections ->
                _uiState.update { it.copy(activeCollections = collections) }
            }
        }
    }

    private fun loadSuggestions() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            try {
                val suggestions = smartCollectionEngine.generateSuggestions()
                _uiState.update { it.copy(suggestions = suggestions, isLoading = false) }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message, isLoading = false) }
            }
        }
    }

    private fun loadAllSuggestions() {
        viewModelScope.launch {
            try {
                val allSuggestions = autoSuggestionService.getAllSuggestions()
                _uiState.update { it.copy(allSuggestions = allSuggestions) }
            } catch (e: Exception) {
                // Non-critical: suggestions are supplementary
                Log.w("SmartCollectionsVM", "Failed to load suggestions", e)
            }
        }
    }

    fun refreshSuggestions() {
        loadSuggestions()
        loadAllSuggestions()
    }

    fun createCollectionFromSuggestion(suggestion: SuggestedCollection) {
        viewModelScope.launch {
            try {
                smartCollectionEngine.createCollectionFromSuggestion(suggestion)
                // Remove from suggestions list - active collections will update automatically via Flow
                _uiState.update { state ->
                    state.copy(
                        suggestions = state.suggestions.filter { it.suggestionId != suggestion.suggestionId }
                    )
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message) }
            }
        }
    }

    fun dismissSuggestion(suggestionId: String) {
        viewModelScope.launch {
            smartCollectionEngine.dismissSuggestion(suggestionId)
            _uiState.update { state ->
                state.copy(
                    suggestions = state.suggestions.filter { it.suggestionId != suggestionId }
                )
            }
        }
    }

    fun refreshCollection(ruleId: Long) {
        viewModelScope.launch {
            try {
                smartCollectionEngine.refreshCollection(ruleId)
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message) }
            }
        }
    }

    fun deleteCollection(rule: SmartCollectionRule) {
        viewModelScope.launch {
            try {
                smartCollectionEngine.deleteCollection(rule)
                // Active collections will update automatically via Flow
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message) }
            }
        }
    }

    // Create collections from specific suggestion types
    fun createPlaylistFromSuggestion(playlist: PlaylistSuggestion) {
        viewModelScope.launch {
            try {
                collectionRepository.createPlaylist(
                    name = playlist.name,
                    description = playlist.description,
                    itemIds = playlist.itemIds
                )
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message) }
            }
        }
    }

    fun createSeriesCollection(series: SeriesSuggestion) {
        viewModelScope.launch {
            try {
                collectionRepository.createSeries(
                    name = "${series.seriesName} Series",
                    description = series.reason,
                    itemIds = series.books
                )
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message) }
            }
        }
    }

    fun createAuthorCollection(author: AuthorCollectionSuggestion) {
        viewModelScope.launch {
            try {
                collectionRepository.createCollection(
                    name = "Works by ${author.authorName}",
                    type = CollectionType.USER_DEFINED,
                    description = author.reason
                ).also { collectionId ->
                    collectionRepository.addItemsToCollection(collectionId, author.bookIds)
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message) }
            }
        }
    }

    fun createReadingList(readingList: ReadingListSuggestion) {
        viewModelScope.launch {
            try {
                collectionRepository.createReadingList(
                    name = readingList.name,
                    description = readingList.reason,
                    itemIds = readingList.itemIds
                )
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message) }
            }
        }
    }

    fun createMovieCollection(movie: MovieCollectionSuggestion) {
        viewModelScope.launch {
            try {
                collectionRepository.createWatchlist(
                    name = movie.name,
                    description = movie.description,
                    itemIds = movie.movieIds
                )
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message) }
            }
        }
    }
}

data class SmartCollectionsUiState(
    val suggestions: List<SuggestedCollection> = emptyList(),
    val activeCollections: List<SmartCollectionRule> = emptyList(),
    val allSuggestions: AllSuggestions? = null,
    val isLoading: Boolean = false,
    val error: String? = null
)
