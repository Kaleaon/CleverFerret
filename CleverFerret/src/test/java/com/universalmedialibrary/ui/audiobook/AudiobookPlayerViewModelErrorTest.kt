package com.universalmedialibrary.ui.audiobook

import android.database.sqlite.SQLiteException
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.audiobook.AudiobookBookmark
import com.universalmedialibrary.services.audiobook.AudiobookService
import com.universalmedialibrary.services.audiobook.SynchronizedReadingService
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.testing.MainDispatcherRule
import com.universalmedialibrary.utils.UserFriendlyErrorMapper
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Rule
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class AudiobookPlayerViewModelErrorTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private val audiobookService: AudiobookService = mockk(relaxed = true)
    private val synchronizedReadingService: SynchronizedReadingService = mockk(relaxed = true)
    private val exoPlayerService: ExoPlayerService = mockk(relaxed = true)
    private val mediaRepository: MediaRepository = mockk(relaxed = true)
    private val errorMapper = UserFriendlyErrorMapper()

    @Test
    fun deleteBookmark_onDatabaseError_emitsUserFriendlySnackbarEvent() = runTest {
        val bookmark = AudiobookBookmark(id = 1L, positionMs = 12000L)
        coEvery { audiobookService.deleteBookmark(any()) } throws SQLiteException("Disk write failed")

        val viewModel = AudiobookPlayerViewModel(
            audiobookService = audiobookService,
            synchronizedReadingService = synchronizedReadingService,
            exoPlayerService = exoPlayerService,
            mediaRepository = mediaRepository,
            errorMapper = errorMapper
        )

        var emittedEvent: UiEvent? = null
        val job = launch {
            viewModel.uiEvents.collect {
                emittedEvent = it
            }
        }

        viewModel.deleteBookmark(bookmark)
        advanceUntilIdle()

        assertEquals(UiEvent.ShowSnackbar("Database operation failed. Please try again."), emittedEvent)
        job.cancel()
    }
}
