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
 * Future enhancements: Genre integration, tag hierarchies, synonyms, usage statistics
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
     */
    val name: String,

    /**
     * Tag type - determines tag source and editability
     */
    val type: TagType,

    /**
     * Optional hex color for UI display (e.g., "#FF5722")
     */
    val color: String? = null,

    /**
     * Optional description for the tag
     */
    val description: String? = null,

    /**
     * Timestamp when tag was created
     */
    val createdAt: Long = System.currentTimeMillis(),

    /**
     * Timestamp when tag was last used (for sorting/suggestions)
     */
    val lastUsed: Long = System.currentTimeMillis(),

    /**
     * Number of items with this tag
     */
    val usageCount: Int = 0,

    /**
     * External ID if imported from another system
     * Format: "plex:12345" or "calibre:science-fiction"
     */
    val externalId: String? = null
)

/**
 * Tag type enumeration
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
     */
    AUTO_GENERATED,

    /**
     * Tags imported from Plex
     */
    IMPORTED_PLEX,

    /**
     * Tags imported from Calibre libraries
     */
    IMPORTED_CALIBRE,

    /**
     * Tags imported from Jellyfin
     */
    IMPORTED_JELLYFIN
}
