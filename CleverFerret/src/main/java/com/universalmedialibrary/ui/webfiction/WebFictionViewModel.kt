package com.universalmedialibrary.ui.webfiction

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.data.repository.WebFictionRepository
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.services.ContentPinRequiredException
import com.universalmedialibrary.services.DownloadBlockedException
import com.universalmedialibrary.services.webfiction.AdultSitesDisabledException
import com.universalmedialibrary.services.webfiction.WebFictionService
import com.universalmedialibrary.services.webfiction.WebFictionService.WebFictionRateLimitException
import com.universalmedialibrary.services.webfiction.WebFictionService.WebFictionSiteChangedException
import com.universalmedialibrary.services.webfiction.WebFictionService.UnsupportedWebFictionUrlException
import com.universalmedialibrary.services.webfiction.WebFictionChapter
import com.universalmedialibrary.services.webfiction.WebFictionStory
import com.universalmedialibrary.services.webfiction.StoryStatus
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
class WebFictionManagerScreenViewModel @Inject constructor(
    private val webFictionService: WebFictionService,
    private val webFictionRepository: WebFictionRepository,
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
                val validated = webFictionService.parseAndValidateSourceUrl(url)
                val story = webFictionService.extractStoryFromUrl(validated.normalizedUrl, bypassPin)
                    ?: throw IllegalStateException("Failed to extract story from URL. The source page may have changed.")
                resolvedStory = story

                val existing = webFictionRepository.getWebFictionBySourceUrl(validated.normalizedUrl)
                val completeStory = if (existing != null) {
                    val resumableStory = story.copy(
                        id = existing.id,
                        chapters = placeholderChapters(
                            storyId = existing.id,
                            count = existing.lastChapterDownloaded
                        )
                    )
                    val newChapters = webFictionService.checkForUpdates(resumableStory, bypassPin)
                    val mergedChapters = resumableStory.chapters + newChapters
                    val mergedStory = story.copy(id = existing.id, chapters = mergedChapters)
                    webFictionRepository.updateWebFiction(mergedStory.toEntity(existing.dateAdded))
                    _uiState.value = _uiState.value.copy(
                        successMessage = if (newChapters.isEmpty()) {
                            "\"${story.title}\" is already up to date."
                        } else {
                            "Resumed \"${story.title}\" and downloaded ${newChapters.size} new chapter(s)."
                        }
                    )
                    mergedStory
                } else {
                    val chapters = webFictionService.downloadAllChapters(story, bypassPin)
                    val freshStory = story.copy(chapters = chapters)
                    webFictionRepository.insertWebFiction(freshStory.toEntity())
                    _uiState.value = _uiState.value.copy(
                        successMessage = "Added \"${story.title}\" with ${chapters.size} chapter(s)."
                    )
                    freshStory
                }

                val refreshedStories = _uiState.value.stories
                    .filterNot { it.id == completeStory.id }
                    .plus(completeStory)
                _uiState.value = _uiState.value.copy(stories = refreshedStories, isLoading = false)
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

                val message = mapWebFictionError(e, "Error adding story: ${e.message}")
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
                    webFictionRepository.updateWebFiction(updatedStory.toEntity())
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

                val message = mapWebFictionError(e, "Error checking for updates: ${e.message}")
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
                        webFictionRepository.updateWebFiction(updatedStory.toEntity())
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

                val message = mapWebFictionError(e, "Error checking for updates: ${e.message}")
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
                webFictionRepository.updateWebFiction(updatedStory.toEntity())
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

                val message = mapWebFictionError(e, "Error downloading story: ${e.message}")
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
                        webFictionRepository.updateWebFiction(updatedStories[index].toEntity())
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

                val message = mapWebFictionError(e, "Error downloading updates: ${e.message}")
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = message
                )
            }
        }
    }

    fun removeStory(story: WebFictionStory) {
        viewModelScope.launch {
            webFictionRepository.getWebFictionById(story.id)?.let {
                webFictionRepository.deleteWebFiction(it)
            }
            val updatedStories = _uiState.value.stories.filter { it.id != story.id }
            val updatedStoriesWithUpdates = _uiState.value.storiesWithUpdates.filter { it.id != story.id }

            _uiState.value = _uiState.value.copy(
                stories = updatedStories,
                storiesWithUpdates = updatedStoriesWithUpdates
            )
        }
    }

    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }

    fun validateSourceUrl(rawUrl: String): Result<String> = runCatching {
        webFictionService.parseAndValidateSourceUrl(rawUrl).normalizedUrl
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

    private fun mapWebFictionError(e: Exception, fallback: String): String {
        val parentalControlsMessage = mapParentalControlsError(e, fallback)
        if (parentalControlsMessage != fallback) return parentalControlsMessage

        return when (e) {
            is UnsupportedWebFictionUrlException -> "${e.message}\n\nTry:\n• Opening the story in your browser and copying the canonical chapter/works URL.\n• Removing tracking params after '?'."
            is WebFictionRateLimitException -> "${e.message}\n\nTry:\n• Wait 5-15 minutes, then retry.\n• Run updates for fewer stories at once."
            is WebFictionSiteChangedException -> "${e.message}\n\nTry:\n• Verify the story URL still loads in your browser.\n• Update the story with the latest canonical URL."
            else -> fallback
        }
    }

    private fun loadStories() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)

            try {
                webFictionRepository.getAllWebFiction().collect { storedStories ->
                    _uiState.value = _uiState.value.copy(
                        stories = storedStories.map { it.toUiStory() },
                        isLoading = false
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Error loading stories: ${e.message}"
                )
            }
        }
    }

    private fun FanfictionStoryEntity.toUiStory(): WebFictionStory = WebFictionStory(
        id = id,
        url = sourceUrl,
        title = title,
        author = author,
        description = summary,
        status = status.toStoryStatus(),
        genre = null,
        fandom = fandoms.firstOrNull(),
        language = language,
        wordCount = wordCount.toLong(),
        chapterCount = chapterCount,
        lastUpdated = updateDate,
        rating = rating,
        warnings = warnings,
        tags = tags,
        isCompleted = status == "COMPLETE" || status == "COMPLETED",
        site = sourceSite,
        totalChapters = chapterCount,
        localPath = epubPath,
        chapters = placeholderChapters(id, lastChapterDownloaded),
        updatedAt = updateDate
    )

    private fun WebFictionStory.toEntity(existingDateAdded: Long = System.currentTimeMillis()): FanfictionStoryEntity =
        FanfictionStoryEntity(
            id = id,
            sourceUrl = url,
            sourceSite = site ?: "Unknown",
            title = title,
            author = author ?: "Unknown",
            summary = description ?: "",
            rating = rating,
            status = when (status) {
                StoryStatus.ONGOING -> "IN_PROGRESS"
                StoryStatus.COMPLETED -> "COMPLETE"
                StoryStatus.HIATUS -> "HIATUS"
                StoryStatus.CANCELLED -> "ABANDONED"
                StoryStatus.UNKNOWN -> "IN_PROGRESS"
            },
            wordCount = wordCount?.toInt() ?: 0,
            chapterCount = totalChapters ?: chapterCount ?: chapters.size,
            lastChapterDownloaded = chapters.size,
            updateDate = updatedAt ?: lastUpdated,
            lastCheckedDate = System.currentTimeMillis(),
            dateAdded = existingDateAdded,
            epubPath = localPath,
            warnings = warnings,
            fandoms = listOfNotNull(fandom),
            tags = tags,
            language = language ?: "English"
        )

    private fun placeholderChapters(storyId: String, count: Int): List<WebFictionChapter> =
        (1..count).map { index ->
            WebFictionChapter(
                id = "$storyId-placeholder-$index",
                storyId = storyId,
                number = index,
                title = "Chapter $index",
                content = "",
                publishDate = null,
                wordCount = null,
                notes = "Previously downloaded chapter metadata."
            )
        }

    private fun String.toStoryStatus(): StoryStatus = when (uppercase()) {
        "COMPLETE", "COMPLETED" -> StoryStatus.COMPLETED
        "IN_PROGRESS", "ONGOING" -> StoryStatus.ONGOING
        "HIATUS" -> StoryStatus.HIATUS
        "ABANDONED", "CANCELLED" -> StoryStatus.CANCELLED
        else -> StoryStatus.UNKNOWN
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
