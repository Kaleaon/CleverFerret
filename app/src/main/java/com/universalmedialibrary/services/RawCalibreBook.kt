package com.universalmedialibrary.services

/**
 * Represents a raw book record as read directly from a Calibre `metadata.db` file.
 *
 * This data class serves as a data transfer object (DTO) to hold the unprocessed
 * book information before it is transformed and inserted into the application's own database structure.
 *
 * @property id The unique identifier of the book in the Calibre database.
 * @property title The title of the book.
 * @property path The relative path to the book's file within the Calibre library directory.
 * @property authorNames A list of author names associated with the book.
 * @property seriesName The name of the series the book belongs to, if any.
 * @property seriesIndex The index of the book within the series (e.g., 1.0 for the first book).
 * @property publisher The publisher of the book.
 * @property isbn The International Standard Book Number of the book.
 * @property tags A list of tags associated with the book.
 * @property comments The description or comments about the book from Calibre.
 */
data class RawCalibreBook(
    val id: Long,
    val title: String,
    val path: String,
    val authorNames: List<String>,
    val seriesName: String?,
    val seriesIndex: Double?,
    val publisher: String?,
    val isbn: String?,
    val tags: List<String>,
    val comments: String?,
)
