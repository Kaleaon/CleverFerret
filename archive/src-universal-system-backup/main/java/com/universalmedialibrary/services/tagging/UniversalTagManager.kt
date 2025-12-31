package com.universalmedialibrary.services.tagging

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.combine
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.data.local.dao.UniversalTagDao
import com.universalmedialibrary.data.local.dao.MediaTagRelationDao
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.services.ai.AIContentAnalysisService

/**
 * Universal Tag Manager - Central service for all tagging operations across media types.
 * Provides comprehensive tagging functionality with AI-powered auto-tagging and analytics.
 */
@Singleton
class UniversalTagManager @Inject constructor(
    private val tagDao: UniversalTagDao,
    private val relationDao: MediaTagRelationDao,
    private val aiService: AIContentAnalysisService
) {
    
    // ========== Tag Management ==========
    
    /**
     * Creates a new universal tag.
     */
    suspend fun createTag(
        name: String,
        category: TagCategory = TagCategory.CUSTOM,
        color: String? = category.defaultColor,
        icon: String? = null,
        description: String? = null,
        parentTagId: Long? = null
    ): UniversalTag {
        // Normalize tag name
        val normalizedName = name.trim().capitalizeWords()
        
        // Check if tag already exists
        val existingTag = tagDao.getTagByName(normalizedName)
        if (existingTag != null) {
            return existingTag.copy(
                category = category,
                color = color,
                icon = icon,
                description = description,
                parentTagId = parentTagId
            ).also { tagDao.updateTag(it) }
        }
        
        val tag = UniversalTag(
            name = normalizedName,
            category = category,
            color = color,
            icon = icon,
            description = description,
            parentTagId = parentTagId,
            isSystemTag = false
        )
        
        val tagId = tagDao.insertTag(tag)
        return tag.copy(id = tagId)
    }
    
    /**
     * Updates an existing tag.
     */
    suspend fun updateTag(tag: UniversalTag): Boolean {
        return try {
            tagDao.updateTag(tag.copy(updatedAt = System.currentTimeMillis()))
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Deletes a tag and removes all its relationships.
     */
    suspend fun deleteTag(tagId: Long): Boolean {
        return try {
            // Remove all media relations first
            relationDao.removeTagFromAllMedia(tagId)
            // Then delete the tag
            tagDao.deleteTagById(tagId)
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Gets a tag by ID.
     */
    suspend fun getTag(tagId: Long): UniversalTag? {
        return tagDao.getTagById(tagId)
    }
    
    /**
     * Gets a tag by name.
     */
    suspend fun getTagByName(name: String): UniversalTag? {
        return tagDao.getTagByName(name.trim().capitalizeWords())
    }
    
    /**
     * Gets all tags as a flow.
     */
    fun getAllTags(): Flow<List<UniversalTag>> {
        return tagDao.getAllTags()
    }
    
    /**
     * Gets tags by category.
     */
    fun getTagsByCategory(category: TagCategory): Flow<List<UniversalTag>> {
        return tagDao.getTagsByCategory(category)
    }
    
    /**
     * Gets system tags.
     */
    fun getSystemTags(): Flow<List<UniversalTag>> {
        return tagDao.getSystemTags()
    }
    
    /**
     * Gets user-created tags.
     */
    fun getUserTags(): Flow<List<UniversalTag>> {
        return tagDao.getUserTags()
    }
    
    /**
     * Gets popular tags based on usage count.
     */
    fun getPopularTags(limit: Int = 50): Flow<List<UniversalTag>> {
        return tagDao.getPopularTags(limit)
    }
    
    /**
     * Gets recently created tags.
     */
    fun getRecentTags(limit: Int = 20): Flow<List<UniversalTag>> {
        return tagDao.getRecentTags(limit)
    }
    
    /**
     * Searches tags by query.
     */
    suspend fun searchTags(query: String, limit: Int = 50): List<UniversalTag> {
        return tagDao.searchTags(query, limit)
    }
    
    /**
     * Gets tag suggestions for autocomplete.
     */
    suspend fun getTagSuggestions(query: String, limit: Int = 10): List<UniversalTag> {
        return tagDao.getTagSuggestions(query, limit)
    }
    
    // ========== Media Tagging ==========
    
    /**
     * Tags a media item with multiple tags.
     */
    suspend fun tagMedia(
        mediaId: String,
        mediaType: MediaType,
        tagIds: List<Long>,
        source: TagSource = TagSource.MANUAL,
        confidence: Float = 1.0f
    ): Boolean {
        return try {
            val relations = tagIds.map { tagId ->
                MediaTagRelation(
                    mediaId = mediaId,
                    mediaType = mediaType,
                    tagId = tagId,
                    source = source,
                    confidence = confidence,
                    weight = if (source == TagSource.MANUAL) 1.0f else 0.8f
                )
            }
            
            relationDao.insertRelations(relations)
            
            // Update tag usage counts
            tagIds.forEach { tagId ->
                tagDao.incrementTagUsage(tagId)
            }
            
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Tags a media item with a single tag.
     */
    suspend fun tagMedia(
        mediaId: String,
        mediaType: MediaType,
        tagId: Long,
        source: TagSource = TagSource.MANUAL,
        confidence: Float = 1.0f
    ): Boolean {
        return tagMedia(mediaId, mediaType, listOf(tagId), source, confidence)
    }
    
    /**
     * Removes tags from a media item.
     */
    suspend fun untagMedia(
        mediaId: String,
        mediaType: MediaType,
        tagIds: List<Long>
    ): Boolean {
        return try {
            relationDao.removeSpecificTagsFromMedia(mediaId, mediaType, tagIds)
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Removes all tags from a media item.
     */
    suspend fun removeAllTagsFromMedia(
        mediaId: String,
        mediaType: MediaType
    ): Boolean {
        return try {
            relationDao.removeAllTagsFromMedia(mediaId, mediaType)
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Replaces all tags for a media item.
     */
    suspend fun replaceTagsForMedia(
        mediaId: String,
        mediaType: MediaType,
        tagIds: List<Long>,
        source: TagSource = TagSource.MANUAL
    ): Boolean {
        return try {
            val relations = tagIds.map { tagId ->
                MediaTagRelation(
                    mediaId = mediaId,
                    mediaType = mediaType,
                    tagId = tagId,
                    source = source,
                    confidence = 1.0f,
                    weight = if (source == TagSource.MANUAL) 1.0f else 0.8f
                )
            }
            
            relationDao.replaceTagsForMedia(mediaId, mediaType, relations)
            
            // Update tag usage counts
            tagIds.forEach { tagId ->
                tagDao.incrementTagUsage(tagId)
            }
            
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Gets tags for a media item.
     */
    fun getTagsForMedia(mediaId: String, mediaType: MediaType): Flow<List<MediaTagRelation>> {
        return relationDao.getTagsForMediaFlow(mediaId, mediaType)
    }
    
    /**
     * Gets media items for a tag.
     */
    fun getMediaForTag(tagId: Long): Flow<List<MediaTagRelation>> {
        return relationDao.getMediaForTag(tagId)
    }
    
    /**
     * Gets tag count for a media item.
     */
    suspend fun getTagCountForMedia(mediaId: String, mediaType: MediaType): Int {
        return relationDao.getTagCountForMedia(mediaId, mediaType)
    }
    
    // ========== Auto-Tagging ==========
    
    /**
     * Automatically tags content using AI analysis.
     */
    suspend fun autoTagContent(
        mediaId: String,
        mediaType: MediaType,
        content: String? = null,
        metadata: Map<String, Any>? = null
    ): AutoTagResult {
        return try {
            // Get AI suggestions
            val aiSuggestions = aiService.generateTags(content, metadata, mediaType)
            
            // Convert tag names to tag IDs
            val tagIds = mutableListOf<Long>()
            val createdTags = mutableListOf<UniversalTag>()
            
            aiSuggestions.forEach { suggestion ->
                val existingTag = tagDao.getTagByName(suggestion.name)
                val tagId = if (existingTag != null) {
                    existingTag.id
                } else {
                    val newTag = createTag(
                        name = suggestion.name,
                        category = TagCategory.AUTO,
                        confidence = suggestion.confidence
                    )
                    createdTags.add(newTag)
                    newTag.id
                }
                tagIds.add(tagId)
            }
            
            // Apply tags to media
            val success = tagMedia(
                mediaId = mediaId,
                mediaType = mediaType,
                tagIds = tagIds,
                source = TagSource.AI,
                confidence = aiSuggestions.map { it.confidence }.average().toFloat()
            )
            
            AutoTagResult(
                success = success,
                tagsAdded = tagIds.size,
                tagsCreated = createdTags.size,
                suggestions = aiSuggestions,
                createdTags = createdTags
            )
        } catch (e: Exception) {
            AutoTagResult(
                success = false,
                tagsAdded = 0,
                tagsCreated = 0,
                error = e.message
            )
        }
    }
    
    /**
     * Batch auto-tagging for multiple media items.
     */
    suspend fun batchAutoTag(
        items: List<BatchTagItem>
    ): List<AutoTagResult> {
        return items.map { item ->
            autoTagContent(item.mediaId, item.mediaType, item.content, item.metadata)
        }
    }
    
    // ========== Analytics and Insights ==========
    
    /**
     * Gets tag categories with statistics.
     */
    fun getTagCategoriesWithStats(): Flow<List<CategoryStats>> {
        return tagDao.getTagCategoriesWithStats()
    }
    
    /**
     * Gets media type distribution for a tag.
     */
    suspend fun getMediaTypeDistributionForTag(tagId: Long): List<MediaTypeCount> {
        return relationDao.getMediaTypeDistributionForTag(tagId)
    }
    
    /**
     * Gets related tags based on co-occurrence.
     */
    suspend fun getRelatedTags(tagId: Long, limit: Int = 20): List<UniversalTag> {
        val relatedTagIds = relationDao.getRelatedTags(tagId, limit)
        return relatedTagIds.mapNotNull { tagDao.getTagById(it) }
    }
    
    /**
     * Gets tags without colors for cleanup.
     */
    suspend fun getTagsWithoutColor(): List<UniversalTag> {
        return tagDao.getTagsWithoutColor()
    }
    
    /**
     * Gets tags without icons for cleanup.
     */
    suspend fun getTagsWithoutIcon(): List<UniversalTag> {
        return tagDao.getTagsWithoutIcon()
    }
    
    /**
     * Updates tag usage count.
     */
    suspend fun updateTagUsage(tagId: Long, count: Int): Boolean {
        return try {
            tagDao.updateTagUsage(tagId, count)
            true
        } catch (e: Exception) {
            false
        }
    }
    
    // ========== Maintenance ==========
    
    /**
     * Cleans up unused tags.
     */
    suspend fun cleanupUnusedTags(daysOld: Int = 30): Int {
        val cutoffTime = System.currentTimeMillis() - (daysOld * 24 * 60 * 60 * 1000L)
        return try {
            tagDao.cleanupUnusedTags(cutoffTime)
            // Room doesn't return affected count for custom queries, so we estimate
            0
        } catch (e: Exception) {
            0
        }
    }
    
    /**
     * Finds and merges duplicate tags.
     */
    suspend fun mergeDuplicateTags(): MergeResult {
        val duplicateNames = tagDao.findDuplicateTagNames()
        var mergedCount = 0
        
        duplicateNames.forEach { name ->
            val tags = searchTags(name, limit = 100)
            if (tags.size > 1) {
                // Keep the first tag, merge others into it
                val primaryTag = tags.first()
                val duplicateTags = tags.drop(1)
                
                duplicateTags.forEach { duplicateTag ->
                    // Update all relations to point to primary tag
                    val relations = relationDao.getMediaForTag(duplicateTag.id)
                    relations.forEach { relation ->
                        val newRelation = relation.copy(tagId = primaryTag.id)
                        relationDao.deleteRelation(relation)
                        relationDao.insertRelation(newRelation)
                    }
                    
                    // Delete duplicate tag
                    tagDao.deleteTag(duplicateTag)
                    mergedCount++
                }
            }
        }
        
        return MergeResult(mergedCount)
    }
    
    /**
     * Exports tags to CSV format.
     */
    suspend fun exportTags(): String {
        val tags = tagDao.getAllTags()
        return buildString {
            appendLine("id,name,category,color,icon,usage_count,created_at,is_system")
            tags.collect { tagList ->
                tagList.forEach { tag ->
                    appendLine("${tag.id},${tag.name},${tag.category},${tag.color},${tag.icon},${tag.usageCount},${tag.createdAt},${tag.isSystemTag}")
                }
            }
        }
    }
}

// Extension function for string capitalization
private fun String.capitalizeWords(): String {
    return this.split(" ").joinToString(" ") { 
        it.lowercase().replaceFirstChar { char -> char.uppercase() } 
    }
}

// Data classes for results
data class AutoTagResult(
    val success: Boolean,
    val tagsAdded: Int,
    val tagsCreated: Int,
    val suggestions: List<TagSuggestion> = emptyList(),
    val createdTags: List<UniversalTag> = emptyList(),
    val error: String? = null
)

data class TagSuggestion(
    val name: String,
    val confidence: Float,
    val category: TagCategory = TagCategory.AUTO
)

data class BatchTagItem(
    val mediaId: String,
    val mediaType: MediaType,
    val content: String? = null,
    val metadata: Map<String, Any>? = null
)

data class MergeResult(
    val mergedCount: Int,
    val error: String? = null
)