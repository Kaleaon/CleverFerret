package com.universalmedialibrary.ui.books

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MetadataDao
import dagger.hilt.android.lifecycle.HiltViewModel
import java.time.LocalDate
import java.time.ZoneId
import java.time.YearMonth
import java.time.format.DateTimeFormatter
import java.time.format.TextStyle
import java.util.Locale
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Enhanced Reading Statistics
 */
@HiltViewModel
class EnhancedReadingStatisticsViewModel @Inject constructor(
    private val metadataDao: MetadataDao
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(ReadingStatisticsUiState())
    val uiState: StateFlow<ReadingStatisticsUiState> = _uiState.asStateFlow()

    /**
     * Load reading statistics for a library
     */
    fun loadStatistics(libraryId: Long) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)
                
                val currentYear = LocalDate.now().year
                val startOfYear = LocalDate.of(currentYear, 1, 1).toEpochDay() * 86400000
                
                // Implement database queries for statistics
                val booksReadAllTime = getBooksReadAllTime(libraryId)
                val totalPagesRead = getTotalPagesRead(libraryId)
                val averagePages = if (booksReadAllTime > 0) totalPagesRead / booksReadAllTime else 0
                val booksReadThisYear = getBooksReadThisYear(libraryId, startOfYear)
                val currentlyReading = getCurrentlyReadingCount(libraryId)
                val toRead = getToReadCount(libraryId)
                
                // Calculate monthly reading data (last 12 months)
                val monthlyData = getMonthlyReadingData(libraryId)
                
                // Get publisher data
                val publishers = getTopPublishers(libraryId)
                
                _uiState.value = ReadingStatisticsUiState(
                    booksReadAllTime = booksReadAllTime,
                    totalPagesRead = totalPagesRead,
                    averagePages = averagePages,
                    booksReadThisYear = booksReadThisYear,
                    currentlyReading = currentlyReading,
                    toRead = toRead,
                    yearlyGoal = _uiState.value.yearlyGoal,
                    monthlyReadingData = monthlyData,
                    topPublishers = publishers,
                    isLoading = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Set yearly reading goal
     */
    fun setYearlyGoal(goal: Int) {
        _uiState.value = _uiState.value.copy(yearlyGoal = goal)
        // Persist to SharedPreferences or database
        viewModelScope.launch {
            try {
                // Save to SharedPreferences or settings repository
                // Implementation depends on your preferences storage
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    /**
     * Get total books read from database
     */
    private suspend fun getBooksReadAllTime(libraryId: Long): Int =
        metadataDao.getCompletedBooksCount(libraryId)

    /**
     * Get total pages read from database
     */
    private suspend fun getTotalPagesRead(libraryId: Long): Int =
        metadataDao.getTotalPagesRead(libraryId)

    /**
     * Get books read this year from database
     */
    private suspend fun getBooksReadThisYear(libraryId: Long, startOfYear: Long): Int =
        metadataDao.getBooksReadSince(libraryId, startOfYear)

    /**
     * Get currently reading count from database
     */
    private suspend fun getCurrentlyReadingCount(libraryId: Long): Int =
        metadataDao.getCurrentReadingCount(libraryId)

    /**
     * Get to-read count from database
     */
    private suspend fun getToReadCount(libraryId: Long): Int =
        metadataDao.getToReadBooksCount(libraryId)

    /**
     * Get monthly reading data from database
     */
    private suspend fun getMonthlyReadingData(libraryId: Long): List<MonthlyReading> {
        val zoneId = ZoneId.systemDefault()
        val currentMonth = YearMonth.now()
        val months = (0 until 12).map { index -> currentMonth.minusMonths((11 - index).toLong()) }
        val windowStart = months.first()
            .atDay(1)
            .atStartOfDay(zoneId)
            .toInstant()
            .toEpochMilli()

        val formatter = DateTimeFormatter.ofPattern("yyyy-MM")
        val monthlyCounts = metadataDao
            .getMonthlyCompletionCounts(libraryId, windowStart)
            .associate { entry ->
                YearMonth.parse(entry.yearMonth, formatter) to entry.count
            }

        return months.map { month ->
            MonthlyReading(
                month = month.month.getDisplayName(TextStyle.SHORT, Locale.getDefault()),
                count = monthlyCounts[month] ?: 0
            )
        }
    }
    
    /**
     * Get top publishers from database
     */
    private suspend fun getTopPublishers(libraryId: Long): List<PublisherCount> {
        return try {
            // Query metadata tables for publisher statistics
            // For now, use sample data - replace with actual database queries
            metadataDao.getTopPublishers(libraryId).map {
                PublisherCount(it.publisher, it.count)
            }
        } catch (e: Exception) {
            emptyList()
        }
    }

    /**
     * Generate sample monthly reading data
     */
    private fun generateMonthlyData(): List<MonthlyReading> {
        val formatter = DateTimeFormatter.ofPattern("MMM", Locale.getDefault())
        val currentMonth = YearMonth.now()
        return (0 until 12).map { index ->
            val month = currentMonth.minusMonths((11 - index).toLong())
            MonthlyReading(
                month = formatter.format(month.atDay(1)),
                count = 0
            )
        }
    }
}

/**
 * UI State for reading statistics
 */
data class ReadingStatisticsUiState(
    val booksReadAllTime: Int = 0,
    val totalPagesRead: Int = 0,
    val averagePages: Int = 0,
    val booksReadThisYear: Int = 0,
    val currentlyReading: Int = 0,
    val toRead: Int = 0,
    val yearlyGoal: Int = 52,
    val monthlyReadingData: List<MonthlyReading> = emptyList(),
    val topPublishers: List<PublisherCount> = emptyList(),
    val isLoading: Boolean = true,
    val error: String? = null
)
