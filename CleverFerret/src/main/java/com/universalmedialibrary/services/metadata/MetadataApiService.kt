package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.repository.APIKeyRepository
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class MetadataApiService @Inject constructor(
    private val apiKeyRepository: APIKeyRepository
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
            val music = musicBrainzApi.searchMusic(query)
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
}
