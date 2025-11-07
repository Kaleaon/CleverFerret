package com.universalmedialibrary.ui.books

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MetadataDao
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.time.LocalDate
import java.time.format.DateTimeFormatter
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

    private val sampleMonthlyCounts = listOf(4, 5, 6, 4, 7, 5, 6, 5, 7, 6, 5, 4)
    
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
         * Calculate the total number of books read across all time.
         *
         * @return The total number of books read.
         */
    private suspend fun getBooksReadAllTime(libraryId: Long): Int =
        sampleMonthlyCounts.sum()

    /**
         * Estimate the total number of pages read for the specified library.
         *
         * The value is computed as the number of books read multiplied by a fixed
         * average page count of 320 pages per book.
         *
         * @param libraryId Identifier of the library for which to compute the estimate.
         * @return The estimated total pages read for the library.
         */
    private suspend fun getTotalPagesRead(libraryId: Long): Int =
        getBooksReadAllTime(libraryId) * 320

    /**
         * Compute the number of books read this year from the sample monthly counts.
         *
         * @param libraryId Library identifier (not used by the sample implementation).
         * @param startOfYear Epoch milliseconds representing the start of the year (not used by the sample implementation).
         * @return The total number of books read this year as the sum of the sample monthly counts.
         */
    private suspend fun getBooksReadThisYear(libraryId: Long, startOfYear: Long): Int =
        sampleMonthlyCounts.sum()

    /**
 * Provides the number of books currently being read for the specified library.
 *
 * @return The number of books currently being read (placeholder value: 3).
 */
    private suspend fun getCurrentlyReadingCount(libraryId: Long): Int = 3

    /**
 * Provides the to-read list count for the specified library.
 *
 * @param libraryId Identifier of the library; currently ignored because this returns sample data.
 * @return The number of books in the to-read list (currently always 12).
 */
    private suspend fun getToReadCount(libraryId: Long): Int = 12

    /**
         * Generate monthly reading statistics for the past 12 months.
         *
         * Produces 12 MonthlyReading entries whose counts are derived from the view model's sample data
         * and arranged so the last entry corresponds to the current calendar month.
         *
         * @param libraryId Identifier of the library (currently unused; kept for API compatibility).
         * @return A list of 12 MonthlyReading objects ordered from oldest to newest month. */
    private suspend fun getMonthlyReadingData(libraryId: Long): List<MonthlyReading> =
        generateMonthlyData()
    
    /**
     * Retrieve the top publishers for the specified library ordered by number of books.
     *
     * @param libraryId The library identifier whose publisher statistics to retrieve.
     * @return A list of `PublisherCount` items sorted by count in descending order; returns an empty list if no data is available or an error occurs.
     */
    private suspend fun getTopPublishers(libraryId: Long): List<PublisherCount> {
        return try {
            // Query metadata tables for publisher statistics
            // For now, use sample data - replace with actual database queries
            listOf(
                PublisherCount("Penguin Random House", 15),
                PublisherCount("HarperCollins", 12),
                PublisherCount("Simon & Schuster", 10),
                PublisherCount("Macmillan", 8),
                PublisherCount("Hachette", 7)
            )
        } catch (e: Exception) {
            emptyList()
        }
    }

    /**
     * Builds a 12-entry list of monthly reading summaries covering the last 12 months ending with the current month.
     *
     * Each entry contains a three-letter month abbreviation and a count taken cyclically from `sampleMonthlyCounts`.
     *
     * @return A list of `MonthlyReading` for the rolling 12-month window, ordered from oldest to newest.
     */
    private fun generateMonthlyData(): List<MonthlyReading> {
        val months = listOf("Jan", "Feb", "Mar", "Apr", "May", "Jun",
            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
        val currentMonthIndex = LocalDate.now().monthValue - 1

        return (0 until 12).map { offset ->
            val monthIndex = (currentMonthIndex - 11 + offset + 12) % 12
            val countIndex = monthIndex % sampleMonthlyCounts.size
            MonthlyReading(
                month = months[monthIndex],
                count = sampleMonthlyCounts[countIndex]
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