package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.ExtendedMetadata
import kotlinx.coroutines.flow.Flow

@Dao
interface ExtendedMetadataDao {
    @Query("SELECT * FROM extended_metadata WHERE itemId = :itemId")
    fun getExtendedMetadata(itemId: Long): Flow<List<ExtendedMetadata>>

    @Query("SELECT * FROM extended_metadata WHERE itemId = :itemId")
    suspend fun getExtendedMetadataSync(itemId: Long): List<ExtendedMetadata>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(metadata: ExtendedMetadata)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(metadata: List<ExtendedMetadata>)

    @Query("DELETE FROM extended_metadata WHERE itemId = :itemId AND `key` = :key")
    suspend fun delete(itemId: Long, key: String)

    @Query("DELETE FROM extended_metadata WHERE itemId = :itemId")
    suspend fun deleteAllForItem(itemId: Long)

    // Search/Filter capabilities
    @Query("SELECT itemId FROM extended_metadata WHERE `key` = :key AND value LIKE :valueQuery")
    suspend fun findItemsByProperty(key: String, valueQuery: String): List<Long>

    @Query("SELECT DISTINCT `key` FROM extended_metadata")
    fun getAllKeys(): Flow<List<String>>
}
