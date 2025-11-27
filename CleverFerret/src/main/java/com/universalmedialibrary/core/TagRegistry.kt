package com.universalmedialibrary.core

import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.local.entity.UnifiedTag
import com.universalmedialibrary.data.repository.TagRepository
import com.universalmedialibrary.services.webfiction.WebFictionTag
import com.universalmedialibrary.services.webfiction.TagCategory
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Centralized registry for all tags across the application.
 * 
 * Provides unified search and discovery of tags from:
 * - UnifiedTag system (user-defined, auto-generated, imported)
 * - WebFiction tags (AO3, FanFiction.net, Royal Road, etc.)
 * - Music tags (ID3 tags, genres, etc.)
 * - Plex tags (imported from Plex servers)
 * - Calibre tags (imported from Calibre libraries)
 * 
 * All tags are searchable by:
 * - Name
 * - Category
 * - Type
 * - Description
 * - Usage count
 */
@Singleton
class TagRegistry @Inject constructor(
    private val tagRepository: TagRepository
) {
    
    /**
     * Unified tag representation from all sources
     */
    data class UnifiedTagInfo(
        val id: String, // Unique identifier (can be Long.toString() or external ID)
        val name: String,
        val displayName: String,
        val category: TagCategory? = null,
        val type: TagSource,
        val description: String? = null,
        val usageCount: Int = 0,
        val color: String? = null,
        val parentTag: String? = null,
        val metadata: Map<String, Any> = emptyMap() // Additional metadata
    )
    
    /**
     * Tag source enumeration
     */
    enum class TagSource {
        UNIFIED_TAG,      // From UnifiedTag system
        WEB_FICTION,      // From web fiction sites
        MUSIC,            // From music metadata
        PLEX,             // From Plex imports
        CALIBRE,          // From Calibre imports
        JELLYFIN,         // From Jellyfin imports
        USER_DEFINED      // User-created tags
    }
    
    /**
     * Map TagType to TagSource
     */
    private fun mapTagTypeToSource(type: TagType): TagSource = when (type) {
        TagType.USER_DEFINED -> TagSource.USER_DEFINED
        TagType.AUTO_GENERATED -> TagSource.UNIFIED_TAG
        TagType.IMPORTED_PLEX -> TagSource.PLEX
        TagType.IMPORTED_CALIBRE -> TagSource.CALIBRE
        TagType.IMPORTED_JELLYFIN -> TagSource.JELLYFIN
    }
    
    /**
     * Convert UnifiedTag to UnifiedTagInfo
     */
    private fun UnifiedTag.toUnifiedTagInfo(includeMetadata: Boolean = true): UnifiedTagInfo {
        return UnifiedTagInfo(
            id = tagId.toString(),
            name = name,
            displayName = name,
            category = null,
            type = mapTagTypeToSource(type),
            description = description,
            usageCount = usageCount,
            color = color,
            metadata = if (includeMetadata) mapOf(
                "createdAt" to createdAt,
                "lastUsed" to lastUsed,
                "externalId" to (externalId ?: "")
            ) else emptyMap()
        )
    }
    
    /**
     * Search tags across all sources
     * 
     * @param query Search query (searches name, description)
     * @param category Optional category filter
     * @param source Optional source filter
     * @param limit Maximum number of results
     * @return Flow of matching tags
     */
    fun searchTags(
        query: String,
        category: TagCategory? = null,
        source: TagSource? = null,
        limit: Int = 100
    ): Flow<List<UnifiedTagInfo>> {
        val lowerQuery = query.lowercase().trim()
        
        return if (lowerQuery.isEmpty()) {
            getAllTags(category, source, limit)
        } else {
            tagRepository.searchTags(query).map { unifiedTags ->
                unifiedTags
                    .filter { tag ->
                        source == null || mapTagTypeToSource(tag.type) == source
                    }
                    .take(limit)
                    .map { it.toUnifiedTagInfo() }
            }
        }
    }
    
    /**
     * Get all tags with optional filters
     */
    fun getAllTags(
        category: TagCategory? = null,
        source: TagSource? = null,
        limit: Int = 100
    ): Flow<List<UnifiedTagInfo>> {
        return tagRepository.getAllTags().map { tags ->
            tags
                .filter { tag ->
                    source == null || mapTagTypeToSource(tag.type) == source
                }
                .take(limit)
                .map { it.toUnifiedTagInfo() }
        }
    }
    
    /**
     * Get popular tags
     */
    fun getPopularTags(limit: Int = 50): Flow<List<UnifiedTagInfo>> {
        return tagRepository.getPopularTags(limit).map { tags ->
            tags.map { it.toUnifiedTagInfo(includeMetadata = false) }
        }
    }
    
    /**
     * Get recent tags
     */
    fun getRecentTags(limit: Int = 20): Flow<List<UnifiedTagInfo>> {
        return tagRepository.getRecentTags(limit).map { tags ->
            tags.map { it.toUnifiedTagInfo(includeMetadata = false) }
        }
    }
    
    /**
     * Convert WebFictionTag to UnifiedTagInfo
     */
    fun convertWebFictionTag(webTag: WebFictionTag): UnifiedTagInfo {
        return UnifiedTagInfo(
            id = webTag.id,
            name = webTag.name,
            displayName = webTag.displayName,
            category = webTag.category,
            type = TagSource.WEB_FICTION,
            description = webTag.description,
            usageCount = webTag.count,
            parentTag = webTag.parentTag,
            metadata = mapOf(
                "webFictionId" to webTag.id,
                "category" to webTag.category.name
            )
        )
    }
    
    /**
     * Convert UnifiedTag to UnifiedTagInfo
     */
    fun convertUnifiedTag(tag: UnifiedTag): UnifiedTagInfo {
        return tag.toUnifiedTagInfo()
    }
}
