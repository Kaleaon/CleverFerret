package com.universalmedialibrary.data.settings

import kotlinx.serialization.Serializable
import com.universalmedialibrary.data.MediaType as CoreMediaType

/**
 * A container for all API-related settings, organized by media type.
 *
 * @property bookApis Settings for book metadata providers.
 * @property comicApis Settings for comic book metadata providers.
 * @property audiobookApis Settings for audiobook metadata providers.
 * @property movieTvApis Settings for movie and TV show metadata providers.
 * @property musicApis Settings for music metadata providers.
 */
@Serializable
data class ApiSettings(
    val bookApis: BookApiSettings = BookApiSettings(),
    val comicApis: ComicApiSettings = ComicApiSettings(),
    val audiobookApis: AudiobookApiSettings = AudiobookApiSettings(),
    val movieTvApis: MovieTvApiSettings = MovieTvApiSettings(),
    val musicApis: MusicApiSettings = MusicApiSettings()
)

/**
 * Settings for book metadata APIs.
 *
 * @property openLibraryEnabled Whether the Open Library API is enabled.
 * @property googleBooksEnabled Whether the Google Books API is enabled.
 * @property googleBooksApiKey The API key for the Google Books service.
 * @property hardcoverEnabled Whether the Hardcover API is enabled.
 * @property priority The order of preference for fetching metadata from these APIs.
 */
@Serializable
data class BookApiSettings(
    val openLibraryEnabled: Boolean = true,
    val googleBooksEnabled: Boolean = true,
    val googleBooksApiKey: String = "",
    val hardcoverEnabled: Boolean = true,
    val priority: List<String> = listOf("Open Library", "Google Books", "Hardcover")
)

/**
 * Settings for comic book metadata APIs.
 *
 * @property comicVineEnabled Whether the ComicVine API is enabled.
 * @property comicVineApiKey The API key for the ComicVine service.
 * @property priority The order of preference for fetching metadata from these APIs.
 */
@Serializable
data class ComicApiSettings(
    val comicVineEnabled: Boolean = false,
    val comicVineApiKey: String = "",
    val priority: List<String> = listOf("ComicVine")
)

/**
 * Settings for audiobook metadata APIs.
 *
 * @property overDriveEnabled Whether the OverDrive API is enabled.
 * @property overDriveApiKey The API key for the OverDrive service.
 * @property priority The order of preference for fetching metadata from these APIs.
 */
@Serializable
data class AudiobookApiSettings(
    val overDriveEnabled: Boolean = false,
    val overDriveApiKey: String = "",
    val priority: List<String> = listOf("OverDrive")
)

/**
 * Settings for movie and TV show metadata APIs.
 *
 * @property tmdbEnabled Whether The Movie Database (TMDB) API is enabled.
 * @property tmdbApiKey The API key for the TMDB service.
 * @property omdbEnabled Whether the Open Movie Database (OMDb) API is enabled.
 * @property omdbApiKey The API key for the OMDb service.
 * @property priority The order of preference for fetching metadata from these APIs.
 */
@Serializable
data class MovieTvApiSettings(
    val tmdbEnabled: Boolean = true,
    val tmdbApiKey: String = "",
    val omdbEnabled: Boolean = true,
    val omdbApiKey: String = "",
    val priority: List<String> = listOf("TMDB", "OMDb")
)

/**
 * Settings for music metadata APIs.
 *
 * @property musicBrainzEnabled Whether the MusicBrainz API is enabled.
 * @property spotifyEnabled Whether the Spotify API is enabled.
 * @property spotifyClientId The client ID for the Spotify service.
 * @property spotifyClientSecret The client secret for the Spotify service.
 * @property priority The order of preference for fetching metadata from these APIs.
 */
@Serializable
data class MusicApiSettings(
    val musicBrainzEnabled: Boolean = true,
    val spotifyEnabled: Boolean = false,
    val spotifyClientId: String = "",
    val spotifyClientSecret: String = "",
    val priority: List<String> = listOf("MusicBrainz", "Spotify")
)

/**
 * A media type enum specific to the settings screen to avoid conflicts with the core [CoreMediaType].
 */
enum class SettingsMediaType {
    /** Book-related settings. */
    BOOKS,
    /** Comic book-related settings. */
    COMICS,
    /** Audiobook-related settings. */
    AUDIOBOOKS,
    /** Movie and TV show-related settings. */
    MOVIES_TV,
    /** Music-related settings. */
    MUSIC
}

/**
 * Represents a single API provider for display and configuration in the UI.
 *
 * @property name The display name of the provider.
 * @property description A brief description of the service.
 * @property requiresApiKey Whether the provider requires an API key to function.
 * @property isEnabled Whether the user has enabled this provider.
 * @property apiKey The user's API key for this service.
 * @property website The official website of the provider.
 * @property mediaType The type of media this provider supports.
 */
data class ApiProvider(
    val name: String,
    val description: String,
    val requiresApiKey: Boolean,
    val isEnabled: Boolean,
    val apiKey: String = "",
    val website: String = "",
    val mediaType: SettingsMediaType
)