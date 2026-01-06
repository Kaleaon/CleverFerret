package com.universalmedialibrary.services.tagging

import com.universalmedialibrary.data.local.entity.UnifiedTag as DbUnifiedTag
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.repository.TagRepository as DataTagRepository
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal Tag Manager for CleverFerret
 * 
 * Manages tags across all media types with categories, colors,
 * auto-tagging, and usage analytics.
 * 
 * This class bridges the legacy tag API with the new UnifiedTag system,
 * providing a consistent interface for tag operations across the app.
 */
@Singleton
class UniversalTagManager @Inject constructor(
    private val dataTagRepository: DataTagRepository
) {
    
    private val _allTags = MutableStateFlow<List<UniversalTag>>(emptyList())
    val allTags: Flow<List<UniversalTag>> = _allTags.asStateFlow()

    private val scope = CoroutineScope(Dispatchers.IO)
    
    init {
        scope.launch { loadTags() }
    }

    /**
     * Create a new tag
     */
    suspend fun createTag(
        name: String,
        category: String,
        color: String = "#6366F1",
        description: String? = null
    ): UniversalTag {
        val tagId = dataTagRepository.createTag(
            name = name.trim(),
            type = TagType.USER_DEFINED,
            color = color,
            description = description
        )
        
        loadTags()
        
        return UniversalTag(
            id = tagId.toString(),
            name = name.trim(),
            category = category,
            color = color,
            description = description,
            createdAt = System.currentTimeMillis(),
            usageCount = 0
        )
    }

    /**
     * Get tag by ID
     */
    suspend fun getTag(tagId: String): UniversalTag? {
        val id = tagId.toLongOrNull() ?: return null
        val dbTag = dataTagRepository.getTagById(id) ?: return null
        return dbTag.toUniversalTag()
    }

    /**
     * Update existing tag
     */
    suspend fun updateTag(tag: UniversalTag): Boolean {
        val id = tag.id.toLongOrNull() ?: return false
        val dbTag = dataTagRepository.getTagById(id) ?: return false
        
        dataTagRepository.updateTag(dbTag.copy(
            name = tag.name,
            color = tag.color,
            description = tag.description,
            usageCount = tag.usageCount
        ))
        loadTags()
        return true
    }

    /**
     * Delete tag
     */
    suspend fun deleteTag(tagId: String): Boolean {
        val id = tagId.toLongOrNull() ?: return false
        dataTagRepository.deleteTagById(id)
        loadTags()
        return true
    }

    /**
     * Search tags by query
     */
    suspend fun searchTags(query: String): List<UniversalTag> {
        return dataTagRepository.searchTags(query).first().map { it.toUniversalTag() }
    }

    /**
     * Get tags by category (type)
     */
    suspend fun getTagsByCategory(category: String): List<UniversalTag> {
        val allTagsList = _allTags.value
        return allTagsList.filter { it.category == category }
    }

    /**
     * Get popular tags
     */
    suspend fun getPopularTags(limit: Int = 20): List<UniversalTag> {
        return dataTagRepository.getPopularTags(limit).first().map { it.toUniversalTag() }
    }

    /**
     * Tag media item
     */
    suspend fun tagMediaItem(
        mediaId: String,
        mediaType: String,
        tagId: String
    ): Boolean {
        val itemId = mediaId.toLongOrNull() ?: return false
        val tId = tagId.toLongOrNull() ?: return false
        
        dataTagRepository.addTagToItem(itemId, tId)
        return true
    }

    /**
     * Remove tag from media item
     */
    suspend fun untagMediaItem(
        mediaId: String,
        mediaType: String,
        tagId: String
    ): Boolean {
        val itemId = mediaId.toLongOrNull() ?: return false
        val tId = tagId.toLongOrNull() ?: return false
        
        dataTagRepository.removeTagFromItem(itemId, tId)
        return true
    }

    /**
     * Get tags for media item
     */
    suspend fun getTagsForMediaItem(
        mediaId: String,
        mediaType: String
    ): List<UniversalTag> {
        val itemId = mediaId.toLongOrNull() ?: return emptyList()
        return dataTagRepository.getTagsForItem(itemId).first().map { it.toUniversalTag() }
    }

    /**
     * Get media items with specific tag
     */
    suspend fun getMediaItemsWithTag(tagId: String): List<MediaTagRelation> {
        val tId = tagId.toLongOrNull() ?: return emptyList()
        val itemIds = dataTagRepository.getItemsWithTag(tId)
        
        return itemIds.map { itemId ->
            MediaTagRelation(
                id = "rel_${itemId}_$tagId",
                mediaId = itemId.toString(),
                mediaType = "UNKNOWN", // Type info not stored in unified system
                tagId = tagId,
                createdAt = System.currentTimeMillis()
            )
        }
    }

    /**
     * Auto-tag content based on analysis
     */
    suspend fun autoTagContent(
        mediaId: String,
        mediaType: String,
        content: String,
        suggestedTags: List<String>
    ): Int {
        var taggedCount = 0
        val itemId = mediaId.toLongOrNull() ?: return 0
        
        suggestedTags.forEach { tagName ->
            val tagId = dataTagRepository.findOrCreateTag(
                name = tagName,
                type = TagType.AUTO_GENERATED,
                color = getRandomColor()
            )
            
            dataTagRepository.addTagToItem(itemId, tagId)
            taggedCount++
        }
        
        return taggedCount
    }

    /**
     * Get tag categories (derived from tag types)
     */
    suspend fun getCategories(): List<String> {
        return TagType.entries.map { it.name }
    }

    /**
     * Get tag statistics
     */
    suspend fun getTagStatistics(): TagStatistics {
        val allTagsList = _allTags.value
        val categories = getCategories()
        val totalUsage = allTagsList.sumOf { it.usageCount }
        
        return TagStatistics(
            totalTags = allTagsList.size,
            totalUsage = totalUsage,
            categories = categories.size,
            mostUsedTag = allTagsList.maxByOrNull { it.usageCount },
            recentTags = allTagsList.sortedByDescending { it.createdAt }.take(5)
        )
    }

    private suspend fun loadTags() {
        try {
            val tags = dataTagRepository.getAllTags().first()
            _allTags.value = tags.map { it.toUniversalTag() }
        } catch (e: Exception) {
            println("Failed to load tags: ${e.message}")
            _allTags.value = emptyList()
        }
    }

    private fun getRandomColor(): String {
        val colors = listOf(
            "#6366F1", "#8B5CF6", "#EC4899", "#F43F5E", 
            "#F97316", "#F59E0B", "#84CC16", "#10B981",
            "#14B8A6", "#06B6D4", "#3B82F6", "#6366F1"
        )
        return colors.random()
    }
    
    /**
     * Extension function to convert DbUnifiedTag to UniversalTag
     */
    private fun DbUnifiedTag.toUniversalTag(): UniversalTag {
        return UniversalTag(
            id = tagId.toString(),
            name = name,
            category = type.name,
            color = color ?: "#6366F1",
            description = description,
            createdAt = createdAt,
            usageCount = usageCount
        )
    }
}

/**
 * Universal tag data class
 */
data class UniversalTag(
    val id: String,
    val name: String,
    val category: String,
    val color: String,
    val description: String? = null,
    val createdAt: Long,
    val usageCount: Int = 0
)

/**
 * Media tag relation
 */
data class MediaTagRelation(
    val id: String,
    val mediaId: String,
    val mediaType: String,
    val tagId: String,
    val createdAt: Long
)

/**
 * Tag statistics
 */
data class TagStatistics(
    val totalTags: Int,
    val totalUsage: Int,
    val categories: Int,
    val mostUsedTag: UniversalTag?,
    val recentTags: List<UniversalTag>
)