package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.TextAnnotation
import com.universalmedialibrary.data.local.entity.SearchIndex
import com.universalmedialibrary.data.local.entity.ReadingStatistics
import kotlinx.coroutines.flow.Flow

/**
 * DAO for TextAnnotation operations
 */
@Dao
interface AnnotationDao {

    @Query("SELECT * FROM text_annotations WHERE itemId = :itemId AND isDeleted = 0 ORDER BY chapterIndex, startOffset")
    fun getAnnotationsForBook(itemId: Long): Flow<List<TextAnnotation>>

    @Query("SELECT * FROM text_annotations WHERE itemId = :itemId AND chapterIndex = :chapterIndex AND isDeleted = 0 ORDER BY startOffset")
    fun getAnnotationsForChapter(itemId: Long, chapterIndex: Int): Flow<List<TextAnnotation>>

    @Query("SELECT * FROM text_annotations WHERE annotationType = :type AND isDeleted = 0 ORDER BY dateCreated DESC")
    fun getAnnotationsByType(type: String): Flow<List<TextAnnotation>>

    @Query("SELECT * FROM text_annotations WHERE noteText IS NOT NULL AND noteText != '' AND isDeleted = 0 ORDER BY dateCreated DESC")
    fun getAnnotationsWithNotes(): Flow<List<TextAnnotation>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAnnotation(annotation: TextAnnotation): Long

    @Update
    suspend fun updateAnnotation(annotation: TextAnnotation)

    @Query("UPDATE text_annotations SET isDeleted = 1 WHERE annotationId = :annotationId")
    suspend fun deleteAnnotation(annotationId: Long)

    @Query("DELETE FROM text_annotations WHERE itemId = :itemId")
    suspend fun deleteAllAnnotationsForBook(itemId: Long)
}

/**
 * DAO for Search Index operations
 */
@Dao
interface SearchIndexDao {

    @Query("SELECT * FROM search_index WHERE itemId = :itemId AND searchText LIKE '%' || :query || '%' ORDER BY chapterIndex, startOffset")
    suspend fun searchInBook(itemId: Long, query: String): List<SearchIndex>

    @Query("SELECT * FROM search_index WHERE searchText LIKE '%' || :query || '%' ORDER BY itemId, chapterIndex, startOffset")
    suspend fun searchAcrossBooks(query: String): List<SearchIndex>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSearchIndex(searchIndex: SearchIndex): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSearchIndexes(searchIndexes: List<SearchIndex>)

    @Query("DELETE FROM search_index WHERE itemId = :itemId")
    suspend fun deleteSearchIndexForBook(itemId: Long)

    @Query("SELECT COUNT(*) FROM search_index WHERE itemId = :itemId")
    suspend fun getIndexedChapterCount(itemId: Long): Int
}

/**
 * DAO for Reading Statistics operations
 */
@Dao
interface ReadingStatisticsDao {

    @Query("SELECT * FROM reading_statistics WHERE itemId = :itemId ORDER BY date DESC")
    fun getStatisticsForBook(itemId: Long): Flow<List<ReadingStatistics>>

    @Query("SELECT * FROM reading_statistics WHERE date >= :startDate AND date <= :endDate ORDER BY date DESC")
    fun getStatisticsForDateRange(startDate: Long, endDate: Long): Flow<List<ReadingStatistics>>

    @Query("SELECT * FROM reading_statistics WHERE itemId = :itemId AND date = :date LIMIT 1")
    suspend fun getStatisticsForBookAndDate(itemId: Long, date: Long): ReadingStatistics?

    @Query("SELECT SUM(readingTimeMinutes) FROM reading_statistics WHERE itemId = :itemId")
    suspend fun getTotalReadingTimeForBook(itemId: Long): Int?

    @Query("SELECT SUM(readingTimeMinutes) FROM reading_statistics WHERE date >= :startDate AND date <= :endDate")
    suspend fun getTotalReadingTimeForPeriod(startDate: Long, endDate: Long): Int?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertStatistics(statistics: ReadingStatistics): Long

    @Update
    suspend fun updateStatistics(statistics: ReadingStatistics)

    @Query("DELETE FROM reading_statistics WHERE itemId = :itemId")
    suspend fun deleteStatisticsForBook(itemId: Long)
}
