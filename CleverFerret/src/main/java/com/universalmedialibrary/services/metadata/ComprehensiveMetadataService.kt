package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.artwork.ArtworkLoader
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Comprehensive Metadata Service
 * 
 * Unified service that fetches all available metadata for media items:
 * - Basic metadata (title, description, ratings)
 * - Movie posters and artwork
 * - Movie trailers (YouTube + TMDB)
 * - Movie reviews (Rotten Tomatoes, IMDb, Metacritic, NYT)
 * 
 * This service demonstrates the complete workflow of API integration
 * and serves as the primary interface for metadata operations.
 */
@Singleton
class ComprehensiveMetadataService @Inject constructor(
    private val realMetadataService: RealMetadataService,
    private val movieTrailerService: MovieTrailerService,
    private val movieReviewService: MovieReviewService,
    private val artworkLoader: ArtworkLoader,
    private val apiKeyRepository: APIKeyRepository,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {

    /**
     * Fetch complete movie metadata with trailers and reviews
     * 
     * Example usage:
     * ```kotlin
     * val result = service.fetchCompleteMovieMetadata(
     *     itemId = 123,
     *     title = "The Matrix",
     *     year = 1999
     * )
     * 
     * // Access trailers
     * result.trailers.forEach { trailer ->
     *     println("${trailer.title}: ${trailer.url}")
     * }
     * 
     * // Access reviews
     * println("Rotten Tomatoes: ${result.rottenTomatoesRating}")
     * println("IMDb: ${result.imdbRating}")
     * 
     * // Access artwork
     * val poster = result.posterBitmap
     * ```
     */
    suspend fun fetchCompleteMovieMetadata(
        itemId: Long,
        title: String,
        year: Int? = null,
        imdbId: String? = null
    ): CompleteMovieMetadata = withContext(Dispatchers.IO) {
        coroutineScope {
            // Fetch all data in parallel for best performance
            val basicMetadataDeferred = async {
                realMetadataService.searchMovieMetadata(title, year, imdbId)
            }
            
            val trailersDeferred = async {
                try {
                    movieTrailerService.fetchMovieTrailers(title, year)
                } catch (e: Exception) {
                    TrailerResult(emptyList(), emptyList(), e.message)
                }
            }
            
            val reviewsDeferred = async {
                try {
                    movieReviewService.fetchMovieReviews(title, year, imdbId)
                } catch (e: Exception) {
                    MovieReviewResult(emptyList(), sources = emptyList(), error = e.message)
                }
            }

            // Wait for all results
            val basicMetadata = basicMetadataDeferred.await()
            val trailers = trailersDeferred.await()
            val reviews = reviewsDeferred.await()

            // Combine into comprehensive result
            CompleteMovieMetadata(
                // Basic metadata
                title = basicMetadata.metadata?.title ?: title,
                year = basicMetadata.metadata?.year ?: year,
                overview = basicMetadata.metadata?.overview,
                posterUrl = basicMetadata.metadata?.posterUrl,
                backdropUrl = basicMetadata.metadata?.backdropUrl,
                voteAverage = basicMetadata.metadata?.voteAverage,
                tmdbId = basicMetadata.metadata?.tmdbId,
                imdbId = basicMetadata.metadata?.imdbId ?: imdbId,
                director = basicMetadata.metadata?.director,
                actors = basicMetadata.metadata?.actors,
                runtime = basicMetadata.metadata?.runtime,
                genre = basicMetadata.metadata?.genre,
                
                // Trailers
                trailers = trailers.trailers,
                trailerSources = trailers.sources,
                
                // Reviews and Ratings
                reviews = reviews.reviews,
                rottenTomatoesRating = reviews.rottenTomatoesRating,
                rottenTomatoesMeter = reviews.rottenTomatoesMeter,
                metacriticScore = reviews.metacriticScore,
                imdbRating = reviews.imdbRating,
                reviewSources = reviews.sources,
                
                // Metadata sources
                metadataSources = basicMetadata.sources,
                
                // Error tracking
                trailerError = trailers.error,
                reviewError = reviews.error
            )
        }
    }

    /**
     * Fetch complete book metadata with cover artwork
     */
    suspend fun fetchCompleteBookMetadata(
        itemId: Long,
        title: String,
        author: String? = null,
        isbn: String? = null
    ): CompleteBookMetadata = withContext(Dispatchers.IO) {
        val basicMetadata = realMetadataService.searchBookMetadata(
            title = title,
            author = author,
            isbn = isbn
        )

        CompleteBookMetadata(
            title = basicMetadata.metadata?.title ?: title,
            authors = basicMetadata.metadata?.authors ?: emptyList(),
            publisher = basicMetadata.metadata?.publisher,
            publishedDate = basicMetadata.metadata?.publishedDate,
            description = basicMetadata.metadata?.description,
            isbn13 = basicMetadata.metadata?.isbn13,
            isbn10 = basicMetadata.metadata?.isbn10,
            pageCount = basicMetadata.metadata?.pageCount,
            categories = basicMetadata.metadata?.categories ?: emptyList(),
            averageRating = basicMetadata.metadata?.averageRating,
            language = basicMetadata.metadata?.language,
            coverUrl = basicMetadata.metadata?.coverUrl,
            sources = basicMetadata.sources
        )
    }

    /**
     * Fetch complete music metadata with album artwork
     */
    suspend fun fetchCompleteMusicMetadata(
        itemId: Long,
        artist: String? = null,
        album: String? = null,
        track: String? = null
    ): CompleteMusicMetadata = withContext(Dispatchers.IO) {
        val basicMetadata = realMetadataService.searchMusicMetadata(
            artist = artist,
            album = album,
            track = track
        )

        CompleteMusicMetadata(
            title = basicMetadata.metadata?.title ?: track ?: "",
            artist = basicMetadata.metadata?.artist,
            album = basicMetadata.metadata?.album,
            releaseDate = basicMetadata.metadata?.releaseDate,
            mbid = basicMetadata.metadata?.mbid,
            coverUrl = basicMetadata.metadata?.coverUrl,
            sources = basicMetadata.sources
        )
    }

    /**
     * Check API key availability for various services
     */
    suspend fun checkAPIKeyAvailability(): APIKeyAvailability = withContext(Dispatchers.IO) {
        APIKeyAvailability(
            hasTMDB = !apiKeyRepository.getAPIKeyValue("tmdb").isNullOrEmpty(),
            hasOMDb = !apiKeyRepository.getAPIKeyValue("omdb").isNullOrEmpty(),
            hasYouTube = !apiKeyRepository.getAPIKeyValue("youtube").isNullOrEmpty(),
            hasNYT = !apiKeyRepository.getAPIKeyValue("nyt").isNullOrEmpty(),
            hasGoogleBooks = true, // No key required
            hasOpenLibrary = true, // No key required
            hasMusicBrainz = true, // No key required
            hasGemini = !apiKeyRepository.getAPIKeyValue("gemini").isNullOrEmpty()
        )
    }
}

/**
 * Complete movie metadata including trailers and reviews
 */
data class CompleteMovieMetadata(
    // Basic metadata
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
    
    // Trailers
    val trailers: List<MovieTrailer> = emptyList(),
    val trailerSources: List<String> = emptyList(),
    
    // Reviews and Ratings
    val reviews: List<MovieReview> = emptyList(),
    val rottenTomatoesRating: String? = null,
    val rottenTomatoesMeter: String? = null,
    val metacriticScore: String? = null,
    val imdbRating: String? = null,
    val reviewSources: List<String> = emptyList(),
    
    // Sources
    val metadataSources: List<String> = emptyList(),
    
    // Errors
    val trailerError: String? = null,
    val reviewError: String? = null
) {
    val hasTrailers: Boolean
        get() = trailers.isNotEmpty()
    
    val hasReviews: Boolean
        get() = reviews.isNotEmpty()
    
    val hasRatings: Boolean
        get() = rottenTomatoesRating != null || 
                metacriticScore != null || 
                imdbRating != null ||
                voteAverage != null
    
    /**
     * Get official trailer (TMDB or marked as official on YouTube)
     */
    val officialTrailer: MovieTrailer?
        get() = trailers.find { it.isOfficial } ?: trailers.firstOrNull()
}

/**
 * Complete book metadata
 */
data class CompleteBookMetadata(
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
    val sources: List<String> = emptyList()
)

/**
 * Complete music metadata
 */
data class CompleteMusicMetadata(
    val title: String,
    val artist: String? = null,
    val album: String? = null,
    val releaseDate: String? = null,
    val mbid: String? = null,
    val coverUrl: String? = null,
    val sources: List<String> = emptyList()
)

/**
 * API key availability status
 */
data class APIKeyAvailability(
    val hasTMDB: Boolean = false,
    val hasOMDb: Boolean = false,
    val hasYouTube: Boolean = false,
    val hasNYT: Boolean = false,
    val hasGoogleBooks: Boolean = true,
    val hasOpenLibrary: Boolean = true,
    val hasMusicBrainz: Boolean = true,
    val hasGemini: Boolean = false
) {
    val canFetchMovieMetadata: Boolean
        get() = hasTMDB || hasOMDb
    
    val canFetchBookMetadata: Boolean
        get() = hasGoogleBooks || hasOpenLibrary
    
    val canFetchMusicMetadata: Boolean
        get() = hasMusicBrainz
    
    val canFetchTrailers: Boolean
        get() = hasYouTube || hasTMDB
    
    val canFetchReviews: Boolean
        get() = hasOMDb || hasNYT
}
