package com.universalmedialibrary.services.dictionary

import retrofit2.http.GET
import retrofit2.http.Path

interface FreeDictionaryApi {
    @GET("entries/en/{word}")
    suspend fun getDefinition(@Path("word") word: String): List<WordDefinition>
}
