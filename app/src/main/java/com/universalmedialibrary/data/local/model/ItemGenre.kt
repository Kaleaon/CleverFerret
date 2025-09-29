package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey

/**
 * Represents the many-to-many relationship between a [MediaItem] and a [Genre].
 *
 * This entity serves as a join table in the database. Each instance of this class
 * links one media item to one genre. The foreign keys are set up with cascading deletes,
 * so if a [MediaItem] or [Genre] is deleted, the corresponding [ItemGenre] records
 * are also automatically removed.
 *
 * @property itemId The ID of the associated [MediaItem].
 * @property genreId The ID of the associated [Genre].
 */
@Entity(
    tableName = "item_genre",
    primaryKeys = ["itemId", "genreId"],
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE,
        ),
        ForeignKey(
            entity = Genre::class,
            parentColumns = ["genreId"],
            childColumns = ["genreId"],
            onDelete = ForeignKey.CASCADE,
        ),
    ],
    indices = [androidx.room.Index(value = ["genreId"])],
)
data class ItemGenre(
    val itemId: Long,
    val genreId: Long,
)
