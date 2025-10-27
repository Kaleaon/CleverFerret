package com.universalmedialibrary.services.integration.api

import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import kotlinx.serialization.json.Json
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Centralized API Manager for all external service integrations
 * Provides configured Retrofit instances for various media APIs
 */
@Singleton
class ApiManager @Inject constructor(
    private val okHttpClient: OkHttpClient
) {
    private val json = Json {
        ignoreUnknownKeys = true
        isLenient = true
        coerceInputValues = true
    }

    /**
     * Creates a Retrofit instance for Librivox audiobook API
     */
    fun createLibrivoxApi(): LibrivoxApi {
        return Retrofit.Builder()
            .baseUrl("https://librivox.org/api/feed/")
            .client(okHttpClient)
            .addConverterFactory(json.asConverterFactory("application/json".toMediaType()))
            .build()
            .create(LibrivoxApi::class.java)
    }

    /**
     * Creates a Retrofit instance for Apple Podcasts (iTunes) API
     */
    fun createApplePodcastsApi(): ApplePodcastsApi {
        return Retrofit.Builder()
            .baseUrl("https://itunes.apple.com/")
            .client(okHttpClient)
            .addConverterFactory(json.asConverterFactory("application/json".toMediaType()))
            .build()
            .create(ApplePodcastsApi::class.java)
    }

    /**
     * Creates a Retrofit instance for TMDb movie/TV API
     */
    fun createTmdbApi(): TmdbApi {
        return Retrofit.Builder()
            .baseUrl("https://api.themoviedb.org/3/")
            .client(okHttpClient)
            .addConverterFactory(json.asConverterFactory("application/json".toMediaType()))
            .build()
            .create(TmdbApi::class.java)
    }

    /**
     * Creates a Retrofit instance for Open Library API
     */
    fun createOpenLibraryApi(): OpenLibraryApi {
        return Retrofit.Builder()
            .baseUrl("https://openlibrary.org/")
            .client(okHttpClient)
            .addConverterFactory(json.asConverterFactory("application/json".toMediaType()))
            .build()
            .create(OpenLibraryApi::class.java)
    }

    /**
     * Creates a Retrofit instance for Plex API with custom base URL
     */
    fun createPlexApi(baseUrl: String, token: String): PlexApiService {
        val plexClient = okHttpClient.newBuilder()
            .addInterceptor { chain ->
                val request = chain.request().newBuilder()
                    .addHeader("X-Plex-Token", token)
                    .addHeader("Accept", "application/json")
                    .build()
                chain.proceed(request)
            }
            .build()

        return Retrofit.Builder()
            .baseUrl(baseUrl)
            .client(plexClient)
            .addConverterFactory(json.asConverterFactory("application/json".toMediaType()))
            .build()
            .create(PlexApiService::class.java)
    }

    /**
     * Creates a Retrofit instance for Emby API with custom base URL
     */
    fun createEmbyApi(baseUrl: String, apiKey: String): EmbyApiService {
        val embyClient = okHttpClient.newBuilder()
            .addInterceptor { chain ->
                val request = chain.request().newBuilder()
                    .addHeader("X-Emby-Token", apiKey)
                    .addHeader("Accept", "application/json")
                    .build()
                chain.proceed(request)
            }
            .build()

        return Retrofit.Builder()
            .baseUrl(baseUrl)
            .client(embyClient)
            .addConverterFactory(json.asConverterFactory("application/json".toMediaType()))
            .build()
            .create(EmbyApiService::class.java)
    }

    /**
     * Creates a Retrofit instance for Fanart.tv API
     */
    fun createFanartTvApi(): FanartTvApi {
        return Retrofit.Builder()
            .baseUrl("https://webservice.fanart.tv/v3/")
            .client(okHttpClient)
            .addConverterFactory(json.asConverterFactory("application/json".toMediaType()))
            .build()
            .create(FanartTvApi::class.java)
    }
}