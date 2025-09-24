package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.CleverFerretDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.services.contentcreation.FanfictionToEpubConverter
import com.universalmedialibrary.services.contentcreation.NewsToEpubConverter
import com.universalmedialibrary.services.contentcreation.StoryUpdateManager
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
        .fallbackToDestructiveMigration() // For development - remove in production
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