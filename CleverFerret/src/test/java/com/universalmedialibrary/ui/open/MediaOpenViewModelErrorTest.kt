package com.universalmedialibrary.ui.open

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.testing.MainDispatcherRule
import com.universalmedialibrary.utils.UserFriendlyErrorMapper
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Rule
import org.junit.Test
import java.io.FileNotFoundException

@OptIn(ExperimentalCoroutinesApi::class)
class MediaOpenViewModelErrorTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private val mediaItemDao: MediaItemDao = mockk(relaxed = true)
    private val musicPlayerService: AdvancedMusicPlayerService = mockk(relaxed = true)
    private val exoPlayerService: ExoPlayerService = mockk(relaxed = true)
    private val errorMapper = UserFriendlyErrorMapper()

    @Test
    fun playAudioFile_onFileNotFound_setsPlainLanguageErrorMessage() = runTest {
        val testItem = MediaItem(itemId = 1L, fileName = "missing.mp3", filePath = "/sdcard/missing.mp3")
        coEvery { musicPlayerService.playTrack(any()) } throws FileNotFoundException("/sdcard/missing.mp3 not found")

        val viewModel = MediaOpenViewModel(
            mediaItemDao = mediaItemDao,
            musicPlayerService = musicPlayerService,
            exoPlayerService = exoPlayerService,
            errorMapper = errorMapper
        )

        viewModel.playAudioFile(testItem)
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertEquals("The system cannot find the selected media file.", state.error)
    }

    @Test
    fun playVideoFile_onFileNotFound_setsPlainLanguageErrorMessage() = runTest {
        val testItem = MediaItem(itemId = 2L, fileName = "video.mp4", filePath = "/sdcard/video.mp4")
        coEvery { exoPlayerService.initialize() } throws FileNotFoundException("/sdcard/video.mp4 missing")

        val viewModel = MediaOpenViewModel(
            mediaItemDao = mediaItemDao,
            musicPlayerService = musicPlayerService,
            exoPlayerService = exoPlayerService,
            errorMapper = errorMapper
        )

        viewModel.playVideoFile(testItem)
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertEquals("The system cannot find the selected media file.", state.error)
    }
}
