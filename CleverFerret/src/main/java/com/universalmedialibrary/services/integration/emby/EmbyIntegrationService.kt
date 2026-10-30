package com.universalmedialibrary.services.integration.emby

import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class EmbyIntegrationService @Inject constructor() {
    fun createApi(baseUrl: String, interceptor: okhttp3.Interceptor? = null): EmbyApi {
        val clientBuilder = OkHttpClient.Builder()
        if (interceptor != null) {
            clientBuilder.addInterceptor(interceptor)
        }
        val client = clientBuilder.build()
        return Retrofit.Builder()
            .baseUrl(if (baseUrl.endsWith("/")) baseUrl else "$baseUrl/")
            .client(client)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(EmbyApi::class.java)
    }
}
