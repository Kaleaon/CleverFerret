package com.universalmedialibrary.ui.podcast

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.DownloadSafetyChecker
import com.universalmedialibrary.services.podcast.Podcast
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
import com.universalmedialibrary.services.podcast.PodcastEpisode
import com.universalmedialibrary.services.podcast.PodcastSearchResult
import com.universalmedialibrary.services.podcast.PodcastService
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.verify
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.async
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class PodcastViewModelTest {

    @MockK
    lateinit var repository: PodcastRepository

    @MockK
    lateinit var downloadManager: PodcastDownloadManager

    @MockK
    lateinit var downloadSafetyChecker: DownloadSafetyChecker

    @MockK
    lateinit var podcastService: PodcastService

    private val dispatcher = StandardTestDispatcher()
    private lateinit var viewModel: PodcastViewModel

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        Dispatchers.setMain(dispatcher)

        every { repository.getSubscribedPodcasts() } returns flowOf(emptyList())
        every { repository.getDownloadedEpisodes() } returns flowOf(emptyList())
        every { downloadManager.downloadProgress } returns MutableStateFlow(emptyMap())

        viewModel = PodcastViewModel(
            repository = repository,
            downloadManager = downloadManager,
            downloadSafetyChecker = downloadSafetyChecker,
            podcastService = podcastService
        )
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `searchPodcasts excludes results without valid feed URL`() = runTest {
        coEvery { repository.searchPodcastsOnline("android") } returns listOf(
            searchResult(id = "valid", feedUrl = "https://example.com/feed.xml"),
            searchResult(id = "blank", feedUrl = "  "),
            searchResult(id = "invalid", feedUrl = "not-a-url")
        )

        viewModel.searchPodcasts("android")
        advanceUntilIdle()

        val resultIds = viewModel.uiState.value.searchResults.map { it.id }
        assertThat(resultIds).containsExactly("valid")
    }

    @Test
    fun `subscribeFromSearchResult with blank feed emits snackbar message and skips modal error`() = runTest {
        val message = async { viewModel.userMessages.first() }
        var callbackResult: Boolean? = null

        viewModel.subscribeFromSearchResult(searchResult(id = "blank", feedUrl = "")) {
            callbackResult = it
        }
        advanceUntilIdle()

        assertThat(message.await()).isEqualTo("Cannot subscribe: this result is missing a valid feed URL.")
        assertThat(viewModel.uiState.value.error).isNull()
        assertThat(viewModel.uiState.value.isLoading).isFalse()
        assertThat(callbackResult).isFalse()
        coVerify(exactly = 0) { repository.subscribeToPodcast(any()) }
    }

    @Test
    fun `missing local file exposes re-download recovery action`() = runTest {
        val podcast = Podcast(id = 7L, title = "Podcast", feedUrl = "https://example.com/feed")
        val episode = PodcastEpisode(
            id = 17L,
            podcastId = 7L,
            guid = "ep-17",
            title = "Episode 17",
            audioUrl = "https://example.com/audio.mp3",
            publishDate = 10L,
            downloaded = true,
            localFilePath = "/missing/audio.mp3"
        )
        every { repository.getSubscribedPodcasts() } returns flowOf(listOf(podcast))
        every { repository.getDownloadedEpisodes() } returns flowOf(listOf(episode))
        every { repository.getEpisodesByPodcast(7L) } returns flowOf(listOf(episode))
        every { downloadManager.downloadProgress } returns MutableStateFlow(emptyMap())

        val localViewModel = PodcastViewModel(repository, downloadManager, downloadSafetyChecker, podcastService)
        advanceUntilIdle()

        val recoveredEpisode = localViewModel.uiState.value.allEpisodes.first { it.id == 17L }
        assertThat(recoveredEpisode.playbackReady).isFalse()
        assertThat(recoveredEpisode.playbackFailureReason).contains("Re-download")
        assertThat(recoveredEpisode.recoveryActionLabel).isEqualTo("Re-download")
    }

    @Test
    fun `exportOpml calls PodcastService exportToOPML with subscribed podcasts and returns OPML content`() = runTest {
        val podcasts = listOf(
            Podcast(id = 1L, title = "Test Podcast", feedUrl = "https://example.com/feed.xml")
        )
        val expectedOpml = "<opml version=\"2.0\"><head><title>Podcasts</title></head><body><outline text=\"Test Podcast\" xmlUrl=\"https://example.com/feed.xml\"/></body></opml>"
        every { repository.getSubscribedPodcasts() } returns flowOf(podcasts)
        every { podcastService.exportToOPML(podcasts) } returns expectedOpml

        val result = viewModel.exportOpml()

        assertThat(result).isEqualTo(expectedOpml)
        verify { podcastService.exportToOPML(podcasts) }
    }

    @Test
    fun `importOpml calls PodcastService importOPML and emits success message`() = runTest {
        val opmlContent = "<opml version=\"2.0\">...</opml>"
        val importedPodcasts = listOf(
            Podcast(id = 1L, title = "Imported Podcast", feedUrl = "https://example.com/imported.xml")
        )
        coEvery { podcastService.importOPML(opmlContent) } returns importedPodcasts

        val message = async { viewModel.userMessages.first() }
        viewModel.importOpml(opmlContent)
        advanceUntilIdle()

        assertThat(message.await()).isEqualTo("OPML imported successfully")
        coVerify { podcastService.importOPML(opmlContent) }
    }

    private fun searchResult(id: String, feedUrl: String) = PodcastSearchResult(
        id = id,
        title = "Podcast $id",
        description = null,
        author = null,
        imageUrl = null,
        feedUrl = feedUrl,
        category = null,
        episodeCount = null,
        lastEpisodeDate = null,
        source = "test"
    )
}
