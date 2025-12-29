package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * Tag hierarchy for organizing tags into parent-child relationships
 *
 * Enables features like:
 * - "Science Fiction" as child of "Fiction"
 * - "Hard Sci-Fi" as child of "Science Fiction"
 * - Searching parent tag includes all children
 */
@Serializable
@Entity(
    tableName = "tag_hierarchies",
    foreignKeys = [
        ForeignKey(
            entity = UnifiedTag::class,
            parentColumns = ["tagId"],
            childColumns = ["parentTagId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = UnifiedTag::class,
            parentColumns = ["tagId"],
            childColumns = ["childTagId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["parentTagId"]),
        Index(value = ["childTagId"]),
        Index(value = ["parentTagId", "childTagId"], unique = true)
    ]
)
data class TagHierarchy(
    @PrimaryKey(autoGenerate = true)
    val hierarchyId: Long = 0,

    /**
     * Parent tag ID
     */
    val parentTagId: Long,

    /**
     * Child tag ID
     */
    val childTagId: Long,

    /**
     * Depth level (1 = direct child, 2 = grandchild, etc.)
     * Used for optimizing ancestor/descendant queries
     */
    val depth: Int = 1
)

/**
 * Tag synonyms for alternative names and spellings
 *
 * Enables features like:
 * - "Sci-Fi" as synonym for "Science Fiction"
 * - "SciFi" as synonym for "Science Fiction"
 * - Searching any synonym matches the primary tag
 */
@Serializable
@Entity(
    tableName = "tag_synonyms",
    foreignKeys = [
        ForeignKey(
            entity = UnifiedTag::class,
            parentColumns = ["tagId"],
            childColumns = ["primaryTagId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["primaryTagId"]),
        Index(value = ["synonymName"]),
        Index(value = ["primaryTagId", "synonymName"], unique = true)
    ]
)
data class TagSynonym(
    @PrimaryKey(autoGenerate = true)
    val synonymId: Long = 0,

    /**
     * Primary tag that this is a synonym for
     */
    val primaryTagId: Long,

    /**
     * Alternative name/spelling for the tag
     */
    val synonymName: String,

    /**
     * Language code for the synonym (null = universal)
     * e.g., "en", "es", "fr", "jp"
     */
    val languageCode: String? = null,

    /**
     * Whether this is an official/standardized synonym
     */
    val isOfficial: Boolean = false
)

/**
 * Tag categories for grouping related tags
 *
 * Categories like:
 * - Genre (Fiction, Non-Fiction, Mystery, Romance)
 * - Mood (Dark, Uplifting, Suspenseful)
 * - Theme (Coming of Age, Revenge, Love)
 * - Content Warning (Violence, Language, Adult Content)
 */
@Serializable
@Entity(
    tableName = "tag_categories",
    indices = [
        Index(value = ["name"], unique = true),
        Index(value = ["displayOrder"])
    ]
)
data class TagCategory(
    @PrimaryKey(autoGenerate = true)
    val categoryId: Long = 0,

    /**
     * Category name (e.g., "Genre", "Mood", "Theme")
     */
    val name: String,

    /**
     * Display name for UI
     */
    val displayName: String,

    /**
     * Optional description
     */
    val description: String? = null,

    /**
     * Hex color for category UI display
     */
    val color: String? = null,

    /**
     * Icon name for category
     */
    val iconName: String? = null,

    /**
     * Display order in UI (lower = first)
     */
    val displayOrder: Int = 0,

    /**
     * Whether this category is system-defined vs user-created
     */
    val isSystemCategory: Boolean = false,

    /**
     * Whether tags in this category are mutually exclusive
     * e.g., content ratings (only one at a time)
     */
    val isMutuallyExclusive: Boolean = false
)

/**
 * Junction table linking tags to categories
 */
@Serializable
@Entity(
    tableName = "tag_category_assignments",
    foreignKeys = [
        ForeignKey(
            entity = UnifiedTag::class,
            parentColumns = ["tagId"],
            childColumns = ["tagId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = TagCategory::class,
            parentColumns = ["categoryId"],
            childColumns = ["categoryId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["tagId"]),
        Index(value = ["categoryId"]),
        Index(value = ["tagId", "categoryId"], unique = true)
    ]
)
data class TagCategoryAssignment(
    @PrimaryKey(autoGenerate = true)
    val assignmentId: Long = 0,

    val tagId: Long,
    val categoryId: Long
)

/**
 * Smart tag rules for auto-tagging content
 *
 * Enables automatic tag assignment based on:
 * - Metadata patterns (author, publisher, series)
 * - Content analysis (keywords, phrases)
 * - File properties (format, location)
 */
@Serializable
@Entity(
    tableName = "smart_tag_rules",
    foreignKeys = [
        ForeignKey(
            entity = UnifiedTag::class,
            parentColumns = ["tagId"],
            childColumns = ["tagId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["tagId"]),
        Index(value = ["isEnabled"]),
        Index(value = ["priority"])
    ]
)
data class SmartTagRule(
    @PrimaryKey(autoGenerate = true)
    val ruleId: Long = 0,

    /**
     * Tag to apply when rule matches
     */
    val tagId: Long,

    /**
     * Rule name for display
     */
    val name: String,

    /**
     * Description of what this rule does
     */
    val description: String? = null,

    /**
     * Rule type: PATTERN, METADATA, CONTENT, FILE_PROPERTY
     */
    val ruleType: SmartTagRuleType,

    /**
     * Field to match against: title, author, series, genre, description, etc.
     */
    val matchField: String,

    /**
     * Match pattern (regex or simple text)
     */
    val matchPattern: String,

    /**
     * Whether pattern is a regex
     */
    val isRegex: Boolean = false,

    /**
     * Case sensitive matching
     */
    val caseSensitive: Boolean = false,

    /**
     * Media types this rule applies to (null = all)
     * JSON array: ["BOOK", "AUDIOBOOK"]
     */
    val applicableMediaTypes: String? = null,

    /**
     * Whether rule is active
     */
    val isEnabled: Boolean = true,

    /**
     * Priority (higher = checked first)
     */
    val priority: Int = 0,

    /**
     * When rule was created
     */
    val createdAt: Long = System.currentTimeMillis(),

    /**
     * Number of times this rule has been applied
     */
    val applyCount: Int = 0
)

/**
 * Smart tag rule types
 */
enum class SmartTagRuleType {
    /**
     * Simple text pattern matching
     */
    PATTERN,

    /**
     * Match against specific metadata fields
     */
    METADATA,

    /**
     * Content/text analysis
     */
    CONTENT,

    /**
     * File property matching (extension, size, location)
     */
    FILE_PROPERTY,

    /**
     * Combined/complex rules with multiple conditions
     */
    COMPOUND
}

/**
 * Tag usage analytics for tracking how tags are used
 */
@Serializable
@Entity(
    tableName = "tag_analytics",
    foreignKeys = [
        ForeignKey(
            entity = UnifiedTag::class,
            parentColumns = ["tagId"],
            childColumns = ["tagId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["tagId"]),
        Index(value = ["period"]),
        Index(value = ["tagId", "period"], unique = true)
    ]
)
data class TagAnalytics(
    @PrimaryKey(autoGenerate = true)
    val analyticsId: Long = 0,

    val tagId: Long,

    /**
     * Period in YYYY-MM format
     */
    val period: String,

    /**
     * Number of new items tagged in this period
     */
    val newTaggings: Int = 0,

    /**
     * Number of search queries using this tag
     */
    val searchCount: Int = 0,

    /**
     * Number of filter usages
     */
    val filterCount: Int = 0,

    /**
     * Average time spent on items with this tag (in seconds)
     */
    val avgEngagementTime: Long = 0
)

/**
 * Related tags for tag suggestions
 *
 * Tags that are commonly used together or semantically related
 */
@Serializable
@Entity(
    tableName = "related_tags",
    foreignKeys = [
        ForeignKey(
            entity = UnifiedTag::class,
            parentColumns = ["tagId"],
            childColumns = ["tagId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = UnifiedTag::class,
            parentColumns = ["tagId"],
            childColumns = ["relatedTagId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["tagId"]),
        Index(value = ["relatedTagId"]),
        Index(value = ["tagId", "relatedTagId"], unique = true),
        Index(value = ["relationStrength"])
    ]
)
data class RelatedTag(
    @PrimaryKey(autoGenerate = true)
    val relationId: Long = 0,

    val tagId: Long,
    val relatedTagId: Long,

    /**
     * Type of relationship: SIMILAR, OPPOSITE, COMMONLY_USED_WITH, SUBCATEGORY
     */
    val relationType: TagRelationType,

    /**
     * Strength of relationship (0.0 to 1.0)
     * Higher = more related
     */
    val relationStrength: Float = 0.5f,

    /**
     * Whether relationship was discovered automatically vs manually set
     */
    val isAutoDiscovered: Boolean = true,

    /**
     * Number of times tags appear together
     */
    val coOccurrenceCount: Int = 0
)

/**
 * Types of tag relationships
 */
enum class TagRelationType {
    /**
     * Tags have similar meaning
     */
    SIMILAR,

    /**
     * Tags have opposite meaning
     */
    OPPOSITE,

    /**
     * Tags are frequently used together
     */
    COMMONLY_USED_WITH,

    /**
     * One tag is a more specific version of another
     */
    SUBCATEGORY,

    /**
     * Tags are often applied to similar content
     */
    CONTENT_RELATED
}
