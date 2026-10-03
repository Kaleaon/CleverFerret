package com.universalmedialibrary.services.ai

import android.content.Context
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.ReadingAnalyticsDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.ReadingProgress
import com.universalmedialibrary.data.local.entity.ReadingSessionLog
import com.universalmedialibrary.services.reading.ReadingAnalyticsService
import com.universalmedialibrary.services.reading.TimePeriod
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Date
import java.util.Locale
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

data class CurrentReadingInfo(
    val bookId: Long,
    val title: String,
    val author: String?,
    val currentPage: Int,
    val totalPages: Int,
    val currentChapter: Int,
    val progressPercent: Float,
    val lastReadDate: Long,
    val lastReadFormatted: String,
    val totalReadingTimeMinutes: Int,
    val sessionCount: Int,
    val estimatedMinutesRemaining: Int?,
    val genres: List<String>,
    val summary: String?,
    val coverPath: String?,
    val startedDate: Long?,
    val startedDateFormatted: String?,
    val readingSpeed: Float?,
    val isNearingCompletion: Boolean,
    val isJustStarted: Boolean
)
data class DetailedBookProgress(
    val bookId: Long,
    val title: String,
    val author: String?,
    val currentPage: Int,
    val totalPages: Int,
    val currentChapter: Int,
    val totalChapters: Int?,
    val progressPercent: Float,
    val pagesRead: Int,
    val pagesRemaining: Int,
    
    // Time tracking
    val totalReadingTimeMinutes: Int,
    val averageSessionMinutes: Int,
    val estimatedMinutesRemaining: Int?,
    
    // Session info
    val sessionCount: Int,
    val lastSessionDate: Long?,
    val firstSessionDate: Long?,
    
    // Reading pattern analysis
    val readingPattern: String,
    val preferredReadingTime: String?,
    val readingStreak: Int,
    
    // Book info
    val genres: List<String>,
    val summary: String?,
    val year: Int?,
    val rating: Float?,
    
    // Status
    val isCompleted: Boolean,
    val completedDate: Long?,
    val startedDate: Long?,
    val isNearingCompletion: Boolean,
    val isJustStarted: Boolean,
    val isAbandoned: Boolean
)
data class ReadingHistorySummary(
    val periodDays: Int,
    val totalReadingTimeMinutes: Int = 0,
    val totalPagesRead: Int = 0,
    val booksCompleted: Int = 0,
    val booksInProgress: Int = 0,
    val totalSessions: Int = 0,
    val daysWithReading: Int = 0,
    val averageMinutesPerDay: Int = 0,
    val averageMinutesPerSession: Int = 0,
    val recentlyCompletedBooks: List<CompletedBookInfo> = emptyList(),
    val readingHeatmap: Map<String, Int> = emptyMap()
)
data class CompletedBookInfo(
    val bookId: Long,
    val title: String,
    val author: String?,
    val completedDate: Long,
    val completedDateFormatted: String,
    val totalReadingTimeMinutes: Int
)
data class BookDiscussionContext(
    val bookId: Long,
    val title: String,
    val author: String?,
    
    // Summaries for AI
    val progressSummary: String,
    val patternSummary: String,
    
    // Progress data
    val currentPage: Int,
    val totalPages: Int,
    val currentChapter: Int,
    val progressPercent: Float,
    
    // Book info
    val genres: List<String>,
    val bookSummary: String?,
    val year: Int?,
    
    // AI insights
    val existingSummary: String?,
    val keyThemes: List<String>,
    val characterAnalysis: String?,
    
    // Discussion helpers
    val suggestedTopics: List<String>,
    
    // Reading journey
    val daysReading: Int,
    val isNearingEnd: Boolean,
    val hasJustStarted: Boolean,
    val lastReadDescription: String,
    val startedDescription: String?
)
data class ReadingPositionContext(
    val bookId: Long,
    val title: String,
    val currentPage: Int,
    val totalPages: Int,
    val currentChapter: Int,
    val progressPercent: Float,
    val phase: ReadingPhase,
    val phaseDescription: String,
    val spoilerWarning: String,
    val safeToDiscuss: String,
    val doNotSpoil: String?
)
enum class ReadingPhase {
    BEGINNING,
    EARLY,
    RISING_ACTION,
    MIDDLE,
    CLIMAX,
    FINALE
}
