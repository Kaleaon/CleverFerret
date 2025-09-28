package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity for storing user-defined tags for flexible categorization
 * 
 * Tags provide a flexible way to categorize and organize media items
 * beyond traditional genres. Users can create custom tags like
 * "favorites", "to-read", "summer-reading", etc.
 */
@Entity(
    tableName = "tag",
    indices = [
        Index(value = ["name"], unique = true),
        Index(value = ["category"]),
        Index(value = ["color"])
    ]
)
data class Tag(
    @PrimaryKey(autoGenerate = true)
    val tagId: Long = 0,
    
    val name: String,
    val description: String? = null,
    val category: String? = null, // Optional grouping like "mood", "progress", "custom"
    val color: String? = null, // Hex color for UI display
    val icon: String? = null, // Icon name or emoji
    
    val isSystem: Boolean = false, // System tags vs user-created tags
    val isActive: Boolean = true,
    
    val createdDate: Long = System.currentTimeMillis(),
    val lastUsed: Long? = null,
    val usageCount: Int = 0
)

/**
 * Junction entity linking media items to tags (many-to-many relationship)
 */
@Entity(
    tableName = "item_tag",
    primaryKeys = ["itemId", "tagId"],
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = Tag::class,
            parentColumns = ["tagId"],
            childColumns = ["tagId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["tagId"]),
        Index(value = ["addedDate"])
    ]
)
data class ItemTag(
    val itemId: Long,
    val tagId: Long,
    val addedDate: Long = System.currentTimeMillis(),
    val addedBy: String? = null // User or system that added the tag
)