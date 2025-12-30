package com.universalmedialibrary.services.tagging

import kotlinx.coroutines.flow.Flow

/**
 * Repository interface for tag operations
 */
interface TagRepository {
    
    suspend fun insertTag(tag: UniversalTag): Boolean
    suspend fun updateTag(tag: UniversalTag): Boolean
    suspend fun deleteTag(tagId: String): Boolean
    suspend fun getTagById(tagId: String): UniversalTag?
    suspend fun getAllTags(): Flow<List<UniversalTag>>
    suspend fun getTagsByIds(tagIds: List<String>): List<UniversalTag>
    suspend fun getTagsByCategory(category: String): Flow<List<UniversalTag>>
}

/**
 * Repository interface for media-tag relations
 */
interface MediaTagRelationRepository {
    
    suspend fun insertRelation(relation: MediaTagRelation): Boolean
    suspend fun removeRelation(mediaId: String, mediaType: String, tagId: String): Boolean
    suspend fun removeRelationsByTagId(tagId: String): Boolean
    suspend fun getRelationsForMedia(mediaId: String, mediaType: String): List<MediaTagRelation>
    suspend fun getRelationsForTag(tagId: String): List<MediaTagRelation>
}

/**
 * Mock implementation of TagRepository for testing
 */
class MockTagRepository : TagRepository {
    
    private val tags = mutableMapOf<String, UniversalTag>()
    
    override suspend fun insertTag(tag: UniversalTag): Boolean {
        tags[tag.id] = tag
        return true
    }
    
    override suspend fun updateTag(tag: UniversalTag): Boolean {
        tags[tag.id] = tag
        return true
    }
    
    override suspend fun deleteTag(tagId: String): Boolean {
        tags.remove(tagId)
        return true
    }
    
    override suspend fun getTagById(tagId: String): UniversalTag? {
        return tags[tagId]
    }
    
    override suspend fun getAllTags(): Flow<List<UniversalTag>> {
        return kotlinx.coroutines.flow.flowOf(tags.values.toList())
    }
    
    override suspend fun getTagsByIds(tagIds: List<String>): List<UniversalTag> {
        return tagIds.mapNotNull { tags[it] }
    }
    
    override suspend fun getTagsByCategory(category: String): Flow<List<UniversalTag>> {
        return kotlinx.coroutines.flow.flowOf(tags.values.filter { it.category == category })
    }
}

/**
 * Mock implementation of MediaTagRelationRepository for testing
 */
class MockMediaTagRelationRepository : MediaTagRelationRepository {
    
    private val relations = mutableMapOf<String, MediaTagRelation>()
    
    override suspend fun insertRelation(relation: MediaTagRelation): Boolean {
        relations[relation.id] = relation
        return true
    }
    
    override suspend fun removeRelation(mediaId: String, mediaType: String, tagId: String): Boolean {
        val toRemove = relations.values.filter { 
            it.mediaId == mediaId && it.mediaType == mediaType && it.tagId == tagId 
        }
        toRemove.forEach { relations.remove(it.id) }
        return true
    }
    
    override suspend fun removeRelationsByTagId(tagId: String): Boolean {
        val toRemove = relations.values.filter { it.tagId == tagId }
        toRemove.forEach { relations.remove(it.id) }
        return true
    }
    
    override suspend fun getRelationsForMedia(mediaId: String, mediaType: String): List<MediaTagRelation> {
        return relations.values.filter { it.mediaId == mediaId && it.mediaType == mediaType }
    }
    
    override suspend fun getRelationsForTag(tagId: String): List<MediaTagRelation> {
        return relations.values.filter { it.tagId == tagId }
    }
}