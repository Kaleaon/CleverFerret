package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.models.UnifiedMediaItem
import com.universalmedialibrary.data.models.toUnifiedMediaItem
import com.universalmedialibrary.services.artwork.ArtworkLoader
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified repository for all media types, tags, collections, and artwork
 * 
 * This repository provides a single interface for working with all media content
 * while maintaining the unified model and supporting the flexible tagging/collection system
 */
@Singleton
class UnifiedMediaRepository @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val tagDao: TagDao,
    private val collectionDao: CollectionDao,
    private val libraryDao: LibraryDao,
    private val artworkLoader: ArtworkLoader
) {
    
    /**
     * Get all media items as unified models (for a given library)  
     */
    fun getAllMediaItemsForLibraryFlow(libraryId: Long): Flow<List<UnifiedMediaItem>> {
        return mediaItemDao.getMediaItemsByLibrary(libraryId).map { mediaItemsList ->
            mediaItemsList.mapNotNull { mediaItem ->
                // For Flow mapping, we can't use suspend functions
                // Return a simplified unified media item without full metadata loading
                createSimpleUnifiedMediaItem(mediaItem)
            }
        }
    }
    
    /**
     * Get all media items by library (suspend version for full metadata loading)
     */
    suspend fun getAllMediaItemsForLibrary(libraryId: Long): List<UnifiedMediaItem> {
        val mediaItems = mediaItemDao.getMediaItemsByLibrary(libraryId)
        // We would need to collect the Flow and then process each item
        // For now, let's use a simpler approach
        return emptyList() // TODO: Implement proper Flow collection and processing
    }
    
    /**
     * Get all media items by type
     */
    fun getMediaItemsByTypeFlow(mediaType: String): Flow<List<UnifiedMediaItem>> {
        return mediaItemDao.getMediaItemsByType(mediaType).map { mediaItemsList ->
            mediaItemsList.mapNotNull { mediaItem ->
                createSimpleUnifiedMediaItem(mediaItem)
            }
        }
    }
    
    /**
     * Get a single media item by ID
     */
    suspend fun getMediaItemById(itemId: Long): UnifiedMediaItem? {
        val mediaItem = mediaItemDao.getMediaItemById(itemId) ?: return null
        return createUnifiedMediaItem(mediaItem)
    }
    
    /**
     * Search media items across all types
     */
    suspend fun searchMediaItems(query: String): List<UnifiedMediaItem> {
        val searchResults = mediaItemDao.searchMediaItems(query)
        
        return searchResults.mapNotNull { mediaItem ->
            createUnifiedMediaItem(mediaItem)
        }
    }
    
    /**
     * Get media items by tag
     */
    suspend fun getMediaItemsByTag(tagId: Long): List<UnifiedMediaItem> {
        val itemIds = tagDao.getItemIdsWithTag(tagId)
        return itemIds.mapNotNull { getMediaItemById(it) }
    }
    
    /**
     * Get media items by collection
     */
    suspend fun getMediaItemsByCollection(collectionId: Long): List<UnifiedMediaItem> {
        val itemIds = collectionDao.getItemIdsInCollection(collectionId)
        return itemIds.mapNotNull { getMediaItemById(it) }
    }
    
    /**
     * Get media items with specific tags (AND operation)
     */
    suspend fun getMediaItemsWithAllTags(tagIds: List<Long>): List<UnifiedMediaItem> {
        if (tagIds.isEmpty()) return emptyList()
        
        var itemIds = tagDao.getItemIdsWithTag(tagIds.first()).toSet()
        
        for (tagId in tagIds.drop(1)) {
            val taggedItems = tagDao.getItemIdsWithTag(tagId).toSet()
            itemIds = itemIds.intersect(taggedItems)
        }
        
        return itemIds.mapNotNull { getMediaItemById(it) }
    }
    
    /**
     * Get media items with any of the specified tags (OR operation)
     */
    suspend fun getMediaItemsWithAnyTags(tagIds: List<Long>): List<UnifiedMediaItem> {
        if (tagIds.isEmpty()) return emptyList()
        
        val itemIds = mutableSetOf<Long>()
        
        for (tagId in tagIds) {
            itemIds.addAll(tagDao.getItemIdsWithTag(tagId))
        }
        
        return itemIds.mapNotNull { getMediaItemById(it) }
    }
    
    // Tag management
    fun getAllTags(): Flow<List<Tag>> = tagDao.getAllActiveTags()
    
    fun getTagsForItem(itemId: Long): Flow<List<Tag>> = tagDao.getTagsForItem(itemId)
    
    suspend fun addTagToItem(itemId: Long, tagName: String, category: String? = null): Long {
        // Check if tag exists
        val existingTag = tagDao.getTagByName(tagName)
        val tagId = if (existingTag != null) {
            existingTag.tagId
        } else {
            // Create new tag
            tagDao.createTagAndAddToItem(tagName, itemId, category)
        }
        
        // Add tag to item if not already tagged  
        if (!tagDao.isItemTagged(itemId, tagId)) {
            tagDao.addTagToItem(ItemTag(itemId = itemId, tagId = tagId))
            tagDao.updateTagUsage(tagId)
        }
        
        return tagId
    }
    
    suspend fun removeTagFromItem(itemId: Long, tagId: Long) {
        tagDao.removeTagFromItem(itemId, tagId)
    }
    
    suspend fun setItemTags(itemId: Long, tagIds: List<Long>) {
        tagDao.replaceItemTags(itemId, tagIds)
    }
    
    // Collection management
    fun getAllCollections(): Flow<List<MediaCollection>> = collectionDao.getAllActiveCollections()
    
    fun getCollectionsForItem(itemId: Long): Flow<List<MediaCollection>> = collectionDao.getCollectionsForItem(itemId)
    
    suspend fun createCollection(name: String, description: String? = null, type: String = "CUSTOM"): Long {
        val collection = MediaCollection(
            name = name,
            description = description,
            type = type
        )
        return collectionDao.insertCollection(collection)
    }
    
    suspend fun addItemToCollection(collectionId: Long, itemId: Long) {
        val maxPosition = collectionDao.getMaxPosition(collectionId) ?: -1
        collectionDao.addItemToCollectionAtPosition(collectionId, itemId, maxPosition + 1)
    }
    
    suspend fun removeItemFromCollection(collectionId: Long, itemId: Long) {
        collectionDao.removeItemFromCollectionAtPosition(collectionId, itemId)
    }
    
    suspend fun createCollectionWithItems(name: String, itemIds: List<Long>, description: String? = null): Long {
        val collection = MediaCollection(
            name = name,
            description = description,
            type = "CUSTOM"
        )
        return collectionDao.createCollectionWithItems(collection, itemIds)
    }
    
    // Artwork management
    suspend fun getArtworkForItem(itemId: Long, size: com.universalmedialibrary.services.artwork.ArtworkSize = com.universalmedialibrary.services.artwork.ArtworkSize.MEDIUM) =
        getMediaItemById(itemId)?.let { mediaItem ->
            artworkLoader.loadArtwork(mediaItem, size)
        }
    
    suspend fun getNotificationArtworkForItem(itemId: Long) =
        getMediaItemById(itemId)?.let { mediaItem ->
            artworkLoader.loadNotificationArtwork(mediaItem)
        }
    
    suspend fun getNowPlayingArtworkForItem(itemId: Long) =
        getMediaItemById(itemId)?.let { mediaItem ->
            artworkLoader.loadNowPlayingArtwork(mediaItem)
        }
    
    suspend fun clearArtworkCacheForItem(itemId: Long) {
        artworkLoader.clearItemCache(itemId)
    }
    
    // Recommendations and discovery
    suspend fun getRecommendedItems(basedOnItemId: Long, limit: Int = 10): List<UnifiedMediaItem> {
        val baseItem = getMediaItemById(basedOnItemId) ?: return emptyList()
        
        // Get items of the same media type for simple recommendations
        val mediaItems = mediaItemDao.getMediaItemsByType(baseItem.mediaType.name)
        
        // This needs to be handled differently since it returns Flow
        // For now, return empty list - this would need proper Flow handling in the calling code
        return emptyList()
    }
    
    suspend fun getPopularTags(limit: Int = 10): List<Tag> = tagDao.getPopularTags(limit)
    
    suspend fun getRecentlyUsedTags(limit: Int = 10): List<Tag> {
        val oneWeekAgo = System.currentTimeMillis() - (7 * 24 * 60 * 60 * 1000)
        return tagDao.getRecentlyUsedTags(oneWeekAgo, limit)
    }
    
    /**
     * Helper function to create unified media item from database entities
     */
    private suspend fun createUnifiedMediaItem(mediaItem: MediaItem): UnifiedMediaItem? {
        val commonMetadata = metadataDao.getCommonMetadata(mediaItem.itemId)
        val bookMetadata = metadataDao.getBookMetadata(mediaItem.itemId)
        val movieMetadata = metadataDao.getMovieMetadata(mediaItem.itemId)
        val musicMetadata = metadataDao.getMusicMetadata(mediaItem.itemId)
        
        return mediaItem.toUnifiedMediaItem(
            commonMetadata = commonMetadata,
            bookMetadata = bookMetadata,
            movieMetadata = movieMetadata,
            musicMetadata = musicMetadata
        )
    }
    
    /**
     * Helper function to create simple unified media item without loading metadata (for Flow usage)
     */
    private fun createSimpleUnifiedMediaItem(mediaItem: MediaItem): UnifiedMediaItem {
        return mediaItem.toUnifiedMediaItem(
            commonMetadata = null,
            bookMetadata = null,
            movieMetadata = null,
            musicMetadata = null
        )
    }
}