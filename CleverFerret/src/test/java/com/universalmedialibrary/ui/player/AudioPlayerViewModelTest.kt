package com.universalmedialibrary.ui.player

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.testing.MainDispatcherRule
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.io.File

@OptIn(ExperimentalCoroutinesApi::class)
@RunWith(RobolectricTestRunner::class)
@Config(application = android.app.Application::class, manifest = Config.NONE, sdk = [28])
class AudioPlayerViewModelTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private lateinit var context: Context
    private lateinit var viewModel: AudioPlayerViewModel

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        viewModel = AudioPlayerViewModel(mainDispatcherRule.testDispatcher)
    }

    @Test
    fun loadAudio_handlesNonExistentFileGracefully() = runTest {
        val nonExistentPath = File(context.cacheDir, "non_existent_track.mp3").absolutePath

        viewModel.loadAudio(context, nonExistentPath)
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertThat(state.title).isEqualTo("non_existent_track")
        assertThat(state.artist).isNull()
        assertThat(state.album).isNull()
        assertThat(state.coverArtUri).isNull()
        assertThat(state.isLoaded).isTrue()
    }

    @Test
    fun setQueue_extractsMetadataForFirstItemWithoutBlocking() = runTest {
        val testFile1 = File(context.cacheDir, "test_track_1.mp3").apply { createNewFile() }
        val testFile2 = File(context.cacheDir, "test_track_2.mp3").apply { createNewFile() }

        viewModel.setQueue(context, listOf(testFile1.absolutePath, testFile2.absolutePath), startIndex = 0)
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertThat(state.title).isEqualTo("test_track_1")
        assertThat(state.isLoaded).isTrue()

        testFile1.delete()
        testFile2.delete()
    }

    @Test
    fun togglePlayPause_andVolumeUpdates_mutateState() = runTest {
        viewModel.setVolume(0.5f)
        assertThat(viewModel.uiState.value.volume).isEqualTo(0.5f)

        viewModel.toggleShuffle()
        assertThat(viewModel.uiState.value.isShuffleEnabled).isTrue()

        viewModel.toggleRepeat()
        assertThat(viewModel.uiState.value.repeatMode).isEqualTo(RepeatMode.ALL)
    }

    @Test
    fun getReconnectDelayMs_exponentialProgression() {
        assertThat(AudioPlayerViewModel.getReconnectDelayMs(1)).isEqualTo(1000L)
        assertThat(AudioPlayerViewModel.getReconnectDelayMs(2)).isEqualTo(2000L)
        assertThat(AudioPlayerViewModel.getReconnectDelayMs(3)).isEqualTo(4000L)
    }

    @Test
    fun handlePlayerError_transientNetworkError_maintainsBufferingAndRetainsPosition() = runTest {
        viewModel.currentMediaUri = android.net.Uri.parse("https://stream.example.com/live.mp3")
        viewModel.lastPlaybackPosition = 15000L

        val error = androidx.media3.common.PlaybackException(
            "Connection reset",
            null,
            androidx.media3.common.PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_TIMEOUT
        )
        viewModel.handlePlayerError(error)

        assertThat(viewModel.reconnectAttempts).isEqualTo(1)
        assertThat(viewModel.lastPlaybackPosition).isEqualTo(15000L)
        assertThat(viewModel.isReconnecting).isTrue()

        val state = viewModel.uiState.value
        assertThat(state.isLoading).isTrue()
        assertThat(state.isReconnecting).isTrue()
        assertThat(state.error).isNull()
    }

    @Test
    fun handlePlayerError_localFile_bypassesRetryAndPropagatesError() = runTest {
        viewModel.currentMediaUri = android.net.Uri.parse("file:///data/local/sample.mp3")
        viewModel.lastPlaybackPosition = 5000L

        val error = androidx.media3.common.PlaybackException(
            "File read error",
            null,
            androidx.media3.common.PlaybackException.ERROR_CODE_IO_UNSPECIFIED
        )
        viewModel.handlePlayerError(error)

        assertThat(viewModel.reconnectAttempts).isEqualTo(0)
        assertThat(viewModel.isReconnecting).isFalse()

        val state = viewModel.uiState.value
        assertThat(state.isLoading).isFalse()
        assertThat(state.isReconnecting).isFalse()
        assertThat(state.error).isEqualTo("Playback error: File read error")
    }

    @Test
    fun handlePlayerError_exhaustedRetries_propagatesFinalError() = runTest {
        viewModel.currentMediaUri = android.net.Uri.parse("https://stream.example.com/live.mp3")
        viewModel.reconnectAttempts = 3

        val error = androidx.media3.common.PlaybackException(
            "Host unreachable",
            null,
            androidx.media3.common.PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_FAILED
        )
        viewModel.handlePlayerError(error)

        assertThat(viewModel.reconnectAttempts).isEqualTo(0)
        assertThat(viewModel.isReconnecting).isFalse()

        val state = viewModel.uiState.value
        assertThat(state.isLoading).isFalse()
        assertThat(state.isReconnecting).isFalse()
        assertThat(state.error).isEqualTo("Playback error: Host unreachable")
    }

    @Test
    fun togglePlayPause_cancelsActiveReconnect() = runTest {
        viewModel.currentMediaUri = android.net.Uri.parse("https://stream.example.com/live.mp3")
        val error = androidx.media3.common.PlaybackException(
            "Timeout",
            null,
            androidx.media3.common.PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_TIMEOUT
        )
        viewModel.handlePlayerError(error)
        assertThat(viewModel.isReconnecting).isTrue()

        viewModel.togglePlayPause()
        assertThat(viewModel.isReconnecting).isFalse()
        assertThat(viewModel.reconnectJob).isNull()
    }
}
