package com.universalmedialibrary.ui.media.viewmodels

import android.content.Context
import androidx.lifecycle.SavedStateHandle
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.repository.AudiobookRepository
import com.universalmedialibrary.data.repository.MusicRepository
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.media.SleepTimerManager
import com.universalmedialibrary.services.media.SleepTimerState
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.music.AdvancedPlaybackState
import com.universalmedialibrary.services.music.TrackInfo
import com.universalmedialibrary.testing.MainDispatcherRule
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.mockk
import io.mockk.slot
import io.mockk.verify
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Rule
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class AudioPlayerViewModelSleepTimerTest {

    private companion object {
        const val TEST_DURATION_MINUTES = 30
        const val TEST_VOLUME = 0.6f
        const val TEST_NEGATIVE_MINUTES = -5
        const val TEST_TOTAL_SECONDS = 300L
        const val TEST_REMAINING_SECONDS = 150L
        const val TEST_REMAINING_MS = 150_000L
    }

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private val context: Context = mockk(relaxed = true)
    private val musicPlayerService: AdvancedMusicPlayerService = mockk(relaxed = true)
    private val sleepTimerManager: SleepTimerManager = mockk(relaxed = true)
    private val musicRepository: MusicRepository = mockk(relaxed = true)
    private val audiobookRepository: AudiobookRepository = mockk(relaxed = true)
    private val podcastRepository: PodcastRepository = mockk(relaxed = true)

    private val currentTrackFlow = MutableStateFlow<TrackInfo?>(null)
    private val playbackStateFlow = MutableStateFlow(AdvancedPlaybackState())
    private val queueFlow = MutableStateFlow<List<TrackInfo>>(emptyList())
    private val sleepTimerStateFlow = MutableStateFlow(SleepTimerState())

    private lateinit var viewModel: AudioPlayerViewModel

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)

        every { musicPlayerService.currentTrack } returns currentTrackFlow
        every { musicPlayerService.playbackState } returns playbackStateFlow
        every { musicPlayerService.queue } returns queueFlow
        every { sleepTimerManager.state } returns sleepTimerStateFlow

        val savedStateHandle = SavedStateHandle(mapOf("playerType" to "music"))
        viewModel = AudioPlayerViewModel(
            savedStateHandle = savedStateHandle,
            context = context,
            musicPlayerService = musicPlayerService,
            sleepTimerManager = sleepTimerManager,
            musicRepository = musicRepository,
            audiobookRepository = audiobookRepository,
            podcastRepository = podcastRepository
        )
    }

    @Test
    fun setSleepTimer_positiveMinutes_startsTimerWithFadeOutAndPause() = runTest {
        val volumeChangeSlot = slot<(Float) -> Unit>()
        val completeSlot = slot<() -> Unit>()

        every {
            sleepTimerManager.startTimer(
                durationMinutes = TEST_DURATION_MINUTES,
                fadeOut = true,
                onVolumeChange = capture(volumeChangeSlot),
                onComplete = capture(completeSlot)
            )
        } returns Unit

        viewModel.setSleepTimer(TEST_DURATION_MINUTES)

        verify(exactly = 1) {
            sleepTimerManager.startTimer(
                durationMinutes = TEST_DURATION_MINUTES,
                fadeOut = true,
                onVolumeChange = any(),
                onComplete = any()
            )
        }

        // Verify volume attenuation callback forwards to musicPlayerService
        volumeChangeSlot.captured.invoke(TEST_VOLUME)
        verify(exactly = 1) { musicPlayerService.setVolume(TEST_VOLUME) }

        // Verify completion callback pauses playback
        completeSlot.captured.invoke()
        verify(exactly = 1) { musicPlayerService.pause() }
    }

    @Test
    fun setSleepTimer_zeroMinutes_cancelsTimer() = runTest {
        viewModel.setSleepTimer(0)

        verify(exactly = 1) { sleepTimerManager.stopTimer() }
        verify(exactly = 0) { sleepTimerManager.startTimer(any(), any(), any(), any(), any()) }
        verify(exactly = 0) { sleepTimerManager.startEndOfChapterTimer(any()) }
    }

    @Test
    fun setSleepTimer_negativeOneMinutes_startsEndOfChapterTimerWithPause() = runTest {
        val completeSlot = slot<() -> Unit>()
        every {
            sleepTimerManager.startEndOfChapterTimer(onComplete = capture(completeSlot))
        } returns Unit

        viewModel.setSleepTimer(-1)

        verify(exactly = 1) {
            sleepTimerManager.startEndOfChapterTimer(onComplete = any())
        }
        verify(exactly = 0) { sleepTimerManager.startTimer(any(), any(), any(), any(), any()) }

        // Verify end-of-chapter completion pauses playback
        completeSlot.captured.invoke()
        verify(exactly = 1) { musicPlayerService.pause() }
    }

    @Test
    fun setSleepTimer_otherNegativeMinutes_cancelsTimer() = runTest {
        viewModel.setSleepTimer(TEST_NEGATIVE_MINUTES)

        verify(exactly = 1) { sleepTimerManager.stopTimer() }
    }

    @Test
    fun cancelSleepTimer_invokesStopTimer() = runTest {
        viewModel.cancelSleepTimer()

        verify(exactly = 1) { sleepTimerManager.stopTimer() }
    }

    @Test
    fun sleepTimerStateUpdates_reflectInUiState() = runTest {
        advanceUntilIdle()
        assertThat(viewModel.uiState.value.sleepTimerActive).isFalse()
        assertThat(viewModel.uiState.value.sleepTimerRemaining).isEqualTo(0L)

        // Simulate active timer with remaining seconds
        sleepTimerStateFlow.value = SleepTimerState(
            isActive = true,
            isPaused = false,
            totalSeconds = TEST_TOTAL_SECONDS,
            remainingSeconds = TEST_REMAINING_SECONDS,
            fadeOut = true
        )
        advanceUntilIdle()

        assertThat(viewModel.uiState.value.sleepTimerActive).isTrue()
        assertThat(viewModel.uiState.value.sleepTimerRemaining).isEqualTo(TEST_REMAINING_MS)

        // Simulate timer stopped
        sleepTimerStateFlow.value = SleepTimerState()
        advanceUntilIdle()

        assertThat(viewModel.uiState.value.sleepTimerActive).isFalse()
        assertThat(viewModel.uiState.value.sleepTimerRemaining).isEqualTo(0L)
    }
}
