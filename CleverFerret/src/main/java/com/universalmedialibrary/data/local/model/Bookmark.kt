package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Represents a bookmark within a media item.
 *
 * @property bookmarkId The unique identifier for the bookmark.
 * @property mediaItemId The ID of the media item this bookmark belongs to.
 * @property position A flexible string (e.g., JSON) storing the exact location of the bookmark.
 * @property timestamp The time the bookmark was created.
 * @property note An optional user-provided note for the bookmark.
 * @property type The type of bookmark (e.g., "MANUAL", "AUTO_SAVE").
 */
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
    /** A flexible string (e.g., JSON) storing the exact location data (e.g., page, chapter, percentage). */
    val position: String,
    val timestamp: Long = System.currentTimeMillis(),
    val note: String? = null,
    /** The type of bookmark. Can be "MANUAL", "AUTO_SAVE", "CHAPTER_START", or "ANNOTATION". */
    val type: String = "MANUAL"
)

/**
 * Tracks the overall reading progress for a single media item.
 *
 * @property mediaItemId The ID of the media item this progress belongs to.
 * @property currentPosition A flexible string (e.g., JSON) storing the last known position.
 * @property totalPages The total number of pages in the media item.
 * @property pagesRead The number of pages the user has read.
 * @property percentComplete The percentage of the media item the user has completed.
 * @property lastReadTimestamp The timestamp of the last reading activity.
 * @property totalReadingTime The total time spent reading, in milliseconds.
 * @property readingSessions The total number of reading sessions.
 */
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
    /** A flexible string (e.g., JSON) with detailed position info (chapter, page, percentage). */
    val currentPosition: String,
    val totalPages: Int = 0,
    val pagesRead: Int = 0,
    val percentComplete: Float = 0f,
    val lastReadTimestamp: Long = System.currentTimeMillis(),
    val totalReadingTime: Long = 0, // in milliseconds
    val readingSessions: Int = 0
)

/**
 * Represents a single, continuous reading session.
 *
 * @property sessionId The unique identifier for the session.
 * @property mediaItemId The ID of the media item being read.
 * @property startTime The timestamp when the session began.
 * @property endTime The timestamp when the session ended.
 * @property pagesRead The number of pages read during this session.
 * @property startPosition The reading position at the start of the session.
 * @property endPosition The reading position at the end of the session.
 */
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