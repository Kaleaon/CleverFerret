package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.UnifiedCollectionDao
import com.universalmedialibrary.data.local.entity.CollectionType
import com.universalmedialibrary.data.local.entity.ItemCollection
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.SortField
import com.universalmedialibrary.data.local.entity.SortOrder
import com.universalmedialibrary.data.local.entity.UnifiedCollection
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for unified collection operations
 *
 * Provides high-level collection management with:
 * - Collection CRUD operations
 * - Item-collection associations
 * - Smart collections
 * - Batch operations
 */
@Singleton
class UnifiedCollectionRepository @Inject constructor(
    private val collectionDao: UnifiedCollectionDao
) {

    /**
     * Get all collections
     */
    fun getAllCollections(): Flow<List<UnifiedCollection>> = 
        collectionDao.getAllCollections()

    /**
     * Get collection by ID
     */
    fun getCollection(collectionId: Long): Flow<UnifiedCollection?> = 
        collectionDao.getCollection(collectionId)

    /**
     * Get items in a collection
     */
    fun getItemsInCollection(collectionId: Long): Flow<List<MediaItem>> = 
        collectionDao.getItemsInCollection(collectionId)

    /**
     * Create a new collection
     */
    suspend fun createCollection(
        name: String,
        type: CollectionType,
        description: String? = null,
        isSmartCollection: Boolean = false,
        smartQuery: String? = null,
        sortBy: SortField = SortField.CUSTOM,
        sortOrder: SortOrder = SortOrder.ASCENDING
    ): Long {
        return collectionDao.insert(
            UnifiedCollection(
                name = name,
                type = type,
                description = description,
                isSmartCollection = isSmartCollection,
                smartQuery = smartQuery,
                sortBy = sortBy,
                sortOrder = sortOrder
            )
        )
    }

    /**
     * Update a collection
     */
    suspend fun updateCollection(collection: UnifiedCollection) {
        collectionDao.update(collection)
    }

    /**
     * Delete a collection
     */
    suspend fun deleteCollection(collection: UnifiedCollection) {
        collectionDao.delete(collection)
    }

    /**
     * Add an item to a collection
     */
    suspend fun addItemToCollection(
        collectionId: Long,
        itemId: Long,
        sortOrder: Int = 0
    ) {
        collectionDao.addItemToCollection(
            ItemCollection(
                collectionId = collectionId,
                itemId = itemId,
                sortOrder = sortOrder
            )
        )
    }

    /**
     * Add multiple items to a collection
     */
    suspend fun addItemsToCollection(
        collectionId: Long,
        itemIds: List<Long>
    ) {
        itemIds.forEachIndexed { index, itemId ->
            collectionDao.addItemToCollection(
                ItemCollection(
                    collectionId = collectionId,
                    itemId = itemId,
                    sortOrder = index
                )
            )
        }
    }

    /**
     * Remove an item from a collection
     */
    suspend fun removeItemFromCollection(collectionId: Long, itemId: Long) {
        collectionDao.removeItemFromCollection(collectionId, itemId)
    }

    /**
     * Reorder an item in a collection
     */
    suspend fun updateItemSortOrder(
        collectionId: Long,
        itemId: Long,
        newSortOrder: Int
    ) {
        collectionDao.updateItemSortOrder(collectionId, itemId, newSortOrder)
    }

    /**
     * Create a playlist collection
     */
    suspend fun createPlaylist(
        name: String,
        description: String? = null,
        itemIds: List<Long> = emptyList()
    ): Long {
        val collectionId = createCollection(
            name = name,
            type = CollectionType.PLAYLIST,
            description = description
        )
        
        if (itemIds.isNotEmpty()) {
            addItemsToCollection(collectionId, itemIds)
        }
        
        return collectionId
    }

    /**
     * Create a series collection
     */
    suspend fun createSeries(
        name: String,
        description: String? = null,
        itemIds: List<Long> = emptyList()
    ): Long {
        val collectionId = createCollection(
            name = name,
            type = CollectionType.SERIES,
            description = description,
            sortBy = SortField.CUSTOM  // Series have specific order
        )
        
        if (itemIds.isNotEmpty()) {
            addItemsToCollection(collectionId, itemIds)
        }
        
        return collectionId
    }

    /**
     * Create a reading list collection
     */
    suspend fun createReadingList(
        name: String,
        description: String? = null,
        itemIds: List<Long> = emptyList()
    ): Long {
        val collectionId = createCollection(
            name = name,
            type = CollectionType.READING_LIST,
            description = description
        )
        
        if (itemIds.isNotEmpty()) {
            addItemsToCollection(collectionId, itemIds)
        }
        
        return collectionId
    }

    /**
     * Create a watchlist collection
     */
    suspend fun createWatchlist(
        name: String,
        description: String? = null,
        itemIds: List<Long> = emptyList()
    ): Long {
        val collectionId = createCollection(
            name = name,
            type = CollectionType.WATCH_LIST,
            description = description
        )
        
        if (itemIds.isNotEmpty()) {
            addItemsToCollection(collectionId, itemIds)
        }
        
        return collectionId
    }

    /**
     * Create a smart collection with a query
     */
    suspend fun createSmartCollection(
        name: String,
        type: CollectionType,
        smartQuery: String,
        description: String? = null
    ): Long {
        return createCollection(
            name = name,
            type = type,
            description = description,
            isSmartCollection = true,
            smartQuery = smartQuery
        )
    }
}
