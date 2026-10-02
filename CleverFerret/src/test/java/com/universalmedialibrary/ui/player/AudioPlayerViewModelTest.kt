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
@Config(manifest = Config.NONE)
class AudioPlayerViewModelTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private lateinit var context: Context
    private lateinit var viewModel: AudioPlayerViewModel

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        viewModel = AudioPlayerViewModel()
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
}
