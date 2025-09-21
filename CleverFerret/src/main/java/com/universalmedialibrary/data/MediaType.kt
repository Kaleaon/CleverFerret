package com.universalmedialibrary.data

/**
 * Represents the type of a media item in the library.
 */
enum class MediaType {
    /** A standard book. */
    BOOK,
    /** An audiobook. */
    AUDIOBOOK,
    /** A movie. */
    MOVIE,
    /** A television show. */
    TV_SHOW,
    /** A music track or album. */
    MUSIC,
    /** A podcast episode. */
    PODCAST,
    /** A comic book or graphic novel. */
    COMIC,
    /** A magazine issue. */
    MAGAZINE,
    /** A generic document. */
    DOCUMENT,
    /** An academic paper or journal article. */
    ACADEMIC_PAPER,
    /** A piece of web fiction, like a web novel or fanfiction. */
    WEB_FICTION,
    /** An unknown or uncategorized media type. */
    UNKNOWN
}

/**
 * Returns a user-friendly display name for the media type.
 *
 * @return A string representing the display name.
 */
fun MediaType.getDisplayName(): String {
    return when (this) {
        MediaType.BOOK -> "Book"
        MediaType.AUDIOBOOK -> "Audiobook"
        MediaType.MOVIE -> "Movie"
        MediaType.TV_SHOW -> "TV Show"
        MediaType.MUSIC -> "Music"
        MediaType.PODCAST -> "Podcast"
        MediaType.COMIC -> "Comic"
        MediaType.MAGAZINE -> "Magazine"
        MediaType.DOCUMENT -> "Document"
        MediaType.ACADEMIC_PAPER -> "Academic Paper"
        MediaType.WEB_FICTION -> "Web Fiction"
        MediaType.UNKNOWN -> "Unknown"
    }
}

/**
 * Returns an emoji icon representing the media type.
 *
 * @return A string containing a single emoji character.
 */
fun MediaType.getIcon(): String {
    return when (this) {
        MediaType.BOOK -> "📚"
        MediaType.AUDIOBOOK -> "🎧"
        MediaType.MOVIE -> "🎬"
        MediaType.TV_SHOW -> "📺"
        MediaType.MUSIC -> "🎵"
        MediaType.PODCAST -> "🎙️"
        MediaType.COMIC -> "💭"
        MediaType.MAGAZINE -> "📰"
        MediaType.DOCUMENT -> "📄"
        MediaType.ACADEMIC_PAPER -> "📊"
        MediaType.WEB_FICTION -> "🌐"
        MediaType.UNKNOWN -> "❓"
    }
}