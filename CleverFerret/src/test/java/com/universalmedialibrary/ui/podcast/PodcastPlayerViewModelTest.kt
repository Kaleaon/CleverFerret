package com.universalmedialibrary.ui.podcast

import android.net.Uri
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
import com.universalmedialibrary.services.podcast.PodcastEpisode
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import io.mockk.slot
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
class PodcastPlayerViewModelTest {

    @MockK
    lateinit var repository: PodcastRepository

    @MockK
    lateinit var audioPlaybackManager: AudioPlaybackManager

    @MockK
    lateinit var downloadManager: PodcastDownloadManager

    private val dispatcher = StandardTestDispatcher()
    private lateinit var viewModel: PodcastPlayerViewModel

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        Dispatchers.setMain(dispatcher)

        every { audioPlaybackManager.state } returns MutableStateFlow(com.universalmedialibrary.services.audio.AudioState())
        every { audioPlaybackManager.exoPlayer } returns mockk(relaxed = true)

        viewModel = PodcastPlayerViewModel(
            repository = repository,
            audioPlaybackManager = audioPlaybackManager,
            downloadManager = downloadManager
        )
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `play verifies checksum when episode is downloaded and uses local file if valid`() = runTest {
        val episode = PodcastEpisode(
            id = 123L,
            podcastId = 1L,
            guid = "guid-123",
            title = "Test Episode",
            audioUrl = "https://example.com/audio.mp3",
            publishDate = 0L,
            downloaded = true,
            localFilePath = "/path/to/local.mp3"
        )
        every { repository.getEpisodeById(123L) } returns flowOf(episode)
        coEvery { downloadManager.verifyEpisodeChecksum(123L) } returns true

        viewModel.loadEpisode(123L)
        advanceUntilIdle()

        viewModel.play()
        advanceUntilIdle()

        val uriSlot = slot<Uri>()
        coVerify { downloadManager.verifyEpisodeChecksum(123L) }
        coVerify { audioPlaybackManager.loadSingle(capture(uriSlot), any(), playWhenReady = true) }
        assertThat(uriSlot.captured.toString()).isEqualTo("/path/to/local.mp3")
    }

    @Test
    fun `play falls back to audioUrl when lazy checksum verification fails`() = runTest {
        val episode = PodcastEpisode(
            id = 124L,
            podcastId = 1L,
            guid = "guid-124",
            title = "Corrupt Episode",
            audioUrl = "https://example.com/stream.mp3",
            publishDate = 0L,
            downloaded = true,
            localFilePath = "/path/to/corrupt.mp3"
        )
        every { repository.getEpisodeById(124L) } returns flowOf(episode)
        coEvery { downloadManager.verifyEpisodeChecksum(124L) } returns false

        viewModel.loadEpisode(124L)
        advanceUntilIdle()

        viewModel.play()
        advanceUntilIdle()

        val uriSlot = slot<Uri>()
        coVerify { downloadManager.verifyEpisodeChecksum(124L) }
        coVerify { audioPlaybackManager.loadSingle(capture(uriSlot), any(), playWhenReady = true) }
        assertThat(uriSlot.captured.toString()).isEqualTo("https://example.com/stream.mp3")
    }
}
