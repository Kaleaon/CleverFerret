package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.UnifiedTagDao
import com.universalmedialibrary.data.local.entity.ItemTag
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.local.entity.UnifiedTag
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for unified tag operations
 *
 * Provides high-level tag management with:
 * - Tag CRUD operations
 * - Item tagging
 * - Tag suggestions
 * - Batch operations
 * - Tag merging
 */
@Singleton
class TagRepository @Inject constructor(
    private val tagDao: UnifiedTagDao
) {

    /**
     * Get all tags
     */
    fun getAllTags(): Flow<List<UnifiedTag>> = tagDao.getAllTags()

    /**
     * Get tags by type
     */
    fun getTagsByType(type: TagType): Flow<List<UnifiedTag>> = tagDao.getTagsByType(type)

    /**
     * Get recently used tags
     */
    fun getRecentTags(limit: Int = 10): Flow<List<UnifiedTag>> = 
        tagDao.getRecentlyUsedTags(limit)

    /**
     * Get most used tags
     */
    fun getPopularTags(limit: Int = 10): Flow<List<UnifiedTag>> = 
        tagDao.getMostUsedTags(limit)

    /**
     * Search tags by name
     */
    fun searchTags(query: String): Flow<List<UnifiedTag>> = 
        tagDao.searchTags(query)

    /**
     * Get tag suggestions for auto-complete
     */
    fun getTagSuggestions(query: String, limit: Int = 5): Flow<List<UnifiedTag>> = 
        tagDao.getTagSuggestions(query, limit)

    /**
     * Get tags for a specific item
     */
    fun getTagsForItem(itemId: Long): Flow<List<UnifiedTag>> = 
        tagDao.getTagsForItem(itemId)

    /**
     * Get tag by ID
     */
    suspend fun getTagById(tagId: Long): UnifiedTag? = 
        tagDao.getTagById(tagId)

    /**
     * Get tag by name
     */
    suspend fun getTagByName(name: String): UnifiedTag? = 
        tagDao.getTagByName(name)

    /**
     * Create a new tag
     */
    suspend fun createTag(
        name: String,
        type: TagType = TagType.USER_DEFINED,
        color: String? = null,
        description: String? = null
    ): Long {
        return tagDao.insertTag(
            UnifiedTag(
                name = name,
                type = type,
                color = color,
                description = description
            )
        )
    }

    /**
     * Update a tag
     */
    suspend fun updateTag(tag: UnifiedTag) {
        tagDao.updateTag(tag)
    }

    /**
     * Delete a tag
     */
    suspend fun deleteTag(tag: UnifiedTag) {
        tagDao.deleteTag(tag)
    }

    /**
     * Delete tag by ID
     */
    suspend fun deleteTagById(tagId: Long) {
        tagDao.deleteTagById(tagId)
    }

    /**
     * Find or create a tag by name
     */
    suspend fun findOrCreateTag(
        name: String,
        type: TagType = TagType.USER_DEFINED,
        color: String? = null
    ): Long {
        return tagDao.findOrCreateTag(name, type, color)
    }

    /**
     * Add a tag to an item
     */
    suspend fun addTagToItem(itemId: Long, tagId: Long) {
        tagDao.addTagToItem(ItemTag(itemId = itemId, tagId = tagId))
        tagDao.incrementUsageCount(tagId)
    }

    /**
     * Add multiple tags to an item
     */
    suspend fun addTagsToItem(itemId: Long, tagIds: List<Long>) {
        tagDao.applyTagsToItem(itemId, tagIds)
    }

    /**
     * Remove a tag from an item
     */
    suspend fun removeTagFromItem(itemId: Long, tagId: Long) {
        tagDao.removeTagFromItem(itemId, tagId)
        tagDao.recalculateUsageCount(tagId)
    }

    /**
     * Remove all tags from an item
     */
    suspend fun removeAllTagsFromItem(itemId: Long) {
        val tags = tagDao.getTagsForItemSync(itemId)
        tagDao.removeAllTagsFromItem(itemId)
        
        // Recalculate usage counts for affected tags
        tags.forEach { tag ->
            tagDao.recalculateUsageCount(tag.tagId)
        }
    }

    /**
     * Apply tags to item by names (creates tags if they don't exist)
     */
    suspend fun applyTagsByName(itemId: Long, tagNames: List<String>, type: TagType = TagType.USER_DEFINED) {
        val tagIds = tagNames.map { name ->
            findOrCreateTag(name, type)
        }
        addTagsToItem(itemId, tagIds)
    }

    /**
     * Get items with a specific tag
     */
    suspend fun getItemsWithTag(tagId: Long): List<Long> {
        return tagDao.getItemIdsForTag(tagId)
    }

    /**
     * Merge two tags (combines all items from source to destination)
     */
    suspend fun mergeTags(fromTagId: Long, toTagId: Long) {
        tagDao.mergeTag(fromTagId, toTagId)
    }

    /**
     * Get popular tags for a specific media type
     */
    suspend fun getPopularTagsForMediaType(mediaType: String, limit: Int = 10): List<UnifiedTag> {
        return tagDao.getPopularTagsForMediaType(mediaType, limit)
    }

    /**
     * Recalculate all tag usage counts
     */
    suspend fun recalculateAllUsageCounts() {
        tagDao.recalculateAllUsageCounts()
    }

    /**
     * Batch create tags from a list of names
     */
    suspend fun createTagsFromNames(
        names: List<String>,
        type: TagType = TagType.USER_DEFINED,
        color: String? = null
    ): List<Long> {
        val tags = names.map { name ->
            UnifiedTag(
                name = name,
                type = type,
                color = color
            )
        }
        return tagDao.insertTags(tags)
    }
}
