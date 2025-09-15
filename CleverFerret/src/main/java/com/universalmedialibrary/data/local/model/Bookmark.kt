package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "bookmarks",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["mediaItemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("mediaItemId")]
)
data class Bookmark(
    @PrimaryKey(autoGenerate = true)
    val bookmarkId: Long = 0,
    val mediaItemId: Long,
    val position: String, // JSON string containing position data
    val timestamp: Long = System.currentTimeMillis(),
    val note: String? = null,
    val type: String = "MANUAL" // MANUAL, AUTO_SAVE, CHAPTER_START, ANNOTATION
)

@Entity(
    tableName = "reading_progress",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["mediaItemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index(value = ["mediaItemId"], unique = true)]
)
data class ReadingProgress(
    @PrimaryKey
    val mediaItemId: Long,
    val currentPosition: String, // JSON with chapter, page, percentage, etc.
    val totalPages: Int = 0,
    val pagesRead: Int = 0,
    val percentComplete: Float = 0f,
    val lastReadTimestamp: Long = System.currentTimeMillis(),
    val totalReadingTime: Long = 0, // in milliseconds
    val readingSessions: Int = 0
)

@Entity(
    tableName = "reading_sessions",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["mediaItemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("mediaItemId")]
)
data class ReadingSession(
    @PrimaryKey(autoGenerate = true)
    val sessionId: Long = 0,
    val mediaItemId: Long,
    val startTime: Long,
    val endTime: Long? = null,
    val pagesRead: Int = 0,
    val startPosition: String,
    val endPosition: String? = null
)