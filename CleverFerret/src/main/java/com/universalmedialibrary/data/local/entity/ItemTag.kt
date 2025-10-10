package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Junction table for many-to-many relationship between items and tags
 *
 * Allows any media item to have multiple tags, and tags can be applied to multiple items.
 */
@Entity(
    tableName = "item_tags",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = UnifiedTag::class,
            parentColumns = ["tagId"],
            childColumns = ["tagId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["tagId"]),
        Index(value = ["itemId", "tagId"], unique = true),
        Index(value = ["appliedAt"])
    ]
)
data class ItemTag(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    /**
     * ID of the media item
     */
    val itemId: Long,

    /**
     * ID of the tag
     */
    val tagId: Long,

    /**
     * When this tag was applied to the item
     */
    val appliedAt: Long = System.currentTimeMillis(),

    /**
     * Optional: User who applied the tag (for multi-user support)
     */
    val appliedBy: Long? = null
)
