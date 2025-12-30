package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Index
import androidx.room.ColumnInfo

/**
 * Content relationship entity for mapping relationships between different media items.
 * Supports cross-media recommendations and content discovery.
 */
@Entity(
    tableName = "content_relationships",
    indices = [
        Index(value = ["source_media_id", "source_media_type"]),
        Index(value = ["target_media_id", "target_media_type"]),
        Index(value = ["relationship_type"]),
        Index(value = ["strength"]),
        Index(value = ["created_at"]),
        Index(value = ["created_by"])
    ]
)
data class ContentRelationship(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    @ColumnInfo(name = "source_media_id")
    val sourceMediaId: String,
    
    @ColumnInfo(name = "source_media_type")
    val sourceMediaType: MediaType,
    
    @ColumnInfo(name = "target_media_id")
    val targetMediaId: String,
    
    @ColumnInfo(name = "target_media_type")
    val targetMediaType: MediaType,
    
    @ColumnInfo(name = "relationship_type")
    val relationshipType: RelationshipType,
    
    @ColumnInfo(name = "strength")
    val strength: Float = 0.0f, // 0.0 to 1.0, higher = stronger relationship
    
    @ColumnInfo(name = "confidence")
    val confidence: Float = 0.0f, // Confidence in the relationship accuracy
    
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    
    @ColumnInfo(name = "updated_at")
    val updatedAt: Long = System.currentTimeMillis(),
    
    @ColumnInfo(name = "created_by")
    val createdBy: String = RelationshipSource.SYSTEM.name,
    
    @ColumnInfo(name = "metadata")
    val metadata: String? = null, // JSON string for additional data
    
    @ColumnInfo(name = "is_mutual")
    val isMutual: Boolean = false, // Whether relationship is bidirectional
    
    @ColumnInfo(name = "decay_factor")
    val decayFactor: Float = 1.0f, // For relationship strength over time
    
    @ColumnInfo(name = "user_affinity")
    val userAffinity: Float = 0.0f, // User's interaction with this relationship
)

/**
 * Types of relationships between content items.
 */
enum class RelationshipType(val displayName: String, val isBidirectional: Boolean = false) {
    // Direct content relationships
    SERIES("Series", true), // Books/episodes in same series
    SEQUEL("Sequel", false), // Content that follows another
    PREQUEL("Prequel", false), // Content that precedes another
    REMAKE("Remake", false), // Remake of original content
    ADAPTATION("Adaptation", false), // Book adapted to movie, etc.
    
    // Creator relationships
    SAME_AUTHOR("Same Author", true),
    SAME_ARTIST("Same Artist", true),
    SAME_DIRECTOR("Same Director", true),
    SAME_PRODUCER("Same Producer", true),
    SAME_PUBLISHER("Same Publisher", true),
    SAME_STUDIO("Same Studio", true),
    SAME_LABEL("Same Label", true),
    
    // Content similarity
    SIMILAR("Similar Content", true),
    THEMATICALLY_SIMILAR("Thematically Similar", true),
    GENRE_SIMILAR("Genre Similar", true),
    MOOD_SIMILAR("Mood Similar", true),
    
    // User behavior
    FREQUENTLY_VIEWED_TOGETHER("Frequently Viewed Together", true),
    USER_RECOMMENDED("User Recommended", true),
    PLAYLIST_CO_OCCURRENCE("Playlist Co-occurrence", true),
    
    // Metadata relationships
    SAME_LANGUAGE("Same Language", true),
    SAME_YEAR("Same Year", true),
    SAME_DECADE("Same Decade", true),
    SAME_COUNTRY("Same Country", true),
    
    // System relationships
    AUTO_GENERATED("Auto-generated", true),
    CURATED("Curated", true),
    TRENDING("Trending", true),
    FEATURED("Featured", false)
}

/**
 * Sources for relationship creation.
 */
enum class RelationshipSource {
    SYSTEM,
    AI,
    USER,
    ANALYTICS,
    CURATION,
    IMPORT,
    SYNC
}