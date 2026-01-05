package com.universalmedialibrary.ui.manga

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.manga.source.MangaSource
import com.universalmedialibrary.services.manga.source.MangaSourceService
import com.universalmedialibrary.services.manga.source.OnlineManga
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Manga Explore Screen
 */
@HiltViewModel
class MangaExploreViewModel @Inject constructor(
    private val sourceService: MangaSourceService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(MangaExploreUiState())
    val uiState: StateFlow<MangaExploreUiState> = _uiState.asStateFlow()
    
    private var currentSearchPage = 0
    private var currentPopularPage = 0
    private var currentLatestPage = 0
    
    init {
        loadSources()
    }
    
    private fun loadSources() {
        viewModelScope.launch {
            val sources = sourceService.getEnabledSources()
            val allSources = sourceService.getAllSources()
            
            _uiState.update { it.copy(
                sources = sources,
                allSources = allSources,
                selectedSource = sources.firstOrNull()
            )}
            
            // Load initial content
            loadInitialContent()
        }
    }
    
    private fun loadInitialContent() {
        viewModelScope.launch {
            val source = _uiState.value.selectedSource ?: return@launch
            
            _uiState.update { it.copy(isLoading = true, error = null) }
            
            try {
                // Load popular
                sourceService.getPopular(source.id, 0).onSuccess { page ->
                    _uiState.update { it.copy(popularManga = page.manga) }
                }
                
                // Load latest
                sourceService.getLatestUpdates(source.id, 0).onSuccess { page ->
                    _uiState.update { it.copy(latestManga = page.manga) }
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message ?: "Failed to load content") }
            } finally {
                _uiState.update { it.copy(isLoading = false) }
            }
        }
    }
    
    fun selectSource(source: MangaSource) {
        if (source.id == _uiState.value.selectedSource?.id) return
        
        _uiState.update { it.copy(
            selectedSource = source,
            popularManga = emptyList(),
            latestManga = emptyList(),
            searchResults = emptyList()
        )}
        
        currentSearchPage = 0
        currentPopularPage = 0
        currentLatestPage = 0
        
        loadInitialContent()
    }
    
    fun search(query: String) {
        if (query.length < 3) return
        
        viewModelScope.launch {
            val source = _uiState.value.selectedSource ?: return@launch
            
            _uiState.update { it.copy(
                isLoading = true, 
                error = null,
                currentQuery = query
            )}
            
            currentSearchPage = 0
            
            sourceService.search(source.id, query, 0).fold(
                onSuccess = { page ->
                    _uiState.update { it.copy(
                        searchResults = page.manga,
                        hasMoreSearchResults = page.hasNextPage,
                        isLoading = false
                    )}
                },
                onFailure = { e ->
                    _uiState.update { it.copy(
                        error = e.message ?: "Search failed",
                        isLoading = false
                    )}
                }
            )
        }
    }
    
    fun loadMoreSearchResults() {
        val state = _uiState.value
        if (state.isLoading || !state.hasMoreSearchResults) return
        
        viewModelScope.launch {
            val source = state.selectedSource ?: return@launch
            val query = state.currentQuery ?: return@launch
            
            _uiState.update { it.copy(isLoading = true) }
            
            currentSearchPage++
            
            sourceService.search(source.id, query, currentSearchPage).fold(
                onSuccess = { page ->
                    _uiState.update { it.copy(
                        searchResults = it.searchResults + page.manga,
                        hasMoreSearchResults = page.hasNextPage,
                        isLoading = false
                    )}
                },
                onFailure = { e ->
                    currentSearchPage--
                    _uiState.update { it.copy(
                        error = e.message ?: "Failed to load more",
                        isLoading = false
                    )}
                }
            )
        }
    }
    
    fun clearSearch() {
        _uiState.update { it.copy(
            searchResults = emptyList(),
            currentQuery = null,
            hasMoreSearchResults = false
        )}
        currentSearchPage = 0
    }
    
    fun loadPopular() {
        viewModelScope.launch {
            val source = _uiState.value.selectedSource ?: return@launch
            
            _uiState.update { it.copy(isLoading = true, error = null) }
            
            currentPopularPage++
            
            sourceService.getPopular(source.id, currentPopularPage).fold(
                onSuccess = { page ->
                    _uiState.update { it.copy(
                        popularManga = it.popularManga + page.manga,
                        isLoading = false
                    )}
                },
                onFailure = { e ->
                    currentPopularPage--
                    _uiState.update { it.copy(
                        error = e.message ?: "Failed to load",
                        isLoading = false
                    )}
                }
            )
        }
    }
    
    fun loadLatest() {
        viewModelScope.launch {
            val source = _uiState.value.selectedSource ?: return@launch
            
            _uiState.update { it.copy(isLoading = true, error = null) }
            
            currentLatestPage++
            
            sourceService.getLatestUpdates(source.id, currentLatestPage).fold(
                onSuccess = { page ->
                    _uiState.update { it.copy(
                        latestManga = it.latestManga + page.manga,
                        isLoading = false
                    )}
                },
                onFailure = { e ->
                    currentLatestPage--
                    _uiState.update { it.copy(
                        error = e.message ?: "Failed to load",
                        isLoading = false
                    )}
                }
            )
        }
    }
    
    fun refresh() {
        currentSearchPage = 0
        currentPopularPage = 0
        currentLatestPage = 0
        
        _uiState.update { it.copy(
            popularManga = emptyList(),
            latestManga = emptyList(),
            searchResults = emptyList(),
            error = null
        )}
        
        loadInitialContent()
    }
    
    fun toggleSource(sourceId: String, enabled: Boolean) {
        viewModelScope.launch {
            sourceService.setSourceEnabled(sourceId, enabled)
            loadSources()
        }
    }
    
    fun pinSource(sourceId: String, pinned: Boolean) {
        viewModelScope.launch {
            sourceService.setSourcePinned(sourceId, pinned)
            loadSources()
        }
    }
}

/**
 * UI State for Manga Explore
 */
data class MangaExploreUiState(
    val isLoading: Boolean = false,
    val error: String? = null,
    
    // Sources
    val sources: List<MangaSource> = emptyList(),
    val allSources: List<MangaSource> = emptyList(),
    val selectedSource: MangaSource? = null,
    
    // Content
    val manga: List<OnlineManga> = emptyList(),
    val popularManga: List<OnlineManga> = emptyList(),
    val latestManga: List<OnlineManga> = emptyList(),
    
    // Search
    val searchResults: List<OnlineManga> = emptyList(),
    val currentQuery: String? = null,
    val hasMoreSearchResults: Boolean = false
)
