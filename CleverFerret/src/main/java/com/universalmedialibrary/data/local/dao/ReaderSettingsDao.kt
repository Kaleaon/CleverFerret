package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.ReaderSettingsEntity
import com.universalmedialibrary.data.local.entity.BookReaderSettingsEntity
import kotlinx.coroutines.flow.Flow

/**
 * DAO for reader settings operations
 */
@Dao
interface ReaderSettingsDao {

    // Global reader settings operations
    @Query("SELECT * FROM reader_settings WHERE id = 1 LIMIT 1")
    suspend fun getGlobalSettings(): ReaderSettingsEntity?

    @Query("SELECT * FROM reader_settings WHERE id = 1 LIMIT 1")
    fun getGlobalSettingsFlow(): Flow<ReaderSettingsEntity?>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertOrUpdateGlobalSettings(settings: ReaderSettingsEntity)

    @Update
    suspend fun updateGlobalSettings(settings: ReaderSettingsEntity)

    // Book-specific reader settings operations
    @Query("SELECT * FROM book_reader_settings WHERE mediaId = :mediaId LIMIT 1")
    suspend fun getBookSettings(mediaId: Long): BookReaderSettingsEntity?

    @Query("SELECT * FROM book_reader_settings WHERE mediaId = :mediaId LIMIT 1")
    fun getBookSettingsFlow(mediaId: Long): Flow<BookReaderSettingsEntity?>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertOrUpdateBookSettings(settings: BookReaderSettingsEntity)

    @Update
    suspend fun updateBookSettings(settings: BookReaderSettingsEntity)

    @Delete
    suspend fun deleteBookSettings(settings: BookReaderSettingsEntity)

    @Query("DELETE FROM book_reader_settings WHERE mediaId = :mediaId")
    suspend fun deleteBookSettingsById(mediaId: Long)

    // Query for all book settings
    @Query("SELECT * FROM book_reader_settings ORDER BY lastModified DESC")
    suspend fun getAllBookSettings(): List<BookReaderSettingsEntity>

    @Query("SELECT * FROM book_reader_settings ORDER BY lastModified DESC")
    fun getAllBookSettingsFlow(): Flow<List<BookReaderSettingsEntity>>

    // Reading progress operations
    @Query("UPDATE book_reader_settings SET currentChapter = :chapter, currentPosition = :position, totalProgress = :progress, lastModified = :timestamp WHERE mediaId = :mediaId")
    suspend fun updateReadingProgress(
        mediaId: Long,
        chapter: Int,
        position: Long,
        progress: Float,
        timestamp: Long = System.currentTimeMillis()
    )

    @Query("SELECT currentChapter, currentPosition, totalProgress FROM book_reader_settings WHERE mediaId = :mediaId LIMIT 1")
    suspend fun getReadingProgress(mediaId: Long): ReadingProgressData?

    // Cleanup operations
    @Query("DELETE FROM book_reader_settings WHERE mediaId NOT IN (SELECT itemId FROM media_items)")
    suspend fun cleanupOrphanedBookSettings()

    // Statistics
    @Query("SELECT COUNT(*) FROM book_reader_settings")
    suspend fun getBookSettingsCount(): Int

    @Query("SELECT AVG(totalProgress) FROM book_reader_settings WHERE totalProgress > 0")
    suspend fun getAverageReadingProgress(): Float?
}

/**
 * Data class for reading progress results
 */
data class ReadingProgressData(
    val currentChapter: Int,
    val currentPosition: Long,
    val totalProgress: Float
)
