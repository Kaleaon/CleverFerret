package com.universalmedialibrary.di

import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import com.universalmedialibrary.data.remote.freesound.FreesoundService
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.runBlocking
import kotlinx.serialization.json.Json
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import javax.inject.Named
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object FreesoundModule {

    private const val BASE_URL = "https://freesound.org/apiv2/"

    @Provides
    @Singleton
    @Named("FreesoundOkHttp")
    fun provideFreesoundOkHttpClient(
        okHttpClient: OkHttpClient,
        apiKeyRepository: APIKeyRepository
    ): OkHttpClient {
        return okHttpClient.newBuilder()
            .addInterceptor { chain ->
                // Get API key from repository (user-configurable)
                val apiKey = runBlocking { apiKeyRepository.getAPIKeyValue("freesound") } ?: ""
                val request = chain.request().newBuilder()
                    .apply {
                        if (apiKey.isNotBlank()) {
                            addHeader("Authorization", "Token $apiKey")
                        }
                    }
                    .build()
                chain.proceed(request)
            }
            .build()
    }

    @Provides
    @Singleton
    fun provideFreesoundService(
        @Named("FreesoundOkHttp") okHttpClient: OkHttpClient,
        json: Json
    ): FreesoundService {
        val contentType = "application/json".toMediaType()
        return Retrofit.Builder()
            .baseUrl(BASE_URL)
            .client(okHttpClient)
            .addConverterFactory(json.asConverterFactory(contentType))
            .build()
            .create(FreesoundService::class.java)
    }
}
