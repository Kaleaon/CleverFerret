package com.universalmedialibrary.ui.podcast

import android.net.Uri
import androidx.media3.exoplayer.ExoPlayer
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.preferences.AudioPlaybackPreferences
import com.universalmedialibrary.data.preferences.AudioPlaybackPreferencesStore
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.podcast.AdvancedPodcastPlayerService
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
import com.universalmedialibrary.services.podcast.PodcastEpisode
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import io.mockk.mockkStatic
import io.mockk.unmockkStatic
import io.mockk.slot
import io.mockk.verify
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

    companion object {
        private const val INITIAL_POS_10K = 10000L
        private const val INITIAL_POS_20K = 20000L
        private const val INITIAL_POS_90K = 90000L
        private const val DURATION_100K = 100000L
        private const val EXPECTED_POS_40K = 40000L
        private const val EXPECTED_POS_30K = 30000L
        private const val EXPECTED_POS_25K = 25000L
        private const val CUSTOM_FORWARD_SEC = 45
        private const val CUSTOM_BACKWARD_SEC = 60
        private const val CUSTOM_FORWARD_10 = 10
        private const val CUSTOM_BACKWARD_5 = 5
    }

    @MockK
    lateinit var repository: PodcastRepository

    @MockK
    lateinit var audioPlaybackManager: AudioPlaybackManager

    @MockK
    lateinit var downloadManager: PodcastDownloadManager

    @MockK
    lateinit var preferencesStore: AudioPlaybackPreferencesStore

    @MockK
    lateinit var advancedPlayerService: AdvancedPodcastPlayerService

    private lateinit var exoPlayer: ExoPlayer
    private val preferencesFlow = MutableStateFlow(AudioPlaybackPreferences())
    private val dispatcher = StandardTestDispatcher()
    private lateinit var viewModel: PodcastPlayerViewModel

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        exoPlayer = mockk(relaxed = true)
        mockkStatic(Uri::class)
        every { Uri.parse(any()) } answers {
            val uriString = firstArg<String>()
            val uri = mockk<Uri>()
            every { uri.toString() } returns uriString
            uri
        }
        Dispatchers.setMain(dispatcher)

        every { audioPlaybackManager.state } returns MutableStateFlow(AudioPlaybackManager.AudioState())
        every { audioPlaybackManager.exoPlayer } returns exoPlayer
        every { preferencesStore.preferences } returns preferencesFlow

        viewModel = PodcastPlayerViewModel(
            repository = repository,
            audioPlaybackManager = audioPlaybackManager,
            downloadManager = downloadManager,
            preferencesStore = preferencesStore,
            advancedPlayerService = advancedPlayerService
        )
    }

    @After
    fun tearDown() {
        unmockkStatic(Uri::class)
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

    @Test
    fun `skipForward seeks forward by default 30s and syncs to advancedPlayerService`() = runTest {
        val episode = PodcastEpisode(
            id = 125L,
            podcastId = 1L,
            guid = "guid-125",
            title = "Episode 125",
            audioUrl = "https://example.com/stream.mp3",
            publishDate = 0L,
            duration = DURATION_100K
        )
        every { repository.getEpisodeById(125L) } returns flowOf(episode)
        viewModel.loadEpisode(125L)
        advanceUntilIdle()

        viewModel.seekTo(INITIAL_POS_10K)
        viewModel.skipForward()

        verify { exoPlayer.seekTo(EXPECTED_POS_40K) }
        verify { advancedPlayerService.skipForward(PodcastPlayerViewModel.DEFAULT_FORWARD_SKIP_SEC) }
        assertThat(viewModel.uiState.value.currentPosition).isEqualTo(EXPECTED_POS_40K)
    }

    @Test
    fun `skipBackward seeks backward by default 15s and clamps to zero`() = runTest {
        viewModel.seekTo(INITIAL_POS_10K)
        viewModel.skipBackward()

        verify { exoPlayer.seekTo(0L) }
        verify { advancedPlayerService.skipBackward(PodcastPlayerViewModel.DEFAULT_BACKWARD_SKIP_SEC) }
        assertThat(viewModel.uiState.value.currentPosition).isEqualTo(0L)
    }

    @Test
    fun `skipForward clamps to total episode duration`() = runTest {
        val episode = PodcastEpisode(
            id = 126L,
            podcastId = 1L,
            guid = "guid-126",
            title = "Episode 126",
            audioUrl = "https://example.com/stream.mp3",
            publishDate = 0L,
            duration = DURATION_100K
        )
        every { repository.getEpisodeById(126L) } returns flowOf(episode)
        viewModel.loadEpisode(126L)
        advanceUntilIdle()

        viewModel.seekTo(INITIAL_POS_90K)
        viewModel.skipForward()

        verify { exoPlayer.seekTo(DURATION_100K) }
        assertThat(viewModel.uiState.value.currentPosition).isEqualTo(DURATION_100K)
    }

    @Test
    fun `preferences flow update updates UI state skip intervals and syncs to advanced service`() = runTest {
        advanceUntilIdle()
        preferencesFlow.value = AudioPlaybackPreferences(
            skipForwardIntervalSec = CUSTOM_FORWARD_SEC,
            skipBackwardIntervalSec = CUSTOM_BACKWARD_SEC
        )
        advanceUntilIdle()

        assertThat(viewModel.uiState.value.skipForwardIntervalSec).isEqualTo(CUSTOM_FORWARD_SEC)
        assertThat(viewModel.uiState.value.skipBackwardIntervalSec).isEqualTo(CUSTOM_BACKWARD_SEC)
        verify { advancedPlayerService.setSkipIntervals(CUSTOM_FORWARD_SEC, CUSTOM_BACKWARD_SEC) }
    }

    @Test
    fun `skipForward and skipBackward use updated custom intervals`() = runTest {
        advanceUntilIdle()
        preferencesFlow.value = AudioPlaybackPreferences(
            skipForwardIntervalSec = CUSTOM_FORWARD_10,
            skipBackwardIntervalSec = CUSTOM_BACKWARD_5
        )
        advanceUntilIdle()

        viewModel.seekTo(INITIAL_POS_20K)
        viewModel.skipForward()

        verify { exoPlayer.seekTo(EXPECTED_POS_30K) }
        verify { advancedPlayerService.skipForward(CUSTOM_FORWARD_10) }
        assertThat(viewModel.uiState.value.currentPosition).isEqualTo(EXPECTED_POS_30K)

        viewModel.skipBackward()
        verify { exoPlayer.seekTo(EXPECTED_POS_25K) }
        verify { advancedPlayerService.skipBackward(CUSTOM_BACKWARD_5) }
        assertThat(viewModel.uiState.value.currentPosition).isEqualTo(EXPECTED_POS_25K)
    }
}
