package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.UnifiedCollectionDao
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class CollectionRepository @Inject constructor(
    private val collectionDao: UnifiedCollectionDao
) {
    fun getCollections(): Flow<List<UnifiedCollection>> = collectionDao.getAllCollections()

    fun getCollection(id: Long): Flow<UnifiedCollection?> = collectionDao.getCollection(id)

    fun getItemsInCollection(collectionId: Long): Flow<List<MediaItem>> =
        collectionDao.getItemsInCollection(collectionId)

    suspend fun createCollection(
        name: String,
        type: CollectionType,
        description: String? = null
    ): Long {
        return collectionDao.insert(
            UnifiedCollection(
                name = name,
                type = type,
                description = description
            )
        )
    }

    suspend fun addItem(collectionId: Long, itemId: Long) {
        // Find next sort order by counting existing items
        val currentItems = collectionDao.getItemsInCollection(collectionId).first()
        val nextOrder = currentItems.size
        collectionDao.addItemToCollection(
            ItemCollection(
                itemId = itemId,
                collectionId = collectionId,
                sortOrder = nextOrder
            )
        )
    }

    suspend fun removeItem(collectionId: Long, itemId: Long) {
        collectionDao.removeItemFromCollection(collectionId, itemId)
    }

    suspend fun reorderItems(collectionId: Long, orderedItemIds: List<Long>) {
        orderedItemIds.forEachIndexed { index, itemId ->
            collectionDao.updateItemSortOrder(collectionId, itemId, index)
        }
    }

    suspend fun deleteCollection(collectionId: Long) {
        val collection = collectionDao.getCollection(collectionId).first()
        collection?.let {
            collectionDao.delete(it)
        }
    }
}
