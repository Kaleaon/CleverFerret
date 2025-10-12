package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for search and filter operations
 */
@Singleton
class SearchRepository @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {

    /**
     * Search media items with filters
     */
    suspend fun searchMedia(
        query: String,
        mediaTypes: List<String> = emptyList(),
        minRating: Float? = null,
        maxRating: Float? = null,
        yearFrom: Int? = null,
        yearTo: Int? = null,
        hasMetadata: Boolean? = null,
        libraryId: Long? = null
    ): List<MediaItemWithMetadata> = withContext(Dispatchers.IO) {
        // Get all media items - collect Flow to get List
        val itemsFlow = if (libraryId != null) {
            mediaItemDao.getMediaItemsByLibrary(libraryId)
        } else {
            // For null libraryId, we need to get all items - use a Flow that gets all
            kotlinx.coroutines.flow.flow {
                // Since there's no "get all" method, we'll return empty for now
                // This should ideally have a getAllMediaItems() method in DAO
                emit(emptyList<MediaItem>())
            }
        }
        
        val items = itemsFlow.first()

        // Apply filters
        var filteredItems = items

        // Filter by media type
        if (mediaTypes.isNotEmpty()) {
            filteredItems = filteredItems.filter { item ->
                mediaTypes.any { it.equals(item.mediaType, ignoreCase = true) }
            }
        }

        // Filter by metadata availability
        hasMetadata?.let { hasMetadataFilter ->
            filteredItems = filteredItems.filter { it.hasMetadata == hasMetadataFilter }
        }

        // Search in filename and metadata
        if (query.isNotBlank()) {
            val lowerQuery = query.lowercase()
            filteredItems = filteredItems.filter { item ->
                // Search in filename
                item.fileName.lowercase().contains(lowerQuery) ||
                // Search in file path
                item.filePath.lowercase().contains(lowerQuery) ||
                // Search in metadata - skip DB call if item has no metadata
                run {
                    if (!item.hasMetadata) return@run false
                    val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)
                    metadata?.let {
                        it.title?.lowercase()?.contains(lowerQuery) == true ||
                        it.summary?.lowercase()?.contains(lowerQuery) == true ||
                        it.originalTitle?.lowercase()?.contains(lowerQuery) == true
                    } ?: false
                }
            }
        }

        // Convert to MediaItemWithMetadata and apply additional filters
        filteredItems.mapNotNull { item ->
            val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)
            
            // Apply rating filter
            if (minRating != null || maxRating != null) {
                val rating = metadata?.rating ?: metadata?.userRating ?: return@mapNotNull null
                if (minRating != null && rating < minRating) return@mapNotNull null
                if (maxRating != null && rating > maxRating) return@mapNotNull null
            }
            
            // Apply year filter
            if (yearFrom != null || yearTo != null) {
                val year = metadata?.year ?: return@mapNotNull null
                if (yearFrom != null && year < yearFrom) return@mapNotNull null
                if (yearTo != null && year > yearTo) return@mapNotNull null
            }
            
            MediaItemWithMetadata(item, metadata)
        }
    }

    /**
     * Get search suggestions based on partial query
     */
    suspend fun getSearchSuggestions(query: String, libraryId: Long, limit: Int = 10): List<String> = withContext(Dispatchers.IO) {
        if (query.isBlank()) return@withContext emptyList()
        
        val lowerQuery = query.lowercase()
        val suggestions = mutableSetOf<String>()

        // Get all items
        val items = mediaItemDao.getMediaItemsForLibrary(libraryId).first()
        
        // Collect filename suggestions
        items.forEach { item ->
            if (item.fileName.lowercase().contains(lowerQuery)) {
                suggestions.add(item.fileName.substringBeforeLast('.'))
            }
        }

        // Collect metadata title suggestions
        items.forEach { item ->
            val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)
            metadata?.title?.let { title ->
                if (title.lowercase().contains(lowerQuery)) {
                    suggestions.add(title)
                }
            }
        }

        suggestions.take(limit)
    }

    /**
     * Get available filter options based on current library
     */
    suspend fun getAvailableFilters(libraryId: Long? = null): FilterOptions = withContext(Dispatchers.IO) {
        val itemsFlow = if (libraryId != null) {
            mediaItemDao.getMediaItemsByLibrary(libraryId)
        } else {
            // For null libraryId, return empty flow for now
            kotlinx.coroutines.flow.flow { emit(emptyList<MediaItem>()) }
        }
        
        val items = itemsFlow.first()

        val mediaTypes = items.map { it.mediaType }.distinct().sorted()
        
        val years = items.mapNotNull { item ->
            metadataDao.getMetadataCommonByItemId(item.itemId)?.year
        }.distinct().sorted()

        val ratings = items.mapNotNull { item ->
            val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)
            metadata?.rating ?: metadata?.userRating
        }.distinct().sorted()

        FilterOptions(
            availableMediaTypes = mediaTypes,
            yearRange = if (years.isNotEmpty()) years.first() to years.last() else null,
            ratingRange = if (ratings.isNotEmpty()) ratings.first() to ratings.last() else null,
            totalItems = items.size,
            itemsWithMetadata = items.count { it.hasMetadata },
            itemsWithoutMetadata = items.count { !it.hasMetadata }
        )
    }

    /**
     * Get recent searches (would typically be stored in preferences or database)
     */
    fun getRecentSearches(): List<String> {
        // Not yet implemented - returns empty list
        return emptyList()
    }

    /**
     * Save a search query to recent searches
     */
    fun saveRecentSearch(query: String) {
        // Not yet implemented
    }
}

/**
 * Media item with its metadata combined
 */
data class MediaItemWithMetadata(
    val mediaItem: MediaItem,
    val metadata: MetadataCommon?
) {
    val title: String get() = metadata?.title ?: mediaItem.fileName.substringBeforeLast('.')
    val coverUrl: String? get() = metadata?.coverImagePath
    val rating: Float? get() = metadata?.rating ?: metadata?.userRating
    val year: Int? get() = metadata?.year
    val summary: String? get() = metadata?.summary
}

/**
 * Available filter options
 */
data class FilterOptions(
    val availableMediaTypes: List<String>,
    val yearRange: Pair<Int, Int>?,
    val ratingRange: Pair<Float, Float>?,
    val totalItems: Int,
    val itemsWithMetadata: Int,
    val itemsWithoutMetadata: Int
)

/**
 * Search filters
 */
data class SearchFilters(
    val mediaTypes: List<String> = emptyList(),
    val minRating: Float? = null,
    val maxRating: Float? = null,
    val yearFrom: Int? = null,
    val yearTo: Int? = null,
    val hasMetadata: Boolean? = null,
    val libraryId: Long? = null
) {
    fun isActive(): Boolean {
        return mediaTypes.isNotEmpty() ||
                minRating != null ||
                maxRating != null ||
                yearFrom != null ||
                yearTo != null ||
                hasMetadata != null ||
                libraryId != null
    }
    
    fun activeFilterCount(): Int {
        var count = 0
        if (mediaTypes.isNotEmpty()) count++
        if (minRating != null || maxRating != null) count++
        if (yearFrom != null || yearTo != null) count++
        if (hasMetadata != null) count++
        if (libraryId != null) count++
        return count
    }
}
