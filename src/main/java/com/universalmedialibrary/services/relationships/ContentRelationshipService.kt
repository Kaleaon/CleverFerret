package com.universalmedialibrary.services.relationships

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.data.local.dao.ContentRelationshipDao
import com.universalmedialibrary.data.local.dao.UniversalTagDao
import com.universalmedialibrary.data.local.dao.MediaTagRelationDao
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.services.ai.AIContentAnalysisService
import com.universalmedialibrary.services.search.engine.MediaSearchEngine

/**
 * Content Relationship Service - Manages relationships between different media items.
 * Provides recommendations, content discovery, and cross-media connections.
 */
@Singleton
class ContentRelationshipService @Inject constructor(
    private val relationshipDao: ContentRelationshipDao,
    private val tagDao: UniversalTagDao,
    private val mediaTagRelationDao: MediaTagRelationDao,
    private val aiService: AIContentAnalysisService
) {
    
    // ========== Relationship Management ==========
    
    /**
     * Creates a relationship between two media items.
     */
    suspend fun createRelationship(
        sourceMediaId: String,
        sourceMediaType: MediaType,
        targetMediaId: String,
        targetMediaType: MediaType,
        relationshipType: RelationshipType,
        strength: Float = 0.5f,
        confidence: Float = 0.5f,
        metadata: Map<String, Any> = emptyMap(),
        createdBy: String = RelationshipSource.SYSTEM.name
    ): Boolean {
        return try {
            val relationship = ContentRelationship(
                sourceMediaId = sourceMediaId,
                sourceMediaType = sourceMediaType,
                targetMediaId = targetMediaId,
                targetMediaType = targetMediaType,
                relationshipType = relationshipType,
                strength = strength.coerceIn(0.0f, 1.0f),
                confidence = confidence.coerceIn(0.0f, 1.0f),
                metadata = metadata.toJson(),
                createdBy = createdBy,
                isMutual = relationshipType.isBidirectional
            )
            
            relationshipDao.insertRelationship(relationship)
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Creates mutual relationships (bidirectional).
     */
    suspend fun createMutualRelationship(
        mediaId1: String,
        mediaType1: MediaType,
        mediaId2: String,
        mediaType2: MediaType,
        relationshipType: RelationshipType,
        strength: Float = 0.5f
    ): Boolean {
        val success1 = createRelationship(
            mediaId1, mediaType1, mediaId2, mediaType2,
            relationshipType, strength, createdBy = RelationshipSource.SYSTEM.name
        )
        
        val success2 = createRelationship(
            mediaId2, mediaType2, mediaId1, mediaType1,
            relationshipType, strength, createdBy = RelationshipSource.SYSTEM.name
        )
        
        return success1 && success2
    }
    
    /**
     * Updates relationship strength and confidence.
     */
    suspend fun updateRelationshipMetrics(
        relationshipId: Long,
        strength: Float,
        confidence: Float
    ): Boolean {
        return try {
            relationshipDao.updateRelationshipStrength(relationshipId, strength)
            relationshipDao.updateRelationshipConfidence(relationshipId, confidence)
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Updates user affinity for a relationship.
     */
    suspend fun updateUserAffinity(relationshipId: Long, affinity: Float): Boolean {
        return try {
            relationshipDao.updateUserAffinity(relationshipId, affinity.coerceIn(0.0f, 1.0f))
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Deletes a relationship.
     */
    suspend fun deleteRelationship(relationshipId: Long): Boolean {
        return try {
            relationshipDao.deleteRelationshipById(relationshipId)
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Gets relationships from a media item.
     */
    suspend fun getRelationshipsFromMedia(
        mediaId: String,
        mediaType: MediaType
    ): List<ContentRelationship> {
        return relationshipDao.getRelationshipsFromMedia(mediaId, mediaType)
    }
    
    /**
     * Gets relationships to a media item.
     */
    suspend fun getRelationshipsToMedia(
        mediaId: String,
        mediaType: MediaType
    ): List<ContentRelationship> {
        return relationshipDao.getRelationshipsToMedia(mediaId, mediaType)
    }
    
    /**
     * Gets relationships by type.
     */
    suspend fun getRelationshipsByType(
        mediaId: String,
        mediaType: MediaType,
        relationshipType: RelationshipType
    ): List<ContentRelationship> {
        return relationshipDao.getRelationshipsByType(mediaId, mediaType, relationshipType)
    }
    
    // ========== Content Discovery ==========
    
    /**
     * Finds related content for a media item.
     */
    suspend fun findRelatedContent(
        mediaId: String,
        mediaType: MediaType,
        maxResults: Int = 20,
        minStrength: Float = 0.3f,
        relationshipTypes: List<RelationshipType>? = null
    ): List<RelatedContent> {
        val relationships = if (relationshipTypes != null) {
            relationshipTypes.flatMap { type ->
                relationshipDao.getRelationshipsByType(mediaId, mediaType, type)
            }
        } else {
            relationshipDao.getRelationshipsFromMedia(mediaId, mediaType)
        }
        
        return relationships
            .filter { it.strength >= minStrength }
            .sortedByDescending { it.strength * it.confidence }
            .take(maxResults)
            .map { relationship ->
                RelatedContent(
                    mediaId = relationship.targetMediaId,
                    mediaType = relationship.targetMediaType,
                    relationshipType = relationship.relationshipType,
                    strength = relationship.strength,
                    confidence = relationship.confidence,
                    metadata = relationship.metadata.fromJson()
                )
            }
    }
    
    /**
     * Gets cross-media recommendations.
     */
    suspend fun getCrossMediaRecommendations(
        mediaId: String,
        mediaType: MediaType,
        targetTypes: List<MediaType>,
        maxResults: Int = 10
    ): List<RelatedContent> {
        val relationships = relationshipDao.getRelationshipsByTargetTypes(
            mediaId, mediaType, targetTypes, maxResults
        )
        
        return relationships.map { relationship ->
            RelatedContent(
                mediaId = relationship.targetMediaId,
                mediaType = relationship.targetMediaType,
                relationshipType = relationship.relationshipType,
                strength = relationship.strength,
                confidence = relationship.confidence,
                metadata = relationship.metadata.fromJson()
            )
        }
    }
    
    /**
     * Gets second-degree recommendations (related to related content).
     */
    suspend fun getSecondDegreeRecommendations(
        mediaId: String,
        mediaType: MediaType,
        relationshipType: RelationshipType,
        maxResults: Int = 20
    ): List<RelatedContent> {
        val relationships = relationshipDao.getSecondDegreeRelationships(
            mediaId, mediaType, relationshipType, maxResults
        )
        
        return relationships.map { relationship ->
            RelatedContent(
                mediaId = relationship.targetMediaId,
                mediaType = relationship.targetMediaType,
                relationshipType = relationship.relationshipType,
                strength = relationship.strength,
                confidence = relationship.confidence,
                metadata = relationship.metadata.fromJson()
            )
        }
    }
    
    // ========== AI-Powered Relationship Creation ==========
    
    /**
     * Automatically creates relationships using AI analysis.
     */
    suspend fun autoGenerateRelationships(
        mediaId: String,
        mediaType: MediaType,
        content: String? = null,
        metadata: Map<String, Any> = emptyMap()
    ): RelationshipGenerationResult {
        return try {
            // Get AI analysis
            val analysis = aiService.analyzeContentRelationships(content, metadata, mediaType)
            
            var createdCount = 0
            val createdRelationships = mutableListOf<ContentRelationship>()
            
            // Create relationships based on AI suggestions
            analysis.suggestions.forEach { suggestion ->
                val success = createRelationship(
                    sourceMediaId = mediaId,
                    sourceMediaType = mediaType,
                    targetMediaId = suggestion.targetMediaId,
                    targetMediaType = suggestion.targetMediaType,
                    relationshipType = suggestion.relationshipType,
                    strength = suggestion.strength,
                    confidence = suggestion.confidence,
                    metadata = suggestion.metadata,
                    createdBy = RelationshipSource.AI.name
                )
                
                if (success) {
                    createdCount++
                    // In a real implementation, you'd retrieve the created relationship
                    // createdRelationships.add(createdRelationship)
                }
            }
            
            RelationshipGenerationResult(
                success = true,
                relationshipsCreated = createdCount,
                suggestions = analysis.suggestions,
                confidence = analysis.confidence
            )
        } catch (e: Exception) {
            RelationshipGenerationResult(
                success = false,
                relationshipsCreated = 0,
                error = e.message
            )
        }
    }
    
    /**
     * Creates relationships based on shared tags.
     */
    suspend fun createTagBasedRelationships(
        mediaId: String,
        mediaType: MediaType,
        minSharedTags: Int = 2,
        strengthMultiplier: Float = 0.1f
    ): Int {
        var createdCount = 0
        
        // Get tags for the source media
        val sourceTags = mediaTagRelationDao.getTagsForMedia(mediaId, mediaType)
        
        sourceTags.forEach { sourceRelation ->
            // Find other media with the same tag
            val relatedMedia = mediaTagRelationDao.getMediaForTag(sourceRelation.tagId)
            relatedMedia.collect { relations ->
                relations.filter { it.mediaId != mediaId }.forEach { targetRelation ->
                    // Check if they share enough tags
                    val sharedTags = getSharedTagCount(mediaId, mediaType, targetRelation.mediaId, targetRelation.mediaType)
                    
                    if (sharedTags >= minSharedTags) {
                        val strength = (sharedTags.toFloat() / sourceTags.size) * strengthMultiplier
                        val success = createRelationship(
                            mediaId, mediaType,
                            targetRelation.mediaId, targetRelation.mediaType,
                            RelationshipType.THEMATICALLY_SIMILAR,
                            strength = strength.coerceIn(0.0f, 1.0f),
                            confidence = 0.7f,
                            metadata = mapOf("shared_tags" to sharedTags),
                            createdBy = RelationshipSource.SYSTEM.name
                        )
                        
                        if (success) createdCount++
                    }
                }
            }
        }
        
        return createdCount
    }
    
    /**
     * Creates relationships based on user behavior patterns.
     */
    suspend fun createBehaviorBasedRelationships(
        mediaId: String,
        mediaType: MediaType,
        timeWindow: Long = 7 * 24 * 60 * 60 * 1000L // 7 days
    ): Int {
        // This would analyze user behavior like frequently viewed together,
        // playlist co-occurrence, etc.
        // Implementation would depend on your analytics system
        
        var createdCount = 0
        
        // Mock implementation
        // In a real app, you'd query user behavior analytics
        
        return createdCount
    }
    
    // ========== Analytics and Insights ==========
    
    /**
     * Gets relationship statistics.
     */
    suspend fun getRelationshipStats(days: Int = 30): RelationshipStats {
        val since = System.currentTimeMillis() - (days * 24 * 60 * 60 * 1000L)
        
        val typeStats = relationshipDao.getRelationshipTypeStats(since)
        val createdByStats = relationshipDao.getCreatedByStats(since)
        
        return RelationshipStats(
            totalRelationships = relationshipDao.getRelationshipCountFromMedia("", MediaType.BOOK), // This is a mock
            typeDistribution = typeStats,
            createdByDistribution = createdByStats,
            averageStrength = typeStats.map { it.avgStrength }.average().toFloat(),
            averageConfidence = typeStats.map { it.avgConfidence }.average().toFloat()
        )
    }
    
    /**
     * Gets media type relationship distribution.
     */
    suspend fun getMediaTypeDistribution(
        mediaId: String,
        mediaType: MediaType
    ): List<RelatedMediaTypeStats> {
        return relationshipDao.getRelatedMediaTypes(mediaId, mediaType)
    }
    
    /**
     * Gets high-quality relationships.
     */
    suspend fun getHighQualityRelationships(
        minStrength: Float = 0.7f,
        minConfidence: Float = 0.7f,
        limit: Int = 100
    ): List<ContentRelationship> {
        return relationshipDao.getHighQualityRelationships(minStrength, minConfidence, limit)
    }
    
    /**
     * Gets mutual relationships.
     */
    suspend fun getMutualRelationships(
        mediaId: String,
        mediaType: MediaType
    ): List<ContentRelationship> {
        return relationshipDao.getMutualRelationships(mediaId, mediaType)
    }
    
    // ========== Maintenance ==========
    
    /**
     * Cleans up weak relationships.
     */
    suspend fun cleanupWeakRelationships(
        minStrength: Float = 0.1f,
        minConfidence: Float = 0.1f,
        daysOld: Int = 30
    ): Int {
        val cutoffTime = System.currentTimeMillis() - (daysOld * 24 * 60 * 60 * 1000L)
        
        return try {
            relationshipDao.cleanupWeakRelationships(minStrength, minConfidence, cutoffTime)
            0 // Room doesn't return affected count for custom queries
        } catch (e: Exception) {
            0
        }
    }
    
    /**
     * Decays old relationships over time.
     */
    suspend fun decayOldRelationships(
        decayFactor: Float = 0.9f,
        daysOld: Int = 90
    ): Int {
        val cutoffTime = System.currentTimeMillis() - (daysOld * 24 * 60 * 60 * 1000L)
        
        return try {
            relationshipDao.decayOldRelationships(decayFactor, cutoffTime)
            0
        } catch (e: Exception) {
            0
        }
    }
    
    // ========== Private Helper Methods ==========
    
    private suspend fun getSharedTagCount(
        mediaId1: String,
        mediaType1: MediaType,
        mediaId2: String,
        mediaType2: MediaType
    ): Int {
        val tags1 = mediaTagRelationDao.getTagsForMedia(mediaId1, mediaType1)
        val tags2 = mediaTagRelationDao.getTagsForMedia(mediaId2, mediaType2)
        
        return tags1.intersectBy(tags2) { it.tagId }.size
    }
}

// Extension functions for JSON serialization
private fun Map<String, Any>.toJson(): String {
    // In a real implementation, use a proper JSON library like Gson or kotlinx.serialization
    return this.toString()
}

private fun String.fromJson(): Map<String, Any> {
    // In a real implementation, use a proper JSON library
    return emptyMap()
}

// Data classes for results
data class RelatedContent(
    val mediaId: String,
    val mediaType: MediaType,
    val relationshipType: RelationshipType,
    val strength: Float,
    val confidence: Float,
    val metadata: Map<String, Any> = emptyMap()
)

data class RelationshipGenerationResult(
    val success: Boolean,
    val relationshipsCreated: Int,
    val suggestions: List<RelationshipSuggestion> = emptyList(),
    val confidence: Float = 0.0f,
    val error: String? = null
)

data class RelationshipSuggestion(
    val targetMediaId: String,
    val targetMediaType: MediaType,
    val relationshipType: RelationshipType,
    val strength: Float,
    val confidence: Float,
    val metadata: Map<String, Any> = emptyMap()
)

data class RelationshipStats(
    val totalRelationships: Int,
    val typeDistribution: List<RelationshipTypeStats>,
    val createdByDistribution: List<CreatedByStats>,
    val averageStrength: Float,
    val averageConfidence: Float
)