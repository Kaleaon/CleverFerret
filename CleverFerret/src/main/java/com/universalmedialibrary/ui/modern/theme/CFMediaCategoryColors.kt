package com.universalmedialibrary.ui.modern.theme

import androidx.compose.ui.graphics.Color
import com.universalmedialibrary.ui.folderimport.ScannedFileType

/**
 * Semantic media category palette definitions for light, dark, and high-contrast modes.
 * Provides foreground accents and secondary gradient colors for every media type.
 */
data class CFMediaCategoryColors(
    val book: Color,
    val bookSecondary: Color,
    val comic: Color,
    val comicSecondary: Color,
    val audiobook: Color,
    val audiobookSecondary: Color,
    val music: Color,
    val musicSecondary: Color,
    val podcast: Color,
    val podcastSecondary: Color,
    val video: Color,
    val videoSecondary: Color,
    val document: Color,
    val documentSecondary: Color,
    val fanfiction: Color,
    val fanfictionSecondary: Color,
    val other: Color,
    val otherSecondary: Color,
) {
    fun forScannedFileType(type: ScannedFileType): Color = when (type) {
        ScannedFileType.BOOK -> book
        ScannedFileType.COMIC -> comic
        ScannedFileType.AUDIOBOOK -> audiobook
        ScannedFileType.MUSIC -> music
        ScannedFileType.PODCAST -> podcast
        ScannedFileType.VIDEO -> video
        ScannedFileType.DOCUMENT -> document
        ScannedFileType.FANFICTION -> fanfiction
        ScannedFileType.OTHER -> other
    }

    fun forMediaType(type: String): Color = when (type.uppercase()) {
        "BOOK", "EBOOK" -> book
        "COMIC" -> comic
        "AUDIOBOOK" -> audiobook
        "MUSIC", "MUSIC_TRACK", "MUSIC_ALBUM" -> music
        "PODCAST", "PODCAST_EPISODE" -> podcast
        "VIDEO", "MOVIE", "TV_SHOW" -> video
        "DOCUMENT" -> document
        "FANFICTION" -> fanfiction
        else -> other
    }

    fun gradientFor(type: String): List<Color> = when (type.uppercase()) {
        "BOOK", "EBOOK" -> listOf(book, bookSecondary)
        "COMIC" -> listOf(comic, comicSecondary)
        "AUDIOBOOK" -> listOf(audiobook, audiobookSecondary)
        "MUSIC", "MUSIC_TRACK", "MUSIC_ALBUM" -> listOf(music, musicSecondary)
        "PODCAST", "PODCAST_EPISODE" -> listOf(podcast, podcastSecondary)
        "VIDEO", "MOVIE", "TV_SHOW" -> listOf(video, videoSecondary)
        "DOCUMENT" -> listOf(document, documentSecondary)
        "FANFICTION" -> listOf(fanfiction, fanfictionSecondary)
        else -> listOf(other, otherSecondary)
    }
}

@Suppress("MagicNumber")
object CFMediaCategoryDefaults {
    fun darkPalette(): CFMediaCategoryColors = CFMediaCategoryColors(
        book = Color(0xFF81C784),
        bookSecondary = Color(0xFF4CAF50),
        comic = Color(0xFFFFB74D),
        comicSecondary = Color(0xFFFF9800),
        audiobook = Color(0xFFCE93D8),
        audiobookSecondary = Color(0xFFAB47BC),
        music = Color(0xFF64B5F6),
        musicSecondary = Color(0xFF2196F3),
        podcast = Color(0xFFF48FB1),
        podcastSecondary = Color(0xFFEC407A),
        video = Color(0xFFE57373),
        videoSecondary = Color(0xFFEF5350),
        document = Color(0xFF90A4AE),
        documentSecondary = Color(0xFF78909C),
        fanfiction = Color(0xFF4DD0E1),
        fanfictionSecondary = Color(0xFF26C6DA),
        other = Color(0xFFCFD8DC),
        otherSecondary = Color(0xFF90A4AE),
    )

    fun lightPalette(): CFMediaCategoryColors = CFMediaCategoryColors(
        book = Color(0xFF1B5E20),
        bookSecondary = Color(0xFF388E3C),
        comic = Color(0xFFBF360C),
        comicSecondary = Color(0xFFF57C00),
        audiobook = Color(0xFF4A148C),
        audiobookSecondary = Color(0xFF7B1FA2),
        music = Color(0xFF0D47A1),
        musicSecondary = Color(0xFF1976D2),
        podcast = Color(0xFF880E4F),
        podcastSecondary = Color(0xFFC2185B),
        video = Color(0xFFB71C1C),
        videoSecondary = Color(0xFFD32F2F),
        document = Color(0xFF263238),
        documentSecondary = Color(0xFF455A64),
        fanfiction = Color(0xFF006064),
        fanfictionSecondary = Color(0xFF00838F),
        other = Color(0xFF424242),
        otherSecondary = Color(0xFF616161),
    )

    fun highContrastPalette(): CFMediaCategoryColors = CFMediaCategoryColors(
        book = Color(0xFF00FF66),
        bookSecondary = Color(0xFF00CC52),
        comic = Color(0xFFFFB300),
        comicSecondary = Color(0xFFFF8F00),
        audiobook = Color(0xFFE040FB),
        audiobookSecondary = Color(0xFFAA00FF),
        music = Color(0xFF40C4FF),
        musicSecondary = Color(0xFF00B0FF),
        podcast = Color(0xFFFF4081),
        podcastSecondary = Color(0xFFF50057),
        video = Color(0xFFFF5252),
        videoSecondary = Color(0xFFFF1744),
        document = Color(0xFFFFFFFF),
        documentSecondary = Color(0xFFE0E0E0),
        fanfiction = Color(0xFF18FFFF),
        fanfictionSecondary = Color(0xFF00E5FF),
        other = Color(0xFFE0E0E0),
        otherSecondary = Color(0xFFBDBDBD),
    )
}
