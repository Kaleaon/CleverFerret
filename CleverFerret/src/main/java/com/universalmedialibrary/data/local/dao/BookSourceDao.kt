package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.BookSource
import com.universalmedialibrary.data.local.entity.BookSourceType
import kotlinx.coroutines.flow.Flow

@Dao
interface BookSourceDao {

    @Query("SELECT * FROM book_sources ORDER BY customOrder ASC, sourceName ASC")
    fun getAllBookSources(): Flow<List<BookSource>>

    @Query("SELECT * FROM book_sources WHERE enabled = 1 ORDER BY customOrder ASC")
    fun getEnabledBookSources(): Flow<List<BookSource>>

    @Query("SELECT * FROM book_sources WHERE sourceId = :sourceId")
    suspend fun getBookSourceById(sourceId: Long): BookSource?

    @Query("SELECT * FROM book_sources WHERE sourceType = :type AND enabled = 1")
    fun getBookSourcesByType(type: BookSourceType): Flow<List<BookSource>>

    @Query("SELECT * FROM book_sources WHERE sourceGroup = :group ORDER BY customOrder ASC")
    fun getBookSourcesByGroup(group: String): Flow<List<BookSource>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertBookSource(bookSource: BookSource): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertBookSources(bookSources: List<BookSource>)

    @Update
    suspend fun updateBookSource(bookSource: BookSource)

    @Delete
    suspend fun deleteBookSource(bookSource: BookSource)

    @Query("DELETE FROM book_sources WHERE sourceId = :sourceId")
    suspend fun deleteBookSourceById(sourceId: Long)

    @Query("UPDATE book_sources SET enabled = :enabled WHERE sourceId = :sourceId")
    suspend fun setBookSourceEnabled(sourceId: Long, enabled: Boolean)

    @Query("UPDATE book_sources SET customOrder = :order WHERE sourceId = :sourceId")
    suspend fun updateBookSourceOrder(sourceId: Long, order: Int)

    @Query("SELECT COUNT(*) FROM book_sources WHERE enabled = 1")
    suspend fun getEnabledSourceCount(): Int

    @Query("SELECT * FROM book_sources WHERE sourceName LIKE '%' || :query || '%' OR sourceUrl LIKE '%' || :query || '%'")
    fun searchBookSources(query: String): Flow<List<BookSource>>
}
