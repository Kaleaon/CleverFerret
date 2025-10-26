package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.services.integration.jellyfin.JellyfinClient
import com.universalmedialibrary.services.network.NetworkStorageService
import com.universalmedialibrary.services.network.WebDavClient
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import okhttp3.OkHttpClient
import javax.inject.Singleton

/**
 * NetworkModule - Dependency injection for network-related services
 * 
 * Provides network clients and services for:
 * - Jellyfin media server integration
 * - WebDAV network storage access
 * - General network storage operations
 * 
 * All services use the shared [OkHttpClient] from [AppModule] for
 * consistent timeout configuration and connection pooling.
 */
@Module
@InstallIn(SingletonComponent::class)
object NetworkModule {

    @Provides
    @Singleton
    fun provideJellyfinClient(
        @ApplicationContext context: Context,
        okHttpClient: OkHttpClient
    ): JellyfinClient {
        return JellyfinClient(context, okHttpClient)
    }

    @Provides
    @Singleton
    fun provideNetworkStorageService(@ApplicationContext context: Context): NetworkStorageService {
        return NetworkStorageService(context)
    }

    @Provides
    @Singleton
    fun provideWebDavClient(
        @ApplicationContext context: Context,
        okHttpClient: OkHttpClient
    ): WebDavClient {
        return WebDavClient(context, okHttpClient)
    }
}