package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.PlexMediaItem
import kotlinx.coroutines.flow.Flow

@Dao
interface PlexMediaItemDao {

    @Query("SELECT * FROM plex_media_items WHERE serverId = :serverId")
    fun getMediaItemsByServer(serverId: Long): Flow<List<PlexMediaItem>>

    @Query("SELECT * FROM plex_media_items WHERE plexRatingKey = :ratingKey")
    suspend fun getMediaItemByRatingKey(ratingKey: String): PlexMediaItem?

    @Query("SELECT * FROM plex_media_items WHERE localMediaItemId = :localId")
    suspend fun getMediaItemByLocalId(localId: Long): PlexMediaItem?

    @Query("SELECT * FROM plex_media_items WHERE serverId = :serverId AND type = :type")
    fun getMediaItemsByType(serverId: Long, type: String): Flow<List<PlexMediaItem>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaItem(item: PlexMediaItem): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaItems(items: List<PlexMediaItem>)

    @Update
    suspend fun updateMediaItem(item: PlexMediaItem)

    @Delete
    suspend fun deleteMediaItem(item: PlexMediaItem)

    @Query("DELETE FROM plex_media_items WHERE serverId = :serverId")
    suspend fun deleteMediaItemsByServer(serverId: Long)

    @Query("UPDATE plex_media_items SET lastSynced = :timestamp WHERE id = :itemId")
    suspend fun updateLastSynced(itemId: Long, timestamp: Long)

    @Query("UPDATE plex_media_items SET localMediaItemId = :localId WHERE id = :itemId")
    suspend fun linkLocalMediaItem(itemId: Long, localId: Long)
}
