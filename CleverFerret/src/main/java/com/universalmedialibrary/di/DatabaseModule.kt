package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
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
        return Room.databaseBuilder(
            context,
            AppDatabase::class.java,
            AppDatabase.DATABASE_NAME
        )
         .fallbackToDestructiveMigration() // Temporary fix for development
         .build()
    }

    @Provides
    fun provideLibraryDao(database: AppDatabase): LibraryDao {
        return database.libraryDao()
    }

    @Provides
    fun provideMediaItemDao(database: AppDatabase): MediaItemDao {
        return database.mediaItemDao()
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
    fun provideAPIKeyDao(database: AppDatabase): APIKeyDao {
        return database.apiKeyDao()
    }
}
