package com.universalmedialibrary.data

/**
 * Represents the book-specific metadata for a media item.
 *
 * @property mediaItemId The foreign key to the [MediaItem] this metadata belongs to.
 * @property subtitle The subtitle of the book, if any.
 * @property isbn The International Standard Book Number of the book.
 * @property pageCount The number of pages in the book.
 * @property publisher The publisher of the book.
 */
data class Book(
    val mediaItemId: Long,
    val subtitle: String?,
    val isbn: String?,
    val pageCount: Int?,
    val publisher: String?,
)
