package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity for storing media collections - curated groups of media items
 * 
 * Collections allow users to create organized groups of media items
 * like "Summer Reading List", "Oscar Winners", "Workout Music", etc.
 * They differ from tags in being more structured and having metadata.
 */
@Entity(
    tableName = "media_collection",
    indices = [
        Index(value = ["name"]),
        Index(value = ["type"]),
        Index(value = ["isPublic"]),
        Index(value = ["createdDate"])
    ]
)
data class MediaCollection(
    @PrimaryKey(autoGenerate = true)
    val collectionId: Long = 0,
    
    val name: String,
    val description: String? = null,
    val type: String, // CUSTOM, SMART, SYSTEM (like "Recently Added", "Favorites")
    
    val coverImagePath: String? = null,
    val color: String? = null, // Theme color for the collection
    val icon: String? = null,
    
    val isPublic: Boolean = false, // For future sharing features
    val isActive: Boolean = true,
    val isPinned: Boolean = false, // Pin to top of collections list
    
    val sortOrder: String = "MANUAL", // MANUAL, DATE_ADDED, TITLE, RATING, etc.
    val sortDirection: String = "ASC", // ASC, DESC
    
    val smartFilters: String? = null, // JSON string for smart collection rules
    val itemCount: Int = 0, // Cached count for performance
    
    val createdDate: Long = System.currentTimeMillis(),
    val lastModified: Long = System.currentTimeMillis(),
    val lastAccessed: Long? = null
)

/**
 * Junction entity linking media collections to media items (many-to-many relationship)
 */
@Entity(
    tableName = "media_collection_item",
    primaryKeys = ["collectionId", "itemId"],
    foreignKeys = [
        ForeignKey(
            entity = MediaCollection::class,
            parentColumns = ["collectionId"],
            childColumns = ["collectionId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["collectionId"]),
        Index(value = ["itemId"]),
        Index(value = ["addedDate"]),
        Index(value = ["position"])
    ]
)
data class MediaCollectionItem(
    val collectionId: Long,
    val itemId: Long,
    val position: Int = 0, // For manual ordering within collection
    val addedDate: Long = System.currentTimeMillis(),
    val addedBy: String? = null,
    val notes: String? = null // User notes about why item is in collection
)