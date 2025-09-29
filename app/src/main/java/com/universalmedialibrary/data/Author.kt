package com.universalmedialibrary.data

/**
 * Represents an author of a media item.
 *
 * @property id The unique identifier of the author.
 * @property name The full name of the author.
 * @property sortName The name used for sorting, typically in "Last, First" format.
 */
data class Author(
    val id: Long,
    val name: String,
    val sortName: String?,
)
