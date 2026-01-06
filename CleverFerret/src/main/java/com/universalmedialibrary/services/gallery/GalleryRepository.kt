package com.universalmedialibrary.services.gallery

import android.content.ContentResolver
import android.content.ContentUris
import android.content.Context
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import android.util.Log
import com.universalmedialibrary.data.local.dao.UnifiedTagDao
import com.universalmedialibrary.data.local.entity.ItemTag
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.local.entity.UnifiedTag
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext
import java.util.Calendar
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Gallery Repository
 * 
 * Provides a unified interface for gallery operations, combining MediaStore access
 * with local database storage for user metadata (tags, favorites, ratings, etc.)
 */
@Singleton
class GalleryRepository @Inject constructor(
    @ApplicationContext private val context: Context,
    private val galleryManager: GalleryManager,
    private val unifiedTagDao: UnifiedTagDao,
    private val galleryPreferencesStore: GalleryPreferencesStore
) {
    companion object {
        private const val TAG = "GalleryRepository"
    }
    
    private val contentResolver: ContentResolver = context.contentResolver
    
    // User metadata cache (favorites, ratings, hidden items)
    private val _userMetadata = MutableStateFlow<Map<Long, GalleryUserMetadata>>(emptyMap())
    private val userMetadata: StateFlow<Map<Long, GalleryUserMetadata>> = _userMetadata.asStateFlow()
    
    // Smart collections
    private val _smartCollections = MutableStateFlow<List<SmartGalleryCollection>>(emptyList())
    val smartCollections: StateFlow<List<SmartGalleryCollection>> = _smartCollections.asStateFlow()
    
    /**
     * Initialize and load all data
     */
    suspend fun initialize() {
        loadUserMetadata()
        refreshSmartCollections()
    }
    
    /**
     * Load all media items (enriched with user metadata)
     */
    suspend fun loadAllMedia(): List<GalleryItem> {
        val items = galleryManager.loadAllMedia()
        return enrichItemsWithUserData(items)
    }
    
    /**
     * Get all items as a flow (enriched with user metadata)
     */
    fun observeAllItems(): Flow<List<GalleryItem>> {
        return combine(
            galleryManager.allItems,
            userMetadata
        ) { items, metadata ->
            enrichItemsWithUserData(items, metadata)
        }
    }
    
    /**
     * Get albums as a flow
     */
    fun observeAlbums(): Flow<List<GalleryAlbum>> {
        return galleryManager.albums
    }
    
    /**
     * Get all albums
     */
    suspend fun getAlbums(): List<GalleryAlbum> {
        return galleryManager.albums.value.ifEmpty {
            loadAllMedia()
            galleryManager.albums.value
        }
    }
    
    /**
     * Get items for a specific album
     */
    suspend fun getItemsForAlbum(
        albumId: String,
        sortOrder: GallerySortOrder = GallerySortOrder.DATE_TAKEN_DESC
    ): List<GalleryItem> {
        val items = galleryManager.getItemsForAlbum(albumId, sortOrder)
        return enrichItemsWithUserData(items)
    }
    
    /**
     * Get filtered items
     */
    suspend fun getFilteredItems(
        filter: GalleryFilterRules,
        sortOrder: GallerySortOrder = GallerySortOrder.DATE_TAKEN_DESC
    ): List<GalleryItem> {
        val items = galleryManager.getFilteredItems(filter, sortOrder)
        return enrichItemsWithUserData(items)
    }
    
    /**
     * Search items by query
     */
    suspend fun searchItems(
        query: String,
        sortOrder: GallerySortOrder = GallerySortOrder.DATE_TAKEN_DESC
    ): List<GalleryItem> {
        val filter = GalleryFilterRules(searchQuery = query)
        return getFilteredItems(filter, sortOrder)
    }
    
    /**
     * Get item by ID
     */
    suspend fun getItemById(itemId: Long): GalleryItem? {
        val item = galleryManager.allItems.value.find { it.id == itemId }
        return item?.let { enrichItemWithUserData(it) }
    }
    
    // ==================== SMART COLLECTIONS ====================
    
    /**
     * Refresh smart collection counts and data
     */
    suspend fun refreshSmartCollections() = withContext(Dispatchers.IO) {
        val items = galleryManager.allItems.value.ifEmpty {
            loadAllMedia()
        }
        
        val collections = buildSmartCollections(items)
        _smartCollections.value = collections
    }
    
    private fun buildSmartCollections(items: List<GalleryItem>): List<SmartGalleryCollection> {
        val collections = mutableListOf<SmartGalleryCollection>()
        
        // Favorites
        val favorites = items.count { _userMetadata.value[it.id]?.isFavorite == true }
        if (favorites > 0) {
            collections.add(SmartGalleryCollection(
                type = SmartGalleryCollectionType.FAVORITES,
                name = "Favorites",
                description = "Your favorite photos and videos",
                iconName = "favorite",
                itemCount = favorites,
                displayOrder = 0
            ))
        }
        
        // Recently Added (last 7 days)
        val recentCutoff = System.currentTimeMillis() - (7 * 24 * 60 * 60 * 1000L)
        val recentlyAdded = items.count { it.dateAdded >= recentCutoff }
        if (recentlyAdded > 0) {
            collections.add(SmartGalleryCollection(
                type = SmartGalleryCollectionType.RECENTLY_ADDED,
                name = "Recently Added",
                description = "Added in the last 7 days",
                iconName = "schedule",
                itemCount = recentlyAdded,
                displayOrder = 1
            ))
        }
        
        // Today
        val todayStart = Calendar.getInstance().apply {
            set(Calendar.HOUR_OF_DAY, 0)
            set(Calendar.MINUTE, 0)
            set(Calendar.SECOND, 0)
            set(Calendar.MILLISECOND, 0)
        }.timeInMillis
        val todayCount = items.count { it.dateTaken >= todayStart }
        if (todayCount > 0) {
            collections.add(SmartGalleryCollection(
                type = SmartGalleryCollectionType.TODAY,
                name = "Today",
                description = "Photos and videos from today",
                iconName = "today",
                itemCount = todayCount,
                displayOrder = 2
            ))
        }
        
        // Videos
        val videoCount = items.count { it.mediaType == GalleryMediaType.VIDEO }
        if (videoCount > 0) {
            collections.add(SmartGalleryCollection(
                type = SmartGalleryCollectionType.VIDEOS,
                name = "Videos",
                description = "All your videos",
                iconName = "videocam",
                itemCount = videoCount,
                displayOrder = 3
            ))
        }
        
        // Screenshots
        val screenshots = items.count { 
            it.bucketName.contains("screenshot", ignoreCase = true) ||
            it.relativePath.contains("screenshot", ignoreCase = true)
        }
        if (screenshots > 0) {
            collections.add(SmartGalleryCollection(
                type = SmartGalleryCollectionType.SCREENSHOTS,
                name = "Screenshots",
                description = "Screen captures",
                iconName = "screenshot",
                itemCount = screenshots,
                displayOrder = 4
            ))
        }
        
        // On This Day (memories from same day in previous years)
        val onThisDay = galleryManager.getOnThisDay().size
        if (onThisDay > 0) {
            collections.add(SmartGalleryCollection(
                type = SmartGalleryCollectionType.ON_THIS_DAY,
                name = "On This Day",
                description = "Memories from this day in previous years",
                iconName = "auto_awesome",
                itemCount = onThisDay,
                displayOrder = 5
            ))
        }
        
        // Places (items with location)
        val withLocation = items.count { it.latitude != null && it.longitude != null }
        if (withLocation > 0) {
            collections.add(SmartGalleryCollection(
                type = SmartGalleryCollectionType.PLACES,
                name = "Places",
                description = "Photos and videos with location data",
                iconName = "place",
                itemCount = withLocation,
                displayOrder = 6
            ))
        }
        
        return collections.sortedBy { it.displayOrder }
    }
    
    /**
     * Get items for a smart collection
     */
    suspend fun getItemsForSmartCollection(
        type: SmartGalleryCollectionType,
        sortOrder: GallerySortOrder = GallerySortOrder.DATE_TAKEN_DESC
    ): List<GalleryItem> = withContext(Dispatchers.IO) {
        val items = when (type) {
            SmartGalleryCollectionType.FAVORITES -> {
                galleryManager.allItems.value.filter { 
                    _userMetadata.value[it.id]?.isFavorite == true 
                }
            }
            SmartGalleryCollectionType.RECENTLY_ADDED -> {
                galleryManager.getRecentlyAdded(7)
            }
            SmartGalleryCollectionType.TODAY -> {
                galleryManager.getTodayItems()
            }
            SmartGalleryCollectionType.VIDEOS -> {
                galleryManager.getVideos()
            }
            SmartGalleryCollectionType.SCREENSHOTS -> {
                galleryManager.getScreenshots()
            }
            SmartGalleryCollectionType.ON_THIS_DAY -> {
                galleryManager.getOnThisDay()
            }
            SmartGalleryCollectionType.PLACES -> {
                galleryManager.getItemsWithLocation()
            }
            else -> emptyList()
        }
        
        enrichItemsWithUserData(items)
    }
    
    // ==================== USER METADATA ====================
    
    /**
     * Toggle favorite status for an item
     */
    suspend fun toggleFavorite(itemId: Long) = withContext(Dispatchers.IO) {
        val current = _userMetadata.value[itemId] ?: GalleryUserMetadata(itemId)
        val updated = current.copy(isFavorite = !current.isFavorite)
        updateUserMetadata(itemId, updated)
    }
    
    /**
     * Set rating for an item (0-5)
     */
    suspend fun setRating(itemId: Long, rating: Int) = withContext(Dispatchers.IO) {
        val current = _userMetadata.value[itemId] ?: GalleryUserMetadata(itemId)
        val updated = current.copy(rating = rating.coerceIn(0, 5))
        updateUserMetadata(itemId, updated)
    }
    
    /**
     * Hide/unhide an item
     */
    suspend fun setHidden(itemId: Long, hidden: Boolean) = withContext(Dispatchers.IO) {
        val current = _userMetadata.value[itemId] ?: GalleryUserMetadata(itemId)
        val updated = current.copy(isHidden = hidden)
        updateUserMetadata(itemId, updated)
    }
    
    /**
     * Add tags to items
     */
    suspend fun addTags(itemIds: Set<Long>, tagIds: Set<Long>) = withContext(Dispatchers.IO) {
        itemIds.forEach { itemId ->
            val current = _userMetadata.value[itemId] ?: GalleryUserMetadata(itemId)
            val updated = current.copy(tagIds = current.tagIds + tagIds)
            updateUserMetadata(itemId, updated)
        }
    }
    
    /**
     * Remove tags from items
     */
    suspend fun removeTags(itemIds: Set<Long>, tagIds: Set<Long>) = withContext(Dispatchers.IO) {
        itemIds.forEach { itemId ->
            val current = _userMetadata.value[itemId] ?: GalleryUserMetadata(itemId)
            val updated = current.copy(tagIds = current.tagIds - tagIds)
            updateUserMetadata(itemId, updated)
        }
    }
    
    private suspend fun updateUserMetadata(itemId: Long, metadata: GalleryUserMetadata) {
        val newMap = _userMetadata.value.toMutableMap()
        newMap[itemId] = metadata
        _userMetadata.value = newMap
        
        // Persist to preferences
        galleryPreferencesStore.saveUserMetadata(newMap)
        
        // Refresh smart collections
        refreshSmartCollections()
    }
    
    private suspend fun loadUserMetadata() {
        _userMetadata.value = galleryPreferencesStore.loadUserMetadata()
    }
    
    // ==================== TAG MANAGEMENT ====================
    
    /**
     * Get all gallery tags
     */
    fun observeGalleryTags(): Flow<List<GalleryTag>> {
        return unifiedTagDao.getAllTags().map { tags ->
            tags.map { tag ->
                GalleryTag(
                    id = tag.tagId,
                    name = tag.name,
                    color = tag.color,
                    itemCount = tag.usageCount,
                    isAuto = tag.type == TagType.AUTO_GENERATED,
                    createdAt = tag.createdAt,
                    lastUsed = tag.lastUsed
                )
            }
        }
    }
    
    /**
     * Create a new tag
     */
    suspend fun createTag(name: String, color: String? = null): Long = withContext(Dispatchers.IO) {
        val tag = UnifiedTag(
            name = name,
            type = TagType.USER_DEFINED,
            color = color
        )
        unifiedTagDao.insertTag(tag)
    }
    
    /**
     * Delete a tag
     */
    suspend fun deleteTag(tagId: Long) = withContext(Dispatchers.IO) {
        unifiedTagDao.deleteTag(tagId)
        
        // Remove tag from all items
        val newMap = _userMetadata.value.mapValues { (_, metadata) ->
            metadata.copy(tagIds = metadata.tagIds - tagId)
        }
        _userMetadata.value = newMap
        galleryPreferencesStore.saveUserMetadata(newMap)
    }
    
    /**
     * Rename a tag
     */
    suspend fun renameTag(tagId: Long, newName: String) = withContext(Dispatchers.IO) {
        unifiedTagDao.updateTagName(tagId, newName)
    }
    
    // ==================== DELETION ====================
    
    /**
     * Delete items from device (requires user confirmation via system UI on Android 11+)
     */
    suspend fun deleteItems(itemIds: Set<Long>): DeleteResult = withContext(Dispatchers.IO) {
        try {
            val uris = itemIds.mapNotNull { id ->
                val item = galleryManager.allItems.value.find { it.id == id }
                item?.let { Uri.parse(it.uri) }
            }
            
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                // Android 11+ requires using createDeleteRequest
                DeleteResult.RequiresPermission(
                    uris = uris,
                    pendingIntent = MediaStore.createDeleteRequest(contentResolver, uris)
                )
            } else {
                // Older versions can delete directly
                var deletedCount = 0
                uris.forEach { uri ->
                    val deleted = contentResolver.delete(uri, null, null)
                    if (deleted > 0) deletedCount++
                }
                
                if (deletedCount > 0) {
                    galleryManager.removeFromCache(itemIds.toList())
                    
                    // Remove user metadata
                    val newMap = _userMetadata.value.toMutableMap()
                    itemIds.forEach { newMap.remove(it) }
                    _userMetadata.value = newMap
                    galleryPreferencesStore.saveUserMetadata(newMap)
                }
                
                DeleteResult.Success(deletedCount)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error deleting items: ${e.message}", e)
            DeleteResult.Error(e.message ?: "Unknown error")
        }
    }
    
    /**
     * Handle deletion result after user confirms on Android 11+
     */
    fun onDeleteConfirmed(itemIds: Set<Long>) {
        galleryManager.removeFromCache(itemIds.toList())
        
        // Remove user metadata
        val newMap = _userMetadata.value.toMutableMap()
        itemIds.forEach { newMap.remove(it) }
        _userMetadata.value = newMap
    }
    
    // ==================== HELPERS ====================
    
    private fun enrichItemsWithUserData(
        items: List<GalleryItem>,
        metadata: Map<Long, GalleryUserMetadata> = _userMetadata.value
    ): List<GalleryItem> {
        return items.map { item ->
            val userData = metadata[item.id]
            if (userData != null) {
                item.copy(
                    isFavorite = userData.isFavorite,
                    isHidden = userData.isHidden,
                    userRating = userData.rating,
                    tagIds = userData.tagIds
                )
            } else {
                item
            }
        }
    }
    
    private fun enrichItemWithUserData(item: GalleryItem): GalleryItem {
        val userData = _userMetadata.value[item.id] ?: return item
        return item.copy(
            isFavorite = userData.isFavorite,
            isHidden = userData.isHidden,
            userRating = userData.rating,
            tagIds = userData.tagIds
        )
    }
    
    /**
     * Refresh data from MediaStore
     */
    suspend fun refresh() {
        loadAllMedia()
        refreshSmartCollections()
    }
}

/**
 * User metadata for a gallery item (stored locally)
 */
@kotlinx.serialization.Serializable
data class GalleryUserMetadata(
    val itemId: Long,
    val isFavorite: Boolean = false,
    val isHidden: Boolean = false,
    val rating: Int = 0,
    val tagIds: Set<Long> = emptySet(),
    val customDescription: String? = null,
    val lastModified: Long = System.currentTimeMillis()
)

/**
 * Result of a delete operation
 */
sealed class DeleteResult {
    data class Success(val deletedCount: Int) : DeleteResult()
    data class Error(val message: String) : DeleteResult()
    data class RequiresPermission(
        val uris: List<Uri>,
        val pendingIntent: android.app.PendingIntent
    ) : DeleteResult()
}
