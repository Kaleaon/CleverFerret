package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query
import com.universalmedialibrary.data.local.entity.ListenHistoryDailyCount
import com.universalmedialibrary.data.local.entity.ListenHistoryEntry
import com.universalmedialibrary.data.local.entity.ListenHistoryTopItem
import kotlinx.coroutines.flow.Flow

@Dao
interface ListenHistoryDao {

    @Insert
    suspend fun insert(entry: ListenHistoryEntry): Long

    @Query(
        """
        SELECT * FROM listen_history
        ORDER BY startedAt DESC
        LIMIT :limit
        """
    )
    fun observeRecent(limit: Int): Flow<List<ListenHistoryEntry>>

    @Query(
        """
        SELECT mediaItemId,
               title,
               artist,
               COUNT(*) as playCount,
               MAX(completedAt) as lastPlayedAt
        FROM listen_history
        WHERE (:libraryId IS NULL OR libraryId = :libraryId)
        GROUP BY COALESCE(mediaItemId, title)
        ORDER BY playCount DESC, lastPlayedAt DESC
        LIMIT :limit
        """
    )
    fun observeTopItems(libraryId: Long?, limit: Int): Flow<List<ListenHistoryTopItem>>

    @Query(
        """
        SELECT strftime('%Y-%m-%d', startedAt / 1000, 'unixepoch') AS day,
               COUNT(*) AS playCount
        FROM listen_history
        WHERE startedAt >= :since
          AND (:libraryId IS NULL OR libraryId = :libraryId)
        GROUP BY day
        ORDER BY day DESC
        LIMIT :limit
        """
    )
    fun observeDailyCounts(since: Long, libraryId: Long?, limit: Int = 30): Flow<List<ListenHistoryDailyCount>>
}
