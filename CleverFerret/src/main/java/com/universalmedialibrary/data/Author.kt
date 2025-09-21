package com.universalmedialibrary.data

/**
 * Represents an author of a media item.
 *
 * @property id The unique identifier for the author.
 * @property name The full name of the author.
 * @property sortName The name used for sorting purposes, e.g., "Verne, Jules".
 */
data class Author(
    val id: Long,
    val name: String,
    val sortName: String?
)
