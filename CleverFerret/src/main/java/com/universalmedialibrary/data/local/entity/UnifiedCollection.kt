package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * Unified collection system for cross-media organization
 *
 * Unlike PlexCollection which is Plex-specific, UnifiedCollection provides
 * a flexible collection system that works across all media types, supporting:
 * - Playlists (music, audiobooks, podcasts)
 * - Series/Seasons (books, TV shows)
 * - Reading/Watch lists
 * - User-defined collections
 * - Smart collections (dynamic queries)
 *
 * Future enhancements: Query engine, templates, sharing, external sync
 */
@Serializable
@Entity(
    tableName = "unified_collections",
    indices = [
        Index(value = ["name"]),
        Index(value = ["type"]),
        Index(value = ["createdAt"]),
        Index(value = ["lastModified"]),
        Index(value = ["isSmartCollection"])
    ]
)
data class UnifiedCollection(
    @PrimaryKey(autoGenerate = true)
    val collectionId: Long = 0,

    /**
     * Collection name (e.g., "Summer Reading List", "80s Classics")
     */
    val name: String,

    /**
     * Collection type determines behavior and UI presentation
     */
    val type: CollectionType,

    /**
     * Optional description
     */
    val description: String? = null,

    /**
     * Path to custom cover art
     */
    val coverArtPath: String? = null,

    /**
     * Default sort field for items in this collection
     */
    val sortBy: SortField = SortField.CUSTOM,

    /**
     * Default sort order
     */
    val sortOrder: SortOrder = SortOrder.ASCENDING,

    /**
     * Whether this is a smart collection (dynamic based on rules)
     * Smart collections auto-update based on smartQuery
     */
    val isSmartCollection: Boolean = false,

    /**
     * Query for smart collections (JSON format)
     * Example: {"rules": [{"field": "genre", "op": "equals", "value": "Sci-Fi"}]}
     */
    val smartQuery: String? = null,

    /**
     * Whether collection is visible in UI
     */
    val isVisible: Boolean = true,

    /**
     * Whether collection is pinned to top of lists
     */
    val isPinned: Boolean = false,

    /**
     * Creation timestamp
     */
    val createdAt: Long = System.currentTimeMillis(),

    /**
     * Last modification timestamp (items added/removed, name changed, etc.)
     */
    val lastModified: Long = System.currentTimeMillis(),

    /**
     * External ID if imported/synced from another system
     * Format: "plex:12345" or "calibre:series-asimov-foundation"
     */
    val externalId: String? = null,

    /**
     * Number of items in this collection
     */
    val itemCount: Int = 0
)

/**
 * Collection type enumeration
 */
enum class CollectionType {
    /**
     * Ordered playback list (music, audiobooks, podcasts)
     */
    PLAYLIST,

    /**
     * Book series, TV show seasons
     */
    SERIES,

    /**
     * Books/articles to read
     */
    READING_LIST,

    /**
     * Movies/shows to watch
     */
    WATCH_LIST,

    /**
     * Generic user-defined collection
     */
    USER_DEFINED,

    /**
     * Dynamic collection based on query criteria
     */
    SMART
}

/**
 * Sort field options for collections
 */
enum class SortField {
    /**
     * Manual ordering (uses sortOrder in ItemCollection junction)
     */
    CUSTOM,

    /**
     * Sort by title (alphabetical)
     */
    TITLE,

    /**
     * Sort by date added to collection
     */
    DATE_ADDED,

    /**
     * Sort by original release date
     */
    RELEASE_DATE,

    /**
     * Sort by user rating
     */
    RATING,

    /**
     * Sort by play/read count
     */
    PLAY_COUNT,

    /**
     * Sort by author/artist name
     */
    CREATOR
}

/**
 * Sort order enumeration
 */
enum class SortOrder {
    ASCENDING,
    DESCENDING
}


