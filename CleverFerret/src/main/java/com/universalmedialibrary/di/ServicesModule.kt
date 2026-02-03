package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.data.repository.StoryRepository
import com.universalmedialibrary.services.StorageAccessService
import com.universalmedialibrary.services.audio.MultiRoomAudioService
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.utils.FileNameSanitizer
import com.universalmedialibrary.services.contentcreation.FanfictionToEpubConverter
import com.universalmedialibrary.services.contentcreation.StoryUpdateManager
import com.universalmedialibrary.services.webfiction.RedditFanficDownloader
import com.universalmedialibrary.services.reading.AnnotationExportService
import com.universalmedialibrary.services.reading.BookSourceService
import com.universalmedialibrary.services.reading.ReadingAnalyticsService
import com.universalmedialibrary.services.ai.AIServiceManager
import com.universalmedialibrary.utils.FilebotDataService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module providing service-layer dependencies.
 * 
 * This module provides singleton instances of various services including
 * storage access, API key management, fanfiction conversion, and web fiction downloading.
 */
@Module
@InstallIn(SingletonComponent::class)
object ServicesModule {

    /**
     * Provides a singleton StorageAccessService for managing media library storage.
     * 
     * @param libraryDao DAO for accessing library data
     * @param mediaItemDao DAO for accessing media items
     * @param metadataDao DAO for accessing metadata
     * @return Singleton StorageAccessService instance
     */
    @Provides
    @Singleton
    fun provideStorageAccessService(
        libraryDao: LibraryDao,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao,
        fileNameSanitizer: FileNameSanitizer,
        filebotDataService: FilebotDataService
    ): StorageAccessService = StorageAccessService(
        libraryDao,
        mediaItemDao,
        metadataDao,
        fileNameSanitizer,
        filebotDataService
    )

    /**
     * Provides a singleton APIKeyRepository for managing third-party API keys.
     * 
     * @param apiKeyDao DAO for accessing API key data
     * @return Singleton APIKeyRepository instance
     */
    @Provides
    @Singleton
    fun provideAPIKeyRepository(apiKeyDao: APIKeyDao): APIKeyRepository = APIKeyRepository(apiKeyDao)

    /**
     * Creates a singleton StoryUpdateManager using the provided StoryRepository.
     *
     * @param storyRepository Repository used by the manager to fetch, update, and persist stories
     * @return The configured StoryUpdateManager instance
     */
    @Provides
    @Singleton
    fun provideStoryUpdateManager(
        storyRepository: StoryRepository
    ): StoryUpdateManager = StoryUpdateManager(storyRepository)

    /**
     * Provides a singleton FanfictionToEpubConverter configured with the application context and a StoryUpdateManager.
     *
     * @param context The application Context used for file and resource access
     * @param updateManager Manager responsible for fetching or updating story content used during conversion
     * @return A FanfictionToEpubConverter instance that converts fanfiction stories into EPUB format
     */
    @Provides
    @Singleton
    fun provideFanfictionToEpubConverter(
        @ApplicationContext context: Context,
        updateManager: StoryUpdateManager
    ): FanfictionToEpubConverter = FanfictionToEpubConverter(context, updateManager)

    /**
     * Provides a singleton RedditFanficDownloader for downloading fanfiction from Reddit.
     * 
     * @return Singleton RedditFanficDownloader instance
     */
    @Provides
    @Singleton
    fun provideRedditFanficDownloader(): RedditFanficDownloader = RedditFanficDownloader()

    @Provides
    @Singleton
    fun provideBookSourceService(
        bookSourceDao: BookSourceDao
    ): BookSourceService = BookSourceService(bookSourceDao)

    @Provides
    @Singleton
    fun provideReadingAnalyticsService(
        readingAnalyticsDao: ReadingAnalyticsDao,
        aiServiceManager: AIServiceManager
    ): ReadingAnalyticsService = ReadingAnalyticsService(readingAnalyticsDao, aiServiceManager)

    @Provides
    @Singleton
    fun provideAnnotationExportService(
        enhancedAnnotationDao: EnhancedAnnotationDao
    ): AnnotationExportService = AnnotationExportService(enhancedAnnotationDao)

    @Provides
    @Singleton
    fun provideMultiRoomAudioService(
        audioSyncServerDao: AudioSyncServerDao,
        audioSyncClientDao: AudioSyncClientDao,
        audioSyncGroupDao: AudioSyncGroupDao,
        audioStreamDao: AudioStreamDao,
        syncStatisticsDao: SyncStatisticsDao
    ): MultiRoomAudioService = MultiRoomAudioService(
        audioSyncServerDao,
        audioSyncClientDao,
        audioSyncGroupDao,
        audioStreamDao,
        syncStatisticsDao
    )
}
