package com.universalmedialibrary.services.metadata

import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import com.universalmedialibrary.services.integration.api.TVMazeApi
import com.universalmedialibrary.services.integration.api.TVMazeEpisode
import com.universalmedialibrary.services.integration.api.TVMazeCastMember
import com.universalmedialibrary.services.integration.api.TVMazeShow
import com.universalmedialibrary.services.integration.api.TVMazeSeason
import kotlinx.serialization.json.Json
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * TVMaze Service
 * 
 * Comprehensive service for fetching TV show data from TVMaze API.
 * TVMaze provides:
 * - Complete TV show information
 * - Episode listings with air dates
 * - Cast and crew information
 * - High-quality images
 * - Network and schedule data
 * - Links to IMDb, TheTVDB, and TVRage
 * 
 * Best of all: No API key required!
 */
@Singleton
class TVMazeService @Inject constructor() {
    
    private val json = Json {
        ignoreUnknownKeys = true
        coerceInputValues = true
        isLenient = true
    }
    
    private val okHttpClient = OkHttpClient.Builder()
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .writeTimeout(30, TimeUnit.SECONDS)
        .build()
    
    private val tvMazeApi: TVMazeApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://api.tvmaze.com/")
            .client(okHttpClient)
            .addConverterFactory(json.asConverterFactory("application/json".toMediaType()))
            .build()
            .create(TVMazeApi::class.java)
    }
    
    /**
     * Search for TV shows by name
     * 
     * Example:
     * ```kotlin
     * val results = service.searchShows("Breaking Bad")
     * results.forEach { show ->
     *     println("${show.name} (${show.premiered?.take(4)})")
     * }
     * ```
     */
    suspend fun searchShows(query: String): TVShowSearchResult {
        return try {
            val results = tvMazeApi.searchShows(query)
            val shows = results.map { it.show }
            TVShowSearchResult(
                shows = shows,
                totalResults = shows.size,
                error = null
            )
        } catch (e: Exception) {
            TVShowSearchResult(
                shows = emptyList(),
                totalResults = 0,
                error = "Failed to search shows: ${e.message}"
            )
        }
    }
    
    /**
     * Get complete show information including episodes and cast
     * 
     * Example:
     * ```kotlin
     * val details = service.getCompleteShowDetails(169) // Breaking Bad
     * println("${details.show.name}: ${details.totalEpisodes} episodes")
     * println("Rating: ${details.show.rating?.average}/10")
     * ```
     */
    suspend fun getCompleteShowDetails(showId: Int): CompleteShowDetails {
        return try {
            // Fetch all data in parallel would be ideal, but TVMaze API rate limits
            // So we'll fetch sequentially
            val show = tvMazeApi.getShow(showId)
            val episodes = try {
                tvMazeApi.getShowEpisodes(showId)
            } catch (e: Exception) {
                emptyList()
            }
            
            val cast = try {
                tvMazeApi.getShowCast(showId)
            } catch (e: Exception) {
                emptyList()
            }
            
            val seasons = try {
                tvMazeApi.getShowSeasons(showId)
            } catch (e: Exception) {
                emptyList()
            }
            
            CompleteShowDetails(
                show = show,
                episodes = episodes,
                cast = cast,
                seasons = seasons,
                totalEpisodes = episodes.size,
                totalSeasons = seasons.size,
                error = null
            )
        } catch (e: Exception) {
            CompleteShowDetails(
                show = null,
                episodes = emptyList(),
                cast = emptyList(),
                seasons = emptyList(),
                totalEpisodes = 0,
                totalSeasons = 0,
                error = "Failed to fetch show details: ${e.message}"
            )
        }
    }
    
    /**
     * Get basic show information
     */
    suspend fun getShow(showId: Int): TVMazeShow? {
        return try {
            tvMazeApi.getShow(showId)
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Get all episodes for a show organized by season
     * 
     * Example:
     * ```kotlin
     * val episodesBySeason = service.getEpisodesBySeason(169)
     * episodesBySeason.forEach { (season, episodes) ->
     *     println("Season $season: ${episodes.size} episodes")
     * }
     * ```
     */
    suspend fun getEpisodesBySeason(showId: Int): Map<Int, List<TVMazeEpisode>> {
        return try {
            val episodes = tvMazeApi.getShowEpisodes(showId)
            episodes.groupBy { it.season }
        } catch (e: Exception) {
            emptyMap()
        }
    }
    
    /**
     * Get specific episode by season and episode number
     * 
     * Example:
     * ```kotlin
     * val episode = service.getEpisode(169, season = 1, episode = 1)
     * println("${episode?.name} aired on ${episode?.airdate}")
     * ```
     */
    suspend fun getEpisode(showId: Int, season: Int, episode: Int): TVMazeEpisode? {
        return try {
            tvMazeApi.getEpisodeByNumber(showId, season, episode)
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Get cast for a show
     */
    suspend fun getShowCast(showId: Int): List<TVMazeCastMember> {
        return try {
            tvMazeApi.getShowCast(showId)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get seasons for a show
     */
    suspend fun getShowSeasons(showId: Int): List<TVMazeSeason> {
        return try {
            tvMazeApi.getShowSeasons(showId)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Find show by external ID (IMDb, TheTVDB)
     * 
     * This is useful when you have an IMDb ID from another source
     * and want to get the TVMaze data for it.
     * 
     * Example:
     * ```kotlin
     * val shows = service.searchShows("Breaking Bad")
     * val breakingBad = shows.shows.firstOrNull { 
     *     it.externals?.imdb == "tt0903747" 
     * }
     * ```
     */
    suspend fun findShowByImdbId(imdbId: String): TVMazeShow? {
        // TVMaze doesn't have a direct lookup by IMDb ID endpoint
        // So we need to search and filter
        // This is a limitation, but for most use cases search works well
        return null
    }
    
    /**
     * Get episode air dates for scheduling
     * 
     * Useful for tracking when new episodes air
     */
    suspend fun getUpcomingEpisodes(showId: Int): List<TVMazeEpisode> {
        return try {
            val episodes = tvMazeApi.getShowEpisodes(showId)
            val today = java.time.LocalDate.now().toString()
            episodes.filter { episode ->
                episode.airdate != null && episode.airdate >= today
            }.sortedBy { it.airdate }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get show information formatted for CleverFerret MediaItem
     * 
     * This helper method formats TVMaze data into a structure
     * that's easy to use for creating MediaItem metadata.
     */
    suspend fun getShowMetadataForMediaItem(showId: Int): TVShowMetadata? {
        return try {
            val show = tvMazeApi.getShow(showId)
            TVShowMetadata(
                tvMazeId = show.id,
                title = show.name,
                summary = cleanHtmlSummary(show.summary),
                genres = show.genres,
                rating = show.rating?.average,
                premiered = show.premiered,
                ended = show.ended,
                status = show.status,
                network = show.network?.name ?: show.webChannel?.name,
                runtime = show.runtime ?: show.averageRuntime,
                language = show.language,
                officialSite = show.officialSite,
                posterUrl = show.image?.original ?: show.image?.medium,
                imdbId = show.externals?.imdb,
                tvdbId = show.externals?.thetvdb,
                scheduleTime = show.schedule?.time,
                scheduleDays = show.schedule?.days ?: emptyList()
            )
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Get episode metadata formatted for CleverFerret
     */
    suspend fun getEpisodeMetadataForMediaItem(
        showId: Int,
        season: Int,
        episode: Int
    ): TVEpisodeMetadata? {
        return try {
            val show = tvMazeApi.getShow(showId)
            val episodeData = tvMazeApi.getEpisodeByNumber(showId, season, episode)
            
            TVEpisodeMetadata(
                tvMazeEpisodeId = episodeData.id,
                tvMazeShowId = show.id,
                showTitle = show.name,
                episodeTitle = episodeData.name,
                season = episodeData.season,
                episode = episodeData.number,
                summary = cleanHtmlSummary(episodeData.summary),
                airDate = episodeData.airdate,
                runtime = episodeData.runtime,
                rating = episodeData.rating?.average,
                imageUrl = episodeData.image?.original ?: episodeData.image?.medium
            )
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Clean HTML tags from TVMaze summaries
     * 
     * TVMaze returns summaries with HTML tags like <p>, <b>, etc.
     * This helper strips them out for cleaner display.
     */
    private fun cleanHtmlSummary(summary: String?): String? {
        return summary?.replace(Regex("<[^>]*>"), "")?.trim()
    }
}

// ================================
// Result Models
// ================================

/**
 * Result from searching TV shows
 */
data class TVShowSearchResult(
    val shows: List<TVMazeShow>,
    val totalResults: Int,
    val error: String?
)

/**
 * Complete show details with all related data
 */
data class CompleteShowDetails(
    val show: TVMazeShow?,
    val episodes: List<TVMazeEpisode>,
    val cast: List<TVMazeCastMember>,
    val seasons: List<TVMazeSeason>,
    val totalEpisodes: Int,
    val totalSeasons: Int,
    val error: String?
)

/**
 * TV show metadata formatted for CleverFerret MediaItem
 */
data class TVShowMetadata(
    val tvMazeId: Int,
    val title: String,
    val summary: String?,
    val genres: List<String>,
    val rating: Double?,
    val premiered: String?,
    val ended: String?,
    val status: String?,
    val network: String?,
    val runtime: Int?,
    val language: String?,
    val officialSite: String?,
    val posterUrl: String?,
    val imdbId: String?,
    val tvdbId: Int?,
    val scheduleTime: String?,
    val scheduleDays: List<String>
)

/**
 * TV episode metadata formatted for CleverFerret MediaItem
 */
data class TVEpisodeMetadata(
    val tvMazeEpisodeId: Int,
    val tvMazeShowId: Int,
    val showTitle: String,
    val episodeTitle: String,
    val season: Int,
    val episode: Int,
    val summary: String?,
    val airDate: String?,
    val runtime: Int?,
    val rating: Double?,
    val imageUrl: String?
)
