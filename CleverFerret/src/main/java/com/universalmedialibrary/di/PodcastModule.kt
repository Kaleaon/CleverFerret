package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.PodcastChapterDao
import com.universalmedialibrary.data.local.dao.PodcastDao
import com.universalmedialibrary.data.local.dao.PodcastEpisodeDao
import com.universalmedialibrary.data.local.dao.PodcastSubscriptionDao
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
import com.universalmedialibrary.services.podcast.PodcastDownloadTelemetry
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.services.podcast.LogcatPodcastDownloadTelemetry
import com.universalmedialibrary.utils.FileNameSanitizer
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module for podcast-related dependencies
 * 
 * Provides:
 * - Podcast DAOs (singleton)
 * - PodcastDownloadManager (singleton)
 * 
 * Note: PodcastRepository and PodcastService use @Inject constructors
 * instead of @Provides to avoid circular dependency issues.
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

    /**
     * Provides the PodcastChapterDao instance obtained from the application database.
     *
     * @param database The application database used to obtain DAO instances.
     * @return The PodcastChapterDao backed by the provided AppDatabase.
     */
    @Provides
    @Singleton
    fun providePodcastChapterDao(database: AppDatabase): PodcastChapterDao {
        return database.podcastChapterDao()
    }

    /**
     * Creates a PodcastDownloadManager for managing podcast episode downloads.
     *
     * @param context The application Context used for file and system access.
     * @param episodeDao DAO for accessing and updating podcast episode data needed by the download manager.
     * @param fileNameSanitizer Utility for producing safe on-disk file names for downloaded episodes.
     * @return A configured PodcastDownloadManager instance.
     */
    @Provides
    @Singleton
    fun providePodcastDownloadManager(
        @ApplicationContext context: Context,
        episodeDao: PodcastEpisodeDao,
        fileNameSanitizer: FileNameSanitizer,
        telemetry: PodcastDownloadTelemetry
    ): PodcastDownloadManager {
        return PodcastDownloadManager(context, episodeDao, fileNameSanitizer, telemetry)
    }

    @Provides
    @Singleton
    fun providePodcastDownloadTelemetry(): PodcastDownloadTelemetry {
        return LogcatPodcastDownloadTelemetry()
    }
}
