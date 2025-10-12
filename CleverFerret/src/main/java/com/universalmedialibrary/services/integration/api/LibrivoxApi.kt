package com.universalmedialibrary.services.integration.api

import kotlinx.serialization.Serializable
import retrofit2.http.GET
import retrofit2.http.Query

/**
 * Librivox API for free public domain audiobooks
 * Documentation: https://librivox.org/api/info
 */
interface LibrivoxApi {
    
    @GET("audiobooks")
    suspend fun searchAudiobooks(
        @Query("title") title: String? = null,
        @Query("author") author: String? = null,
        @Query("genre") genre: String? = null,
        @Query("limit") limit: Int = 50,
        @Query("offset") offset: Int = 0,
        @Query("format") format: String = "json"
    ): LibrivoxResponse
}

@Serializable
data class LibrivoxResponse(
    val books: List<LibrivoxBook>
)

@Serializable
data class LibrivoxBook(
    val id: String,
    val title: String,
    val description: String? = null,
    val authors: List<LibrivoxAuthor> = emptyList(),
    val url_rss: String,
    val url_zip_file: String? = null,
    val url_project: String? = null,
    val url_librivox: String? = null,
    val url_other: String? = null,
    val totaltime: String? = null,
    val totaltimesecs: Int = 0,
    val language: String? = null
)

@Serializable
data class LibrivoxAuthor(
    val id: String,
    val first_name: String? = null,
    val last_name: String? = null,
    val dob: String? = null,
    val dod: String? = null
)