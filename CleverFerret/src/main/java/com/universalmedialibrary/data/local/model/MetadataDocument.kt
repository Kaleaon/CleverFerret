package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents metadata specific to a generic document.
 *
 * @property itemId The ID of the media item this metadata belongs to.
 * @property documentType The type of the document (e.g., "PDF", "DOCX").
 * @property author The author of the document.
 * @property creationDate The creation date of the document.
 * @property modificationDate The last modification date of the document.
 * @property pageCount The number of pages in the document.
 * @property wordCount The number of words in the document.
 * @property language The language of the document.
 * @property format The file format of the document.
 * @property fileSize The size of the document file in bytes.
 */
@Entity(
    tableName = "metadata_document",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class MetadataDocument(
    @PrimaryKey
    val itemId: Long,
    val documentType: String? = null,
    val author: String? = null,
    val creationDate: String? = null,
    val modificationDate: String? = null,
    val pageCount: Int? = null,
    val wordCount: Int? = null,
    val language: String? = null,
    val format: String? = null,
    val fileSize: Long? = null
)