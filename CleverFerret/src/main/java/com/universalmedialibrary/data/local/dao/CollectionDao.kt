package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.MediaCollection
import com.universalmedialibrary.data.local.entity.MediaCollectionItem
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object for MediaCollection and MediaCollectionItem entities
 * 
 * Provides methods for managing collections and their media item relationships
 */
@Dao
interface CollectionDao {
    
    // Collection CRUD operations
    @Query("SELECT * FROM media_collection WHERE isActive = 1 ORDER BY isPinned DESC, name ASC")
    fun getAllActiveCollections(): Flow<List<MediaCollection>>
    
    @Query("SELECT * FROM media_collection WHERE collectionId = :collectionId")
    suspend fun getCollectionById(collectionId: Long): MediaCollection?
    
    @Query("SELECT * FROM media_collection WHERE name = :name LIMIT 1")
    suspend fun getCollectionByName(name: String): MediaCollection?
    
    @Query("SELECT * FROM media_collection WHERE type = :type AND isActive = 1 ORDER BY name ASC")
    fun getCollectionsByType(type: String): Flow<List<MediaCollection>>
    
    @Query("SELECT * FROM media_collection WHERE isPublic = 1 AND isActive = 1 ORDER BY name ASC")
    fun getPublicCollections(): Flow<List<MediaCollection>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCollection(collection: MediaCollection): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCollections(collections: List<MediaCollection>): List<Long>
    
    @Update
    suspend fun updateCollection(collection: MediaCollection)
    
    @Delete
    suspend fun deleteCollection(collection: MediaCollection)
    
    @Query("UPDATE media_collection SET isActive = 0 WHERE collectionId = :collectionId")
    suspend fun deactivateCollection(collectionId: Long)
    
    @Query("UPDATE media_collection SET lastAccessed = :timestamp WHERE collectionId = :collectionId")
    suspend fun updateLastAccessed(collectionId: Long, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE media_collection SET itemCount = (SELECT COUNT(*) FROM media_collection_item WHERE collectionId = :collectionId) WHERE collectionId = :collectionId")
    suspend fun updateItemCount(collectionId: Long)
    
    // CollectionItem relationship operations
    @Query("SELECT * FROM media_collection_item WHERE collectionId = :collectionId ORDER BY position ASC, addedDate ASC")
    suspend fun getCollectionItems(collectionId: Long): List<MediaCollectionItem>
    
    @Query("SELECT itemId FROM media_collection_item WHERE collectionId = :collectionId ORDER BY position ASC, addedDate ASC")
    suspend fun getItemIdsInCollection(collectionId: Long): List<Long>
    
    @Query("SELECT c.* FROM media_collection c INNER JOIN media_collection_item ci ON c.collectionId = ci.collectionId WHERE ci.itemId = :itemId AND c.isActive = 1 ORDER BY c.name ASC")
    fun getCollectionsForItem(itemId: Long): Flow<List<MediaCollection>>
    
    @Query("SELECT COUNT(*) FROM media_collection_item WHERE collectionId = :collectionId")
    suspend fun getCollectionItemCount(collectionId: Long): Int
    
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun addItemToCollection(collectionItem: MediaCollectionItem)
    
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun addItemsToCollection(collectionItems: List<MediaCollectionItem>)
    
    @Query("DELETE FROM media_collection_item WHERE collectionId = :collectionId AND itemId = :itemId")
    suspend fun removeItemFromCollection(collectionId: Long, itemId: Long)
    
    @Query("DELETE FROM media_collection_item WHERE collectionId = :collectionId")
    suspend fun removeAllItemsFromCollection(collectionId: Long)
    
    @Query("DELETE FROM media_collection_item WHERE itemId = :itemId")
    suspend fun removeItemFromAllCollections(itemId: Long)
    
    @Query("SELECT EXISTS(SELECT 1 FROM media_collection_item WHERE collectionId = :collectionId AND itemId = :itemId)")
    suspend fun isItemInCollection(collectionId: Long, itemId: Long): Boolean
    
    // Position management
    @Query("SELECT MAX(position) FROM media_collection_item WHERE collectionId = :collectionId")
    suspend fun getMaxPosition(collectionId: Long): Int?
    
    @Query("UPDATE media_collection_item SET position = :newPosition WHERE collectionId = :collectionId AND itemId = :itemId")
    suspend fun updateItemPosition(collectionId: Long, itemId: Long, newPosition: Int)
    
    @Query("UPDATE media_collection_item SET position = position - 1 WHERE collectionId = :collectionId AND position > :removedPosition")
    suspend fun adjustPositionsAfterRemoval(collectionId: Long, removedPosition: Int)
    
    @Query("UPDATE media_collection_item SET position = position + 1 WHERE collectionId = :collectionId AND position >= :insertPosition")
    suspend fun adjustPositionsAfterInsertion(collectionId: Long, insertPosition: Int)
    
    // Search and filtering
    @Query("SELECT * FROM media_collection WHERE name LIKE '%' || :query || '%' AND isActive = 1 ORDER BY name ASC")
    fun searchCollections(query: String): Flow<List<MediaCollection>>
    
    @Query("SELECT DISTINCT type FROM media_collection WHERE isActive = 1 ORDER BY type ASC")
    suspend fun getAllCollectionTypes(): List<String>
    
    // Smart collections
    @Query("SELECT * FROM media_collection WHERE type = 'SMART' AND isActive = 1")
    fun getSmartCollections(): Flow<List<MediaCollection>>
    
    @Query("UPDATE media_collection SET smartFilters = :filters, lastModified = :timestamp WHERE collectionId = :collectionId")
    suspend fun updateSmartCollectionFilters(collectionId: Long, filters: String, timestamp: Long = System.currentTimeMillis())
    
    // Recent and popular collections
    @Query("SELECT * FROM media_collection WHERE lastAccessed IS NOT NULL AND isActive = 1 ORDER BY lastAccessed DESC LIMIT :limit")
    suspend fun getRecentlyAccessedCollections(limit: Int = 10): List<MediaCollection>
    
    @Query("SELECT * FROM media_collection WHERE itemCount > 0 AND isActive = 1 ORDER BY itemCount DESC LIMIT :limit")
    suspend fun getLargestCollections(limit: Int = 10): List<MediaCollection>
    
    // Batch operations
    @Transaction
    suspend fun addItemToCollectionAtPosition(collectionId: Long, itemId: Long, position: Int, notes: String? = null) {
        // Adjust existing positions
        adjustPositionsAfterInsertion(collectionId, position)
        
        // Add item
        addItemToCollection(
            MediaCollectionItem(
                collectionId = collectionId,
                itemId = itemId,
                position = position,
                notes = notes
            )
        )
        
        // Update collection metadata
        updateItemCount(collectionId)
        updateLastAccessed(collectionId)
    }
    
    @Transaction
    suspend fun removeItemFromCollectionAtPosition(collectionId: Long, itemId: Long) {
        // Get current position
        val currentPosition = getCollectionItems(collectionId).find { it.itemId == itemId }?.position ?: return
        
        // Remove item
        removeItemFromCollection(collectionId, itemId)
        
        // Adjust positions
        adjustPositionsAfterRemoval(collectionId, currentPosition)
        
        // Update collection metadata
        updateItemCount(collectionId)
    }
    
    @Transaction
    suspend fun moveItemInCollection(collectionId: Long, itemId: Long, newPosition: Int) {
        val items = getCollectionItems(collectionId)
        val currentItem = items.find { it.itemId == itemId } ?: return
        val currentPosition = currentItem.position
        
        if (currentPosition == newPosition) return
        
        if (newPosition > currentPosition) {
            // Moving down: shift items up
            items.filter { it.position > currentPosition && it.position <= newPosition }
                .forEach { updateItemPosition(collectionId, it.itemId, it.position - 1) }
        } else {
            // Moving up: shift items down
            items.filter { it.position >= newPosition && it.position < currentPosition }
                .forEach { updateItemPosition(collectionId, it.itemId, it.position + 1) }
        }
        
        // Update moved item position
        updateItemPosition(collectionId, itemId, newPosition)
    }
    
    @Transaction
    suspend fun createCollectionWithItems(collection: MediaCollection, itemIds: List<Long>): Long {
        val collectionId = insertCollection(collection)
        
        val collectionItems = itemIds.mapIndexed { index, itemId ->
            MediaCollectionItem(
                collectionId = collectionId,
                itemId = itemId,
                position = index
            )
        }
        
        addItemsToCollection(collectionItems)
        updateItemCount(collectionId)
        
        return collectionId
    }
}