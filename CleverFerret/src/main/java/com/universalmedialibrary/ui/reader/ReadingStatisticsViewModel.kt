package com.universalmedialibrary.ui.reader

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.ReadingStatistics
import com.universalmedialibrary.services.reader.AnnotationService
import com.universalmedialibrary.ui.modern.stats.ModernReadingStatsUiState
import com.universalmedialibrary.ui.modern.stats.StatsBreakdown
import com.universalmedialibrary.ui.modern.stats.StatsBucket
import com.universalmedialibrary.ui.modern.stats.StatsKpi
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import javax.inject.Inject

/**
 * ViewModel for reading statistics
 */
@HiltViewModel
class ReadingStatisticsViewModel @Inject constructor(
    private val annotationService: AnnotationService
) : ViewModel() {

    companion object {
        const val MILLIS_PER_DAY = 86_400_000L
        const val DEFAULT_ACTIVITY_DAYS = 7

        /**
         * Calculate current streak and longest streak from reading dates.
         */
        fun calculateStreaks(
            dates: List<Long>,
            currentEpochDay: Long = System.currentTimeMillis() / MILLIS_PER_DAY
        ): Pair<Int, Int> {
            if (dates.isEmpty()) {
                return Pair(0, 0)
            }

            val epochDays = dates.map { it / MILLIS_PER_DAY }.toSet()

            val currentStreak = when {
                epochDays.contains(currentEpochDay) -> {
                    var streak = 0
                    var day = currentEpochDay
                    while (epochDays.contains(day)) {
                        streak++
                        day--
                    }
                    streak
                }
                epochDays.contains(currentEpochDay - 1) -> {
                    var streak = 0
                    var day = currentEpochDay - 1
                    while (epochDays.contains(day)) {
                        streak++
                        day--
                    }
                    streak
                }
                else -> 0
            }

            val sortedDays = epochDays.sorted()
            var longestStreak = 0
            var currentRun = 0
            var prevDay: Long? = null

            for (day in sortedDays) {
                if (prevDay != null && day == prevDay + 1) {
                    currentRun++
                } else {
                    currentRun = 1
                }
                if (currentRun > longestStreak) {
                    longestStreak = currentRun
                }
                prevDay = day
            }

            return Pair(currentStreak, longestStreak)
        }
    }

    private val _uiState = MutableStateFlow(ReadingStatisticsUiState())
    val uiState: StateFlow<ReadingStatisticsUiState> = _uiState.asStateFlow()

    fun calculateStreaks(
        dates: List<Long>,
        currentEpochDay: Long = System.currentTimeMillis() / MILLIS_PER_DAY
    ): Pair<Int, Int> = Companion.calculateStreaks(dates, currentEpochDay)

    fun loadStatistics(mediaId: Long? = null) {
        _uiState.update { it.copy(isLoading = true, error = null) }
        viewModelScope.launch {
            val statsFlow = if (mediaId != null && mediaId > 0) {
                annotationService.getReadingStatisticsForBook(mediaId)
            } else {
                annotationService.getAllReadingStatistics()
            }
            statsFlow.collect { statistics ->
                val totalReadingTime = statistics.sumOf { it.readingTimeMinutes }
                val totalPages = statistics.sumOf { it.pagesRead }
                val totalSessions = statistics.sumOf { it.sessionCount }
                val averageSessionTime = if (totalSessions > 0) totalReadingTime / totalSessions else 0

                _uiState.update { current ->
                    current.copy(
                        statistics = statistics.sortedByDescending { it.date },
                        totalReadingTime = totalReadingTime,
                        totalPages = totalPages,
                        totalSessions = totalSessions,
                        averageSessionTime = averageSessionTime,
                        isLoading = false
                    )
                }
            }
        }

        viewModelScope.launch {
            annotationService.getAllReadingDates().collect { dates ->
                val (currentStreak, longestStreak) = calculateStreaks(dates)
                _uiState.update { current ->
                    current.copy(
                        readingDates = dates,
                        currentStreak = currentStreak,
                        longestStreak = longestStreak
                    )
                }
            }
        }
    }
}

/**
 * UI state for reading statistics
 */
data class ReadingStatisticsUiState(
    val statistics: List<ReadingStatistics> = emptyList(),
    val totalReadingTime: Int = 0,
    val totalPages: Int = 0,
    val totalSessions: Int = 0,
    val averageSessionTime: Int = 0,
    val currentStreak: Int = 0,
    val longestStreak: Int = 0,
    val readingDates: List<Long> = emptyList(),
    val isLoading: Boolean = true,
    val error: String? = null
)

/**
 * Maps ReadingStatisticsUiState to ModernReadingStatsUiState for ModernReadingStatsScreen.
 */
fun ReadingStatisticsUiState.toModernReadingStatsUiState(
    currentEpochDay: Long = System.currentTimeMillis() / ReadingStatisticsViewModel.MILLIS_PER_DAY
): ModernReadingStatsUiState {
    val kpis = listOf(
        StatsKpi("Total Time", "${totalReadingTime}m"),
        StatsKpi("Pages Read", "$totalPages"),
        StatsKpi("Sessions", "$totalSessions"),
        StatsKpi("Best Streak", "${longestStreak}d")
    )

    val statsByDay = statistics.groupBy { it.date / ReadingStatisticsViewModel.MILLIS_PER_DAY }
    val dayFormatter = SimpleDateFormat("EEE", Locale.getDefault())

    val activity = (ReadingStatisticsViewModel.DEFAULT_ACTIVITY_DAYS - 1 downTo 0).map { daysAgo ->
        val day = currentEpochDay - daysAgo
        val dayTimestamp = day * ReadingStatisticsViewModel.MILLIS_PER_DAY
        val label = dayFormatter.format(Date(dayTimestamp))
        val dayMinutes = statsByDay[day]?.sumOf { it.readingTimeMinutes } ?: 0
        StatsBucket(label = label, value = dayMinutes.toFloat())
    }

    val breakdown = if (totalPages > 0) {
        listOf(
            StatsBreakdown("EPUB / Books", totalPages, 1.0f)
        )
    } else {
        emptyList()
    }

    return ModernReadingStatsUiState(
        kpis = kpis,
        activity = activity,
        breakdown = breakdown,
        topAuthors = emptyList(),
        streakDays = currentStreak
    )
}
