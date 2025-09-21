package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey
import java.util.Date

/**
 * Represents a single media item in the library, corresponding to a file on disk.
 * This is the central entity that other metadata tables link to.
 *
 * @property itemId The unique identifier for the media item.
 * @property libraryId The ID of the library this item belongs to.
 * @property fileName The name of the file.
 * @property filePath The absolute path to the media file on the device.
 * @property fileSize The size of the file in bytes.
 * @property mediaType The type of media.
 * @property dateAdded The timestamp when the item was first added to the library.
 * @property lastModified The date the file was last modified.
 * @property lastAccessed The timestamp when the item was last opened or played.
 * @property playCount The number of times the item has been played.
 * @property isLocal Whether the file is available locally on the device.
 * @property fileHash A hash of the file content to detect changes.
 */
@Entity(
    tableName = "media_items",
    foreignKeys = [
        ForeignKey(
            entity = Library::class,
            parentColumns = ["libraryId"],
            childColumns = ["libraryId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [androidx.room.Index(value = ["libraryId"])]
)
data class MediaItem(
    @PrimaryKey(autoGenerate = true)
    val itemId: Long = 0,
    val libraryId: Long,
    val fileName: String,
    val filePath: String,
    val fileSize: Long,
    val mediaType: MediaType,
    val dateAdded: Date,
    val lastModified: Date,
    val lastAccessed: Date?,
    val playCount: Int = 0,
    val isLocal: Boolean = true,
    val fileHash: String? = null
)
