package com.universalmedialibrary.ui.podcast

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.DownloadSafetyChecker
import com.universalmedialibrary.services.podcast.Podcast
import com.universalmedialibrary.services.podcast.PodcastEpisode
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
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

    private val dispatcher = StandardTestDispatcher()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        Dispatchers.setMain(dispatcher)
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
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

        val viewModel = PodcastViewModel(repository, downloadManager, downloadSafetyChecker)
        advanceUntilIdle()

        val recoveredEpisode = viewModel.uiState.value.allEpisodes.first { it.id == 17L }
        assertThat(recoveredEpisode.playbackReady).isFalse()
        assertThat(recoveredEpisode.playbackFailureReason).contains("Re-download")
        assertThat(recoveredEpisode.recoveryActionLabel).isEqualTo("Re-download")
    }
}
