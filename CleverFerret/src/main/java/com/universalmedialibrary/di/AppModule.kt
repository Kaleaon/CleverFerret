package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.CleverFerretDatabase
import com.universalmedialibrary.data.local.dao.DownloadedStoryDao
import com.universalmedialibrary.data.local.dao.StoryUpdateDao
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
            "cleverferret_database"
        ).build()
    }
    
    @Provides
    fun provideDownloadedStoryDao(database: CleverFerretDatabase): DownloadedStoryDao {
        return database.downloadedStoryDao()
    }
    
    @Provides
    fun provideStoryUpdateDao(database: CleverFerretDatabase): StoryUpdateDao {
        return database.storyUpdateDao()
    }
    
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