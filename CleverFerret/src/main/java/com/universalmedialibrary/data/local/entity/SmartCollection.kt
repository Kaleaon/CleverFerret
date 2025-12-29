package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * Smart collection rules for auto-generating collections
 *
 * Supports various collection types:
 * - Auto-playlists based on listening patterns
 * - Book series groupings
 * - Movie/TV collections
 * - Genre-based collections
 * - Recently added/played collections
 */
@Serializable
@Entity(
    tableName = "smart_collection_rules",
    indices = [
        Index(value = ["name"]),
        Index(value = ["collectionType"]),
        Index(value = ["isEnabled"]),
        Index(value = ["lastRefreshed"])
    ]
)
data class SmartCollectionRule(
    @PrimaryKey(autoGenerate = true)
    val ruleId: Long = 0,

    /**
     * Collection name for display
     */
    val name: String,

    /**
     * Type of smart collection
     */
    val collectionType: SmartCollectionType,

    /**
     * Description of the collection
     */
    val description: String? = null,

    /**
     * JSON-encoded query rules
     * Example: {"rules":[{"field":"genre","op":"contains","value":"Science Fiction"}]}
     */
    val queryRules: String,

    /**
     * Media types this collection targets
     * JSON array: ["BOOK", "AUDIOBOOK"]
     */
    val targetMediaTypes: String? = null,

    /**
     * Maximum number of items in collection (null = unlimited)
     */
    val maxItems: Int? = null,

    /**
     * Sort field for items
     */
    val sortBy: String = "dateAdded",

    /**
     * Sort order
     */
    val sortDescending: Boolean = true,

    /**
     * Whether collection is enabled and should be refreshed
     */
    val isEnabled: Boolean = true,

    /**
     * Refresh interval in milliseconds (0 = never auto-refresh)
     */
    val refreshInterval: Long = 0,

    /**
     * When collection was last refreshed
     */
    val lastRefreshed: Long = 0,

    /**
     * Number of current items in collection
     */
    val currentItemCount: Int = 0,

    /**
     * Cover image strategy: FIRST_ITEM, GRID, CUSTOM
     */
    val coverStrategy: CoverStrategy = CoverStrategy.FIRST_ITEM,

    /**
     * Custom cover image path (if coverStrategy = CUSTOM)
     */
    val customCoverPath: String? = null,

    /**
     * Whether this is a system-generated collection
     */
    val isSystemGenerated: Boolean = false,

    /**
     * Priority for display order (higher = first)
     */
    val displayPriority: Int = 0,

    /**
     * Creation timestamp
     */
    val createdAt: Long = System.currentTimeMillis()
)

/**
 * Types of smart collections
 */
enum class SmartCollectionType {
    /**
     * Music playlist based on listening patterns
     */
    AUTO_PLAYLIST,

    /**
     * Book series detection and grouping
     */
    BOOK_SERIES,

    /**
     * Author-based book collection
     */
    AUTHOR_COLLECTION,

    /**
     * Movie franchise/collection
     */
    MOVIE_COLLECTION,

    /**
     * TV show seasons grouping
     */
    TV_SERIES,

    /**
     * Genre-based collection
     */
    GENRE_COLLECTION,

    /**
     * Recently added items
     */
    RECENTLY_ADDED,

    /**
     * Recently played/read items
     */
    RECENTLY_ACCESSED,

    /**
     * Most played/read items
     */
    MOST_PLAYED,

    /**
     * Favorites collection
     */
    FAVORITES,

    /**
     * Items matching specific tags
     */
    TAG_BASED,

    /**
     * Items from specific time period
     */
    TIME_BASED,

    /**
     * Mood-based playlist (happy, sad, energetic)
     */
    MOOD_PLAYLIST,

    /**
     * Continue reading/watching
     */
    IN_PROGRESS,

    /**
     * Unfinished/not started items
     */
    BACKLOG,

    /**
     * AI-recommended based on preferences
     */
    AI_RECOMMENDED,

    /**
     * Custom user-defined rules
     */
    CUSTOM
}

/**
 * Cover image generation strategy
 */
enum class CoverStrategy {
    /**
     * Use cover of first item
     */
    FIRST_ITEM,

    /**
     * Create grid of multiple covers
     */
    GRID,

    /**
     * Use custom uploaded image
     */
    CUSTOM,

    /**
     * Generate based on collection type
     */
    GENERATED
}

/**
 * Auto-suggested collection (computed, not stored)
 *
 * Used to present suggestions to users before they create collections
 */
data class SuggestedCollection(
    /**
     * Unique suggestion ID
     */
    val suggestionId: String,

    /**
     * Suggested name for the collection
     */
    val suggestedName: String,

    /**
     * Type of collection being suggested
     */
    val collectionType: SmartCollectionType,

    /**
     * Description of why this is suggested
     */
    val reason: String,

    /**
     * Confidence score (0.0 to 1.0)
     */
    val confidence: Float,

    /**
     * Preview of items that would be in this collection
     */
    val previewItemIds: List<Long>,

    /**
     * Total estimated item count
     */
    val estimatedItemCount: Int,

    /**
     * Query rules to create this collection
     */
    val queryRules: String,

    /**
     * Media types involved
     */
    val mediaTypes: List<String>,

    /**
     * Cover image URL for preview
     */
    val previewCoverUrl: String? = null
)

/**
 * Query rule for smart collections
 */
@Serializable
data class CollectionQueryRule(
    /**
     * Field to match: title, author, genre, tags, year, rating, etc.
     */
    val field: String,

    /**
     * Operator: equals, contains, startsWith, greaterThan, lessThan, in, between
     */
    val operator: QueryOperator,

    /**
     * Value to match against
     */
    val value: String,

    /**
     * Additional value for between operator
     */
    val value2: String? = null
)

/**
 * Query operators for collection rules
 */
enum class QueryOperator {
    EQUALS,
    NOT_EQUALS,
    CONTAINS,
    NOT_CONTAINS,
    STARTS_WITH,
    ENDS_WITH,
    GREATER_THAN,
    LESS_THAN,
    GREATER_OR_EQUAL,
    LESS_OR_EQUAL,
    BETWEEN,
    IN,
    NOT_IN,
    IS_NULL,
    IS_NOT_NULL
}

/**
 * Collection query combining multiple rules
 */
@Serializable
data class CollectionQuery(
    /**
     * List of rules to apply
     */
    val rules: List<CollectionQueryRule>,

    /**
     * Logical operator between rules: AND, OR
     */
    val combineWith: LogicalOperator = LogicalOperator.AND
)

/**
 * Logical operators for combining rules
 */
enum class LogicalOperator {
    AND,
    OR
}

/**
 * Cached result of smart collection evaluation
 */
@Serializable
@Entity(
    tableName = "smart_collection_cache",
    indices = [
        Index(value = ["ruleId"]),
        Index(value = ["itemId"]),
        Index(value = ["ruleId", "itemId"], unique = true),
        Index(value = ["sortOrder"])
    ]
)
data class SmartCollectionCache(
    @PrimaryKey(autoGenerate = true)
    val cacheId: Long = 0,

    /**
     * Smart collection rule ID
     */
    val ruleId: Long,

    /**
     * Media item ID that matches the rule
     */
    val itemId: Long,

    /**
     * Sort order within collection
     */
    val sortOrder: Int = 0,

    /**
     * Match score (for relevance sorting)
     */
    val matchScore: Float = 1.0f,

    /**
     * When this cache entry was created
     */
    val cachedAt: Long = System.currentTimeMillis()
)

/**
 * Collection suggestion dismissal tracking
 *
 * Tracks which suggestions users have dismissed to avoid showing again
 */
@Serializable
@Entity(
    tableName = "dismissed_suggestions",
    indices = [
        Index(value = ["suggestionKey"], unique = true),
        Index(value = ["dismissedAt"])
    ]
)
data class DismissedSuggestion(
    @PrimaryKey(autoGenerate = true)
    val dismissalId: Long = 0,

    /**
     * Unique key identifying the suggestion (e.g., "series:asimov-foundation")
     */
    val suggestionKey: String,

    /**
     * When the suggestion was dismissed
     */
    val dismissedAt: Long = System.currentTimeMillis(),

    /**
     * Optional reason for dismissal
     */
    val reason: String? = null
)
