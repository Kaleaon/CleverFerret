package com.universalmedialibrary.data.local.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import com.universalmedialibrary.data.local.entity.MediaTagRelation
import com.universalmedialibrary.data.local.entity.MediaType
import com.universalmedialibrary.data.local.entity.TagSource

/**
 * Data Access Object for MediaTagRelation operations.
 * Manages many-to-many relationships between media items and tags.
 */
@Dao
interface MediaTagRelationDao {
    
    // Basic CRUD Operations
    @Insert
    suspend fun insertRelation(relation: MediaTagRelation): Long
    
    @Insert
    suspend fun insertRelations(relations: List<MediaTagRelation>): List<Long>
    
    @Update
    suspend fun updateRelation(relation: MediaTagRelation)
    
    @Delete
    suspend fun deleteRelation(relation: MediaTagRelation)
    
    @Query("DELETE FROM media_tag_relations WHERE id = :relationId")
    suspend fun deleteRelationById(relationId: Long)
    
    // Query Operations
    @Query("""
        SELECT tr.* FROM media_tag_relations tr
        INNER JOIN universal_tags t ON tr.tag_id = t.id
        WHERE tr.media_id = :mediaId AND tr.media_type = :mediaType
        ORDER BY t.name ASC
    """)
    suspend fun getTagsForMedia(mediaId: String, mediaType: MediaType): List<MediaTagRelation>
    
    @Query("""
        SELECT tr.* FROM media_tag_relations tr
        INNER JOIN universal_tags t ON tr.tag_id = t.id
        WHERE tr.media_id = :mediaId AND tr.media_type = :mediaType
        ORDER BY tr.weight DESC, t.name ASC
    """)
    fun getTagsForMediaFlow(mediaId: String, mediaType: MediaType): Flow<List<MediaTagRelation>>
    
    @Query("""
        SELECT tr.* FROM media_tag_relations tr
        WHERE tr.tag_id = :tagId
        ORDER BY tr.weight DESC, tr.last_applied DESC
    """)
    fun getMediaForTag(tagId: Long): Flow<List<MediaTagRelation>>
    
    @Query("""
        SELECT tr.* FROM media_tag_relations tr
        WHERE tr.tag_id = :tagId AND tr.media_type = :mediaType
        ORDER BY tr.weight DESC, tr.last_applied DESC
    """)
    suspend fun getMediaForTagByType(tagId: Long, mediaType: MediaType): List<MediaTagRelation>
    
    @Query("""
        SELECT tr.* FROM media_tag_relations tr
        WHERE tr.media_id IN (:mediaIds) AND tr.media_type = :mediaType
        ORDER BY tr.weight DESC
    """)
    suspend fun getRelationsForMediaBatch(mediaIds: List<String>, mediaType: MediaType): List<MediaTagRelation>
    
    // Filtered Queries
    @Query("""
        SELECT tr.* FROM media_tag_relations tr
        WHERE tr.media_id = :mediaId AND tr.media_type = :mediaType AND tr.source = :source
        ORDER BY tr.confidence DESC
    """)
    suspend fun getTagsForMediaBySource(mediaId: String, mediaType: MediaType, source: TagSource): List<MediaTagRelation>
    
    @Query("""
        SELECT tr.* FROM media_tag_relations tr
        WHERE tr.media_id = :mediaId AND tr.media_type = :mediaType AND tr.is_verified = 1
        ORDER BY tr.weight DESC
    """)
    suspend fun getVerifiedTagsForMedia(mediaId: String, mediaType: MediaType): List<MediaTagRelation>
    
    @Query("""
        SELECT tr.* FROM media_tag_relations tr
        WHERE tr.confidence >= :minConfidence AND tr.weight >= :minWeight
        ORDER BY tr.confidence DESC, tr.weight DESC
    """)
    suspend fun getHighQualityRelations(minConfidence: Float = 0.7f, minWeight: Float = 0.5f): List<MediaTagRelation>
    
    // Analytics and Statistics
    @Query("SELECT COUNT(*) FROM media_tag_relations WHERE media_id = :mediaId AND media_type = :mediaType")
    suspend fun getTagCountForMedia(mediaId: String, mediaType: MediaType): Int
    
    @Query("SELECT COUNT(*) FROM media_tag_relations WHERE tag_id = :tagId")
    suspend fun getMediaCountForTag(tagId: Long): Int
    
    @Query("""
        SELECT media_type, COUNT(*) as count
        FROM media_tag_relations
        WHERE tag_id = :tagId
        GROUP BY media_type
        ORDER BY count DESC
    """)
    suspend fun getMediaTypeDistributionForTag(tagId: Long): List<MediaTypeCount>
    
    @Query("""
        SELECT source, COUNT(*) as count, AVG(confidence) as avg_confidence
        FROM media_tag_relations
        WHERE created_at >= :since
        GROUP BY source
        ORDER BY count DESC
    """)
    suspend fun getTagSourceStats(since: Long): List<TagSourceStats>
    
    // Bulk Operations
    @Query("DELETE FROM media_tag_relations WHERE media_id = :mediaId AND media_type = :mediaType")
    suspend fun removeAllTagsFromMedia(mediaId: String, mediaType: MediaType)
    
    @Query("DELETE FROM media_tag_relations WHERE tag_id = :tagId")
    suspend fun removeTagFromAllMedia(tagId: Long)
    
    @Query("DELETE FROM media_tag_relations WHERE media_id IN (:mediaIds) AND media_type = :mediaType")
    suspend fun removeAllTagsFromMediaBatch(mediaIds: List<String>, mediaType: MediaType)
    
    @Query("DELETE FROM media_tag_relations WHERE media_id = :mediaId AND media_type = :mediaType AND tag_id IN (:tagIds)")
    suspend fun removeSpecificTagsFromMedia(mediaId: String, mediaType: MediaType, tagIds: List<Long>)
    
    // Verification and Quality Management
    @Query("UPDATE media_tag_relations SET is_verified = 1 WHERE id = :relationId")
    suspend fun verifyRelation(relationId: Long)
    
    @Query("UPDATE media_tag_relations SET confidence = :confidence WHERE id = :relationId")
    suspend fun updateRelationConfidence(relationId: Long, confidence: Float)
    
    @Query("UPDATE media_tag_relations SET weight = :weight WHERE id = :relationId")
    suspend fun updateRelationWeight(relationId: Long, weight: Float)
    
    @Query("""
        UPDATE media_tag_relations 
        SET last_applied = :timestamp 
        WHERE media_id = :mediaId AND media_type = :mediaType AND tag_id = :tagId
    """)
    suspend fun updateLastApplied(mediaId: String, mediaType: MediaType, tagId: Long, timestamp: Long = System.currentTimeMillis())
    
    // Maintenance and Cleanup
    @Query("DELETE FROM media_tag_relations WHERE confidence < :minConfidence AND created_at < :cutoffTime")
    suspend fun cleanupLowQualityRelations(minConfidence: Float = 0.3f, cutoffTime: Long)
    
    @Query("SELECT * FROM media_tag_relations WHERE created_at < :cutoffTime AND source = 'AUTO' AND is_verified = 0")
    suspend fun getOldUnverifiedAutoTags(cutoffTime: Long): List<MediaTagRelation>
    
    // Search and Discovery
    @Query("""
        SELECT DISTINCT tr.tag_id
        FROM media_tag_relations tr
        WHERE tr.media_id IN (
            SELECT media_id FROM media_tag_relations
            WHERE tag_id = :sourceTagId
        ) AND tr.tag_id != :sourceTagId
        ORDER BY COUNT(*) DESC, AVG(tr.weight) DESC
        LIMIT :limit
    """)
    suspend fun getRelatedTags(sourceTagId: Long, limit: Int = 20): List<Long>
    
    @Query("""
        SELECT tr.* FROM media_tag_relations tr
        INNER JOIN universal_tags t ON tr.tag_id = t.id
        WHERE t.name LIKE '%' || :tagName || '%' AND tr.confidence >= :minConfidence
        ORDER BY tr.weight DESC
        LIMIT :limit
    """)
    suspend fun findMediaByTagName(tagName: String, minConfidence: Float = 0.5f, limit: Int = 50): List<MediaTagRelation>
    
    // Transaction Operations
    @Transaction
    suspend fun replaceTagsForMedia(mediaId: String, mediaType: MediaType, relations: List<MediaTagRelation>) {
        removeAllTagsFromMedia(mediaId, mediaType)
        insertRelations(relations)
    }
    
    @Query("""
        SELECT tr.*, t.name as tag_name, t.color as tag_color, t.category as tag_category
        FROM media_tag_relations tr
        INNER JOIN universal_tags t ON tr.tag_id = t.id
        WHERE tr.media_id = :mediaId AND tr.media_type = :mediaType
        ORDER BY tr.weight DESC, t.name ASC
    """)
    suspend fun getTaggedMediaWithDetails(mediaId: String, mediaType: MediaType): List<TaggedMediaDetails>
}

// Data classes for complex queries
data class MediaTypeCount(
    val media_type: MediaType,
    val count: Int
)

data class TagSourceStats(
    val source: TagSource,
    val count: Int,
    val avg_confidence: Float
)

data class TaggedMediaDetails(
    val id: Long,
    val mediaId: String,
    val mediaType: MediaType,
    val tagId: Long,
    val confidence: Float,
    val source: TagSource,
    val createdAt: Long,
    val weight: Float,
    val isVerified: Boolean,
    val lastApplied: Long,
    val tagName: String,
    val tagColor: String?,
    val tagCategory: String
)