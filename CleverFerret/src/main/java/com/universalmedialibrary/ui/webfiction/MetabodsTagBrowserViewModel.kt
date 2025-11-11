package com.universalmedialibrary.ui.webfiction

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.services.ContentPinRequiredException
import com.universalmedialibrary.services.DownloadBlockedException
import com.universalmedialibrary.services.webfiction.*
import com.universalmedialibrary.ui.components.pin.PinChallenge
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MetabodsTagBrowserViewModel @Inject constructor(
    private val metabodsTagService: MetabodsTagService,
    private val webFictionService: WebFictionService,
    private val parentalControlsSettings: ParentalControlsSettings
) : ViewModel() {

    private val _uiState = MutableStateFlow(MetabodsTagBrowserUiState())
    val uiState: StateFlow<MetabodsTagBrowserUiState> = _uiState.asStateFlow()
    private var pendingPinAction: (() -> Unit)? = null

    init {
        loadTags()
    }

    /**
     * Load available tags from Metabods
     */
    fun loadTags() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoadingTags = true, error = null)

            val result = metabodsTagService.fetchAllTags()
            
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
        loadTags()
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
     * Toggle filter panel visibility
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
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoadingStories = true, error = null)

            // Build criteria with selected tags
            val criteria = _uiState.value.searchCriteria.copy(
                tags = _uiState.value.selectedTags,
                offset = 0 // Reset pagination
            )

            val result = metabodsTagService.browseByTags(criteria)

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
        if (!currentResult.hasMore || _uiState.value.isLoadingStories) return

        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoadingStories = true)

            val nextCriteria = _uiState.value.searchCriteria.copy(
                offset = currentResult.nextOffset ?: 0
            )

            val result = metabodsTagService.browseByTags(nextCriteria)

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
    fun downloadStory(story: WebFictionStory, bypassPin: Boolean = false) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                downloadingStoryId = story.id,
                error = null,
                successMessage = null
            )

            try {
                val downloadResult = metabodsTagService.downloadStoryWithRespect(story.url, bypassPin)

                downloadResult.fold(
                    onSuccess = { downloadedStory ->
                        val chapters = webFictionService.downloadAllChapters(downloadedStory, bypassPin)
                        val completeStory = downloadedStory.copy(chapters = chapters)

                        _uiState.value = _uiState.value.copy(
                            downloadingStoryId = null,
                            successMessage = "Downloaded: ${completeStory.title}"
                        )
                    },
                    onFailure = { error ->
                        val handled = handlePinException(
                            throwable = error,
                            fallbackTitle = story.title,
                            fallbackRating = story.rating,
                            tags = story.tags
                        ) {
                            downloadStory(story, bypassPin = true)
                        }
                        if (handled) {
                            _uiState.value = _uiState.value.copy(downloadingStoryId = null)
                        } else {
                            _uiState.value = _uiState.value.copy(
                                downloadingStoryId = null,
                                error = mapParentalControlsError(
                                    error,
                                    "Download failed: ${error.message}"
                                )
                            )
                        }
                    }
                )
            } catch (e: Exception) {
                val handled = handlePinException(
                    throwable = e,
                    fallbackTitle = story.title,
                    fallbackRating = story.rating,
                    tags = story.tags
                ) {
                    downloadStory(story, bypassPin = true)
                }
                if (handled) {
                    _uiState.value = _uiState.value.copy(downloadingStoryId = null)
                } else {
                    _uiState.value = _uiState.value.copy(
                        downloadingStoryId = null,
                        error = mapParentalControlsError(
                            e,
                            "Download failed: ${e.message}"
                        )
                    )
                }
            }
        }
    }

    /**
     * Clear error message
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

    fun dismissPinChallenge() {
        pendingPinAction = null
        _uiState.value = _uiState.value.copy(pendingPinChallenge = null)
    }

    suspend fun verifyPin(pin: String): Boolean = parentalControlsSettings.verifyPin(pin)

    fun onPinUnlockGranted() {
        val action = pendingPinAction
        pendingPinAction = null
        _uiState.value = _uiState.value.copy(pendingPinChallenge = null)
        action?.invoke()
    }

    private fun handlePinException(
        throwable: Throwable,
        fallbackTitle: String,
        fallbackRating: String?,
        tags: List<String>,
        retry: () -> Unit
    ): Boolean {
        val pinException = throwable as? ContentPinRequiredException ?: return false
        val title = pinException.contentTitle ?: fallbackTitle
        val rating = pinException.contentRating ?: fallbackRating
        val description = pinException.localizedMessage ?: "Enter your PIN to unlock \"$title\"."
        pendingPinAction = retry
        _uiState.value = _uiState.value.copy(
            pendingPinChallenge = PinChallenge(
                title = title,
                rating = rating,
                mediaType = "STORY",
                tags = tags,
                description = description
            ),
            error = null
        )
        return true
    }

    private fun mapParentalControlsError(error: Throwable, fallback: String): String = when (error) {
        is AdultSitesDisabledException -> "Adult story sources are disabled in Parental Controls."
        is DownloadBlockedException -> error.message ?: "This story is blocked by parental controls."
        is ContentPinRequiredException -> "Parental controls require a PIN to access this story."
        else -> fallback
    }
}

/**
 * UI State for Metabods Tag Browser
 */
data class MetabodsTagBrowserUiState(
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
    val successMessage: String? = null,
    val pendingPinChallenge: PinChallenge? = null
)
