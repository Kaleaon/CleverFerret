package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.*

@Dao
interface MetadataDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataCommon(metadataCommon: MetadataCommon)

    @Update
    suspend fun updateMetadata(metadataCommon: MetadataCommon)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataBook(metadataBook: MetadataBook)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataMovie(metadataMovie: MetadataMovie)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataMusicTrack(metadataMusicTrack: MetadataMusicTrack)

    @Query("SELECT * FROM metadata_common WHERE itemId = :itemId")
    suspend fun getMetadataCommonByItemId(itemId: Long): MetadataCommon?

    @Query("SELECT * FROM metadata_book WHERE itemId = :itemId")
    suspend fun getMetadataBookByItemId(itemId: Long): MetadataBook?

    @Query("SELECT * FROM metadata_movie WHERE itemId = :itemId")
    suspend fun getMetadataMovieByItemId(itemId: Long): MetadataMovie?

    @Query("SELECT * FROM metadata_music_track WHERE itemId = :itemId")
    suspend fun getMetadataMusicTrackByItemId(itemId: Long): MetadataMusicTrack?

    // Basic metadata operations
    @Query("UPDATE metadata_common SET title = :title, summary = :summary WHERE itemId = :itemId")
    suspend fun updateMetadataCommon(itemId: Long, title: String, summary: String?)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCommonMetadata(metadata: MetadataCommon)

    // Additional methods expected by MediaRepository
    @Query("SELECT * FROM metadata_common WHERE itemId = :itemId")
    suspend fun getCommonMetadata(itemId: Long): MetadataCommon?

    @Query("SELECT * FROM metadata_common WHERE title LIKE '%' || :query || '%' OR summary LIKE '%' || :query || '%'")
    suspend fun searchByTitle(query: String): List<MetadataCommon>

    // Additional method for MediaRepository
    @Query("UPDATE metadata_common SET title = :title, summary = :summary WHERE itemId = :itemId")
    suspend fun updateCommonMetadata(itemId: Long, title: String, summary: String?)

    // Person operations
    @Query("SELECT personId FROM people WHERE name = :name LIMIT 1")
    suspend fun findPersonByName(name: String): Long?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPerson(person: People): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertItemPersonRole(itemPersonRole: ItemPersonRole)

    // Series operations
    @Query("SELECT seriesId FROM series WHERE name = :name LIMIT 1")
    suspend fun findSeriesByName(name: String): Long?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSeries(series: Series): Long

    @Query("UPDATE metadata_book SET series = :seriesId WHERE itemId = :itemId")
    suspend fun updateBookWithSeries(itemId: Long, seriesId: Long)

    // Genre operations
    @Query("SELECT genreId FROM genre WHERE name = :name LIMIT 1")
    suspend fun findGenreByName(name: String): Long?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertGenre(genre: Genre): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertItemGenre(itemGenre: ItemGenre)

    // Missing methods for MetadataEditorViewModel
    @Query("""
        SELECT p.name FROM people p
        INNER JOIN item_person_role ipr ON p.personId = ipr.personId
        WHERE ipr.itemId = :itemId AND ipr.role = 'AUTHOR'
    """)
    suspend fun getAuthorsByItemId(itemId: Long): List<String>

    @Query("""
        SELECT s.name FROM series s
        INNER JOIN metadata_book mb ON s.seriesId = mb.series
        WHERE mb.itemId = :itemId
        LIMIT 1
    """)
    suspend fun getSeriesByItemId(itemId: Long): String?

    @Query("""
        SELECT g.name FROM genre g
        INNER JOIN item_genre ig ON g.genreId = ig.genreId
        WHERE ig.itemId = :itemId
    """)
    suspend fun getGenresByItemId(itemId: Long): List<String>

    @Query("DELETE FROM item_person_role WHERE itemId = :itemId AND role = 'AUTHOR'")
    suspend fun deleteAuthorsByItemId(itemId: Long)

    @Query("DELETE FROM item_genre WHERE itemId = :itemId")
    suspend fun deleteGenresByItemId(itemId: Long)

    @Query("""
        UPDATE metadata_common
        SET title = :title, sortTitle = :sortTitle, summary = :summary, rating = :rating
        WHERE itemId = :itemId
    """)
    suspend fun updateMetadataCommon(
        itemId: Long,
        title: String,
        sortTitle: String?,
        summary: String?,
        rating: Float?
    )

    @Query("""
        UPDATE metadata_book
        SET subtitle = :subtitle, publisher = :publisher, isbn = :isbn
        WHERE itemId = :itemId
    """)
    suspend fun updateMetadataBook(
        itemId: Long,
        subtitle: String?,
        publisher: String?,
        isbn: String?
    )

    /**
     * Reading statistics
     */
    @Query(
        """
        SELECT COUNT(*) FROM metadata_book AS mb
        INNER JOIN media_items AS mi ON mi.itemId = mb.itemId
        WHERE mi.libraryId = :libraryId
          AND mi.mediaType = 'BOOK'
          AND mb.isRead = 1
        """
    )
    suspend fun getCompletedBooksCount(libraryId: Long): Int

    @Query(
        """
        SELECT COALESCE(SUM(
            CASE
                WHEN mb.pageCount IS NOT NULL THEN mb.pageCount
                WHEN mb.printLength IS NOT NULL THEN mb.printLength
                ELSE 0
            END
        ), 0)
        FROM metadata_book AS mb
        INNER JOIN media_items AS mi ON mi.itemId = mb.itemId
        WHERE mi.libraryId = :libraryId
          AND mi.mediaType = 'BOOK'
          AND mb.isRead = 1
        """
    )
    suspend fun getTotalPagesRead(libraryId: Long): Int

    @Query(
        """
        SELECT COUNT(*) FROM metadata_book AS mb
        INNER JOIN media_items AS mi ON mi.itemId = mb.itemId
        WHERE mi.libraryId = :libraryId
          AND mi.mediaType = 'BOOK'
          AND mb.isRead = 1
          AND mb.lastReadDate IS NOT NULL
          AND mb.lastReadDate >= :since
        """
    )
    suspend fun getBooksReadSince(libraryId: Long, since: Long): Int

    @Query(
        """
        SELECT COUNT(*) FROM metadata_book AS mb
        INNER JOIN media_items AS mi ON mi.itemId = mb.itemId
        WHERE mi.libraryId = :libraryId
          AND mi.mediaType = 'BOOK'
          AND mb.isRead = 0
          AND (
                (mb.readingProgress > 0 AND mb.readingProgress < 1)
             OR LOWER(COALESCE(mb.shelf, '')) = 'currently-reading'
          )
        """
    )
    suspend fun getCurrentReadingCount(libraryId: Long): Int

    @Query(
        """
        SELECT COUNT(*) FROM metadata_book AS mb
        INNER JOIN media_items AS mi ON mi.itemId = mb.itemId
        WHERE mi.libraryId = :libraryId
          AND mi.mediaType = 'BOOK'
          AND (
                (mb.isRead = 0 AND (mb.readingProgress = 0 OR mb.readingProgress IS NULL)
                 AND (mb.lastReadDate IS NULL OR mb.lastReadDate = 0))
             OR LOWER(COALESCE(mb.shelf, '')) = 'to-read'
          )
        """
    )
    suspend fun getToReadBooksCount(libraryId: Long): Int

    @Query(
        """
        SELECT
            strftime('%Y-%m', datetime(mb.lastReadDate / 1000, 'unixepoch')) AS yearMonth,
            COUNT(*) AS count
        FROM metadata_book AS mb
        INNER JOIN media_items AS mi ON mi.itemId = mb.itemId
        WHERE mi.libraryId = :libraryId
          AND mi.mediaType = 'BOOK'
          AND mb.isRead = 1
          AND mb.lastReadDate IS NOT NULL
          AND mb.lastReadDate >= :since
        GROUP BY yearMonth
        ORDER BY yearMonth DESC
        """
    )
    suspend fun getMonthlyCompletionCounts(
        libraryId: Long,
        since: Long
    ): List<MonthlyCompletionCount>

    @Query(
        """
        SELECT
            CASE
                WHEN mb.publisher IS NULL OR LENGTH(TRIM(mb.publisher)) = 0
                    THEN 'Unknown Publisher'
                ELSE TRIM(mb.publisher)
            END AS publisher,
            COUNT(*) AS count
        FROM metadata_book AS mb
        INNER JOIN media_items AS mi ON mi.itemId = mb.itemId
        WHERE mi.libraryId = :libraryId
          AND mi.mediaType = 'BOOK'
        GROUP BY publisher
        ORDER BY count DESC, publisher ASC
        LIMIT :limit
        """
    )
    suspend fun getTopPublishers(
        libraryId: Long,
        limit: Int = 5
    ): List<PublisherUsage>

    /**
     * Get all metadata for backup
     */
    @Query("SELECT * FROM metadata_common ORDER BY itemId")
    suspend fun getAllMetadata(): List<MetadataCommon>
    
    // Alias methods for CalibreExportService compatibility
    @Query("SELECT * FROM metadata_common WHERE itemId = :itemId")
    suspend fun getMetadataCommonById(itemId: Long): MetadataCommon?
    
    @Query("SELECT * FROM metadata_book WHERE itemId = :itemId")
    suspend fun getMetadataBookById(itemId: Long): MetadataBook?
    
    @Query("""
        SELECT p.name FROM people p
        INNER JOIN item_person_role ipr ON p.personId = ipr.personId
        WHERE ipr.itemId = :itemId AND ipr.role = 'AUTHOR'
    """)
    suspend fun getItemAuthors(itemId: Long): List<String>
    
    @Query("""
        SELECT g.name FROM genre g
        INNER JOIN item_genre ig ON g.genreId = ig.genreId
        WHERE ig.itemId = :itemId
    """)
    suspend fun getItemGenres(itemId: Long): List<String>
    
    // ============================================================================
    // PERFORMANCE OPTIMIZATION: Batch query methods to avoid N+1 query problems
    // ============================================================================
    
    /**
     * Batch fetch metadata for multiple items at once.
     * This prevents N+1 queries when loading lists of media items.
     * 
     * @param itemIds List of item IDs to fetch metadata for
     * @return List of MetadataCommon objects
     */
    @Query("SELECT * FROM metadata_common WHERE itemId IN (:itemIds)")
    suspend fun getMetadataCommonBatch(itemIds: List<Long>): List<MetadataCommon>
    
    /**
     * Batch fetch book-specific metadata for multiple items at once.
     * 
     * @param itemIds List of item IDs to fetch book metadata for
     * @return List of MetadataBook objects
     */
    @Query("SELECT * FROM metadata_book WHERE itemId IN (:itemIds)")
    suspend fun getMetadataBookBatch(itemIds: List<Long>): List<MetadataBook>
    
    /**
     * Batch fetch authors for multiple items at once.
     * Returns a map of itemId to list of author names.
     * 
     * @param itemIds List of item IDs to fetch authors for
     * @return Map of itemId to author names
     */
    @Query("""
        SELECT ipr.itemId, p.name 
        FROM people p
        INNER JOIN item_person_role ipr ON p.personId = ipr.personId
        WHERE ipr.itemId IN (:itemIds) AND ipr.role = 'AUTHOR'
        ORDER BY ipr.itemId
    """)
    suspend fun getAuthorsBatch(itemIds: List<Long>): List<ItemAuthor>
    
    /**
     * Batch fetch series names for multiple items at once.
     * 
     * @param itemIds List of item IDs to fetch series for
     * @return Map of itemId to series name
     */
    @Query("""
        SELECT mb.itemId, s.name 
        FROM series s
        INNER JOIN metadata_book mb ON s.seriesId = mb.series
        WHERE mb.itemId IN (:itemIds)
    """)
    suspend fun getSeriesBatch(itemIds: List<Long>): List<ItemSeries>
    
    /**
     * Data class for batch author queries
     */
    data class ItemAuthor(
        val itemId: Long,
        val name: String
    )
    
    /**
     * Data class for batch series queries
     */
    data class ItemSeries(
        val itemId: Long,
        val name: String
    )
}

data class MonthlyCompletionCount(
    val yearMonth: String,
    val count: Int
)

data class PublisherUsage(
    val publisher: String,
    val count: Int
)
