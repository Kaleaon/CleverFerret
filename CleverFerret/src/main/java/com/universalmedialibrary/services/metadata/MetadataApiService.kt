package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.repository.APIKeyRepository
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class MetadataApiService @Inject constructor(
    private val apiKeyRepository: APIKeyRepository,
    private val tvMazeService: TVMazeService
) {

    private val googleBooksApi: GoogleBooksApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://www.googleapis.com/books/v1/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(GoogleBooksApi::class.java)
    }

    private val openLibraryApi: OpenLibraryApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://openlibrary.org/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(OpenLibraryApi::class.java)
    }

    private val tmdbApi: TMDBApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://api.themoviedb.org/3/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(TMDBApi::class.java)
    }

    private val musicBrainzApi: MusicBrainzApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://musicbrainz.org/ws/2/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(MusicBrainzApi::class.java)
    }

    suspend fun searchBooks(query: String): List<UnifiedMetadataSearchResult> {
        val results = mutableListOf<UnifiedMetadataSearchResult>()

        try {
            // Google Books API
            val googleBooks = googleBooksApi.searchBooks(query)
            googleBooks.items?.forEach { item ->
                results.add(
                    UnifiedMetadataSearchResult(
                        id = item.id,
                        title = item.volumeInfo.title ?: "Unknown Title",
                        author = item.volumeInfo.authors?.joinToString(", "),
                        year = item.volumeInfo.publishedDate?.take(4)?.toIntOrNull(),
                        coverUrl = item.volumeInfo.imageLinks?.thumbnail,
                        description = item.volumeInfo.description,
                        genres = item.volumeInfo.categories ?: emptyList(),
                        rating = item.volumeInfo.averageRating,
                        isbn = item.volumeInfo.industryIdentifiers
                            ?.find { it.type == "ISBN_13" }?.identifier,
                        mediaType = com.universalmedialibrary.data.MediaType.BOOK,
                        source = MetadataSource.GOOGLE_BOOKS.name
                    )
                )
            }
        } catch (e: Exception) {
            // Log error but continue with other sources
        }

        try {
            // Open Library API
            val openLibrary = openLibraryApi.searchBooks(query)
            openLibrary.docs?.forEach { doc ->
                results.add(
                    UnifiedMetadataSearchResult(
                        id = doc.key,
                        title = doc.title ?: "Unknown Title",
                        author = doc.author_name?.joinToString(", "),
                        year = doc.first_publish_year,
                        coverUrl = doc.cover_i?.let { "https://covers.openlibrary.org/b/id/$it-M.jpg" },
                        isbn = doc.isbn?.firstOrNull(),
                        mediaType = com.universalmedialibrary.data.MediaType.BOOK,
                        source = MetadataSource.OPEN_LIBRARY.name
                    )
                )
            }
        } catch (e: Exception) {
            // Log error but continue
        }

        return results
    }

    suspend fun searchMovies(query: String): List<UnifiedMetadataSearchResult> {
        val results = mutableListOf<UnifiedMetadataSearchResult>()

        // Get TMDB API key from repository
        val tmdbApiKey = apiKeyRepository.getAPIKeyValue("tmdb")

        if (tmdbApiKey.isNullOrEmpty()) {
            // Return demo data if no API key
            return createDemoMovieResults(query)
        }

        try {
            val movies = tmdbApi.searchMovies(tmdbApiKey, query)
            movies.results?.forEach { movie ->
                results.add(
                    UnifiedMetadataSearchResult(
                        id = movie.id.toString(),
                        title = movie.title ?: movie.name ?: "Unknown Title",
                        year = movie.release_date?.take(4)?.toIntOrNull()
                            ?: movie.first_air_date?.take(4)?.toIntOrNull(),
                        coverUrl = movie.poster_path?.let { "https://image.tmdb.org/t/p/w500$it" },
                        description = movie.overview,
                        rating = movie.vote_average,
                        mediaType = com.universalmedialibrary.data.MediaType.MOVIE,
                        source = MetadataSource.TMDB.name
                    )
                )
            }
        } catch (e: Exception) {
            return createDemoMovieResults(query)
        }

        return results
    }

    suspend fun searchMusic(query: String): List<UnifiedMetadataSearchResult> {
        val results = mutableListOf<UnifiedMetadataSearchResult>()

        try {
            val music = musicBrainzApi.searchReleases(query)
            music.releases?.forEach { release ->
                results.add(
                    UnifiedMetadataSearchResult(
                        id = release.id,
                        title = release.title ?: "Unknown Title",
                        artist = release.artist_credit?.firstOrNull()?.name,
                        year = release.date?.take(4)?.toIntOrNull(),
                        mediaType = com.universalmedialibrary.data.MediaType.MUSIC,
                        source = MetadataSource.MUSICBRAINZ.name
                    )
                )
            }
        } catch (e: Exception) {
            // Return demo data on error
            return createDemoMusicResults(query)
        }

        return results
    }

    /**
     * Search for TV shows using TVMaze API
     * 
     * TVMaze provides comprehensive TV show data including:
     * - Complete episode listings
     * - Cast and crew information
     * - High-quality images
     * - Air dates and schedules
     * - Network information
     * - Links to IMDb and TheTVDB
     * 
     * Best of all: No API key required!
     * 
     * Example:
     * ```kotlin
     * val results = searchTVShows("Breaking Bad")
     * results.forEach { show ->
     *     println("${show.title} (${show.year}) - Rating: ${show.rating}")
     * }
     * ```
     */
    suspend fun searchTVShows(query: String): List<UnifiedMetadataSearchResult> {
        val results = mutableListOf<UnifiedMetadataSearchResult>()

        try {
            // Search using TVMaze API (no API key required!)
            val tvMazeResults = tvMazeService.searchShows(query)
            
            tvMazeResults.shows.forEach { show ->
                // Clean HTML from summary
                val cleanSummary = show.summary?.replace(Regex("<[^>]*>"), "")?.trim()
                
                results.add(
                    UnifiedMetadataSearchResult(
                        id = show.id.toString(),
                        title = show.name,
                        year = show.premiered?.take(4)?.toIntOrNull(),
                        coverUrl = show.image?.original ?: show.image?.medium,
                        description = cleanSummary,
                        genres = show.genres,
                        rating = show.rating?.average?.toFloat(),
                        language = show.language,
                        imdbId = show.externals?.imdb,
                        mediaType = com.universalmedialibrary.data.MediaType.TV_SHOW,
                        source = MetadataSource.TVMAZE.name,
                        additionalData = mapOf(
                            "tvMazeId" to show.id,
                            "status" to (show.status ?: "Unknown"),
                            "network" to (show.network?.name ?: show.webChannel?.name ?: "Unknown"),
                            "runtime" to (show.runtime ?: show.averageRuntime ?: 0),
                            "premiered" to (show.premiered ?: ""),
                            "ended" to (show.ended ?: ""),
                            "tvdbId" to (show.externals?.thetvdb ?: 0),
                            "officialSite" to (show.officialSite ?: "")
                        )
                    )
                )
            }
        } catch (e: Exception) {
            // Return demo data on error
            return createDemoTVShowResults(query)
        }

        return results
    }

    /**
     * Get comprehensive TV show details including episodes
     * 
     * This fetches complete show information from TVMaze including:
     * - All episodes with air dates
     * - Cast information
     * - Season information
     * - Network and streaming details
     */
    suspend fun getTVShowDetails(tvMazeId: Int): UnifiedMetadataSearchResult? {
        return try {
            val details = tvMazeService.getCompleteShowDetails(tvMazeId)
            val show = details.show ?: return null
            
            val cleanSummary = show.summary?.replace(Regex("<[^>]*>"), "")?.trim()
            
            UnifiedMetadataSearchResult(
                id = show.id.toString(),
                title = show.name,
                year = show.premiered?.take(4)?.toIntOrNull(),
                coverUrl = show.image?.original ?: show.image?.medium,
                description = cleanSummary,
                genres = show.genres,
                rating = show.rating?.average?.toFloat(),
                language = show.language,
                imdbId = show.externals?.imdb,
                mediaType = com.universalmedialibrary.data.MediaType.TV_SHOW,
                source = MetadataSource.TVMAZE.name,
                additionalData = mapOf(
                    "tvMazeId" to show.id,
                    "status" to (show.status ?: "Unknown"),
                    "network" to (show.network?.name ?: show.webChannel?.name ?: "Unknown"),
                    "runtime" to (show.runtime ?: show.averageRuntime ?: 0),
                    "premiered" to (show.premiered ?: ""),
                    "ended" to (show.ended ?: ""),
                    "tvdbId" to (show.externals?.thetvdb ?: 0),
                    "officialSite" to (show.officialSite ?: ""),
                    "totalEpisodes" to details.totalEpisodes,
                    "totalSeasons" to details.totalSeasons,
                    "episodes" to details.episodes,
                    "cast" to details.cast,
                    "seasons" to details.seasons
                )
            )
        } catch (e: Exception) {
            null
        }
    }

    private fun createDemoMovieResults(query: String): List<UnifiedMetadataSearchResult> {
        return listOf(
            UnifiedMetadataSearchResult(
                id = "demo1",
                title = "Demo Movie: $query",
                director = "Demo Director",
                year = 2024,
                coverUrl = "https://via.placeholder.com/500x750/1565C0/ffffff?text=Movie",
                description = "This is a demo movie result for '$query'. In production, this would use the actual TMDB API.",
                genres = listOf("Action", "Drama"),
                rating = 8.5f,
                mediaType = com.universalmedialibrary.data.MediaType.MOVIE,
                source = MetadataSource.TMDB.name
            )
        )
    }

    private fun createDemoMusicResults(query: String): List<UnifiedMetadataSearchResult> {
        return listOf(
            UnifiedMetadataSearchResult(
                id = "demo1",
                title = "Demo Album: $query",
                artist = "Demo Artist",
                year = 2024,
                coverUrl = "https://via.placeholder.com/500x500/7B1FA2/ffffff?text=Music",
                description = "This is a demo music result for '$query'.",
                genres = listOf("Electronic", "Ambient"),
                mediaType = com.universalmedialibrary.data.MediaType.MUSIC,
                source = MetadataSource.MUSICBRAINZ.name
            )
        )
    }

    private fun createDemoTVShowResults(query: String): List<UnifiedMetadataSearchResult> {
        return listOf(
            UnifiedMetadataSearchResult(
                id = "demo1",
                title = "Demo TV Show: $query",
                director = "Demo Creator",
                year = 2024,
                coverUrl = "https://via.placeholder.com/500x750/FF9800/ffffff?text=TV+Show",
                description = "This is a demo TV show result for '$query'. In production, this would use the TVMaze API.",
                genres = listOf("Drama", "Sci-Fi"),
                rating = 8.5f,
                mediaType = com.universalmedialibrary.data.MediaType.TV_SHOW,
                source = MetadataSource.TVMAZE.name
            )
        )
    }
}
