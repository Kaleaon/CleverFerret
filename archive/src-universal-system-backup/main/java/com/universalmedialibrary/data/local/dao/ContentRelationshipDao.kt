package com.universalmedialibrary.data.local.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import com.universalmedialibrary.data.local.entity.ContentRelationship
import com.universalmedialibrary.data.local.entity.MediaType
import com.universalmedialibrary.data.local.entity.RelationshipType

/**
 * Data Access Object for ContentRelationship operations.
 * Manages relationships between different media items for recommendations and discovery.
 */
@Dao
interface ContentRelationshipDao {
    
    // Basic CRUD Operations
    @Insert
    suspend fun insertRelationship(relationship: ContentRelationship): Long
    
    @Insert
    suspend fun insertRelationships(relationships: List<ContentRelationship>): List<Long>
    
    @Update
    suspend fun updateRelationship(relationship: ContentRelationship)
    
    @Delete
    suspend fun deleteRelationship(relationship: ContentRelationship)
    
    @Query("DELETE FROM content_relationships WHERE id = :relationshipId")
    suspend fun deleteRelationshipById(relationshipId: Long)
    
    @Query("SELECT * FROM content_relationships WHERE id = :relationshipId")
    suspend fun getRelationshipById(relationshipId: Long): ContentRelationship?
    
    // Query Operations
    @Query("""
        SELECT cr.* FROM content_relationships cr
        WHERE cr.source_media_id = :mediaId AND cr.source_media_type = :mediaType
        ORDER BY cr.strength DESC, cr.confidence DESC
    """)
    suspend fun getRelationshipsFromMedia(mediaId: String, mediaType: MediaType): List<ContentRelationship>
    
    @Query("""
        SELECT cr.* FROM content_relationships cr
        WHERE cr.source_media_id = :mediaId AND cr.source_media_type = :mediaType
        ORDER BY cr.strength DESC, cr.confidence DESC
    """)
    fun getRelationshipsFromMediaFlow(mediaId: String, mediaType: MediaType): Flow<List<ContentRelationship>>
    
    @Query("""
        SELECT cr.* FROM content_relationships cr
        WHERE cr.target_media_id = :mediaId AND cr.target_media_type = :mediaType
        ORDER BY cr.strength DESC, cr.confidence DESC
    """)
    suspend fun getRelationshipsToMedia(mediaId: String, mediaType: MediaType): List<ContentRelationship>
    
    @Query("""
        SELECT cr.* FROM content_relationships cr
        WHERE cr.source_media_id = :mediaId AND cr.source_media_type = :mediaType
          AND cr.relationship_type = :relationshipType
        ORDER BY cr.strength DESC
    """)
    suspend fun getRelationshipsByType(mediaId: String, mediaType: MediaType, relationshipType: RelationshipType): List<ContentRelationship>
    
    @Query("""
        SELECT cr.* FROM content_relationships cr
        WHERE cr.relationship_type = :relationshipType AND cr.strength >= :minStrength
        ORDER BY cr.strength DESC, cr.user_affinity DESC
        LIMIT :limit
    """)
    suspend fun getRelationshipsByTypeFiltered(relationshipType: RelationshipType, minStrength: Float = 0.5f, limit: Int = 50): List<ContentRelationship>
    
    // Cross-Media Discovery
    @Query("""
        SELECT cr.* FROM content_relationships cr
        WHERE cr.source_media_id = :mediaId AND cr.source_media_type = :sourceMediaType
          AND cr.target_media_type = :targetMediaType
        ORDER BY cr.strength DESC, cr.confidence DESC
        LIMIT :limit
    """)
    suspend fun getCrossMediaRelationships(mediaId: String, sourceMediaType: MediaType, targetMediaType: MediaType, limit: Int = 20): List<ContentRelationship>
    
    @Query("""
        SELECT DISTINCT cr.target_media_type, COUNT(*) as count, AVG(cr.strength) as avg_strength
        FROM content_relationships cr
        WHERE cr.source_media_id = :mediaId AND cr.source_media_type = :mediaType
        GROUP BY cr.target_media_type
        ORDER BY avg_strength DESC
    """)
    suspend fun getRelatedMediaTypes(mediaId: String, mediaType: MediaType): List<RelatedMediaTypeStats>
    
    // Strength and Quality Filtering
    @Query("""
        SELECT cr.* FROM content_relationships cr
        WHERE cr.strength >= :minStrength AND cr.confidence >= :minConfidence
        ORDER BY cr.strength DESC, cr.user_affinity DESC
        LIMIT :limit
    """)
    suspend fun getHighQualityRelationships(minStrength: Float = 0.7f, minConfidence: Float = 0.7f, limit: Int = 100): List<ContentRelationship>
    
    @Query("""
        SELECT cr.* FROM content_relationships cr
        WHERE cr.user_affinity > 0
        ORDER BY cr.user_affinity DESC, cr.strength DESC
        LIMIT :limit
    """)
    suspend fun getUserPreferredRelationships(limit: Int = 50): List<ContentRelationship>
    
    // Mutual Relationships
    @Query("""
        SELECT cr1.* FROM content_relationships cr1
        INNER JOIN content_relationships cr2 ON 
            cr1.source_media_id = cr2.target_media_id AND 
            cr1.source_media_type = cr2.target_media_type AND
            cr1.target_media_id = cr2.source_media_id AND 
            cr1.target_media_type = cr2.source_media_type
        WHERE cr1.source_media_id = :mediaId AND cr1.source_media_type = :mediaType
        ORDER BY (cr1.strength + cr2.strength) / 2 DESC
    """)
    suspend fun getMutualRelationships(mediaId: String, mediaType: MediaType): List<ContentRelationship>
    
    // Analytics and Statistics
    @Query("SELECT COUNT(*) FROM content_relationships WHERE source_media_id = :mediaId AND source_media_type = :mediaType")
    suspend fun getRelationshipCountFromMedia(mediaId: String, mediaType: MediaType): Int
    
    @Query("SELECT COUNT(*) FROM content_relationships WHERE target_media_id = :mediaId AND target_media_type = :mediaType")
    suspend fun getRelationshipCountToMedia(mediaId: String, mediaType: MediaType): Int
    
    @Query("""
        SELECT relationship_type, COUNT(*) as count, AVG(strength) as avg_strength, AVG(confidence) as avg_confidence
        FROM content_relationships
        WHERE created_at >= :since
        GROUP BY relationship_type
        ORDER BY count DESC
    """)
    suspend fun getRelationshipTypeStats(since: Long): List<RelationshipTypeStats>
    
    @Query("""
        SELECT created_by, COUNT(*) as count, AVG(strength) as avg_strength
        FROM content_relationships
        WHERE created_at >= :since
        GROUP BY created_by
        ORDER BY count DESC
    """)
    suspend fun getCreatedByStats(since: Long): List<CreatedByStats>
    
    // Strength and Confidence Management
    @Query("UPDATE content_relationships SET strength = :strength, updated_at = :timestamp WHERE id = :relationshipId")
    suspend fun updateRelationshipStrength(relationshipId: Long, strength: Float, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE content_relationships SET confidence = :confidence, updated_at = :timestamp WHERE id = :relationshipId")
    suspend fun updateRelationshipConfidence(relationshipId: Long, confidence: Float, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE content_relationships SET user_affinity = :affinity, updated_at = :timestamp WHERE id = :relationshipId")
    suspend fun updateUserAffinity(relationshipId: Long, affinity: Float, timestamp: Long = System.currentTimeMillis())
    
    @Query("""
        UPDATE content_relationships 
        SET strength = strength * :decayFactor, updated_at = :timestamp
        WHERE created_at < :cutoffTime
    """)
    suspend fun decayOldRelationships(decayFactor: Float, cutoffTime: Long, timestamp: Long = System.currentTimeMillis())
    
    // Bulk Operations
    @Query("DELETE FROM content_relationships WHERE source_media_id = :mediaId AND source_media_type = :mediaType")
    suspend fun removeAllRelationshipsFromMedia(mediaId: String, mediaType: MediaType)
    
    @Query("DELETE FROM content_relationships WHERE target_media_id = :mediaId AND target_media_type = :mediaType")
    suspend fun removeAllRelationshipsToMedia(mediaId: String, mediaType: MediaType)
    
    @Query("""
        DELETE FROM content_relationships 
        WHERE strength < :minStrength AND confidence < :minConfidence AND created_at < :cutoffTime
    """)
    suspend fun cleanupWeakRelationships(minStrength: Float = 0.1f, minConfidence: Float = 0.1f, cutoffTime: Long)
    
    // Advanced Queries for Recommendations
    @Query("""
        SELECT cr.* FROM content_relationships cr
        WHERE cr.source_media_id IN (
            SELECT target_media_id FROM content_relationships
            WHERE source_media_id = :mediaId AND source_media_type = :mediaType
              AND relationship_type = :relationshipType
        ) AND cr.target_media_id != :mediaId
        ORDER BY cr.strength DESC, cr.user_affinity DESC
        LIMIT :limit
    """)
    suspend fun getSecondDegreeRelationships(mediaId: String, mediaType: MediaType, relationshipType: RelationshipType, limit: Int = 20): List<ContentRelationship>
    
    @Query("""
        SELECT cr.* FROM content_relationships cr
        WHERE cr.source_media_id = :mediaId AND cr.source_media_type = :mediaType
          AND cr.target_media_type IN (:targetTypes)
        ORDER BY cr.strength DESC, cr.confidence DESC
        LIMIT :limit
    """)
    suspend fun getRelationshipsByTargetTypes(mediaId: String, mediaType: MediaType, targetTypes: List<MediaType>, limit: Int = 30): List<ContentRelationship>
    
    // Maintenance and Quality Control
    @Query("SELECT * FROM content_relationships WHERE strength > 1.0 OR confidence > 1.0")
    suspend fun getInvalidRelationships(): List<ContentRelationship>
    
    @Query("SELECT * FROM content_relationships WHERE strength < 0 OR confidence < 0")
    suspend fun getNegativeValueRelationships(): List<ContentRelationship>
    
    @Query("""
        SELECT * FROM content_relationships 
        WHERE created_at >= :since AND (strength = 0.0 OR confidence = 0.0)
    """)
    suspend fun getZeroValueRecentRelationships(since: Long): List<ContentRelationship>
    
    // Transaction Operations
    @Transaction
    suspend fun updateRelationshipMetrics(relationshipId: Long, strength: Float, confidence: Float, affinity: Float) {
        // This would be implemented with a single SQL statement in a real app
        updateRelationshipStrength(relationshipId, strength)
        updateRelationshipConfidence(relationshipId, confidence)
        updateUserAffinity(relationshipId, affinity)
    }
    
    @Transaction
    suspend fun replaceRelationshipsForMedia(mediaId: String, mediaType: MediaType, relationships: List<ContentRelationship>) {
        removeAllRelationshipsFromMedia(mediaId, mediaType)
        insertRelationships(relationships)
    }
}

// Data classes for complex queries
data class RelatedMediaTypeStats(
    val targetMediaTypes: MediaType,
    val count: Int,
    val avgStrength: Float
)

data class RelationshipTypeStats(
    val relationshipType: RelationshipType,
    val count: Int,
    val avgStrength: Float,
    val avgConfidence: Float
)

data class CreatedByStats(
    val createdBy: String,
    val count: Int,
    val avgStrength: Float
)