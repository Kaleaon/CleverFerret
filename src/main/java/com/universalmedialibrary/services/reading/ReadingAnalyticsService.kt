package com.universalmedialibrary.services.reading

import com.universalmedialibrary.data.local.dao.ReadingAnalyticsDao
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import java.text.SimpleDateFormat
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for tracking and analyzing reading habits
 * Inspired by Anx-reader's reading insights
 */
@Singleton
class ReadingAnalyticsService @Inject constructor(
    private val analyticsDao: ReadingAnalyticsDao
) {
    
    private val dateFormat = SimpleDateFormat("yyyy-MM-dd", Locale.getDefault())
    private var currentSession: ReadingSession? = null
    
    /**
     * Start a new reading session
     */
    suspend fun startReadingSession(itemId: Long, startProgress: Float): Long {
        // End any existing session first
        endCurrentSession()
        
        val session = ReadingSession(
            itemId = itemId,
            startTime = System.currentTimeMillis(),
            startProgress = startProgress
        )
        
        val sessionId = analyticsDao.insertSession(session)
        currentSession = session.copy(sessionId = sessionId)
        return sessionId
    }
    
    /**
     * End the current reading session
     */
    suspend fun endCurrentSession(endProgress: Float = 0f, pagesRead: Int = 0) {
        currentSession?.let { session ->
            val endTime = System.currentTimeMillis()
            val duration = (endTime - session.startTime) / 1000 // Convert to seconds
            
            analyticsDao.endSession(
                sessionId = session.sessionId,
                endTime = endTime,
                duration = duration,
                progress = endProgress
            )
            
            // Update daily analytics
            updateDailyAnalytics(
                itemId = session.itemId,
                readingTimeSeconds = duration,
                pagesRead = pagesRead
            )
            
            currentSession = null
        }
    }
    
    /**
     * Update daily reading analytics
     */
    private suspend fun updateDailyAnalytics(
        itemId: Long,
        readingTimeSeconds: Long,
        pagesRead: Int
    ) {
        val today = dateFormat.format(Date())
        val existing = analyticsDao.getAnalyticsByDate(today).first()
            .find { it.itemId == itemId }
        
        if (existing != null) {
            val updated = existing.copy(
                readingTimeSeconds = existing.readingTimeSeconds + readingTimeSeconds,
                pagesRead = existing.pagesRead + pagesRead,
                sessionCount = existing.sessionCount + 1,
                lastReadTime = System.currentTimeMillis()
            )
            analyticsDao.updateAnalytics(updated)
        } else {
            val newAnalytics = ReadingAnalytics(
                itemId = itemId,
                date = today,
                readingTimeSeconds = readingTimeSeconds,
                pagesRead = pagesRead,
                sessionCount = 1
            )
            analyticsDao.insertAnalytics(newAnalytics)
        }
    }
    
    /**
     * Get reading statistics for a specific period
     */
    suspend fun getReadingStats(period: TimePeriod): ReadingStats {
        val (startDate, endDate) = getDateRange(period)
        val analytics = analyticsDao.getAnalyticsInDateRange(startDate, endDate).first()
        
        val totalTime = analytics.sumOf { it.readingTimeSeconds }
        val totalPages = analytics.sumOf { it.pagesRead }
        val totalSessions = analytics.sumOf { it.sessionCount }
        val daysRead = analytics.map { it.date }.distinct().size
        
        return ReadingStats(
            period = period,
            totalReadingTimeSeconds = totalTime,
            totalPagesRead = totalPages,
            totalSessions = totalSessions,
            daysRead = daysRead,
            averageSessionDuration = if (totalSessions > 0) totalTime / totalSessions else 0,
            dailyAverage = if (daysRead > 0) totalTime / daysRead else 0,
            heatmapData = analytics.associate { it.date to it.readingTimeSeconds }
        )
    }
    
    /**
     * Get reading analytics for a specific book
     */
    fun getBookAnalytics(itemId: Long): Flow<List<ReadingAnalytics>> {
        return analyticsDao.getAnalyticsByItemId(itemId)
    }
    
    /**
     * Get total reading time for a book
     */
    suspend fun getTotalReadingTime(itemId: Long): Long {
        return analyticsDao.getTotalReadingTime(itemId) ?: 0L
    }
    
    /**
     * Get reading sessions for a book
     */
    fun getReadingSessions(itemId: Long): Flow<List<ReadingSession>> {
        return analyticsDao.getSessionsByItemId(itemId)
    }
    
    /**
     * Generate AI insights for a book
     */
    suspend fun generateAIInsight(
        itemId: Long,
        insightType: AIInsightType,
        content: String
    ): Long {
        val insight = AIBookInsight(
            itemId = itemId,
            insightType = insightType,
            summary = if (insightType == AIInsightType.SUMMARY) content else null,
            mindMap = if (insightType == AIInsightType.MIND_MAP) content else null,
            characterAnalysis = if (insightType == AIInsightType.CHARACTER_ANALYSIS) content else null,
            perspectiveAnalysis = if (insightType == AIInsightType.PERSPECTIVE) content else null
        )
        
        return analyticsDao.insertInsight(insight)
    }
    
    /**
     * Get AI insights for a book
     */
    fun getAIInsights(itemId: Long): Flow<List<AIBookInsight>> {
        return analyticsDao.getInsightsByItemId(itemId)
    }
    
    /**
     * Get specific AI insight by type
     */
    suspend fun getAIInsightByType(itemId: Long, type: AIInsightType): AIBookInsight? {
        return analyticsDao.getInsightByType(itemId, type)
    }
    
    private fun getDateRange(period: TimePeriod): Pair<String, String> {
        val calendar = Calendar.getInstance()
        val endDate = dateFormat.format(calendar.time)
        
        when (period) {
            TimePeriod.DAILY -> {
                // Same day
            }
            TimePeriod.WEEKLY -> {
                calendar.add(Calendar.DAY_OF_YEAR, -7)
            }
            TimePeriod.MONTHLY -> {
                calendar.add(Calendar.MONTH, -1)
            }
            TimePeriod.YEARLY -> {
                calendar.add(Calendar.YEAR, -1)
            }
        }
        
        val startDate = dateFormat.format(calendar.time)
        return Pair(startDate, endDate)
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
    val totalSessions: Int,
    val daysRead: Int,
    val averageSessionDuration: Long,
    val dailyAverage: Long,
    val heatmapData: Map<String, Long>
)