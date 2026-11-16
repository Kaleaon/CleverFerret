package com.universalmedialibrary.services.reader

import com.universalmedialibrary.data.local.dao.AnnotationDao
import com.universalmedialibrary.data.local.dao.EnhancedAnnotationDao
import com.universalmedialibrary.data.local.dao.ReadingStatisticsDao
import com.universalmedialibrary.data.local.dao.SearchIndexDao
import com.universalmedialibrary.data.local.entity.ReadingStatistics
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.mockk
import io.mockk.slot
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test

private const val DAY_MILLIS = 86_400_000L
private const val EPOCH_BASE = 20_000L
private const val TEST_ITEM_ID = 10L
private const val INITIAL_READING_TIME = 15
private const val INITIAL_PAGES_READ = 5
private const val INITIAL_CHAPTERS = 1
private const val INITIAL_WORDS = 1000
private const val INITIAL_START_PROGRESS = 0.1f
private const val INITIAL_END_PROGRESS = 0.2f
private const val ADDED_READING_TIME = 20
private const val ADDED_PAGES_READ = 10
private const val ADDED_CHAPTERS = 2
private const val ADDED_WORDS = 2000
private const val UPDATED_END_PROGRESS = 0.5f
private const val EXPECTED_READING_TIME = 35
private const val EXPECTED_PAGES_READ = 15
private const val EXPECTED_CHAPTERS = 3
private const val EXPECTED_WORDS = 3000
private const val EXPECTED_SESSIONS = 2
private const val NEW_DAY_READING_TIME = 25
private const val NEW_DAY_PAGES_READ = 8
private const val NEW_DAY_WORDS = 1500
private const val NEW_DAY_END_PROGRESS = 0.3f
private const val DELTA_PRECISION = 0.001f

class AnnotationServiceSessionRecordingTest {

    private val annotationDao: AnnotationDao = mockk(relaxed = true)
    private val enhancedAnnotationDao: EnhancedAnnotationDao = mockk(relaxed = true)
    private val searchIndexDao: SearchIndexDao = mockk(relaxed = true)
    private val readingStatisticsDao: ReadingStatisticsDao = mockk(relaxed = true)

    private lateinit var annotationService: AnnotationService

    @Before
    fun setup() {
        annotationService = AnnotationService(
            annotationDao = annotationDao,
            enhancedAnnotationDao = enhancedAnnotationDao,
            searchIndexDao = searchIndexDao,
            readingStatisticsDao = readingStatisticsDao
        )
    }

    @Test
    fun recordReadingSession_accumulatesMinutesForSameDay() = runTest {
        val testDate = EPOCH_BASE * DAY_MILLIS
        val existingStat = ReadingStatistics(
            statisticsId = 1L,
            itemId = TEST_ITEM_ID,
            date = testDate,
            readingTimeMinutes = INITIAL_READING_TIME,
            pagesRead = INITIAL_PAGES_READ,
            chaptersCompleted = INITIAL_CHAPTERS,
            wordsRead = INITIAL_WORDS,
            startProgress = INITIAL_START_PROGRESS,
            endProgress = INITIAL_END_PROGRESS,
            sessionCount = 1
        )

        coEvery { readingStatisticsDao.getStatisticsForBookAndDate(TEST_ITEM_ID, testDate) } returns existingStat

        val updateSlot = slot<ReadingStatistics>()
        coEvery { readingStatisticsDao.updateStatistics(capture(updateSlot)) } returns Unit

        annotationService.recordReadingSession(
            itemId = TEST_ITEM_ID,
            readingTimeMinutes = ADDED_READING_TIME,
            pagesRead = ADDED_PAGES_READ,
            chaptersCompleted = ADDED_CHAPTERS,
            wordsRead = ADDED_WORDS,
            startProgress = INITIAL_END_PROGRESS,
            endProgress = UPDATED_END_PROGRESS,
            date = testDate
        )

        coVerify(exactly = 1) { readingStatisticsDao.updateStatistics(any()) }
        coVerify(exactly = 0) { readingStatisticsDao.insertStatistics(any()) }

        val captured = updateSlot.captured
        assertEquals(EXPECTED_READING_TIME, captured.readingTimeMinutes)
        assertEquals(EXPECTED_PAGES_READ, captured.pagesRead)
        assertEquals(EXPECTED_CHAPTERS, captured.chaptersCompleted)
        assertEquals(EXPECTED_WORDS, captured.wordsRead)
        assertEquals(EXPECTED_SESSIONS, captured.sessionCount)
        assertEquals(UPDATED_END_PROGRESS, captured.endProgress, DELTA_PRECISION)
    }

    @Test
    fun recordReadingSession_withZeroMinutes_doesNotInsertOrUpdate() = runTest {
        val testDate = EPOCH_BASE * DAY_MILLIS

        annotationService.recordReadingSession(
            itemId = TEST_ITEM_ID,
            readingTimeMinutes = 0,
            date = testDate
        )

        coVerify(exactly = 0) { readingStatisticsDao.getStatisticsForBookAndDate(any(), any()) }
        coVerify(exactly = 0) { readingStatisticsDao.insertStatistics(any()) }
        coVerify(exactly = 0) { readingStatisticsDao.updateStatistics(any()) }
    }

    @Test
    fun recordReadingSession_newDay_insertsNewRecord() = runTest {
        val testDate = EPOCH_BASE * DAY_MILLIS
        coEvery { readingStatisticsDao.getStatisticsForBookAndDate(TEST_ITEM_ID, testDate) } returns null

        val insertSlot = slot<ReadingStatistics>()
        coEvery { readingStatisticsDao.insertStatistics(capture(insertSlot)) } returns 1L

        annotationService.recordReadingSession(
            itemId = TEST_ITEM_ID,
            readingTimeMinutes = NEW_DAY_READING_TIME,
            pagesRead = NEW_DAY_PAGES_READ,
            chaptersCompleted = 1,
            wordsRead = NEW_DAY_WORDS,
            startProgress = 0f,
            endProgress = NEW_DAY_END_PROGRESS,
            date = testDate
        )

        coVerify(exactly = 1) { readingStatisticsDao.insertStatistics(any()) }
        val captured = insertSlot.captured
        assertEquals(TEST_ITEM_ID, captured.itemId)
        assertEquals(testDate, captured.date)
        assertEquals(NEW_DAY_READING_TIME, captured.readingTimeMinutes)
        assertEquals(NEW_DAY_PAGES_READ, captured.pagesRead)
        assertEquals(1, captured.chaptersCompleted)
        assertEquals(NEW_DAY_WORDS, captured.wordsRead)
        assertEquals(1, captured.sessionCount)
    }
}
