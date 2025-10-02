package com.universalmedialibrary.services.integration.emby

import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.http.Path
import retrofit2.http.Query

interface EmbyApi {
    @GET("/Users/Me")
    suspend fun getCurrentUser(@Header("X-Emby-Token") token: String): Response<Map<String, Any>>

    @GET("/Users/{userId}/Items")
    suspend fun getLibraryItems(
        @Path("userId") userId: String,
        @Header("X-Emby-Token") token: String,
        @Query("IncludeItemTypes") types: String = "Movie,Series,Book",
        @Query("StartIndex") start: Int = 0,
        @Query("Limit") limit: Int = 50
    ): Response<Map<String, Any>>
}

