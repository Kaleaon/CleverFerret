package com.universalmedialibrary.services.tagging

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal Tag Manager for CleverFerret
 * 
 * Manages tags across all media types with categories, colors,
 * auto-tagging, and usage analytics.
 */
@Singleton
class UniversalTagManager @Inject constructor(
    private val tagRepository: TagRepository,
    private val mediaTagRelationRepository: MediaTagRelationRepository
) {
    
    private val _allTags = MutableStateFlow<List<UniversalTag>>(emptyList())
    val allTags: Flow<List<UniversalTag>> = _allTags.asStateFlow()

    init {
        loadTags()
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
        val tag = UniversalTag(
            id = generateTagId(),
            name = name.trim(),
            category = category,
            color = color,
            description = description,
            createdAt = System.currentTimeMillis(),
            usageCount = 0
        )
        
        tagRepository.insertTag(tag)
        loadTags()
        return tag
    }

    /**
     * Get tag by ID
     */
    suspend fun getTag(tagId: String): UniversalTag? {
        return tagRepository.getTagById(tagId)
    }

    /**
     * Update existing tag
     */
    suspend fun updateTag(tag: UniversalTag): Boolean {
        val success = tagRepository.updateTag(tag)
        if (success) {
            loadTags()
        }
        return success
    }

    /**
     * Delete tag
     */
    suspend fun deleteTag(tagId: String): Boolean {
        // Remove all relations first
        mediaTagRelationRepository.removeRelationsByTagId(tagId)
        
        val success = tagRepository.deleteTag(tagId)
        if (success) {
            loadTags()
        }
        return success
    }

    /**
     * Search tags by query
     */
    suspend fun searchTags(query: String): List<UniversalTag> {
        val allTagsList = _allTags.value
        return allTagsList.filter { tag ->
            tag.name.contains(query, ignoreCase = true) ||
            tag.category.contains(query, ignoreCase = true) ||
            (tag.description?.contains(query, ignoreCase = true) ?: false)
        }
    }

    /**
     * Get tags by category
     */
    suspend fun getTagsByCategory(category: String): List<UniversalTag> {
        val allTagsList = _allTags.value
        return allTagsList.filter { it.category == category }
    }

    /**
     * Get popular tags
     */
    suspend fun getPopularTags(limit: Int = 20): List<UniversalTag> {
        val allTagsList = _allTags.value
        return allTagsList
            .sortedByDescending { it.usageCount }
            .take(limit)
    }

    /**
     * Tag media item
     */
    suspend fun tagMediaItem(
        mediaId: String,
        mediaType: String,
        tagId: String
    ): Boolean {
        val relation = MediaTagRelation(
            id = generateRelationId(),
            mediaId = mediaId,
            mediaType = mediaType,
            tagId = tagId,
            createdAt = System.currentTimeMillis()
        )
        
        val success = mediaTagRelationRepository.insertRelation(relation)
        if (success) {
            // Increment tag usage
            getTag(tagId)?.let { tag ->
                updateTag(tag.copy(usageCount = tag.usageCount + 1))
            }
        }
        return success
    }

    /**
     * Remove tag from media item
     */
    suspend fun untagMediaItem(
        mediaId: String,
        mediaType: String,
        tagId: String
    ): Boolean {
        val success = mediaTagRelationRepository.removeRelation(mediaId, mediaType, tagId)
        if (success) {
            // Decrement tag usage
            getTag(tagId)?.let { tag ->
                updateTag(tag.copy(usageCount = maxOf(0, tag.usageCount - 1)))
            }
        }
        return success
    }

    /**
     * Get tags for media item
     */
    suspend fun getTagsForMediaItem(
        mediaId: String,
        mediaType: String
    ): List<UniversalTag> {
        val relations = mediaTagRelationRepository.getRelationsForMedia(mediaId, mediaType)
        val tagIds = relations.map { it.tagId }
        return tagRepository.getTagsByIds(tagIds)
    }

    /**
     * Get media items with specific tag
     */
    suspend fun getMediaItemsWithTag(tagId: String): List<MediaTagRelation> {
        return mediaTagRelationRepository.getRelationsForTag(tagId)
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
        
        suggestedTags.forEach { tagName ->
            // Check if tag exists
            val existingTag = searchTags(tagName).firstOrNull()
            val tag = existingTag ?: createTag(
                name = tagName,
                category = "Auto-generated",
                color = getRandomColor()
            )
            
            if (tagMediaItem(mediaId, mediaType, tag.id)) {
                taggedCount++
            }
        }
        
        return taggedCount
    }

    /**
     * Get tag categories
     */
    suspend fun getCategories(): List<String> {
        val allTagsList = _allTags.value
        return allTagsList.map { it.category }.distinct().sorted()
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
            val tags = tagRepository.getAllTags().first()
            _allTags.value = tags
        } catch (e: Exception) {
            println("Failed to load tags: ${e.message}")
            _allTags.value = emptyList()
        }
    }

    private fun generateTagId(): String {
        return "tag_${System.currentTimeMillis()}_${(1000..9999).random()}"
    }

    private fun generateRelationId(): String {
        return "rel_${System.currentTimeMillis()}_${(1000..9999).random()}"
    }

    private fun getRandomColor(): String {
        val colors = listOf(
            "#6366F1", "#8B5CF6", "#EC4899", "#F43F5E", 
            "#F97316", "#F59E0B", "#84CC16", "#10B981",
            "#14B8A6", "#06B6D4", "#3B82F6", "#6366F1"
        )
        return colors.random()
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