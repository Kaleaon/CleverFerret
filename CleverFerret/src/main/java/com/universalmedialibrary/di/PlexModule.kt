package com.universalmedialibrary.di

import android.content.Context
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.universalmedialibrary.services.plex.PlexAuthApi
import com.universalmedialibrary.services.plex.PlexAuthService
import com.universalmedialibrary.services.plex.SecureTokenStorage
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit
import javax.inject.Named
import javax.inject.Singleton

/**
 * Hilt module for Plex integration dependencies
 */
@Module
@InstallIn(SingletonComponent::class)
object PlexModule {

    @Provides
    @Singleton
    fun provideSecureTokenStorage(
        @ApplicationContext context: Context
    ): SecureTokenStorage {
        return SecureTokenStorage(context)
    }

    @Provides
    @Singleton
    @Named("plexGson")
    fun providePlexGson(): Gson {
        return GsonBuilder()
            .setLenient()
            .create()
    }

    @Provides
    @Singleton
    @Named("plexOkHttp")
    fun providePlexOkHttpClient(
        @ApplicationContext context: Context
    ): OkHttpClient {
        // Generate or retrieve persistent client identifier
        val prefs = context.getSharedPreferences("plex_client", Context.MODE_PRIVATE)
        val clientId = prefs.getString("client_id", null) ?: run {
            val newId = java.util.UUID.randomUUID().toString()
            prefs.edit().putString("client_id", newId).apply()
            newId
        }

        return OkHttpClient.Builder()
            .connectTimeout(30, TimeUnit.SECONDS)
            .readTimeout(30, TimeUnit.SECONDS)
            .writeTimeout(30, TimeUnit.SECONDS)
            .addInterceptor { chain ->
                val original = chain.request()
                val request = original.newBuilder()
                    .addHeader("Accept", "application/json")
                    .addHeader("X-Plex-Product", "CleverFerret")
                    .addHeader("X-Plex-Version", "1.0.0")
                    .addHeader("X-Plex-Platform", "Android")
                    .addHeader("X-Plex-Device", "Android")
                    .addHeader("X-Plex-Device-Name", "CleverFerret Media Library")
                    .addHeader("X-Plex-Client-Identifier", clientId)
                    .build()
                chain.proceed(request)
            }
            .build()
    }

    @Provides
    @Singleton
    fun providePlexAuthApi(
        @Named("plexOkHttp") client: OkHttpClient,
        @Named("plexGson") gson: Gson
    ): PlexAuthApi {
        return Retrofit.Builder()
            .baseUrl("https://plex.tv/")
            .client(client)
            .addConverterFactory(GsonConverterFactory.create(gson))
            .build()
            .create(PlexAuthApi::class.java)
    }

    @Provides
    @Singleton
    fun providePlexAuthService(
        @ApplicationContext context: Context,
        tokenStorage: SecureTokenStorage,
        authApi: PlexAuthApi
    ): PlexAuthService {
        return PlexAuthService(context, tokenStorage, authApi)
    }
}
