package com.universalmedialibrary.data.remote.freesound

import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

interface FreesoundService {
    @GET("search/text/")
    suspend fun search(
        @Query("query") query: String,
        @Query("filter") filter: String? = null,
        @Query("sort") sort: String? = null,
        @Query("page") page: Int? = null,
        @Query("page_size") pageSize: Int? = null,
        @Query("fields") fields: String? = null
    ): FreesoundSearchResponse

    @GET("sounds/{sound_id}/")
    suspend fun getSound(
        @Path("sound_id") soundId: Int
    ): FreesoundSound

    @GET("sounds/{sound_id}/similar/")
    suspend fun getSimilarSounds(
        @Path("sound_id") soundId: Int,
        @Query("page") page: Int? = null,
        @Query("page_size") pageSize: Int? = null,
        @Query("fields") fields: String? = null
    ): FreesoundSearchResponse
}
