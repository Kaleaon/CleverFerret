package com.universalmedialibrary.di

import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import com.universalmedialibrary.data.remote.freesound.FreesoundService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
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
    private const val API_KEY = "k6k6jyYgzt3EmsmPjNmTFuEt5Wdd59ML13s8MFUV"

    @Provides
    @Singleton
    @Named("FreesoundOkHttp")
    fun provideFreesoundOkHttpClient(okHttpClient: OkHttpClient): OkHttpClient {
        return okHttpClient.newBuilder()
            .addInterceptor { chain ->
                val request = chain.request().newBuilder()
                    .addHeader("Authorization", "Token $API_KEY")
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
