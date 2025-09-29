package com.universalmedialibrary.data

/**
 * Defines the type of a media item in the library.
 */
enum class MediaType {
    /** Represents a book. */
    BOOK,
    /** Represents a movie. */
    MOVIE,
    /** Represents a music track. */
    MUSIC_TRACK,
    /** Represents a podcast episode. */
    PODCAST_EPISODE,
    /** Represents a comic book or graphic novel. */
    COMIC,
}

/**
 * Represents a single item in the media library. This is the core entity for all media types.
 *
 * @property id The unique identifier for the media item.
 * @property title The title of the media item.
 * @property filePath The local file path to the media content.
 * @property mediaType The type of media, as defined by [MediaType].
 * @property dateAdded The timestamp (in milliseconds since epoch) when the item was added to the library.
 * @property dateModified The timestamp (in milliseconds since epoch) when the item was last modified.
 */
data class MediaItem(
    val id: Long,
    val title: String,
    val filePath: String,
    val mediaType: MediaType,
    val dateAdded: Long,
    val dateModified: Long,
)
