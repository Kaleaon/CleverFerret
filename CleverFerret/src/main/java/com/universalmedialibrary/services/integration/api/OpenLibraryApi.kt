package com.universalmedialibrary.services.integration.api

import kotlinx.serialization.Serializable
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

/**
 * Open Library API for book metadata
 * Documentation: https://openlibrary.org/developers/api
 */
interface OpenLibraryApi {
    
    @GET("search.json")
    suspend fun searchBooks(
        @Query("q") query: String,
        @Query("limit") limit: Int = 20,
        @Query("page") page: Int = 1
    ): OpenLibrarySearchResponse
    
    @GET("isbn/{isbn}.json")
    suspend fun getBookByIsbn(
        @Path("isbn") isbn: String
    ): OpenLibraryBook
    
    @GET("works/{work_id}.json")
    suspend fun getWorkDetails(
        @Path("work_id") workId: String
    ): OpenLibraryWork
}

@Serializable
data class OpenLibrarySearchResponse(
    val numFound: Int,
    val start: Int,
    val docs: List<OpenLibrarySearchResult>
)

@Serializable
data class OpenLibrarySearchResult(
    val key: String,
    val title: String,
    val author_name: List<String> = emptyList(),
    val first_publish_year: Int? = null,
    val isbn: List<String> = emptyList(),
    val publisher: List<String> = emptyList(),
    val language: List<String> = emptyList(),
    val cover_i: Long? = null,
    val edition_count: Int = 0,
    val subject: List<String> = emptyList()
)

@Serializable
data class OpenLibraryBook(
    val title: String,
    val authors: List<OpenLibraryAuthorRef> = emptyList(),
    val publishers: List<String> = emptyList(),
    val publish_date: String? = null,
    val isbn_10: List<String> = emptyList(),
    val isbn_13: List<String> = emptyList(),
    val number_of_pages: Int? = null,
    val subjects: List<String> = emptyList(),
    val covers: List<Long> = emptyList()
)

@Serializable
data class OpenLibraryWork(
    val title: String,
    val description: String? = null,
    val authors: List<OpenLibraryAuthorRef> = emptyList(),
    val subjects: List<String> = emptyList(),
    val covers: List<Long> = emptyList(),
    val first_publish_date: String? = null
)

@Serializable
data class OpenLibraryAuthorRef(
    val key: String
)