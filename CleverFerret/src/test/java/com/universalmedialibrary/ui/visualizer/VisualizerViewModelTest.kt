package com.universalmedialibrary.ui.visualizer

import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.cast.CastState
import com.universalmedialibrary.services.cast.ChromecastManager
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.visualizer.AudioVisualizerService
import com.universalmedialibrary.services.visualizer.VisualizerState
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.verify
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.advanceTimeBy
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class VisualizerViewModelTest {

    @MockK
    lateinit var audioVisualizerService: AudioVisualizerService

    @MockK
    lateinit var chromecastManager: ChromecastManager

    @MockK
    lateinit var audioPlaybackManager: AudioPlaybackManager

    @MockK
    lateinit var exoPlayerService: ExoPlayerService

    @MockK
    lateinit var advancedMusicPlayerService: AdvancedMusicPlayerService

    private val dispatcher = StandardTestDispatcher()
    private val visualizerStateFlow = MutableStateFlow(VisualizerState())
    private val subscriptionCountFlow = MutableStateFlow(0)
    private val castStateFlow = MutableStateFlow(CastState())
    private val isEnabledFlow = MutableStateFlow(false)
    private val beatDetectedFlow = MutableStateFlow(false)

    private lateinit var viewModel: VisualizerViewModel

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        Dispatchers.setMain(dispatcher)

        every { audioVisualizerService.visualizerState } returns visualizerStateFlow
        every { audioVisualizerService.subscriptionCount } returns subscriptionCountFlow
        every { chromecastManager.castState } returns castStateFlow
        every { audioVisualizerService.isEnabled } returns isEnabledFlow
        every { audioVisualizerService.beatDetected } returns beatDetectedFlow

        every { advancedMusicPlayerService.getExoPlayer() } returns null
        every { exoPlayerService.getPlayer() } returns null
        every { audioPlaybackManager.exoPlayer } returns null

        viewModel = VisualizerViewModel(
            audioVisualizerService,
            chromecastManager,
            audioPlaybackManager,
            exoPlayerService,
            advancedMusicPlayerService
        )
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `chromecast visualizer updates do not run when visualizerState has no subscribers`() = runTest {
        castStateFlow.value = CastState(isConnected = true)
        viewModel.initialize()

        advanceTimeBy(2000)

        verify(exactly = 0) {
            chromecastManager.updateVisualizerData(any(), any(), any(), any())
        }
    }

    @Test
    fun `chromecast visualizer updates execute when visualizerState is subscribed and cast is connected`() = runTest {
        castStateFlow.value = CastState(isConnected = true)
        subscriptionCountFlow.value = 1
        viewModel.initialize()

        advanceTimeBy(1000)

        verify(atLeast = 1) {
            chromecastManager.updateVisualizerData(any(), any(), any(), any())
        }
    }

    @Test
    fun `chromecast visualizer updates stop when no Chromecast device is connected`() = runTest {
        castStateFlow.value = CastState(isConnected = false)
        subscriptionCountFlow.value = 1
        viewModel.initialize()

        advanceTimeBy(1000)

        verify(exactly = 0) {
            chromecastManager.updateVisualizerData(any(), any(), any(), any())
        }
    }
}
