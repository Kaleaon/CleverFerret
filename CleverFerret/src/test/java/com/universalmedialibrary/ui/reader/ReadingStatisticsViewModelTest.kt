package com.universalmedialibrary.ui.reader

import com.universalmedialibrary.data.local.entity.ReadingStatistics
import com.universalmedialibrary.services.reader.AnnotationService
import com.universalmedialibrary.testing.MainDispatcherRule
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test

private const val DAY_MILLIS = 86_400_000L
private const val EPOCH_DAY_BASE = 20_000L
private const val ONE_DAY = 1
private const val TWO_DAYS = 2
private const val THREE_DAYS = 3
private const val FOUR_DAYS = 4
private const val FIVE_DAYS = 5
private const val SEVEN_DAYS = 7
private const val TEN_MINUTES = 10
private const val TWENTY_MINUTES = 20
private const val THIRTY_MINUTES = 30
private const val FORTY_FIVE_MINUTES = 45
private const val TWENTY_PAGES = 20
private const val TWENTY_FIVE_PAGES = 25
private const val FIFTY_PAGES = 50
private const val ONE_SECOND_MS = 1000L
private const val FIVE_SECONDS_MS = 5000L
private const val TEN_SECONDS_MS = 10000L
private const val FORTY_FIVE_FLOAT = 45f

@OptIn(ExperimentalCoroutinesApi::class)
class ReadingStatisticsViewModelTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private val annotationService: AnnotationService = mockk(relaxed = true)

    @Test
    fun calculateStreaks_withConsecutiveDailySessions_incrementsStreakCounter() {
        val today = EPOCH_DAY_BASE * DAY_MILLIS
        val yesterday = (EPOCH_DAY_BASE - ONE_DAY.toLong()) * DAY_MILLIS
        val twoDaysAgo = (EPOCH_DAY_BASE - TWO_DAYS.toLong()) * DAY_MILLIS

        val dates = listOf(today, yesterday, twoDaysAgo)
        val (currentStreak, longestStreak) = ReadingStatisticsViewModel.calculateStreaks(
            dates = dates,
            currentEpochDay = EPOCH_DAY_BASE
        )

        assertEquals(THREE_DAYS, currentStreak)
        assertEquals(THREE_DAYS, longestStreak)
    }

    @Test
    fun calculateStreaks_whenSessionMissedForMoreThanOneDay_resetsCurrentStreak() {
        val twoDaysAgo = (EPOCH_DAY_BASE - TWO_DAYS.toLong()) * DAY_MILLIS
        val threeDaysAgo = (EPOCH_DAY_BASE - THREE_DAYS.toLong()) * DAY_MILLIS

        val dates = listOf(twoDaysAgo, threeDaysAgo)
        val (currentStreak, longestStreak) = ReadingStatisticsViewModel.calculateStreaks(
            dates = dates,
            currentEpochDay = EPOCH_DAY_BASE
        )

        assertEquals(0, currentStreak)
        assertEquals(TWO_DAYS, longestStreak)
    }

    @Test
    fun calculateStreaks_whenReadYesterdayButNotToday_maintainsActiveStreak() {
        val yesterday = (EPOCH_DAY_BASE - ONE_DAY.toLong()) * DAY_MILLIS
        val twoDaysAgo = (EPOCH_DAY_BASE - TWO_DAYS.toLong()) * DAY_MILLIS

        val dates = listOf(yesterday, twoDaysAgo)
        val (currentStreak, longestStreak) = ReadingStatisticsViewModel.calculateStreaks(
            dates = dates,
            currentEpochDay = EPOCH_DAY_BASE
        )

        assertEquals(TWO_DAYS, currentStreak)
        assertEquals(TWO_DAYS, longestStreak)
    }

    @Test
    fun calculateStreaks_withEmptyDates_returnsZeroStreaks() {
        val (currentStreak, longestStreak) = ReadingStatisticsViewModel.calculateStreaks(
            dates = emptyList(),
            currentEpochDay = EPOCH_DAY_BASE
        )

        assertEquals(0, currentStreak)
        assertEquals(0, longestStreak)
    }

    @Test
    fun calculateStreaks_withGaps_calculatesLongestStreakCorrectly() {
        val historyStreak = (10L..14L).map { it * DAY_MILLIS }
        val currentStreakDays = listOf((EPOCH_DAY_BASE - ONE_DAY.toLong()) * DAY_MILLIS, EPOCH_DAY_BASE * DAY_MILLIS)
        val allDates = historyStreak + currentStreakDays

        val (currentStreak, longestStreak) = ReadingStatisticsViewModel.calculateStreaks(
            dates = allDates,
            currentEpochDay = EPOCH_DAY_BASE
        )

        assertEquals(TWO_DAYS, currentStreak)
        assertEquals(FIVE_DAYS, longestStreak)
    }

    @Test
    fun calculateStreaks_withMultipleSessionsOnSameDay_countsAsSingleDayInStreak() {
        val todaySession1 = EPOCH_DAY_BASE * DAY_MILLIS + ONE_SECOND_MS
        val todaySession2 = EPOCH_DAY_BASE * DAY_MILLIS + FIVE_SECONDS_MS
        val todaySession3 = EPOCH_DAY_BASE * DAY_MILLIS + TEN_SECONDS_MS

        val (currentStreak, longestStreak) = ReadingStatisticsViewModel.calculateStreaks(
            dates = listOf(todaySession1, todaySession2, todaySession3),
            currentEpochDay = EPOCH_DAY_BASE
        )

        assertEquals(ONE_DAY, currentStreak)
        assertEquals(ONE_DAY, longestStreak)
    }

    @Test
    fun loadStatistics_collectsReadingDatesAndAggregatesMetrics() = runTest {
        val today = EPOCH_DAY_BASE * DAY_MILLIS
        val yesterday = (EPOCH_DAY_BASE - ONE_DAY.toLong()) * DAY_MILLIS
        val readingDates = listOf(today, yesterday)

        val stats = listOf(
            ReadingStatistics(
                itemId = 1L,
                date = today,
                readingTimeMinutes = TWENTY_MINUTES,
                pagesRead = THIRTY_MINUTES,
                sessionCount = TWO_DAYS
            ),
            ReadingStatistics(
                itemId = 1L,
                date = yesterday,
                readingTimeMinutes = TEN_MINUTES,
                pagesRead = TWENTY_PAGES,
                sessionCount = 1
            )
        )

        every { annotationService.getAllReadingDates() } returns flowOf(readingDates)
        every { annotationService.getAllReadingStatistics() } returns flowOf(stats)

        val viewModel = ReadingStatisticsViewModel(annotationService)
        viewModel.loadStatistics()
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertEquals(THIRTY_MINUTES, state.totalReadingTime)
        assertEquals(FIFTY_PAGES, state.totalPages)
        assertEquals(THREE_DAYS, state.totalSessions)
        assertEquals(TEN_MINUTES, state.averageSessionTime)
        assertEquals(readingDates, state.readingDates)
    }

    @Test
    fun toModernReadingStatsUiState_mapsKpisAndActivityCorrectly() {
        val today = EPOCH_DAY_BASE * DAY_MILLIS
        val state = ReadingStatisticsUiState(
            totalReadingTime = FORTY_FIVE_MINUTES,
            totalPages = TWENTY_FIVE_PAGES,
            totalSessions = THREE_DAYS,
            currentStreak = FOUR_DAYS,
            longestStreak = SEVEN_DAYS,
            statistics = listOf(
                ReadingStatistics(
                    itemId = 1L,
                    date = today,
                    readingTimeMinutes = FORTY_FIVE_MINUTES,
                    pagesRead = TWENTY_FIVE_PAGES
                )
            )
        )

        val modernState = state.toModernReadingStatsUiState(currentEpochDay = EPOCH_DAY_BASE)

        assertEquals(FOUR_DAYS, modernState.streakDays)
        assertEquals(FOUR_DAYS, modernState.kpis.size)
        assertTrue(modernState.kpis.any { it.label == "Total Time" && it.value == "45m" })
        assertTrue(modernState.kpis.any { it.label == "Best Streak" && it.value == "7d" })
        assertEquals(SEVEN_DAYS, modernState.activity.size)
        assertEquals(FORTY_FIVE_FLOAT, modernState.activity.last().value)
        assertEquals(ONE_DAY, modernState.breakdown.size)
        assertEquals(TWENTY_FIVE_PAGES, modernState.breakdown.first().value)
    }
}
