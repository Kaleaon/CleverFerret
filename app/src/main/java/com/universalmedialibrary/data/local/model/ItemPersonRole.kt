package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey

/**
 * Represents the many-to-many relationship between a [MediaItem] and a [People] entity,
 * including the role of the person in relation to the item.
 *
 * This entity serves as a join table that links a media item to a person and specifies
 * their contribution (e.g., 'AUTHOR', 'ACTOR', 'DIRECTOR'). The composite primary key
 * ensures that a person can be linked to the same media item multiple times, provided
 * they have a different role each time.
 *
 * Foreign keys with cascading deletes ensure that if a [MediaItem] or [People] record
 * is removed, these association records are also deleted.
 *
 * @property itemId The ID of the associated [MediaItem].
 * @property personId The ID of the associated [People].
 * @property role A string describing the person's role (e.g., 'AUTHOR', 'ACTOR', 'DIRECTOR').
 */
@Entity(
    tableName = "item_person_role",
    primaryKeys = ["itemId", "personId", "role"],
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE,
        ),
        ForeignKey(
            entity = People::class,
            parentColumns = ["personId"],
            childColumns = ["personId"],
            onDelete = ForeignKey.CASCADE,
        ),
    ],
    indices = [androidx.room.Index(value = ["personId"])],
)
data class ItemPersonRole(
    val itemId: Long,
    val personId: Long,
    val role: String, // e.g., 'AUTHOR', 'ACTOR', 'DIRECTOR'
)
