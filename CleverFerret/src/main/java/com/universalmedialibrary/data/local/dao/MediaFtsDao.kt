package com.universalmedialibrary.data.local.dao

import androidx.room.ColumnInfo
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.entity.MediaFtsEntity
import com.universalmedialibrary.data.local.entity.MediaItem

data class FtsSearchResult(
    val rowid: Long,
    val title: String?,
    val creator: String?,
    val series: String?,
    val tags: String?,
    val summary: String?,
    @ColumnInfo(name = "media_type")
    val mediaType: String?,
    @ColumnInfo(name = "item_id")
    val itemId: Long,
    @ColumnInfo(name = "item_source")
    val itemSource: String
)

@Dao
interface MediaFtsDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertFtsEntry(entity: MediaFtsEntity)

    @Query("DELETE FROM media_fts WHERE rowid = :rowid AND item_source = :source")
    suspend fun deleteByRowId(rowid: Long, source: String = "LOCAL")

    @Query("DELETE FROM media_fts")
    suspend fun clearFtsIndex()

    @Query("SELECT COUNT(*) FROM media_fts")
    suspend fun getFtsCount(): Int

    /**
     * Raw FTS5 search query returning match details
     */
    @Query("""
        SELECT rowid, title, creator, series, tags, summary, media_type, item_id, item_source
        FROM media_fts
        WHERE media_fts MATCH :query
        LIMIT :limit
    """)
    suspend fun searchFts(query: String, limit: Int = 100): List<FtsSearchResult>

    /**
     * Search and JOIN with media_items to return matching local MediaItems
     */
    @Query("""
        SELECT mi.*
        FROM media_items mi
        JOIN media_fts fts ON mi.itemId = fts.rowid AND fts.item_source = 'LOCAL'
        LEFT JOIN metadata_common mc ON mi.itemId = mc.itemId
        WHERE media_fts MATCH :query
        AND (:mediaTypes IS NULL OR mi.mediaType IN (:mediaTypes))
        AND (:minRating IS NULL OR mc.rating >= :minRating OR mc.userRating >= :minRating)
        LIMIT :limit
    """)
    suspend fun searchMediaItemsFts(
        query: String,
        mediaTypes: List<String>? = null,
        minRating: Float? = null,
        limit: Int = 100
    ): List<MediaItem>
}
