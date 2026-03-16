package com.universalmedialibrary.data

enum class MediaType {
    BOOK,
    EBOOK,  // Alias for BOOK (e-book format)
    AUDIOBOOK,
    MOVIE,
    TV_SHOW,
    DOCUMENTARY,  // Documentary films
    MUSIC,
    MUSIC_TRACK,  // Individual music track
    MUSIC_ALBUM,  // Music album
    PODCAST,
    PODCAST_EPISODE,  // Individual podcast episode
    PODCAST_SERIES,   // Podcast series
    RADIO,  // Radio stream
    MIDI,  // MIDI music file
    MUSIC_SCORE,  // Music notation/score file
    COMIC,
    MANGA,  // Japanese comics
    MAGAZINE,
    NEWSPAPER,  // Newspaper content
    JOURNAL,  // Academic journal
    NEWS_ARTICLE,  // News article
    DOCUMENT,
    REPORT,  // Business/academic report
    PRESENTATION,  // Presentation files
    ACADEMIC_PAPER,
    WEB_FICTION,
    STORY,  // Web fiction / fanfiction story
    IMAGE,  // Image file
    VIDEO,  // Generic video file
    AUDIO,  // Generic audio file
    UNKNOWN
}

// Extension functions for MediaType
fun MediaType.getDisplayName(): String {
    return when (this) {
        MediaType.BOOK -> "Book"
        MediaType.EBOOK -> "E-Book"
        MediaType.AUDIOBOOK -> "Audiobook"
        MediaType.MOVIE -> "Movie"
        MediaType.TV_SHOW -> "TV Show"
        MediaType.DOCUMENTARY -> "Documentary"
        MediaType.MUSIC -> "Music"
        MediaType.MUSIC_TRACK -> "Music Track"
        MediaType.MUSIC_ALBUM -> "Music Album"
        MediaType.PODCAST -> "Podcast"
        MediaType.PODCAST_EPISODE -> "Podcast Episode"
        MediaType.PODCAST_SERIES -> "Podcast Series"
        MediaType.RADIO -> "Radio"
        MediaType.MIDI -> "MIDI"
        MediaType.MUSIC_SCORE -> "Music Score"
        MediaType.COMIC -> "Comic"
        MediaType.MANGA -> "Manga"
        MediaType.MAGAZINE -> "Magazine"
        MediaType.NEWSPAPER -> "Newspaper"
        MediaType.JOURNAL -> "Journal"
        MediaType.NEWS_ARTICLE -> "News Article"
        MediaType.DOCUMENT -> "Document"
        MediaType.REPORT -> "Report"
        MediaType.PRESENTATION -> "Presentation"
        MediaType.ACADEMIC_PAPER -> "Academic Paper"
        MediaType.WEB_FICTION -> "Web Fiction"
        MediaType.STORY -> "Story"
        MediaType.IMAGE -> "Image"
        MediaType.VIDEO -> "Video"
        MediaType.AUDIO -> "Audio"
        MediaType.UNKNOWN -> "Unknown"
    }
}

fun MediaType.getIcon(): String {
    return when (this) {
        MediaType.BOOK -> "📚"
        MediaType.EBOOK -> "📖"
        MediaType.AUDIOBOOK -> "🎧"
        MediaType.MOVIE -> "🎬"
        MediaType.TV_SHOW -> "📺"
        MediaType.DOCUMENTARY -> "🎥"
        MediaType.MUSIC -> "🎵"
        MediaType.MUSIC_TRACK -> "🎶"
        MediaType.MUSIC_ALBUM -> "💿"
        MediaType.PODCAST -> "🎙️"
        MediaType.PODCAST_EPISODE -> "🎧"
        MediaType.PODCAST_SERIES -> "📻"
        MediaType.RADIO -> "📻"
        MediaType.MIDI -> "🎹"
        MediaType.MUSIC_SCORE -> "🎼"
        MediaType.COMIC -> "💭"
        MediaType.MANGA -> "📔"
        MediaType.MAGAZINE -> "📰"
        MediaType.NEWSPAPER -> "📰"
        MediaType.JOURNAL -> "📓"
        MediaType.NEWS_ARTICLE -> "📄"
        MediaType.DOCUMENT -> "📄"
        MediaType.REPORT -> "📊"
        MediaType.PRESENTATION -> "📽️"
        MediaType.ACADEMIC_PAPER -> "📊"
        MediaType.WEB_FICTION -> "🌐"
        MediaType.STORY -> "📝"
        MediaType.IMAGE -> "🖼️"
        MediaType.VIDEO -> "🎞️"
        MediaType.AUDIO -> "🔊"
        MediaType.UNKNOWN -> "❓"
    }
}
