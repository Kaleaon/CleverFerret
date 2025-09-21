package com.universalmedialibrary.data

/**
 * Represents a tag that can be applied to a media item.
 *
 * @property id The unique identifier for the tag.
 * @property name The name of the tag (e.g., "science-fiction", "favorite").
 */
data class Tag(
    val id: Long,
    val name: String
)
