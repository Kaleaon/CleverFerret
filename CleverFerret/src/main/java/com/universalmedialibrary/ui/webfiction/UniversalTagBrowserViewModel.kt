package com.universalmedialibrary.ui.webfiction

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.webfiction.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Universal Tag Browser
 * Works with ANY fanfiction site
 */
@HiltViewModel
class UniversalTagBrowserViewModel @Inject constructor(
    private val universalTagService: UniversalTagService,
    private val webFictionService: WebFictionService
) : ViewModel() {

    private val _uiState = MutableStateFlow(UniversalTagBrowserUiState())
    val uiState: StateFlow<UniversalTagBrowserUiState> = _uiState.asStateFlow()

    /**
     * Select a site to browse
     */
    fun selectSite(siteType: WebFictionSiteType) {
        _uiState.value = _uiState.value.copy(
            selectedSite = siteType,
            tags = emptyList(),
            selectedTags = emptyList(),
            searchResult = null
        )
        loadTagsForSite(siteType)
    }

    /**
     * Clear site selection and return to site chooser
     */
    fun clearSiteSelection() {
        _uiState.value = UniversalTagBrowserUiState()
    }

    /**
     * Load tags for selected site
     */
    private fun loadTagsForSite(siteType: WebFictionSiteType) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoadingTags = true, error = null)

            val result = universalTagService.fetchTagsForSite(siteType)
            
            result.onSuccess { tags ->
                _uiState.value = _uiState.value.copy(
                    tags = tags,
                    isLoadingTags = false
                )
            }.onFailure { error ->
                _uiState.value = _uiState.value.copy(
                    isLoadingTags = false,
                    error = "Failed to load tags: ${error.message}"
                )
            }
        }
    }

    /**
     * Refresh tags from server
     */
    fun refreshTags() {
        _uiState.value.selectedSite?.let { site ->
            loadTagsForSite(site)
        }
    }

    /**
     * Toggle tag selection
     */
    fun toggleTag(tagId: String) {
        val currentTags = _uiState.value.selectedTags.toMutableList()
        
        if (tagId in currentTags) {
            currentTags.remove(tagId)
        } else {
            currentTags.add(tagId)
        }

        _uiState.value = _uiState.value.copy(selectedTags = currentTags)
    }

    /**
     * Remove a selected tag
     */
    fun removeTag(tagId: String) {
        val currentTags = _uiState.value.selectedTags.toMutableList()
        currentTags.remove(tagId)
        _uiState.value = _uiState.value.copy(selectedTags = currentTags)
    }

    /**
     * Clear all selected tags
     */
    fun clearTags() {
        _uiState.value = _uiState.value.copy(
            selectedTags = emptyList(),
            searchResult = null
        )
    }

    /**
     * Toggle category expansion
     */
    fun toggleCategory(category: TagCategory) {
        val newCategory = if (_uiState.value.expandedCategory == category) {
            null
        } else {
            category
        }
        _uiState.value = _uiState.value.copy(expandedCategory = newCategory)
    }

    /**
     * Toggle filter panel
     */
    fun toggleFilters() {
        _uiState.value = _uiState.value.copy(
            showFilters = !_uiState.value.showFilters
        )
    }

    /**
     * Update search criteria
     */
    fun updateSearchCriteria(criteria: StorySearchCriteria) {
        _uiState.value = _uiState.value.copy(searchCriteria = criteria)
    }

    /**
     * Browse stories with selected tags
     */
    fun browseStories() {
        val selectedSite = _uiState.value.selectedSite ?: return
        
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoadingStories = true, error = null)

            val criteria = _uiState.value.searchCriteria.copy(
                tags = _uiState.value.selectedTags,
                offset = 0
            )

            val result = universalTagService.browseByTags(selectedSite, criteria)

            result.onSuccess { searchResult ->
                _uiState.value = _uiState.value.copy(
                    searchResult = searchResult,
                    isLoadingStories = false,
                    searchCriteria = criteria
                )
            }.onFailure { error ->
                _uiState.value = _uiState.value.copy(
                    isLoadingStories = false,
                    error = "Failed to browse stories: ${error.message}"
                )
            }
        }
    }

    /**
     * Load more stories (pagination)
     */
    fun loadMore() {
        val currentResult = _uiState.value.searchResult ?: return
        val selectedSite = _uiState.value.selectedSite ?: return
        if (!currentResult.hasMore || _uiState.value.isLoadingStories) return

        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoadingStories = true)

            val nextCriteria = _uiState.value.searchCriteria.copy(
                offset = currentResult.nextOffset ?: 0
            )

            val result = universalTagService.browseByTags(selectedSite, nextCriteria)

            result.onSuccess { newResult ->
                val combinedStories = currentResult.stories + newResult.stories
                _uiState.value = _uiState.value.copy(
                    searchResult = newResult.copy(stories = combinedStories),
                    isLoadingStories = false,
                    searchCriteria = nextCriteria
                )
            }.onFailure { error ->
                _uiState.value = _uiState.value.copy(
                    isLoadingStories = false,
                    error = "Failed to load more: ${error.message}"
                )
            }
        }
    }

    /**
     * Download a story
     */
    fun downloadStory(story: WebFictionStory) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                downloadingStoryId = story.id,
                error = null
            )

            try {
                val chapters = webFictionService.downloadAllChapters(story)
                val completeStory = story.copy(chapters = chapters)
                
                // TODO: Create EPUB, add to library
                _uiState.value = _uiState.value.copy(
                    downloadingStoryId = null,
                    successMessage = "Downloaded: ${completeStory.title}"
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    downloadingStoryId = null,
                    error = "Download failed: ${e.message}"
                )
            }
        }
    }

    /**
     * Clear error
     */
    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }

    /**
     * Clear success message
     */
    fun clearSuccess() {
        _uiState.value = _uiState.value.copy(successMessage = null)
    }
}

/**
 * UI State for Universal Tag Browser
 */
data class UniversalTagBrowserUiState(
    val selectedSite: WebFictionSiteType? = null,
    val tags: List<WebFictionTag> = emptyList(),
    val selectedTags: List<String> = emptyList(),
    val expandedCategory: TagCategory? = null,
    val showFilters: Boolean = false,
    val searchCriteria: StorySearchCriteria = StorySearchCriteria(),
    val searchResult: StorySearchResult? = null,
    val isLoadingTags: Boolean = false,
    val isLoadingStories: Boolean = false,
    val downloadingStoryId: String? = null,
    val error: String? = null,
    val successMessage: String? = null
)
