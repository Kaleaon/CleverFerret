package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.ReaderAIInsight
import com.universalmedialibrary.data.local.entity.ReaderAIInsightType
import com.universalmedialibrary.data.local.entity.ReadingAnalyticsEntry
import com.universalmedialibrary.data.local.entity.ReadingSessionLog
import kotlinx.coroutines.flow.Flow

@Dao
interface ReadingAnalyticsDao {

    // Reading Analytics

    @Query("SELECT * FROM reading_analytics WHERE itemId = :itemId ORDER BY date DESC")
    fun getAnalyticsByItemId(itemId: Long): Flow<List<ReadingAnalyticsEntry>>

    @Query("SELECT * FROM reading_analytics WHERE date = :date ORDER BY readingTimeSeconds DESC")
    fun getAnalyticsByDate(date: String): Flow<List<ReadingAnalyticsEntry>>

    @Query("SELECT * FROM reading_analytics WHERE date BETWEEN :startDate AND :endDate ORDER BY date ASC")
    fun getAnalyticsInDateRange(startDate: String, endDate: String): Flow<List<ReadingAnalyticsEntry>>

    @Query("SELECT SUM(readingTimeSeconds) FROM reading_analytics WHERE itemId = :itemId")
    suspend fun getTotalReadingTime(itemId: Long): Long?

    @Query("SELECT SUM(readingTimeSeconds) FROM reading_analytics WHERE date = :date")
    suspend fun getDailyReadingTime(date: String): Long?

    @Query("SELECT SUM(readingTimeSeconds) FROM reading_analytics WHERE date BETWEEN :startDate AND :endDate")
    suspend fun getReadingTimeInRange(startDate: String, endDate: String): Long?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAnalytics(analytics: ReadingAnalyticsEntry): Long

    @Update
    suspend fun updateAnalytics(analytics: ReadingAnalyticsEntry)

    @Query("DELETE FROM reading_analytics WHERE itemId = :itemId")
    suspend fun deleteAnalyticsByItemId(itemId: Long)

    // Reading Sessions

    @Query("SELECT * FROM reading_session_logs WHERE itemId = :itemId ORDER BY startTime DESC")
    fun getSessionsByItemId(itemId: Long): Flow<List<ReadingSessionLog>>

    @Query("SELECT * FROM reading_session_logs WHERE startTime BETWEEN :startTime AND :endTime ORDER BY startTime DESC")
    fun getSessionsInTimeRange(startTime: Long, endTime: Long): Flow<List<ReadingSessionLog>>

    @Query("SELECT * FROM reading_session_logs WHERE endTime IS NULL LIMIT 1")
    suspend fun getActiveSession(): ReadingSessionLog?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSession(session: ReadingSessionLog): Long

    @Update
    suspend fun updateSession(session: ReadingSessionLog)

    @Query("UPDATE reading_session_logs SET endTime = :endTime, durationSeconds = :duration, endProgress = :progress WHERE sessionId = :sessionId")
    suspend fun endSession(sessionId: Long, endTime: Long, duration: Long, progress: Float)

    @Query("DELETE FROM reading_session_logs WHERE itemId = :itemId")
    suspend fun deleteSessionsByItemId(itemId: Long)

    // AI Insights

    @Query("SELECT * FROM ai_book_insights WHERE itemId = :itemId")
    fun getInsightsByItemId(itemId: Long): Flow<List<ReaderAIInsight>>

    @Query("SELECT * FROM ai_book_insights WHERE itemId = :itemId AND insightType = :type")
    suspend fun getInsightByType(itemId: Long, type: ReaderAIInsightType): ReaderAIInsight?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertInsight(insight: ReaderAIInsight): Long

    @Update
    suspend fun updateInsight(insight: ReaderAIInsight)

    @Delete
    suspend fun deleteInsight(insight: ReaderAIInsight)

    @Query("DELETE FROM ai_book_insights WHERE itemId = :itemId")
    suspend fun deleteInsightsByItemId(itemId: Long)
}
