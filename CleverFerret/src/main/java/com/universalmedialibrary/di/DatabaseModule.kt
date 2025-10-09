package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.repository.MetadataFetchRepository
import com.universalmedialibrary.data.repository.SearchRepository
import com.universalmedialibrary.services.metadata.RealMetadataService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module providing database-related dependencies
 * 
 * Provides:
 * - AppDatabase instance (singleton)
 * - All DAO implementations from the database
 */
@Module
@InstallIn(SingletonComponent::class)
object DatabaseModule {

    @Provides
    @Singleton
    fun provideAppDatabase(@ApplicationContext context: Context): AppDatabase {
        return AppDatabase.getDatabase(context)
    }

    // Core DAOs
    @Provides
    fun provideLibraryDao(database: AppDatabase): LibraryDao {
        return database.libraryDao()
    }

    @Provides
    fun provideAPIKeyDao(appDatabase: AppDatabase): APIKeyDao {
        return appDatabase.apiKeyDao()
    }

    @Provides
    fun provideMediaItemDao(appDatabase: AppDatabase): MediaItemDao {
        return appDatabase.mediaItemDao()
    }

    @Provides
    fun provideMetadataDao(database: AppDatabase): MetadataDao {
        return database.metadataDao()
    }

    @Provides
    fun provideBookmarkDao(database: AppDatabase): BookmarkDao {
        return database.bookmarkDao()
    }

    @Provides
    fun provideReadingProgressDao(database: AppDatabase): ReadingProgressDao {
        return database.readingProgressDao()
    }

    // Plex DAOs
    @Provides
    fun providePlexServerDao(database: AppDatabase): PlexServerDao {
        return database.plexServerDao()
    }

    @Provides
    fun providePlexMediaItemDao(database: AppDatabase): PlexMediaItemDao {
        return database.plexMediaItemDao()
    }

    @Provides
    fun providePlexSyncDao(database: AppDatabase): PlexSyncDao {
        return database.plexSyncDao()
    }

    // Reader enhancement DAOs
    @Provides
    fun provideAnnotationDao(database: AppDatabase): AnnotationDao {
        return database.annotationDao()
    }

    @Provides
    fun provideSearchIndexDao(database: AppDatabase): SearchIndexDao {
        return database.searchIndexDao()
    }

    @Provides
    fun provideReadingStatisticsDao(database: AppDatabase): ReadingStatisticsDao {
        return database.readingStatisticsDao()
    }

    @Provides
    fun provideReaderSettingsDao(database: AppDatabase): ReaderSettingsDao {
        return database.readerSettingsDao()
    }

    /**
     * Provides the TagDao instance from the application database.
     *
     * @return The TagDao used for tag-related persistence operations.
     */
    @Provides
    fun provideTagDao(database: AppDatabase): TagDao {
        return database.tagDao()
    }

    /**
     * Exposes the SharedLinkDao from the provided AppDatabase for injection.
     *
     * @return The SharedLinkDao instance backed by the given AppDatabase.
     */
    @Provides
    fun provideSharedLinkDao(database: AppDatabase): SharedLinkDao {
        return database.sharedLinkDao()
    }

    /**
     * Exposes the UnifiedCollectionDao instance from the provided AppDatabase for dependency injection.
     *
     * @param database The app database to obtain the DAO from.
     * @return The UnifiedCollectionDao instance.
     */
    @Provides
    fun provideUnifiedCollectionDao(database: AppDatabase): UnifiedCollectionDao {
        return database.unifiedCollectionDao()
    }

    /**
     * Obtains the MaintenanceChangeDao instance from the provided AppDatabase for dependency injection.
     *
     * @param database AppDatabase instance to retrieve the DAO from.
     * @return The MaintenanceChangeDao backed by the given database.
     */
    @Provides
    fun provideMaintenanceChangeDao(database: AppDatabase): MaintenanceChangeDao {
        return database.maintenanceChangeDao()
    }

    // Metadata Fetch Repository
    @Provides
    @Singleton
    fun provideMetadataFetchRepository(
        realMetadataService: RealMetadataService,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): MetadataFetchRepository {
        return MetadataFetchRepository(realMetadataService, mediaItemDao, metadataDao)
    }

    // Search Repository
    @Provides
    @Singleton
    fun provideSearchRepository(
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): SearchRepository {
        return SearchRepository(mediaItemDao, metadataDao)
    }

}