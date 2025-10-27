package com.universalmedialibrary.services.integration.api

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

/**
 * TVMaze API
 * Documentation: https://www.tvmaze.com/api
 * 
 * TVMaze is a comprehensive TV show database with:
 * - Detailed show information
 * - Complete episode listings
 * - Cast and crew information
 * - Show images and posters
 * - Schedule and airing information
 * - No API key required!
 */
interface TVMazeApi {
    
    /**
     * Search for TV shows by name
     * @param query The search query
     * @return List of search results with show information
     */
    @GET("search/shows")
    suspend fun searchShows(
        @Query("q") query: String
    ): List<TVMazeSearchResult>
    
    /**
     * Get single show information by TVMaze ID
     * @param showId The TVMaze show ID
     * @param embed Optional embed parameters (episodes, cast, crew, etc.)
     */
    @GET("shows/{id}")
    suspend fun getShow(
        @Path("id") showId: Int,
        @Query("embed[]") embed: List<String>? = null
    ): TVMazeShow
    
    /**
     * Get show information with embedded episodes
     * @param showId The TVMaze show ID
     */
    @GET("shows/{id}?embed=episodes")
    suspend fun getShowWithEpisodes(
        @Path("id") showId: Int
    ): TVMazeShowWithEpisodes
    
    /**
     * Get show information with embedded cast
     * @param showId The TVMaze show ID
     */
    @GET("shows/{id}?embed=cast")
    suspend fun getShowWithCast(
        @Path("id") showId: Int
    ): TVMazeShowWithCast
    
    /**
     * Get all episodes for a show
     * @param showId The TVMaze show ID
     */
    @GET("shows/{id}/episodes")
    suspend fun getShowEpisodes(
        @Path("id") showId: Int
    ): List<TVMazeEpisode>
    
    /**
     * Get specific episode by season and episode number
     * @param showId The TVMaze show ID
     * @param season Season number
     * @param episode Episode number
     */
    @GET("shows/{id}/episodebynumber")
    suspend fun getEpisodeByNumber(
        @Path("id") showId: Int,
        @Query("season") season: Int,
        @Query("number") episode: Int
    ): TVMazeEpisode
    
    /**
     * Get episodes for a specific season
     * @param seasonId The TVMaze season ID
     */
    @GET("seasons/{id}/episodes")
    suspend fun getSeasonEpisodes(
        @Path("id") seasonId: Int
    ): List<TVMazeEpisode>
    
    /**
     * Get cast for a show
     * @param showId The TVMaze show ID
     */
    @GET("shows/{id}/cast")
    suspend fun getShowCast(
        @Path("id") showId: Int
    ): List<TVMazeCastMember>
    
    /**
     * Get crew for a show
     * @param showId The TVMaze show ID
     */
    @GET("shows/{id}/crew")
    suspend fun getShowCrew(
        @Path("id") showId: Int
    ): List<TVMazeCrewMember>
    
    /**
     * Get show images
     * @param showId The TVMaze show ID
     */
    @GET("shows/{id}/images")
    suspend fun getShowImages(
        @Path("id") showId: Int
    ): List<TVMazeImage>
    
    /**
     * Get show seasons
     * @param showId The TVMaze show ID
     */
    @GET("shows/{id}/seasons")
    suspend fun getShowSeasons(
        @Path("id") showId: Int
    ): List<TVMazeSeason>
    
    /**
     * Lookup show by IMDb ID
     * @param imdbId The IMDb ID (e.g., "tt0903747")
     */
    @GET("lookup/shows")
    suspend fun lookupShowByImdb(
        @Query("imdb") imdbId: String
    ): TVMazeShow
}

// ================================
// Search Result Models
// ================================

@Serializable
data class TVMazeSearchResult(
    val score: Double,
    val show: TVMazeShow
)

// ================================
// Show Models
// ================================

@Serializable
data class TVMazeShow(
    val id: Int,
    val url: String? = null,
    val name: String,
    val type: String? = null,
    val language: String? = null,
    val genres: List<String> = emptyList(),
    val status: String? = null,
    val runtime: Int? = null,
    @SerialName("averageRuntime") val averageRuntime: Int? = null,
    val premiered: String? = null,
    val ended: String? = null,
    val officialSite: String? = null,
    val schedule: TVMazeSchedule? = null,
    val rating: TVMazeRating? = null,
    val weight: Int? = null,
    val network: TVMazeNetwork? = null,
    @SerialName("webChannel") val webChannel: TVMazeWebChannel? = null,
    @SerialName("dvdCountry") val dvdCountry: TVMazeCountry? = null,
    val externals: TVMazeExternals? = null,
    val image: TVMazeImage? = null,
    val summary: String? = null,
    val updated: Long? = null,
    @SerialName("_links") val links: TVMazeLinks? = null
)

@Serializable
data class TVMazeShowWithEpisodes(
    val id: Int,
    val url: String? = null,
    val name: String,
    val type: String? = null,
    val language: String? = null,
    val genres: List<String> = emptyList(),
    val status: String? = null,
    val runtime: Int? = null,
    @SerialName("averageRuntime") val averageRuntime: Int? = null,
    val premiered: String? = null,
    val ended: String? = null,
    val officialSite: String? = null,
    val schedule: TVMazeSchedule? = null,
    val rating: TVMazeRating? = null,
    val weight: Int? = null,
    val network: TVMazeNetwork? = null,
    @SerialName("webChannel") val webChannel: TVMazeWebChannel? = null,
    @SerialName("dvdCountry") val dvdCountry: TVMazeCountry? = null,
    val externals: TVMazeExternals? = null,
    val image: TVMazeImage? = null,
    val summary: String? = null,
    val updated: Long? = null,
    @SerialName("_links") val links: TVMazeLinks? = null,
    @SerialName("_embedded") val embedded: TVMazeEmbeddedEpisodes? = null
)

@Serializable
data class TVMazeShowWithCast(
    val id: Int,
    val url: String? = null,
    val name: String,
    val type: String? = null,
    val language: String? = null,
    val genres: List<String> = emptyList(),
    val status: String? = null,
    val runtime: Int? = null,
    @SerialName("averageRuntime") val averageRuntime: Int? = null,
    val premiered: String? = null,
    val ended: String? = null,
    val officialSite: String? = null,
    val schedule: TVMazeSchedule? = null,
    val rating: TVMazeRating? = null,
    val weight: Int? = null,
    val network: TVMazeNetwork? = null,
    @SerialName("webChannel") val webChannel: TVMazeWebChannel? = null,
    @SerialName("dvdCountry") val dvdCountry: TVMazeCountry? = null,
    val externals: TVMazeExternals? = null,
    val image: TVMazeImage? = null,
    val summary: String? = null,
    val updated: Long? = null,
    @SerialName("_links") val links: TVMazeLinks? = null,
    @SerialName("_embedded") val embedded: TVMazeEmbeddedCast? = null
)

// ================================
// Episode Models
// ================================

@Serializable
data class TVMazeEpisode(
    val id: Int,
    val url: String? = null,
    val name: String,
    val season: Int,
    val number: Int,
    val type: String? = null,
    val airdate: String? = null,
    val airtime: String? = null,
    val airstamp: String? = null,
    val runtime: Int? = null,
    val rating: TVMazeRating? = null,
    val image: TVMazeImage? = null,
    val summary: String? = null,
    @SerialName("_links") val links: TVMazeLinks? = null
)

// ================================
// Season Models
// ================================

@Serializable
data class TVMazeSeason(
    val id: Int,
    val url: String? = null,
    val number: Int,
    val name: String? = null,
    @SerialName("episodeOrder") val episodeOrder: Int? = null,
    val premiereDate: String? = null,
    val endDate: String? = null,
    val network: TVMazeNetwork? = null,
    @SerialName("webChannel") val webChannel: TVMazeWebChannel? = null,
    val image: TVMazeImage? = null,
    val summary: String? = null,
    @SerialName("_links") val links: TVMazeLinks? = null
)

// ================================
// Cast and Crew Models
// ================================

@Serializable
data class TVMazeCastMember(
    val person: TVMazePerson,
    val character: TVMazeCharacter,
    val self: Boolean = false,
    val voice: Boolean = false
)

@Serializable
data class TVMazeCrewMember(
    val type: String,
    val person: TVMazePerson
)

@Serializable
data class TVMazePerson(
    val id: Int,
    val url: String? = null,
    val name: String,
    val country: TVMazeCountry? = null,
    val birthday: String? = null,
    val deathday: String? = null,
    val gender: String? = null,
    val image: TVMazeImage? = null,
    val updated: Long? = null,
    @SerialName("_links") val links: TVMazeLinks? = null
)

@Serializable
data class TVMazeCharacter(
    val id: Int,
    val url: String? = null,
    val name: String,
    val image: TVMazeImage? = null,
    @SerialName("_links") val links: TVMazeLinks? = null
)

// ================================
// Supporting Models
// ================================

@Serializable
data class TVMazeSchedule(
    val time: String? = null,
    val days: List<String> = emptyList()
)

@Serializable
data class TVMazeRating(
    val average: Double? = null
)

@Serializable
data class TVMazeNetwork(
    val id: Int,
    val name: String,
    val country: TVMazeCountry? = null,
    val officialSite: String? = null
)

@Serializable
data class TVMazeWebChannel(
    val id: Int,
    val name: String,
    val country: TVMazeCountry? = null,
    val officialSite: String? = null
)

@Serializable
data class TVMazeCountry(
    val name: String? = null,
    val code: String? = null,
    val timezone: String? = null
)

@Serializable
data class TVMazeExternals(
    val tvrage: Int? = null,
    val thetvdb: Int? = null,
    val imdb: String? = null
)

@Serializable
data class TVMazeImage(
    val medium: String? = null,
    val original: String? = null,
    val type: String? = null,
    val resolutions: TVMazeImageResolutions? = null
)

@Serializable
data class TVMazeImageResolutions(
    val original: TVMazeImageInfo? = null,
    val medium: TVMazeImageInfo? = null
)

@Serializable
data class TVMazeImageInfo(
    val url: String? = null,
    val width: Int? = null,
    val height: Int? = null
)

@Serializable
data class TVMazeLinks(
    val self: TVMazeLink? = null,
    val previousepisode: TVMazeLink? = null,
    val nextepisode: TVMazeLink? = null
)

@Serializable
data class TVMazeLink(
    val href: String
)

@Serializable
data class TVMazeEmbeddedEpisodes(
    val episodes: List<TVMazeEpisode> = emptyList()
)

@Serializable
data class TVMazeEmbeddedCast(
    val cast: List<TVMazeCastMember> = emptyList()
)
