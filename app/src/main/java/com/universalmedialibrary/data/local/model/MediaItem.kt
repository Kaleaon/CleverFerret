package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents a single media item within a [Library].
 *
 * This is the core entity that tracks a specific media file on the device. It is linked to a
 * parent library, and if the library is deleted, all its associated media items are also
 * removed from the database due to the cascading delete rule.
 *
 * @property itemId The unique identifier for the media item.
 * @property libraryId The foreign key referencing the parent [Library].
 * @property filePath The absolute file path to the media item on the device.
 * @property dateAdded The timestamp (in milliseconds since epoch) when the item was first added.
 * @property lastScanned The timestamp (in milliseconds since epoch) when the item was last scanned for metadata.
 * @property fileHash A hash of the file content, used to detect changes or duplicates.
 */
@Entity(
    tableName = "media_items",
    foreignKeys = [
        ForeignKey(
            entity = Library::class,
            parentColumns = ["libraryId"],
            childColumns = ["libraryId"],
            onDelete = ForeignKey.CASCADE,
        ),
    ],
    indices = [androidx.room.Index(value = ["libraryId"])],
)
data class MediaItem(
    @PrimaryKey(autoGenerate = true)
    val itemId: Long = 0,
    val libraryId: Long,
    val filePath: String,
    val dateAdded: Long,
    val lastScanned: Long,
    val fileHash: String,
)
