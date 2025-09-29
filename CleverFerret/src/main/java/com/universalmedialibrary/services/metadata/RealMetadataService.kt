package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.*
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Real metadata service with actual API implementations
 */
@Singleton
class RealMetadataService @Inject constructor(
    private val apiKeyRepository: APIKeyRepository
) {
    
    private val okHttpClient = OkHttpClient.Builder()
        .connectTimeout(10, TimeUnit.SECONDS)
        .readTimeout(10, TimeUnit.SECONDS)
        .addInterceptor(HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BASIC
        })
        .build()
    
    // Google Books API (no key required for basic searches)
    private val googleBooksApi = Retrofit.Builder()
        .baseUrl("https://www.googleapis.com/books/v1/")
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        .create(GoogleBooksApi::class.java)
    
    // Open Library API (completely free, no key required)
    private val openLibraryApi = Retrofit.Builder()
        .baseUrl("https://openlibrary.org/")
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        .create(OpenLibraryApi::class.java)
    
    // TMDB API
    private val tmdbApi = Retrofit.Builder()
        .baseUrl("https://api.themoviedb.org/3/")
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        .create(TMDBApi::class.java)
    
    // OMDb API
    private val omdbApi = Retrofit.Builder()
        .baseUrl("https://www.omdbapi.com/")
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        .create(OMDbApi::class.java)
    
    // MusicBrainz API (no key required)
    private val musicBrainzApi = Retrofit.Builder()
        .baseUrl("https://musicbrainz.org/ws/2/")
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        .create(MusicBrainzApi::class.java)
    
    /**
     * Search for book metadata from multiple sources
     */
    suspend fun searchBookMetadata(
        query: String? = null,
        isbn: String? = null,
        title: String? = null,
        author: String? = null
    ): BookMetadataResult = withContext(Dispatchers.IO) {
        val results = mutableListOf<BookMetadata>()
        
        coroutineScope {
            val jobs = mutableListOf<kotlinx.coroutines.Deferred<List<BookMetadata>>>()
            
            // Build search query
            val searchQuery = when {
                !isbn.isNullOrBlank() -> "isbn:$isbn"
                !query.isNullOrBlank() -> query
                !title.isNullOrBlank() && !author.isNullOrBlank() -> "$title $author"
                !title.isNullOrBlank() -> title
                !author.isNullOrBlank() -> "inauthor:$author"
                else -> return@coroutineScope
            }
            
            // Search Google Books
            jobs.add(async {
                try {
                    searchGoogleBooks(searchQuery)
                } catch (e: Exception) {
                    emptyList()
                }
            })
            
            // Search Open Library
            jobs.add(async {
                try {
                    searchOpenLibrary(searchQuery)
                } catch (e: Exception) {
                    emptyList()
                }
            })
            
            // Collect all results
            jobs.awaitAll().forEach { results.addAll(it) }
        }
        
        // Merge and deduplicate results
        val mergedMetadata = mergeBookMetadata(results)
        
        BookMetadataResult(
            metadata = mergedMetadata,
            sources = results.map { it.source }.distinct()
        )
    }
    
    private suspend fun searchGoogleBooks(query: String): List<BookMetadata> {
        val response = googleBooksApi.searchBooks(query)
        return response.items?.map { item ->
            BookMetadata(
                title = item.volumeInfo.title ?: "",
                authors = item.volumeInfo.authors ?: emptyList(),
                publisher = item.volumeInfo.publisher,
                publishedDate = item.volumeInfo.publishedDate,
                description = item.volumeInfo.description,
                isbn13 = item.volumeInfo.industryIdentifiers?.find { it.type == "ISBN_13" }?.identifier,
                isbn10 = item.volumeInfo.industryIdentifiers?.find { it.type == "ISBN_10" }?.identifier,
                pageCount = item.volumeInfo.pageCount,
                categories = item.volumeInfo.categories ?: emptyList(),
                averageRating = item.volumeInfo.averageRating,
                language = item.volumeInfo.language,
                coverUrl = item.volumeInfo.imageLinks?.thumbnail?.replace("http:", "https:"),
                source = "Google Books",
                sourceId = item.id
            )
        } ?: emptyList()
    }
    
    private suspend fun searchOpenLibrary(query: String): List<BookMetadata> {
        val response = openLibraryApi.searchBooks(query)
        return response.docs?.map { doc ->
            BookMetadata(
                title = doc.title ?: "",
                authors = doc.author_name ?: emptyList(),
                publishedDate = doc.first_publish_year?.toString(),
                isbn13 = doc.isbn?.find { it.length == 13 },
                isbn10 = doc.isbn?.find { it.length == 10 },
                pageCount = doc.number_of_pages_median,
                language = doc.language?.firstOrNull(),
                coverUrl = doc.cover_i?.let { "https://covers.openlibrary.org/b/id/$it-L.jpg" },
                source = "Open Library",
                sourceId = doc.key
            )
        } ?: emptyList()
    }
    
    /**
     * Search for movie/TV metadata
     */
    suspend fun searchMovieMetadata(
        title: String,
        year: Int? = null,
        imdbId: String? = null
    ): MovieMetadataResult = withContext(Dispatchers.IO) {
        val results = mutableListOf<MovieMetadata>()
        
        coroutineScope {
            val jobs = mutableListOf<kotlinx.coroutines.Deferred<MovieMetadata?>>()
            
            // Search TMDB if API key available
            val tmdbKey = apiKeyRepository.getAPIKeyValue("tmdb")
            if (!tmdbKey.isNullOrEmpty()) {
                jobs.add(async {
                    try {
                        searchTMDB(title, year, tmdbKey)
                    } catch (e: Exception) {
                        null
                    }
                })
            }
            
            // Search OMDb if API key available
            val omdbKey = apiKeyRepository.getAPIKeyValue("omdb")
            if (!omdbKey.isNullOrEmpty()) {
                jobs.add(async {
                    try {
                        searchOMDb(title, year, imdbId, omdbKey)
                    } catch (e: Exception) {
                        null
                    }
                })
            }
            
            // Collect results
            jobs.awaitAll().forEach { it?.let { results.add(it) } }
        }
        
        // Merge results
        val mergedMetadata = mergeMovieMetadata(results)
        
        MovieMetadataResult(
            metadata = mergedMetadata,
            sources = results.map { it.source }.distinct()
        )
    }
    
    private suspend fun searchTMDB(title: String, year: Int?, apiKey: String): MovieMetadata? {
        val response = tmdbApi.searchMovies(apiKey, title)
        val movie = response.results?.firstOrNull { 
            year == null || it.release_date?.startsWith(year.toString()) == true 
        } ?: response.results?.firstOrNull()
        
        return movie?.let {
            MovieMetadata(
                title = it.title ?: "",
                year = it.release_date?.take(4)?.toIntOrNull(),
                overview = it.overview,
                posterUrl = it.poster_path?.let { path -> "https://image.tmdb.org/t/p/w500$path" },
                backdropUrl = it.backdrop_path?.let { path -> "https://image.tmdb.org/t/p/original$path" },
                voteAverage = it.vote_average,
                tmdbId = it.id.toString(),
                source = "TMDB"
            )
        }
    }
    
    private suspend fun searchOMDb(title: String, year: Int?, imdbId: String?, apiKey: String): MovieMetadata? {
        val response = when {
            !imdbId.isNullOrEmpty() -> omdbApi.getByImdbId(apiKey, imdbId)
            year != null -> omdbApi.searchByTitleAndYear(apiKey, title, year.toString())
            else -> omdbApi.searchByTitle(apiKey, title)
        }
        
        return if (response.Response == "True") {
            MovieMetadata(
                title = response.Title ?: "",
                year = response.Year?.toIntOrNull(),
                overview = response.Plot,
                posterUrl = response.Poster?.takeIf { it != "N/A" },
                voteAverage = response.imdbRating?.toFloatOrNull(),
                imdbId = response.imdbID,
                director = response.Director,
                actors = response.Actors,
                runtime = response.Runtime,
                genre = response.Genre,
                source = "OMDb"
            )
        } else null
    }
    
    /**
     * Search for music metadata
     */
    suspend fun searchMusicMetadata(
        query: String? = null,
        artist: String? = null,
        album: String? = null,
        track: String? = null
    ): MusicMetadataResult = withContext(Dispatchers.IO) {
        val searchQuery = when {
            !query.isNullOrBlank() -> query
            !artist.isNullOrBlank() && !album.isNullOrBlank() -> "artist:$artist AND release:$album"
            !artist.isNullOrBlank() && !track.isNullOrBlank() -> "artist:$artist AND recording:$track"
            !album.isNullOrBlank() -> "release:$album"
            !artist.isNullOrBlank() -> "artist:$artist"
            !track.isNullOrBlank() -> "recording:$track"
            else -> return@withContext MusicMetadataResult(null, emptyList())
        }
        
        try {
            val response = musicBrainzApi.searchReleases(searchQuery)
            val release = response.releases?.firstOrNull()
            
            val metadata = release?.let {
                MusicMetadata(
                    title = it.title ?: "",
                    artist = it.artist_credit?.joinToString(", ") { ac -> ac.name ?: "" },
                    releaseDate = it.date,
                    mbid = it.id,
                    source = "MusicBrainz"
                )
            }
            
            MusicMetadataResult(metadata, if (metadata != null) listOf("MusicBrainz") else emptyList())
        } catch (e: Exception) {
            MusicMetadataResult(null, emptyList())
        }
    }
    
    private fun mergeBookMetadata(results: List<BookMetadata>): BookMetadata? {
        if (results.isEmpty()) return null
        
        // Prioritize results with ISBN
        val withIsbn = results.filter { !it.isbn13.isNullOrEmpty() || !it.isbn10.isNullOrEmpty() }
        val primary = withIsbn.firstOrNull() ?: results.first()
        
        // Merge data from all sources
        return primary.copy(
            description = primary.description ?: results.firstNotNullOfOrNull { it.description },
            coverUrl = primary.coverUrl ?: results.firstNotNullOfOrNull { it.coverUrl },
            pageCount = primary.pageCount ?: results.firstNotNullOfOrNull { it.pageCount },
            publisher = primary.publisher ?: results.firstNotNullOfOrNull { it.publisher },
            categories = results.flatMap { it.categories }.distinct(),
            averageRating = results.mapNotNull { it.averageRating }.maxOrNull()
        )
    }
    
    private fun mergeMovieMetadata(results: List<MovieMetadata>): MovieMetadata? {
        if (results.isEmpty()) return null
        
        val primary = results.firstOrNull { !it.imdbId.isNullOrEmpty() } ?: results.first()
        
        return primary.copy(
            overview = primary.overview ?: results.firstNotNullOfOrNull { it.overview },
            posterUrl = primary.posterUrl ?: results.firstNotNullOfOrNull { it.posterUrl },
            backdropUrl = primary.backdropUrl ?: results.firstNotNullOfOrNull { it.backdropUrl },
            director = primary.director ?: results.firstNotNullOfOrNull { it.director },
            actors = primary.actors ?: results.firstNotNullOfOrNull { it.actors },
            runtime = primary.runtime ?: results.firstNotNullOfOrNull { it.runtime },
            genre = primary.genre ?: results.firstNotNullOfOrNull { it.genre }
        )
    }
}

// Data classes
data class BookMetadata(
    val title: String,
    val authors: List<String> = emptyList(),
    val publisher: String? = null,
    val publishedDate: String? = null,
    val description: String? = null,
    val isbn13: String? = null,
    val isbn10: String? = null,
    val pageCount: Int? = null,
    val categories: List<String> = emptyList(),
    val averageRating: Float? = null,
    val language: String? = null,
    val coverUrl: String? = null,
    val source: String,
    val sourceId: String? = null
)

data class BookMetadataResult(
    val metadata: BookMetadata?,
    val sources: List<String>
)

data class MovieMetadata(
    val title: String,
    val year: Int? = null,
    val overview: String? = null,
    val posterUrl: String? = null,
    val backdropUrl: String? = null,
    val voteAverage: Float? = null,
    val tmdbId: String? = null,
    val imdbId: String? = null,
    val director: String? = null,
    val actors: String? = null,
    val runtime: String? = null,
    val genre: String? = null,
    val source: String
)

data class MovieMetadataResult(
    val metadata: MovieMetadata?,
    val sources: List<String>
)

data class MusicMetadata(
    val title: String,
    val artist: String? = null,
    val album: String? = null,
    val releaseDate: String? = null,
    val mbid: String? = null,
    val coverUrl: String? = null,
    val source: String
)

data class MusicMetadataResult(
    val metadata: MusicMetadata?,
    val sources: List<String>
)

// API Response models
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

data class GoogleBookItem(
    val id: String,
    val volumeInfo: GoogleBookVolumeInfo
)

data class GoogleBooksResponse(
    val items: List<GoogleBookItem>? = null
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

data class OpenLibraryResponse(
    val docs: List<OpenLibraryDoc>? = null
)

data class TMDBMovie(
    val id: Int,
    val title: String? = null,
    val release_date: String? = null,
    val overview: String? = null,
    val poster_path: String? = null,
    val backdrop_path: String? = null,
    val vote_average: Float? = null
)

data class TMDBResponse(
    val results: List<TMDBMovie>? = null
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

data class MusicBrainzRelease(
    val id: String,
    val title: String? = null,
    val date: String? = null,
    val artist_credit: List<MusicBrainzArtistCredit>? = null
)

data class MusicBrainzArtistCredit(
    val name: String? = null
)

data class MusicBrainzResponse(
    val releases: List<MusicBrainzRelease>? = null
)

// API Interfaces
interface GoogleBooksApi {
    @GET("volumes")
    suspend fun searchBooks(
        @Query("q") query: String,
        @Query("maxResults") maxResults: Int = 10
    ): GoogleBooksResponse
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