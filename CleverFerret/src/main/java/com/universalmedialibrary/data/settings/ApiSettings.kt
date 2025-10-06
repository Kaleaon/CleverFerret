package com.universalmedialibrary.data.settings

import kotlinx.serialization.Serializable

/**
 * Data classes for API configuration settings
 */

@Serializable
data class ApiSettings(
    val bookApis: BookApiSettings = BookApiSettings(),
    val comicApis: ComicApiSettings = ComicApiSettings(),
    val audiobookApis: AudiobookApiSettings = AudiobookApiSettings(),
    val movieTvApis: MovieTvApiSettings = MovieTvApiSettings(),
    val musicApis: MusicApiSettings = MusicApiSettings(),
    val artworkApis: ArtworkApiSettings = ArtworkApiSettings(),
    val lyricsApis: LyricsApiSettings = LyricsApiSettings()
)

@Serializable
data class BookApiSettings(
    // Free APIs
    val openLibraryEnabled: Boolean = true,
    val googleBooksEnabled: Boolean = true,
    val googleBooksApiKey: String = "",
    val hardcoverEnabled: Boolean = true,
    val isbnDbEnabled: Boolean = false,
    val isbnDbApiKey: String = "",
    
    // Additional book sources
    val goodreadsEnabled: Boolean = false,
    val goodreadsApiKey: String = "",
    val amazonEnabled: Boolean = false,
    val amazonApiKey: String = "",
    val isfdbEnabled: Boolean = false,
    val fantasticFictionEnabled: Boolean = true,
    val fictionDbEnabled: Boolean = false,
    val libraryThingEnabled: Boolean = false,
    val libraryThingApiKey: String = "",
    val worldCatEnabled: Boolean = false,
    val worldCatApiKey: String = "",
    
    val priority: List<String> = listOf("Open Library", "Google Books", "Hardcover", "ISBN DB", "Goodreads", "Amazon", "ISFDB", "Fantastic Fiction", "FictionDB", "Library Thing", "WorldCat")
)

@Serializable
data class ComicApiSettings(
    val comicVineEnabled: Boolean = false,
    val comicVineApiKey: String = "",
    val mangaUpdatesEnabled: Boolean = true,
    val geminiBubbleTranslationEnabled: Boolean = false,
    val geminiTargetLanguage: String = "en",
    val priority: List<String> = listOf("ComicVine", "Manga Updates")
)

@Serializable
data class AudiobookApiSettings(
    val overDriveEnabled: Boolean = false,
    val overDriveApiKey: String = "",
    val audibleEnabled: Boolean = false,
    val audibleApiKey: String = "",
    val librivoxEnabled: Boolean = true,
    val priority: List<String> = listOf("OverDrive", "Audible", "LibriVox")
)

@Serializable
data class MovieTvApiSettings(
    val tmdbEnabled: Boolean = true,
    val tmdbApiKey: String = "",
    val omdbEnabled: Boolean = true,
    val omdbApiKey: String = "",
    val imdbEnabled: Boolean = false,
    val imdbApiKey: String = "",
    val tvdbEnabled: Boolean = false,
    val tvdbApiKey: String = "",
    // Reviews and trailers
    val nytMovieReviewsEnabled: Boolean = true,
    val nytApiKey: String = "",
    val youtubeTrailersEnabled: Boolean = true,
    val youtubeApiKey: String = "",
    val guideboxEnabled: Boolean = false,
    val guideboxApiKey: String = "",
    val priority: List<String> = listOf("TMDB", "OMDb", "IMDB", "TVDB", "NYT Reviews", "YouTube Trailers", "Guidebox")
)

@Serializable
data class MusicApiSettings(
    val musicBrainzEnabled: Boolean = true,
    val spotifyEnabled: Boolean = false,
    val spotifyClientId: String = "",
    val spotifyClientSecret: String = "",
    val discogsEnabled: Boolean = false,
    val discogsApiKey: String = "",
    val lastFmEnabled: Boolean = false,
    val lastFmApiKey: String = "",
    // Additional music services
    val radioBrowserEnabled: Boolean = true,
    val audioDBEnabled: Boolean = false,
    val audioDBApiKey: String = "",
    val deezerEnabled: Boolean = true,
    val napsterEnabled: Boolean = false,
    val napsterApiKey: String = "",
    val priority: List<String> = listOf("MusicBrainz", "Spotify", "Discogs", "Last.fm", "Radio Browser", "AudioDB", "Deezer", "Napster")
)

@Serializable
data class ArtworkApiSettings(
    val fanartTvEnabled: Boolean = false,
    val fanartTvApiKey: String = "",
    val lastFmEnabled: Boolean = false,
    val lastFmApiKey: String = "",
    val coverArtArchiveEnabled: Boolean = true,
    val priority: List<String> = listOf("Cover Art Archive", "Fanart.tv", "Last.fm")
)

@Serializable
data class LyricsApiSettings(
    val musixmatchEnabled: Boolean = false,
    val musixmatchApiKey: String = "",
    val geniusEnabled: Boolean = false,
    val geniusApiKey: String = "",
    val priority: List<String> = listOf("Musixmatch", "Genius")
)

enum class MediaType {
    BOOKS,
    COMICS,
    AUDIOBOOKS,
    MOVIES_TV,
    MUSIC
}

data class ApiProvider(
    val name: String,
    val description: String,
    val requiresApiKey: Boolean,
    val isEnabled: Boolean,
    val apiKey: String = "",
    val website: String = "",
    val mediaType: MediaType
)
