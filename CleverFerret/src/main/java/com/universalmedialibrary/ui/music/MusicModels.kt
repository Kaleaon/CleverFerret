package com.universalmedialibrary.ui.music

import android.net.Uri
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.ui.graphics.vector.ImageVector

/**
 * Enhanced track data model with all MediaStore metadata
 */
data class Track(
    val id: Long,
    val title: String?,
    val artist: String?,
    val album: String?,
    val albumArtist: String?,
    val genre: String?,
    val year: Int?,
    val duration: Long,
    val trackNumber: Int?,
    val discNumber: Int?,
    val bitrate: Int?,
    val dateAdded: Long,
    val dateModified: Long,
    val uri: Uri,
    val path: String?,
    val mimeType: String?
) {
    val displayDuration: String get() {
        val seconds = duration / 1000
        val minutes = seconds / 60
        val secs = seconds % 60
        return if (minutes > 60) {
            val hours = minutes / 60
            val mins = minutes % 60
            "%d:%02d:%02d".format(hours, mins, secs)
        } else {
            "%d:%02d".format(minutes, secs)
        }
    }
    
    val displayArtist: String get() = artist ?: "Unknown Artist"
    val displayAlbum: String get() = album ?: "Unknown Album"
    val displayGenre: String get() = genre ?: "Unknown Genre"
    val displayYear: String get() = year?.toString() ?: "Unknown"
    val displayBitrate: String get() = if (bitrate != null && bitrate > 0) "${bitrate / 1000} kbps" else "Unknown"
}

/**
 * Album data aggregated from tracks
 */
data class Album(
    val name: String,
    val artist: String?,
    val year: Int?,
    val trackCount: Int,
    val tracks: List<Track>,
    val artworkUri: Uri?
) {
    val displayName: String get() = name.ifEmpty { "Unknown Album" }
    val displayArtist: String get() = artist ?: "Unknown Artist"
    val displayYear: String get() = year?.toString() ?: ""
}

/**
 * Artist data aggregated from tracks
 */
data class Artist(
    val name: String,
    val trackCount: Int,
    val albumCount: Int,
    val tracks: List<Track>
) {
    val displayName: String get() = name.ifEmpty { "Unknown Artist" }
}

/**
 * Genre data aggregated from tracks
 */
data class Genre(
    val name: String,
    val trackCount: Int,
    val tracks: List<Track>
) {
    val displayName: String get() = name.ifEmpty { "Unknown Genre" }
}

/**
 * Music library view modes
 */
enum class MusicViewMode(val displayName: String, val icon: ImageVector) {
    GRID("Grid", Icons.Default.GridView),
    LIST("List", Icons.Default.ViewList),
    COMPACT("Compact", Icons.Default.ViewAgenda)
}

/**
 * Music library sort options
 */
enum class MusicSortOption(val displayName: String, val icon: ImageVector) {
    TITLE_ASC("Title (A-Z)", Icons.Default.SortByAlpha),
    TITLE_DESC("Title (Z-A)", Icons.Default.SortByAlpha),
    ARTIST_ASC("Artist (A-Z)", Icons.Default.Person),
    ARTIST_DESC("Artist (Z-A)", Icons.Default.Person),
    ALBUM_ASC("Album (A-Z)", Icons.Default.Album),
    ALBUM_DESC("Album (Z-A)", Icons.Default.Album),
    DATE_ADDED_NEW("Recently Added", Icons.Default.Schedule),
    DATE_ADDED_OLD("Oldest First", Icons.Default.Schedule),
    DURATION_LONG("Longest First", Icons.Default.Timer),
    DURATION_SHORT("Shortest First", Icons.Default.Timer),
    YEAR_NEW("Newest Year", Icons.Default.CalendarToday),
    YEAR_OLD("Oldest Year", Icons.Default.CalendarToday),
    TRACK_NUMBER("Track Number", Icons.Default.Numbers);
    
    fun comparator(): Comparator<Track> = when (this) {
        TITLE_ASC -> compareBy { it.title?.lowercase() ?: "" }
        TITLE_DESC -> compareByDescending { it.title?.lowercase() ?: "" }
        ARTIST_ASC -> compareBy { it.displayArtist.lowercase() }
        ARTIST_DESC -> compareByDescending { it.displayArtist.lowercase() }
        ALBUM_ASC -> compareBy { it.displayAlbum.lowercase() }
        ALBUM_DESC -> compareByDescending { it.displayAlbum.lowercase() }
        DATE_ADDED_NEW -> compareByDescending { it.dateAdded }
        DATE_ADDED_OLD -> compareBy { it.dateAdded }
        DURATION_LONG -> compareByDescending { it.duration }
        DURATION_SHORT -> compareBy { it.duration }
        YEAR_NEW -> compareByDescending { it.year ?: 0 }
        YEAR_OLD -> compareBy { it.year ?: Int.MAX_VALUE }
        TRACK_NUMBER -> compareBy { it.trackNumber ?: Int.MAX_VALUE }
    }
}

/**
 * Music library tab options
 */
enum class MusicTab(val displayName: String, val icon: ImageVector) {
    SONGS("Songs", Icons.Default.MusicNote),
    ALBUMS("Albums", Icons.Default.Album),
    ARTISTS("Artists", Icons.Default.Person),
    GENRES("Genres", Icons.Default.Category),
    RADIO("Radio", Icons.Default.Radio),
    PLAYLISTS("Playlists", Icons.Default.PlaylistPlay)
}

/**
 * Music library UI state
 */
data class MusicLibraryUiState(
    val isLoading: Boolean = true,
    val tracks: List<Track> = emptyList(),
    val albums: List<Album> = emptyList(),
    val artists: List<Artist> = emptyList(),
    val genres: List<Genre> = emptyList(),
    val currentTab: MusicTab = MusicTab.SONGS,
    val sortOption: MusicSortOption = MusicSortOption.TITLE_ASC,
    val viewMode: MusicViewMode = MusicViewMode.LIST,
    val searchQuery: String = "",
    val selectedGenre: String? = null,
    val selectedArtist: String? = null,
    val selectedAlbum: String? = null,
    val selectedTag: String? = null,
    val showSortMenu: Boolean = false,
    val showFilterMenu: Boolean = false
)

/**
 * Radio station model
 */
data class RadioStation(
    val id: Long,
    val name: String,
    val url: String,
    val genre: String?,
    val country: String?,
    val language: String?,
    val bitrate: Int?,
    val isFavorite: Boolean = false,
    val addedAt: Long = System.currentTimeMillis()
) {
    val displayGenre: String get() = genre ?: "Unknown"
    val displayCountry: String get() = country ?: "Unknown"
}
