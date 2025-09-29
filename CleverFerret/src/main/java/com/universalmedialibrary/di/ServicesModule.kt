package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.services.StorageAccessService
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object ServicesModule {

    @Provides
    @Singleton
    fun provideStorageAccessService(
        libraryDao: LibraryDao,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): StorageAccessService = StorageAccessService(libraryDao, mediaItemDao, metadataDao)

    @Provides
    @Singleton
    fun provideAPIKeyRepository(apiKeyDao: APIKeyDao): APIKeyRepository = APIKeyRepository(apiKeyDao)

    // Additional services can be added here as needed
}