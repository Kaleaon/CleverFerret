package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Junction table for many-to-many relationship between items and collections
 *
 * Allows any media item to belong to multiple collections, and collections
 * can contain multiple items with custom ordering.
 */
@Entity(
    tableName = "item_collections",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = UnifiedCollection::class,
            parentColumns = ["collectionId"],
            childColumns = ["collectionId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["collectionId"]),
        Index(value = ["collectionId", "itemId"], unique = true),
        Index(value = ["collectionId", "sortOrder"]),
        Index(value = ["addedAt"])
    ]
)
data class ItemCollection(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    /**
     * ID of the media item
     */
    val itemId: Long,

    /**
     * ID of the collection
     */
    val collectionId: Long,

    /**
     * Sort order within the collection
     * Lower numbers appear first
     */
    val sortOrder: Int = 0,

    /**
     * When this item was added to the collection
     */
    val addedAt: Long = System.currentTimeMillis(),

    /**
     * Optional: User who added the item (for multi-user support)
     */
    val addedBy: Long? = null,

    /**
     * Optional: Custom note for this item in this collection
     */
    val note: String? = null
)
