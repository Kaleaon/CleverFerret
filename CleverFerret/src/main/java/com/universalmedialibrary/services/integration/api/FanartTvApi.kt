package com.universalmedialibrary.services.integration.api

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

/**
 * Fanart.tv API
 * Documentation: https://fanarttv.docs.apiary.io/#
 * 
 * Provides high-quality fanart for movies, TV shows, music artists, and albums
 */
interface FanartTvApi {
    
    /**
     * Get fanart for a movie by TMDb ID
     * @param movieId The Movie Database (TMDb) movie ID
     * @param apiKey Your Fanart.tv API key
     */
    @GET("movies/{movie_id}")
    suspend fun getMovieFanart(
        @Path("movie_id") movieId: String,
        @Query("api_key") apiKey: String
    ): FanartTvMovieResponse
    
    /**
     * Get fanart for a TV show by TheTVDB ID
     * @param tvId The TVDB show ID
     * @param apiKey Your Fanart.tv API key
     */
    @GET("tv/{tv_id}")
    suspend fun getTvFanart(
        @Path("tv_id") tvId: String,
        @Query("api_key") apiKey: String
    ): FanartTvTvResponse
    
    /**
     * Get fanart for a music artist by MusicBrainz ID
     * @param artistId The MusicBrainz artist ID
     * @param apiKey Your Fanart.tv API key
     */
    @GET("music/{artist_id}")
    suspend fun getArtistFanart(
        @Path("artist_id") artistId: String,
        @Query("api_key") apiKey: String
    ): FanartTvArtistResponse
    
    /**
     * Get fanart for a music album by MusicBrainz release-group ID
     * @param albumId The MusicBrainz release-group ID
     * @param apiKey Your Fanart.tv API key
     */
    @GET("music/albums/{album_id}")
    suspend fun getAlbumFanart(
        @Path("album_id") albumId: String,
        @Query("api_key") apiKey: String
    ): FanartTvAlbumResponse
    
    /**
     * Get the latest fanart added (all types)
     * @param apiKey Your Fanart.tv API key
     * @param date Optional date in format YYYY-MM-DD
     */
    @GET("music/latest")
    suspend fun getLatestFanart(
        @Query("api_key") apiKey: String,
        @Query("date") date: String? = null
    ): FanartTvLatestResponse
}

/**
 * Base image data class for fanart images
 */
@Serializable
data class FanartImage(
    val id: String,
    val url: String,
    val lang: String,
    val likes: String,
    @SerialName("disc_type") val discType: String? = null,
    @SerialName("disc_number") val discNumber: String? = null
)

/**
 * Movie fanart response
 */
@Serializable
data class FanartTvMovieResponse(
    val name: String,
    @SerialName("tmdb_id") val tmdbId: String,
    @SerialName("imdb_id") val imdbId: String? = null,
    
    // Posters and artwork
    @SerialName("movieposter") val moviePosters: List<FanartImage>? = null,
    @SerialName("moviebackground") val movieBackgrounds: List<FanartImage>? = null,
    @SerialName("hdmovielogo") val hdMovieLogos: List<FanartImage>? = null,
    @SerialName("hdmovieclearart") val hdMovieClearArt: List<FanartImage>? = null,
    @SerialName("movielogo") val movieLogos: List<FanartImage>? = null,
    @SerialName("moviedisc") val movieDiscs: List<FanartImage>? = null,
    @SerialName("moviebanner") val movieBanners: List<FanartImage>? = null,
    @SerialName("moviethumb") val movieThumbs: List<FanartImage>? = null,
    @SerialName("movieart") val movieArt: List<FanartImage>? = null
)

/**
 * TV show fanart response
 */
@Serializable
data class FanartTvTvResponse(
    val name: String,
    @SerialName("thetvdb_id") val thetvdbId: String,
    
    // TV show artwork
    @SerialName("hdtvlogo") val hdTvLogos: List<FanartImage>? = null,
    @SerialName("clearlogo") val clearLogos: List<FanartImage>? = null,
    @SerialName("hdclearart") val hdClearArt: List<FanartImage>? = null,
    @SerialName("clearart") val clearArt: List<FanartImage>? = null,
    @SerialName("showbackground") val showBackgrounds: List<FanartImage>? = null,
    @SerialName("tvthumb") val tvThumbs: List<FanartImage>? = null,
    @SerialName("seasonposter") val seasonPosters: List<FanartImage>? = null,
    @SerialName("seasonthumb") val seasonThumbs: List<FanartImage>? = null,
    @SerialName("tvposter") val tvPosters: List<FanartImage>? = null,
    @SerialName("tvbanner") val tvBanners: List<FanartImage>? = null,
    @SerialName("characterart") val characterArt: List<FanartImage>? = null
)

/**
 * Music artist fanart response
 */
@Serializable
data class FanartTvArtistResponse(
    val name: String,
    @SerialName("mbid_id") val mbidId: String,
    
    // Artist artwork
    @SerialName("artistbackground") val artistBackgrounds: List<FanartImage>? = null,
    @SerialName("artistthumb") val artistThumbs: List<FanartImage>? = null,
    @SerialName("hdmusiclogo") val hdMusicLogos: List<FanartImage>? = null,
    @SerialName("musiclogo") val musicLogos: List<FanartImage>? = null,
    @SerialName("musicbanner") val musicBanners: List<FanartImage>? = null,
    
    // Albums
    val albums: Map<String, FanartTvAlbumArt>? = null
)

/**
 * Album artwork within artist response
 */
@Serializable
data class FanartTvAlbumArt(
    @SerialName("albumcover") val albumCovers: List<FanartImage>? = null,
    @SerialName("cdart") val cdArt: List<FanartImage>? = null
)

/**
 * Music album fanart response
 */
@Serializable
data class FanartTvAlbumResponse(
    val name: String? = null,
    @SerialName("mbid_id") val mbidId: String? = null,
    
    @SerialName("albumcover") val albumCovers: List<FanartImage>? = null,
    @SerialName("cdart") val cdArt: List<FanartImage>? = null
)

/**
 * Latest fanart response
 */
@Serializable
data class FanartTvLatestResponse(
    val movies: List<String>? = null,
    val music: List<String>? = null,
    val tv: List<String>? = null
)
