package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents common metadata that applies to all types of media items.
 *
 * @property itemId The ID of the media item this metadata belongs to.
 * @property title The primary title of the media item.
 * @property sortTitle A version of the title used for sorting (e.g., ignoring "The").
 * @property year The primary release year of the item.
 * @property releaseDate The specific release date of the item.
 * @property rating The user's or a service's rating for the item (e.g., out of 5 or 10).
 * @property summary A synopsis or description of the media item.
 * @property coverImagePath The file path to the cover art for this item.
 * @property isFavorite Whether the user has marked this item as a favorite.
 * @property isDownloaded Whether the file for this item is available locally.
 */
@Entity(
    tableName = "metadata_common",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
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
    val isFavorite: Boolean = false,
    val isDownloaded: Boolean = true // Tracks if the file is actually downloaded vs metadata-only
)
