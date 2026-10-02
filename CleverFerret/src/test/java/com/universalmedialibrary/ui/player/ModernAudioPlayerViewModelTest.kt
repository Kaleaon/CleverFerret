package com.universalmedialibrary.ui.player

import android.content.Context
import androidx.media3.exoplayer.ExoPlayer
import androidx.test.core.app.ApplicationProvider
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.visualizer.AudioVisualizerService
import com.universalmedialibrary.services.visualizer.VisualizerState
import com.universalmedialibrary.testing.MainDispatcherRule
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@OptIn(ExperimentalCoroutinesApi::class)
@RunWith(RobolectricTestRunner::class)
@Config(manifest = Config.NONE)
class ModernAudioPlayerViewModelTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private lateinit var context: Context
    private lateinit var audioPlaybackManager: AudioPlaybackManager
    private lateinit var mediaRepository: MediaRepository
    private lateinit var audioVisualizerService: AudioVisualizerService
    private lateinit var exoPlayer: ExoPlayer

    private val playbackState = MutableStateFlow(AudioPlaybackManager.AudioPlaybackState())
    private val visualizerState = MutableStateFlow(VisualizerState())

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        audioPlaybackManager = mockk(relaxed = true)
        mediaRepository = mockk(relaxed = true)
        audioVisualizerService = mockk(relaxed = true)
        exoPlayer = mockk(relaxed = true)

        every { audioPlaybackManager.state } returns playbackState
        every { audioPlaybackManager.exoPlayer } returns exoPlayer
        every { audioVisualizerService.visualizerState } returns visualizerState
    }

    @Test
    fun init_observesPlaybackState() = runTest {
        val viewModel = ModernAudioPlayerViewModel(
            audioPlaybackManager,
            mediaRepository,
            audioVisualizerService,
            context
        )
        advanceUntilIdle()

        playbackState.value = AudioPlaybackManager.AudioPlaybackState(
            title = "Test Song",
            artist = "Test Artist",
            duration = 180000L,
            isPlaying = true
        )
        advanceUntilIdle()

        val uiState = viewModel.uiState.value
        assertThat(uiState.currentTrack?.title).isEqualTo("Test Song")
        assertThat(uiState.currentTrack?.artist).isEqualTo("Test Artist")
        assertThat(uiState.isPlaying).isTrue()
    }

    @Test
    fun partyMode_togglesCorrectly() = runTest {
        val viewModel = ModernAudioPlayerViewModel(
            audioPlaybackManager,
            mediaRepository,
            audioVisualizerService,
            context
        )
        advanceUntilIdle()

        assertThat(viewModel.uiState.value.partyModeEnabled).isFalse()
        viewModel.togglePartyMode()
        assertThat(viewModel.uiState.value.partyModeEnabled).isTrue()
    }
}
