package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.*
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

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

}
