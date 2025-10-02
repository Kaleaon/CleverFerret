package com.universalmedialibrary.services.integration.emby

import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class EmbyIntegrationService @Inject constructor() {
    fun createApi(baseUrl: String): EmbyApi {
        val client = OkHttpClient.Builder().build()
        return Retrofit.Builder()
            .baseUrl(baseUrl)
            .client(client)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(EmbyApi::class.java)
    }
}

