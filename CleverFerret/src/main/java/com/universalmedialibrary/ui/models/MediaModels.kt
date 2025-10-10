package com.universalmedialibrary.ui.models

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.ui.graphics.vector.ImageVector

/**
 * Media Category Models for CleverFerret
 * 
 * Defines all supported media types with their UI representation
 */

/**
 * Media Category enum with complete information
 */
enum class MediaCategory(
    val label: String,
    val icon: ImageVector,
    val description: String
) {
    MUSIC(
        label = "Music",
        icon = Icons.Default.MusicNote,
        description = "Audio tracks and albums"
    ),
    MOVIES(
        label = "Movies",
        icon = Icons.Default.Movie,
        description = "Feature films and videos"
    ),
    TV_SHOWS(
        label = "TV Shows",
        icon = Icons.Default.Tv,
        description = "Television series and episodes"
    ),
    RADIO(
        label = "Radio",
        icon = Icons.Default.Radio,
        description = "Live radio streams"
    ),
    EBOOKS(
        label = "eBooks",
        icon = Icons.Default.MenuBook,
        description = "Digital books and novels"
    ),
    COMICS(
        label = "Comics",
        icon = Icons.Default.Book,
        description = "Comic books and graphic novels"
    ),
    AUDIOBOOKS(
        label = "Audiobooks",
        icon = Icons.Default.Headphones,
        description = "Narrated books"
    ),
    PODCASTS(
        label = "Podcasts",
        icon = Icons.Default.Podcasts,
        description = "Podcast episodes and series"
    ),
    MAGAZINES(
        label = "Magazines",
        icon = Icons.Default.LibraryBooks,
        description = "Digital magazines"
    ),
    NEWS(
        label = "News",
        icon = Icons.Default.Newspaper,
        description = "News articles and feeds"
    ),
    FANFICTION(
        label = "Fanfiction",
        icon = Icons.Default.AutoStories,
        description = "Fan-created stories"
    );

    companion object {
        /**
         * Get MediaCategory from label string
         */
        fun fromLabel(label: String): MediaCategory? {
            return values().firstOrNull { 
                it.label.equals(label, ignoreCase = true) 
            }
        }

        /**
         * Get MediaCategory from media type string (compatibility with database)
         */
        fun fromMediaType(type: String): MediaCategory? {
            return when (type.uppercase()) {
                "MUSIC", "MUSIC_TRACK", "ALBUM" -> MUSIC
                "MOVIE", "VIDEO" -> MOVIES
                "TV_SHOW", "TV", "SERIES", "EPISODE" -> TV_SHOWS
                "RADIO", "RADIO_STREAM" -> RADIO
                "BOOK", "EBOOK" -> EBOOKS
                "COMIC", "MANGA", "CBR", "CBZ" -> COMICS
                "AUDIOBOOK" -> AUDIOBOOKS
                "PODCAST", "PODCAST_EPISODE" -> PODCASTS
                "MAGAZINE" -> MAGAZINES
                "NEWS" -> NEWS
                "FANFICTION", "FAN_FICTION" -> FANFICTION
                else -> null
            }
        }
    }
}
