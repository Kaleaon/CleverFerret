package com.universalmedialibrary.ui.media.viewmodels

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.PodcastEpisodeDao
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.podcast.Podcast
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
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
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.UnconfinedTestDispatcher
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Test
import java.io.IOException

@OptIn(ExperimentalCoroutinesApi::class)
class MediaPodcastViewModelTest {

    @MockK
    lateinit var podcastRepository: PodcastRepository

    @MockK
    lateinit var episodeDao: PodcastEpisodeDao

    @MockK
    lateinit var downloadManager: PodcastDownloadManager

    @MockK
    lateinit var podcastService: PodcastService

    private val dispatcher = StandardTestDispatcher()
    private lateinit var viewModel: PodcastViewModel

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        Dispatchers.setMain(dispatcher)

        every { podcastRepository.getSubscribedPodcasts() } returns flowOf(emptyList())
        every { podcastRepository.getNewEpisodes() } returns flowOf(emptyList())
        every { podcastRepository.getQueuedEpisodes() } returns flowOf(emptyList())
        every { podcastRepository.getDownloadedEpisodes() } returns flowOf(emptyList())
        every { downloadManager.downloadProgress } returns MutableStateFlow(emptyMap())

        viewModel = PodcastViewModel(
            podcastRepository = podcastRepository,
            episodeDao = episodeDao,
            downloadManager = downloadManager,
            podcastService = podcastService
        )
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun importOpml_withValidContent_invokesPodcastServiceAndEmitsSuccessMessage() = runTest {
        backgroundScope.launch(UnconfinedTestDispatcher(testScheduler)) {
            viewModel.uiState.collect {}
        }
        val opmlContent = "<opml version=\"2.0\"><head><title>Feeds</title></head><body></body></opml>"
        val imported = listOf(
            Podcast(id = 1L, title = "Imported Show", feedUrl = "https://example.com/rss")
        )
        coEvery { podcastService.importOPML(opmlContent) } returns imported

        val message = async { viewModel.userMessages.first() }
        viewModel.importOpml(opmlContent)
        advanceUntilIdle()

        assertThat(message.await()).isEqualTo("OPML imported successfully")
        coVerify(exactly = 1) { podcastService.importOPML(opmlContent) }
        assertThat(viewModel.uiState.value.isLoading).isFalse()
    }

    @Test
    fun importOpml_withBlankContent_emitsErrorMessageWithoutCallingService() = runTest {
        backgroundScope.launch(UnconfinedTestDispatcher(testScheduler)) {
            viewModel.uiState.collect {}
        }
        val message = async { viewModel.userMessages.first() }
        viewModel.importOpml("   ")
        advanceUntilIdle()

        assertThat(message.await()).isEqualTo("Failed to import OPML: File is empty")
        coVerify(exactly = 0) { podcastService.importOPML(any()) }
        assertThat(viewModel.uiState.value.isLoading).isFalse()
    }

    @Test
    fun importOpml_whenServiceThrowsException_catchesAndEmitsFailureMessage() = runTest {
        backgroundScope.launch(UnconfinedTestDispatcher(testScheduler)) {
            viewModel.uiState.collect {}
        }
        val malformedOpml = "<bad-xml>"
        coEvery { podcastService.importOPML(malformedOpml) } throws IOException("Corrupted input stream")

        val message = async { viewModel.userMessages.first() }
        viewModel.importOpml(malformedOpml)
        advanceUntilIdle()

        assertThat(message.await()).isEqualTo("Failed to import OPML: Corrupted input stream")
        assertThat(viewModel.uiState.value.isLoading).isFalse()
    }

    @Test
    fun exportOpml_withSubscribedPodcasts_callsServiceAndReturnsContent() = runTest {
        val podcasts = listOf(
            Podcast(id = 2L, title = "Export Show", feedUrl = "https://example.com/export.xml")
        )
        val expectedOpml = "<opml>export</opml>"
        every { podcastRepository.getSubscribedPodcasts() } returns flowOf(podcasts)
        every { podcastService.exportToOPML(podcasts) } returns expectedOpml

        val result = viewModel.exportOpml()

        assertThat(result).isEqualTo(expectedOpml)
        verify(exactly = 1) { podcastService.exportToOPML(podcasts) }
    }
}
