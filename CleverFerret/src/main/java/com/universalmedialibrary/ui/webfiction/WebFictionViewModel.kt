package com.universalmedialibrary.ui.webfiction

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.services.ContentPinRequiredException
import com.universalmedialibrary.services.DownloadBlockedException
import com.universalmedialibrary.services.contentcreation.FanfictionToEpubConverterBasic
import com.universalmedialibrary.services.webfiction.AdultSitesDisabledException
import com.universalmedialibrary.services.webfiction.WebFictionService
import com.universalmedialibrary.services.webfiction.WebFictionStory
import com.universalmedialibrary.ui.components.pin.PinChallenge
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class WebFictionViewModel @Inject constructor(
    private val webFictionService: WebFictionService,
    private val basicConverter: FanfictionToEpubConverterBasic,
    private val redditStoryManager: com.universalmedialibrary.services.webfiction.RedditStoryManager,
    private val parentalControlsSettings: ParentalControlsSettings
) : ViewModel() {

    private val _uiState = MutableStateFlow(WebFictionUiState())
    val uiState: StateFlow<WebFictionUiState> = _uiState.asStateFlow()
    val adultSitesEnabled: StateFlow<Boolean> =
        parentalControlsSettings.parentalControlsState
            .map { it.allowAdultSources }
            .stateIn(
                scope = viewModelScope,
                started = SharingStarted.WhileSubscribed(5_000),
                initialValue = false
            )
    private var pendingPinAction: (() -> Unit)? = null

    init {
        loadStories()
        loadTrackedRedditStories()
    }

    /**
     * Download Reddit series with native EPUB generation and automatic library addition
     */
    fun downloadRedditSeriesAsEpub(
        seriesName: String,
        author: String,
        subreddit: String
    ) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            try {
                val config = com.universalmedialibrary.services.webfiction.RedditStoryManager.RedditSeriesConfig(
                    seriesName = seriesName,
                    author = author,
                    subreddit = subreddit,
                    autoUpdate = true
                )
                
                val result = redditStoryManager.downloadAndAddToLibrary(config)
                if (!result.success) {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = result.errorMessage ?: "Failed to download Reddit series"
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        successMessage = "Downloaded ${result.chapters} chapters! Added to library."
                    )
                    // Reload tracked stories
                    loadTrackedRedditStories()
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(isLoading = false, error = e.message)
            }
        }
    }

    /**
     * Check for updates on a specific Reddit story
     */
    fun updateRedditStory(storyId: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isCheckingUpdates = true, error = null)
            try {
                val result = redditStoryManager.updateStory(storyId)
                if (!result.success) {
                    _uiState.value = _uiState.value.copy(
                        isCheckingUpdates = false,
                        error = result.errorMessage
                    )
                } else if (result.newChapters > 0) {
                    _uiState.value = _uiState.value.copy(
                        isCheckingUpdates = false,
                        successMessage = "Updated! Found ${result.newChapters} new chapters (total: ${result.totalChapters})"
                    )
                    loadTrackedRedditStories()
                } else {
                    _uiState.value = _uiState.value.copy(
                        isCheckingUpdates = false,
                        successMessage = "Already up to date!"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(isCheckingUpdates = false, error = e.message)
            }
        }
    }

    /**
     * Check all tracked Reddit stories for updates
     */
    fun updateAllRedditStories() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isCheckingUpdates = true, error = null)
            try {
                val results = redditStoryManager.updateAllStories()
                val updatedCount = results.count { it.success && it.newChapters > 0 }
                val totalNewChapters = results.filter { it.success }.sumOf { it.newChapters }
                
                _uiState.value = _uiState.value.copy(
                    isCheckingUpdates = false,
                    successMessage = if (updatedCount > 0) {
                        "Updated $updatedCount stories with $totalNewChapters new chapters!"
                    } else {
                        "All stories are up to date!"
                    }
                )
                loadTrackedRedditStories()
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(isCheckingUpdates = false, error = e.message)
            }
        }
    }

    /**
     * Load tracked Reddit stories
     */
    private fun loadTrackedRedditStories() {
        viewModelScope.launch {
            redditStoryManager.getAllTrackedStories().collect { stories ->
                _uiState.value = _uiState.value.copy(trackedRedditStories = stories)
            }
        }
    }

    fun addStoryFromUrl(url: String, bypassPin: Boolean = false) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            var resolvedStory: WebFictionStory? = null

            try {
                val story = webFictionService.extractStoryFromUrl(url, bypassPin)
                if (story != null) {
                    resolvedStory = story
                    // Download all chapters
                    val chapters = webFictionService.downloadAllChapters(story, bypassPin)
                    val completeStory = story.copy(chapters = chapters)

                    // Add to local storage (in real app, save to database)
                    val updatedStories = _uiState.value.stories + completeStory
                    _uiState.value = _uiState.value.copy(
                        stories = updatedStories,
                        isLoading = false
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = "Failed to extract story from URL. Please check the URL and try again."
                    )
                }
            } catch (e: Exception) {
                val handled = handlePinException(
                    throwable = e,
                    fallbackTitle = resolvedStory?.title ?: url,
                    fallbackRating = resolvedStory?.rating,
                    mediaType = "STORY",
                    tags = resolvedStory?.tags ?: emptyList()
                ) {
                    addStoryFromUrl(url, bypassPin = true)
                }
                if (handled) {
                    _uiState.value = _uiState.value.copy(isLoading = false)
                    return@launch
                }

                val message = mapParentalControlsError(
                    e,
                    "Error adding story: ${e.message}"
                )
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = message
                )
            }
        }
    }

    fun checkForUpdates(story: WebFictionStory, bypassPin: Boolean = false) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isCheckingUpdates = true)

            try {
                val newChapters = webFictionService.checkForUpdates(story, bypassPin)
                if (newChapters.isNotEmpty()) {
                    val updatedStory = story.copy(chapters = story.chapters + newChapters)
                    val updatedStories = _uiState.value.stories.map {
                        if (it.id == story.id) updatedStory else it
                    }
                    val updatedStoriesWithUpdates = _uiState.value.storiesWithUpdates + updatedStory

                    _uiState.value = _uiState.value.copy(
                        stories = updatedStories,
                        storiesWithUpdates = updatedStoriesWithUpdates,
                        isCheckingUpdates = false
                    )
                } else {
                    _uiState.value = _uiState.value.copy(isCheckingUpdates = false)
                }
            } catch (e: Exception) {
                val handled = handlePinException(
                    throwable = e,
                    fallbackTitle = story.title,
                    fallbackRating = story.rating,
                    mediaType = "STORY",
                    tags = story.tags
                ) {
                    checkForUpdates(story, bypassPin = true)
                }
                if (handled) {
                    _uiState.value = _uiState.value.copy(isCheckingUpdates = false)
                    return@launch
                }

                val message = mapParentalControlsError(
                    e,
                    "Error checking for updates: ${e.message}"
                )
                _uiState.value = _uiState.value.copy(
                    isCheckingUpdates = false,
                    error = message
                )
            }
        }
    }

    fun checkAllForUpdates(bypassPin: Boolean = false) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isCheckingUpdates = true)

            val updatesFound = mutableListOf<WebFictionStory>()
            val updatedStories = mutableListOf<WebFictionStory>()
            var currentStory: WebFictionStory? = null

            try {
                _uiState.value.stories.forEach { story ->
                    currentStory = story
                    val newChapters = webFictionService.checkForUpdates(story, bypassPin)
                    if (newChapters.isNotEmpty()) {
                        val updatedStory = story.copy(chapters = story.chapters + newChapters)
                        updatedStories.add(updatedStory)
                        updatesFound.add(updatedStory)
                    } else {
                        updatedStories.add(story)
                    }
                }

                _uiState.value = _uiState.value.copy(
                    stories = updatedStories,
                    storiesWithUpdates = updatesFound,
                    isCheckingUpdates = false
                )
            } catch (e: Exception) {
                val handled = handlePinException(
                    throwable = e,
                    fallbackTitle = currentStory?.title ?: "Stories",
                    fallbackRating = currentStory?.rating,
                    mediaType = "STORY",
                    tags = currentStory?.tags ?: emptyList()
                ) {
                    checkAllForUpdates(bypassPin = true)
                }
                if (handled) {
                    _uiState.value = _uiState.value.copy(isCheckingUpdates = false)
                    return@launch
                }

                val message = mapParentalControlsError(
                    e,
                    "Error checking for updates: ${e.message}"
                )
                _uiState.value = _uiState.value.copy(
                    isCheckingUpdates = false,
                    error = message
                )
            }
        }
    }

    fun downloadStory(story: WebFictionStory, bypassPin: Boolean = false) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)

            try {
                val chapters = webFictionService.downloadAllChapters(story, bypassPin)
                val updatedStory = story.copy(chapters = chapters)
                val updatedStories = _uiState.value.stories.map {
                    if (it.id == story.id) updatedStory else it
                }

                _uiState.value = _uiState.value.copy(
                    stories = updatedStories,
                    isLoading = false
                )
            } catch (e: Exception) {
                val handled = handlePinException(
                    throwable = e,
                    fallbackTitle = story.title,
                    fallbackRating = story.rating,
                    mediaType = "STORY",
                    tags = story.tags
                ) {
                    downloadStory(story, bypassPin = true)
                }
                if (handled) {
                    _uiState.value = _uiState.value.copy(isLoading = false)
                    return@launch
                }

                val message = mapParentalControlsError(
                    e,
                    "Error downloading story: ${e.message}"
                )
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = message
                )
            }
        }
    }

    fun downloadAllUpdates(bypassPin: Boolean = false) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)

            try {
                val updatedStories = _uiState.value.stories.toMutableList()

                _uiState.value.storiesWithUpdates.forEach { storyWithUpdate ->
                    val index = updatedStories.indexOfFirst { it.id == storyWithUpdate.id }
                    if (index != -1) {
                        val chapters = webFictionService.downloadAllChapters(storyWithUpdate, bypassPin)
                        updatedStories[index] = storyWithUpdate.copy(chapters = chapters)
                    }
                }

                _uiState.value = _uiState.value.copy(
                    stories = updatedStories,
                    storiesWithUpdates = emptyList(),
                    isLoading = false
                )
            } catch (e: Exception) {
                val handled = handlePinException(
                    throwable = e,
                    fallbackTitle = "Story updates",
                    fallbackRating = null,
                    mediaType = "STORY",
                    tags = emptyList()
                ) {
                    downloadAllUpdates(bypassPin = true)
                }
                if (handled) {
                    _uiState.value = _uiState.value.copy(isLoading = false)
                    return@launch
                }

                val message = mapParentalControlsError(
                    e,
                    "Error downloading updates: ${e.message}"
                )
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = message
                )
            }
        }
    }

    fun removeStory(story: WebFictionStory) {
        val updatedStories = _uiState.value.stories.filter { it.id != story.id }
        val updatedStoriesWithUpdates = _uiState.value.storiesWithUpdates.filter { it.id != story.id }

        _uiState.value = _uiState.value.copy(
            stories = updatedStories,
            storiesWithUpdates = updatedStoriesWithUpdates
        )
    }

    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
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
        mediaType: String?,
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
                mediaType = mediaType,
                tags = tags,
                description = description
            ),
            error = null
        )
        return true
    }

    private fun mapParentalControlsError(e: Exception, fallback: String): String = when (e) {
        is AdultSitesDisabledException -> "Adult story sources are disabled in Parental Controls."
        is DownloadBlockedException -> e.message
            ?: "Parental controls are blocking this story. Update your parental control settings to continue."
        else -> fallback
    }

    private fun loadStories() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)

            try {
                // In a real app, load from database
                // For now, create some demo data
                val demoStories = createDemoStories()
                _uiState.value = _uiState.value.copy(
                    stories = demoStories,
                    isLoading = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Error loading stories: ${e.message}"
                )
            }
        }
    }

    private fun createDemoStories(): List<WebFictionStory> {
        return listOf(
            WebFictionStory(
                id = "demo_1",
                title = "The Digital Awakening",
                author = "TechWizard42",
                description = "In a world where AI has become sentient, a young programmer must navigate the complex relationship between humans and artificial intelligence.",
                url = "https://archiveofourown.org/works/demo1",
                site = "Archive of Our Own",
                status = com.universalmedialibrary.services.webfiction.StoryStatus.ONGOING,
                genre = "Sci-Fi",
                fandom = "Original",
                language = "en",
                chapterCount = 25,
                lastUpdated = System.currentTimeMillis(),
                rating = "T",
                tags = listOf("AI", "Sci-Fi", "Technology", "Romance"),
                wordCount = 125000L
            ),
            WebFictionStory(
                id = "demo_2",
                title = "Royal Road Chronicles",
                author = "FantasyMaster",
                description = "A comprehensive LitRPG adventure following a player's journey through a virtual world that becomes all too real.",
                url = "https://www.royalroad.com/fiction/demo2",
                site = "Royal Road",
                status = com.universalmedialibrary.services.webfiction.StoryStatus.COMPLETED,
                genre = "LitRPG",
                fandom = "Original",
                language = "en",
                chapterCount = 156,
                lastUpdated = System.currentTimeMillis(),
                rating = "M",
                tags = listOf("LitRPG", "Adventure", "Virtual Reality", "Action"),
                wordCount = 890000L
            ),
            WebFictionStory(
                id = "demo_3",
                title = "Fanfiction Adventures",
                author = "StoryLover123",
                description = "A collection of interconnected stories exploring different universes and characters in creative ways.",
                url = "https://www.fanfiction.net/s/demo3",
                site = "FanFiction.net",
                status = com.universalmedialibrary.services.webfiction.StoryStatus.HIATUS,
                genre = "Crossover",
                fandom = "Multi-fandom",
                language = "en",
                chapterCount = 42,
                lastUpdated = System.currentTimeMillis(),
                rating = "T",
                tags = listOf("Crossover", "Adventure", "Friendship", "Drama"),
                wordCount = 234000L
            )
        )
    }
}

data class WebFictionUiState(
    val stories: List<WebFictionStory> = emptyList(),
    val storiesWithUpdates: List<WebFictionStory> = emptyList(),
    val trackedRedditStories: List<com.universalmedialibrary.data.local.entity.DownloadedStory> = emptyList(),
    val isLoading: Boolean = false,
    val isCheckingUpdates: Boolean = false,
    val error: String? = null,
    val successMessage: String? = null,
    val pendingPinChallenge: PinChallenge? = null
)
