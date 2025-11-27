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
                        (source == null || source == TagSource.UNIFIED_TAG || source == TagSource.USER_DEFINED)
                    }
                    .take(limit)
                    .map { tag ->
                        UnifiedTagInfo(
                            id = tag.tagId.toString(),
                            name = tag.name,
                            displayName = tag.name,
                            category = null,
                            type = when (tag.type) {
                                TagType.USER_DEFINED -> TagSource.USER_DEFINED
                                TagType.AUTO_GENERATED -> TagSource.UNIFIED_TAG
                                TagType.IMPORTED_PLEX -> TagSource.PLEX
                                TagType.IMPORTED_CALIBRE -> TagSource.CALIBRE
                                TagType.IMPORTED_JELLYFIN -> TagSource.JELLYFIN
                            },
                            description = tag.description,
                            usageCount = tag.usageCount,
                            color = tag.color,
                            metadata = mapOf(
                                "createdAt" to tag.createdAt,
                                "lastUsed" to tag.lastUsed,
                                "externalId" to (tag.externalId ?: "")
                            )
                        )
                    }
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
                    (source == null || when (tag.type) {
                        TagType.USER_DEFINED -> source == TagSource.USER_DEFINED
                        TagType.AUTO_GENERATED -> source == TagSource.UNIFIED_TAG
                        TagType.IMPORTED_PLEX -> source == TagSource.PLEX
                        TagType.IMPORTED_CALIBRE -> source == TagSource.CALIBRE
                        TagType.IMPORTED_JELLYFIN -> source == TagSource.JELLYFIN
                        else -> false
                    })
                }
                .take(limit)
                .map { tag ->
                    UnifiedTagInfo(
                        id = tag.tagId.toString(),
                        name = tag.name,
                        displayName = tag.name,
                        category = null,
                        type = when (tag.type) {
                            TagType.USER_DEFINED -> TagSource.USER_DEFINED
                            TagType.AUTO_GENERATED -> TagSource.UNIFIED_TAG
                            TagType.IMPORTED_PLEX -> TagSource.PLEX
                            TagType.IMPORTED_CALIBRE -> TagSource.CALIBRE
                            TagType.IMPORTED_JELLYFIN -> TagSource.JELLYFIN
                        },
                        description = tag.description,
                        usageCount = tag.usageCount,
                        color = tag.color,
                        metadata = mapOf(
                            "createdAt" to tag.createdAt,
                            "lastUsed" to tag.lastUsed,
                            "externalId" to (tag.externalId ?: "")
                        )
                    )
                }
        }
    }
    
    /**
     * Get popular tags
     */
    fun getPopularTags(limit: Int = 50): Flow<List<UnifiedTagInfo>> {
        return tagRepository.getPopularTags(limit).map { tags ->
            tags.map { tag ->
                UnifiedTagInfo(
                    id = tag.tagId.toString(),
                    name = tag.name,
                    displayName = tag.name,
                    type = when (tag.type) {
                        TagType.USER_DEFINED -> TagSource.USER_DEFINED
                        TagType.AUTO_GENERATED -> TagSource.UNIFIED_TAG
                        TagType.IMPORTED_PLEX -> TagSource.PLEX
                        TagType.IMPORTED_CALIBRE -> TagSource.CALIBRE
                        TagType.IMPORTED_JELLYFIN -> TagSource.JELLYFIN
                    },
                    usageCount = tag.usageCount,
                    color = tag.color,
                    description = tag.description
                )
            }
        }
    }
    
    /**
     * Get recent tags
     */
    fun getRecentTags(limit: Int = 20): Flow<List<UnifiedTagInfo>> {
        return tagRepository.getRecentTags(limit).map { tags ->
            tags.map { tag ->
                UnifiedTagInfo(
                    id = tag.tagId.toString(),
                    name = tag.name,
                    displayName = tag.name,
                    type = when (tag.type) {
                        TagType.USER_DEFINED -> TagSource.USER_DEFINED
                        TagType.AUTO_GENERATED -> TagSource.UNIFIED_TAG
                        TagType.IMPORTED_PLEX -> TagSource.PLEX
                        TagType.IMPORTED_CALIBRE -> TagSource.CALIBRE
                        TagType.IMPORTED_JELLYFIN -> TagSource.JELLYFIN
                    },
                    usageCount = tag.usageCount,
                    color = tag.color,
                    description = tag.description
                )
            }
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
        return UnifiedTagInfo(
            id = tag.tagId.toString(),
            name = tag.name,
            displayName = tag.name,
            type = when (tag.type) {
                TagType.USER_DEFINED -> TagSource.USER_DEFINED
                TagType.AUTO_GENERATED -> TagSource.UNIFIED_TAG
                TagType.IMPORTED_PLEX -> TagSource.PLEX
                TagType.IMPORTED_CALIBRE -> TagSource.CALIBRE
                TagType.IMPORTED_JELLYFIN -> TagSource.JELLYFIN
            },
            description = tag.description,
            usageCount = tag.usageCount,
            color = tag.color,
            metadata = mapOf(
                "createdAt" to tag.createdAt,
                "lastUsed" to tag.lastUsed,
                "externalId" to (tag.externalId ?: "")
            )
        )
    }
}
