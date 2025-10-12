package com.universalmedialibrary.services.integration.api

import kotlinx.serialization.Serializable
import retrofit2.http.GET
import retrofit2.http.Query

/**
 * iTunes Search API for Apple Podcasts
 * Documentation: https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/
 */
interface ApplePodcastsApi {
    
    @GET("search")
    suspend fun searchPodcasts(
        @Query("term") term: String,
        @Query("media") media: String = "podcast",
        @Query("limit") limit: Int = 25,
        @Query("country") country: String = "US"
    ): ApplePodcastResponse
}

@Serializable
data class ApplePodcastResponse(
    val resultCount: Int,
    val results: List<ApplePodcast>
)

@Serializable
data class ApplePodcast(
    val trackId: Long,
    val trackName: String,
    val artistName: String,
    val collectionName: String? = null,
    val artworkUrl30: String? = null,
    val artworkUrl60: String? = null,
    val artworkUrl100: String? = null,
    val artworkUrl600: String? = null,
    val feedUrl: String,
    val trackCount: Int = 0,
    val primaryGenreName: String? = null,
    val genres: List<String> = emptyList(),
    val releaseDate: String? = null,
    val contentAdvisoryRating: String? = null
)