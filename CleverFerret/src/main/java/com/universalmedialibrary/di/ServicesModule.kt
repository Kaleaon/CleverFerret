package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.tts.CoquiTTSService
import com.universalmedialibrary.services.metadata.MetadataApiService
import com.universalmedialibrary.services.metadata.ComprehensiveMetadataService
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
    fun provideAppDatabase(@ApplicationContext context: Context): AppDatabase {
        return Room.databaseBuilder(
            context,
            AppDatabase::class.java,
            AppDatabase.DATABASE_NAME
        )
        .addMigrations(
            AppDatabase.MIGRATION_1_2,
            AppDatabase.MIGRATION_2_3,
            AppDatabase.MIGRATION_3_4
        )
        .build()
    }

    @Provides
    @Singleton
    fun provideAPIKeyDao(database: AppDatabase): APIKeyDao {
        return database.apiKeyDao()
    }

    @Provides
    @Singleton
    fun provideAPIKeyRepository(apiKeyDao: APIKeyDao): APIKeyRepository {
        return APIKeyRepository(apiKeyDao)
    }

    @Provides
    @Singleton
    fun provideCoquiTTSService(@ApplicationContext context: Context): CoquiTTSService {
        return CoquiTTSService(context)
    }

    @Provides
    @Singleton
    fun provideMetadataApiService(apiKeyRepository: APIKeyRepository): MetadataApiService {
        return MetadataApiService(apiKeyRepository)
    }

    @Provides
    @Singleton
    fun provideComprehensiveMetadataService(apiKeyRepository: APIKeyRepository): ComprehensiveMetadataService {
        return ComprehensiveMetadataService(apiKeyRepository)
    }

    @Provides
    @Singleton
    fun provideWebFictionService(): com.universalmedialibrary.services.webfiction.WebFictionService {
        return com.universalmedialibrary.services.webfiction.WebFictionService()
    }

    @Provides
    @Singleton
    fun providePodcastService(@ApplicationContext context: Context): com.universalmedialibrary.services.podcast.PodcastService {
        return com.universalmedialibrary.services.podcast.PodcastService(context)
    }
}