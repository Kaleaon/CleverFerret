package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index
import kotlinx.serialization.Serializable

/**
 * Central entity for all individual media files in the system
 *
 * This table stores the core file information and relationships
 * to libraries, with detailed metadata stored in separate tables.
 */
@Serializable
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
    indices = [
        Index(value = ["libraryId"]),
        Index(value = ["filePath"], unique = true),
        Index(value = ["fileHash"])
    ]
)
data class MediaItem(
    @PrimaryKey(autoGenerate = true)
    val itemId: Long = 0,

    val libraryId: Long,
    val filePath: String,
    val fileName: String,
    val fileExtension: String,
    val fileSize: Long,
    val fileHash: String? = null,

    val dateAdded: Long = System.currentTimeMillis(),
    val lastScanned: Long = System.currentTimeMillis(),
    val lastModified: Long = 0,

    val mediaType: String, // BOOK, MOVIE, TV_SHOW, MUSIC_TRACK, etc.
    val mimeType: String? = null,

    val isAvailable: Boolean = true,
    val hasMetadata: Boolean = false,
    val hasThumbnail: Boolean = false,
    val thumbnailPath: String? = null
) {
    // Computed properties for compatibility with UI - these need to be fetched from metadata tables
    val creator: String? get() = null // Should be fetched from MetadataCommon
    val rating: Float? get() = null // Should be fetched from MetadataCommon
    val lastViewed: Long? get() = null // Should be fetched from ReadingProgress or viewing history
    
    // Compatibility properties for legacy code
    val title: String get() = fileName.substringBeforeLast('.')
    val size: Long get() = fileSize
    val type: String get() = mediaType
}
