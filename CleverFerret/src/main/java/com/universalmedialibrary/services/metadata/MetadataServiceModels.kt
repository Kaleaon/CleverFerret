package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.MediaType
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

/**
 * Data models for metadata services
 */

data class UnifiedMetadataSearchResult(
    val id: String,
    val title: String,
    val author: String? = null,
    val director: String? = null,
    val artist: String? = null,
    val description: String? = null,
    val coverUrl: String? = null,
    val publishDate: String? = null,
    val year: Int? = null,
    val isbn: String? = null,
    val publisher: String? = null,
    val pageCount: Int? = null,
    val genre: String? = null,
    val genres: List<String> = emptyList(),
    val language: String? = null,
    val rating: Float? = null,
    val imdbId: String? = null,
    val mediaType: MediaType,
    val source: String, // "google_books", "tmdb", "spotify", etc.
    val confidence: Float = 0.0f,
    val additionalData: Map<String, Any> = emptyMap()
)

data class MetadataEnrichmentResult(
    val originalItem: Any,
    val enrichedMetadata: Map<String, Any>,
    val sources: List<String>,
    val confidence: Float,
    val processingTime: Long,
    val success: Boolean,
    val errors: List<String> = emptyList()
)

data class MetadataProvider(
    val name: String,
    val apiKey: String?,
    val isActive: Boolean,
    val supportedTypes: List<MediaType>,
    val rateLimitPerMinute: Int,
    val priority: Int = 0
)

sealed class MetadataLookupResult {
    data class Success(val results: List<UnifiedMetadataSearchResult>) : MetadataLookupResult()
    data class Error(val message: String, val exception: Throwable? = null) : MetadataLookupResult()
    object NoResults : MetadataLookupResult()
}

enum class MetadataSource {
    // Book sources (matching Calibre plugins)
    GOOGLE_BOOKS,
    OPEN_LIBRARY,
    AMAZON_PRODUCT_ADVERTISING,
    GOODREADS,
    HARDCOVER,
    ISFDB, // Internet Speculative Fiction Database
    FANTASTIC_FICTION,
    FICTION_DB,
    LIBRARY_THING,
    WORLDCAT_OCLC,

    // Comic/Manga sources
    COMICVINE,
    MANGA_UPDATES,

    // Movie/TV sources
    TMDB,
    OMDB,
    IMDB,
    TVDB,

    // Music sources
    MUSICBRAINZ,
    SPOTIFY,
    DISCOGS,
    LAST_FM,
    RADIO_BROWSER,
    AUDIODB,
    DEEZER,
    NAPSTER,

    // Audiobook sources
    AUDIBLE,
    LIBRIVOX,

    // General ISBN databases
    ISBN_DB,
    WORLD_CAT,

    // Fanfiction sources (covered in WebFictionService)
    ARCHIVE_OF_OUR_OWN,
    FANFICTION_NET,
    WATTPAD
}

// API Response models - consolidated from MetadataApiService and RealMetadataService
data class GoogleBooksResponse(
    val items: List<GoogleBookItem>? = null
)

data class GoogleBookItem(
    val id: String,
    val volumeInfo: GoogleBookVolumeInfo
)

data class GoogleBookVolumeInfo(
    val title: String? = null,
    val authors: List<String>? = null,
    val publisher: String? = null,
    val publishedDate: String? = null,
    val description: String? = null,
    val industryIdentifiers: List<GoogleBookIdentifier>? = null,
    val pageCount: Int? = null,
    val categories: List<String>? = null,
    val averageRating: Float? = null,
    val language: String? = null,
    val imageLinks: GoogleBookImageLinks? = null
)

data class GoogleBookIdentifier(
    val type: String,
    val identifier: String
)

data class GoogleBookImageLinks(
    val smallThumbnail: String? = null,
    val thumbnail: String? = null
)

data class OpenLibraryResponse(
    val docs: List<OpenLibraryDoc>? = null
)

data class OpenLibraryDoc(
    val key: String,
    val title: String? = null,
    val author_name: List<String>? = null,
    val first_publish_year: Int? = null,
    val isbn: List<String>? = null,
    val number_of_pages_median: Int? = null,
    val cover_i: Int? = null,
    val language: List<String>? = null
)

data class TMDBResponse(
    val results: List<TMDBResult>? = null
)

data class TMDBResult(
    val id: Int,
    val title: String? = null,
    val name: String? = null, // For TV shows
    val overview: String? = null,
    val release_date: String? = null,
    val first_air_date: String? = null, // For TV shows
    val poster_path: String? = null,
    val backdrop_path: String? = null,
    val genre_ids: List<Int>? = null,
    val vote_average: Float? = null
)

data class OMDbResponse(
    val Title: String? = null,
    val Year: String? = null,
    val Plot: String? = null,
    val Poster: String? = null,
    val imdbRating: String? = null,
    val imdbID: String? = null,
    val Director: String? = null,
    val Actors: String? = null,
    val Runtime: String? = null,
    val Genre: String? = null,
    val Response: String? = null
)

data class MusicBrainzResponse(
    val releases: List<MusicBrainzRelease>? = null
)

data class MusicBrainzRelease(
    val id: String,
    val title: String? = null,
    val date: String? = null,
    val artist_credit: List<MusicBrainzArtistCredit>? = null
)

data class MusicBrainzArtistCredit(
    val name: String? = null
)

// Radio Browser API Models
data class RadioStation(
    val stationuuid: String,
    val name: String,
    val url: String? = null,
    val homepage: String? = null,
    val favicon: String? = null,
    val tags: String? = null,
    val country: String? = null,
    val language: String? = null,
    val codec: String? = null,
    val bitrate: Int? = null,
    val votes: Int? = null
)

// AudioDB API Models
data class AudioDBResponse(
    val artists: List<AudioDBArtist>? = null
)

data class AudioDBArtist(
    val idArtist: String,
    val strArtist: String,
    val strGenre: String? = null,
    val strBiographyEN: String? = null,
    val strArtistThumb: String? = null,
    val strArtistLogo: String? = null,
    val intFormedYear: String? = null,
    val strCountry: String? = null
)

data class AudioDBAlbumResponse(
    val album: List<AudioDBAlbum>? = null
)

data class AudioDBAlbum(
    val idAlbum: String,
    val strAlbum: String,
    val strArtist: String? = null,
    val intYearReleased: String? = null,
    val strAlbumThumb: String? = null,
    val strDescriptionEN: String? = null,
    val strGenre: String? = null
)

// Deezer API Models
data class DeezerArtistResponse(
    val data: List<DeezerArtist>? = null
)

data class DeezerArtist(
    val id: Long,
    val name: String,
    val picture: String? = null,
    val picture_medium: String? = null,
    val picture_big: String? = null,
    val nb_album: Int? = null,
    val nb_fan: Int? = null
)

data class DeezerAlbumResponse(
    val data: List<DeezerAlbum>? = null
)

data class DeezerAlbum(
    val id: Long,
    val title: String,
    val cover: String? = null,
    val cover_medium: String? = null,
    val cover_big: String? = null,
    val release_date: String? = null,
    val artist: DeezerArtist? = null
)

// Napster API Models
data class NapsterResponse(
    val artists: List<NapsterArtist>? = null
)

data class NapsterArtist(
    val id: String,
    val name: String,
    val biography: String? = null
)

// API Interfaces - consolidated
interface GoogleBooksApi {
    @GET("volumes")
    suspend fun searchBooks(
        @Query("q") query: String,
        @Query("maxResults") maxResults: Int = 10
    ): GoogleBooksResponse

    @GET("volumes/{id}")
    suspend fun getBookDetails(@Path("id") id: String): GoogleBookItem
}

interface OpenLibraryApi {
    @GET("search.json")
    suspend fun searchBooks(
        @Query("q") query: String,
        @Query("limit") limit: Int = 10
    ): OpenLibraryResponse
}

interface TMDBApi {
    @GET("search/movie")
    suspend fun searchMovies(
        @Query("api_key") apiKey: String,
        @Query("query") query: String
    ): TMDBResponse

    @GET("search/tv")
    suspend fun searchTV(
        @Query("api_key") apiKey: String,
        @Query("query") query: String
    ): TMDBResponse
}

interface OMDbApi {
    @GET("/")
    suspend fun searchByTitle(
        @Query("apikey") apiKey: String,
        @Query("t") title: String
    ): OMDbResponse

    @GET("/")
    suspend fun searchByTitleAndYear(
        @Query("apikey") apiKey: String,
        @Query("t") title: String,
        @Query("y") year: String
    ): OMDbResponse

    @GET("/")
    suspend fun getByImdbId(
        @Query("apikey") apiKey: String,
        @Query("i") imdbId: String
    ): OMDbResponse
}

interface MusicBrainzApi {
    @GET("release")
    suspend fun searchReleases(
        @Query("query") query: String,
        @Query("fmt") format: String = "json",
        @Query("limit") limit: Int = 10
    ): MusicBrainzResponse
}

// Radio Browser API - Free radio station directory
interface RadioBrowserApi {
    @GET("json/stations/search")
    suspend fun searchStations(
        @Query("name") name: String,
        @Query("limit") limit: Int = 10
    ): List<RadioStation>
    
    @GET("json/stations/bygenre/{genre}")
    suspend fun getStationsByGenre(
        @Path("genre") genre: String,
        @Query("limit") limit: Int = 10
    ): List<RadioStation>
}

// AudioDB API - Music metadata database
interface AudioDBApi {
    @GET("api/v1/json/{apiKey}/search.php")
    suspend fun searchArtist(
        @Path("apiKey") apiKey: String,
        @Query("s") artist: String
    ): AudioDBResponse
    
    @GET("api/v1/json/{apiKey}/searchalbum.php")
    suspend fun searchAlbum(
        @Path("apiKey") apiKey: String,
        @Query("s") artist: String,
        @Query("a") album: String
    ): AudioDBAlbumResponse
}

// Deezer API - Music streaming service with free API
interface DeezerApi {
    @GET("search/artist")
    suspend fun searchArtist(
        @Query("q") query: String,
        @Query("limit") limit: Int = 10
    ): DeezerArtistResponse
    
    @GET("search/album")
    suspend fun searchAlbum(
        @Query("q") query: String,
        @Query("limit") limit: Int = 10
    ): DeezerAlbumResponse
}

// Napster API
interface NapsterApi {
    @GET("v2.2/search")
    suspend fun searchArtists(
        @Query("apikey") apiKey: String,
        @Query("query") query: String,
        @Query("type") type: String = "artist",
        @Query("limit") limit: Int = 10
    ): NapsterResponse
}
