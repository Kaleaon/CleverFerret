package com.universalmedialibrary.data

/**
 * Represents the book-specific details of a media item.
 *
 * @property mediaItemId The foreign key to the MediaItem this data belongs to.
 * @property subtitle The subtitle of the book.
 * @property isbn The ISBN of the book.
 * @property pageCount The number of pages in the book.
 * @property publisher The publisher of the book.
 */
data class Book(
    val mediaItemId: Long,
    val subtitle: String?,
    val isbn: String?,
    val pageCount: Int?,
    val publisher: String?
)
