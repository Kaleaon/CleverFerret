package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.PodcastChapterDao
import com.universalmedialibrary.data.local.dao.PodcastDao
import com.universalmedialibrary.data.local.dao.PodcastEpisodeDao
import com.universalmedialibrary.data.local.dao.PodcastSubscriptionDao
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
import com.universalmedialibrary.services.podcast.PodcastService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module for podcast-related dependencies
 * Provides DAOs and Repository for dependency injection
 */
@Module
@InstallIn(SingletonComponent::class)
object PodcastModule {

    @Provides
    @Singleton
    fun providePodcastDao(database: AppDatabase): PodcastDao {
        return database.podcastDao()
    }

    @Provides
    @Singleton
    fun providePodcastEpisodeDao(database: AppDatabase): PodcastEpisodeDao {
        return database.podcastEpisodeDao()
    }

    @Provides
    @Singleton
    fun providePodcastSubscriptionDao(database: AppDatabase): PodcastSubscriptionDao {
        return database.podcastSubscriptionDao()
    }

    @Provides
    @Singleton
    fun providePodcastChapterDao(database: AppDatabase): PodcastChapterDao {
        return database.podcastChapterDao()
    }

    // PodcastRepository is provided via @Inject constructor to avoid circular dependency with PodcastService

    @Provides
    @Singleton
    fun providePodcastDownloadManager(
        @ApplicationContext context: Context,
        episodeDao: PodcastEpisodeDao
    ): PodcastDownloadManager {
        return PodcastDownloadManager(context, episodeDao)
    }
}
