package com.universalmedialibrary.ui.reader

import com.universalmedialibrary.services.epub.EpubReaderService
import com.universalmedialibrary.services.epub.EpubReaderState
import com.universalmedialibrary.services.reader.AnnotationService
import com.universalmedialibrary.testing.MainDispatcherRule
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

private const val DAY_MILLIS = 86_400_000L
private const val EPOCH_BASE = 20_000L
private const val TEN_SECONDS_MS = 10_000L
private const val FORTY_FIVE_SECONDS_MS = 45_000L
private const val FIVE_MINUTES_MS = 300_000L
private const val ONE_SECOND_MS = 1000L
private const val TEST_ITEM_ID_A = 42L
private const val TEST_ITEM_ID_B = 100L
private const val TOTAL_CHAPTERS_COUNT = 10
private const val FIVE_MINUTES = 5

@OptIn(ExperimentalCoroutinesApi::class)
@RunWith(RobolectricTestRunner::class)
@Config(application = android.app.Application::class, sdk = [34])
class EPUBReaderViewModelSessionTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private val epubReaderService: EpubReaderService = mockk(relaxed = true)
    private val annotationService: AnnotationService = mockk(relaxed = true)
    private val readerStateFlow = MutableStateFlow(
        EpubReaderState(
            isLoaded = true,
            currentChapter = 1,
            totalChapters = TOTAL_CHAPTERS_COUNT
        )
    )

    private lateinit var viewModel: EPUBReaderViewModel

    @Before
    fun setup() {
        every { epubReaderService.readerState } returns readerStateFlow
        coEvery { epubReaderService.loadEPUB(any<android.net.Uri>()) } returns true
        coEvery { epubReaderService.loadEPUB(any<java.io.File>()) } returns true
        viewModel = EPUBReaderViewModel(epubReaderService, annotationService)
    }

    @Test
    fun recordActiveSession_underThirtySeconds_doesNotRecordSession() = runTest {
        viewModel.ioScope = this
        val startTime = EPOCH_BASE * DAY_MILLIS + ONE_SECOND_MS
        val currentTime = startTime + TEN_SECONDS_MS

        viewModel.currentItemId = TEST_ITEM_ID_A
        viewModel.sessionStartTime = startTime

        viewModel.recordActiveSession(currentTime = currentTime)
        advanceUntilIdle()

        coVerify(exactly = 0) {
            annotationService.recordReadingSession(any(), any(), any(), any(), any(), any(), any(), any())
        }
    }

    @Test
    fun recordActiveSession_overThirtySeconds_recordsReadingSession() = runTest {
        viewModel.ioScope = this
        val startTime = EPOCH_BASE * DAY_MILLIS + ONE_SECOND_MS
        val currentTime = startTime + FORTY_FIVE_SECONDS_MS

        viewModel.currentItemId = TEST_ITEM_ID_A
        viewModel.sessionStartTime = startTime

        viewModel.recordActiveSession(currentTime = currentTime)
        advanceUntilIdle()

        coVerify(atLeast = 1) {
            annotationService.recordReadingSession(
                itemId = TEST_ITEM_ID_A,
                readingTimeMinutes = 1,
                pagesRead = any(),
                chaptersCompleted = any(),
                wordsRead = any(),
                startProgress = any(),
                endProgress = any(),
                date = EPOCH_BASE * DAY_MILLIS
            )
        }
    }

    @Test
    fun recordActiveSession_midnightTransition_attributesTimeWithoutDoubleCounting() = runTest {
        viewModel.ioScope = this
        val startTime = EPOCH_BASE * DAY_MILLIS - FIVE_MINUTES_MS
        val currentTime = EPOCH_BASE * DAY_MILLIS + FIVE_MINUTES_MS

        viewModel.currentItemId = TEST_ITEM_ID_B
        viewModel.sessionStartTime = startTime

        viewModel.recordActiveSession(currentTime = currentTime)
        advanceUntilIdle()

        val day1Date = (EPOCH_BASE - 1) * DAY_MILLIS
        val day2Date = EPOCH_BASE * DAY_MILLIS

        coVerify(atLeast = 1) {
            annotationService.recordReadingSession(
                itemId = TEST_ITEM_ID_B,
                readingTimeMinutes = FIVE_MINUTES,
                pagesRead = any(),
                chaptersCompleted = any(),
                wordsRead = any(),
                startProgress = any(),
                endProgress = any(),
                date = day1Date
            )
        }

        coVerify(atLeast = 1) {
            annotationService.recordReadingSession(
                itemId = TEST_ITEM_ID_B,
                readingTimeMinutes = FIVE_MINUTES,
                pagesRead = any(),
                chaptersCompleted = any(),
                wordsRead = any(),
                startProgress = any(),
                endProgress = any(),
                date = day2Date
            )
        }
    }

    @Test
    fun closeReader_recordsSessionAndResetsStartTime() = runTest {
        viewModel.ioScope = this
        viewModel.currentItemId = TEST_ITEM_ID_A
        viewModel.sessionStartTime = System.currentTimeMillis() - FORTY_FIVE_SECONDS_MS

        viewModel.closeReader()
        advanceUntilIdle()

        coVerify(atLeast = 1) {
            annotationService.recordReadingSession(
                itemId = TEST_ITEM_ID_A,
                readingTimeMinutes = 1,
                pagesRead = any(),
                chaptersCompleted = any(),
                wordsRead = any(),
                startProgress = any(),
                endProgress = any(),
                date = any()
            )
        }

        assertEquals(0L, viewModel.sessionStartTime)
    }

    @Test
    fun nextChapter_recordsSessionIfDurationExceedsThreshold() = runTest {
        viewModel.ioScope = this
        every { epubReaderService.nextChapter() } returns true

        viewModel.currentItemId = TEST_ITEM_ID_A
        viewModel.sessionStartTime = System.currentTimeMillis() - FORTY_FIVE_SECONDS_MS

        viewModel.nextChapter()
        advanceUntilIdle()

        coVerify(atLeast = 1) {
            annotationService.recordReadingSession(
                itemId = TEST_ITEM_ID_A,
                readingTimeMinutes = 1,
                pagesRead = any(),
                chaptersCompleted = 1,
                wordsRead = any(),
                startProgress = any(),
                endProgress = any(),
                date = any()
            )
        }
    }
}
