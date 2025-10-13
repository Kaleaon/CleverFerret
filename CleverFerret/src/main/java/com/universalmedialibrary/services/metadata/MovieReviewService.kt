package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Query
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Movie Review Service
 * 
 * Fetches movie reviews and ratings from multiple sources:
 * - OMDb (includes Rotten Tomatoes ratings)
 * - New York Times Movie Reviews API
 * - TMDB user ratings
 */
@Singleton
class MovieReviewService @Inject constructor(
    private val apiKeyRepository: APIKeyRepository
) {

    private val okHttpClient = OkHttpClient.Builder()
        .connectTimeout(10, TimeUnit.SECONDS)
        .readTimeout(10, TimeUnit.SECONDS)
        .addInterceptor(HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BASIC
        })
        .build()

    // OMDb API (includes Rotten Tomatoes ratings)
    private val omdbApi = Retrofit.Builder()
        .baseUrl("https://www.omdbapi.com/")
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        .create(OMDbReviewApi::class.java)

    // New York Times Movie Reviews API
    private val nytApi = Retrofit.Builder()
        .baseUrl("https://api.nytimes.com/")
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        .create(NYTReviewsApi::class.java)

    /**
     * Fetch comprehensive reviews and ratings for a movie
     * 
     * @param title Movie title
     * @param year Release year (optional)
     * @param imdbId IMDb ID (optional, more accurate)
     * @return Comprehensive review data
     */
    suspend fun fetchMovieReviews(
        title: String,
        year: Int? = null,
        imdbId: String? = null
    ): MovieReviewResult = withContext(Dispatchers.IO) {
        val reviews = mutableListOf<MovieReview>()
        var rottenTomatoesRating: String? = null
        var rottenTomatoesMeter: String? = null
        var metacriticScore: String? = null
        var imdbRating: String? = null

        try {
            // Fetch from OMDb (includes Rotten Tomatoes & Metacritic ratings)
            val omdbKey = apiKeyRepository.getAPIKeyValue("omdb")
            if (!omdbKey.isNullOrEmpty()) {
                val omdbData = fetchOMDbReviews(title, year, imdbId, omdbKey)
                rottenTomatoesRating = omdbData.rottenTomatoesRating
                rottenTomatoesMeter = omdbData.rottenTomatoesMeter
                metacriticScore = omdbData.metacriticScore
                imdbRating = omdbData.imdbRating
                
                omdbData.reviews.forEach { reviews.add(it) }
            }

            // Fetch from New York Times
            val nytKey = apiKeyRepository.getAPIKeyValue("nyt")
            if (!nytKey.isNullOrEmpty()) {
                val nytReviews = fetchNYTReviews(title, nytKey)
                reviews.addAll(nytReviews)
            }

            MovieReviewResult(
                reviews = reviews,
                rottenTomatoesRating = rottenTomatoesRating,
                rottenTomatoesMeter = rottenTomatoesMeter,
                metacriticScore = metacriticScore,
                imdbRating = imdbRating,
                sources = buildList {
                    if (!omdbKey.isNullOrEmpty()) add("OMDb")
                    if (!nytKey.isNullOrEmpty()) add("NYT")
                }
            )
        } catch (e: Exception) {
            MovieReviewResult(
                reviews = emptyList(),
                sources = emptyList(),
                error = e.message
            )
        }
    }

    /**
     * Fetch reviews from OMDb (includes aggregated ratings)
     */
    private suspend fun fetchOMDbReviews(
        title: String,
        year: Int?,
        imdbId: String?,
        apiKey: String
    ): OMDbReviewData {
        return try {
            val response = when {
                !imdbId.isNullOrEmpty() -> omdbApi.getByImdbId(apiKey, imdbId)
                year != null -> omdbApi.searchByTitleAndYear(apiKey, title, year.toString())
                else -> omdbApi.searchByTitle(apiKey, title)
            }

            if (response.Response == "True") {
                val reviews = mutableListOf<MovieReview>()

                // IMDb review
                response.imdbRating?.let { rating ->
                    reviews.add(
                        MovieReview(
                            author = "IMDb Users",
                            rating = rating,
                            summary = "IMDb Rating: $rating/10",
                            source = "IMDb",
                            url = response.imdbID?.let { "https://www.imdb.com/title/$it/" }
                        )
                    )
                }

                // Extract Rotten Tomatoes from Ratings array
                val rtRating = response.Ratings?.find { it.Source == "Rotten Tomatoes" }
                
                OMDbReviewData(
                    reviews = reviews,
                    rottenTomatoesRating = rtRating?.Value,
                    rottenTomatoesMeter = rtRating?.Value?.removeSuffix("%"),
                    metacriticScore = response.Metascore,
                    imdbRating = response.imdbRating
                )
            } else {
                OMDbReviewData()
            }
        } catch (e: Exception) {
            OMDbReviewData()
        }
    }

    /**
     * Fetch reviews from New York Times
     */
    private suspend fun fetchNYTReviews(query: String, apiKey: String): List<MovieReview> {
        return try {
            val response = nytApi.searchReviews(apiKey, query)
            response.results?.map { review ->
                MovieReview(
                    author = review.byline ?: "NYT Critic",
                    rating = null,
                    summary = review.summary_short ?: review.headline,
                    fullReview = review.summary_short,
                    source = "New York Times",
                    url = review.link?.url,
                    publishedDate = review.publication_date
                )
            } ?: emptyList()
        } catch (e: Exception) {
            emptyList()
        }
    }
}

// API Interfaces

interface OMDbReviewApi {
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

interface NYTReviewsApi {
    @GET("svc/movies/v2/reviews/search.json")
    suspend fun searchReviews(
        @Query("api-key") apiKey: String,
        @Query("query") query: String
    ): NYTReviewsResponse
}

// Data Classes

data class MovieReview(
    val author: String,
    val rating: String? = null,
    val summary: String?,
    val fullReview: String? = null,
    val source: String,
    val url: String? = null,
    val publishedDate: String? = null
)

data class MovieReviewResult(
    val reviews: List<MovieReview>,
    val rottenTomatoesRating: String? = null,
    val rottenTomatoesMeter: String? = null,
    val metacriticScore: String? = null,
    val imdbRating: String? = null,
    val sources: List<String>,
    val error: String? = null
)

private data class OMDbReviewData(
    val reviews: List<MovieReview> = emptyList(),
    val rottenTomatoesRating: String? = null,
    val rottenTomatoesMeter: String? = null,
    val metacriticScore: String? = null,
    val imdbRating: String? = null
)

// Data classes defined in MetadataServiceModels.kt
