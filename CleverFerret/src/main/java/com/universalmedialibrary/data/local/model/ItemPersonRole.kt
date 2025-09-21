package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey

/**
 * Represents the many-to-many relationship between a media item and a person,
 * including the role that person played for the item.
 *
 * @property itemId The ID of the media item.
 * @property personId The ID of the person.
 * @property role The role of the person in relation to the item (e.g., 'AUTHOR', 'ACTOR', 'DIRECTOR').
 */
@Entity(
    tableName = "item_person_role",
    primaryKeys = ["itemId", "personId", "role"],
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = People::class,
            parentColumns = ["personId"],
            childColumns = ["personId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [androidx.room.Index(value = ["personId"])]
)
data class ItemPersonRole(
    val itemId: Long,
    val personId: Long,
    val role: String // e.g., 'AUTHOR', 'ACTOR', 'DIRECTOR'
)
