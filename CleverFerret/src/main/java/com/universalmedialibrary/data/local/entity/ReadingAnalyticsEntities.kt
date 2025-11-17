package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import androidx.room.TypeConverters
import com.universalmedialibrary.data.local.converters.StringListConverter
import kotlinx.serialization.Serializable

/**
 * Daily reading analytics entry capturing aggregated metrics per book.
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
data class ReadingAnalyticsEntry(
    @PrimaryKey(autoGenerate = true)
    val analyticsId: Long = 0,

    val itemId: Long,
    val date: String,

    // Reading Time (in seconds)
    val readingTimeSeconds: Long = 0,

    // Progress metrics
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
 * Detailed reading session log to power analytics and history.
 */
@Serializable
@Entity(
    tableName = "reading_session_logs",
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
data class ReadingSessionLog(
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
    val wordsRead: Int = 0,

    // Context
    val deviceInfo: String? = null
)

/**
 * AI-generated insights for books.
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
data class ReaderAIInsight(
    @PrimaryKey(autoGenerate = true)
    val insightId: Long = 0,

    val itemId: Long,
    val insightType: ReaderAIInsightType,

    // Generated Content
    val summary: String? = null,
    val mindMap: String? = null,
    val keyThemes: List<String> = emptyList(),
    val characterAnalysis: String? = null,
    val perspectiveAnalysis: String? = null,

    // Metadata
    val generatedAt: Long = System.currentTimeMillis(),
    val modelUsed: String? = null,
    val confidence: Float = 0f
)

enum class ReaderAIInsightType {
    SUMMARY,
    MIND_MAP,
    THEMES,
    CHARACTER_ANALYSIS,
    PERSPECTIVE,
    TRANSLATION
}
