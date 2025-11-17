package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.ReadingAnalytics
import com.universalmedialibrary.data.local.entity.ReadingSession
import com.universalmedialibrary.data.local.entity.AIBookInsight
import com.universalmedialibrary.data.local.entity.AIInsightType
import kotlinx.coroutines.flow.Flow

@Dao
interface ReadingAnalyticsDao {
    
    // Reading Analytics
    @Query("SELECT * FROM reading_analytics WHERE itemId = :itemId ORDER BY date DESC")
    fun getAnalyticsByItemId(itemId: Long): Flow<List<ReadingAnalytics>>
    
    @Query("SELECT * FROM reading_analytics WHERE date = :date ORDER BY readingTimeSeconds DESC")
    fun getAnalyticsByDate(date: String): Flow<List<ReadingAnalytics>>
    
    @Query("SELECT * FROM reading_analytics WHERE date BETWEEN :startDate AND :endDate ORDER BY date ASC")
    fun getAnalyticsInDateRange(startDate: String, endDate: String): Flow<List<ReadingAnalytics>>
    
    @Query("SELECT SUM(readingTimeSeconds) FROM reading_analytics WHERE itemId = :itemId")
    suspend fun getTotalReadingTime(itemId: Long): Long?
    
    @Query("SELECT SUM(readingTimeSeconds) FROM reading_analytics WHERE date = :date")
    suspend fun getDailyReadingTime(date: String): Long?
    
    @Query("SELECT SUM(readingTimeSeconds) FROM reading_analytics WHERE date BETWEEN :startDate AND :endDate")
    suspend fun getReadingTimeInRange(startDate: String, endDate: String): Long?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAnalytics(analytics: ReadingAnalytics): Long
    
    @Update
    suspend fun updateAnalytics(analytics: ReadingAnalytics)
    
    @Query("DELETE FROM reading_analytics WHERE itemId = :itemId")
    suspend fun deleteAnalyticsByItemId(itemId: Long)
    
    // Reading Sessions
    @Query("SELECT * FROM reading_sessions WHERE itemId = :itemId ORDER BY startTime DESC")
    fun getSessionsByItemId(itemId: Long): Flow<List<ReadingSession>>
    
    @Query("SELECT * FROM reading_sessions WHERE startTime BETWEEN :startTime AND :endTime ORDER BY startTime DESC")
    fun getSessionsInTimeRange(startTime: Long, endTime: Long): Flow<List<ReadingSession>>
    
    @Query("SELECT * FROM reading_sessions WHERE endTime IS NULL LIMIT 1")
    suspend fun getActiveSession(): ReadingSession?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSession(session: ReadingSession): Long
    
    @Update
    suspend fun updateSession(session: ReadingSession)
    
    @Query("UPDATE reading_sessions SET endTime = :endTime, durationSeconds = :duration, endProgress = :progress WHERE sessionId = :sessionId")
    suspend fun endSession(sessionId: Long, endTime: Long, duration: Long, progress: Float)
    
    @Query("DELETE FROM reading_sessions WHERE itemId = :itemId")
    suspend fun deleteSessionsByItemId(itemId: Long)
    
    // AI Insights
    @Query("SELECT * FROM ai_book_insights WHERE itemId = :itemId")
    fun getInsightsByItemId(itemId: Long): Flow<List<AIBookInsight>>
    
    @Query("SELECT * FROM ai_book_insights WHERE itemId = :itemId AND insightType = :type")
    suspend fun getInsightByType(itemId: Long, type: AIInsightType): AIBookInsight?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertInsight(insight: AIBookInsight): Long
    
    @Update
    suspend fun updateInsight(insight: AIBookInsight)
    
    @Query("DELETE FROM ai_book_insights WHERE itemId = :itemId")
    suspend fun deleteInsightsByItemId(itemId: Long)
    
    @Query("DELETE FROM ai_book_insights WHERE insightId = :insightId")
    suspend fun deleteInsightById(insightId: Long)
}