// Domain models for the modernized UI surface — kept identical across every
// screen so the design system stays consistent.
package com.universalmedialibrary.ui.modern.domain

import androidx.compose.ui.graphics.Color

enum class MediaKind { Book, Audiobook, Podcast, Comic, Movie, Tv, Music, Radio, WebFiction, Manga, Video, Fanfiction }

data class MediaItem(
    val id: String,
    val title: String,
    val author: String,
    val kind: MediaKind,
    val coverHue: Color,        // placeholder tint until art loads via Coil
    val coverUrl: String? = null,
    val progress: Float = 0f,   // 0..1
    val subtitle: String = "",  // "Ch. 7 · 4h 12m left"
)

data class Source(
    val id: String,
    val label: String,
    val description: String,
    val status: SourceStatus,
)
enum class SourceStatus { Online, Syncing, Offline }

data class SmartShelf(
    val id: String,
    val title: String,
    val count: Int,
    val kind: MediaKind,
    val accent: Color,
)

object SampleData {
    val continueReading = listOf(
        MediaItem("1", "The Three-Body Problem", "Liu Cixin",
            MediaKind.Book, Color(0xFF1B3A5C), progress = 0.42f, subtitle = "Ch. 7 · 4h 12m left"),
        MediaItem("2", "Project Hail Mary", "Andy Weir",
            MediaKind.Audiobook, Color(0xFF5C2E1B), progress = 0.71f, subtitle = "12h 04m · 1.2×"),
        MediaItem("3", "Hard Fork · Ep. 184", "NYT",
            MediaKind.Podcast, Color(0xFF2E1B5C), progress = 0.18f, subtitle = "23:14 / 1:18:02"),
        MediaItem("4", "Saga · Vol. 11", "Vaughan / Staples",
            MediaKind.Comic, Color(0xFF1B5C3E), progress = 0.55f, subtitle = "p. 87 / 156"),
    )
    val sources = listOf(
        Source("calibre", "Calibre Library", "OPDS · 412 books · synced 2m ago", SourceStatus.Online),
        Source("plex", "Plex · Living Room", "Beta · 84 movies · 12 series", SourceStatus.Online),
        Source("hfy", "r/HFY", "Reddit · 8 new chapters this week", SourceStatus.Syncing),
        Source("local", "Local · Internal", "2,841 files · 47.3 GB", SourceStatus.Online),
    )
    val formatCounts = mapOf(
        MediaKind.Book to 412, MediaKind.Audiobook to 47, MediaKind.Podcast to 18,
        MediaKind.Comic to 84, MediaKind.Movie to 132, MediaKind.Tv to 24,
        MediaKind.Music to 2841, MediaKind.Radio to 12, MediaKind.WebFiction to 8,
        MediaKind.Manga to 36, MediaKind.Video to 67, MediaKind.Fanfiction to 15,
    )
}
