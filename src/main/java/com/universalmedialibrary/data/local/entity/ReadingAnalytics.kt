package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import androidx.room.TypeConverters
import com.universalmedialibrary.data.local.converters.StringListConverter
import kotlinx.serialization.Serializable

/**
 * ReadingAnalytics entity - tracks reading time and habits
 * Inspired by Anx-reader's reading insights feature
 */
@Serializable
@Entity(
    tableName = "reading_analytics",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["date"])
    ]
)
data class ReadingAnalytics(
    @PrimaryKey(autoGenerate = true)
    val analyticsId: Long = 0,
    
    val itemId: Long,
    val date: String, // Format: YYYY-MM-DD
    
    // Reading Time (in seconds)
    val readingTimeSeconds: Long = 0,
    
    // Pages/Progress
    val pagesRead: Int = 0,
    val wordsRead: Int = 0,
    
    // Session Information
    val sessionCount: Int = 0,
    val averageSessionDuration: Long = 0,
    
    // Timestamps
    val firstReadTime: Long = System.currentTimeMillis(),
    val lastReadTime: Long = System.currentTimeMillis()
)

/**
 * Reading session for detailed tracking
 */
@Serializable
@Entity(
    tableName = "reading_sessions",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["startTime"])
    ]
)
data class ReadingSession(
    @PrimaryKey(autoGenerate = true)
    val sessionId: Long = 0,
    
    val itemId: Long,
    val startTime: Long,
    val endTime: Long? = null,
    val durationSeconds: Long = 0,
    
    // Progress during session
    val startProgress: Float = 0f,
    val endProgress: Float = 0f,
    val pagesRead: Int = 0,
    
    // Context
    val deviceInfo: String? = null
)

/**
 * AI-generated insights for books
 * Inspired by Anx-reader's AI features
 */
@Serializable
@Entity(
    tableName = "ai_book_insights",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index(value = ["itemId"])]
)
@TypeConverters(StringListConverter::class)
data class AIBookInsight(
    @PrimaryKey(autoGenerate = true)
    val insightId: Long = 0,
    
    val itemId: Long,
    val insightType: AIInsightType,
    
    // Generated Content
    val summary: String? = null,
    val mindMap: String? = null, // JSON format
    val keyThemes: List<String> = emptyList(),
    val characterAnalysis: String? = null,
    val perspectiveAnalysis: String? = null,
    
    // Metadata
    val generatedAt: Long = System.currentTimeMillis(),
    val modelUsed: String? = null,
    val confidence: Float = 0f
)

enum class AIInsightType {
    SUMMARY,
    MIND_MAP,
    THEMES,
    CHARACTER_ANALYSIS,
    PERSPECTIVE,
    TRANSLATION
}