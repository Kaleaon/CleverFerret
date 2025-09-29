package com.universalmedialibrary.data

/**
 * Represents a tag that can be associated with a media item.
 *
 * @property id The unique identifier of the tag.
 * @property name The name of the tag.
 */
data class Tag(
    val id: Long,
    val name: String,
)
