package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Movie Trailer Service
 * 
 * Fetches movie trailers from YouTube and TMDB APIs
 */
@Singleton
class MovieTrailerService @Inject constructor(
    private val apiKeyRepository: APIKeyRepository
) {

    private val okHttpClient = OkHttpClient.Builder()
        .connectTimeout(10, TimeUnit.SECONDS)
        .readTimeout(10, TimeUnit.SECONDS)
        .addInterceptor(HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BASIC
        })
        .build()

    // YouTube Data API
    private val youtubeApi = Retrofit.Builder()
        .baseUrl("https://www.googleapis.com/youtube/v3/")
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        .create(YouTubeApi::class.java)

    // TMDB API
    private val tmdbApi = Retrofit.Builder()
        .baseUrl("https://api.themoviedb.org/3/")
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        .create(TMDBTrailerApi::class.java)

    /**
     * Fetch trailers for a movie
     * 
     * @param movieTitle Movie title
     * @param year Release year (optional)
     * @param tmdbId TMDB movie ID (optional, more accurate)
     * @return List of trailers
     */
    suspend fun fetchMovieTrailers(
        movieTitle: String,
        year: Int? = null,
        tmdbId: String? = null
    ): TrailerResult = withContext(Dispatchers.IO) {
        val trailers = mutableListOf<MovieTrailer>()

        try {
            // Try TMDB first if we have the ID
            val tmdbKey = apiKeyRepository.getAPIKeyValue("tmdb")
            if (!tmdbKey.isNullOrEmpty() && !tmdbId.isNullOrEmpty()) {
                val tmdbTrailers = fetchTMDBTrailers(tmdbId, tmdbKey)
                trailers.addAll(tmdbTrailers)
            }

            // Try YouTube API
            val youtubeKey = apiKeyRepository.getAPIKeyValue("youtube")
            if (!youtubeKey.isNullOrEmpty()) {
                val searchQuery = buildString {
                    append(movieTitle)
                    append(" trailer")
                    year?.let { append(" $it") }
                    append(" official")
                }
                val youtubeTrailers = fetchYouTubeTrailers(searchQuery, youtubeKey)
                trailers.addAll(youtubeTrailers)
            }

            TrailerResult(
                trailers = trailers,
                sources = buildList {
                    if (!tmdbKey.isNullOrEmpty()) add("TMDB")
                    if (!youtubeKey.isNullOrEmpty()) add("YouTube")
                }
            )
        } catch (e: Exception) {
            TrailerResult(
                trailers = emptyList(),
                sources = emptyList(),
                error = e.message
            )
        }
    }

    /**
     * Fetch trailers from TMDB
     */
    private suspend fun fetchTMDBTrailers(movieId: String, apiKey: String): List<MovieTrailer> {
        return try {
            val response = tmdbApi.getMovieVideos(movieId, apiKey)
            response.results?.filter { it.type == "Trailer" && it.site == "YouTube" }?.map { video ->
                MovieTrailer(
                    title = video.name ?: "Trailer",
                    url = "https://www.youtube.com/watch?v=${video.key}",
                    thumbnailUrl = "https://img.youtube.com/vi/${video.key}/maxresdefault.jpg",
                    source = "TMDB",
                    videoId = video.key,
                    duration = null,
                    quality = video.size,
                    isOfficial = video.official ?: false
                )
            } ?: emptyList()
        } catch (e: Exception) {
            emptyList()
        }
    }

    /**
     * Fetch trailers from YouTube
     */
    private suspend fun fetchYouTubeTrailers(query: String, apiKey: String): List<MovieTrailer> {
        return try {
            val response = youtubeApi.searchVideos(
                apiKey = apiKey,
                query = query,
                part = "snippet",
                type = "video",
                videoDefinition = "high",
                maxResults = 10
            )

            response.items?.map { item ->
                MovieTrailer(
                    title = item.snippet?.title ?: "Trailer",
                    url = "https://www.youtube.com/watch?v=${item.id?.videoId}",
                    thumbnailUrl = item.snippet?.thumbnails?.high?.url
                        ?: item.snippet?.thumbnails?.default?.url,
                    source = "YouTube",
                    videoId = item.id?.videoId,
                    duration = null,
                    quality = null,
                    isOfficial = item.snippet?.title?.contains("official", ignoreCase = true) ?: false
                )
            } ?: emptyList()
        } catch (e: Exception) {
            emptyList()
        }
    }
}

// API Interfaces

interface YouTubeApi {
    @GET("search")
    suspend fun searchVideos(
        @Query("key") apiKey: String,
        @Query("q") query: String,
        @Query("part") part: String = "snippet",
        @Query("type") type: String = "video",
        @Query("videoDefinition") videoDefinition: String = "high",
        @Query("maxResults") maxResults: Int = 10
    ): YouTubeSearchResponse
}

interface TMDBTrailerApi {
    @GET("movie/{movie_id}/videos")
    suspend fun getMovieVideos(
        @Path("movie_id") movieId: String,
        @Query("api_key") apiKey: String
    ): TMDBVideosResponse
}

// Data Classes

data class MovieTrailer(
    val title: String,
    val url: String,
    val thumbnailUrl: String?,
    val source: String,
    val videoId: String?,
    val duration: Int? = null,
    val quality: Int? = null,
    val isOfficial: Boolean = false
)

data class TrailerResult(
    val trailers: List<MovieTrailer>,
    val sources: List<String>,
    val error: String? = null
)

data class YouTubeSearchResponse(
    val items: List<YouTubeSearchItem>?
)

data class YouTubeSearchItem(
    val id: YouTubeVideoId?,
    val snippet: YouTubeSnippet?
)

data class YouTubeVideoId(
    val videoId: String?
)

data class YouTubeSnippet(
    val title: String?,
    val thumbnails: YouTubeThumbnails?
)

data class YouTubeThumbnails(
    val default: YouTubeThumbnail?,
    val medium: YouTubeThumbnail?,
    val high: YouTubeThumbnail?,
    val maxres: YouTubeThumbnail?
)

data class YouTubeThumbnail(
    val url: String?
)

data class TMDBVideosResponse(
    val results: List<TMDBVideo>?
)

data class TMDBVideo(
    val key: String?,
    val name: String?,
    val site: String?,
    val type: String?,
    val size: Int?,
    val official: Boolean?
)
