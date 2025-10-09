package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.services.StorageAccessService
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.data.repository.StoryRepository
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.services.contentcreation.FanfictionToEpubConverter
import com.universalmedialibrary.services.contentcreation.StoryUpdateManager
import com.universalmedialibrary.services.webfiction.RedditFanficDownloader
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
    fun provideStorageAccessService(
        libraryDao: LibraryDao,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): StorageAccessService = StorageAccessService(libraryDao, mediaItemDao, metadataDao)

    @Provides
    @Singleton
    fun provideAPIKeyRepository(apiKeyDao: APIKeyDao): APIKeyRepository = APIKeyRepository(apiKeyDao)

    /**
     * Creates a singleton StoryUpdateManager using the provided StoryRepository.
     *
     * @param storyRepository Repository used by the manager to fetch, update, and persist stories.
     * @return The configured `StoryUpdateManager` instance.
     */
    @Provides
    @Singleton
    fun provideStoryUpdateManager(
        storyRepository: StoryRepository
    ): StoryUpdateManager = StoryUpdateManager(storyRepository)

    // Note: PodcastService uses @Inject constructor instead of @Provides
    /**
     * Provides a singleton FanfictionToEpubConverter configured with the application context and a StoryUpdateManager.
     *
     * @param context The application Context used for file and resource access.
     * @param updateManager Manager responsible for fetching or updating story content used during conversion.
     * @return A FanfictionToEpubConverter instance that converts fanfiction stories into EPUB format.
     */

    @Provides
    @Singleton
    fun provideFanfictionToEpubConverter(
        @ApplicationContext context: Context,
        updateManager: StoryUpdateManager
    ): FanfictionToEpubConverter = FanfictionToEpubConverter(context, updateManager)

    @Provides
    @Singleton
    fun provideRedditFanficDownloader(): RedditFanficDownloader = RedditFanficDownloader()
}