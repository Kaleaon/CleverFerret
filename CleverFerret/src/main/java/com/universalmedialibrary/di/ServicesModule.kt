package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.services.integration.*
import com.universalmedialibrary.services.integration.plex.PlexIntegrationService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Services Module for Dependency Injection
 * 
 * Provides all integration services including Plex, Calibre, Cloud Storage,
 * Book Services, and the central IntegrationManager
 */
@Module
@InstallIn(SingletonComponent::class)
object ServicesModule {
    
    @Provides
    @Singleton
    fun providePlexIntegrationService(
        @ApplicationContext context: Context
    ): PlexIntegrationService {
        return PlexIntegrationService(context)
    }
    
    @Provides
    @Singleton
    fun provideCalibreIntegrationService(
        @ApplicationContext context: Context
    ): CalibreIntegrationService {
        return CalibreIntegrationService(context)
    }
    
    @Provides
    @Singleton
    fun provideCloudStorageService(
        @ApplicationContext context: Context
    ): CloudStorageService {
        return CloudStorageService(context)
    }
    
    @Provides
    @Singleton
    fun provideBookServicesIntegration(
        @ApplicationContext context: Context
    ): BookServicesIntegration {
        return BookServicesIntegration(context)
    }
    
    @Provides
    @Singleton
    fun provideIntegrationManager(
        @ApplicationContext context: Context,
        plexService: PlexIntegrationService,
        calibreService: CalibreIntegrationService,
        cloudStorageService: CloudStorageService,
        bookServicesIntegration: BookServicesIntegration
    ): IntegrationManager {
        return IntegrationManager(
            context,
            plexService,
            calibreService,
            cloudStorageService,
            bookServicesIntegration
        )
    }
}