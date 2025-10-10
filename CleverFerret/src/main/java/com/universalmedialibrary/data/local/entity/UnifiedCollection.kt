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
 * TODO: Implement smart collection query engine
 * TODO: Add collection templates (e.g., "Reading Challenge 2025")
 * TODO: Add collection sharing between users
 * TODO: Add collection sync with external services
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
     * TODO: Support markdown formatting
     */
    val description: String? = null,

    /**
     * Path to custom cover art
     * TODO: Auto-generate cover art mosaic from collection items
     */
    val coverArtPath: String? = null,

    /**
     * Default sort field for items in this collection
     * TODO: Allow per-user override of sort preferences
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
     * TODO: Define smart collection query DSL
     * TODO: Implement query evaluation engine
     */
    val smartQuery: String? = null,

    /**
     * Whether collection is visible in UI
     * TODO: Add permission system for shared collections
     */
    val isVisible: Boolean = true,

    /**
     * Whether collection is pinned to top of lists
     * TODO: Add pinning UI in collections screen
     */
    val isPinned: Boolean = false,

    /**
     * Creation timestamp
     */
    val createdAt: Long = System.currentTimeMillis(),

    /**
     * Last modification timestamp (items added/removed, name changed, etc.)
     * TODO: Track modification history for undo/redo
     */
    val lastModified: Long = System.currentTimeMillis(),

    /**
     * External ID if imported/synced from another system
     * Format: "plex:12345" or "calibre:series-asimov-foundation"
     * TODO: Use for bidirectional sync
     */
    val externalId: String? = null,

    /**
     * Number of items in this collection
     * TODO: Update via trigger or background job
     */
    val itemCount: Int = 0
)

/**
 * Collection type enumeration
 *
 * TODO: Add FOLDER type for hierarchical organization
 * TODO: Add QUEUE type for temporary playback queues
 */
enum class CollectionType {
    /**
     * Ordered playback list (music, audiobooks, podcasts)
     * TODO: Add shuffle and repeat modes
     */
    PLAYLIST,

    /**
     * Book series, TV show seasons
     * TODO: Add support for series metadata (reading order, release order)
     */
    SERIES,

    /**
     * Books/articles to read
     * TODO: Add progress tracking for reading lists
     */
    READING_LIST,

    /**
     * Movies/shows to watch
     * TODO: Add watchlist priority levels
     */
    WATCH_LIST,

    /**
     * Generic user-defined collection
     * TODO: Add collection templates
     */
    USER_DEFINED,

    /**
     * Dynamic collection based on query criteria
     * TODO: Add query builder UI
     */
    SMART
}

/**
 * Sort field options for collections
 *
 * TODO: Add DURATION for sorting by media length
 * TODO: Add FILE_SIZE for sorting by size
 * TODO: Add LAST_PLAYED for recently played items
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


