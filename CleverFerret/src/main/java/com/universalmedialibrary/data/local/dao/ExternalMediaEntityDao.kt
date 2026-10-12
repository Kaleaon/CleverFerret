package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.ExternalMediaEntity
import kotlinx.coroutines.flow.Flow

@Dao
interface ExternalMediaEntityDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertEntity(entity: ExternalMediaEntity): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertEntities(entities: List<ExternalMediaEntity>): List<Long>

    @Update
    suspend fun updateEntity(entity: ExternalMediaEntity)

    @Query("SELECT * FROM external_media_entities WHERE id = :id")
    suspend fun getById(id: Long): ExternalMediaEntity?

    @Query("SELECT * FROM external_media_entities WHERE providerId = :providerId AND externalId = :externalId LIMIT 1")
    suspend fun getByProviderAndExternalId(providerId: String, externalId: String): ExternalMediaEntity?

    @Query("SELECT * FROM external_media_entities WHERE providerId = :providerId")
    suspend fun getEntitiesByProvider(providerId: String): List<ExternalMediaEntity>

    @Query("SELECT * FROM external_media_entities")
    fun getAllEntitiesFlow(): Flow<List<ExternalMediaEntity>>

    @Query("SELECT * FROM external_media_entities")
    suspend fun getAllEntities(): List<ExternalMediaEntity>

    @Query("DELETE FROM external_media_entities WHERE providerId = :providerId")
    suspend fun deleteByProvider(providerId: String)

    @Query("DELETE FROM external_media_entities WHERE providerId = :providerId AND externalId = :externalId")
    suspend fun deleteByProviderAndExternalId(providerId: String, externalId: String)

    @Query("UPDATE external_media_entities SET progress = :progress, lastSyncedAt = :syncedAt WHERE providerId = :providerId AND externalId = :externalId")
    suspend fun updateProgress(providerId: String, externalId: String, progress: Float, syncedAt: Long = System.currentTimeMillis())

    @Query("UPDATE external_media_entities SET mediaItemId = :mediaItemId WHERE id = :id")
    suspend fun linkToLocalMediaItem(id: Long, mediaItemId: Long)

    @Query("""
        SELECT * FROM external_media_entities
        WHERE title LIKE '%' || :query || '%'
           OR creator LIKE '%' || :query || '%'
           OR summary LIKE '%' || :query || '%'
           OR tags LIKE '%' || :query || '%'
        LIMIT :limit
    """)
    suspend fun searchEntities(query: String, limit: Int = 100): List<ExternalMediaEntity>

    @Query("SELECT COUNT(*) FROM external_media_entities")
    suspend fun getEntityCount(): Int
}
