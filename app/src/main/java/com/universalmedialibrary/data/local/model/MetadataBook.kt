package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Represents book-specific metadata associated with a [MediaItem].
 *
 * This entity creates a one-to-one relationship with a [MediaItem] by using the same
 * primary key (`itemId`). It stores details that are unique to books.
 *
 * @property itemId The unique identifier for this metadata record, which is also the foreign key to the associated [MediaItem].
 * @property subtitle The subtitle of the book, if any.
 * @property publisher The publisher of the book.
 * @property isbn The International Standard Book Number of the book.
 * @property pageCount The number of pages in the book.
 * @property seriesId The foreign key referencing the [Series] this book belongs to, if any.
 */
@Entity(
    tableName = "metadata_book",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE,
        ),
        ForeignKey(
            entity = Series::class,
            parentColumns = ["seriesId"],
            childColumns = ["seriesId"],
            onDelete = ForeignKey.SET_NULL, // If a series is deleted, don't delete the book
        ),
    ],
    indices = [Index(value = ["seriesId"])],
)
data class MetadataBook(
    @PrimaryKey
    val itemId: Long,
    val subtitle: String?,
    val publisher: String?,
    val isbn: String?,
    val pageCount: Int?,
    val seriesId: Long?,
)
