package com.universalmedialibrary.ui.reader

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.ReadingStatistics
import com.universalmedialibrary.services.reader.AnnotationService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for reading statistics
 */
@HiltViewModel
class ReadingStatisticsViewModel @Inject constructor(
    private val annotationService: AnnotationService
) : ViewModel() {

    private val _uiState = MutableStateFlow(ReadingStatisticsUiState())
    val uiState: StateFlow<ReadingStatisticsUiState> = _uiState.asStateFlow()

    fun loadStatistics(mediaId: Long) {
        viewModelScope.launch {
            annotationService.getReadingStatisticsForBook(mediaId).collect { statistics ->
                val totalReadingTime = statistics.sumOf { it.readingTimeMinutes }
                val totalPages = statistics.sumOf { it.pagesRead }
                val totalSessions = statistics.sumOf { it.sessionCount }
                val averageSessionTime = if (totalSessions > 0) totalReadingTime / totalSessions else 0

                _uiState.value = _uiState.value.copy(
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
    val isLoading: Boolean = true,
    val error: String? = null
)
