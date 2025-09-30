package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Unified tag system that works across all media types
 * 
 * Unlike PlexTag which is Plex-specific, UnifiedTag provides a centralized
 * tagging system that supports user-defined tags, auto-generated tags,
 * and imported tags from various sources (Plex, Calibre, Jellyfin, etc.)
 * 
 * TODO: Integrate with existing Genre system - consider migrating Genre to UnifiedTag
 * TODO: Add tag hierarchy support (parent/child relationships)
 * TODO: Add tag synonyms for better search
 * TODO: Add tag usage statistics for recommendations
 */
@Entity(
    tableName = "unified_tags",
    indices = [
        Index(value = ["name"], unique = false),
        Index(value = ["type"]),
        Index(value = ["lastUsed"]) // For sorting by recent usage
    ]
)
data class UnifiedTag(
    @PrimaryKey(autoGenerate = true)
    val tagId: Long = 0,
    
    /**
     * Tag name (e.g., "Science Fiction", "Action", "Educational")
     * TODO: Add normalization for case-insensitive comparisons
     */
    val name: String,
    
    /**
     * Tag type - determines tag source and editability
     */
    val type: TagType,
    
    /**
     * Optional hex color for UI display (e.g., "#FF5722")
     * TODO: Add color picker in tag editor UI
     */
    val color: String? = null,
    
    /**
     * Optional description for the tag
     * TODO: Use for tooltips in UI
     */
    val description: String? = null,
    
    /**
     * Timestamp when tag was created
     */
    val createdAt: Long = System.currentTimeMillis(),
    
    /**
     * Timestamp when tag was last used (for sorting/suggestions)
     * TODO: Update this when tag is applied to an item
     */
    val lastUsed: Long = System.currentTimeMillis(),
    
    /**
     * Number of items with this tag
     * TODO: Update via trigger or background job
     */
    val usageCount: Int = 0,
    
    /**
     * External ID if imported from another system
     * Format: "plex:12345" or "calibre:science-fiction"
     * TODO: Use for bidirectional sync
     */
    val externalId: String? = null
)

/**
 * Tag type enumeration
 * 
 * TODO: Add SYSTEM type for built-in tags (e.g., "Favorite", "Downloaded")
 * TODO: Add SMART type for dynamic tags based on rules
 */
enum class TagType {
    /**
     * User-created tags
     * Fully editable and deletable by user
     */
    USER_DEFINED,
    
    /**
     * Tags generated from metadata extraction
     * (e.g., from EPUB keywords, MP3 genres)
     * TODO: Implement auto-generation in metadata extraction pipeline
     */
    AUTO_GENERATED,
    
    /**
     * Tags imported from Plex
     * TODO: Sync bidirectionally with Plex tags
     */
    IMPORTED_PLEX,
    
    /**
     * Tags imported from Calibre libraries
     * TODO: Import during Calibre library import
     */
    IMPORTED_CALIBRE,
    
    /**
     * Tags imported from Jellyfin
     * TODO: Implement when Jellyfin support is added
     */
    IMPORTED_JELLYFIN
}

/**
 * Junction entity linking media items to tags (many-to-many)
 * 
 * TODO: Add to AppDatabase entities list
 * TODO: Create corresponding DAO with batch operations
 * TODO: Add support for tag ordering per item
 */
@Entity(
    tableName = "item_tags",
    primaryKeys = ["itemId", "tagId"],
    foreignKeys = [
        androidx.room.ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = androidx.room.ForeignKey.CASCADE
        ),
        androidx.room.ForeignKey(
            entity = UnifiedTag::class,
            parentColumns = ["tagId"],
            childColumns = ["tagId"],
            onDelete = androidx.room.ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["tagId"]),
        Index(value = ["addedAt"]) // For chronological ordering
    ]
)
data class ItemTag(
    /**
     * Reference to MediaItem
     */
    val itemId: Long,
    
    /**
     * Reference to UnifiedTag
     */
    val tagId: Long,
    
    /**
     * When this tag was applied to the item
     * Useful for "recently tagged" queries
     */
    val addedAt: Long = System.currentTimeMillis(),
    
    /**
     * Who added this tag (null = system)
     * TODO: Add user ID support for multi-user scenarios
     */
    val addedBy: String? = null
)
