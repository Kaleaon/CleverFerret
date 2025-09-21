package com.universalmedialibrary.services

import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.model.Bookmark as BookmarkEntity
import com.universalmedialibrary.data.local.model.ReadingProgress as ProgressEntity
import com.universalmedialibrary.data.local.model.ReadingSession as SessionEntity
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing bookmarks, reading progress, sessions, and statistics.
 * This service provides a comprehensive API for all reading-related data.
 *
 * @param bookmarkDao The DAO for accessing bookmark and reading progress data.
 * @param mediaItemDao The DAO for accessing media item data.
 * @param metadataDao The DAO for accessing metadata.
 */
@Singleton
class BookmarkService @Inject constructor(
    private val bookmarkDao: BookmarkDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {

    /**
     * Represents a bookmark for a media item.
     *
     * @param id The unique identifier of the bookmark.
     * @param mediaItemId The ID of the media item being bookmarked.
     * @param position A JSON string containing detailed position data (e.g., page, chapter, percentage).
     * @param timestamp The time the bookmark was created.
     * @param note An optional user-provided note for the bookmark.
     * @param type The type of the bookmark (e.g., manual, auto-save).
     */
    data class Bookmark(
        val id: Long = 0,
        val mediaItemId: Long,
        val position: String, // JSON string containing position data
        val timestamp: Long = System.currentTimeMillis(),
        val note: String? = null,
        val type: BookmarkType = BookmarkType.MANUAL
    )

    /**
     * Defines the type of a bookmark.
     */
    enum class BookmarkType {
        /** A bookmark manually created by the user. */
        MANUAL,
        /** A bookmark automatically saved to preserve reading progress. */
        AUTO_SAVE,
        /** A bookmark marking the beginning of a chapter. */
        CHAPTER_START,
        /** A bookmark associated with a user annotation. */
        ANNOTATION
    }

    /**
     * Represents the reading progress for a media item.
     *
     * @param mediaItemId The ID of the media item.
     * @param currentPosition A JSON string with detailed current position info.
     * @param totalPages The total number of pages in the media item.
     * @param pagesRead The number of pages read by the user.
     * @param percentComplete The percentage of the media item that has been read.
     * @param lastReadTimestamp The timestamp of the last reading activity.
     * @param totalReadingTime The total time spent reading, in milliseconds.
     * @param readingSessions The total number of reading sessions.
     */
    data class ReadingProgress(
        val mediaItemId: Long,
        val currentPosition: String, // JSON with chapter, page, percentage, etc.
        val totalPages: Int = 0,
        val pagesRead: Int = 0,
        val percentComplete: Float = 0f,
        val lastReadTimestamp: Long = System.currentTimeMillis(),
        val totalReadingTime: Long = 0, // in milliseconds
        val readingSessions: Int = 0
    )

    /**
     * Represents a single reading session.
     *
     * @param id The unique identifier of the session.
     * @param mediaItemId The ID of the media item being read.
     * @param startTime The start time of the session.
     * @param endTime The end time of the session.
     * @param pagesRead The number of pages read during the session.
     * @param startPosition The starting position of the session.
     * @param endPosition The ending position of the session.
     */
    data class ReadingSession(
        val id: Long = 0,
        val mediaItemId: Long,
        val startTime: Long,
        val endTime: Long? = null,
        val pagesRead: Int = 0,
        val startPosition: String,
        val endPosition: String? = null
    )

    /**
     * Represents overall reading statistics for the user.
     *
     * @param totalBooksRead The total number of books finished.
     * @param totalPagesRead The total number of pages read across all media.
     * @param totalReadingTime The total time spent reading, in milliseconds.
     * @param averageReadingSpeed The average reading speed in pages per hour.
     * @param currentStreak The current daily reading streak in days.
     * @param longestStreak The longest daily reading streak in days.
     * @param favoriteGenres A list of the user's most-read genres.
     * @param monthlyStats A map of monthly reading statistics.
     */
    data class ReadingStats(
        val totalBooksRead: Int = 0,
        val totalPagesRead: Int = 0,
        val totalReadingTime: Long = 0, // in milliseconds
        val averageReadingSpeed: Float = 0f, // pages per hour
        val currentStreak: Int = 0, // days
        val longestStreak: Int = 0, // days
        val favoriteGenres: List<String> = emptyList(),
        val monthlyStats: Map<String, MonthlyStats> = emptyMap()
    )

    /**
     * Represents reading statistics for a single month.
     *
     * @param month The month in "YYYY-MM" format.
     * @param booksRead The number of books read in the month.
     * @param pagesRead The number of pages read in the month.
     * @param readingTime The total reading time in milliseconds for the month.
     * @param uniqueReadingDays The number of unique days the user read in the month.
     */
    data class MonthlyStats(
        val month: String, // "2024-01"
        val booksRead: Int,
        val pagesRead: Int,
        val readingTime: Long,
        val uniqueReadingDays: Int
    )

    /**
     * Saves a bookmark to the database.
     *
     * @param bookmark The bookmark to save.
     * @return The ID of the newly created bookmark.
     */
    suspend fun saveBookmark(bookmark: Bookmark): Long {
        val entity = BookmarkEntity(
            mediaItemId = bookmark.mediaItemId,
            position = bookmark.position,
            timestamp = bookmark.timestamp,
            note = bookmark.note,
            type = bookmark.type.name
        )
        return bookmarkDao.insertBookmark(entity)
    }

    /**
     * Retrieves all bookmarks for a specific media item.
     *
     * @param mediaItemId The ID of the media item.
     * @return A list of bookmarks.
     */
    suspend fun getBookmarks(mediaItemId: Long): List<Bookmark> {
        return bookmarkDao.getBookmarksByMediaItem(mediaItemId).map { entity ->
            Bookmark(
                id = entity.bookmarkId,
                mediaItemId = entity.mediaItemId,
                position = entity.position,
                timestamp = entity.timestamp,
                note = entity.note,
                type = BookmarkType.valueOf(entity.type)
            )
        }
    }

    /**
     * Deletes a bookmark from the database.
     *
     * @param bookmarkId The ID of the bookmark to delete.
     */
    suspend fun deleteBookmark(bookmarkId: Long) {
        bookmarkDao.deleteBookmark(bookmarkId)
    }

    /**
     * Updates the reading progress for a media item.
     *
     * @param progress The reading progress data to save.
     */
    suspend fun updateReadingProgress(progress: ReadingProgress) {
        val entity = ProgressEntity(
            mediaItemId = progress.mediaItemId,
            currentPosition = progress.currentPosition,
            totalPages = progress.totalPages,
            pagesRead = progress.pagesRead,
            percentComplete = progress.percentComplete,
            lastReadTimestamp = progress.lastReadTimestamp,
            totalReadingTime = progress.totalReadingTime,
            readingSessions = progress.readingSessions
        )
        bookmarkDao.insertOrUpdateReadingProgress(entity)

        // Update last accessed time in media item
        mediaItemDao.updateLastAccessed(progress.mediaItemId, java.util.Date())
    }

    /**
     * Retrieves the reading progress for a specific media item.
     *
     * @param mediaItemId The ID of the media item.
     * @return The reading progress, or null if none exists.
     */
    suspend fun getReadingProgress(mediaItemId: Long): ReadingProgress? {
        return bookmarkDao.getReadingProgress(mediaItemId)?.let { entity ->
            ReadingProgress(
                mediaItemId = entity.mediaItemId,
                currentPosition = entity.currentPosition,
                totalPages = entity.totalPages,
                pagesRead = entity.pagesRead,
                percentComplete = entity.percentComplete,
                lastReadTimestamp = entity.lastReadTimestamp,
                totalReadingTime = entity.totalReadingTime,
                readingSessions = entity.readingSessions
            )
        }
    }

    /**
     * Retrieves the reading progress for all media items as a flow.
     *
     * @return A flow emitting a list of reading progress data.
     */
    fun getAllReadingProgress(): Flow<List<ReadingProgress>> {
        return bookmarkDao.getAllReadingProgress().map { entities ->
            entities.map { entity ->
                ReadingProgress(
                    mediaItemId = entity.mediaItemId,
                    currentPosition = entity.currentPosition,
                    totalPages = entity.totalPages,
                    pagesRead = entity.pagesRead,
                    percentComplete = entity.percentComplete,
                    lastReadTimestamp = entity.lastReadTimestamp,
                    totalReadingTime = entity.totalReadingTime,
                    readingSessions = entity.readingSessions
                )
            }
        }
    }

    /**
     * Starts a new reading session.
     *
     * @param mediaItemId The ID of the media item being read.
     * @param startPosition The starting position of the session.
     * @return The ID of the newly created reading session.
     */
    suspend fun startReadingSession(
        mediaItemId: Long,
        startPosition: String
    ): Long {
        val session = SessionEntity(
            mediaItemId = mediaItemId,
            startTime = System.currentTimeMillis(),
            startPosition = startPosition
        )
        return bookmarkDao.insertReadingSession(session)
    }

    /**
     * Ends an existing reading session and updates progress.
     *
     * @param sessionId The ID of the session to end.
     * @param endPosition The ending position of the session.
     * @param pagesRead The number of pages read during the session.
     */
    suspend fun endReadingSession(
        sessionId: Long,
        endPosition: String,
        pagesRead: Int
    ) {
        val session = bookmarkDao.getReadingSession(sessionId)
        session?.let {
            val updatedSession = it.copy(
                endTime = System.currentTimeMillis(),
                endPosition = endPosition,
                pagesRead = pagesRead
            )
            bookmarkDao.updateReadingSession(updatedSession)

            // Update reading progress
            val progress = bookmarkDao.getReadingProgress(it.mediaItemId)
            if (progress != null) {
                val updatedProgress = progress.copy(
                    totalReadingTime = progress.totalReadingTime +
                        (updatedSession.endTime!! - it.startTime),
                    readingSessions = progress.readingSessions + 1,
                    pagesRead = progress.pagesRead + pagesRead
                )
                bookmarkDao.insertOrUpdateReadingProgress(updatedProgress)
            }
        }
    }

    /**
     * Retrieves overall reading statistics.
     *
     * @return An object containing overall reading stats.
     */
    suspend fun getReadingStats(): ReadingStats {
        val totalBooksRead = bookmarkDao.getTotalBooksRead()
        val totalPagesRead = bookmarkDao.getTotalPagesRead() ?: 0
        val totalReadingTime = bookmarkDao.getTotalReadingTime() ?: 0L

        val averageReadingSpeed = if (totalReadingTime > 0) {
            (totalPagesRead.toFloat() / (totalReadingTime / 3600000f)) // pages per hour
        } else 0f

        return ReadingStats(
            totalBooksRead = totalBooksRead,
            totalPagesRead = totalPagesRead,
            totalReadingTime = totalReadingTime,
            averageReadingSpeed = averageReadingSpeed
        )
    }

    /**
     * Retrieves reading statistics for a specific time period.
     *
     * @param startDate The start date of the period in milliseconds.
     * @param endDate The end date of the period in milliseconds.
     * @return An object containing reading stats for the specified period.
     */
    suspend fun getReadingStatsForPeriod(
        startDate: Long,
        endDate: Long
    ): ReadingStats {
        // Filter reading sessions within the date range
        val finishedBooks = bookmarkDao.getFinishedReadings().filter {
            it.lastReadTimestamp in startDate..endDate
        }

        return ReadingStats(
            totalBooksRead = finishedBooks.size,
            totalPagesRead = finishedBooks.sumOf { it.pagesRead },
            totalReadingTime = finishedBooks.sumOf { it.totalReadingTime }
        )
    }

    /**
     * Exports the user's reading history to a CSV formatted string.
     *
     * @return A string containing the reading history in CSV format.
     */
    suspend fun exportReadingHistory(): String {
        val allProgress = bookmarkDao.getFinishedReadings()
        val csv = StringBuilder()
        csv.append("Media ID,Position,Pages Read,Percent Complete,Last Read,Total Time (min)\n")

        allProgress.forEach { progress ->
            csv.append("${progress.mediaItemId},")
            csv.append("${progress.currentPosition},")
            csv.append("${progress.pagesRead},")
            csv.append("${progress.percentComplete},")
            csv.append("${progress.lastReadTimestamp},")
            csv.append("${progress.totalReadingTime / 60000}\n")
        }

        return csv.toString()
    }

    /**
     * Imports reading history from a CSV formatted string.
     *
     * @param data The string containing the reading history in CSV format.
     * @return `true` if the import was successful, `false` otherwise.
     */
    suspend fun importReadingHistory(data: String): Boolean {
        return try {
            val lines = data.lines()
            if (lines.isEmpty()) return false

            // Skip header
            lines.drop(1).forEach { line ->
                val parts = line.split(",")
                if (parts.size >= 6) {
                    val progress = ProgressEntity(
                        mediaItemId = parts[0].toLong(),
                        currentPosition = parts[1],
                        pagesRead = parts[2].toInt(),
                        percentComplete = parts[3].toFloat(),
                        lastReadTimestamp = parts[4].toLong(),
                        totalReadingTime = parts[5].toLong() * 60000
                    )
                    bookmarkDao.insertOrUpdateReadingProgress(progress)
                }
            }
            true
        } catch (e: Exception) {
            e.printStackTrace()
            false
        }
    }

    /**
     * Retrieves a list of recently read media item IDs.
     *
     * @param limit The maximum number of items to retrieve.
     * @return A list of media item IDs.
     */
    suspend fun getRecentlyRead(limit: Int = 10): List<Long> {
        return bookmarkDao.getRecentlyReadItemIds(limit)
    }

    /**
     * Marks a media item as finished.
     *
     * @param mediaItemId The ID of the media item to mark as finished.
     */
    suspend fun markAsFinished(mediaItemId: Long) {
        bookmarkDao.markAsFinished(mediaItemId, System.currentTimeMillis())
    }

    /**
     * Generates reading recommendations based on the user's history.
     *
     * @return A list of recommended media item IDs.
     */
    suspend fun getRecommendations(): List<Long> {
        // Get recently read items
        val recentlyRead = bookmarkDao.getRecentlyReadItemIds(20)

        // In a real implementation, analyze genres, authors, and reading patterns
        // For now, return empty list
        return emptyList()
    }
}