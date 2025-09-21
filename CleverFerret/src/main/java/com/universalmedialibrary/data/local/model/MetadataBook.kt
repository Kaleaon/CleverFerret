package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents metadata specific to a book.
 *
 * @property itemId The ID of the media item this metadata belongs to.
 * @property subtitle The subtitle of the book.
 * @property publisher The publisher of the book.
 * @property isbn The International Standard Book Number (ISBN) of the book.
 * @property pageCount The number of pages in the book.
 * @property seriesId The ID of the series this book belongs to, if any.
 */
@Entity(
    tableName = "metadata_book",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
        // We will add a foreign key to a 'Series' table later
    ]
)
data class MetadataBook(
    @PrimaryKey
    val itemId: Long,
    val subtitle: String?,
    val publisher: String?,
    val isbn: String?,
    val pageCount: Int?,
    val seriesId: Long?
)
