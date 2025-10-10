package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index
import kotlinx.serialization.Serializable

/**
 * Entity for storing bookmarks and reading progress
 */
@Serializable
@Entity(
    tableName = "bookmarks",
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
        Index(value = ["dateCreated"])
    ]
)
data class Bookmark(
    @PrimaryKey(autoGenerate = true)
    val bookmarkId: Long = 0,

    val itemId: Long,
    val title: String? = null,
    val description: String? = null,

    // Position information
    val position: Long = 0, // Position in milliseconds (video/audio) or characters (text)
    val page: Int? = null, // Page number for books
    val chapter: String? = null, // Chapter name/number
    val percentage: Float = 0f, // Progress as percentage (0.0 to 1.0)

    // Context information
    val contextBefore: String? = null, // Text before bookmark
    val contextAfter: String? = null, // Text after bookmark
    val screenCapture: String? = null, // Path to screenshot

    val bookmarkType: String = "MANUAL", // MANUAL, AUTO, RESUME
    val isActive: Boolean = true,
    val dateCreated: Long = System.currentTimeMillis(),
    val lastAccessed: Long? = null
)

/**
 * Entity for detailed reading progress tracking
 */
@Serializable
@Entity(
    tableName = "reading_progress",
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
        Index(value = ["lastUpdate"])
    ]
)
data class ReadingProgress(
    @PrimaryKey(autoGenerate = true)
    val progressId: Long = 0,

    val itemId: Long,

    // Current position
    val currentPosition: Long = 0, // Milliseconds or character position
    val currentPage: Int = 1,
    val currentChapter: Int = 1,
    val percentage: Float = 0f,

    // Session information
    val totalReadingTime: Long = 0, // Total time spent reading (milliseconds)
    val sessionCount: Int = 0,
    val averageSessionTime: Long = 0,

    // Progress tracking
    val isCompleted: Boolean = false,
    val completedDate: Long? = null,
    val startedDate: Long? = null,
    val lastUpdate: Long = System.currentTimeMillis(),

    // Reading statistics
    val pagesRead: Int = 0,
    val chaptersRead: Int = 0,
    val readingSpeed: Float? = null, // Pages per minute or WPM

    // Locator for precise position tracking (JSON string)
    val locator: String? = null,

    val notes: String? = null
)

/**
 * Entity for individual reading sessions
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
        Index(value = ["sessionStart"])
    ]
)
data class ReadingSession(
    @PrimaryKey(autoGenerate = true)
    val sessionId: Long = 0,

    val itemId: Long,

    val sessionStart: Long,
    val sessionEnd: Long? = null,
    val duration: Long = 0, // Duration in milliseconds

    val startPosition: Long = 0,
    val endPosition: Long = 0,
    val startPage: Int = 1,
    val endPage: Int = 1,

    val pagesRead: Int = 0,
    val charactersRead: Long = 0,
    val averageReadingSpeed: Float? = null,

    val deviceType: String? = null, // PHONE, TABLET, DESKTOP
    val appVersion: String? = null
)
