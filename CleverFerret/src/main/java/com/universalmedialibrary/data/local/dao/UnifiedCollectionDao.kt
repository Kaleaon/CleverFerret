package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.UnifiedCollection
import com.universalmedialibrary.data.local.entity.ItemCollection
import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.flow.Flow

@Dao
interface UnifiedCollectionDao {

    // Collections
    @Query("SELECT * FROM unified_collections ORDER BY name ASC")
    fun getAllCollections(): Flow<List<UnifiedCollection>>

    @Query("SELECT * FROM unified_collections WHERE collectionId = :id")
    fun getCollection(id: Long): Flow<UnifiedCollection?>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(collection: UnifiedCollection): Long

    @Update
    suspend fun update(collection: UnifiedCollection)

    @Delete
    suspend fun delete(collection: UnifiedCollection)

    // Items in collections
    @Transaction
    @Query(
        "SELECT m.* FROM media_items m " +
        "INNER JOIN item_collections ic ON m.itemId = ic.itemId " +
        "WHERE ic.collectionId = :collectionId " +
        "ORDER BY ic.sortOrder ASC, ic.addedAt ASC"
    )
    fun getItemsInCollection(collectionId: Long): Flow<List<MediaItem>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun addItemToCollection(link: ItemCollection)

    @Query("DELETE FROM item_collections WHERE collectionId = :collectionId AND itemId = :itemId")
    suspend fun removeItemFromCollection(collectionId: Long, itemId: Long)

    @Query("UPDATE item_collections SET sortOrder = :sortOrder WHERE collectionId = :collectionId AND itemId = :itemId")
    suspend fun updateItemSortOrder(collectionId: Long, itemId: Long, sortOrder: Int)
}

