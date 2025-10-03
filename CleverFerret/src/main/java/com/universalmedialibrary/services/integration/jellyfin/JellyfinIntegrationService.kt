package com.universalmedialibrary.services.integration.jellyfin

import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class JellyfinIntegrationService @Inject constructor() {
    fun createApi(baseUrl: String): JellyfinApi {
        val client = OkHttpClient.Builder().build()
        return Retrofit.Builder()
            .baseUrl(if (baseUrl.endsWith("/")) baseUrl else "$baseUrl/")
            .client(client)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(JellyfinApi::class.java)
    }
}
