package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.SavedStateHandle
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.entity.DownloadedStory
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.local.entity.UnifiedTag
import com.universalmedialibrary.data.repository.MediaItemWithMetadata
import com.universalmedialibrary.data.repository.SearchRepository
import com.universalmedialibrary.data.repository.StoryRepository
import com.universalmedialibrary.data.repository.TagRepository
import com.universalmedialibrary.services.search.UniversalSearchEngine
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import io.mockk.coEvery
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.TestDispatcher
import kotlinx.coroutines.test.advanceTimeBy
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TestWatcher
import org.junit.runner.Description

@OptIn(ExperimentalCoroutinesApi::class)
class UniversalSearchViewModelTest {

    @get:Rule
    val mainDispatcherRule = UniversalSearchMainDispatcherRule()

    @Test
    fun discoveryRoute_serializesQueryParametersCorrectly() {
        val routeWithAllParams = MediaRoutes.discoveryRoute(query = "cyberpunk", tags = "sci-fi,adventure", type = "book")
        assertThat(routeWithAllParams).isEqualTo("discovery?query=cyberpunk&tags=sci-fi%2Cadventure&type=book")

        val routeWithNoParams = MediaRoutes.discoveryRoute()
        assertThat(routeWithNoParams).isEqualTo("discovery")

        val routeWithOnlyQuery = MediaRoutes.discoveryRoute(query = "fantasy")
        assertThat(routeWithOnlyQuery).isEqualTo("discovery?query=fantasy")
    }

    @Test
    fun initialRouteState_parsesSavedStateHandleArguments() = runTest {
        val savedStateHandle = SavedStateHandle(
            mapOf(
                "query" to "dune",
                "tags" to "sci-fi,classic",
                "type" to "book"
            )
        )

        val searchRepo = mockk<SearchRepository>()
        val storyRepo = mockk<StoryRepository>()
        val tagRepo = mockk<TagRepository>()
        val searchEngine = mockk<UniversalSearchEngine>()

        coEvery { searchRepo.searchMedia(any(), any()) } returns emptyList()
        every { storyRepo.getAllStories() } returns flowOf(emptyList())
        every { tagRepo.getPopularTags(any()) } returns flowOf(emptyList())
        every { tagRepo.searchTags(any()) } returns flowOf(emptyList())

        val viewModel = UniversalSearchViewModel(
            savedStateHandle = savedStateHandle,
            searchRepository = searchRepo,
            storyRepository = storyRepo,
            tagRepository = tagRepo,
            universalSearchEngine = searchEngine
        )

        assertThat(viewModel.query.value).isEqualTo("dune")
        assertThat(viewModel.selectedTags.value).containsExactly("sci-fi", "classic")
        assertThat(viewModel.selectedType.value).isEqualTo("BOOK")
    }

    @Test
    fun toggleTag_addsAndRemovesTagsInState() = runTest {
        val savedStateHandle = SavedStateHandle()
        val searchRepo = mockk<SearchRepository>()
        val storyRepo = mockk<StoryRepository>()
        val tagRepo = mockk<TagRepository>()
        val searchEngine = mockk<UniversalSearchEngine>()

        coEvery { searchRepo.searchMedia(any(), any()) } returns emptyList()
        every { storyRepo.getAllStories() } returns flowOf(emptyList())
        every { tagRepo.getPopularTags(any()) } returns flowOf(emptyList())

        val viewModel = UniversalSearchViewModel(
            savedStateHandle = savedStateHandle,
            searchRepository = searchRepo,
            storyRepository = storyRepo,
            tagRepository = tagRepo,
            universalSearchEngine = searchEngine
        )

        viewModel.toggleTag("cyberpunk")
        assertThat(viewModel.selectedTags.value).contains("cyberpunk")

        viewModel.toggleTag("cyberpunk")
        assertThat(viewModel.selectedTags.value).doesNotContain("cyberpunk")
    }

    @Test
    fun multiRepositoryFlowCombination_combinesLibraryMediaAndStoriesAndTags() = runTest {
        val savedStateHandle = SavedStateHandle(mapOf("query" to "war"))

        val searchRepo = mockk<SearchRepository>()
        val storyRepo = mockk<StoryRepository>()
        val tagRepo = mockk<TagRepository>()
        val searchEngine = mockk<UniversalSearchEngine>()

        coEvery { searchRepo.searchMedia("war", any()) } returns listOf(
            mockk<MediaItemWithMetadata>(relaxed = true)
        )

        val dummyStory = DownloadedStory(
            id = "story1",
            title = "War of the Worlds",
            author = "HG Wells",
            site = "Reddit",
            url = "http://example.com",
            siteStoryId = "story1",
            totalChapters = 1,
            lastKnownChapters = 1,
            lastUpdated = System.currentTimeMillis(),
            lastChecked = System.currentTimeMillis(),
            lastDownloaded = System.currentTimeMillis(),
            epubFilePath = "/tmp/story1.epub",
            fileSize = 1000L
        )
        every { storyRepo.getAllStories() } returns flowOf(listOf(dummyStory))

        val dummyTag = UnifiedTag(
            tagId = 1L,
            name = "warfare",
            type = TagType.USER_DEFINED,
            usageCount = 15
        )
        every { tagRepo.getPopularTags(any()) } returns flowOf(listOf(dummyTag))
        every { tagRepo.searchTags("war") } returns flowOf(listOf(dummyTag))

        val viewModel = UniversalSearchViewModel(
            savedStateHandle = savedStateHandle,
            searchRepository = searchRepo,
            storyRepository = storyRepo,
            tagRepository = tagRepo,
            universalSearchEngine = searchEngine
        )

        advanceTimeBy(300)
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertThat(state.libraryResults).hasSize(1)
        assertThat(state.storyResults).hasSize(1)
        assertThat(state.storyResults.first().title).isEqualTo("War of the Worlds")
        assertThat(state.tagResults).hasSize(1)
        assertThat(state.tagResults.first().name).isEqualTo("warfare")
    }
}

@OptIn(ExperimentalCoroutinesApi::class)
class UniversalSearchMainDispatcherRule(
    private val dispatcher: TestDispatcher = StandardTestDispatcher()
) : TestWatcher() {
    override fun starting(description: Description) {
        Dispatchers.setMain(dispatcher)
    }

    override fun finished(description: Description) {
        Dispatchers.resetMain()
    }
}
