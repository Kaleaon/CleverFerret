package com.universalmedialibrary.data

enum class MediaType {
    BOOK,
    AUDIOBOOK,
    MOVIE,
    TV_SHOW,
    MUSIC,
    PODCAST,
    COMIC,
    MAGAZINE,
    DOCUMENT,
    ACADEMIC_PAPER,
    WEB_FICTION,
    UNKNOWN
}

// Extension functions for MediaType
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
