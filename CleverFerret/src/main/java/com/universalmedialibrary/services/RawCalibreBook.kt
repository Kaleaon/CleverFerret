package com.universalmedialibrary.services

/**
 * Raw book data extracted from a Calibre database.
 * 
 * This data class represents a book entry as read directly from Calibre's metadata.db,
 * before being transformed into CleverFerret's internal MediaItem format.
 *
 * @property id Calibre's unique book ID
 * @property title Book title
 * @property path Relative path to the book directory within Calibre library
 * @property authorNames List of author names
 * @property seriesName Name of the series this book belongs to, if any
 * @property seriesIndex Position in the series (can be fractional, e.g., 1.5)
 * @property publisher Publisher name, if available
 * @property isbn ISBN identifier, if available
 * @property tags List of tags/categories from Calibre
 * @property comments Book description or notes from Calibre
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
    val comments: String?
)
