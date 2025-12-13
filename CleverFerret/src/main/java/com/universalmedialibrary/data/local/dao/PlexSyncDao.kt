package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow

@Dao
interface PlexSyncDao {

    // Progress sync methods
    @Query("SELECT * FROM plex_progress WHERE plexMediaItemId = :itemId")
    suspend fun getProgressByItemId(itemId: Long): PlexProgress?

    @Query("SELECT * FROM plex_progress WHERE needsSync = 1")
    suspend fun getProgressNeedingSync(): List<PlexProgress>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertProgress(progress: PlexProgress): Long

    @Update
    suspend fun updateProgress(progress: PlexProgress)

    @Query("UPDATE plex_progress SET needsSync = 0, lastSyncedAt = :timestamp WHERE id = :progressId")
    suspend fun markProgressSynced(progressId: Long, timestamp: Long)

    // Rating sync methods
    @Query("SELECT * FROM plex_ratings WHERE plexMediaItemId = :itemId")
    suspend fun getRatingByItemId(itemId: Long): PlexRating?

    @Query("SELECT * FROM plex_ratings WHERE needsSync = 1")
    suspend fun getRatingsNeedingSync(): List<PlexRating>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertRating(rating: PlexRating): Long

    @Update
    suspend fun updateRating(rating: PlexRating)

    @Query("UPDATE plex_ratings SET needsSync = 0, lastSyncedAt = :timestamp WHERE id = :ratingId")
    suspend fun markRatingSynced(ratingId: Long, timestamp: Long)

    // Collection methods
    @Query("SELECT * FROM plex_collections WHERE serverId = :serverId")
    fun getCollectionsByServer(serverId: Long): Flow<List<PlexCollection>>

    @Query("SELECT * FROM plex_collections WHERE plexRatingKey = :ratingKey")
    suspend fun getCollectionByRatingKey(ratingKey: String): PlexCollection?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCollection(collection: PlexCollection): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCollectionItems(items: List<PlexCollectionItem>)

    @Query("DELETE FROM plex_collection_items WHERE collectionId = :collectionId")
    suspend fun deleteCollectionItems(collectionId: Long)

    @Query("""
        SELECT pmi.* FROM plex_media_items pmi
        JOIN plex_collection_items pci ON pmi.id = pci.plexMediaItemId
        WHERE pci.collectionId = :collectionId
        ORDER BY pci.sortOrder
    """)
    suspend fun getCollectionItems(collectionId: Long): List<MediaItem>

    // Tag methods
    @Query("SELECT * FROM plex_tags WHERE serverId = :serverId")
    fun getTagsByServer(serverId: Long): Flow<List<PlexTag>>

    @Query("SELECT * FROM plex_tags WHERE serverId = :serverId AND tag = :tag AND type = :type")
    suspend fun getTag(serverId: Long, tag: String, type: String): PlexTag?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTag(tag: PlexTag): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaTags(tags: List<PlexMediaTag>)

    @Query("DELETE FROM plex_media_tags WHERE plexMediaItemId = :itemId")
    suspend fun deleteMediaTags(itemId: Long)

    @Query("""
        SELECT pt.* FROM plex_tags pt
        JOIN plex_media_tags pmt ON pt.id = pmt.tagId
        WHERE pmt.plexMediaItemId = :itemId
    """)
    suspend fun getTagsForMediaItem(itemId: Long): List<PlexTag>
}
