package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.model.Bookmark
import com.universalmedialibrary.data.local.model.ReadingProgress
import com.universalmedialibrary.data.local.model.ReadingSession
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object (DAO) for managing bookmarks, reading progress, and reading sessions.
 * This interface defines the database interactions for all user reading activities.
 */
@Dao
interface BookmarkDao {

    // --- Bookmark Operations ---

    /**
     * Inserts a new bookmark. If a bookmark with the same primary key already exists, it is replaced.
     *
     * @param bookmark The [Bookmark] object to insert.
     * @return The row ID of the newly inserted bookmark.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertBookmark(bookmark: Bookmark): Long

    /**
     * Retrieves all bookmarks for a specific media item, ordered by the most recent timestamp.
     *
     * @param mediaItemId The unique identifier of the media item.
     * @return A list of [Bookmark] objects associated with the media item.
     */
    @Query("SELECT * FROM bookmarks WHERE mediaItemId = :mediaItemId ORDER BY timestamp DESC")
    suspend fun getBookmarksByMediaItem(mediaItemId: Long): List<Bookmark>

    /**
     * Deletes a bookmark from the database by its unique ID.
     *
     * @param bookmarkId The unique identifier of the bookmark to delete.
     */
    @Query("DELETE FROM bookmarks WHERE bookmarkId = :bookmarkId")
    suspend fun deleteBookmark(bookmarkId: Long)

    /**
     * Deletes all bookmarks associated with a specific media item. Useful for cleanup when an item is deleted.
     *
     * @param mediaItemId The unique identifier of the media item whose bookmarks should be deleted.
     */
    @Query("DELETE FROM bookmarks WHERE mediaItemId = :mediaItemId")
    suspend fun deleteAllBookmarksForItem(mediaItemId: Long)

    // --- Reading Progress Operations ---

    /**
     * Inserts or updates the reading progress for a media item.
     *
     * @param progress The [ReadingProgress] object containing the latest progress data.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertOrUpdateReadingProgress(progress: ReadingProgress)

    /**
     * Retrieves the current reading progress for a specific media item.
     *
     * @param mediaItemId The unique identifier of the media item.
     * @return The [ReadingProgress] for the item, or `null` if no progress has been recorded.
     */
    @Query("SELECT * FROM reading_progress WHERE mediaItemId = :mediaItemId")
    suspend fun getReadingProgress(mediaItemId: Long): ReadingProgress?

    /**
     * Retrieves the reading progress for all media items, ordered by the most recently read.
     *
     * @return A [Flow] that emits a list of all [ReadingProgress] objects, updating automatically on changes.
     */
    @Query("SELECT * FROM reading_progress ORDER BY lastReadTimestamp DESC")
    fun getAllReadingProgress(): Flow<List<ReadingProgress>>

    /**
     * Retrieves all media items that are currently being read (i.e., less than 100% complete).
     *
     * @return A [Flow] that emits a list of in-progress [ReadingProgress] objects.
     */
    @Query("SELECT * FROM reading_progress WHERE percentComplete < 100 ORDER BY lastReadTimestamp DESC")
    fun getInProgressReadings(): Flow<List<ReadingProgress>>

    /**
     * Retrieves all media items that have been marked as finished (100% complete).
     *
     * @return A list of finished [ReadingProgress] objects.
     */
    @Query("SELECT * FROM reading_progress WHERE percentComplete = 100 ORDER BY lastReadTimestamp DESC")
    suspend fun getFinishedReadings(): List<ReadingProgress>

    /**
     * Deletes the reading progress record for a specific media item.
     *
     * @param mediaItemId The unique identifier of the media item whose progress should be deleted.
     */
    @Query("DELETE FROM reading_progress WHERE mediaItemId = :mediaItemId")
    suspend fun deleteReadingProgress(mediaItemId: Long)

    // --- Reading Session Operations ---

    /**
     * Inserts a new reading session into the database.
     *
     * @param session The [ReadingSession] object to insert.
     * @return The row ID of the newly inserted session.
     */
    @Insert
    suspend fun insertReadingSession(session: ReadingSession): Long

    /**
     * Updates an existing reading session, typically to set the end time and pages read.
     *
     * @param session The [ReadingSession] object to update.
     */
    @Update
    suspend fun updateReadingSession(session: ReadingSession)

    /**
     * Retrieves a specific reading session by its unique ID.
     *
     * @param sessionId The unique identifier of the session to retrieve.
     * @return The [ReadingSession] object, or `null` if not found.
     */
    @Query("SELECT * FROM reading_sessions WHERE sessionId = :sessionId")
    suspend fun getReadingSession(sessionId: Long): ReadingSession?

    /**
     * Retrieves all reading sessions for a specific media item, ordered by the most recent start time.
     *
     * @param mediaItemId The unique identifier of the media item.
     * @return A list of [ReadingSession] objects for the item.
     */
    @Query("SELECT * FROM reading_sessions WHERE mediaItemId = :mediaItemId ORDER BY startTime DESC")
    suspend fun getReadingSessionsForItem(mediaItemId: Long): List<ReadingSession>

    /**
     * Deletes all reading sessions for a specific media item.
     *
     * @param mediaItemId The unique identifier of the media item whose sessions should be deleted.
     */
    @Query("DELETE FROM reading_sessions WHERE mediaItemId = :mediaItemId")
    suspend fun deleteReadingSessionsForItem(mediaItemId: Long)

    // --- Statistics ---

    /**
     * Gets the total count of distinct media items marked as finished.
     *
     * @return The total count of finished items.
     */
    @Query("SELECT COUNT(DISTINCT mediaItemId) FROM reading_progress WHERE percentComplete = 100")
    suspend fun getTotalBooksRead(): Int

    /**
     * Calculates the total number of pages read across all media items.
     *
     * @return The sum of all pages read.
     */
    @Query("SELECT SUM(pagesRead) FROM reading_progress")
    suspend fun getTotalPagesRead(): Int

    /**
     * Calculates the total reading time in milliseconds across all media items.
     *
     * @return The sum of all reading time.
     */
    @Query("SELECT SUM(totalReadingTime) FROM reading_progress")
    suspend fun getTotalReadingTime(): Long

    /**
     * Retrieves the IDs of the most recently read media items, up to a specified limit.
     *
     * @param limit The maximum number of item IDs to return.
     * @return A list of media item IDs.
     */
    @Query("""
        SELECT mediaItemId FROM reading_progress 
        ORDER BY lastReadTimestamp DESC 
        LIMIT :limit
    """)
    suspend fun getRecentlyReadItemIds(limit: Int): List<Long>

    /**
     * Marks a media item's progress as 100% complete.
     *
     * @param mediaItemId The ID of the media item to mark as finished.
     * @param timestamp The timestamp for when the item was finished.
     */
    @Query("""
        UPDATE reading_progress 
        SET percentComplete = 100, currentPosition = 'finished', lastReadTimestamp = :timestamp
        WHERE mediaItemId = :mediaItemId
    """)
    suspend fun markAsFinished(mediaItemId: Long, timestamp: Long)
}