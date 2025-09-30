package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Central entity for all individual media files in the system
 *
 * This table stores the core file information and relationships
 * to libraries, with detailed metadata stored in separate tables.
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
)
