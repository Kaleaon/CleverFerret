package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents common metadata that can be applied to any [MediaItem], regardless of its type.
 *
 * This entity creates a one-to-one relationship with a [MediaItem] by using the same
 * primary key (`itemId`). It stores fundamental details like title, summary, and cover art.
 *
 * @property itemId The unique identifier for this metadata record, which is also the foreign key to the associated [MediaItem].
 * @property title The display title of the media item.
 * @property sortTitle The title used for sorting purposes (e.g., omitting leading articles).
 * @property year The year the media item was released.
 * @property releaseDate The specific release date of the media item, as a timestamp.
 * @property rating The user's or a public rating of the media item (e.g., out of 5 or 10).
 * @property summary A short description or synopsis of the media item.
 * @property coverImagePath The local file path to the item's cover art.
 */
@Entity(
    tableName = "metadata_common",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE,
        ),
    ],
)
data class MetadataCommon(
    @PrimaryKey
    val itemId: Long,
    val title: String,
    val sortTitle: String?,
    val year: Int?,
    val releaseDate: Long?,
    val rating: Float?,
    val summary: String?,
    val coverImagePath: String?,
)
