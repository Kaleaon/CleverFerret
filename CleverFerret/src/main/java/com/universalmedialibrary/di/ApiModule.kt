package com.universalmedialibrary.di

import com.universalmedialibrary.services.integration.api.*
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import okhttp3.OkHttpClient
import javax.inject.Singleton

/**
 * Dependency injection module for API services
 */
@Module
@InstallIn(SingletonComponent::class)
object ApiModule {

    @Provides
    @Singleton
    fun provideApiManager(okHttpClient: OkHttpClient): ApiManager {
        return ApiManager(okHttpClient)
    }

    @Provides
    @Singleton
    fun provideLibrivoxApi(apiManager: ApiManager): LibrivoxApi {
        return apiManager.createLibrivoxApi()
    }

    @Provides
    @Singleton
    fun provideApplePodcastsApi(apiManager: ApiManager): ApplePodcastsApi {
        return apiManager.createApplePodcastsApi()
    }

    @Provides
    @Singleton
    fun provideTmdbApi(apiManager: ApiManager): TmdbApi {
        return apiManager.createTmdbApi()
    }

    @Provides
    @Singleton
    fun provideOpenLibraryApi(apiManager: ApiManager): OpenLibraryApi {
        return apiManager.createOpenLibraryApi()
    }
}