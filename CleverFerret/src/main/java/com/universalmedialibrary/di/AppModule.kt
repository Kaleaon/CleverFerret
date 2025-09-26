package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.CleverFerretDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.contentcreation.FanfictionToEpubConverter
import com.universalmedialibrary.services.contentcreation.NewsToEpubConverter
import com.universalmedialibrary.services.contentcreation.StoryUpdateManager
import com.universalmedialibrary.services.media.MediaScanningService
import com.universalmedialibrary.services.media.MetadataExtractionService
import com.universalmedialibrary.services.media.UniversalMediaPlayerService
import com.universalmedialibrary.services.media.UniversalReaderService
import com.universalmedialibrary.services.epub.EpubReaderService
import com.universalmedialibrary.data.repository.ReaderSettingsRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Main Hilt module for dependency injection
 * Provides database and service dependencies for the Universal Media Library
 */
@Module
@InstallIn(SingletonComponent::class)
object AppModule {
    
    @Provides
    @Singleton
    fun provideCleverFerretDatabase(
        @ApplicationContext context: Context
    ): CleverFerretDatabase {
        return Room.databaseBuilder(
            context.applicationContext,
            CleverFerretDatabase::class.java,
            CleverFerretDatabase.DATABASE_NAME
        )
        // TODO: Add proper migration objects below to handle schema changes safely
        // .addMigrations(MIGRATION_1_2, MIGRATION_2_3, ...) // Example usage
        .build()
    }
    
    // Legacy DAOs for existing content creation functionality
    @Provides
    fun provideDownloadedStoryDao(database: CleverFerretDatabase): DownloadedStoryDao {
        return database.downloadedStoryDao()
    }
    
    @Provides
    fun provideStoryUpdateDao(database: CleverFerretDatabase): StoryUpdateDao {
        return database.storyUpdateDao()
    }
    
    // Universal Media Library DAOs
    @Provides
    fun provideLibraryDao(database: CleverFerretDatabase): LibraryDao {
        return database.libraryDao()
    }
    
    @Provides
    fun provideMediaItemDao(database: CleverFerretDatabase): MediaItemDao {
        return database.mediaItemDao()
    }
    
    @Provides
    fun provideMetadataDao(database: CleverFerretDatabase): MetadataDao {
        return database.metadataDao()
    }
    
    @Provides
    fun provideAPIKeyDao(database: CleverFerretDatabase): APIKeyDao {
        return database.apiKeyDao()
    }
    
    @Provides
    fun provideBookmarkDao(database: CleverFerretDatabase): BookmarkDao {
        return database.bookmarkDao()
    }
    
    @Provides 
    fun provideReaderSettingsDao(database: CleverFerretDatabase): ReaderSettingsDao {
        return database.readerSettingsDao()
    }
    
    // Repositories
    @Provides
    @Singleton
    fun provideLibraryRepository(libraryDao: LibraryDao): LibraryRepository {
        return LibraryRepository(libraryDao)
    }
    
    @Provides
    @Singleton
    fun provideMediaRepository(
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): MediaRepository {
        return MediaRepository(mediaItemDao, metadataDao)
    }
    
    // Universal Media Services
    @Provides
    @Singleton
    fun provideMediaScanningService(
        @ApplicationContext context: Context,
        libraryRepository: LibraryRepository,
        mediaRepository: MediaRepository
    ): MediaScanningService {
        return MediaScanningService(context, libraryRepository, mediaRepository)
    }
    
    @Provides
    @Singleton
    fun provideMetadataExtractionService(
        @ApplicationContext context: Context,
        mediaRepository: MediaRepository
    ): MetadataExtractionService {
        return MetadataExtractionService(context, mediaRepository)
    }
    
    @Provides
    @Singleton
    fun provideUniversalMediaPlayerService(
        @ApplicationContext context: Context
    ): UniversalMediaPlayerService {
        return UniversalMediaPlayerService(context)
    }
    
    @Provides
    @Singleton
    fun provideUniversalReaderService(
        @ApplicationContext context: Context,
        mediaRepository: MediaRepository,
        epubReaderService: EpubReaderService
    ): UniversalReaderService {
        return UniversalReaderService(context, mediaRepository, epubReaderService)
    }
    
    @Provides
    @Singleton
    fun provideEpubReaderService(
        @ApplicationContext context: Context
    ): EpubReaderService {
        return EpubReaderService(context)
    }
    
    @Provides
    @Singleton
    fun provideReaderSettingsRepository(
        readerSettingsDao: ReaderSettingsDao
    ): ReaderSettingsRepository {
        return ReaderSettingsRepository(readerSettingsDao)
    }
    
    // Legacy services for content creation
    @Provides
    @Singleton
    fun provideStoryUpdateManager(
        @ApplicationContext context: Context,
        database: CleverFerretDatabase
    ): StoryUpdateManager {
        return StoryUpdateManager(context, database)
    }
    
    @Provides
    @Singleton
    fun provideNewsToEpubConverter(
        @ApplicationContext context: Context
    ): NewsToEpubConverter {
        return NewsToEpubConverter(context)
    }
}