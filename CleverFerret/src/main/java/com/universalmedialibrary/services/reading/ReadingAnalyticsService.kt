package com.universalmedialibrary.services.reading

import com.universalmedialibrary.data.local.dao.ReadingAnalyticsDao
import com.universalmedialibrary.data.local.entity.ReaderAIInsight
import com.universalmedialibrary.data.local.entity.ReaderAIInsightType
import com.universalmedialibrary.data.local.entity.ReadingAnalyticsEntry
import com.universalmedialibrary.data.local.entity.ReadingSessionLog
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import com.universalmedialibrary.services.ai.AIServiceManager
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Tracks and aggregates reading analytics inspired by Anx-reader.
 */
@Singleton
class ReadingAnalyticsService @Inject constructor(
    private val analyticsDao: ReadingAnalyticsDao,
    private val aiServiceManager: AIServiceManager
) {

    private val dateFormat = SimpleDateFormat("yyyy-MM-dd", Locale.getDefault())
    private var currentSession: ReadingSessionLog? = null

    /**
     * Start a new reading session.
     */
    suspend fun startReadingSession(itemId: Long, startProgress: Float): Long {
        endCurrentSession()

        val session = ReadingSessionLog(
            itemId = itemId,
            startTime = System.currentTimeMillis(),
            startProgress = startProgress
        )

        val sessionId = analyticsDao.insertSession(session)
        currentSession = session.copy(sessionId = sessionId)
        return sessionId
    }

    /**
     * End the current reading session, updating analytics.
     */
    suspend fun endCurrentSession(endProgress: Float = 0f, pagesRead: Int = 0, wordsRead: Int = 0) {
        currentSession?.let { session ->
            val endTime = System.currentTimeMillis()
            val duration = (endTime - session.startTime) / 1000

            analyticsDao.endSession(
                sessionId = session.sessionId,
                endTime = endTime,
                duration = duration,
                progress = endProgress
            )

            updateDailyAnalytics(
                itemId = session.itemId,
                readingTimeSeconds = duration,
                pagesRead = pagesRead,
                wordsRead = wordsRead
            )

            currentSession = null
        }
    }

    private suspend fun updateDailyAnalytics(
        itemId: Long,
        readingTimeSeconds: Long,
        pagesRead: Int,
        wordsRead: Int
    ) {
        val today = dateFormat.format(Date())
        val existing = analyticsDao.getAnalyticsByDate(today).first()
            .find { it.itemId == itemId }

        if (existing != null) {
            val updated = existing.copy(
                readingTimeSeconds = existing.readingTimeSeconds + readingTimeSeconds,
                pagesRead = existing.pagesRead + pagesRead,
                wordsRead = existing.wordsRead + wordsRead,
                sessionCount = existing.sessionCount + 1,
                averageSessionDuration = if (existing.sessionCount + 1 > 0) {
                    (existing.readingTimeSeconds + readingTimeSeconds) / (existing.sessionCount + 1)
                } else {
                    existing.averageSessionDuration
                },
                lastReadTime = System.currentTimeMillis()
            )
            analyticsDao.updateAnalytics(updated)
        } else {
            val newAnalytics = ReadingAnalyticsEntry(
                itemId = itemId,
                date = today,
                readingTimeSeconds = readingTimeSeconds,
                pagesRead = pagesRead,
                wordsRead = wordsRead,
                sessionCount = 1
            )
            analyticsDao.insertAnalytics(newAnalytics)
        }
    }

    suspend fun getReadingStats(period: TimePeriod): ReadingStats {
        val (startDate, endDate) = getDateRange(period)
        val analytics = analyticsDao.getAnalyticsInDateRange(startDate, endDate).first()

        val totalTime = analytics.sumOf { it.readingTimeSeconds }
        val totalPages = analytics.sumOf { it.pagesRead }
        val totalWords = analytics.sumOf { it.wordsRead }
        val totalSessions = analytics.sumOf { it.sessionCount }
        val daysRead = analytics.map { it.date }.distinct().size

        return ReadingStats(
            period = period,
            totalReadingTimeSeconds = totalTime,
            totalPagesRead = totalPages,
            totalWordsRead = totalWords,
            totalSessions = totalSessions,
            daysRead = daysRead,
            averageSessionDuration = if (totalSessions > 0) totalTime / totalSessions else 0,
            dailyAverage = if (daysRead > 0) totalTime / daysRead else 0,
            heatmapData = analytics.associate { it.date to it.readingTimeSeconds }
        )
    }

    fun getBookAnalytics(itemId: Long): Flow<List<ReadingAnalyticsEntry>> =
        analyticsDao.getAnalyticsByItemId(itemId)

    suspend fun getTotalReadingTime(itemId: Long): Long =
        analyticsDao.getTotalReadingTime(itemId) ?: 0L

    fun getReadingSessions(itemId: Long): Flow<List<ReadingSessionLog>> =
        analyticsDao.getSessionsByItemId(itemId)

    suspend fun generateAIInsight(
        itemId: Long,
        insightType: ReaderAIInsightType,
        content: String
    ): Long {
        val insight = ReaderAIInsight(
            itemId = itemId,
            insightType = insightType,
            summary = if (insightType == ReaderAIInsightType.SUMMARY) content else null,
            mindMap = if (insightType == ReaderAIInsightType.MIND_MAP) content else null,
            characterAnalysis = if (insightType == ReaderAIInsightType.CHARACTER_ANALYSIS) content else null,
            perspectiveAnalysis = if (insightType == ReaderAIInsightType.PERSPECTIVE) content else null,
            keyThemes = if (insightType == ReaderAIInsightType.THEMES) listOf(content) else emptyList()
        )
        return analyticsDao.insertInsight(insight)
    }

    fun getAIInsights(itemId: Long): Flow<List<ReaderAIInsight>> =
        analyticsDao.getInsightsByItemId(itemId)

    suspend fun getAIInsightByType(itemId: Long, type: ReaderAIInsightType): ReaderAIInsight? =
        analyticsDao.getInsightByType(itemId, type)

    private fun getDateRange(period: TimePeriod): Pair<String, String> {
        val calendar = java.util.Calendar.getInstance()
        val endDate = dateFormat.format(calendar.time)

        when (period) {
            TimePeriod.DAILY -> Unit
            TimePeriod.WEEKLY -> calendar.add(java.util.Calendar.DAY_OF_YEAR, -7)
            TimePeriod.MONTHLY -> calendar.add(java.util.Calendar.MONTH, -1)
            TimePeriod.YEARLY -> calendar.add(java.util.Calendar.YEAR, -1)
        }

        val startDate = dateFormat.format(calendar.time)
        return startDate to endDate
    }
}

enum class TimePeriod {
    DAILY,
    WEEKLY,
    MONTHLY,
    YEARLY
}

data class ReadingStats(
    val period: TimePeriod,
    val totalReadingTimeSeconds: Long,
    val totalPagesRead: Int,
    val totalWordsRead: Int,
    val totalSessions: Int,
    val daysRead: Int,
    val averageSessionDuration: Long,
    val dailyAverage: Long,
    val heatmapData: Map<String, Long>
)
